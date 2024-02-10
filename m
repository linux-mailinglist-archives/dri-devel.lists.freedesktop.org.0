Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A857385043A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 12:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6C1124D1;
	Sat, 10 Feb 2024 11:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5i6nk9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2F1124C7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 11:33:43 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc755832968so1139319276.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 03:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707564822; x=1708169622; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O56nX6gJID+KyV2fDe81//nmM2wB8OEZn8QrSqYoKNg=;
 b=f5i6nk9paEIMJ+llgCokzUcNGP8+gm4sucSlGFBq9BAl00sPexX4gKCOD8IIr/Bmiq
 Wr8tbmF0AA3x4jw9kwlMrvpZU3W1etK7U7mZbGv6LKaP1FtOKoroURpAg//oLUq94cK9
 S7Th9seEj6UufkfKy64fNyMF21mbqqoDwaMPnB3OhxMUqxspGDp7xWz1H5kz4OUquqhF
 F77OT8HdcEEjDizOZZ5O2i8QxD8i4g28JfGSbaLalr9DStuJqTgNQinJbGEywYdiO3DR
 0NLUGl4CdbEpxl8rQ9hprRXFR1ZOX3OKzD7RgpjAi0+CxjTrXRVMSIsFsoUzfFLbBw0+
 K5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707564822; x=1708169622;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O56nX6gJID+KyV2fDe81//nmM2wB8OEZn8QrSqYoKNg=;
 b=c3tApKzSwzKVrkkIa0ENhLfHf3rsIrBRakGC5uYXOHoRPVHiz3pUatR9XU5Vhiwlg4
 YF2KbyWVw2ffy3RgdGh2rYqtineHgpblFuEDcWa3CQKPzD03V0h18k2j6UNzXH9vw48q
 UD7EUK95vOIkYhA0ZsEsne7aylBvmma4jrVnSomOVy8tGiqk85wO/pZgJUp7lx/s6gNQ
 7ef9/58jA25J5UlnK/Lfn7YS35eQynOgQ9RoACtHMJZjGU42Dr+QpIQNlH0sp5BpMMq7
 thA1kpujkMWBBBXr459F/bcWPsTo7Kz717fBW9gcYC3gIZzDFtl8T15n1ryInKr/T1+1
 N4Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsDP+cmX0Kz5xvJ4WDBjz3gQgvDmGTPhR+/CNpHbEY9VwH3BFHBSGvSEr3GHbCqUFOlvKNUgQ4wWkL0G+aVJSfBJXPPuSsQWJFVwzrYZTE
X-Gm-Message-State: AOJu0YyBhBVb4/im9F0MUITbTf5WGOznNmkWQzSgVOtkENuenkVpOcvf
 m58pxcCooRsyg8iZeZOpBgTX/4TEUrc7ETyVow434IWFTBC/qaR5DxW6rioPbxtELSUETDUSTZQ
 lVj+tMmEkjwn9tb4c09YhzBz8s9F0+M6ucffgfQ==
X-Google-Smtp-Source: AGHT+IEVspeMhPBXLY0ZGYrZ1jpuuWSoZJq4+qjdF5Vil/sLu/iuDRAlCLNWCszwEvuLEHfGnrLZGkAzoYEh8bcMxGo=
X-Received: by 2002:a5b:90d:0:b0:dc6:c669:9914 with SMTP id
 a13-20020a5b090d000000b00dc6c6699914mr1476768ybq.15.1707564822553; Sat, 10
 Feb 2024 03:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-20-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:33:31 +0200
Message-ID: <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> All the components of YUV420 over DP are added. Therefore, let's mark the
> connector property as true for DP connector when the DP type is not eDP
> and when there is a CDM block available.
>
> Changes in v2:
>         - Check for if dp_catalog has a CDM block available instead of
>           checking if VSC SDP is allowed when setting the dp connector's
>           ycbcr_420_allowed parameter
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>  drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
>  drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>  5 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 723cc1d821431..beeaabe499abf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> +       bool yuv_supported;
>         int rc;
>         int i;
>
> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>                         return PTR_ERR(encoder);
>                 }
>
> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> +               yuv_supported = !!(dpu_kms->catalog->cdm);

Drop parentheses please.

> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
>                 if (rc) {
>                         DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>                         return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ebcc76ef1d590..9b9f5f2921903 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>  }
>
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> -                       struct drm_encoder *encoder)
> +                       struct drm_encoder *encoder, bool yuv_supported)
>  {
>         struct dp_display_private *dp_priv;
>         int ret;
> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                 return ret;
>         }
>
> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
>         if (IS_ERR(dp_display->connector)) {
>                 ret = PTR_ERR(dp_display->connector);
>                 DRM_DEV_ERROR(dev->dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 46e6889037e88..ab0d0d13b5e2c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>  }
>
>  /* connector initialization */
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> +                                           bool yuv_supported)
>  {
>         struct drm_connector *connector = NULL;
>
> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>         if (IS_ERR(connector))
>                 return connector;
>
> -       if (!dp_display->is_edp)
> +       if (!dp_display->is_edp) {
>                 drm_connector_attach_dp_subconnector_property(connector);
> +               if (yuv_supported)
> +                       connector->ycbcr_420_allowed = true;

Is there any reason to disallow YUV420 for eDP connectors?

> +       }
>
>         drm_connector_attach_encoder(connector, encoder);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index b3d684db2383b..45e57ac25a4d9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -19,7 +19,8 @@ struct msm_dp_bridge {
>
>  #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
>
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> +                                           bool yuv_supported);
>  int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>                         struct drm_encoder *encoder);
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index b876ebd48effe..37335777f5c09 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -385,7 +385,7 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
>  int __init msm_dp_register(void);
>  void __exit msm_dp_unregister(void);
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> -                        struct drm_encoder *encoder);
> +                        struct drm_encoder *encoder, bool yuv_supported);
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>  bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>                                const struct drm_display_mode *mode);
> @@ -403,7 +403,8 @@ static inline void __exit msm_dp_unregister(void)
>  }
>  static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>                                        struct drm_device *dev,
> -                                      struct drm_encoder *encoder)
> +                                      struct drm_encoder *encoder,
> +                                      bool yuv_supported)
>  {
>         return -EINVAL;
>  }
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
