Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05147855CC7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1860110E119;
	Thu, 15 Feb 2024 08:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CsJhA48i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64AE10E295
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:45:43 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-607d8506099so2223817b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 00:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707986742; x=1708591542; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IDB6oJU318rjrhCQ1hGZkP4wdh542f+aaw58PBz7AZ0=;
 b=CsJhA48iaaxCk1p2Az/MwE9X/lAm0NuLGhrF96w9QcgTTkLPcPlou6JDZb6KHAhXhI
 GVpHupjootdwTbVanETJhMsePu63tU3jkA2TGckDA5kMIerJ/lMMByrvS552FamUPmuu
 RwVMOGnjA3dVvO1QKueHTS4BQijRCenzJ2IlbWlcnHOlOIi3703Fsvhd4jW6VDD6aMp3
 lo0kId1UcWe4sXuYOp2b1S+D5r8lKpE+DaNWxyBu6byr8BfS0LaX52tMfg710tcz3GEe
 bhoQSorUNQXgYbsT3s2S/tEgstFHGW3c9R+ov7Xq8Eg/9A41YP32ot4MEpyRIglOS3yZ
 fHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707986742; x=1708591542;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDB6oJU318rjrhCQ1hGZkP4wdh542f+aaw58PBz7AZ0=;
 b=CJ8uYCdy6XioSCl3bSLqOJhiFt7fOBKBIc2TyUs5hfMyNOqcUTsdBKGjcqaBlF8Ote
 QW8XckC8eh9q5MImg2CMsab8Onu/T5XjSRLuBjHyb5vSNCokLFTcilIEP3G6z+GmY4no
 S+JW2MwO74NdPaFkA+LrTt9HzHnjNl0UHB8NCLcFSoWZtqF2/5fkAUFGfqEYrVdLDTqB
 Mvc0Lt3hLgenR/rFC/njyulINNYSo/+vlaUhhxYGwazRDUS89FO8WwMqMynlg+x/whA0
 N1JSRaRa+RzF6AYBvdyevOmEHrMX5a07PNz/M5/ydHjNzIT19I/B2Ei0q1tnFTWDmCO3
 FFew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJg7BHOMjv/6V8hkeuTCfLR1yxMJF8yfmYnbYLwy/QJmcEP81Y3CpKoXqINQFLzjQqTwY011pUI/Lrn99FarkcbQI0VVbmohm8VQwnwJDv
X-Gm-Message-State: AOJu0YwEzMuH8V51iR1ClwGLjvdUxo7VwL5tuMeAuE4CzFR1nELMv/Pe
 xdlgi9wFiFLOlU2KNPadvMwd5HvC0axyvDZivFnEKtoVBFzpErMjT09bhfiTxjxDR3tMQo75reU
 JUkk17XScpHndTeIXRXwyTD80KuErPIwnqVrC+Y+SqstDOemN
X-Google-Smtp-Source: AGHT+IFzc71r1OL/JY6adDM6klR65tkU0P7RysIBbCnoPUE2T9XlewvFmLVCz330Isl1bQG7NkJmffZ0Wr+GEFrCTbo=
X-Received: by 2002:a05:6902:1ac2:b0:dcd:8a5:d5b8 with SMTP id
 db2-20020a0569021ac200b00dcd08a5d5b8mr1106283ybb.49.1707986742341; Thu, 15
 Feb 2024 00:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-17-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:45:32 +0200
Message-ID: <CAA8EJppvxr_Cc6xYkrTPQtiDDqMrErByvz9a532ccbdDgsM7GQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder format programming in the case of video mode for DP
> to accommodate CDM related changes.
>
> Changes in v2:
>         - Move timing engine programming to a separate patch from this
>           one
>         - Move update_pending_flush_periph() invocation completely to
>           this patch
>         - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>           calls drm_mode_is_420_only() instead of doing additional
>           unnecessary checks
>         - Create new functions msm_dp_needs_periph_flush() and it's
>           supporting function dpu_encoder_needs_periph_flush() to check
>           if the mode is YUV420 and VSC SDP is enabled before doing a
>           peripheral flush
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>  drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>  5 files changed, 101 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7e7796561009a..6280c6be6dca9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>         15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>  };
>
> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
> +{
> +       struct drm_encoder *drm_enc;
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct drm_display_info *info;
> +       struct drm_display_mode *mode;
> +
> +       drm_enc = phys_enc->parent;
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       info = &dpu_enc->connector->display_info;
> +       mode = &phys_enc->cached_mode;
> +
> +       if (drm_mode_is_420_only(info, mode))
> +               return DRM_FORMAT_YUV420;
> +
> +       return DRM_FORMAT_RGB888;
> +}
> +
> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
> +{
> +       struct drm_encoder *drm_enc;
> +       struct dpu_encoder_virt *dpu_enc;
> +       struct msm_display_info *disp_info;
> +       struct msm_drm_private *priv;
> +       struct drm_display_mode *mode;
> +
> +       drm_enc = phys_enc->parent;
> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       disp_info = &dpu_enc->disp_info;
> +       priv = drm_enc->dev->dev_private;
> +       mode = &phys_enc->cached_mode;
> +
> +       return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
> +              msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
> +}
>
>  bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index f43d57d9c74e1..211a3d90eb690 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   */
>  unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>
> +/**
> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
> +
> +/**
> + * dpu_encoder_needs_periph_flush - return true if physical encoder requires
> + *     peripheral flush
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
> +
>  /**
>   * dpu_encoder_helper_split_config - split display configuration helper function
>   *     This helper function may be used by physical encoders to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index f02411b062c4c..e29bc4bd39208 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -415,8 +415,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>  static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>  {
>         struct dpu_hw_ctl *ctl;
> +       struct dpu_hw_cdm *hw_cdm;
> +       const struct dpu_format *fmt = NULL;
> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
>
>         ctl = phys_enc->hw_ctl;
> +       hw_cdm = phys_enc->hw_cdm;
> +       if (hw_cdm)

I thought that Abhinav proposed to drop the if(hw_cdm) condition here.
LGTM otherwise.

> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
> +       fmt = dpu_get_dpu_format(fmt_fourcc);
>
>         DPU_DEBUG_VIDENC(phys_enc, "\n");
>
> @@ -425,6 +432,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>
>         dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>
> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
> +
>         dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>
>         /*
> @@ -440,6 +449,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>         if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>                 ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>
> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> +
> +       /*
> +        * Peripheral flush must be updated whenever flushing SDP packets is needed.
> +        * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
> +        */
> +       if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
> +               ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> +
>  skip_flush:
>         DPU_DEBUG_VIDENC(phys_enc,
>                 "update pending flush ctl %d intf %d\n",
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4b04388719363..ebcc76ef1d590 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
>         platform_driver_unregister(&dp_display_driver);
>  }
>
> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode)
> +{
> +       struct dp_display_private *dp;
> +       const struct drm_display_info *info;
> +
> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> +       info = &dp_display->connector->display_info;
> +
> +       return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
> +}
> +
> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode)
> +{
> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
> +}
> +
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>  {
>         struct dp_display_private *dp;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 16a7cbc0b7dd8..b876ebd48effe 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
>  int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>                          struct drm_encoder *encoder);
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
> -
> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode);
> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> +                              const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>
>  #else
> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
>  {
>  }
>
> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> +                                            const struct drm_display_mode *mode)
> +{
> +       return false;
> +}
> +
> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> +                                            const struct drm_display_mode *mode)
> +{
> +       return false;
> +}
> +
>  static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>  {
>         return false;
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
