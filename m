Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812E852EF6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 12:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561C510E3B1;
	Tue, 13 Feb 2024 11:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rNDJnxzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29B10E38D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 11:18:14 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcc6fc978ddso465165276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707823093; x=1708427893; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f6L9sPVuw/xEO6Dhj1zgSlfDhHIbvMMFflBRHa07Z3s=;
 b=rNDJnxzGLJnETxQATv9VuOsGTX5seQiXM2JuJFM8FM9fIGwskBYHUI8DY6K0xq4Ktk
 osmPoGqBay1DFoj8wJp/zjWjRDzx9cZ1LmpGYgMnRXJr5zeANNVpcHPe/Nj9/Q2gaMyp
 nzz/sgXyWcbe6udZO6eIA96hfih9uAtPpYJjmQ1caaABbzn7TDDWcwCVdMHM5k/dv1N8
 rEsruT6EyXxENr+QpXo24wDX2onzh2OVJjaZ2gKkbmSwwmsN5BQ/4RjkBQzAGE8Ylq3q
 NLzKXwI8Pm6ni+8Yf0JgrDu9rF85dKzjfRKWCwxZaf5ycPkdh+j9P22xKk4s4cNFkYfs
 PK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707823093; x=1708427893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6L9sPVuw/xEO6Dhj1zgSlfDhHIbvMMFflBRHa07Z3s=;
 b=iZ6LDiwC5lg7AlrD0Buobkfw7LOBopogV33clJN8wf0ztbI+6un7ZoHDB3ufhEtap/
 pAfDGOhEc8nx4ydVsrszOX8plIA/jazmvRHKrZZzhdMzBqt/luCrE7lNThztAbB+PPqo
 CpkYPIPlMFgdZhsQhV+cLjMheRbXUQXzXtap0hfTU8KFAONAETkl3o6cD74EqZJZdbGC
 0IkqBnlolswgOPIfrwEr1i/jVq4L3l2mAzkmeyfvL1Oxs88GIhqv/yVaXxwm4TdUgNim
 Saty6qaoFPMDjQKb5Vr779SGimgnFos/FYEsXSKKWWM2o28+r08yTXGIkpCFe35ZRD8Z
 nJgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDLNxiicKnyWqqGq5tcyzCs5baVMrNc8An+jlUTF4wuE5xjSWhwoL81SWEH8BFGjeOUstR2jITBj6xlynuXk7mvoeIpjzyeTiMg4SmLSYQ
X-Gm-Message-State: AOJu0YyX/MwmowSpNW7ZYD3iEvpszW/TzUm8KzWfG1b+OwO7ah2rO2Qy
 V0PPc/9wyD22jCiTYskncqk5RkJB3ds0vghYwc3OYzZ+04IUUI46ALfza5R2zq3ThKeaWwiKHhL
 BzDAxuUn+x5+ZkXa5G2RYVYGj/b8eqPa4Kd0LZQ==
X-Google-Smtp-Source: AGHT+IFg4epJvCP1Qw8gt9ZyFhF+q9oJBh/4R2edV6TBPLI//eGf4oeTN91oQKPOcGjYVXfTHUvqHl1GDBNQODY+ums=
X-Received: by 2002:a25:6e03:0:b0:dc6:c252:75fe with SMTP id
 j3-20020a256e03000000b00dc6c25275femr1453941ybc.10.1707823093581; Tue, 13 Feb
 2024 03:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-17-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-17-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:18:02 +0200
Message-ID: <CAA8EJprttbMgM=HEwctePZOwKny+nM2=qRJsPWmP4Ar0H8ATEg@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] drm/msm/dpu: modify encoder programming for CDM
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

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
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

Do we really need to check for phys_enc->hw_cdm here?

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
> index f562beb6f7971..3f102b2813ca8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -413,8 +413,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
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
> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);

Please move if(hw_cdm) inside dpu_encoder_get_drm_fmt().

> +       fmt = dpu_get_dpu_format(fmt_fourcc);

Can this be moved into dpu_encoder_helper_phys_setup_cdm() ? Or maybe
we can move both calls into the helper? I mean, fmt_fourcc is not used
at all if the CDM is not used.

>
>         DPU_DEBUG_VIDENC(phys_enc, "\n");
>
> @@ -423,6 +430,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>
>         dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>
> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
> +
>         dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>
>         /*
> @@ -438,6 +447,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
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
