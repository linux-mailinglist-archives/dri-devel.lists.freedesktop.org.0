Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0B969779
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E210E444;
	Tue,  3 Sep 2024 08:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZIzSbxYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5B310E440
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:42:31 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6d74ff7216eso15226697b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725352951; x=1725957751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/mrX622vzKi3A5Tls417WrDiltDIV6fbRHi06ziRyY=;
 b=ZIzSbxYA8pmqmdpxpmLBG7Wu9183yw6QjjSRbic12K/uCCrFyru8IIciiSzn9y5KbA
 R7p0bJEivsV9SRZRBXc7JnpDjc2XRMJKfzOFq3So16HZZk3eCB+/SV3gOVkww1LHkNGw
 Mprksni4V+Ba2kFtVhhyG8czO9AkKUFyn11LWsZrM5Mb/RWC+3YUOJNVFrqmXvlbHCIB
 FfTgUYiuuLw29Av2nMsADxTSZa9kBgh99JWkoLC4GFbE0Si1b+sOumCzu93EfFxa7BuD
 KbIB6fRO6US+t/Rg/RnLUaLBPyYCGrsVJSTwSP5OpN7rzHvKUBDgeTG+4tLTMRxTwp4H
 8/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725352951; x=1725957751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/mrX622vzKi3A5Tls417WrDiltDIV6fbRHi06ziRyY=;
 b=isuM/YhhKpposJpwnYuKn03gJwy+2Rqk420x+WuSuQy1BwKgWaxCtJ/HQ1rIItDFgK
 HGcAKE8qfOZtEAty7R2qCku/TeLJB1Irf4gVWFw3HpNue9jg3yX30fjG/cYeLeAJ5mDy
 ZkaGjax04XW5h07YDq6xe9Q/sahUwoURfhMCHprAxaRIySYrJAeTi4BnFaR7GaeaOCdI
 iNGJcdyuZ85CK0Fss82iCztV76M50/5l8Z7HVLuPU2pUvNDDAoUfmJZul09tQ1JKQAjZ
 oyLyrQ+IFySJBag2Og9zaEpxwUFEIs/kwQL5XoJ5/WGh1jl9Ei+ju002DgP2Z+5Nztge
 nHUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFFpgAf3ahq7AowbbcEzOPn+rSxxp7rkuzN7rkx5xkCi94PdmF1B6CIsUOnxAuw4XzZa8Nw1CdeX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztEETV4Lx4stM9adAnscpae3aYhCjUotSziLMIangRSJwqwrlr
 33Cp2mcmJILKekKtA+vBV5bWLWuhVEwpJvcWZmIazdQX3R+hmjbpbsTkcG4cKqMxTT3a07iGUB2
 JLBKnX9CPAI9tSOMSRSdhZnbDafR0R5ccJWogwA==
X-Google-Smtp-Source: AGHT+IEiAdbj4FLduYe5iuAiEPo48sVkQb/vb9WqTLElBDOx6SZ98v/BcgjqeHJ5ia7wgrlGOaAExZ2KbJYtwV2Gr2w=
X-Received: by 2002:a05:690c:f89:b0:65f:a0e5:8324 with SMTP id
 00721157ae682-6d40ee57193mr161576607b3.4.1725352949951; Tue, 03 Sep 2024
 01:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-10-bdb05b4b5a2e@linaro.org>
 <CAA8EJppFCVQPFa1-o7T08Bs+vzbykDXwVTOq4=B2LuWJb2gYGw@mail.gmail.com>
 <CABymUCPi-DbPW=Aos=m0mrHj2TgxEy=QNEFpbCsb3srr-qe1Eg@mail.gmail.com>
In-Reply-To: <CABymUCPi-DbPW=Aos=m0mrHj2TgxEy=QNEFpbCsb3srr-qe1Eg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:42:19 +0300
Message-ID: <CAA8EJpqN_r2SCAZ9hSMwn6gNNzcRTyMy_-RJkobk+YN5Oyk1ug@mail.gmail.com>
Subject: Re: [PATCH 10/21] drm/msm/dpu: fix lm number counter for quad-pipe
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 3 Sept 2024 at 10:50, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:17=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Add the case to reserve multiple pair mixer for high resolution
> >
> > I think you already know what is missing here.
>
> Add the case to reserve multiple pair mixer for high resolution. Current
> code only support one pair of mixer usage case. To support quad-pipe
> usage case, multiple pair mixers are needed.

pairs of mixers.
supports
two pairs of mixers

Also the text doesn't describe how that works. It's not obvious from
the patch, one has to read the source to understand what is going on.
Please make it clear.

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 8 +++++++-
> > >  2 files changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 33cfd94badaba..f57725ad494d2 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -54,7 +54,7 @@
> > >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> > >         (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> > >
> > > -#define MAX_CHANNELS_PER_ENC 2
> > > +#define MAX_CHANNELS_PER_ENC 4
> > >
> > >  #define IDLE_SHORT_TIMEOUT     1
> > >
> > > @@ -2029,8 +2029,8 @@ static void dpu_encoder_helper_reset_mixers(str=
uct dpu_encoder_phys *phys_enc)
> > >         struct dpu_hw_mixer_cfg mixer;
> > >         int i, num_lm;
> > >         struct dpu_global_state *global_state;
> > > -       struct dpu_hw_blk *hw_lm[2];
> > > -       struct dpu_hw_mixer *hw_mixer[2];
> > > +       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > +       struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> > >         struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> > >
> > >         memset(&mixer, 0, sizeof(mixer));
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_rm.c
> > > index e219d706610c2..77d7ff789346e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm=
,
> > >                 if (!rm->mixer_blks[i])
> > >                         continue;
> > >
> > > -               lm_count =3D 0;
> > > +               /*
> > > +                * Clear the last bit to drop the previous primary mi=
xer if
> > > +                * fail to find its peer.
> > > +                */
> > > +               lm_count &=3D 0xfe;
> > >                 lm_idx[lm_count] =3D i;
> > >
> > >                 if (!_dpu_rm_check_lm_and_get_connected_blks(rm, glob=
al_state,
> > > @@ -353,6 +357,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > >
> > >                 trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
> > >                                          pp_idx[i] + PINGPONG_0);
> > > +               DPU_DEBUG("reserve lm[%d]:%d, pp_idx[%d]:%d, dspp[%d]=
:%d for enc_id %d\n",
> > > +                         i, lm_idx[i], i, pp_idx[i], i, dspp_idx[i],=
 enc_id);
> > >         }
> > >
> > >         return 0;
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
