Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C31E7C52
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 13:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD056E8D2;
	Fri, 29 May 2020 11:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EF66E8D2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 11:53:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h4so2936355wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8VGauOvY+8N51YunvmSlzT9tGwypLDTydlI/YUcRZjg=;
 b=k0/fQwk+iYJ3ZYsrU3/x2hcPezasSJf+7/VxeffL9rPl+ylAylaknwHfQwwFJmA31D
 QaEhTqz+vxAfFVOsBAUf4PXRMIp20EWnT54k4UM+zeae556I/Da5mXRTVx9j8YnGDF30
 pM9V5V70s41DHQmGp4cwscr8R6OPq6jTiPL3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8VGauOvY+8N51YunvmSlzT9tGwypLDTydlI/YUcRZjg=;
 b=K6sAY01kM3WSAbRCDaQA1QXdVE9TmIZkQGCRbpKfEUTxD2DgeUVxSzOWlgTao7cqpH
 ztmQJtbtNGhhlQMPFxoYFJ2JXBCvDIpwr3YHmwjDyqEdJbdl0WaiOOrijpAoW0E6B57c
 9QaKc3K7QDBNOL5XL1m5V00nnUW5VMWxTLfpwbYTuna0jxv/4nGZTF6b3oIi1QrhFbMf
 g/4yS/Uj46QAiSljZTu6fN4j7LMPRyr7cDur8hhFfzXbpQYHE3U3zZ2MAJPMHOJq9kWY
 Hs5QYgH1k5eALkNYOUXdoUAwDXowAgm3x/sfd/EVNnGFqM09wMtmsCJCSSrJJLwZfq8z
 QuHA==
X-Gm-Message-State: AOAM531WiiyE7GhZqkAt1IhflUx9P6W781/6VzlFgrH+Zrnna9R42IVp
 YhgPaIZI3yAhfqcsP8VQ/zysPg==
X-Google-Smtp-Source: ABdhPJyPxkl9qh5IP61xP7cWvIbdmFTDMpTfaOpALtkj3UfGeFLRCFfcYSp+OR93nmw9aUUXQuc9jQ==
X-Received: by 2002:a7b:c358:: with SMTP id l24mr8672185wmj.13.1590753211105; 
 Fri, 29 May 2020 04:53:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c5sm9764603wrb.72.2020.05.29.04.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 04:53:30 -0700 (PDT)
Date: Fri, 29 May 2020 13:53:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ben Davis <ben.davis@arm.com>
Subject: Re: [PATCH v2] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Message-ID: <20200529115328.GC1630358@phenom.ffwll.local>
References: <20200529114726.13926-1-ben.davis@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529114726.13926-1-ben.davis@arm.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Jonas Karlman <jonas@kwiboo.se>, airlied@linux.ie, liviu.dudau@arm.com,
 matteo.franchin@arm.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 12:47:26PM +0100, Ben Davis wrote:
> DRM_FORMAT_NV15 is a 2 plane format suitable for linear and 16x16

Is there a specific modifier for this 16x16 block linear format? Feels a
bit confusing, would be great to add that to the commit message so usage
is clearer. We have DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, maybe that needs
another name (but same number) if this is commonly used across multiple
different gpu.
-Daniel



> block-linear memory layouts. The format is similar to P010 with 4:2:0
> sub-sampling but has no padding between components. Instead, luminance
> and chrominance samples are grouped into 4s so that each group is packed
> into an integer number of bytes:
> 
> YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> 
> The '15' suffix refers to the optimum effective bits per pixel which is
> achieved when the total number of luminance samples is a multiple of 8.
> 
> Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
> component, but only 10 bits are used and 6 are padded. 'Q' is chosen
> as the first letter to denote 3 plane YUV444, (and is the next letter
> along from P which is usually 2 plane).
> 
> V2: Updated block_w of NV15 to {4, 2, 0}
> 
> NV15:
> Tested-by: Jonas Karlman <jonas@kwiboo.se>
> 
> Reviewed-by: Brian Starkey <brian.starkey@arm.com>
> Signed-off-by: Ben Davis <ben.davis@arm.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
>  include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index b234bfaeda06..722c7ebe4e88 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
>  		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
>  		  .is_yuv = true },
> +		{ .format = DRM_FORMAT_NV15,		.depth = 0,
> +		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
> +		  .block_w = { 4, 2, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> +		  .vsub = 2, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Q410,		.depth = 0,
> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> +		  .vsub = 0, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Q401,		.depth = 0,
> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> +		  .vsub = 0, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 9e488d10f8b4..bed51236aed9 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -236,6 +236,12 @@ extern "C" {
>  #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
>  #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
>  #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
> +/*
> + * 2 plane YCbCr
> + * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
> + * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
> + */
> +#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
>  
>  /*
>   * 2 plane YCbCr MSB aligned
> @@ -265,6 +271,24 @@ extern "C" {
>   */
>  #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
>  
> +
> +/* 3 plane non-subsampled (444) YCbCr
> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> + * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
> + * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
> + */
> +#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
> +
> +/* 3 plane non-subsampled (444) YCrCb
> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> + * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
> + * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
> + */
> +#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
> +
> +
>  /*
>   * 3 plane YCbCr
>   * index 0: Y plane, [7:0] Y
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
