Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FE999E8D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2610E9B4;
	Fri, 11 Oct 2024 07:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gCeXKsMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEA410E9B4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:53:04 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e292926104bso103482276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728633183; x=1729237983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UUqU+PKxySD6UwKe0MR1jEiBJiWYwpry3cBhE9hb+gU=;
 b=gCeXKsMqtGUf94OdBrSTR8NcnvHNFb6gzErBonuoET91toM6vJkBKn+Ebew5oZ7UKG
 0MWmb9wk4DnH3GPyA8NUgEVT3JEdtbs0AzjxJRZ5OlHu7JdiIVpbHQgUEfsAKkpw1R0B
 IYpTreFwiC7swRWqTGUl6KSocWeg9VU5qwh+iE7SoN4xa5/dDSUJ7UOIdp+IYkpW4T49
 6+oOc/oUHzJTojzs12ZBqPMGSNMrRVhrkPslIdhu4x8B4CKQ1A68Bstna6zsVBeGbQu2
 xwfbC0iblwhDTs4y2CRU/vYpgilQh7zY+oOSZN2G7oD/eqMfCcu4tgwABBi9SeUZNBp4
 Avtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728633183; x=1729237983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUqU+PKxySD6UwKe0MR1jEiBJiWYwpry3cBhE9hb+gU=;
 b=ktI1sdICYtEcSu1v12+12K4JHWDUq39287WKatE8sMiiQz9gQ3MBg0qj2Vet+U+xVU
 jjMFeT4BNHJzYZkuhlpOIpwmq03jiFTENm6KJLD49eICqTgjRdukKPBis7LbZ0Dbaz+l
 sVIs4/nyyiA1ZC19H7aeq1UK5y0Kvi2qRD4EQnSv6LZY9Y538jyJxJwsUV1yDkGH5kjX
 xLwjdHHPtGYfVWN3TSOPMlaJAwm5R8Ak8edIM2Rt5P50DZM08vDWNwsnqf2aLHtUQwz6
 gfX8I+R7If6NZuFVEgLjSlvXPvX5SqN/NOynl2BfKQE9umdk62IYCPFF5036Kgw1M829
 0+Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVauB6ECV+3toaF1g40n0JfUPffTHige8rOo4StKVvqZTlyACURQlqUZ7PFCzUU6ggmA2aCK1hOf7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTi8DuDVzCIMwTvVDG1r7nCXSWP06l3uGskYQ4VH+RZk5bUotH
 qAwKNNw/io0hG4iFKbU5tPRsTVIUMsvnWKihkLh5Qc9jeBCME0A6FOlAwe157N/oEpVeuTixuUI
 j8kwmHeqEzDN8SY+ko9fWRkMpFaD4XHUUtt97dSPOiexd3EMQ5ti7Lozi
X-Google-Smtp-Source: AGHT+IF8liToNjNEVcdtqk27A6rtj4YN340xtLeE1NEjHhq7p1jvyBR8pSJZ/82qTqssjh3UDcemVLAqlt+bD5ahUbg=
X-Received: by 2002:a05:6902:140d:b0:e28:fec5:cb93 with SMTP id
 3f1490d57ef6-e2919da259amr1198180276.34.1728633183408; Fri, 11 Oct 2024
 00:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-14-76d4f5d413bf@linaro.org>
 <sygn5eco3yn3tsk2urpubh74lt77wdm3pyd5rbhrrp2bl3ro6v@nyjjwhdrlnyp>
In-Reply-To: <sygn5eco3yn3tsk2urpubh74lt77wdm3pyd5rbhrrp2bl3ro6v@nyjjwhdrlnyp>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 15:52:52 +0800
Message-ID: <CABymUCMGXm+dx-zM5wvqwBidiaYeiWgHs=ymvCczzqq8=nF8bg@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 22:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:27PM GMT, Jun Nie wrote:
> > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > enabled. We prefer to use 4 pipes for dual DSI case for it is power opt=
imal
> > for DSC.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++=
++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  6 files changed, 30 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index d2aca0a9493d5..dbdfff1c7792a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crt=
c,
> >               struct dpu_crtc_state *crtc_state)
> >  {
> >       struct dpu_crtc_mixer *m;
> > -     u32 crcs[CRTC_DUAL_MIXERS];
> > +     u32 crcs[CRTC_QUAD_MIXERS];
> >
> >       int rc =3D 0;
> >       int i;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index ee7cf71f89fc7..f8276afd99192 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -211,7 +211,7 @@ struct dpu_crtc_state {
> >
> >       bool bw_control;
> >       bool bw_split_vote;
> > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> >
> >       uint64_t input_fence_timeout_ns;
> >
> > @@ -219,10 +219,10 @@ struct dpu_crtc_state {
> >
> >       /* HW Resources reserved for the crtc */
> >       u32 num_mixers;
> > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> >
> >       u32 num_ctls;
> > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> >
> >       u32 num_dscs;
> >       enum dpu_crtc_crc_source crc_source;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 68655c8817bf8..ed220ac691e8a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -54,7 +54,7 @@
> >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> >
> > -#define MAX_CHANNELS_PER_ENC 2
> > +#define MAX_CHANNELS_PER_ENC 4
> >
> >  #define IDLE_SHORT_TIMEOUT   1
> >
> > @@ -588,15 +588,19 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >       /* Datapath topology selection
> >        *
> > -      * Dual display
> > +      * Dual display without DSC
> >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >        *
> > +      * Dual display with DSC
> > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > +      *
> >        * Single display
> >        * 1 LM, 1 INTF
> >        * 2 LM, 1 INTF (stream merge to support high resolution interfac=
es)
> >        *
> >        * Add dspps to the reservation requirements if ctm is requested
> >        */
> > +
> >       if (intf_count =3D=3D 2)
> >               topology.num_lm =3D 2;
> >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > @@ -615,10 +619,21 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >                * 2 DSC encoders, 2 layer mixers and 1 interface
> >                * this is power optimal and can drive up to (including) =
4k
> >                * screens
> > +              * But for dual display case, we prefer 4 layer mixers. B=
ecause
> > +              * the resolution is always high in the case and 4 DSCs a=
re more
> > +              * power optimal. While a single SSPP can only co-work wi=
th one
> > +              * mixer pair. So 4 mixers are needed in this case.
>
> What is the relationship between SSPP working with a mixer pair and
> high-res using 4 mixers? You have been writing about DSC, then you
> suddently mention SSPP.

Right. Will remove SSPP comment here. Topology is decided by INTF/DSC, and
LM is related directly. No SSPP is related here.

>
> >                */
> > -             topology.num_dsc =3D 2;
> > -             topology.num_lm =3D 2;
> > -             topology.num_intf =3D 1;
> > +
> > +             if (intf_count =3D=3D 2) {
> > +                     topology.num_dsc =3D 4;
> > +                     topology.num_lm =3D 4;
> > +                     topology.num_intf =3D 2;
> > +             } else {
> > +                     topology.num_dsc =3D 2;
> > +                     topology.num_lm =3D 2;
> > +                     topology.num_intf =3D 1;
> > +             }
> >       }
> >
> >       return topology;
> > @@ -2031,8 +2046,8 @@ static void dpu_encoder_helper_reset_mixers(struc=
t dpu_encoder_phys *phys_enc)
> >       struct dpu_hw_mixer_cfg mixer;
> >       int i, num_lm;
> >       struct dpu_global_state *global_state;
> > -     struct dpu_hw_blk *hw_lm[2];
> > -     struct dpu_hw_mixer *hw_mixer[2];
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> >
> >       memset(&mixer, 0, sizeof(mixer));
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index e77ebe3a68da9..c877ee45535ac 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -324,7 +324,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_he=
lper_get_3d_blend_mode(
> >
> >       /* Use merge_3d unless DSC MERGE topology is used */
> >       if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
> > -         dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> > +         (dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS ||
> > +             dpu_cstate->num_mixers =3D=3D CRTC_QUAD_MIXERS) &&
> >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> >               return BLEND_3D_H_ROW_INT;
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index bf86d643887dd..f79ecd409a830 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -25,6 +25,7 @@
> >  #define MAX_IMG_HEIGHT 0x3fff
> >
> >  #define CRTC_DUAL_MIXERS     2
> > +#define CRTC_QUAD_MIXERS     4
> >
> >  #define MAX_XIN_COUNT 16
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index d8f5cffa60ea6..671e03406df74 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -32,9 +32,9 @@
> >  #define DPU_MAX_PLANES                       4
> >  #endif
> >
> > -#define PIPES_PER_PLANE                      2
> >  #define PIPES_PER_LM_PAIR            2
> >  #define LM_PAIRS_PER_PLANE           2
> > +#define PIPES_PER_PLANE                      (PIPES_PER_LM_PAIR * LM_P=
AIRS_PER_PLANE)
> >  #ifndef DPU_MAX_DE_CURVES
> >  #define DPU_MAX_DE_CURVES            3
> >  #endif
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
