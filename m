Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E126F8A2109
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEDC10F3B2;
	Thu, 11 Apr 2024 21:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lOZPY0+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FDC10F3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:43:04 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6164d7a02d2so2293767b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712871783; x=1713476583; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6bYuYlDD4bikRNQjIGcc6KvKj6VbfxrQTctYAm5dxiY=;
 b=lOZPY0+aZ7oALTCzVTGsngiKrfpd82qGRzCALLAPeL7EjmhCyQedRaAJwiFdU9Rdua
 uxZToK+8VrjIKhs4PMTPfxEi5hq4vwuxa2h16aViBqnC7NTWysw2eI4+9XnP7yzBj7Dl
 7a0ThMyoyw6lnTHjCXqonEwWwv4NzgCqlYVmgCYDt+4LMhKBR77zUsIJZidss6u3RdeH
 FEESgZc2JDXgxd03rqyypgrVsgaCg7sia/u6B1h5aKQjplqbmxOLy0nP2b8yBkPx78H2
 vYyxrTHIrtko5IGloDBqDKzUgaO4AXHM2PgPTB7LgeOnpkT5yPt2GhGn5ciufsCVzO+p
 c/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712871783; x=1713476583;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bYuYlDD4bikRNQjIGcc6KvKj6VbfxrQTctYAm5dxiY=;
 b=nKclIZcf7nthsvTf63wlck5pXo+AFX8T9pc063ryzS5kPjDhVsbzOxodk6o+vz1Ijh
 Q63y1Qtic29/cL2nBmgId5sUiFPY0UMERq7ifvLB2elkdKq5vC67BQQ4Sw9cYjTBelVe
 /hQn6rU/zm1gC+VazCoZJ3XXv9CNiH1/Mz3OyhLEpWT7p1d5gS0ivyWX9zMvol06Rksw
 UfRfDhmDOaCOeGhZXi/nGXE7ghgUz+8EKhqnqhpgMFpJMC8nHdBH/2cMN11mANKnDYXU
 rj4Nyl8uslMxoz/HE5/7aCdolo1WW5/+Jk889RiL3INqS00hj0SgiWiqno2aB1CgF8ok
 dM5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdcuegy2SdK7XJRhthHqS7SQt+kfMkGBwBnLDnz5OKmv/cT9rOvyznOW4B+ZvtnVNOjYBSEtvw1l5VarQl+Zo0Lf7kdpJeWwaypjOrDeR/
X-Gm-Message-State: AOJu0YykSmffUFbuAuIppAggiteBRILCYx6d8WsaEc++DuXoN/r6AFBB
 fbMSSV9Uvt51mwxUoriIQuOPthLWfJKIs4pdExhw0HemBpiY+x2b+L3M2Iu43Qy3iA1mujvoOns
 8wS/vRY7RQ5C2wfNRsrMY+Zu3j/7J6yA7MyTzmg==
X-Google-Smtp-Source: AGHT+IHIIfeM2tjeJdKh3NEqxwc+b1swpMUJboe18LxMuQvQu+sEhhsn8QKXrYgchqiyURwLXmYr7Tdlot6jXwNwIRs=
X-Received: by 2002:a25:ba93:0:b0:ddd:705e:a34b with SMTP id
 s19-20020a25ba93000000b00ddd705ea34bmr778897ybg.38.1712871783275; Thu, 11 Apr
 2024 14:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-11-dmitry.baryshkov@linaro.org>
 <ec73ae6f-3a81-70f6-27e7-a94a6794f2d0@quicinc.com>
In-Reply-To: <ec73ae6f-3a81-70f6-27e7-a94a6794f2d0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Apr 2024 00:42:52 +0300
Message-ID: <CAA8EJpq2MufDSsaOEoG0aE7n2-cK_b-cK7FbotVRHEfvxtUCBA@mail.gmail.com>
Subject: Re: [PATCH 10/12] drm/msm: convert msm_format::alpha_enable to the
 flag
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 12 Apr 2024 at 00:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > Instead of having a bool field alpha_enable, convert it to the
> > flag, this save space in the tables and allows us to handle all booleans
> > in the same way.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 12 ++++++-----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 24 ++++++++++-----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  7 +++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  3 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  4 ++--
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 ++-
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  9 ++++----
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 ++-
> >   drivers/gpu/drm/msm/disp/mdp_format.c       |  2 +-
> >   drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
> >   11 files changed, 40 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 9041b0d71b25..201010038660 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -342,7 +342,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> >
> >       /* default to opaque blending */
> >       if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> > -         !format->alpha_enable) {
> > +         !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)) {
> >               blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
> >                       DPU_BLEND_BG_ALPHA_BG_CONST;
> >       } else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
> > @@ -373,8 +373,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> >       lm->ops.setup_blend_config(lm, pstate->stage,
> >                               fg_alpha, bg_alpha, blend_op);
> >
> > -     DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
> > -               &format->pixel_format, format->alpha_enable, blend_op);
> > +     DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%lu blend_op:0x%x\n",
> > +               &format->pixel_format, format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE, blend_op);
> >   }
> >
> >   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > @@ -472,7 +472,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >
> >               format = msm_framebuffer_format(pstate->base.fb);
> >
> > -             if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
> > +             if (pstate->stage == DPU_STAGE_BASE &&
> > +                 format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
> >                       bg_alpha_enable = true;
> >
> >               set_bit(pstate->pipe.sspp->idx, fetch_active);
> > @@ -495,7 +496,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >               for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> >                       _dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> >
> > -                     if (bg_alpha_enable && !format->alpha_enable)
> > +                     if (bg_alpha_enable &&
> > +                         !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE))
> >                               mixer[lm_idx].mixer_op_mode = 0;
> >                       else
> >                               mixer[lm_idx].mixer_op_mode |=
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > index baf0fd67bf42..de9e93cb42c4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > @@ -36,7 +36,6 @@ bp, flg, fm, np)                                                          \
> >   {                                                                         \
> >       .pixel_format = DRM_FORMAT_ ## fmt,                               \
> >       .fetch_type = MDP_PLANE_INTERLEAVED,                              \
> > -     .alpha_enable = alpha,                                            \
> >       .element = { (e0), (e1), (e2), (e3) },                            \
> >       .bpc_g_y = g,                                                     \
> >       .bpc_b_cb = b,                                                    \
> > @@ -46,7 +45,9 @@ bp, flg, fm, np)                                                          \
> >       .unpack_count = uc,                                               \
> >       .bpp = bp,                                                        \
> >       .fetch_mode = fm,                                                 \
> > -     .flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> > +     .flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> > +             (alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
> > +             flg,                                                      \
>
> In the previous two patches where the same thing was done for
> unpack_tight and unpack_align_msb, it was different in the sense that
> just on the basis of which macro we were choosing we knew the value of
> those flags so you could just unconditionally OR those flags.
>
> But for alpha, you are performing a conditional before ORing this so I
> think for this leaving it as a bool is cleaner.

Ack

-- 
With best wishes
Dmitry
