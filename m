Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3335B60F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5F910E136;
	Mon, 12 Sep 2022 18:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2777C10E125;
 Mon, 12 Sep 2022 18:32:29 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 p15-20020a056830130f00b006544f5228e3so6470922otq.2; 
 Mon, 12 Sep 2022 11:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5QwFkDMgKkbP/GEnUP+j+PWxyG7UMzMduL0spMsTzY4=;
 b=IyPq9/rQc/4J6tpC42BGlD+iy0z9rDaY7GrfGcwgZPRM/HkiuqLd+I8eV5ob39LVrw
 J6ZpOdB2UroMhJbvApIMS0YdzNEQ/Zxm7ax7lHIqtMfGdz4EW4eUOqTE+caQEnrF7EiQ
 Uz41Zs/09El0sOYEF6AmyLYhLEqkDv5iSS6+Rd1mwskJ9xVrM6b75p+Ku/eU4EewP1uB
 Xn0LXIkwTQBAbfY4LNlrRNfyyZNKSYukKl1Cl+kd4tOIwSfB4UdkZFOFT/CeyGp0trvr
 DSPPlnuM3Y1v7ITk04D7o9cU/WVp6mm1Dx8zERP0r0N+OxleEWRSZxX7YCTns7Vnrpu4
 nCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5QwFkDMgKkbP/GEnUP+j+PWxyG7UMzMduL0spMsTzY4=;
 b=Iy33xbGgfj2i7r9MlKuLW+akgEvh5vf31/q2BsbytuQKnbBYliUKue/DWg7oYwFdov
 HSE+48hR3zTpWIhy9XwyEyX2z0qC0+ius7D9wUZW0M7sLd/ax4xRZBxyOluI+sTnKRpI
 37UvpS+QF+xNgRLa5j5wbFTjj63upTNIQl3Lh7xm3nJJ7hbQ3SRKifNGBSW3C47N4+9z
 rCDju9W1XuOl2ejCWqVr1DZqj508/Vt7Zi9vcwyahYy0deCly90uWDvjn6/zW1VJT6A2
 HMe/QXRDFHPzAiLzIQbnG1KCIOPdKN4Mc/ppfNP4t7Xja4g29HSWvSCd3bW9wqXv9cGH
 BPZQ==
X-Gm-Message-State: ACgBeo1uVY7W/W9PW59aw6GbosyB8AXz8SuZJGTsoHUhoeX1jGXvkNC9
 sLpjqWF5BYPVWETFv2XFyDiTTDbrc6q0PtMtcvM=
X-Google-Smtp-Source: AA6agR4IEITK4XqV1UYLjZnckajF/8GH/zLGK1yVGOGpJwosNlVweOu+YFyCZGOQtqONc/vp/LjjKvc5q7/J2BsD9cA=
X-Received: by 2002:a05:6830:3101:b0:655:c143:80e2 with SMTP id
 b1-20020a056830310100b00655c14380e2mr4872980ots.22.1663007548366; Mon, 12 Sep
 2022 11:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
 <20220901203422.217-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220901203422.217-3-quic_jesszhan@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Sep 2022 11:32:18 -0700
Message-ID: <CAF6AEGuRCeCcrnhWWTKL7+kxdqb5Uifj3ChOP7-RsRFUMLZnzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Add support for P010 format
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 1, 2022 at 1:34 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add support for P010 color format. This adds support for both linear and
> compressed formats.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 17 ++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  1 +
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 57971c08f57c..d95540309d4d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -434,6 +434,12 @@ static const struct dpu_format dpu_format_map[] = {
>                 DPU_CHROMA_H2V1, DPU_FORMAT_FLAG_YUV,
>                 DPU_FETCH_LINEAR, 2),
>
> +       PSEUDO_YUV_FMT_LOOSE(P010,
> +               0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C1_B_Cb, C2_R_Cr,
> +               DPU_CHROMA_420, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_YUV,
> +               DPU_FETCH_LINEAR, 2),
> +
>         INTERLEAVED_YUV_FMT(VYUY,
>                 0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>                 C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
> @@ -536,6 +542,14 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
>                 DPU_CHROMA_420, DPU_FORMAT_FLAG_YUV |
>                                 DPU_FORMAT_FLAG_COMPRESSED,
>                 DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_NV12),
> +
> +       PSEUDO_YUV_FMT_TILED(P010,
> +               0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C1_B_Cb, C2_R_Cr,
> +               DPU_CHROMA_420, DPU_FORMAT_FLAG_DX |
> +                               DPU_FORMAT_FLAG_YUV |
> +                               DPU_FORMAT_FLAG_COMPRESSED,
> +               DPU_FETCH_UBWC, 4, DPU_TILE_HEIGHT_UBWC),
>  };
>
>  /* _dpu_get_v_h_subsample_rate - Get subsample rates for all formats we support
> @@ -584,7 +598,8 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
>         int color_fmt = -1;
>         int i;
>
> -       if (fmt->base.pixel_format == DRM_FORMAT_NV12) {
> +       if (fmt->base.pixel_format == DRM_FORMAT_NV12 ||
> +           fmt->base.pixel_format == DRM_FORMAT_P010) {
>                 if (DPU_FORMAT_IS_DX(fmt)) {
>                         if (fmt->unpack_tight)
>                                 color_fmt = COLOR_FMT_NV12_BPP10_UBWC;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 53b6edb2f563..199a2f755db4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -210,6 +210,7 @@ static const uint32_t plane_formats_yuv[] = {
>         DRM_FORMAT_RGBX4444,
>         DRM_FORMAT_BGRX4444,
>
> +       DRM_FORMAT_P010,
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_NV21,
>         DRM_FORMAT_NV16,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 60ea834dc8d6..f130bf783081 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -73,6 +73,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>         DRM_FORMAT_BGR565,
>
>         DRM_FORMAT_NV12,
> +       DRM_FORMAT_P010,
>  };
>
>  /**
> --
> 2.35.1
>
