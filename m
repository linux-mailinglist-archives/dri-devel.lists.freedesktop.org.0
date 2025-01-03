Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B4A00E19
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FF710E039;
	Fri,  3 Jan 2025 18:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IOX6GixJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E126910E039
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 18:55:33 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so14716870e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735930472; x=1736535272; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dObIDMQEIEp+rZPwfZYdlA1khpQZ5/9GkKfu84d0u/8=;
 b=IOX6GixJlmxALddMk/8dt+yBe8VIqMNcxOeS9K1kEJQrELtNZaKygy7ZZ1JWlf0cVa
 aV/3COJ0gAM4qOUpnwHOdwfgOcQlyr4tAf+RgU8l8EdP3N7NZNTMv9VKJ4ndT56JC3AN
 IASsv9lEjlpkfsPDscg4wi/NjxSHyzS1AcUGlM+DZofRzVHcOeisrNiMiMTMVsDRVk82
 XtWaMJt8tsNKdcfd8YtWhK5rs4ZQP45wr4mwgNfuXK8Uo4mcTq0FWC4A/VXlDtwciWqg
 yrn5imfcQ3sJfH7hfpGrolMtUBdyHeuatuBdF8x/swE+ECF7tIgbY/MBDmidq3UyfIIi
 xBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735930472; x=1736535272;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dObIDMQEIEp+rZPwfZYdlA1khpQZ5/9GkKfu84d0u/8=;
 b=nUVJrYoYzPv5RTZrJAhXe5EHIy07//oMNI57FmaDebLmV9SFGCP7BjWysBfNF24bYH
 mJhBVeZ0iw/X9w8f38xEOLhAxGlJCnPke84WPm9Yil4mJiZqFee8GyUgcC4XTSryUsHp
 rAhGu2azD6ihLo/QES6ozoLAd8R6q8xT6K6THBvZcRe4SgqYpN+XMjqSLY+8vi4e0F6R
 HcwY61OM6ortLs1/vuxJYmyz1HlU/xE5TqvJq4lOrOphCIqXwHoXfxKXlHR+0bqpBhuk
 fO/4nSC4gTpQPFyeZfAHBMFz2zPrjijqZY93fSzr8yAK6XaVEegGgWBzUk/MELD4/LVP
 SpxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/xT9dKb/87KE8ou/fzY0QWfoFyXns4qbGjJzhl7a6oEFpxOH93WNSwoTvazjcdV31dKgs4Utcg6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt1Ebnacxjzv5a5aVmRBNXuIEH3XmgyVmB5k/UiN9t0yGrsGYz
 S78ZbB1ho3gy098ZiAWLRT3fHcyYB6ahbVE9cHtk1FRjkdsqAafoMLU9msJK3cV1SyxrLDlizcD
 VhIc=
X-Gm-Gg: ASbGncsvooU8UzynYb1/JOohd/QcWIMT7J8MMiRiOQGC+li6QrnxAA5kirh2kebq4PT
 kuS36iNWdwYZYgg34eSdxuwiDjkRPn2o9bwV/t9pY8kVS8MHq3BAEblL9+mKkgiC+WV7U96awVX
 PXeKv1NIUrUp/FLhYXQN3TiLi01heswDuqT15x6mgTHSHBrq+dBjVCdULi+fP0DjaCzbPL9V5dZ
 Y0osLpsD9hzR7b0VCOkipzgvgkFu6zitXDtk7BZEy373rU8uG/ifyJw7wCkx4mysJajrLjF53cT
 sGbvY8LoSSFiCj3qhBENdZezsaYhNST8SqRx
X-Google-Smtp-Source: AGHT+IGeN8u0PJAzpExjRibkmahTcfBWtDliej3Q58szu4tXtcheHuhBGtHO8+3nzP/EoVNTDbPYsQ==
X-Received: by 2002:ac2:4c47:0:b0:542:2139:636a with SMTP id
 2adb3069b0e04-542294432e0mr15089693e87.7.1735926698776; 
 Fri, 03 Jan 2025 09:51:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235fff03sm4238196e87.75.2025.01.03.09.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 09:51:37 -0800 (PST)
Date: Fri, 3 Jan 2025 19:51:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
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

On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年12月20日周五 07:46写道：
> >
> > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > > enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
> > > for DSC.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> > >  7 files changed, 30 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index bad75af4e50ab..3c51c199f3e05 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
> > >               struct dpu_crtc_state *crtc_state)
> > >  {
> > >       struct dpu_crtc_mixer *m;
> > > -     u32 crcs[CRTC_DUAL_MIXERS];
> > > +     u32 crcs[CRTC_QUAD_MIXERS];
> > >
> > >       int rc = 0;
> > >       int i;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > index d1bb3f84fe440..ce41fb364f3db 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> > >
> > >       bool bw_control;
> > >       bool bw_split_vote;
> > > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> > >
> > >       uint64_t input_fence_timeout_ns;
> > >
> > > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
> > >
> > >       /* HW Resources reserved for the crtc */
> > >       u32 num_mixers;
> > > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> > >
> > >       u32 num_ctls;
> > > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> > >
> > >       enum dpu_crtc_crc_source crc_source;
> > >       int crc_frame_skip_count;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 96d06db3e4be5..6e54ddeaffacd 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -54,7 +54,7 @@
> > >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> > >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> > >
> > > -#define MAX_CHANNELS_PER_ENC 2
> > > +#define MAX_CHANNELS_PER_ENC 4
> > >
> > >  #define IDLE_SHORT_TIMEOUT   1
> > >
> > > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >
> > >       /* Datapath topology selection
> > >        *
> > > -      * Dual display
> > > +      * Dual display without DSC
> > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > >        *
> > > +      * Dual display with DSC
> > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > > +      *
> > >        * Single display
> > >        * 1 LM, 1 INTF
> > >        * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >        *
> > >        * Add dspps to the reservation requirements if ctm is requested
> > >        */
> > > +
> > >       if (intf_count == 2)
> > >               topology.num_lm = 2;
> > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > >                * this is power optimal and can drive up to (including) 4k
> > >                * screens
> > > +              * But for dual display case, we prefer 4 layer mixers. Because
> > > +              * the resolution is always high in the case and 4 DSCs are more
> > > +              * power optimal.
> > >                */
> > > -             topology.num_dsc = 2;
> > > -             topology.num_lm = 2;
> > > -             topology.num_intf = 1;
> > > +
> > > +             if (intf_count == 2) {
> > > +                     topology.num_dsc = 4;
> > > +                     topology.num_lm = 4;
> > > +                     topology.num_intf = 2;
> > > +             } else {
> > > +                     topology.num_dsc = 2;
> > > +                     topology.num_lm = 2;
> > > +                     topology.num_intf = 1;
> >
> > Why is it only enabled for the DSC case? Also I'd like to point out
> > platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> > condition here needs more work to work with those platforms too.
> 
> Because the DSC + quad-pipe is assumed with wide LCD case that dual
> pipe can not handle due to width limitation. If DSC is not involved, the
> resolution is not too big to involve DSC together with 2 interfaces. Do you
> think there is need to support quad-pipe without DSC?

Yes, of course. The same logic: ultra wide resolutions. If two LMs are
not enough for the panel / monitor.

> 
> Of course, it is a valid case to use 2 DSC with 2 interfaces. Below logic shall
> be better.
> 
>    if (intf_count == 2) {
>            topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;
>            topology.num_lm = topology.num_dsc;
>            topology.num_intf = 2;
>    } else {
>            topology.num_dsc = 2;
>            topology.num_lm = 2;
>            topology.num_intf = 1;
>    }

It all starts to look like a collection of use-case quirks. But indeed,
it should work.

> 
> >
> > > +             }
> > >       }
> > >
> > >       return topology;
> > > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
> > >       struct dpu_hw_mixer_cfg mixer;
> > >       int i, num_lm;
> > >       struct dpu_global_state *global_state;
> > > -     struct dpu_hw_blk *hw_lm[2];
> > > -     struct dpu_hw_mixer *hw_mixer[2];
> > > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> > >       struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
> > >
> > >       memset(&mixer, 0, sizeof(mixer));
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > index 63f09857025c2..d378a990cc0fb 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
> > >
> > >       /* Use merge_3d unless DSC MERGE topology is used */
> > >       if (phys_enc->split_role == ENC_ROLE_SOLO &&
> > > -         dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
> > > +         (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
> > > +             dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
> >
> > Misaligned. Also isn't it enough to check that num_mixers != 1?
> 
> Yeah, num_mixers != 1 should work.
> >
> > >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> > >               return BLEND_3D_H_ROW_INT;
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > index 3ab79092a7f25..d9cc84b081b1f 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > > @@ -25,6 +25,7 @@
> > >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> > >
> > >  #define CRTC_DUAL_MIXERS     2
> >
> > Do we still need this define?
> >
> > > +#define CRTC_QUAD_MIXERS     4
> > >
> > >  #define MAX_XIN_COUNT 16
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > index 27ef0771da5d2..1fe21087a141a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > @@ -33,8 +33,8 @@
> > >  #endif
> > >
> > >  #define STAGES_PER_PLANE             2
> > > -#define PIPES_PER_PLANE                      2
> > >  #define PIPES_PER_STAGE                      2
> > > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * STAGES_PER_PLANE)
> >
> > This is incorrect.
> >
> > >  #ifndef DPU_MAX_DE_CURVES
> > >  #define DPU_MAX_DE_CURVES            3
> > >  #endif
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > >               trace_dpu_plane_disable(DRMID(plane), false,
> > >                                       pstate->pipe[i].multirect_mode);
> > >
> > > -             if (pipe->sspp && i == 1) {
> > > +             if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
> >
> > Separate change, please. Also I'm not sure how does that work with the
> > shared SSPP case that I pointed to in one of the previous replies.
> 
> Maybe we can add a peer member in the pipe to reference each other, then we have
> chance to use multirect across all pipes in all planes.

I'd rather not. We have pairs of pipes. I'd rather see the code stay the
same way: processing one pair at the same time.

> 
> 
> >
> > >                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > >                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
