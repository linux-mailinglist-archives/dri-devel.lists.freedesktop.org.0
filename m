Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4BAD6960
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB0110E784;
	Thu, 12 Jun 2025 07:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mKik57tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DA810E784
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:44:45 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-70f862dbeaeso6475107b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749714284; x=1750319084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bey/QopOQhAz9in3qPDYj1tdW3PjSItIhwNmUsRkUcw=;
 b=mKik57tjttgXmKcQA6ZFza7g6pZUwtIlV2LJeVYpsrvvFZCGNDi3bVq4STqUTiXw1m
 X6o8z9nX6nh7VA3KPy+C0QRr2ufXmsiB3hndAfFK32BsZEUNnRFVuQKEscTG7xS9bi2y
 L1i7HoLsyWU7Ox/YiSjPAuopwfBFobHDo//hA3QVhcytg4uRwbHWdfRAqHimtBXcg+W+
 7DH5aN/me/2OR8IfS/KSyiMgeGr1PFVoCXFedP7lM1cLUe5DGquWFUgfqLK5D13ef19I
 MlDnMyW+QoZNe9f3EeSDxuQ1A5hYf3FzrdD0EhEAaNCMkxzvd0itln36V1CYdXnvXJgI
 THlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749714284; x=1750319084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bey/QopOQhAz9in3qPDYj1tdW3PjSItIhwNmUsRkUcw=;
 b=YWiv6ZEFDzYcv4EQkhLC5nQvTqHd8ARSv67GcJ8M8NRwfGP+vwq4hl5mOTIOpb6sJe
 hRWUF445KyJDbkExfg5YPkcZG+YHmb1LzvRF3aCl3B7DVwmYWO7KCwKFC/ui0lLPaBM/
 kD0TJQARJaoqn9OHnsZiz7+dEYCN5MaGlSTHNrW7l19u4la1MmjSXBP2X7csO6k0AQw6
 HdrxPJLWs061YATr6rN34AzLkekvrQmQknSF7LhdZ1LiaID60mkBIO3lOq2CZz+JpzfI
 GoTrrb8CKyq4pmvyQoLDCC87JQBxydNqbjgCauRepqpkFJV8yDKG+k3K4TDKjBeqhQVc
 6EEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNRiJVO39ilGR4MI/IfC0R1qz7Ax4POVKQXb+Qf6gxEUiWyDw3eS16LB2UQ+k5wlm+lp2n5EE0F0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQRaCHY9IYQvfIL0/wDWny1SIX3W9qkL0los4d8v8vd8a0PmgH
 HMqL3vUIenwN0RWk3iTLYL5DYj7av9HZwGR65JNB/vkgJLU1pFqj94JFMRgfbrP734mhyJD7O+c
 figbxZx7VOJoutpep6ZnF6aWM+v25QZA8RV1O0n2oLg==
X-Gm-Gg: ASbGncvjaO39pBiPrvMR9OmYSOywtBRlsCkkH0AlUy9FYWMLY97swdW+DdXyvHHqSmw
 GWo2VfCn8DgRaLAoXphZEqupv6h0iUo8lprCaMosvaFOBTdiAopXjLVvMhGQBhlPNC2FT6jo+l2
 UhYjzsAKfKE61ABIp3UpOn2tO041yteLdL0p/bCReoOg==
X-Google-Smtp-Source: AGHT+IFdOybMwmC50Y2TLodQhVkA3vk2OAc6BeWCZeVoRAEn4IDsweFt+dTs+m7K3ehtbUdKRX/l2KQowqE2aoxpNkc=
X-Received: by 2002:a05:690c:60c6:b0:70c:90af:154 with SMTP id
 00721157ae682-7114ed6a1c6mr40554667b3.20.1749714283621; Thu, 12 Jun 2025
 00:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
 <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
In-Reply-To: <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Jun 2025 15:44:32 +0800
X-Gm-Features: AX0GCFsO_nCI8egougDr63n_gTKnTwM5DYwkqcQjLkSyPF363OFA-OnbDdeQldY
Message-ID: <CABymUCOx-kJ0FpZnvTPAT9i-kvcA8Bs8WxFZZWQXbLZ2Koobpg@mail.gmail.com>
Subject: Re: [PATCH v11 11/12] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
6=E6=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 18:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jun 03, 2025 at 03:10:10PM +0800, Jun Nie wrote:
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen is futher handled by two
> > pipes if its width exceeds a limit for a single pipe.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++-=
--------
> >  3 files changed, 110 insertions(+), 40 deletions(-)
> >
> > @@ -886,35 +887,94 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> >
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > +     drm_rect_rotate(&init_pipe_cfg.src_rect,
> >                       new_plane_state->fb->width, new_plane_state->fb->=
height,
> >                       new_plane_state->rotation);
> >
> > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > =
max_mdp_clk_rate) {
> > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewid=
th) {
> > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT=
 " line:%u\n",
> > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect)=
, max_linewidth);
> > -                     return -E2BIG;
> > +     /*
> > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer=
 pair
> > +      * configs for left and right half screen in case of 4:4:2 topolo=
gy.
> > +      * But we may have 2 rect to split wide plane that exceeds limit =
with 1
> > +      * config for 2:2:1. So need to handle both wide plane splitting,=
 and
> > +      * two halves of screen splitting for quad-pipe case. Check dest
> > +      * rectangle left/right clipping first, then check wide rectangle
> > +      * splitting in every half next.
> > +      */
> > +     num_stages =3D (num_lm + 1) / 2;
>
> I thought we agreed to loop over all stages, dropping the need for
> num_lm.

num_stages is needed here, so that the plane can be cropped into left/right
half of LCD and result pipe will be handled by 2 stages in quadpipe case.
While only 1 stage is involved in 1 or 2 pipe case and the crop operation
does not make a real impact. If we do not care num_lm and use 2 stages
by default, then we are forcing quad-pipe. Do you have any suggestion?

>
> > +     /* iterate mixer configs for this plane, to separate left/right w=
ith the id */
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             struct drm_rect mixer_rect =3D {
> > +                     .x1 =3D stage_id * mode->hdisplay / num_stages,
> > +                     .y1 =3D 0,
> > +                     .x2 =3D (stage_id + 1) * mode->hdisplay / num_sta=
ges,

The crop window is calculated with num_stages here.

> > +                     .y2 =3D mode->vdisplay
> > +                     };
> > +             int cfg_idx =3D stage_id * PIPES_PER_STAGE;
> > +
> > +             pipe_cfg =3D &pstate->pipe_cfg[cfg_idx];
> > +             r_pipe_cfg =3D &pstate->pipe_cfg[cfg_idx + 1];
> > +
> > +             drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state-=
>src);
> > +             pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +
> > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > +                             " vs clip window " DRM_RECT_FMT "\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > +                             DRM_RECT_ARG(&mixer_rect));
> > +
> > +             /*
> > +              * If this plane does not fall into mixer rect, check nex=
t
> > +              * mixer rect.
> > +              */
> > +             if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> > +                                       &pipe_cfg->dst_rect,
> > +                                       &mixer_rect)) {
> > +                     memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe=
_cfg));
> > +
> > +                     continue;
> >               }
> >
> > -             *r_pipe_cfg =3D *pipe_cfg;
> > -             pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 + pipe_c=
fg->src_rect.x2) >> 1;
> > -             pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 + pipe_c=
fg->dst_rect.x2) >> 1;
> > -             r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2;
> > -             r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2;
> > -     } else {
> > -             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > -     }
> > +             pipe_cfg->dst_rect.x1 -=3D mixer_rect.x1;
> > +             pipe_cfg->dst_rect.x2 -=3D mixer_rect.x1;
> > +
> > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst:=
 " DRM_RECT_FMT "\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RE=
CT_ARG(&pipe_cfg->dst_rect));
> > +
> > +             /* Split wide rect into 2 rect */
> > +             if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth)=
 ||
> > +                  _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_ra=
te) {
> > +
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max=
_linewidth) {
> > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_=
RECT_FMT " line:%u\n",
> > +                                             DRM_RECT_ARG(&pipe_cfg->s=
rc_rect), max_linewidth);
> > +                             return -E2BIG;
> > +                     }
> > +
> > +                     memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw=
_pipe_cfg));
> > +                     pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 =
+ pipe_cfg->src_rect.x2) >> 1;
> > +                     pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 =
+ pipe_cfg->dst_rect.x2) >> 1;
> > +                     r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2=
;
> > +                     r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2=
;
> > +                     DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> > +                                     DRM_RECT_FMT " and " DRM_RECT_FMT=
 "\n",
> > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect)=
,
> > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_rec=
t));
> > +             } else {
> > +                     memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_c=
fg));
> > +             }
> >
> > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > -                         new_plane_state->fb->width, new_plane_state->=
fb->height,
> > -                         new_plane_state->rotation);
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > -                                 new_plane_state->fb->width, new_plane=
_state->fb->height,
> > +             drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > +                                 new_plane_state->fb->width,
> > +                                 new_plane_state->fb->height,
> >                                   new_plane_state->rotation);
> >
> > +             if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > +                     drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +                                         new_plane_state->fb->width,
> > +                                         new_plane_state->fb->height,
> > +                                         new_plane_state->rotation);
> > +     }
> > +
> >       pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
> >
> >       return 0;
> > @@ -997,20 +1057,17 @@ static int dpu_plane_atomic_check_sspp(struct dr=
m_plane *plane,
> >               drm_atomic_get_new_plane_state(state, plane);
> >       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     int ret =3D 0;
> > -
> > -     ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > -                                       &crtc_state->adjusted_mode,
> > -                                       new_plane_state);
> > -     if (ret)
> > -             return ret;
> > +     struct dpu_sw_pipe *pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > +     int ret =3D 0, i;
> >
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> > -             ret =3D dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_=
cfg,
> > +     for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> > +             pipe =3D &pstate->pipe[i];
> > +             pipe_cfg =3D &pstate->pipe_cfg[i];
> > +             if (!pipe->sspp)
> > +                     continue;
> > +             DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n",=
 i);
> > +             ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> >                                                 &crtc_state->adjusted_m=
ode,
> >                                                 new_plane_state);
> >               if (ret)
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
