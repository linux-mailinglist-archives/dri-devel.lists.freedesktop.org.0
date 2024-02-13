Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4397C8539D2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 19:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BE110E32A;
	Tue, 13 Feb 2024 18:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mKirDWdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413D410E7FE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 18:23:42 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso951229276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707848621; x=1708453421; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fkE7klX7XNiSTQoWMiVmKEm1+UjPMHYgC73Fg53elTk=;
 b=mKirDWdJebvCmI6GtYwpko4YNm74yXviHWzISoCH6cRph/5q2RDHDYZjJJ+SSFc2Y3
 8jo4GnGwpHG1TVP2ap7h9mcj3EbJ6m6feL1c/Cvh9uWcnORu1gm4ZJ3EI6vjh1hTfL27
 jlZJIZyGq7+rDMCTAA56ippkQJgwfdmi+MqBXYz37UVZM1UfvdaaGj5AZEGhghp77d+R
 J6Or1tkJwM5UEGafpqoMeOoW/Gs/VoGjLIL5atOvWVyjJfXG3XJ/8DCzFHiglh2zIyNh
 VgcTcbGR0v3c7d8xQSdRSGkf0hFznSw7eXoEPv/l1q9N2aM6ys5eIWU+IqsvEZDOJzIL
 eWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707848621; x=1708453421;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkE7klX7XNiSTQoWMiVmKEm1+UjPMHYgC73Fg53elTk=;
 b=pB/IsWg6AGR+mHsujry834LU5aACfN/YjQFozanLwKp1qu4iQjWRWQbHpyEYykjit4
 9Dz9kXFBjbOsdHRdTfHB/Krg65DAfjHKgBKsIyes1IwWcShSVxyftsZXZt2AcQ8V/jQf
 Z08nsBE7acPp7z5PF/w/rWUISf47ArrT57tbnel9U4N42CMa0TG/wiPeMVgCpj4EwBXR
 KayAtT/5CZPOD54o6wCKeKMt0tIKRhbQnVh54nLZQcatqIzAWZKijthJhctzqoBe0TrF
 ahectB6gks7QNQ8ueWxxbWWqJ5bY8DVlRVVxIkQKPKqhY64tMBXS42/SdMKqE/v7XDOb
 b+Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrfuE7tyt+WlepS1cB8funW3PNjx1kS4bbS8yyzgjccyhwhwunjxvqSyiOVqLSYFUX/ZECOm0b2dwfPCSOdpI1TB/4bvJDE9Q6h4jOSbJ3
X-Gm-Message-State: AOJu0Yz6zaQ8AFDncAPNc++yXLzMlvdaZa0TmHAoKEwqZR1M5yeByXSu
 eXDc4w4kTqUhn5AdP6dHZdMjqKW9xQBUWGOvLtYKL25hk9uWj9LaT3dGqPjLZwpSnmZFp82UNgz
 WZC8Iop0JTBmkyUULV4nK8ljS0A+ujnot/jYA8g==
X-Google-Smtp-Source: AGHT+IHPEcvTPrTpsArVtgDoVOviSAZns5rt7zwUv1ceQVVZm5sUBuZ5CtnML8JYHAsVTo/0clSpq0TXPI9c02oUX6A=
X-Received: by 2002:a25:c58a:0:b0:dcc:8f97:9744 with SMTP id
 v132-20020a25c58a000000b00dcc8f979744mr63961ybe.43.1707848621125; Tue, 13 Feb
 2024 10:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-17-quic_parellan@quicinc.com>
 <CAA8EJprttbMgM=HEwctePZOwKny+nM2=qRJsPWmP4Ar0H8ATEg@mail.gmail.com>
 <217dbec7-d7b9-688f-ce40-2a62179cb507@quicinc.com>
In-Reply-To: <217dbec7-d7b9-688f-ce40-2a62179cb507@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 20:23:29 +0200
Message-ID: <CAA8EJprLvEn7ndCHqkw4RuGq_AE1nOxyONZx832Wv8Y2dGtRhQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
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

On Tue, 13 Feb 2024 at 19:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/13/2024 3:18 AM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> Adjust the encoder format programming in the case of video mode for DP
> >> to accommodate CDM related changes.
> >>
> >> Changes in v2:
> >>          - Move timing engine programming to a separate patch from this
> >>            one
> >>          - Move update_pending_flush_periph() invocation completely to
> >>            this patch
> >>          - Change the logic of dpu_encoder_get_drm_fmt() so that it only
> >>            calls drm_mode_is_420_only() instead of doing additional
> >>            unnecessary checks
> >>          - Create new functions msm_dp_needs_periph_flush() and it's
> >>            supporting function dpu_encoder_needs_periph_flush() to check
> >>            if the mode is YUV420 and VSC SDP is enabled before doing a
> >>            peripheral flush
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
> >>   drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
> >>   5 files changed, 101 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 7e7796561009a..6280c6be6dca9 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >>          15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >>   };
> >>
> >> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +       struct drm_encoder *drm_enc;
> >> +       struct dpu_encoder_virt *dpu_enc;
> >> +       struct drm_display_info *info;
> >> +       struct drm_display_mode *mode;
> >> +
> >> +       drm_enc = phys_enc->parent;
> >> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +       info = &dpu_enc->connector->display_info;
> >> +       mode = &phys_enc->cached_mode;
> >> +
> >> +       if (drm_mode_is_420_only(info, mode))
> >> +               return DRM_FORMAT_YUV420;
> >> +
> >> +       return DRM_FORMAT_RGB888;
> >> +}
> >> +
> >> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
> >> +{
> >> +       struct drm_encoder *drm_enc;
> >> +       struct dpu_encoder_virt *dpu_enc;
> >> +       struct msm_display_info *disp_info;
> >> +       struct msm_drm_private *priv;
> >> +       struct drm_display_mode *mode;
> >> +
> >> +       drm_enc = phys_enc->parent;
> >> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
> >> +       disp_info = &dpu_enc->disp_info;
> >> +       priv = drm_enc->dev->dev_private;
> >> +       mode = &phys_enc->cached_mode;
> >> +
> >> +       return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
> >
> > Do we really need to check for phys_enc->hw_cdm here?
> >
>
> hmmm I dont think so. If CDM was not there, then after the last patch,
> YUV420 removes will not be present at all.
>
> The only other case I could think of was, if for some reason CDM was
> used by some other interface such as WB, then hw_cdm will not be assigned.
>
> But, I think even for that msm_dp_needs_periph_flush() will take care of
> it because we use the cached_mode which is assigned only in mode_set().
>
> >> +              msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
> >> +}
> >>
> >>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
> >>   {
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> index f43d57d9c74e1..211a3d90eb690 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
> >>    */
> >>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
> >>
> >> +/**
> >> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
> >> + * @phys_enc: Pointer to physical encoder structure
> >> + */
> >> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
> >> +
> >> +/**
> >> + * dpu_encoder_needs_periph_flush - return true if physical encoder requires
> >> + *     peripheral flush
> >> + * @phys_enc: Pointer to physical encoder structure
> >> + */
> >> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
> >> +
> >>   /**
> >>    * dpu_encoder_helper_split_config - split display configuration helper function
> >>    *     This helper function may be used by physical encoders to configure
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index f562beb6f7971..3f102b2813ca8 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -413,8 +413,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >>   static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >>   {
> >>          struct dpu_hw_ctl *ctl;
> >> +       struct dpu_hw_cdm *hw_cdm;
> >> +       const struct dpu_format *fmt = NULL;
> >> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
> >>
> >>          ctl = phys_enc->hw_ctl;
> >> +       hw_cdm = phys_enc->hw_cdm;
> >> +       if (hw_cdm)
> >> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
> >
> > Please move if(hw_cdm) inside dpu_encoder_get_drm_fmt().
> >
>
> I think we dont need to check for if (hw_cdm) at all.
> dpu_encoder_get_drm_fmt() was just supposed to be a helper which returns
> the fourcc code based on the mode. It doesnt need to know if there is
> cdm or not.
>
> We cannot move it inside dpu_encoder_helper_phys_setup_cdm() because for
> WB, we do not change the fourcc based on the mode. Its specific to video
> mode.

Wait... In the case of the WB we use the fourcc + modifier from the
framebuffer. Ok, this looks fine then.


>
> >> +       fmt = dpu_get_dpu_format(fmt_fourcc);
> >
> > Can this be moved into dpu_encoder_helper_phys_setup_cdm() ? Or maybe
> > we can move both calls into the helper? I mean, fmt_fourcc is not used
> > at all if the CDM is not used.
> >
>
> fourcc is always used to get the fmt to setup the timing engine params.
> Its just that it was always hard-coded to RGB. With CDM, it can change
> based on the mode. Thats why this utility was introduced to return the
> fourcc from the mode information.

Yes, I perfectly understand that. I just disliked the idea of calling
dpu_get_dpu_format() if the result gets unused.
What about passing fourcc + modifier to
dpu_encoder_helper_phys_setup_cdm() instead?

>
> >>
> >>          DPU_DEBUG_VIDENC(phys_enc, "\n");
> >>
> >> @@ -423,6 +430,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >>
> >>          dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
> >>
> >> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
> >> +
> >>          dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
> >>
> >>          /*
> >> @@ -438,6 +447,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
> >>          if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
> >>                  ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
> >>
> >> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
> >> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
> >> +
> >> +       /*
> >> +        * Peripheral flush must be updated whenever flushing SDP packets is needed.
> >> +        * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
> >> +        */
> >> +       if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
> >> +               ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
> >> +
> >>   skip_flush:
> >>          DPU_DEBUG_VIDENC(phys_enc,
> >>                  "update pending flush ctl %d intf %d\n",
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 4b04388719363..ebcc76ef1d590 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
> >>          platform_driver_unregister(&dp_display_driver);
> >>   }
> >>
> >> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode)
> >> +{
> >> +       struct dp_display_private *dp;
> >> +       const struct drm_display_info *info;
> >> +
> >> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> +       info = &dp_display->connector->display_info;
> >> +
> >> +       return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
> >> +}
> >> +
> >> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode)
> >> +{
> >> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
> >> +}
> >> +
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>   {
> >>          struct dp_display_private *dp;
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> >> index 16a7cbc0b7dd8..b876ebd48effe 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
> >>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>                           struct drm_encoder *encoder);
> >>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
> >> -
> >> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode);
> >> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> >> +                              const struct drm_display_mode *mode);
> >>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> >>
> >>   #else
> >> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
> >>   {
> >>   }
> >>
> >> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
> >> +                                            const struct drm_display_mode *mode)
> >> +{
> >> +       return false;
> >> +}
> >> +
> >> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> >> +                                            const struct drm_display_mode *mode)
> >> +{
> >> +       return false;
> >> +}
> >> +
> >>   static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
> >>   {
> >>          return false;
> >> --
> >> 2.39.2
> >>
> >
> >



-- 
With best wishes
Dmitry
