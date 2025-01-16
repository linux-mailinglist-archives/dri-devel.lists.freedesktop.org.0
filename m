Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02387A137B5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B390210E929;
	Thu, 16 Jan 2025 10:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZzGhxk7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B3A10E929
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:21:00 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so1191230276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 02:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737022859; x=1737627659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7DkUZUbj/ATaAxon4iCq4sCI+LL6thiT8O47/n2k8g=;
 b=ZzGhxk7pz11pjcplKpmnbyxOdnMza6sW826AgyQ8RSuDSsVGR4E45ttMDlfFP/mSqV
 kEwV/57BAkIHDUoQvGzmiaIpA8N6aRUk9AjNScY8zdeXPhFkHSbwxg5AQe4VAo3sGWl9
 jA2vmjU+AI0gNOvLVX+x6WAduAAKXiEXwbU8FyTZG7U5++lRYhvusFp8/BdqXbRuBJoJ
 3qoKF40+9BodATRWh2xzGt0Jjl4s4IuWcvM3vuRtcr2Px9TcwubOVHCYoTa9F9yqsEH3
 AJYT3zAiluttuxIelPXXmU5d/BQbHERYaL8bPGgCE8zzs+QgKCGBDosg1k8AJWIOgHjy
 6vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022859; x=1737627659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7DkUZUbj/ATaAxon4iCq4sCI+LL6thiT8O47/n2k8g=;
 b=pfSgPdY6e3hRuvPePhfb7HjLv6KWjPu/62dGQVs2QQww8szGRIh/wGI1+hEg+LP22j
 2m6nFCMM75v3PU8ojHrn3waFfW7UlQXYx9VRTPWqled7dw3SOivdsYVYwNOACKaXS46f
 GGOFchVKqmauZcWF8H4OpPtEzviqqzAbTtO6IVC/mepu8mlpDoNWAOCDB9SAlp9Dcz7V
 Xa8Dt92JzDnDEnWlU/jk9tQNJV/kBJ1TkPU2kNj05BB62WvNpwVNTtAR4hg6sM38oH33
 cMcAekzSR18t2xJzGy/O9C3InaMqVmQvj0vSylA0yvCIX06wobTWLHm2VBH4NU/JbOUf
 3ncw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfGvugcFjgmOXTM9ma/FuOMGK1Fm8/X+W45vM3iAzUg/egH+03Ec1egtWciynpidrw86YexvjdNTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIdDrX6Mea+twGm/W3rrmZvaTsQhXmPkmRY/vEJqh5ZIzrM4yZ
 2rWlPN8ss5bozLyY0FpXo3JpsNgCzYhQZVDm6QYBLmS0Fw/r38MMj8GC4/2a8tTEn4nkFedtxb8
 FCaTZ8dL/9YDjFmg5FL+GKNgD0HI0RmL6Zl6EKA==
X-Gm-Gg: ASbGncv3fKJ6LD0MrTY2AQpn8oVJ+MdVaX+MvSM/d6/KiwCJAZVJKgexY1wwvdxrOSj
 sta4aW3Azf5TA38FjrEPEoODiDNZE0V/QKn+qQDNK9ts=
X-Google-Smtp-Source: AGHT+IGyCMbjXZdTOVnwyorJlpEKK9VZ01ILglYWYTK3rI+DrE1DS4wgQEyFOwdQqzNqzGND2YrsXMopmJEmI3c4WO0=
X-Received: by 2002:a05:6902:1209:b0:e57:8814:1399 with SMTP id
 3f1490d57ef6-e5788141813mr6542584276.44.1737022859049; Thu, 16 Jan 2025
 02:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>
 <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
In-Reply-To: <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 18:20:48 +0800
X-Gm-Features: AbW1kvbPuG7qHikMwfEFiV0M8nqpsgbeobnZt2UlzDMxMzlnc8vtQ4GuZXujalA
Message-ID: <CABymUCNMe7egDjOfExA8AOqjtkjHHLPspibG6OZMhzHmvn6W+g@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] drm/msm/dpu: support plane splitting in
 quad-pipe case
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
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:02PM +0800, Jun Nie wrote:
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen will be split further
> > by half if its width still exceeds limit.
>
> futher handled by two pipes if its width exceeds a limit for a single
> pipe.

Accepted.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 138 +++++++++++++++++++-=
--------
> >  4 files changed, 112 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 5ae640da53fbf..a900220deeb35 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1361,6 +1361,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >  }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +     return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 0b148f3ce0d7a..b14bab2754635 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_ge=
t_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index 56a0edf2a57c6..39fe338e76691 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -145,11 +145,13 @@ struct dpu_hw_pixel_ext {
> >   *             such as decimation, flip etc to program this field
> >   * @dest_rect: destination ROI.
> >   * @rotation: simplified drm rotation hint
> > + * @valid: notify that this pipe and config is in use
> >   */
> >  struct dpu_sw_pipe_cfg {
> >       struct drm_rect src_rect;
> >       struct drm_rect dst_rect;
> >       unsigned int rotation;
> > +     bool valid;
>
> Commit message doesn't describe why this is necessary at all. Why isn't
> it enough to check pipe->sspp as the code has been doing up to this
> point?

We test non-zero width of r_pipe or check pipe->sspp to decide whether
to allocate SSPP and go thru the routine for the r_pipe when we have 2
pipes at most. With 4 pipes, it is a bit complex to handle it this way beca=
use
the 2rd and the 4th pipes may be not valid when splitting the plane. A vali=
d
flag is more straightforward for later handling.

>
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 3795576e2eedd..4bcd7b1a05c16 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct dr=
m_plane *plane,
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_sw_pipe_cfg init_pipe_cfg;
> >       struct drm_rect fb_rect =3D { 0 };
> > +     const struct drm_display_mode *mode =3D &crtc_state->adjusted_mod=
e;
> >       uint32_t max_linewidth;
> > +     u32 num_lm;
> > +     int stage_id, num_stages;
> >
> >       min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >       max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > @@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > -     /* move the assignment here, to ease handling to another pairs la=
ter */
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     /* state->src is 16.16, src_rect is not */
> > -     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +     num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> >
> > -     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src=
);
> >
> >       fb_rect.x2 =3D new_plane_state->fb->width;
> >       fb_rect.y2 =3D new_plane_state->fb->height;
> > @@ -886,35 +887,93 @@ static int dpu_plane_atomic_check_nosspp(struct d=
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
> > +      * plane on right half for quad-pipe case. Check dest rectangle
>
> only on the right side?

Yeah, below shall be better.
So need to handle both wide plane splitting, and two halves of screen split=
ting
for quad-pipe case.
>
> > +      * left/right clipping first, then check wide rectangle splitting=
 in
> > +      * every half next.
> > +      */
> > +     num_stages =3D (num_lm + 1) / 2;
>
> --
> With best wishes
> Dmitry
