Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B33813A3246
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 19:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1FE6E17C;
	Thu, 10 Jun 2021 17:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875AA6E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 17:37:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7061337wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W28qgTDMGCR0P9Ou4WN68qAkaQXn9YZcsqKZonMrLTM=;
 b=P2yvHGF4IYa0Esp7TsB3BFl0VBJnNXOgfUhgGPltC2Vy3VXshPuadHO68YBKmCgXbK
 C63Cj3vR1aVdT/m5b2hel6z65KT2MTl2OStL1SMMYd9geQ11qnQj4k3nm4efNj//Ctc2
 a/ASINEG4ZSY+7b9tDK/NEaDJdLiQmCQmLnPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W28qgTDMGCR0P9Ou4WN68qAkaQXn9YZcsqKZonMrLTM=;
 b=Ge/W9POnJCdiz89cNKRazOAzlaoTpdJWASOWDzcshAAwIySW38S3Hoz0iEGjACn+GM
 BR2xlNm4TvmUfJwhe41DaLkApwU9mT11iM79UZPuOkJkJa0mI5mt577WNRVRce09lQmr
 d9wd+mSCm7LF86x/ab+suDTjlLP0CxTKXhtdvrWJju397lPB3R3gdGefBa4HGAjVFjfL
 n2nEbjB9qqMJkNufJPMegeZGqXRNO/mL+UlCoalpG/MvKju/jSSqxHqpMlWD0sATgyoL
 B7oIRCGWYF1gsVKXzBkUfQOzqGA0aNqiJn3rAQ0wcy73644v5Wto27Tqd31CpjNTuuAg
 vUbQ==
X-Gm-Message-State: AOAM533cZHQVtoDC+HecReFBtAOUGRm3QfbcsTR5e7xEeA9aZG4SxueU
 ov28PWO6aJKGgVvbmnbFLJVrlA==
X-Google-Smtp-Source: ABdhPJzdAockMeIvR0IfteAp/5JNKa3R580ab7bZHs0QXddwtmD/r5hJuYihzqO8suYPSar2ZCqHVA==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr16402581wmi.65.1623346668217; 
 Thu, 10 Jun 2021 10:37:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t66sm3507601wma.41.2021.06.10.10.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:37:47 -0700 (PDT)
Date: Thu, 10 Jun 2021 19:37:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/3] drm/tegra: Use fourcc_mod_is_vendor() helper
Message-ID: <YMJN6W3aWpwWkDIz@phenom.ffwll.local>
References: <20210610111236.3814211-1-thierry.reding@gmail.com>
 <20210610111236.3814211-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610111236.3814211-3-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 01:12:36PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Rather than open-coding the vendor extraction operation, use the newly
> introduced helper macro.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/fb.c    | 2 +-
>  drivers/gpu/drm/tegra/plane.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index cae8b8cbe9dd..c04dda8353fd 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
>  {
>  	uint64_t modifier = framebuffer->modifier;
>  
> -	if ((modifier >> 56) == DRM_FORMAT_MOD_VENDOR_NVIDIA) {
> +	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
>  		if ((modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) == 0)
>  			tiling->sector_layout = TEGRA_BO_SECTOR_LAYOUT_TEGRA;
>  		else
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 2e65b4075ce6..f7496425fa83 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -109,7 +109,7 @@ static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
>  		return true;
>  
>  	/* check for the sector layout bit */
> -	if ((modifier >> 56) == DRM_FORMAT_MOD_VENDOR_NVIDIA) {
> +	if (fourcc_mod_is_vendor(modifier, NVIDIA)) {
>  		if (modifier & DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT) {
>  			if (!tegra_plane_supports_sector_layout(plane))
>  				return false;
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
