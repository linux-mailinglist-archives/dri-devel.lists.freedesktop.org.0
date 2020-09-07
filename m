Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491CE25F57A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883536E3C6;
	Mon,  7 Sep 2020 08:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5BE6E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:40:28 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w2so13541865wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cJf1kmiWsQZG8IFiIR3q6R3hEFfEZk5imyH5+TkJyPA=;
 b=Lnd5Vtj3bdjvwakv4ZO/pL5KZE7kSwZH0nHoau2uOrh0hBk2hCL8YO6JlH8QA8pOeH
 l0AS/mV5iFBnlln7a0ddsvf9/+25wOaJJp+WaFdx3vjrR5/n7CLei4K00D7YKETEpFcQ
 ZFrL7C4AYrDgU/DxsFzdqmanw5V3xEIpkCzU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cJf1kmiWsQZG8IFiIR3q6R3hEFfEZk5imyH5+TkJyPA=;
 b=HsKnTlx9SbA70R0zXukDlP01wpOwPIRyNJIbOuE7P/N2IFBXm9lu/Fb9DA3yW4YFwa
 3EHpAxCwF2+YElJM14eINa2cqvxL8J0a5V0UQdgTWwjB6ujGQcoL3BlKbvy21a06bbRF
 7p3QOhH1PccOcCAtXmWK3KF/eyxu9twJzlMt18JgwIidiHWo5CAo+yn/iN8CPjWGSO7d
 HMrXEMXFo9oDiPN0PyEWvboKYTj18Ga6Tk8KHjQOWQ5xQK9dvkVYBnD4aq9g6+kBSR59
 0tQKTlP+WS1WstD0+mY3QYGpZP4eL62HBabSBlHnGz4AZktAn+yqpxgWtofIl8IaiA8R
 gYGQ==
X-Gm-Message-State: AOAM530xiaj42VzX9wj/qjMFvbgRhXi2HzTeZgy3p4UsPgjega5eVsi2
 I4rp6EEi+hP8M2EU7pcOHwpbZw==
X-Google-Smtp-Source: ABdhPJxcceae4ymKyuj2P3/auSOcq/8WOwgttKuu9CM/GDXtd+wBmnh3AulTh4Bg8F0MrHmAz6yH6w==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr19679857wma.18.1599468027002; 
 Mon, 07 Sep 2020 01:40:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm27220193wrt.38.2020.09.07.01.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:40:26 -0700 (PDT)
Date: Mon, 7 Sep 2020 10:40:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/2] drm: fix virtio-gpu + sev
Message-ID: <20200907084024.GT2352366@phenom.ffwll.local>
References: <20200907063343.18097-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907063343.18097-1-kraxel@redhat.com>
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 08:33:41AM +0200, Gerd Hoffmann wrote:
> virtio-gpu must make sure scatter list segments are not too big.
> 
> Gerd Hoffmann (2):
>   drm: allow limiting the scatter list size.
>   drm/virtio: set max_segment

So this all feels a bit irky and mid-layer, and why can't the various
helpers not just use dma_max_mapping_size(drm_device->dev) directly.

And then I read that dma api use in virtio subsystem is a huge mess of
hacks, and that it doesn't set up these quirks through the dma api
abstraction but throught it's own abstraction on top. So we don't really
have any other option I think.

I think would be good to add a TODO item to the virtio_max_dma_size call
like:

	TODO: once virtio uses the dma api correctly, remove the explicit
	max_segment handling na duse dma_max_mapping_size directly
	everywhere.

Or maybe also put that into the @max_segment kerneldoc in the drm_device
struct.

With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> on the
series.
-Daniel

> 
>  include/drm/drm_device.h                    |  8 ++++++++
>  include/drm/drm_prime.h                     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  3 ++-
>  drivers/gpu/drm/drm_gem_shmem_helper.c      |  3 ++-
>  drivers/gpu/drm/drm_prime.c                 | 10 +++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  3 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 ++-
>  drivers/gpu/drm/msm/msm_gem.c               |  3 ++-
>  drivers/gpu/drm/msm/msm_gem_prime.c         |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_prime.c     |  3 ++-
>  drivers/gpu/drm/radeon/radeon_prime.c       |  3 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  6 ++++--
>  drivers/gpu/drm/tegra/gem.c                 |  3 ++-
>  drivers/gpu/drm/vgem/vgem_drv.c             |  3 ++-
>  drivers/gpu/drm/virtio/virtgpu_kms.c        |  1 +
>  drivers/gpu/drm/xen/xen_drm_front_gem.c     |  3 ++-
>  16 files changed, 44 insertions(+), 17 deletions(-)
> 
> -- 
> 2.27.0
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
