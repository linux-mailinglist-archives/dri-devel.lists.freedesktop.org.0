Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0093D83F445
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 06:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADBB10F531;
	Sun, 28 Jan 2024 05:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B144010F531
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 05:56:58 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5ffcb478512so11757617b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 21:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706421354; x=1707026154; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GoyXWuZuNIYb2AEQYAXtq1yea8sURCjpiGY3DNRMjFk=;
 b=U1z2kj2nTgt2msEDjNkfv8uzvgDKDOPkntdx+f2bilTIUUC7WY9b0EVE4iHvK5wyQg
 luadYFz1bXXUP3lbdacBvgoFN7sYwBwuWusIHzrZfdz5MvUpyqaeCi2KNm8xrtToUWAq
 kLNwStyeGtIXCj8sDeIp9EYETV2X4adlbQ3gtfzUSkqj8Qj5TH1nrMWDAfsVqIkyWuyr
 EZMz1ilETtriZnyUHZtrq2zmiIzdOfWC/q+rxVOgiSigP7vqDByo2e7gW/wbZZLYSU26
 cWPtd2nd3Q9RHsZt1+NTXwRQXjx3urGXQsTmSLTD/Gd5j8me4h0idAHtloxxFy58W3QB
 aHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706421354; x=1707026154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GoyXWuZuNIYb2AEQYAXtq1yea8sURCjpiGY3DNRMjFk=;
 b=DszqSY7acKomMUqmbtf9kPysJSPjvWCuBZBeVkOcox5xVPrzXw8EjNIQGhVd1utlEh
 OzVCWh2frlEthxhvVIQnD83MgvkotTtqUHsmKib2BQwlxs0hMGmX/6t2W5a0MzF1z6O8
 8v8UwGKY1U9xLr0pa15gy9kY8lpJmWWLI+TMvyTbKeFT96X2Vb5mkPdg8b/wDnCH8eUE
 Gcsivqsav7ndAxfDmZDdruqcsBRHMjy7xk+9cPuzcdAaVQuuE+KoZOZT/+UIN7ripmat
 Zapvs4sBQ/XCN+QmhE19DBKmWHsAreR+vSoWVDYpWAknkdkxZeumC0p/5RzluzOlZxPT
 TELA==
X-Gm-Message-State: AOJu0Yzqa9dRAK41ssfxKYe8uxlK3k4YA/S99LUrtjGRsbOjEiIgMv/0
 mCSo9T1kTB2YJnlpZGHycWNp6/54LRVcxtGUJ+4+oNMOw30qaaR59vfH0mYy5h/aGuxE9QatV1G
 K5x0AbIGpidCLVpt4W/wrhC9UqZr7i2w45bSjmw==
X-Google-Smtp-Source: AGHT+IHkSqAKYfzVsj6hVNVsU4hjWyhT1c0XzYouiW/wnj/O9gADHq1PbKAwRnHsSW6Bm37v49IKgr8/jRt5EaK4Paw=
X-Received: by 2002:a81:520a:0:b0:5ff:79bd:ea34 with SMTP id
 g10-20020a81520a000000b005ff79bdea34mr1420288ywb.49.1706421353712; Sat, 27
 Jan 2024 21:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-15-quic_parellan@quicinc.com>
 <52674357-2135-4784-a371-e7809b632c19@linaro.org>
 <d1679d6f-a388-2a13-2924-1e6040217c01@quicinc.com>
In-Reply-To: <d1679d6f-a388-2a13-2924-1e6040217c01@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:55:42 +0200
Message-ID: <CAA8EJppPFuP4w-OAi0hDE36tjPXOHpigg1PMyzhkOTLL-q0VMQ@mail.gmail.com>
Subject: Re: [PATCH 14/17] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 07:48, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:57 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Adjust the encoder format programming in the case of video mode for DP
> >> to accommodate CDM related changes.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 16 +++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 +++++
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 35 ++++++++++++++++---
> >>   drivers/gpu/drm/msm/dp/dp_display.c           | 12 +++++++
> >>   drivers/gpu/drm/msm/msm_drv.h                 |  9 ++++-
> >>   5 files changed, 75 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index b0896814c1562..99ec53446ad21 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -222,6 +222,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >>   };
> >>   +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> >> const struct drm_display_mode *mode)
> >> +{
> >> +    const struct dpu_encoder_virt *dpu_enc;
> >> +    const struct msm_display_info *disp_info;
> >> +    struct msm_drm_private *priv;
> >> +
> >> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +    disp_info = &dpu_enc->disp_info;
> >> +    priv = drm_enc->dev->dev_private;
> >> +
> >> +    if (disp_info->intf_type == INTF_DP &&
> >> + msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]],
> >> mode))
> >
> > This should not require interacting with DP. If we got here, we must
> > be sure that 4:2:0 is supported and can be configured.
> Ack. Will drop this function and only check for if the mode is YUV420.
> >
> >> +        return DRM_FORMAT_YUV420;
> >> +
> >> +    return DRM_FORMAT_RGB888;
> >> +}
> >>     bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> >> *drm_enc)
> >>   {
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> index 7b4afa71f1f96..62255d0aa4487 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> >> @@ -162,6 +162,14 @@ int dpu_encoder_get_vsync_count(struct
> >> drm_encoder *drm_enc);
> >>    */
> >>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
> >> *drm_enc);
> >>   +/**
> >> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> >> + * @drm_enc:    Pointer to previously created drm encoder structure
> >> + * @mode:    Corresponding drm_display_mode for dpu encoder
> >> + */
> >> +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
> >> +                const struct drm_display_mode *mode);
> >> +
> >>   /**
> >>    * dpu_encoder_get_crc_values_cnt - get number of physical encoders
> >> contained
> >>    *    in virtual encoder that can collect CRC values
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index e284bf448bdda..a1dde0ff35dc8 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -234,6 +234,7 @@ static void
> >> dpu_encoder_phys_vid_setup_timing_engine(
> >>   {
> >>       struct drm_display_mode mode;
> >>       struct dpu_hw_intf_timing_params timing_params = { 0 };
> >> +    struct dpu_hw_cdm *hw_cdm;
> >>       const struct dpu_format *fmt = NULL;
> >>       u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>       unsigned long lock_flags;
> >> @@ -254,17 +255,26 @@ static void
> >> dpu_encoder_phys_vid_setup_timing_engine(
> >>       DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
> >>       drm_mode_debug_printmodeline(&mode);
> >>   -    if (phys_enc->split_role != ENC_ROLE_SOLO) {
> >> +    hw_cdm = phys_enc->hw_cdm;
> >> +    if (hw_cdm) {
> >> +        intf_cfg.cdm = hw_cdm->idx;
> >> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &mode);
> >> +    }
> >> +
> >> +    if (phys_enc->split_role != ENC_ROLE_SOLO ||
> >> +        dpu_encoder_get_drm_fmt(phys_enc->parent, &mode) ==
> >> DRM_FORMAT_YUV420) {
> >>           mode.hdisplay >>= 1;
> >>           mode.htotal >>= 1;
> >>           mode.hsync_start >>= 1;
> >>           mode.hsync_end >>= 1;
> >> +        mode.hskew >>= 1;
> >
> > Separate patch.
> Ack.
> >
> >>             DPU_DEBUG_VIDENC(phys_enc,
> >> -            "split_role %d, halve horizontal %d %d %d %d\n",
> >> +            "split_role %d, halve horizontal %d %d %d %d %d\n",
> >>               phys_enc->split_role,
> >>               mode.hdisplay, mode.htotal,
> >> -            mode.hsync_start, mode.hsync_end);
> >> +            mode.hsync_start, mode.hsync_end,
> >> +            mode.hskew);
> >>       }
> >>         drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
> >> @@ -412,8 +422,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >>   static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys
> >> *phys_enc)
> >>   {
> >>       struct dpu_hw_ctl *ctl;
> >> +    struct dpu_hw_cdm *hw_cdm;
> >> +    const struct dpu_format *fmt = NULL;
> >> +    u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>         ctl = phys_enc->hw_ctl;
> >> +    hw_cdm = phys_enc->hw_cdm;
> >> +    if (hw_cdm)
> >> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent,
> >> &phys_enc->cached_mode);
> >> +    fmt = dpu_get_dpu_format(fmt_fourcc);
> >>         DPU_DEBUG_VIDENC(phys_enc, "\n");
> >>   @@ -422,6 +439,8 @@ static void dpu_encoder_phys_vid_enable(struct
> >> dpu_encoder_phys *phys_enc)
> >>         dpu_encoder_helper_split_config(phys_enc,
> >> phys_enc->hw_intf->idx);
> >>   +    dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt,
> >> CDM_CDWN_OUTPUT_HDMI);
> >
> > If there is no CDM, why do we need to call this?
> Inside of dpu_encoder_helper_phys_setup_cdm(), there's a check to see if
> there is a hw_cdm. If there is not, then it immediately exits the function.
> >
> >> +
> >>       dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
> >>         /*
> >> @@ -437,7 +456,15 @@ static void dpu_encoder_phys_vid_enable(struct
> >> dpu_encoder_phys *phys_enc)
> >>       if (ctl->ops.update_pending_flush_merge_3d &&
> >> phys_enc->hw_pp->merge_3d)
> >>           ctl->ops.update_pending_flush_merge_3d(ctl,
> >> phys_enc->hw_pp->merge_3d->idx);
> >>   -    if (ctl->ops.update_pending_flush_periph &&
> >> phys_enc->hw_intf->cap->type == INTF_DP)
> >> +    if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> >> +        ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> >> +
> >> +    /*
> >> +     * Peripheral flush must be updated whenever flushing SDP
> >> packets is needed.
> >> +     * SDP packets are required for any YUV format (YUV420, YUV422,
> >> YUV444).
> >> +     */
> >> +    if (ctl->ops.update_pending_flush_periph &&
> >> phys_enc->hw_intf->cap->type == INTF_DP &&
> >> +        phys_enc->hw_cdm)
> >>           ctl->ops.update_pending_flush_periph(ctl,
> >> phys_enc->hw_intf->idx);
> >
> > Should there be a flush if we are switching from YUV 420 to RGB mode?
> We only need to flush for the sdp packet, but for msa we do not need to
> flush.

What about having SDP with RGB as colorimetry? In other words, if
there is a decision point, this one looks incorrect.

> >
> > Also, I'd say, we should move update_pending_flush_periph invocation
> > to this patch.
> Ack
> >
> >>     skip_flush:
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 6d764f5b08727..4329435518351 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1399,6 +1399,18 @@ void __exit msm_dp_unregister(void)
> >>       platform_driver_unregister(&dp_display_driver);
> >>   }
> >>   +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                   const struct drm_display_mode *mode)
> >> +{
> >> +    struct dp_display_private *dp;
> >> +    const struct drm_display_info *info;
> >> +
> >> +    dp = container_of(dp_display, struct dp_display_private,
> >> dp_display);
> >> +    info = &dp_display->connector->display_info;
> >> +
> >> +    return dp_panel_vsc_sdp_supported(dp->panel) &&
> >> drm_mode_is_420_only(info, mode);
> >
> > YUV 420 modes should be filtered out in mode_valid if VSC SDP is not
> > supported.
> Ack. Will change
> >
> >> +}
> >> +
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>   {
> >>       struct dp_display_private *dp;
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> >> b/drivers/gpu/drm/msm/msm_drv.h
> >> index 16a7cbc0b7dd8..b9581bd934e9e 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -387,7 +387,8 @@ void __exit msm_dp_unregister(void);
> >>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct
> >> drm_device *dev,
> >>                struct drm_encoder *encoder);
> >>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct
> >> msm_dp *dp_display);
> >> -
> >> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                   const struct drm_display_mode *mode);
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> >>     #else
> >> @@ -409,6 +410,12 @@ static inline void msm_dp_snapshot(struct
> >> msm_disp_state *disp_state, struct msm
> >>   {
> >>   }
> >>   +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp
> >> *dp_display,
> >> +                         const struct drm_display_mode *mode)
> >> +{
> >> +    return false;
> >> +}
> >> +
> >>   static inline bool msm_dp_wide_bus_available(const struct msm_dp
> >> *dp_display)
> >>   {
> >>       return false;
> >



--
With best wishes
Dmitry
