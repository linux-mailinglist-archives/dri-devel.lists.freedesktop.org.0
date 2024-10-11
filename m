Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D7999DB5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A3C10EA68;
	Fri, 11 Oct 2024 07:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jnx3tdHG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1C210EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:18:12 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e2903a48ef7so1606236276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728631092; x=1729235892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ujydo//DJlcfV6440WoFMpF7z1o9yZjMw5ey3aEucZ0=;
 b=jnx3tdHG1q9PZdd9CDKLNOIi5q+2CJZkUOpzbW6XPXe9b+cpxQHzEc0HCnLUSOguFe
 FOd8/ypa/THwJhJbI035RdNE13LSTHlpOQCciorNI+9iD8dvCvrfpPb9nCrsfN5fskJ2
 50pkYm0aDRZhAKt64ja5nkPOfM1wEmqmYXcXjiFKhfyfQ6nUhiSTBuVacUH8iSo6C8Ox
 zbOXNPHFRJvsitUDh5j5e6fdeWk9LZH7CGlqKepgueqSyGIgZWtG+y/eeiQtT0ueqoZw
 1R8i3KUXF2hqXLxT7tcPQvX038ilp8AlRALKu1Mn5Ur71gbK2cfA2sJDRFYiQQecgPEx
 0BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728631092; x=1729235892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ujydo//DJlcfV6440WoFMpF7z1o9yZjMw5ey3aEucZ0=;
 b=hR4IE7Xs0cpquwos56U+BCSiZMOvGxMyoTl0Z3kfEEUhe5f/RSyg63Jdz+ihIEC2+V
 qn0dKxnRJNGJxV3H0iWp9euRk4CLmNIM+VtfRxMUhYNq6KpjGfPgyNvEvRA3UBhpUZK/
 KDRfAsLY5iKBq3eOvECe341RF7cir2CjrIiY2xxWCRcedW3F0HkIVmALT8fTkPPq9Tx+
 Du9Jsojb2r1k3xP3bdcT2tTWO+q5gX3r79hn9TjjOKDxfBR0Zq3MxufXl85AdxGWH/hL
 cJy0t9OpXz0PQjyuhuD69LRr5vezzqeBIJC1n1f8eps42vqDVrWYqUGyif5tpJJwjZpW
 cEug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfvnry6y2df2shNrh3A0lSCsuCa1iR2Cp2vR7a2dzIa2uXkZlOrZMGlzLSZeEvGJgteCFwGZ/5a8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs8pq+NuncPcyZ0bhMqulorR9Y5XUXbSBMG0aFJ5H+DnvHtD2d
 omPUs/YVjzX3c2fqHSGyHd2jhwcMzCF3fy9sV1CEpDaZGkz0IGs8JJa+E/2rXspe0J3oWNfBCaz
 Lk0G8HX29atE+jDLVfSG1MOjlYg52jNseu9duLw==
X-Google-Smtp-Source: AGHT+IHukSSeAb0E9FiOXU75wzIB6zucltgXwI17NepX4ZetEOepCDhTaTbzLEuUNdZ17TM/Iktfbu/dlSaLkB2j0DY=
X-Received: by 2002:a05:6902:1b86:b0:e29:2ab7:6c03 with SMTP id
 3f1490d57ef6-e292ab76c6amr107849276.33.1728631091812; Fri, 11 Oct 2024
 00:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-5-76d4f5d413bf@linaro.org>
 <kuvbcodnbgsgetkudbce32rajy6kg3lpxhcx6cvgm6bi7ekoki@smmnpdrwhbqn>
 <CABymUCOFV0Ze=55Ne23nKrN_4ES6cUT3_av7Q2xxtxT3Hw7ZJg@mail.gmail.com>
 <CAA8EJpqZ0X_DezzVPnWswwWoZCL8ZZJ4M-DHvUSo4qJXK6mQnQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqZ0X_DezzVPnWswwWoZCL8ZZJ4M-DHvUSo4qJXK6mQnQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 15:18:00 +0800
Message-ID: <CABymUCMBQq2iGdqcSBhokDo6McFn6xc63zVrEe+2CNX_a1ejng@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] drm/msm/dpu: handle pipes as array
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
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Oct 2024 at 09:49, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:08=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Oct 09, 2024 at 04:50:18PM GMT, Jun Nie wrote:
> > > > Store pipes in array with removing dedicated r_pipe. There are
> > > > 2 pipes in a drm plane at most currently. While 4 pipes are
> > > > needed for new usage case. This change generalize the handling
> > > > to pipe pair and ease handling to another pipe pair later.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  34 +++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 ++++++++++++++++--=
------------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h |  10 +-
> > > >  4 files changed, 111 insertions(+), 112 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index 3e0e6e9757da5..9656b1df0f122 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct d=
rm_crtc *crtc,
> > > >
> > > >       trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> > > >                                  state, to_dpu_plane_state(state), =
stage_idx,
> > > > -                                format->pixel_format,
> > > > +                                format->pixel_format, pipe,
> > > >                                  modifier);
> > >
> > > Doesn't seem to be related.
> >
> > There is building error when converting r_pipe into pipe array. So I
> > need to change trace code
> > accordingly in the same patch. Otherwise, the error happens just after
> > this patch is applied.
>
> No. It is related to your changes that add pipe argument to
> trace_dpu_crtc_setup_mixer(). Please split that part.

OK.
>
> > >
> > > >
> > > >       DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d m=
ultirect_idx %d\n",
> > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct =
drm_crtc *crtc,
> > > >       const struct msm_format *format;
> > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > >
> > > > -     uint32_t lm_idx;
> > > > +     uint32_t lm_idx, i;
> > > >       bool bg_alpha_enable =3D false;
> > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > >
> > > > @@ -463,20 +463,15 @@ static void _dpu_crtc_blend_setup_mixer(struc=
t drm_crtc *crtc,
> > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->al=
pha_enable)
> > > >                       bg_alpha_enable =3D true;
> > > >
> > > > -             set_bit(pstate->pipe.sspp->idx, fetch_active);
> > > > -             _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > -                                        mixer, cstate->num_mixers,
> > > > -                                        pstate->stage,
> > > > -                                        format, fb ? fb->modifier =
: 0,
> > > > -                                        &pstate->pipe, 0, stage_cf=
g);
> > > > -
> > > > -             if (pstate->r_pipe.sspp) {
> > > > -                     set_bit(pstate->r_pipe.sspp->idx, fetch_activ=
e);
> > > > +             for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > > > +                     if (!pstate->pipe[i].sspp)
> > > > +                             continue;
> > > > +                     set_bit(pstate->pipe[i].sspp->idx, fetch_acti=
ve);
> > > >                       _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > >                                                  mixer, cstate->num=
_mixers,
> > > >                                                  pstate->stage,
> > > >                                                  format, fb ? fb->m=
odifier : 0,
> > > > -                                                &pstate->r_pipe, 1=
, stage_cfg);
> > > > +                                                &pstate->pipe[i], =
i, stage_cfg);
> > > >               }
> > > >
> > > >               /* blend config update */
> > > > @@ -1387,15 +1382,12 @@ static int _dpu_debugfs_status_show(struct =
seq_file *s, void *data)
> > > >               seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:=
%4d\n",
> > > >                       state->crtc_x, state->crtc_y, state->crtc_w,
> > > >                       state->crtc_h);
> > > > -             seq_printf(s, "\tsspp[0]:%s\n",
> > > > -                        pstate->pipe.sspp->cap->name);
> > > > -             seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
> > > > -                     pstate->pipe.multirect_mode, pstate->pipe.mul=
tirect_index);
> > > > -             if (pstate->r_pipe.sspp) {
> > > > -                     seq_printf(s, "\tsspp[1]:%s\n",
> > > > -                                pstate->r_pipe.sspp->cap->name);
> > > > -                     seq_printf(s, "\tmultirect[1]: mode: %d index=
: %d\n",
> > > > -                                pstate->r_pipe.multirect_mode, pst=
ate->r_pipe.multirect_index);
> > > > +             if (pstate->pipe[i].sspp) {
> > > > +                     seq_printf(s, "\tsspp[%d]:%s\n",
> > > > +                                i, pstate->pipe[i].sspp->cap->name=
);
> > > > +                     seq_printf(s, "\tmultirect[%d]: mode: %d inde=
x: %d\n",
> > > > +                                i, pstate->pipe[i].multirect_mode,
> > > > +                                pstate->pipe[i].multirect_index);
> > > >               }
> > >
> > > I don't expect that this will work.
> >
> > Yes, the loop is missed. Will add it.
> > >
> > > >
> > > >               seq_puts(s, "\n");
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 4df7cfed4d230..e7006fb8c7734 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -429,7 +429,7 @@ static void _dpu_plane_setup_scaler3(struct dpu=
_hw_sspp *pipe_hw,
> > > >               uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v,
> > > >               unsigned int rotation)
> > > >  {
> > > > -     uint32_t i;
> > > > +     int i;
> > >
> > > Why?
> >
> > No need actually. It is a typo when converting type of many i.
> >
> > >
> > > >       bool inline_rotation =3D rotation & DRM_MODE_ROTATE_90;
> > > >
> > > >       /*
> > > > @@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_pl=
ane *pdpu,
> > > >       struct msm_drm_private *priv =3D plane->dev->dev_private;
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane->=
state);
> > > >       u32 fill_color =3D (color & 0xFFFFFF) | ((alpha & 0xFF) << 24=
);
> > > > +     int i;
> > > >
> > > >       DPU_DEBUG_PLANE(pdpu, "\n");
> > > >
> > > > @@ -632,12 +633,12 @@ static void _dpu_plane_color_fill(struct dpu_=
plane *pdpu,
> > > >               return;
> > > >
> > > >       /* update sspp */
> > > > -     _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pi=
pe_cfg.dst_rect,
> > > > -                                fill_color, fmt);
> > > > -
> > > > -     if (pstate->r_pipe.sspp)
> > > > -             _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &=
pstate->r_pipe_cfg.dst_rect,
> > > > -                                        fill_color, fmt);
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > > > +             if (pstate->pipe[i].sspp)
> > > > +                     _dpu_plane_color_fill_pipe(pstate, &pstate->p=
ipe[i],
> > > > +                                                &pstate->pipe_cfg[=
i].dst_rect,
> > > > +                                                fill_color, fmt);
> > > > +     }
> > > >  }
> > > >
> > > >  static int dpu_plane_prepare_fb(struct drm_plane *plane,
> > > > @@ -808,8 +809,8 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > > >       struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > > >       u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_pla=
ne_state);
> > > > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg;
> > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->r_pipe_cfg;
> > > > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > >       struct drm_rect fb_rect =3D { 0 };
> > > >       uint32_t max_linewidth;
> > > >
> > > > @@ -834,6 +835,9 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     /* move the assignment here, to ease handling to another pair=
s later */
> > > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > >       /* state->src is 16.16, src_rect is not */
> > > >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src=
);
> > > >
> > > > @@ -916,11 +920,11 @@ static int dpu_plane_atomic_check_pipes(struc=
t drm_plane *plane,
> > > >               drm_atomic_get_new_plane_state(state, plane);
> > > >       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_pla=
ne_state);
> > > > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe;
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > >       const struct msm_format *fmt;
> > > > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg;
> > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->r_pipe_cfg;
> > > > +     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > > > +     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > > > +     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > >       uint32_t supported_rotations;
> > > >       const struct dpu_sspp_cfg *pipe_hw_caps;
> > > >       const struct dpu_sspp_sub_blks *sblk;
> > > > @@ -975,10 +979,10 @@ static int dpu_plane_atomic_check(struct drm_=
plane *plane,
> > > >       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_pla=
ne_state);
> > > >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > > > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe;
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg;
> > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->r_pipe_cfg;
> > > > +     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > > > +     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > > > +     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > >       const struct drm_crtc_state *crtc_state =3D NULL;
> > > >
> > > >       if (new_plane_state->crtc)
> > > > @@ -1056,7 +1060,7 @@ static int dpu_plane_virtual_atomic_check(str=
uct drm_plane *plane,
> > > >               drm_atomic_get_old_plane_state(state, plane);
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane_s=
tate);
> > > >       struct drm_crtc_state *crtc_state;
> > > > -     int ret;
> > > > +     int ret, i;
> > > >
> > > >       if (plane_state->crtc)
> > > >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > > > @@ -1071,8 +1075,8 @@ static int dpu_plane_virtual_atomic_check(str=
uct drm_plane *plane,
> > > >                * resources are freed by dpu_crtc_assign_plane_resou=
rces(),
> > > >                * but clean them here.
> > > >                */
> > > > -             pstate->pipe.sspp =3D NULL;
> > > > -             pstate->r_pipe.sspp =3D NULL;
> > > > +             for (i =3D 0; i < PIPES_PER_STAGE; i++)
> > > > +                     pstate->pipe[i].sspp =3D NULL;
> > > >
> > > >               return 0;
> > > >       }
> > > > @@ -1110,19 +1114,22 @@ static int dpu_plane_virtual_assign_resourc=
es(struct drm_crtc *crtc,
> > > >       struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > >       const struct msm_format *fmt;
> > > >       uint32_t max_linewidth;
> > > > +     int i;
> > > >
> > > >       if (plane_state->crtc)
> > > >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > > >                                                          plane_stat=
e->crtc);
> > > >
> > > >       pstate =3D to_dpu_plane_state(plane_state);
> > > > -     pipe =3D &pstate->pipe;
> > > > -     r_pipe =3D &pstate->r_pipe;
> > > > -     pipe_cfg =3D &pstate->pipe_cfg;
> > > > -     r_pipe_cfg =3D &pstate->r_pipe_cfg;
> > > >
> > > > -     pipe->sspp =3D NULL;
> > > > -     r_pipe->sspp =3D NULL;
> > > > +     /* loop below code for another pair later */
> > >
> > > ??
> >
> > A marker for TODO. The first pair are handled in this patch. A loop wil=
l be
> > added later to loop the handing to the pair.
>
> A marker for TODO is 'TODO: foo bar'.
>
> > >
> > > > +     pipe =3D &pstate->pipe[0];
> > > > +     r_pipe =3D &pstate->pipe[1];
> > > > +     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > +     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > > +
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i++)
> > > > +             pstate->pipe[i].sspp =3D NULL;
> > > >
> > > >       if (!plane_state->fb)
> > > >               return -EINVAL;
> > > > @@ -1228,6 +1235,7 @@ void dpu_plane_flush(struct drm_plane *plane)
> > > >  {
> > > >       struct dpu_plane *pdpu;
> > > >       struct dpu_plane_state *pstate;
> > > > +     int i;
> > > >
> > > >       if (!plane || !plane->state) {
> > > >               DPU_ERROR("invalid plane\n");
> > > > @@ -1248,8 +1256,8 @@ void dpu_plane_flush(struct drm_plane *plane)
> > > >               /* force 100% alpha */
> > > >               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> > > >       else {
> > > > -             dpu_plane_flush_csc(pdpu, &pstate->pipe);
> > > > -             dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> > > > +             for (i =3D 0; i < PIPES_PER_STAGE; i++)
> > > > +                     dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
> > > >       }
> > > >
> > > >       /* flag h/w flush complete */
> > > > @@ -1349,20 +1357,16 @@ static void dpu_plane_sspp_atomic_update(st=
ruct drm_plane *plane)
> > > >       struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > > >       struct drm_plane_state *state =3D plane->state;
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe;
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > >       struct drm_crtc *crtc =3D state->crtc;
> > > >       struct drm_framebuffer *fb =3D state->fb;
> > > >       bool is_rt_pipe;
> > > >       const struct msm_format *fmt =3D
> > > >               msm_framebuffer_format(fb);
> > > > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg;
> > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->r_pipe_cfg;
> > > >       struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > > >       struct msm_gem_address_space *aspace =3D kms->base.aspace;
> > > >       struct dpu_hw_fmt_layout layout;
> > > >       bool layout_valid =3D false;
> > > > -     int ret;
> > > > +     int ret, i;
> > > >
> > > >       ret =3D dpu_format_populate_layout(aspace, fb, &layout);
> > > >       if (ret)
> > > > @@ -1381,12 +1385,12 @@ static void dpu_plane_sspp_atomic_update(st=
ruct drm_plane *plane)
> > > >                       crtc->base.id, DRM_RECT_ARG(&state->dst),
> > > >                       &fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
> > > >
> > > > -     dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> > > > -                                drm_mode_vrefresh(&crtc->mode),
> > > > -                                layout_valid ? &layout : NULL);
> > > > -
> > > > -     if (r_pipe->sspp) {
> > > > -             dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg,=
 fmt,
> > > > +     /* move the assignment here, to ease handling to another pair=
s later */
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > > > +             if (!pstate->pipe[i].sspp)
> > > > +                     continue;
> > > > +             dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> > > > +                                        &pstate->pipe_cfg[i], fmt,
> > > >                                          drm_mode_vrefresh(&crtc->m=
ode),
> > > >                                          layout_valid ? &layout : N=
ULL);
> > > >       }
> > > > @@ -1394,15 +1398,17 @@ static void dpu_plane_sspp_atomic_update(st=
ruct drm_plane *plane)
> > > >       if (pstate->needs_qos_remap)
> > > >               pstate->needs_qos_remap =3D false;
> > > >
> > > > -     pstate->plane_fetch_bw =3D _dpu_plane_calc_bw(pdpu->catalog, =
fmt,
> > > > -                                                 &crtc->mode, pipe=
_cfg);
> > > > -
> > > > -     pstate->plane_clk =3D _dpu_plane_calc_clk(&crtc->mode, pipe_c=
fg);
> > > > -
> > > > -     if (r_pipe->sspp) {
> > > > -             pstate->plane_fetch_bw +=3D _dpu_plane_calc_bw(pdpu->=
catalog, fmt, &crtc->mode, r_pipe_cfg);
> > > > +     pstate->plane_fetch_bw =3D 0;
> > > > +     pstate->plane_clk =3D 0;
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > > > +             if (!pstate->pipe[i].sspp)
> > > > +                     continue;
> > > > +             pstate->plane_fetch_bw +=3D _dpu_plane_calc_bw(pdpu->=
catalog, fmt,
> > > > +                                                     &crtc->mode, =
&pstate->pipe_cfg[i]);
> > >
> > > Wrong indentation
> >
> > Could you help elaborate it? I assume it is a bandwidth audit.
>
> Indent to the opening bracket please.
>
> > >
> > > >
> > > > -             pstate->plane_clk =3D max(pstate->plane_clk, _dpu_pla=
ne_calc_clk(&crtc->mode, r_pipe_cfg));
> > > > +             pstate->plane_clk =3D max(pstate->plane_clk,
> > > > +                                     _dpu_plane_calc_clk(&crtc->mo=
de,
> > > > +                                                         &pstate->=
pipe_cfg[i]));
> > > >       }
> > > >  }
> > > >
> > > > @@ -1410,17 +1416,24 @@ static void _dpu_plane_atomic_disable(struc=
t drm_plane *plane)
> > > >  {
> > > >       struct drm_plane_state *state =3D plane->state;
> > > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->r_pipe;
> > > > +     struct dpu_sw_pipe *pipe;
> > > > +     int i;
> > > > +
> > > > +     for (i =3D 0; i < PIPES_PER_STAGE; i +=3D 1) {
> > > > +             pipe =3D &pstate->pipe[i];
> > > > +             if (!pipe->sspp)
> > > > +                     continue;
> > > >
> > > > -     trace_dpu_plane_disable(DRMID(plane), false,
> > > > -                             pstate->pipe.multirect_mode);
> > > > +             trace_dpu_plane_disable(DRMID(plane), false,
> > > > +                                     pstate->pipe[i].multirect_mod=
e);
> > > >
> > > > -     if (r_pipe->sspp) {
> > > > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SS=
PP_RECT_1) {
> > >
> > > if (i > 1)
> >
> > Is there any case that pipe->multirect_index =3D=3D DPU_SSPP_RECT_1 and=
 i =3D=3D 0 ?
>
> You are converting the code. Please don't change the logic. Original
> code had separate handling for r_pipe. After your conversion it should
> be if (i =3D=3D 1) or if (i > 0), which means a typo in my review comment=
.
>
I see. You want to keep logic unchanged, with only handling the pipe in arr=
ay.
Handling to multiple pipe pairs can be added later.

- Jun
