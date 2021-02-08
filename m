Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369C2312D6E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 10:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3BD6E845;
	Mon,  8 Feb 2021 09:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A146E845
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 09:38:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o24so4909926wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 01:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4DGQGSkzgcC/dD62BvVBWWA5K9GNya/Azc5NShmkw9c=;
 b=BrF/s6CFFF8+P8/zewQpBGItF+0CBq4qQd9jwH9BX0gBhEOrrAE2Y9DeVv1Cqe+PG8
 6swWNn4rPizD3NE4gk7zMHMrff4n8Jw6MeEUPj/T7JVyk0TWvzClJxyWB7BHRmbp0HZ3
 hmE8E4eLRrUsCuFl148JcoJmWT9mJ8KGdVsi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4DGQGSkzgcC/dD62BvVBWWA5K9GNya/Azc5NShmkw9c=;
 b=oxX0IssJaMfVIerNtjYAv3mD1qOwiftcl10qdLeopBYkVso+G409HWhaoP0igqGVgA
 LZfhiczzLYWogE7BdsdswBOYSL6IzXOa5MZk6pW01sgga01RI/WO8MSo4mrOQalEkyes
 HWX+OtvFbdzNh9KUeTuymaHddz2K+Qa18VxbxiZop1AV4uqh1JT5gpfYt9fcc0/ISWVf
 BvXnG1uQvylZIMne1eqdnolqOjGK+0YfF+QNC0bXukVJKGKlL6YJ4KcheJo5pYpWxsVq
 LbUyXBSf3k2iJ1eb1BBXv+A2U4YTDeqRM3BZf90kbSDS91Y/2rKVDYs50sRmQauJtJ1a
 5asg==
X-Gm-Message-State: AOAM531svtaIlfHptHSWkBuV/H9l3Rg28ZsMoJ+d0h7EKgj9NUgA/a4n
 4jicPuoK/+z96Xuh8ZcSTFOFwQ==
X-Google-Smtp-Source: ABdhPJzGAETbO5Jt6ZRC/GR0bn81heDLrjvHU05CkeKS+oGw67H4ItRzjTTOIwnpoRRmCRR+dmsFNw==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr13723288wme.146.1612777137507; 
 Mon, 08 Feb 2021 01:38:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v15sm1548194wra.61.2021.02.08.01.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:38:56 -0800 (PST)
Date: Mon, 8 Feb 2021 10:38:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dongwon.kim@intel.com, christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, daniel.vetter@intel.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 08:57:48AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > +/* extract pages referenced by sgt */
> > > +static struct page **extr_pgs(struct sg_table *sgt, int *nents, int *last_len)
> > 
> > Nack, this doesn't work on dma-buf. And it'll blow up at runtime when you
> > enable the very recently merged CONFIG_DMABUF_DEBUG (would be good to test
> > with that, just to make sure).
> 
> > Aside from this, for virtio/kvm use-cases we've already merged the udmabuf
> > driver. Does this not work for your usecase?
> 
> udmabuf can be used on the host side to make a collection of guest pages
> available as host dmabuf.  It's part of the puzzle, but not a complete
> solution.
> 
> As I understand it the intended workflow is this:
> 
>   (1) guest gpu driver exports some object as dma-buf
>   (2) dma-buf is imported into this new driver.
>   (3) driver sends the pages to the host.
>   (4) hypervisor uses udmabuf to create a host dma-buf.
>   (5) host dma-buf is passed on.
> 
> And step (3) is the problematic one as this will not
> work in case the dma-buf doesn't live in guest ram but
> in -- for example -- gpu device memory.

Yup, vram or similar special ram is the reason why an importer can't look
at the pages behind a dma-buf sg table.

> Reversing the driver roles in the guest (virtio driver
> allocates pages and exports the dma-buf to the guest
> gpu driver) should work fine.

Yup, this needs to flow the other way round than in these patches.

> Which btw is something you can do today with virtio-gpu.
> Maybe it makes sense to have the option to run virtio-gpu
> in render-only mode for that use case.

Yeah that sounds like a useful addition.

Also, the same flow should work for real gpus passed through as pci
devices. What we need is some way to surface the dma-buf on the guest
side, which I think doesn't exist yet stand-alone. But this role could be
fulfilled by virtio-gpu in render-only mode I think. And (assuming I've
understood the recent discussions around virtio dma-buf sharing using
virtio ids) this would give you some neat zero-copy tricks for free if you
share multiple devices.

Also if you really want seamless buffer sharing between devices that are
passed to the guest and devices on the host side (like displays I guess?
or maybe video encode if this is for cloug gaming?), then using virtio-gpu
in render mode should also allow you to pass the dma_fence back&forth.
Which we'll need too, not just the dma-buf.

So at a first guess I'd say "render-only virtio-gpu mode" sounds like
something rather useful. But I might be totally off here.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
