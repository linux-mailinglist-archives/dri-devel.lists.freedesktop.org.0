Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801549691B0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 05:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4B510E2B9;
	Tue,  3 Sep 2024 03:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yeXtR1H1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F64810E309
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 03:17:15 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6d6891012d5so16172157b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333434; x=1725938234; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UUufsIJyHoy9RDK1kWaUN/LAKR3GALHApq+wLIQw3+Q=;
 b=yeXtR1H1xBedlYr7JziONuJ0nzTInhdrqTrCWDdjiQpR25GtwH5Mg6n0qO4W05yQDA
 0A7woT3CS5chUx+tseQNcVOhEcT4zSEqclipyMjgcrAhgJqsNws4ya3KG1xFtxbmjHNd
 o0X1QTUE6HgFLe9wxZDmJ+cxBFXrZsRMod9eM16OwHCkOIPdTvihXiDeGIggR80iTSxF
 2RUpbmvl0MfxNxDXwywDe5g5ARZi5XTymqWem4ZL6pqcg5TU8zmao8k+8RRBEXNVLLJZ
 F01yCZ3mWglUIK0f+OcqCNgti1JvFP4kuE5AHmyj3/X2Gnug+P+K8WgqE4ua0PR7Qc+Q
 OLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333434; x=1725938234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUufsIJyHoy9RDK1kWaUN/LAKR3GALHApq+wLIQw3+Q=;
 b=i/TcDmd10U1DL4u2d6O7Xi3Pwchzz203H3TBCjw7OtIJhR/xjuLnZS/VJWTcD784bN
 ziqn0fauctywNBhPH0e8+SJdxJ8yf/V8k0kI5/rS76G5xF8GRQC5FnSLwHAg+Jkqzr0k
 p2L56zmC3txBuo/zJmpdDIZTF1K9sIjo1X2GTxnAw5mJNx2xkR2JBL5kgy/PVzQRxLJ4
 UiokAOlBu5sEwN4T1/1mzTqwz92wDRAa89qYrkQmmEDskbgC3gfYXE5eZOSGgvCTEC4r
 1hYTUL8p4uCf//se1duvOCqON8NQ7bfe7Gi4trbIlwB9qVcXs8zeSMPpZfsQJQ47t+Uv
 PGAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiR1KYvzJwbo46KTn6KVU21wKOVK1nHV74oFeBpZPCEQfJ9fbTuYo8PJC3Vzl9sJs9L/F10M1Ju/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsfdEa68+AxRpZYBAyWl+8OETNeiA7zh8fXN881qpFWTboJA9Y
 t+qA0RYYsI18DwBkn3AuavvQokp+T+IquzzZL194E+vyQx0O1DFwhxDq445AudcjHtse91d5X2E
 GDbd9dh8NLHDB84LOYMCdJKU3PMmCE+Scu3udMA==
X-Google-Smtp-Source: AGHT+IHvvS/9h79ps7+GR2ul1mK14Sytg43Z6RoKgzmCiYkcQPCnUcSjywSaXN7Kh56xMRmxdmT3Z7QwTx6vIsjZmRM=
X-Received: by 2002:a05:690c:ed2:b0:6d3:c673:e57a with SMTP id
 00721157ae682-6d40d987ad8mr129839817b3.5.1725333434116; Mon, 02 Sep 2024
 20:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
 <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
In-Reply-To: <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 06:17:02 +0300
Message-ID: <CAA8EJpr3oz7Rphg-HEJg=4yQuPZeWCs688-QoJwC=EjSArK+-Q@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
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

On Wed, 17 Jul 2024 at 01:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> > Historically CRTC resources (LMs and CTLs) were assigned in
> > dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
> > resource tracking to crtc state") simply moved resources to
> > struct dpu_crtc_state, without changing the code sequence. Later on the
> > commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
> > modeset") rearanged the code, but still kept the cstate->num_mixers
> > assignment to happen during commit phase. This makes dpu_crtc_state
> > inconsistent between consequent atomic_check() calls.
> >
> > Move CRTC resource assignment to happen at the end of
> > dpu_encoder_virt_atomic_check().
> >
> > Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
> >   2 files changed, 39 insertions(+), 24 deletions(-)
> >


> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 7613005fbfea..98f3a8d84300 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >       return topology;
> >   }
> >
> > +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > +                                           struct drm_encoder *drm_enc,
> > +                                           struct dpu_global_state *global_state,
> > +                                           struct drm_crtc_state *crtc_state)
> > +{
> > +     struct dpu_crtc_state *cstate;
> > +     struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> > +     int num_lm, num_ctl, num_dspp, i;
> > +
> > +     cstate = to_dpu_crtc_state(crtc_state);
> > +
> > +     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> > +
> > +     num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +             drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > +     num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > +             ARRAY_SIZE(hw_dspp));
> > +
> > +     for (i = 0; i < num_lm; i++) {
> > +             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > +
> > +             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > +             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > +             if (i < num_dspp)
>
> Will there be a case where num_lm != num_dspp?

And there is one. If DSPPs were not requested at all. I'll handle this
by setting hw_dspp to NULL instead.

>
> > +                     cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> > +     }
> > +
> > +     cstate->num_mixers = num_lm;
> > +}
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >               struct drm_encoder *drm_enc,
> >               struct drm_crtc_state *crtc_state,
> > @@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
> >                                       drm_enc, crtc_state, topology);
> >       }
> >
> > +     if (!ret)
> > +             dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
> > +
> >       trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> >
> >       return ret;
> > @@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >       struct dpu_encoder_virt *dpu_enc;
> >       struct msm_drm_private *priv;
> >       struct dpu_kms *dpu_kms;
> > -     struct dpu_crtc_state *cstate;
> >       struct dpu_global_state *global_state;
> >       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > -     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > -     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> >       struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -     int num_lm, num_ctl, num_pp, num_dsc;
> > +     int num_ctl, num_pp, num_dsc;
> >       unsigned int dsc_mask = 0;
> >       int i;
> >
> > @@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >               ARRAY_SIZE(hw_pp));
> >       num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >               drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > -     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> > -     dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> > -             ARRAY_SIZE(hw_dspp));
> >
> >       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >               dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > @@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> >       }
> >
> > -     cstate = to_dpu_crtc_state(crtc_state);
> > -
> > -     for (i = 0; i < num_lm; i++) {
> > -             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> > -
> > -             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > -             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> > -             cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> > -     }
> > -
> > -     cstate->num_mixers = num_lm;
> > -
> >       dpu_enc->connector = conn_state->connector;
> >
> >       for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >



-- 
With best wishes
Dmitry
