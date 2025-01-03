Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCCA00BAF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 16:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2743610E02A;
	Fri,  3 Jan 2025 15:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BoB7t7RI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2094310E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 15:50:20 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e53537d8feeso15535462276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 07:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735919359; x=1736524159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liHK2+uQ/jW5u+iONCOSxqMJFLkEJGJyuYbPMxYCGfM=;
 b=BoB7t7RI1C1M8Kl8Bp9Zk4SyzHPxZ5vWfuxCPbcez5BGldK02U6ar7u3uS96z1Zol+
 odOMy1CyBIOSO+Upoo7wOHirjTth8jrqdVpRawsvhs4gJk2e+lH9W3Wch2yaWE+Z75Tp
 eKnb8qdo8T1LhWhuW4bSBTEbIkR/LEIIrC+Mp+/sAItriuupeAhgCwy0XELKo60o6NcX
 FlEuUkQKBD3EyH4kWX78z0ZJNfJzHmNi+qZcSlWdt66Wxtr5+elWEph2CebCfq+meNLR
 fJ6X7lnfdyuSazBvX77Fri0eyyDuySlfjfWpKMXl6/tY665UyRP56B/XxHyxaDAZyRTb
 y4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735919359; x=1736524159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liHK2+uQ/jW5u+iONCOSxqMJFLkEJGJyuYbPMxYCGfM=;
 b=wvMc8rV7xnwNplYz+WFZoIvEh5FR3FE4O4ftkmKPL4oB7+wT/FIKreYrtxlgDfXNoU
 dSh5PCso75lYh4A6+/Alq/X6iDwOBsP+KcFMUMw3tmO8G7zctW86GVpEyPHAYsKMJPum
 SpXtme6ML44e09XpjH242wuU7iLOXnyzPJ8xS8hHG5Wg9e+jBcAeisoQC5SDNmaCvbAy
 zGR4s6+BlAmynT4fCAHp3nAzpoH90rqHGfFpMU3LFI5ngjyJ0Wc2QVJcqu45HmeDnQWb
 xXRo4+gaBLxtpKDZ9O0m0YzJTxX5W5rKS99Yri9jin3xJ+0jmWwP59FnNRZFvCDqgHtq
 wDnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWup5QwOANB+3Z9yiPkc0HoLnet3NOs17ANFgRmUIRgb8Ufx8uQtVYIVgVOqw2F7VWZvj8GKBetl7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTKm+CmnjFKrvp0SzOHXXQf3HBCiJKtUpeEHIQ4Ntad4JmhHUS
 4KxUqXmV8ljHIaUmdM1UdlKyLOT+JM/0AJJBrv42zbeKTqqkvjOzVBwHXSof/M37GUpfsJugfF8
 mKFnwhzHjuA1tj89J+f5LUAsTcmtKmvw11r9UMQ==
X-Gm-Gg: ASbGncuuRRWYfsoUiokScYlfvhrDNSSf9plQJhrnZ3OMdxyKb8ySUxqs1OUZn2C6+Gt
 uemY5mrAq52rg+Tw89AXfEgQG99Yt4o11SaL+qPQ=
X-Google-Smtp-Source: AGHT+IHP341a3Glhoebec/iBg+1TPClIJwYbMaeZSLdG2H0oSM4QkjKRRdcfeCchDng3ZFDT0KD37a5a4f3XQ+95vR0=
X-Received: by 2002:a05:690c:25c9:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6f3f81253fcmr386260287b3.15.1735919358957; Fri, 03 Jan 2025
 07:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
In-Reply-To: <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 3 Jan 2025 23:49:07 +0800
Message-ID: <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 07:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > enabled. We prefer to use 4 pipes for dual DSI case for it is power opt=
imal
> > for DSC.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++=
++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> >  7 files changed, 30 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index bad75af4e50ab..3c51c199f3e05 100644
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
> > index d1bb3f84fe440..ce41fb364f3db 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> >
> >       bool bw_control;
> >       bool bw_split_vote;
> > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> >
> >       uint64_t input_fence_timeout_ns;
> >
> > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
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
> >       enum dpu_crtc_crc_source crc_source;
> >       int crc_frame_skip_count;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 96d06db3e4be5..6e54ddeaffacd 100644
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
> > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_ge=
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
> > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >                * 2 DSC encoders, 2 layer mixers and 1 interface
> >                * this is power optimal and can drive up to (including) =
4k
> >                * screens
> > +              * But for dual display case, we prefer 4 layer mixers. B=
ecause
> > +              * the resolution is always high in the case and 4 DSCs a=
re more
> > +              * power optimal.
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
>
> Why is it only enabled for the DSC case? Also I'd like to point out
> platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> condition here needs more work to work with those platforms too.

Because the DSC + quad-pipe is assumed with wide LCD case that dual
pipe can not handle due to width limitation. If DSC is not involved, the
resolution is not too big to involve DSC together with 2 interfaces. Do you
think there is need to support quad-pipe without DSC?

Of course, it is a valid case to use 2 DSC with 2 interfaces. Below logic s=
hall
be better.

   if (intf_count =3D=3D 2) {
           topology.num_dsc =3D dpu_kms->catalog->dsc_count >=3D 4 ? 4 : 2;
           topology.num_lm =3D topology.num_dsc;
           topology.num_intf =3D 2;
   } else {
           topology.num_dsc =3D 2;
           topology.num_lm =3D 2;
           topology.num_intf =3D 1;
   }

>
> > +             }
> >       }
> >
> >       return topology;
> > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struc=
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
> > index 63f09857025c2..d378a990cc0fb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_he=
lper_get_3d_blend_mode(
> >
> >       /* Use merge_3d unless DSC MERGE topology is used */
> >       if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
> > -         dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> > +         (dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS ||
> > +             dpu_cstate->num_mixers =3D=3D CRTC_QUAD_MIXERS) &&
>
> Misaligned. Also isn't it enough to check that num_mixers !=3D 1?

Yeah, num_mixers !=3D 1 should work.
>
> >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> >               return BLEND_3D_H_ROW_INT;
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 3ab79092a7f25..d9cc84b081b1f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -25,6 +25,7 @@
> >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> >
> >  #define CRTC_DUAL_MIXERS     2
>
> Do we still need this define?
>
> > +#define CRTC_QUAD_MIXERS     4
> >
> >  #define MAX_XIN_COUNT 16
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 27ef0771da5d2..1fe21087a141a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -33,8 +33,8 @@
> >  #endif
> >
> >  #define STAGES_PER_PLANE             2
> > -#define PIPES_PER_PLANE                      2
> >  #define PIPES_PER_STAGE                      2
> > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * STAGE=
S_PER_PLANE)
>
> This is incorrect.
>
> >  #ifndef DPU_MAX_DE_CURVES
> >  #define DPU_MAX_DE_CURVES            3
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 57ccb73c45683..b5c1ad2a75594 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_=
plane *plane)
> >               trace_dpu_plane_disable(DRMID(plane), false,
> >                                       pstate->pipe[i].multirect_mode);
> >
> > -             if (pipe->sspp && i =3D=3D 1) {
> > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_R=
ECT_1) {
>
> Separate change, please. Also I'm not sure how does that work with the
> shared SSPP case that I pointed to in one of the previous replies.

Maybe we can add a peer member in the pipe to reference each other, then we=
 have
chance to use multirect across all pipes in all planes.


>
> >                       pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >                       pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
