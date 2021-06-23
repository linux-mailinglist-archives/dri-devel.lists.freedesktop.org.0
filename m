Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C034A3B20A8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 20:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025E36E972;
	Wed, 23 Jun 2021 18:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3628F6E972
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 18:50:47 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id o6so7845618qkh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A9I072mZJre1TS+IQKbZNgSu5AaMK7P2E0lmk7a57z4=;
 b=b5e3Vs0J8hbfUScY+Wtfo2QnoFw5zQRvSxFua4X+zv6sZmqniXxjtckK2oI0DJ0jKp
 +FpDq4XgR5FvYz5KhFDvESo6/vvn5bGvgGZWSgiYdS8/PfbLxpaqI3o9lhVUAZxmPK5T
 nDlzhXlXLqlvJVTPQVPebRcUOY8aDMfSl2n44EWIYFP7pJbCLgzg7CgH7naHE97q6TC2
 fZXUfMee0Dfy9rvfoVtazaR6R+Q7ESYAYIdPD2TcTnMWbmqWi3fqt48BxyEAqBINSR6Y
 /GKjFQQmTzpnkbtvp/1Ez+q16SM92SVKit9WzRj/wJHNz3K/lD3bYob3W0EWe1zfdvXM
 mlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A9I072mZJre1TS+IQKbZNgSu5AaMK7P2E0lmk7a57z4=;
 b=MipsAViBB1t88jcfsX8Ne6h5n+n8X1CUwv4P6VtbdsZZ9BLW46FS7nD7F88G1n3D9R
 dwQAclFLCCV2xilxGTly3FoutT+Ll8yOCMCt6xCE5N5CaevUVCgS57XFjZKkXtKgDeA1
 HxZvzWt3Rya+5k7T10DjomJIB2FvbAM5xQwwhJ1KBZTcsGbrWeUmAnwPVX3jEsFGjOnm
 xYL4T8R+KyDOEjGBM5ayr+n8hDC81pEevjDA6ykjApULlS7CUKfBknkKH1JF+Q94FPEC
 MtfjSL7fMncZ0uRTyiQP5KhC0pjMFS/cxjJnsoPVnvJpdiuHovPj63fvpnkRXBBlMxpU
 vy8w==
X-Gm-Message-State: AOAM5339b9c9Up4AtTLSL4DVx9I80bI1400zddEBnHgGIIz/oTsdFbli
 5knXAghdBR04H2TEitgBEdJvrA==
X-Google-Smtp-Source: ABdhPJy26aLIQNDGYzv9yUWJkE1S7Ng46xlnu9FBhglctMci0BMRl57bB82kjnJJ4TuniXpuKS76ig==
X-Received: by 2002:a37:5cc6:: with SMTP id q189mr1519218qkb.305.1624474246361; 
 Wed, 23 Jun 2021 11:50:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id y18sm503840qtx.6.2021.06.23.11.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:50:45 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lw7xV-00Blq0-8k; Wed, 23 Jun 2021 15:50:45 -0300
Date: Wed, 23 Jun 2021 15:50:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210623185045.GY1096940@ziepe.ca>
References: <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
 <20210623182435.GX1096940@ziepe.ca>
 <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf111O0_YB_tixzEUmaKpGAHMNvMaOes2AfMD4x68Am4Yyg@mail.gmail.com>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 sleybo@amazon.com, Leon Romanovsky <leonro@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 09:43:04PM +0300, Oded Gabbay wrote:

> Can you please explain why it is so important to (allow) access them
> through the CPU ?

It is not so much important, as it reflects significant design choices
that are already tightly baked into alot of our stacks. 

A SGL is CPU accessible by design - that is baked into this thing and
places all over the place assume it. Even in RDMA we have
RXE/SWI/HFI1/qib that might want to use the CPU side (grep for sg_page
to see)

So, the thing at the top of the stack - in this case the gaudi driver
- simply can't assume what the rest of the stack is going to do and
omit the CPU side. It breaks everything.

Logan's patch series is the most fully developed way out of this
predicament so far.

> The whole purpose is that the other device accesses my device,
> bypassing the CPU.

Sure, but you don't know that will happen, or if it is even possible
in any given system configuration. The purpose is to allow for that
optimization when possible, not exclude CPU based approaches.

Jason
