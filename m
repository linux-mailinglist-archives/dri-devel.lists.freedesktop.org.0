Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C462A06505
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078D10E105;
	Wed,  8 Jan 2025 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E597UIfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AD010E105
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 19:03:49 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-84ceaf2667aso4812539f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 11:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736362968; x=1736967768; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jlshKN5Gn8cp8iVZ5vNpFSVdJvIsZlNt8r7MKOIYXsU=;
 b=E597UIfMlk138MHh06ve7cnE3KMEJgRM95ogl90Eed7ta+rIJjykheFnvWrqi5i0QT
 Raf8F56EcxYiOn6GE2PWxDp0U+tcqErHKAg/imS4jyg1ThLUWT/oS0r34V+j4uOGq1yg
 C+MnM25F560bz9yLxcVOJjErA6Pw5hILygI5C3UTYhVm9CUgReJlmrs53bPUwarWbd9H
 cxs7eLyKdd/ib8Hgw6bP5FJZXGU1BJ1tXuEjD8Fdfjf5hyzG4gD+pIYjB/azoKqRmQhD
 C8Sfp38sHyLzqBgK+Ku8W97qfBSFdv+GaJrOrXnbCVCKJS0UCdq8ZaGCSxCT4OWRdZSs
 /p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736362968; x=1736967768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jlshKN5Gn8cp8iVZ5vNpFSVdJvIsZlNt8r7MKOIYXsU=;
 b=wo1ysnjQ9ptUmHVLbGdG0J/lTib55+w+xAIeOYzTMUg+WNQ96AT00iL+nUcyH6+pAZ
 3S4eyDS4CCBptzhM6ZH/HyILconOL9FefA0MhkbCWyv+9vlNhukYoVzOHHTAiujzyo7U
 LjrKfMViDuzKuJUZH5KAt3BzNFUFF/C/VTk0uLOZldRH9TBRzQm+CPMnj7xQyVG+5abz
 GHlyhK0c+oBZ9ReXZeFs7QY9nhgWp9jDnm0U5z1RnQvTnAGspqupGqS+yIQFrGkqMvEr
 DTvOYRpsx6TVc0+izUCWq4m5Z3vwxwtf5XCezN0xbhC2mORwAUvMiu/FYiwtFupmsLyR
 cY1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/gyit3KS/bEcvG4D0axsLtbfg9g3t8mq5mp+lQRRy2oSDvmpAjPLcrKTEaTRDXwBmv3Yc1r9dl90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFf3/HKftcYAgcHWP98muM9B+ZoxCfmG+1viyw8KmK+636vmJ/
 CG41tjK6FT3Yi/BRTn0+mkmSpp03RgzVz8+ztrtioUV+hH9vk9IYc7w4Mg6DbBrFXmwRl/WzOxh
 9eWrMIlFOG5e8nfL/TueyY+rXm/OMQ5FcG2YKquKnEP0VryHE
X-Gm-Gg: ASbGnctp5N4Z+TnynDQqW1Uv9X9dbOa5q/gc+wBen6jGQzXmp2NxNn7iR2UswSCKtSw
 zlQtRRqUOb/fSEEXyBTvICRLyb40ATdze0Lrc91BXw5iS4t/+VJAR
X-Google-Smtp-Source: AGHT+IGCQKYuDks36lEW7LfUR0RTlFnjVtPyV5b1DfwCfISBtLKMZR4JarGq4WzUUljFPWnd4OgrkeNSFJt4Zl0kPcM=
X-Received: by 2002:a05:690c:b98:b0:6ef:5ab8:2c53 with SMTP id
 00721157ae682-6f5312372e9mr29504387b3.19.1736362527823; Wed, 08 Jan 2025
 10:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <Z368DnfCrpYOPbav@phenom.ffwll.local>
In-Reply-To: <Z368DnfCrpYOPbav@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 Jan 2025 20:55:15 +0200
X-Gm-Features: AbW1kvYkDuo0fgTyjfi9JWk1Z4qEJORC7SkYtKmOVmKhmXayQkiFPInip7x-ydo
Message-ID: <CAA8EJppDB-LTiUF1_-2gX8DjGC99Xze9OFFJZEn0VwaJBAAMpQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: Simona Vetter <simona.vetter@ffwll.ch>
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

On Wed, 8 Jan 2025 at 19:55, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Sun, Dec 22, 2024 at 07:00:46AM +0200, Dmitry Baryshkov wrote:
> > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > Perform corresponding check before calling the drm_atomic_helper_check()
> > function.
> >
> > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> >  drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> >  5 files changed, 77 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> >       cstate->num_mixers = num_lm;
> >  }
> >
> > +/**
> > + * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > + * @drm_enc:    Pointer to drm encoder structure
> > + * @crtc_state:      Corresponding CRTC state to be checked
> > + * @conn_state: Corresponding Connector's state to be checked
> > + *
> > + * Check if the changes in the object properties demand full mode set.
> > + */
> > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > +                                     struct drm_crtc_state *crtc_state,
> > +                                     struct drm_connector_state *conn_state)
> > +{
> > +     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +     struct msm_display_topology topology;
> > +
> > +     DPU_DEBUG_ENC(dpu_enc, "\n");
> > +
> > +     /* Using mode instead of adjusted_mode as it wasn't computed yet */
> > +     topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > +
> > +     if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > +             crtc_state->mode_changed = true;
> > +     else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > +             crtc_state->mode_changed = true;
> > +
> > +     return 0;
> > +}
> > +
> >  static int dpu_encoder_virt_atomic_check(
> >               struct drm_encoder *drm_enc,
> >               struct drm_crtc_state *crtc_state,
> > @@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
> >
> >       topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> >
> > -     if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > -             crtc_state->mode_changed = true;
> > -     else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > -             crtc_state->mode_changed = true;
> >       /*
> >        * Release and Allocate resources on every modeset
> >        */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index 92b5ee390788d16e85e195a664417896a2bf1cae..da133ee4701a329f566f6f9a7255f2f6d050f891 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -88,4 +88,8 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
> >
> >  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
> >
> > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > +                                     struct drm_crtc_state *crtc_state,
> > +                                     struct drm_connector_state *conn_state);
> > +
> >  #endif /* __DPU_ENCODER_H__ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index dae8a94d3366abfb8937d5f44d8968f1d0691c2d..e2d822f7d785dc0debcb28595029a3e2050b0cf4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -446,6 +446,31 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
> >       pm_runtime_put_sync(&dpu_kms->pdev->dev);
> >  }
> >
> > +static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
> > +{
> > +     struct drm_crtc_state *new_crtc_state;
> > +     struct drm_connector *connector;
> > +     struct drm_connector_state *new_conn_state;
> > +     int i;
> > +
> > +     for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> > +             struct drm_encoder *encoder;
> > +
> > +             WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
> > +
> > +             if (!new_conn_state->crtc || !new_conn_state->best_encoder)
> > +                     continue;
> > +
> > +             new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> > +
> > +             encoder = new_conn_state->best_encoder;
> > +
> > +             dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
> >  {
> >       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> > @@ -1049,6 +1074,7 @@ static const struct msm_kms_funcs kms_funcs = {
> >       .irq             = dpu_core_irq,
> >       .enable_commit   = dpu_kms_enable_commit,
> >       .disable_commit  = dpu_kms_disable_commit,
> > +     .check_mode_changed = dpu_kms_check_mode_changed,
> >       .flush_commit    = dpu_kms_flush_commit,
> >       .wait_flush      = dpu_kms_wait_flush,
> >       .complete_commit = dpu_kms_complete_commit,
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> > index a7a2384044ffdb13579cc9a10f56f8de9beca761..364df245e3a209094782ca1b47b752a729b32a5b 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -183,10 +183,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
> >
> >  int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
> >  {
> > +     struct msm_drm_private *priv = dev->dev_private;
> > +     struct msm_kms *kms = priv->kms;
> >       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> >       struct drm_crtc *crtc;
> > -     int i;
> > +     int i, ret = 0;
> >
> > +     /*
> > +      * FIXME: stop setting allow_modeset and move this check to the DPU
> > +      * driver.
> > +      */
>
> I guess there's more work to stop setting allow_modeset? Or was the issue
> there that it breaks userspace that expects ctm changes to be doable
> without modesets?

Yes. And I currently have no way to check that userspace, so for me
it's easier to add a TODO rather than to risk breaking it.
And with your patch going in I think we should add a check that the
allow_modeset flag hasn't been tampered with.

>
> Either way msm patches lgtm, but don't feel confident enough for acks
> except on the first one that reworks the active_change logic to use
> crtc->enable instead for resource allocation.
> -Sima
>
> >       for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
> >                                     new_crtc_state, i) {
> >               if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
> > @@ -196,6 +202,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
> >               }
> >       }
> >
> > +     if (kms && kms->funcs && kms->funcs->check_mode_changed)
> > +             ret = kms->funcs->check_mode_changed(kms, state);
> > +     if (ret)
> > +             return ret;
> > +
> >       return drm_atomic_helper_check(dev, state);
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index e60162744c669773b6e5aef824a173647626ab4e..ec2a75af89b09754faef1a07adc9338f7d78161e 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -59,6 +59,13 @@ struct msm_kms_funcs {
> >       void (*enable_commit)(struct msm_kms *kms);
> >       void (*disable_commit)(struct msm_kms *kms);
> >
> > +     /**
> > +      * @check_mode_changed:
> > +      *
> > +      * Verify if the commit requires a full modeset on one of CRTCs.
> > +      */
> > +     int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
> > +
> >       /**
> >        * Prepare for atomic commit.  This is called after any previous
> >        * (async or otherwise) commit has completed.
> >
> > --
> > 2.39.5
> >
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
With best wishes
Dmitry
