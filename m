Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C9360A61
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 15:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B266E504;
	Thu, 15 Apr 2021 13:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335F16E50D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 13:21:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e7so14316995wrs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=evTMSPPWsjDSCt/BqTT+rrf2SHb4/im2ARce7/nHPGA=;
 b=HDObdOKIBZFbGI0noupV2rQFT7dEvhwUbLyO87HnYkZen0h9MSmx0q7ZZtAlYPpjrV
 XqX8jJ5KpYjDe/UeFC+mxamfz+goUrjHUoljsIflToASY441T2oJ/NcOdp8O+VLTSmeP
 gWhXODCwdtMPni+XLtgesuxHlY5XYv/NkRQJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=evTMSPPWsjDSCt/BqTT+rrf2SHb4/im2ARce7/nHPGA=;
 b=PtdEwiC+yAm8LJICJ1lEYuak0ugKqIr2K2oapuPrUcMm1Z1guYgU2NkwnKOPQGGOE5
 MCNyOpjjpfTy9wbVR+hyB0QjKojeCDAWEFlHXsUxTSsOE00hqNn2vayxVmGw4wT2tgl0
 Gy6exuB/0CEjLvsOYLcditWhcq0ts58WhMy/3KivR9z3Ud7K1xi6xFSY5U+CHBnYt6c+
 IUj/F5A3SMoyAZzE1pEtYEP25a4pfqov5iimobj1ObqE/QJmF2U1Omjn+Haw0p9FqWlb
 E8148JYDXPLHEKnnBQT0Eq9I0TickkC/eLZ8bUwlCmL9fBfHmIAh+A7GcpaEUXYNnzY5
 cMaQ==
X-Gm-Message-State: AOAM532nzca1zelPhmALbx1CBU/GfPBiUy/SUlBxqonJp+YY4m3lD9FA
 MjnrUMRz2oDUsZb28Lfa0BulnA==
X-Google-Smtp-Source: ABdhPJyapv3SICSDUH7gbFUJPMlWnDA0q7t8TMzMLaKKqSfufxTyth1q/N7zr3wNvZtiBgPcxK1Vdw==
X-Received: by 2002:a5d:4cc1:: with SMTP id c1mr3556812wrt.291.1618492883887; 
 Thu, 15 Apr 2021 06:21:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z66sm2884216wmc.4.2021.04.15.06.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:21:23 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:21:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/7] drm/ttm: Don't override vm_ops callbacks, if set
Message-ID: <YHg90cqFr0gIqiNN@phenom.ffwll.local>
References: <20210415101740.21847-1-tzimmermann@suse.de>
 <20210415101740.21847-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415101740.21847-2-tzimmermann@suse.de>
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
Cc: amd-gfx@lists.freedesktop.org, shashank.sharma@amd.com, airlied@linux.ie,
 nouveau@lists.freedesktop.org, Felix.Kuehling@amd.com, sroland@vmware.com,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sam@ravnborg.org, christian.koenig@amd.com,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 12:17:34PM +0200, Thomas Zimmermann wrote:
> Drivers may want to set their own callbacks for a VM area. Only set
> TTM's callbacks if the vm_ops field is clear.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index b31b18058965..bf4a213bc66c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -534,7 +534,12 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_device *bdev,
>  
>  static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_struct *vma)
>  {
> -	vma->vm_ops = &ttm_bo_vm_ops;
> +	/*
> +	 * Drivers may want to override the vm_ops field. Otherwise we
> +	 * use TTM's default callbacks.
> +	 */
> +	if (!vma->vm_ops)
> +		vma->vm_ops = &ttm_bo_vm_ops;
>  
>  	/*
>  	 * Note: We're transferring the bo reference to
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
