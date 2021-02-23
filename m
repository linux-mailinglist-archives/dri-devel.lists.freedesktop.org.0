Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB43229C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 12:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC926E439;
	Tue, 23 Feb 2021 11:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276066E439
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 11:54:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p3so2158430wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 03:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gy+VK8PGfq3t5HxqsidqdiWwNhp6iSN9Nela3bKvc+o=;
 b=N+DaNmcIZZ2WqC4Qim07uOfCIo2lci1dZuLYtXsTdSplb6V09F+7kZSg5krY30NtZn
 LSRmQXel+gu5H9nYu7UpNkrwYUh++2tC1lR9yUol8WnofIj8cfAUiWyN1gz+pDJo7bvC
 ejk/ygdjmkmQtOx1HV+Xpw+UCchATf41P4l5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gy+VK8PGfq3t5HxqsidqdiWwNhp6iSN9Nela3bKvc+o=;
 b=Vb6bBZB8kbF1Sx0gL4rAUKhlr2dZeXX4V+fjQmltI4KCr5VOOsRftKHqnBIN25tZuy
 F4RClFrvEONjGLWWspwENHe+VGCwrCu1mMGTr+2mPAzP7MviK9yOod0qXCbxFXuHzCdT
 lMq9F+e+x61OhpjZONQY3VlsEvFsWq9Hc4DpSgLU5G8wavxoIjHoFgRVn/NmxSX/qoc1
 ZP4tB9fAMMfjTvjS4HiuR2Os3Ci5GtwXtIroInDj3ZKAoTKspeNvYa59eV3bhG7pExs+
 fGcG7/mlH73oEA0xBSUjB/9dXEesaGEVjvdujEaoUkZaoStLpK/yhDM0ADIMays0zLiZ
 DUdw==
X-Gm-Message-State: AOAM532rxN4upCLwECRPJ5wOtsf/7sjl9FUa3Fo/NG5xTTbpeDrEsmJz
 rQrXTElB58NrljaI0D4RZjsUpw6QlBrKiA==
X-Google-Smtp-Source: ABdhPJxNXEWoQVMz8Q5boTq3X8Vj6wXx7prFFYfx2n56jbsqVtIAhmok03SEa2DGd/7aLoy0vTJiow==
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr9689267wmj.29.1614081286921; 
 Tue, 23 Feb 2021 03:54:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c2sm32129675wrx.70.2021.02.23.03.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 03:54:46 -0800 (PST)
Date: Tue, 23 Feb 2021 12:54:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 00/11] dma_fence critical sections annotations for atomic
Message-ID: <YDTtBAolax5Gxp2k@phenom.ffwll.local>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 04:29:48PM +0100, Daniel Vetter wrote:
> Hi all,
> 
> Finally gotten around to refreshing all the various fence anntotions I've
> hast last summer. Or well parts of it:
> 
> - entire amdgpu and drm/scheduler annotations postponed for now, because
>   there's way too many splats in there that need some work
> 
> - in recent patches I've seen quite a few dma_resv_lock or kmalloc in
>   atomic_commit_tail, which doesn't work in full generality with the rules
>   for dma_fences we've discussed and encoded in lockdep. These annotations
>   should catch stuff like this.
> 
> Review comments and testing very much welcome.

I pulled in the acked/reviewed patches into drm-misc-next. Testing (enable
lockdep, test your driver) and review on the others very much appreciated.

Thanks, Daniel

> 
> Cheers, Daniel
> 
> Daniel Vetter (11):
>   drm/atomic-helper: Add dma-fence annotations
>   drm/vkms: Annotate vblank timer
>   drm/vblank: Annotate with dma-fence signalling section
>   drm/komeda: Annotate dma-fence critical section in commit path
>   drm/malidp: Annotate dma-fence critical section in commit path
>   drm/atmel: Use drm_atomic_helper_commit
>   drm/imx: Annotate dma-fence critical section in commit path
>   drm/omapdrm: Annotate dma-fence critical section in commit path
>   drm/rcar-du: Annotate dma-fence critical section in commit path
>   drm/tegra: Annotate dma-fence critical section in commit path
>   drm/tidss: Annotate dma-fence critical section in commit path
> 
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |   3 +
>  drivers/gpu/drm/arm/malidp_drv.c              |   3 +
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 107 +-----------------
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |   7 --
>  drivers/gpu/drm/drm_atomic_helper.c           |  16 +++
>  drivers/gpu/drm/drm_vblank.c                  |   8 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |   2 +
>  drivers/gpu/drm/omapdrm/omap_drv.c            |   9 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +
>  drivers/gpu/drm/tegra/drm.c                   |   3 +
>  drivers/gpu/drm/tidss/tidss_kms.c             |   4 +
>  drivers/gpu/drm/vkms/vkms_crtc.c              |   8 +-
>  12 files changed, 54 insertions(+), 118 deletions(-)
> 
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
