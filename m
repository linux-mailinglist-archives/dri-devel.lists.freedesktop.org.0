Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70994A02093
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF9810E5AF;
	Mon,  6 Jan 2025 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WzXJw9VU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEADD10E5AE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 08:22:55 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e549a71dd3dso3505672276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 00:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736151715; x=1736756515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/k2t8woJUb/meMdwAxlR+FqFbADBG5aadfc8KxHezWI=;
 b=WzXJw9VUl2Kyc5yEjPtnk6YLFFZm4fv5vTah5d9lUEb1qIPTTvfoQ2uLob5EwbZif3
 b90IHRQr9aAwrPwJyndY+xkk4zqGszTHavfy1WP4inbJyLgulGmEyMfl56M5ps5Fam3u
 h/LoGFMs9xvaocLfixPovsBoCLwvSGJKGg+q2D5WEyr+Z9kcjkiIW9xHYUA0qtKPySVf
 2wE767AjE0hKUPesZtwoNvkNfKJvv/n9rpyE0StZxYN/g/zKKmuOzw6JgoY25vtMIM8+
 GloXF+nJnr86qSoHWh3l8BaVdA581bkhchOTWZYHkTxKmL/KEA+/QeBIL9xVcZiSqZXe
 ImsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736151715; x=1736756515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/k2t8woJUb/meMdwAxlR+FqFbADBG5aadfc8KxHezWI=;
 b=mtLW1M6btA9I3E86dvxzCSFiCaTMhiu6f20sa2hvBYgdm6NpaSrilYBAChJpGhIS0G
 QU3KJhPs8uauM4cOoQ1CsEhQswn4CQbTFTv7aIndaX32ipAW4yvLL9cBHdqH2uJj5WR5
 gddRg+zKfOPHZ3iRdODYXWOUrF68Fhl3yemF5yWmEbb/PQKgtNLl2LZ393JcBDW4br2K
 Ye/jI8OmarYSEBbPbwks315fhgAngsaM+f3OXIUOuZukj9Pjj+z6ou/XHtfhXId/g7t8
 PhT5dEoOcUW2jVoPSADdmXvNF9UFfefPDHvr4kfLYzI2wuof2Kajh/60+eyKXpVJrA5D
 pcWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXudvWmgX7e6uGI0Z+snOM3uohoAx7WHZwUGGWnFBXvMBaXWLLQokfjc+cq37ajLVbcRA3qm5KXoew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywSJTR08taJTEfeMHmf6+CyuktSoGgxHrmGvE8I7oMzETo+LqR
 E0svRmOcWy1lUYD3M45BWYBmQmmuinGGG44K+uYj0/F/pSbtHoATHWccSSFLVIJBwDNs9YQlB/c
 1S7m1tS3n+ucudQCnyS5MZWmzmimbvS1oh+dzvA==
X-Gm-Gg: ASbGncuUOGBAqPVQazyqUTOIrIycnq/l5n+9usNrELtfHRqhFBZoHUyBRrj87edUyBX
 pKKdt19PYF4VHtYoUB9ChfcCFr/egBYK2ICa0WA==
X-Google-Smtp-Source: AGHT+IFHUi70Kl+eoXF3pHbYJUMhwbBv092Ql17O/MOmuvFAOFRwHxNnkyfpzayfoS4/N116WsV+XE7a8BaHR5TB6rI=
X-Received: by 2002:a05:690c:350a:b0:6ef:668a:e55b with SMTP id
 00721157ae682-6f3f8110613mr452449597b3.15.1736151714946; Mon, 06 Jan 2025
 00:21:54 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
 <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
In-Reply-To: <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 6 Jan 2025 16:21:43 +0800
Message-ID: <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=884=E6=97=A5=E5=91=A8=E5=85=AD 01:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=
=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 07:46=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC =
are
> > > > enabled. We prefer to use 4 pipes for dual DSI case for it is power=
 optimal
> > > > for DSC.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++=
++++++------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> > > >  7 files changed, 30 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index bad75af4e50ab..3c51c199f3e05 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc =
*crtc,
> > > >               struct dpu_crtc_state *crtc_state)
> > > >  {
> > > >       struct dpu_crtc_mixer *m;
> > > > -     u32 crcs[CRTC_DUAL_MIXERS];
> > > > +     u32 crcs[CRTC_QUAD_MIXERS];
> > > >
> > > >       int rc =3D 0;
> > > >       int i;
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.h
> > > > index d1bb3f84fe440..ce41fb364f3db 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> > > >
> > > >       bool bw_control;
> > > >       bool bw_split_vote;
> > > > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > > > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> > > >
> > > >       uint64_t input_fence_timeout_ns;
> > > >
> > > > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
> > > >
> > > >       /* HW Resources reserved for the crtc */
> > > >       u32 num_mixers;
> > > > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > > > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> > > >
> > > >       u32 num_ctls;
> > > > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > > > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> > > >
> > > >       enum dpu_crtc_crc_source crc_source;
> > > >       int crc_frame_skip_count;
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > index 96d06db3e4be5..6e54ddeaffacd 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > @@ -54,7 +54,7 @@
> > > >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> > > >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> > > >
> > > > -#define MAX_CHANNELS_PER_ENC 2
> > > > +#define MAX_CHANNELS_PER_ENC 4
> > > >
> > > >  #define IDLE_SHORT_TIMEOUT   1
> > > >
> > > > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >
> > > >       /* Datapath topology selection
> > > >        *
> > > > -      * Dual display
> > > > +      * Dual display without DSC
> > > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > >        *
> > > > +      * Dual display with DSC
> > > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > > > +      *
> > > >        * Single display
> > > >        * 1 LM, 1 INTF
> > > >        * 2 LM, 1 INTF (stream merge to support high resolution inte=
rfaces)
> > > >        *
> > > >        * Add dspps to the reservation requirements if ctm is reques=
ted
> > > >        */
> > > > +
> > > >       if (intf_count =3D=3D 2)
> > > >               topology.num_lm =3D 2;
> > > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encode=
r_get_topology(
> > > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > > >                * this is power optimal and can drive up to (includi=
ng) 4k
> > > >                * screens
> > > > +              * But for dual display case, we prefer 4 layer mixer=
s. Because
> > > > +              * the resolution is always high in the case and 4 DS=
Cs are more
> > > > +              * power optimal.
> > > >                */
> > > > -             topology.num_dsc =3D 2;
> > > > -             topology.num_lm =3D 2;
> > > > -             topology.num_intf =3D 1;
> > > > +
> > > > +             if (intf_count =3D=3D 2) {
> > > > +                     topology.num_dsc =3D 4;
> > > > +                     topology.num_lm =3D 4;
> > > > +                     topology.num_intf =3D 2;
> > > > +             } else {
> > > > +                     topology.num_dsc =3D 2;
> > > > +                     topology.num_lm =3D 2;
> > > > +                     topology.num_intf =3D 1;
> > >
> > > Why is it only enabled for the DSC case? Also I'd like to point out
> > > platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> > > condition here needs more work to work with those platforms too.
> >
> > Because the DSC + quad-pipe is assumed with wide LCD case that dual
> > pipe can not handle due to width limitation. If DSC is not involved, th=
e
> > resolution is not too big to involve DSC together with 2 interfaces. Do=
 you
> > think there is need to support quad-pipe without DSC?
>
> Yes, of course. The same logic: ultra wide resolutions. If two LMs are
> not enough for the panel / monitor.
>
> >
> > Of course, it is a valid case to use 2 DSC with 2 interfaces. Below log=
ic shall
> > be better.
> >
> >    if (intf_count =3D=3D 2) {
> >            topology.num_dsc =3D dpu_kms->catalog->dsc_count >=3D 4 ? 4 =
: 2;
> >            topology.num_lm =3D topology.num_dsc;
> >            topology.num_intf =3D 2;
> >    } else {
> >            topology.num_dsc =3D 2;
> >            topology.num_lm =3D 2;
> >            topology.num_intf =3D 1;
> >    }
>
> It all starts to look like a collection of use-case quirks. But indeed,
> it should work.
>
> >
> > >
> > > > +             }
> > > >       }
> > > >
> > > >       return topology;
> > > > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(s=
truct dpu_encoder_phys *phys_enc)
> > > >       struct dpu_hw_mixer_cfg mixer;
> > > >       int i, num_lm;
> > > >       struct dpu_global_state *global_state;
> > > > -     struct dpu_hw_blk *hw_lm[2];
> > > > -     struct dpu_hw_mixer *hw_mixer[2];
> > > > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> > > >       struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> > > >
> > > >       memset(&mixer, 0, sizeof(mixer));
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > > index 63f09857025c2..d378a990cc0fb 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encode=
r_helper_get_3d_blend_mode(
> > > >
> > > >       /* Use merge_3d unless DSC MERGE topology is used */
> > > >       if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
> > > > -         dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> > > > +         (dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS ||
> > > > +             dpu_cstate->num_mixers =3D=3D CRTC_QUAD_MIXERS) &&
> > >
> > > Misaligned. Also isn't it enough to check that num_mixers !=3D 1?
> >
> > Yeah, num_mixers !=3D 1 should work.
> > >
> > > >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> > > >               return BLEND_3D_H_ROW_INT;
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > > index 3ab79092a7f25..d9cc84b081b1f 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > > @@ -25,6 +25,7 @@
> > > >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> > > >
> > > >  #define CRTC_DUAL_MIXERS     2
> > >
> > > Do we still need this define?
> > >
> > > > +#define CRTC_QUAD_MIXERS     4
> > > >
> > > >  #define MAX_XIN_COUNT 16
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > index 27ef0771da5d2..1fe21087a141a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > @@ -33,8 +33,8 @@
> > > >  #endif
> > > >
> > > >  #define STAGES_PER_PLANE             2
> > > > -#define PIPES_PER_PLANE                      2
> > > >  #define PIPES_PER_STAGE                      2
> > > > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * S=
TAGES_PER_PLANE)
> > >
> > > This is incorrect.
> > >
> > > >  #ifndef DPU_MAX_DE_CURVES
> > > >  #define DPU_MAX_DE_CURVES            3
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct =
drm_plane *plane)
> > > >               trace_dpu_plane_disable(DRMID(plane), false,
> > > >                                       pstate->pipe[i].multirect_mod=
e);
> > > >
> > > > -             if (pipe->sspp && i =3D=3D 1) {
> > > > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SS=
PP_RECT_1) {
> > >
> > > Separate change, please. Also I'm not sure how does that work with th=
e
> > > shared SSPP case that I pointed to in one of the previous replies.
> >
> > Maybe we can add a peer member in the pipe to reference each other, the=
n we have
> > chance to use multirect across all pipes in all planes.
>
> I'd rather not. We have pairs of pipes. I'd rather see the code stay the
> same way: processing one pair at the same time.

I mean only use the peer only when the SSPP multi-rect pips cross
planes. This shall not change
too much to current SSPP management.
>
> >
> >
> > >
> > > >                       pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > >                       pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > >
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
