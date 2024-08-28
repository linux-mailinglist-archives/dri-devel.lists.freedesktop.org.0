Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9172E96309D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 21:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50CB10E5A2;
	Wed, 28 Aug 2024 19:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jmd5xltA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CA610E5A2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 19:01:18 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-690e9001e01so66560667b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724871677; x=1725476477; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mYzFfi1Ev8FYH7LbPgUAbnhfyZJ/W0bJypa32oGuPbA=;
 b=Jmd5xltAGr2Rj12/qeqJYs5GBdx4/IMbOXEodMLLkDZYt7CieZ3kgOVc9AYYD2jtlc
 xMhAs4arE4o5LcUNgDWLpzwCXEqhS9ohDRWJHuJS/CgGaaW/inDxBn3zX1mOq5qanYH3
 Udms1wKGxqGxW8gwPHyi+UnhbUW6US1RzD04tzN8bpgSXPJ4tlxkHNUtvAukjhPcEdyw
 0PUziOH9m1VAPkbAXdvgLHbUcTfb/E7LAdwFqhiZYhQ0rXO3gx6t4i7NV3z7bxXsOh+J
 2YIEIg6k+Ftfh8AEYlVk23e6gsQRrZPxmT1UIdb1jPLT+C8oAqQ8FrvYZBsqCR9VgE/E
 Rw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724871677; x=1725476477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mYzFfi1Ev8FYH7LbPgUAbnhfyZJ/W0bJypa32oGuPbA=;
 b=QxPzEpos//Qi0OmmpJdg1qts46EPibsUSGE0Oq0OMYMJelRcKSWUyuYmZfo8Li9pZm
 m1y19krGI+VRIVILMgcVAugoyKnaH+0PNO9QUTgQboPqQK9E8a2Xhe0PxStHSYeCI8DS
 FOuwUclVz9Ki61oA0uqQmkUBpjZBaztY2cg9rsuhHGrjB0GhaNOoOBMl8FR32ekVPz35
 aQgMsTgPoU9Wga7Na4gcfX/zr/wzhnzXQ68/Q1C/V1djzHpZEvaMv2NGYXMB3n+LrasH
 pGKEUvuHOq949jko/bQ5iqPgNZIHxwSDbJYKSUCahU6as+OxIwYazTCE7wNklQSFVfs7
 N5XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlfvVjEnSj6escPyFVUn+cfU0mPzHhAVoexRe381BSsbNaFnnVWOEGrP33crsSItYWWgauoQWT03g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoR15FB2iS1EnhFB9XFm7Qnp9xffwTGX07GzDPMSyV30dEvSsA
 VIiRF00ok9XOEhopKHPsqGF/EL1ny21lLo6rmitNjQBRFeDsR2HVhKODzjdrJiyl9xPOSSf6qCr
 9eONY3pm/Af2MB83URkp1rrtns9BDvCDFoImQMV0sKaZaTTEV
X-Google-Smtp-Source: AGHT+IGJYJaiyppejd5ObRamMazn56n61yTMuG6h2FkwRazQCApHZZ81rdnAm3LStaOt9Ioz5dEdwp3A+3m9uphydGA=
X-Received: by 2002:a05:690c:3391:b0:6b5:71b2:13da with SMTP id
 00721157ae682-6d277777516mr3672957b3.32.1724871676826; Wed, 28 Aug 2024
 12:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
 <cd60db7e-4ff2-445e-a8f8-b22d73d0f2b3@quicinc.com>
 <CAA8EJpqzu0E=Cj+FpdjXdvterkPeXqwz_GFsut9jLaOawQTRjw@mail.gmail.com>
 <5ce9489c-6fb4-435c-b461-e1774817218f@quicinc.com>
In-Reply-To: <5ce9489c-6fb4-435c-b461-e1774817218f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 22:01:06 +0300
Message-ID: <CAA8EJpqgR0i5VC0eNhi6G1gcnuxk6gtUmEhkT9sm=81Q3HPfEg@mail.gmail.com>
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

On Tue, 27 Aug 2024 at 23:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/16/2024 4:06 PM, Dmitry Baryshkov wrote:
> > On Wed, 17 Jul 2024 at 01:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> >>> Historically CRTC resources (LMs and CTLs) were assigned in
> >>> dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
> >>> resource tracking to crtc state") simply moved resources to
> >>> struct dpu_crtc_state, without changing the code sequence. Later on the
> >>> commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
> >>> modeset") rearanged the code, but still kept the cstate->num_mixers
> >>> assignment to happen during commit phase. This makes dpu_crtc_state
> >>> inconsistent between consequent atomic_check() calls.
> >>>
> >>> Move CRTC resource assignment to happen at the end of
> >>> dpu_encoder_virt_atomic_check().
> >>>
>
> I just realized, why is the subject saying
> dpu_encoder_virt_atomic_mode_set while the patch is moving the
> assignment to dpu_encoder_virt_atomic_check(). It should say
> dpu_encoder_virt_atomic_check().

Ack

>
> One more commment below.
>
> >>> Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
> >>>    2 files changed, 39 insertions(+), 24 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> index 9f2164782844..7399794d75eb 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>> @@ -1094,9 +1094,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >>>        drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> >>>                dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
> >>>
> >>> -     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> >>> -     cstate->num_mixers = 0;
> >>> -
> >>
> >> Any reason this part was removed?
> >>
> >> I think we still need this part.
> >>
> >> In dpu_encoder_get_topology(), we do not assign topology.num_lm based on
> >> state parameters, its based on catalog and intf_count which are decided
> >> at init time itself.
> >>
> >> Which means cstate->num_mixers will remain at a non-zero value even if
> >> we have NO_MODE which is what happens when we are disabling the CRTC
> >> during suspend or hotplug.
> >
> > In the disable path the driver calls dpu_rm_release(), releasing all
> > resources. So there will be no assigned mixers, which matches num_lm =
> > 0 in dpu_encoder_assign_crtc_resources().
> >
>
> Ack.
>
> >>
> >>>        /* disable clk & bw control until clk & bw properties are set */
> >>>        cstate->bw_control = false;
> >>>        cstate->bw_split_vote = false;
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> index 7613005fbfea..98f3a8d84300 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> @@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >>>        return topology;
> >>>    }
> >>>
> >>> +static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> >>> +                                           struct drm_encoder *drm_enc,
> >>> +                                           struct dpu_global_state *global_state,
> >>> +                                           struct drm_crtc_state *crtc_state)
> >>> +{
> >>> +     struct dpu_crtc_state *cstate;
> >>> +     struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>> +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> >>> +     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> >>> +     int num_lm, num_ctl, num_dspp, i;
> >>> +
> >>> +     cstate = to_dpu_crtc_state(crtc_state);
> >>> +
> >>> +     memset(cstate->mixers, 0, sizeof(cstate->mixers));
> >>> +
> >>> +     num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> +             drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>> +     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> +             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> >>> +     num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> +             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> >>> +             ARRAY_SIZE(hw_dspp));
> >>> +
> >>> +     for (i = 0; i < num_lm; i++) {
> >>> +             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> >>> +
> >>> +             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> >>> +             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> >>> +             if (i < num_dspp)
> >>
> >> Will there be a case where num_lm != num_dspp?
> >
> > No, _dpu_rm_check_lm_and_get_connected_blks() makes sure that num_lm = num_dspp.
> > I will drop this condition and add a comment.
> >
> >>
> >>> +                     cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> >>> +     }
> >>> +
> >>> +     cstate->num_mixers = num_lm;
> >>> +}
> >>> +
> >>>    static int dpu_encoder_virt_atomic_check(
> >>>                struct drm_encoder *drm_enc,
> >>>                struct drm_crtc_state *crtc_state,
> >>> @@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
> >>>                                        drm_enc, crtc_state, topology);
> >>>        }
> >>>
> >>> +     if (!ret)
> >>> +             dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
> >>> +
>
> Do we need to protect this with a needs_modeset() condition? Like why
> should this get called every check?

Sounds like a good idea.

>
> >>>        trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> >>>
> >>>        return ret;
> >>> @@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>        struct dpu_encoder_virt *dpu_enc;
> >>>        struct msm_drm_private *priv;
> >>>        struct dpu_kms *dpu_kms;
> >>> -     struct dpu_crtc_state *cstate;
> >>>        struct dpu_global_state *global_state;
> >>>        struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >>>        struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >>> -     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> >>> -     struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> >>>        struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> >>> -     int num_lm, num_ctl, num_pp, num_dsc;
> >>> +     int num_ctl, num_pp, num_dsc;
> >>>        unsigned int dsc_mask = 0;
> >>>        int i;
> >>>
> >>> @@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>                ARRAY_SIZE(hw_pp));
> >>>        num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>>                drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >>> -     num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> -             drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> >>> -     dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> >>> -             drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
> >>> -             ARRAY_SIZE(hw_dspp));
> >>>
> >>>        for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >>>                dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> >>> @@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >>>                dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> >>>        }
> >>>
> >>> -     cstate = to_dpu_crtc_state(crtc_state);
> >>> -
> >>> -     for (i = 0; i < num_lm; i++) {
> >>> -             int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> >>> -
> >>> -             cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> >>> -             cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> >>> -             cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
> >>> -     }
> >>> -
> >>> -     cstate->num_mixers = num_lm;
> >>> -
> >>>        dpu_enc->connector = conn_state->connector;
> >>>
> >>>        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
