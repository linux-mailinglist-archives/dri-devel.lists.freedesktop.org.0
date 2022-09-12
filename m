Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77225B60F5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 20:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1C10E0D2;
	Mon, 12 Sep 2022 18:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8A010E0D2;
 Mon, 12 Sep 2022 18:32:10 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-127ba06d03fso25734442fac.3; 
 Mon, 12 Sep 2022 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zpbDl2VRI0jEyf87pDBReXUMtBgWCD1C0nyYDSr/ErQ=;
 b=L0q09VYXhO9Z7vI+bvaNu/YjVjM7QHirWRa9UZYPNcq5g71v1YvRUzIYDTL+VcC0G8
 8LZ4wzg2kFU/TUuAKXmuJNFOo1fqt7hlaMJGh3MHMoO5pZOYlWmJwXDUukhhjp1MJ8iw
 tTTEqQFLx1Z6HtkOHDx0iQZf1GINQRMpDm4dZMfUF1zNwb/Hw07ZzhLePKh2Mos0ck/t
 /OsmEL7j8kClhAdICdRLh6ctjfE9I0HmNnH3EdQ7rmc20d5gE+x8EQxa2PPqeOhAoyba
 PejEPXFDSnatPmuWTfBTIy1KWAX/nj+X7S5khfptujRFqOJSZlyBOp5L08WrBf01/Caq
 CqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zpbDl2VRI0jEyf87pDBReXUMtBgWCD1C0nyYDSr/ErQ=;
 b=eDmCsRPUjgR7BW4Dwzmwa8Pmbet4meRmgbqhIRcRxlpcWJgYcEkzJOkXDIWTEJcWXw
 wnk4QOLT6/fQgyrl7GjTN8pimUtTeyPdKyF0QEywb7mXqxgY1qnSnLbx3fE8L3wteN76
 ATqi8dNTVGIm87KDzfXxn4wCtdXdnSMbEz0U6yJM9MlTD/lV59h+6+c92UCwapygS5Qm
 lPo+z/la8S5jXpQmlHTtrXF/gXqCWLKmomOjFz1C4MynUwaYQ0t9CR1pQTIEvOa0XD1s
 f7sSoO/KVMYIRfYXtXfHe2cxyb/jAUfm3yxtJv8bZ7GhXpUl6lvC0SRtWs/D/VtBwtkF
 oBYw==
X-Gm-Message-State: ACgBeo0SnMBQQz7WP/DoXaoqvu5To8fkeRJeTIlxKZKKmr5uKqdRnqjg
 aR/UZUm2ncvcWMPQI0keEUje/WT2kUln0V1p4To=
X-Google-Smtp-Source: AA6agR6GnImjTj9JSjWMVZx/NyAr25mw2+kIGF6biUaSjd1wf5WUIxb0AWaugopgce/Jg2M4tKdZhNOZBcTvumd4ts4=
X-Received: by 2002:a05:6871:14e:b0:127:3f08:4599 with SMTP id
 z14-20020a056871014e00b001273f084599mr12351803oab.183.1663007529847; Mon, 12
 Sep 2022 11:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
 <20220901203422.217-2-quic_jesszhan@quicinc.com>
In-Reply-To: <20220901203422.217-2-quic_jesszhan@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Sep 2022 11:32:00 -0700
Message-ID: <CAF6AEGu1X6aPn8d-sE98PnmhkDEm6sJ6zT=yFN+h7Vum8TspgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Add support for XR30 format
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
> Add support for XR30 color format. This supports both linear and
> compressed formats.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 1 +
>  3 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index f436a1f3419d..57971c08f57c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -524,6 +524,12 @@ static const struct dpu_format dpu_format_map_ubwc[] = {
>                 true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
>                 DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
>
> +       INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
> +               COLOR_8BIT, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> +               true, 4, DPU_FORMAT_FLAG_DX | DPU_FORMAT_FLAG_COMPRESSED,
> +               DPU_FETCH_UBWC, 2, DPU_TILE_HEIGHT_UBWC),
> +
>         PSEUDO_YUV_FMT_TILED(NV12,
>                 0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
>                 C1_B_Cb, C2_R_Cr,
> @@ -571,6 +577,7 @@ static int _dpu_format_get_media_color_ubwc(const struct dpu_format *fmt)
>                 {DRM_FORMAT_XBGR8888, COLOR_FMT_RGBA8888_UBWC},
>                 {DRM_FORMAT_XRGB8888, COLOR_FMT_RGBA8888_UBWC},
>                 {DRM_FORMAT_ABGR2101010, COLOR_FMT_RGBA1010102_UBWC},
> +               {DRM_FORMAT_XRGB2101010, COLOR_FMT_RGBA1010102_UBWC},
>                 {DRM_FORMAT_XBGR2101010, COLOR_FMT_RGBA1010102_UBWC},
>                 {DRM_FORMAT_BGR565, COLOR_FMT_RGB565_UBWC},
>         };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0239a811d5ec..53b6edb2f563 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -156,6 +156,7 @@ static const uint32_t plane_formats[] = {
>         DRM_FORMAT_RGBX8888,
>         DRM_FORMAT_BGRX8888,
>         DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_XRGB2101010,
>         DRM_FORMAT_RGB888,
>         DRM_FORMAT_BGR888,
>         DRM_FORMAT_RGB565,
> @@ -184,6 +185,7 @@ static const uint32_t plane_formats_yuv[] = {
>         DRM_FORMAT_RGBA8888,
>         DRM_FORMAT_BGRX8888,
>         DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_XRGB2101010,
>         DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_XBGR8888,
>         DRM_FORMAT_RGBX8888,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index a617a3d8b1bc..60ea834dc8d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -69,6 +69,7 @@ static const uint32_t qcom_compressed_supported_formats[] = {
>         DRM_FORMAT_ARGB8888,
>         DRM_FORMAT_XBGR8888,
>         DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_XRGB2101010,
>         DRM_FORMAT_BGR565,
>
>         DRM_FORMAT_NV12,
> --
> 2.35.1
>
