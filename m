Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C477A23C6E4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522426E51D;
	Wed,  5 Aug 2020 07:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45C6E520
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 07:21:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f18so3755113wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZGeEUmx9BlkJo7ZvTPW2K8V/R+Wl19U5PhndvP3dFVg=;
 b=OtJqEFBpwaampDOgFJWZAGxM3n3WX7ueu1z5k8hO1klFUeZ9UelmXGQ2YiOCpgAgO+
 tfooW28hOADh6fKjQJQO/CaousPJM2YaslfE/pNLyWe+HbBazZxXJAVTepG4pgQZl0nK
 3zaY0UaZni4zbF+aBdsMGivFElUZkDlu4k3OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZGeEUmx9BlkJo7ZvTPW2K8V/R+Wl19U5PhndvP3dFVg=;
 b=tnf+v2ek1XNPEvj++cKrN3C4Q8rz9/d/zRurgGCRqxTXd2HZNI9X6LJ4S3B34hIEJq
 ImbeyDd3G8+Jf5FsQYiFT7hVFYP0VUNI+T+O3BjmopmyZP6/4r+kudSX34ddfC0/oCj4
 OF/8Zu1cMkVQYskSvFKziiUwfEXym3WlP2U++ry6WLNX3kDO6oM60nPXs7y7ZaS/mszz
 nyefnTSfXuVymgOZsli6BkggqPdPFMuvahbXXJyCkhRnagTzVRFxyAR+tEckam5Bm9n8
 bvYA4fBuLkcIm4PUwB9ePRKZ7aZx76m65kcsa7Ts+qx5Kqnf2PyHaqL9k0gap9r2fV/a
 r3EQ==
X-Gm-Message-State: AOAM533z2iGZcgEIwR1BSN9+6Tm7r9EWqRxW7QyfFFWaP1HmOXkF4VPj
 98QtmMuL0jPalC731x1ZCU9EVA==
X-Google-Smtp-Source: ABdhPJxtEFrOFcIDlDvU5ezObTQ6HW/HqP3Qci2pgS++gxypGuGWyP61W4MvlCWRNapVu+6JADuUGw==
X-Received: by 2002:a1c:6408:: with SMTP id y8mr1949328wmb.52.1596612106771;
 Wed, 05 Aug 2020 00:21:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g8sm1488395wme.13.2020.08.05.00.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 00:21:46 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:21:44 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 3/8] drm/amd/display: Honor the offset for plane 0.
Message-ID: <20200805072144.GT6419@phenom.ffwll.local>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-4-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804213119.25091-4-bas@basnieuwenhuizen.nl>
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
Cc: amd-gfx@lists.freedesktop.org, maraeo@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 11:31:14PM +0200, Bas Nieuwenhuizen wrote:
> With modifiers I'd like to support non-dedicated buffers for
> images.
> 
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Uh, I think it'd be really good to preceed this with a bugfix (cc: stable)
which checks that the offset is 0). And then this patch here removing that
again. Or cc: stable this patch here, since we seem to have a gap in
validating addfb.
-Daniel

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 005331c772b7..abc70fbe176d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3623,6 +3623,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
>  	struct dc *dc = adev->dm.dc;
>  	struct dc_dcc_surface_param input;
>  	struct dc_surface_dcc_cap output;
> +	uint64_t plane_address = afb->address + afb->base.offsets[0];
>  	uint32_t offset = AMDGPU_TILING_GET(info, DCC_OFFSET_256B);
>  	uint32_t i64b = AMDGPU_TILING_GET(info, DCC_INDEPENDENT_64B) != 0;
>  	uint64_t dcc_address;
> @@ -3666,7 +3667,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
>  		AMDGPU_TILING_GET(info, DCC_PITCH_MAX) + 1;
>  	dcc->independent_64b_blks = i64b;
>  
> -	dcc_address = get_dcc_address(afb->address, info);
> +	dcc_address = get_dcc_address(plane_address, info);
>  	address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
>  	address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
>  
> @@ -3697,6 +3698,8 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
>  	address->tmz_surface = tmz_surface;
>  
>  	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
> +		uint64_t addr = afb->address + fb->offsets[0];
> +
>  		plane_size->surface_size.x = 0;
>  		plane_size->surface_size.y = 0;
>  		plane_size->surface_size.width = fb->width;
> @@ -3705,9 +3708,10 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
>  			fb->pitches[0] / fb->format->cpp[0];
>  
>  		address->type = PLN_ADDR_TYPE_GRAPHICS;
> -		address->grph.addr.low_part = lower_32_bits(afb->address);
> -		address->grph.addr.high_part = upper_32_bits(afb->address);
> +		address->grph.addr.low_part = lower_32_bits(addr);
> +		address->grph.addr.high_part = upper_32_bits(addr);
>  	} else if (format < SURFACE_PIXEL_FORMAT_INVALID) {
> +		uint64_t luma_addr = afb->address + fb->offsets[0];
>  		uint64_t chroma_addr = afb->address + fb->offsets[1];
>  
>  		plane_size->surface_size.x = 0;
> @@ -3728,9 +3732,9 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
>  
>  		address->type = PLN_ADDR_TYPE_VIDEO_PROGRESSIVE;
>  		address->video_progressive.luma_addr.low_part =
> -			lower_32_bits(afb->address);
> +			lower_32_bits(luma_addr);
>  		address->video_progressive.luma_addr.high_part =
> -			upper_32_bits(afb->address);
> +			upper_32_bits(luma_addr);
>  		address->video_progressive.chroma_addr.low_part =
>  			lower_32_bits(chroma_addr);
>  		address->video_progressive.chroma_addr.high_part =
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
