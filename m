Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC34999F0F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9849510EA73;
	Fri, 11 Oct 2024 08:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xZmZ/dSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BEB10EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 08:32:10 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e2915f00c12so899053276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 01:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728635530; x=1729240330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXVKGFc9gKLnMRLCU5051n+iSbQkjJvfu9suJq/vAoM=;
 b=xZmZ/dSg6qL8/mGuQWPdMcFoKw0qH8k1QuDser+AjfSfc3Of94p5sZ4vlrDBQwBbP9
 q7L4a8YkBtHxi2dErDmGNxvdnmq3H3EsvApQ5WQn7F/2PN5FYA67Z7hLolW0DKtAV/3Y
 xgAAY+LX36wYRdrzGFxLi0jUk/vKrbt9Ty5C0+c3iG+Tqbp50/wZXnP3Tt2vKEAWxGQh
 WPh52d+DAqpaoPCpUVpVzPErXbunnZC4b3g4RzYsRmn7qP5rbLaNu6P/Lkt1Slf6ulcu
 y2HMBFiPaXESy2yk2NZkkIaQ/dt/7k13q3EHaFgP8laBtz8/jeqii/ct7ff7y4NGbt7L
 vIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728635530; x=1729240330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXVKGFc9gKLnMRLCU5051n+iSbQkjJvfu9suJq/vAoM=;
 b=qJTI/DgoKm4eMLglE8uXIOtaFyMXd6Cd2M6CLckJGhqVvMjFFYXT9ckcKy28AQngKP
 OH09eR7FJ39PsnTc65pcJ+venMZMFJcfw6cjT39FtIz9wqp0z3lU4EAP8c6flX3Qgike
 4hPyR2GGVlC2ZvChqIx1CIClaP86D14qonJWZAsVnnakXgGeamQ4W+4B2IEJ4WlKeQZU
 4QgjAM/R4z8iW5zV4/zeV+fFjPQV4rxB8N6kqgrr3YgkcXzj4ibIth+If1wmRvYwBnig
 d7/jE5pvHgDZLQQYqxv6bYBRQX8FdIBNEgIyBuq7Til0RRZksMu09KYq7ZXeJfrP2JAv
 rqpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIrHuSRLF9DQJze6SjnUaV/bAGXief5wlBpG/UdaJxhmnaVwW9UVAlupnrozpQtEP6gsBU/CTA+ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjLFS6Ci+J8TdEPIMH4M6HvhWQZQvLFMsRjL0h2UIli0qXboaz
 cLn5H+xRNt3Rwp0TF8yVpbefDWtzJb7Nwg4kto/+bZxHytFxVE4MTlHvQEWHmDOjskcpLWHlDJG
 lYnR2rJ8s8PjJUAA92kB4IhUd+rcqRLdXoLOzHlnI7MYRmsj/
X-Google-Smtp-Source: AGHT+IEJUKI65A/rweY0Hux0u/XG69HYFzj47ADpABUJrETKXzH1Ptdn0pcJiE/EizkK2wO4ndQGAf8eKGPjQWg32dQ=
X-Received: by 2002:a05:690c:4148:b0:6e3:1050:5a46 with SMTP id
 00721157ae682-6e3479e0c16mr8544877b3.22.1728635529707; Fri, 11 Oct 2024
 01:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
 <fbqhq7zvusll377oxi4tcr4bpgwhab2xbnfw2izotua5me4ufe@syy4jundvccf>
 <CABymUCMcKwrUFZ=KJdS852-KkWPaGGigHr2Jo8B17_oZa6HEeA@mail.gmail.com>
In-Reply-To: <CABymUCMcKwrUFZ=KJdS852-KkWPaGGigHr2Jo8B17_oZa6HEeA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 11:31:57 +0300
Message-ID: <CAA8EJpq+8vWaV1ApGimC6E_i4FfOQvgNioV4tK=8eTkMZMiNWA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Jun Nie <jun.nie@linaro.org>
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

On Fri, 11 Oct 2024 at 11:13, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:29=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Oct 09, 2024 at 04:50:25PM GMT, Jun Nie wrote:
> > > Clip plane into pipes per left and right half screen ROI if topology
> > > is quad pipe.
> >
> > Why? Please provide an explanation for the reviewers not knowing the
> > details.
>
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair, thus no content of any pipe shall cross the LM pair. We need
> to clip plane into pipes per left and right half screen ROI if topology
> is quad pipe.

=3D> commit message.

> >
> > > Then split the clipped rectangle by half if the rectangle
> > > width still exceeds width limit.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  6 ++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 99 +++++++++++++++++++++=
+---------
> > >  3 files changed, 84 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 66f745399a602..d2aca0a9493d5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1310,6 +1310,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, boo=
l en)
> > >       return 0;
> > >  }
> > >
> > > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
> >
> > I think the DPU driver uses num_foo rather than foo_num
>
> dpu_crtc_get_num_lm()
> >
> > > +{
> > > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > > +
> > > +     return cstate->num_mixers;
> > > +}
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > >  {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.h
> > > index 5260e2440f059..ee7cf71f89fc7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -304,4 +304,10 @@ static inline enum dpu_crtc_client_type dpu_crtc=
_get_client_type(
> > >
> > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > >
> > > +/**
> > > + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> > > + * state: Pointer to drm crtc state object
> > > + */
> > > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)=
;
> > > +
> > >  #endif /* _DPU_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index 898fc2937954e..480a1b46aba72 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -837,10 +837,12 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > >       struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > >       u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane=
_state);
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg;
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > +     struct dpu_sw_pipe_cfg pipe_cfg;
> > >       struct drm_rect fb_rect =3D { 0 };
> > > +     const struct drm_display_mode *mode =3D &crtc_state->adjusted_m=
ode;
> > >       uint32_t max_linewidth;
> > > +     u32 lm_num;
> > > +     int lmcfg_id, lmcfg_num;
> > >
> > >       min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > >       max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > @@ -863,13 +865,10 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > -     /* move the assignment here, to ease handling to another pairs =
later */
> > > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > -     /* state->src is 16.16, src_rect is not */
> > > -     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > +     lm_num =3D dpu_crtc_get_lm_num(crtc_state);
> > >
> > > -     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > +     /* state->src is 16.16, src_rect is not */
> > > +     drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
> > >
> > >       fb_rect.x2 =3D new_plane_state->fb->width;
> > >       fb_rect.y2 =3D new_plane_state->fb->height;
> > > @@ -884,34 +883,78 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > >
> > >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > >
> > > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > > +     drm_rect_rotate(&pipe_cfg.src_rect,
> > >                       new_plane_state->fb->width, new_plane_state->fb=
->height,
> > >                       new_plane_state->rotation);
> > >
> > > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) =
> max_mdp_clk_rate) {
> > > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linew=
idth) {
> > > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_F=
MT " line:%u\n",
> > > -                                     DRM_RECT_ARG(&pipe_cfg->src_rec=
t), max_linewidth);
> > > -                     return -E2BIG;
> > > +     /*
> > > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mix=
er pair
> > > +      * configs for left and right half screen in case of 4:4:2 topo=
logy.
> > > +      * But we may have 2 rect to split plane with 1 config for 2:2:=
1.
> > > +      * So need to handle super wide plane splitting, and plane on r=
ight half
> > > +      * for quad-pipe case. Check dest rectangle left/right clipping
> > > +      * first, then check super wide rectangle splitting in every ha=
lf next.
> > > +      */
> > > +     lmcfg_num =3D (lm_num + 1) / 2;
> >
> > num_stages?
>
> OK. Then lmcfg_id   ->   stage_id
> >
> > > +     /* iterate mixer configs for this plane, to separate left/right=
 with the id */
> > > +     for (lmcfg_id =3D 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
> > > +             struct drm_rect mixer_rect =3D {lmcfg_id * mode->hdispl=
ay / lmcfg_num, 0,
> > > +                                     (lmcfg_id + 1) * mode->hdisplay=
 / lmcfg_num, mode->vdisplay};
> > > +             int cfg_idx =3D lmcfg_id * PIPES_PER_LM_PAIR;
> > > +             struct dpu_sw_pipe_cfg *cur_pipecfg =3D &pstate->pipe_c=
fg[cfg_idx];
> > > +
> > > +             drm_rect_fp_to_int(&cur_pipecfg->src_rect, &new_plane_s=
tate->src);
> > > +             cur_pipecfg->dst_rect =3D new_plane_state->dst;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > > +                             " vs clip window " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&cur_pipecfg->src_rect),
> > > +                             DRM_RECT_ARG(&mixer_rect));
> > > +
> > > +             /* If this plane does not fall into mixer rect, check n=
ext mixer rect */
> > > +             if (!drm_rect_clip_scaled(&cur_pipecfg->src_rect, &cur_=
pipecfg->dst_rect, &mixer_rect)) {
> > > +                     memset(&pstate->pipe_cfg[cfg_idx], 0, 2 * sizeo=
f(struct dpu_sw_pipe_cfg));
> > > +                     memset(&pstate->pipe[cfg_idx], 0, 2 * sizeof(st=
ruct dpu_sw_pipe));
> > > +                     continue;
> > >               }
> > >
> > > -             *r_pipe_cfg =3D *pipe_cfg;
> > > -             pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 + pipe=
_cfg->src_rect.x2) >> 1;
> > > -             pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 + pipe=
_cfg->dst_rect.x2) >> 1;
> > > -             r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2;
> > > -             r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2;
> > > -     } else {
> > > -             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > > -     }
> > > +             cur_pipecfg->valid =3D true;
> >
> > ... and checks have been broken up to now. This isn't good.
>
> Will move this patch before the plane checking patch.

You might need to move related chunks as well.

> >
> > > +             cur_pipecfg->dst_rect.x1 -=3D mixer_rect.x1;
> > > +             cur_pipecfg->dst_rect.x2 -=3D mixer_rect.x1;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " ds=
t: " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&cur_pipecfg->src_rect), D=
RM_RECT_ARG(&cur_pipecfg->dst_rect));
> > > +
> > > +             /* Split super wide rect into 2 rect */
> > > +             if ((drm_rect_width(&cur_pipecfg->src_rect) > max_linew=
idth) ||
> > > +                  _dpu_plane_calc_clk(mode, cur_pipecfg) > max_mdp_c=
lk_rate) {
> > > +                     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate-=
>pipe_cfg[cfg_idx + 1];
> > > +
> > > +                     if (drm_rect_width(&cur_pipecfg->src_rect) > 2 =
* max_linewidth) {
> > > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DR=
M_RECT_FMT " line:%u\n",
> > > +                                             DRM_RECT_ARG(&cur_pipec=
fg->src_rect), max_linewidth);
> > > +                             return -E2BIG;
> > > +                     }
> > > +
> > > +                     memcpy(r_pipe_cfg, cur_pipecfg, sizeof(struct d=
pu_sw_pipe_cfg));
> > > +                     cur_pipecfg->src_rect.x2 =3D (cur_pipecfg->src_=
rect.x1 + cur_pipecfg->src_rect.x2) >> 1;
> > > +                     cur_pipecfg->dst_rect.x2 =3D (cur_pipecfg->dst_=
rect.x1 + cur_pipecfg->dst_rect.x2) >> 1;
> >
> > pipe_cfg. If you need, rename the topmost var name.
>
> OK.  pipe_cfg_cur ?

screen_pipe_cfg

>
> >
> > > +                     r_pipe_cfg->src_rect.x1 =3D cur_pipecfg->src_re=
ct.x2;
> > > +                     r_pipe_cfg->dst_rect.x1 =3D cur_pipecfg->dst_re=
ct.x2;
> > > +                     r_pipe_cfg->valid =3D true;
> > > +                     DPU_DEBUG_PLANE(pdpu, "Split super wide plane i=
nto:"
> > > +                                     DRM_RECT_FMT " and " DRM_RECT_F=
MT "\n",
> > > +                                     DRM_RECT_ARG(&cur_pipecfg->src_=
rect),
> > > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_r=
ect));
> > > +             } else {
> > > +                     memset(&pstate->pipe_cfg[cfg_idx + 1], 0, sizeo=
f(struct dpu_sw_pipe_cfg));
> > > +                     memset(&pstate->pipe[cfg_idx + 1], 0, sizeof(st=
ruct dpu_sw_pipe));
> >
> > Please keep using r_pipe_cfg here.
>
> OK, will make r_pipe_cfg a variable in function scope, not bracket scope.
> >
> > > +             }
> > >
> > > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > -                         new_plane_state->fb->width, new_plane_state=
->fb->height,
> > > -                         new_plane_state->rotation);
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > +             drm_rect_rotate_inv(&cur_pipecfg->src_rect,
> > >                                   new_plane_state->fb->width, new_pla=
ne_state->fb->height,
> > >                                   new_plane_state->rotation);
> > > +     }
> > >
> > >       pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_=
state);
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
