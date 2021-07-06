Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615FF3BDC92
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CD06E05F;
	Tue,  6 Jul 2021 17:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3596E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:59:37 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id s4so2380582qkm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QafN6h6Co6NuKaJg6KsXY/qvYmait2ZxGzl1LH+hKGc=;
 b=o+6yrnhyDXWJv8oLffV4OzrBks140sBzkKRa/BHDPAgco6gkcsk/KfM0urmbG1ZpZp
 aNfP9t5Y248cSGYMNP5udtisN7IexW8dI/evhDcabpX78aqPc3z4PUkjqOFT88k3q2UU
 VMDnrscsVmrIJXOn1Tl4GknyaQqnihC5TNeBzt7oxN9cnepeiC33KAZ1WQv24bEg5Ptl
 wh50zYlI3opLL0jj7l3ICvX3darwow+ATpP8HNytVg4jpuzFtVevfPbuvYAuE+UIH3oi
 0+6FwhgS8LlAzXLg8Hrg7kDb7r475k6OOP9fsruyXhd5J6BvIkWbmMJ01HjVqF1+s9dG
 KB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QafN6h6Co6NuKaJg6KsXY/qvYmait2ZxGzl1LH+hKGc=;
 b=dgd3dhUO1/rSqErYCuqpGgAAamdYe1a4vfh8/cad6b1frvPHohtz/4GkwbQV/oeP49
 RpSSHEzZ2fyGe7+H3x/sDNjXvACbD2e3lDUHzC19FIqI1XQ5dAPb+7rMDXXnh6Ir+/E/
 SHtA1RHKg7WBzGKb3zJE+JCfERYfR+7s++SDXQMTUV5e70UPolzfUXHOHG/FyaB8ZAXs
 C7rnYSQlU3XPGiDq6LIICTBM1F/fYiOmWb8TydroDjjBzDX5aO/Juh/rrDN0xmGwq0Aj
 KD+HfGyQsLaKunzgp/q8UWMpDU2mUfSAYCH3BcCIWMkoxTq1f13dbITnC7obtPgZZOC0
 FNYg==
X-Gm-Message-State: AOAM530LlqCKTl0nzktryKnxmkAzuHm1OACvWHY0PZkaI4FZl0+2ckA1
 8Avjw1qXK0NgltC77ClcJ+/4UQ==
X-Google-Smtp-Source: ABdhPJyVxfP24yiWMaxghSmvMQwbby4otQnbgBhcVo8qVKROchOHAE6ChpAWAzTpF2fYkJyDXgbw1w==
X-Received: by 2002:a37:c448:: with SMTP id h8mr10568428qkm.191.1625594376601; 
 Tue, 06 Jul 2021 10:59:36 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id 16sm5697170qty.15.2021.07.06.10.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 10:59:36 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1m0pM7-004W2s-6g; Tue, 06 Jul 2021 14:59:35 -0300
Date: Tue, 6 Jul 2021 14:59:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
Message-ID: <20210706175935.GS4604@ziepe.ca>
References: <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <20210706142357.GN4604@ziepe.ca>
 <CAKMK7uELNzwUe+hhVWRg=Pk5Wt_vOOX922H48Kd6dTyO2PeBbg@mail.gmail.com>
 <20210706152542.GP4604@ziepe.ca>
 <CAKMK7uH7Ar6+uAOU_Sj-mf89V9WCru+66CV5bO9h-WAAv7Mgdg@mail.gmail.com>
 <CAKMK7uGvO0h7iZ3vKGe8GouESkr79y1gP1JXbfV82sRiaT-d1A@mail.gmail.com>
 <20210706172828.GR4604@ziepe.ca> <20210706173137.GA7840@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706173137.GA7840@lst.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 07:31:37PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 06, 2021 at 02:28:28PM -0300, Jason Gunthorpe wrote:
> > > Also on your claim that drivers/gpu is a non-upstream disaster: I've
> > > also learned that that for drivers/rdma there's the upstream driver,
> > > and then there's the out-of-tree hackjob the vendor actually
> > > supports.
> > 
> > In the enterprise world everyone has their out of tree backport
> > drivers. It varies on the vendor how much deviation there is from the
> > upstream driver and what commercial support relationship the vendor
> > has with the enterprise distros.
> 
> I think he means the Mellanox OFED stack, which is a complete and utter
> mess and which gets force fed by Mellanox/Nvidia on unsuspecting
> customers.  I know many big HPC sites that ignore it, but a lot of
> enterprise customers are dumb enought to deploy it.

No, I don't think so. While MOFED is indeed a giant mess, the mlx5
upstream driver is not some token effort to generate good will and
Mellanox certainly does provide full commercial support for the mlx5
drivers shipped inside various enterprise distros.

MOFED also doesn't have a big functional divergance from RDMA
upstream, and it is not mandatory just to use the hardware.

I can not say the same about other company's RDMA driver
distributions, Daniel's description of "minimal effort to get
goodwill" would match others much better.

You are right that there are a lot of enterprise customers who deploy
the MOFED. I can't agree with their choices, but they are not forced
into using it anymore.

Jason
