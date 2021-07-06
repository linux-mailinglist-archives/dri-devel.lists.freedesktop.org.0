Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969C3BD80C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 15:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1D36E484;
	Tue,  6 Jul 2021 13:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29D36E49A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 13:54:54 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id d1so4732864qto.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F7pVFly65mtrw4yvfSLy/OKy9AWKG24c85UMsxt0WZw=;
 b=gYf94+BMIGsQpJS3uV3ohuMRMLOEFz0kdysTKDKnloRFgs0LhgoRcqPW98PUrU+dx6
 E3OOKrVJV1BTd2elUyjb8G6xfJzPFdvehJAilfpTM9RS4gfQVAvkYNKGiyCJGug87J6k
 YPq+yFMHPSe1tFJNbPKeZAhUsLvOhG/JZZZww+IcGnL/e9f9w8Z2RP4h4m2+YNHDT4Xi
 aRg/PM4bau3ZfwjJIhVR625Zv1Lq+m19yfd3/4kopcBskBTAcwccdEdO9LAmSJrnc844
 kpItX9Ulfg4csgBtST5Xn7ZpOiEeWyWeCZZL/jYKlVlhcziFr98+RBkzrzJm3IFtppAf
 vOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F7pVFly65mtrw4yvfSLy/OKy9AWKG24c85UMsxt0WZw=;
 b=QKAZVF2zVY+rqJZKp93QsIWS6qlcmV53/cGmrnI37/XtZN+v1meR26v478n50XCG+Y
 WNH4xHckefY9ar24MjcDoRjlVzc5s3B7ljG1Br5ZAnh16YyuKWDzIlVdCDW70qiIOjxU
 GgAmYkYAZThEJsVIGGdlCiMMYquMOQt67fQDIvjvybVIwUkT1S44XURygsaSDG1AhDQs
 iQcvVvLmF+HYafxCDJnXxenhvAMWfsJ1s4uiSu7KlaQPBzR3IW82dtSaiqfNQGiEiPUQ
 xa61VbfPaJB7t3eu7iTB/Ha1LFUfhjpBLMdUdsXKy6wiQeTdAuExdTV+/Ubb3inB/o7s
 YaPw==
X-Gm-Message-State: AOAM533gNZO7N0Z3ekRBxRkbFWdVS7vrzeUM8126BCY+Kf4919PnFZfH
 5W8/QotbWpGRsJeODCFLF4Gbkg==
X-Google-Smtp-Source: ABdhPJz13olZ+JJKFkbBuIPKQTyNwX1MXRn+mR8LaT47LKm2ZWHADKQroBueZGYoVGCTJKDq+xeMwA==
X-Received: by 2002:ac8:5045:: with SMTP id h5mr17280817qtm.178.1625579693287; 
 Tue, 06 Jul 2021 06:54:53 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id t20sm1900660qtx.48.2021.07.06.06.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:54:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1m0lXH-004QmP-Kc; Tue, 06 Jul 2021 10:54:51 -0300
Date: Tue, 6 Jul 2021 10:54:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v4 2/2] habanalabs: add support for dma-buf exporter
Message-ID: <20210706135451.GM4604@ziepe.ca>
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <20210705130314.11519-3-ogabbay@kernel.org>
 <20210705165226.GJ4604@ziepe.ca>
 <CAFCwf100mkROMw9+2LgW7d3jKnaeZ4nmfWm7HtXuUE7NF4B8pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf100mkROMw9+2LgW7d3jKnaeZ4nmfWm7HtXuUE7NF4B8pg@mail.gmail.com>
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Christoph Hellwig <hch@lst.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tomer Tayar <ttayar@habana.ai>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 12:44:49PM +0300, Oded Gabbay wrote:

> > > +     /* In case we got a large memory area to export, we need to divide it
> > > +      * to smaller areas because each entry in the dmabuf sgt can only
> > > +      * describe unsigned int.
> > > +      */
> >
> > Huh? This is forming a SGL, it should follow the SGL rules which means
> > you have to fragment based on the dma_get_max_seg_size() of the
> > importer device.
> >
> hmm
> I don't see anyone in drm checking this value (and using it) when
> creating the SGL when exporting dmabuf. (e.g.
> amdgpu_vram_mgr_alloc_sgt)

For dmabuf the only importer is RDMA and it doesn't care, but you
certainly should not introduce a hardwired constant instead of using
the correct function.

Jason
