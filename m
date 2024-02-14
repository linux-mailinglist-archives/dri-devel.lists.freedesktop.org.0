Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192E855312
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 20:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2763F10E24D;
	Wed, 14 Feb 2024 19:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b2fuhNJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03CA10E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 19:17:18 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcbf82cdf05so1050276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 11:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707938238; x=1708543038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDsAswXM/Fg8rNrNvE9IyqvJefpDY8QqPMNfM2SbGso=;
 b=b2fuhNJVhvm7QkssIImV0frIfstcCgE5JXM2gL+sfCwwoJQtDQ4J8Pj0mS0A4FpjgC
 YOv+0O8eStHoxb0Gmq7gRCURqKHO6d0zljFKqDcr+9T+EjdzpjxEq0WrpDNs5atVxtMM
 6NtPUYEaBRr2xTaF93dxvRfUVtPUGypcieQ3hikxBGI2NB9TZ4I0HLKOZp2PkMkBfakf
 XS80I11eLbkMzUtGWWodvhMH/XnODgDsU/1LZIrJmqwLZd0mAXtxVoYLZVWl1Jdhfe76
 ZzGmszwQGsJ+7MXfiZ6frtrvJgQDnUDiBIOUjJa4R6n9Q7j6ZAoda+T3oM1a5DsMKRvC
 g6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707938238; x=1708543038;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDsAswXM/Fg8rNrNvE9IyqvJefpDY8QqPMNfM2SbGso=;
 b=KxqdwxgMYfdIaqYbYv4c1Hm62oAvGsh+SKL+Kt391Ku9kbu4GigM22gvtTqA802yPp
 1jVgTD4BweMBX5WOFm6DRXMMq8R9K9p81DzSiBJ+u8CiI+Jx3fFCvvZ8VWWS8ttiZYv9
 OsrsYyqeBttZy1AJVBfs9qLnCmqxgVeZ62Yco7A4QvEyMsFx5mojAq2XzgReKxUMik3U
 +Wi1DjWLUxF34GQX5I1rH+4+xyaybgxgiUvNkstE6o+s7DqTcexJO34ye4vlDOpYGw8z
 iIWzt9uvoZJ506Rjt5I2MYvVchiVEXZJhr2vwYS/gf0haaWUuxuoGi+dCkwFRCf2eYu3
 Yf4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWryr1AsjF626eWxF9hXFUKGqEw5UbsNhvCJucYgz+k0MyJIsDdzecsJjDcEB7ZDAWkvjclGeeNSpLSXB2MbceTJqWKWq8jxTMLZhMR92pM
X-Gm-Message-State: AOJu0YwjMii7EMRjLMvg2PMuRx4fpYw4U0nw5i8cEKPAOt8kycFCxsM9
 tD4a9yii1vjUQozXpe0pdHvh0bvKk3+3tKs0bPqc9RfGlu+nzb5zN3eD6KnSKfUP+Wz6NldliQM
 y5tJWaWJwUeW42w+PVG0UwKGHIUq95TBhejq4sg==
X-Google-Smtp-Source: AGHT+IFpGF9vZuRtc3AROUP4xNXEOWTbmXO4DabWLZwpSvMWDXLOGtVO/xnAKG91VzrP0hw5IUJ7H045MpoTmgzeNx8=
X-Received: by 2002:a5b:e90:0:b0:dc7:45df:a04c with SMTP id
 z16-20020a5b0e90000000b00dc745dfa04cmr3357608ybr.43.1707938237167; Wed, 14
 Feb 2024 11:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
 <Zc0ITrmhQ8CWMXMq@intel.com> <Zc0KsfrI57XL7Efk@intel.com>
In-Reply-To: <Zc0KsfrI57XL7Efk@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:17:06 +0200
Message-ID: <CAA8EJppv9xW1S6=eYr41Z0KG3AnsNs7+rLXWWCZ5TNetuqXuUw@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org, 
 Stephen Boyd <swboyd@chromium.org>
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

On Wed, 14 Feb 2024 at 20:47, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Feb 14, 2024 at 08:37:02PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> > > The helper drm_atomic_helper_check_plane_state() runs several checks =
on
> > > plane src and dst rectangles, including the check whether required
> > > scaling fits into the required margins. The msm driver would benefit
> > > from having a function that does all these checks except the scaling
> > > one. Split them into a new helper called
> > > drm_atomic_helper_check_plane_noscale().
> >
> > What's the point in eliminating a nop scaling check?
>
> Actually, what are you even doing in there? Are you saying that
> the hardware has absolutely no limits on how much it can scale
> in either direction?

No, I'm just saying that the scaling ability depends on the rotation
and other plane properties. So I had to separate the basic plane
checks and the scaling check.
Basic (noscale) plane check source and destination rectangles, etc.
After that the driver identifies possible hardware pipe usage and
after that it can perform a scaling check.

>
> >
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 110 ++++++++++++++++++++++----=
--
> > >  include/drm/drm_atomic_helper.h     |   7 ++
> > >  2 files changed, 96 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> > > index 292e38eb6218..2d7dd66181c9 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -825,11 +825,9 @@ drm_atomic_helper_check_wb_encoder_state(struct =
drm_encoder *encoder,
> > >  EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
> > >
> > >  /**
> > > - * drm_atomic_helper_check_plane_state() - Check plane state for val=
idity
> > > + * drm_atomic_helper_check_plane_noscale() - Check plane state for v=
alidity
> > >   * @plane_state: plane state to check
> > >   * @crtc_state: CRTC state to check
> > > - * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed poin=
t
> > > - * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed poin=
t
> > >   * @can_position: is it legal to position the plane such that it
> > >   *                doesn't cover the entire CRTC?  This will generall=
y
> > >   *                only be false for primary planes.
> > > @@ -845,19 +843,16 @@ EXPORT_SYMBOL(drm_atomic_helper_check_wb_encode=
r_state);
> > >   * RETURNS:
> > >   * Zero if update appears valid, error code on failure
> > >   */
> > > -int drm_atomic_helper_check_plane_state(struct drm_plane_state *plan=
e_state,
> > > -                                   const struct drm_crtc_state *crtc=
_state,
> > > -                                   int min_scale,
> > > -                                   int max_scale,
> > > -                                   bool can_position,
> > > -                                   bool can_update_disabled)
> > > +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *pl=
ane_state,
> > > +                                     const struct drm_crtc_state *cr=
tc_state,
> > > +                                     bool can_position,
> > > +                                     bool can_update_disabled)
> > >  {
> > >     struct drm_framebuffer *fb =3D plane_state->fb;
> > >     struct drm_rect *src =3D &plane_state->src;
> > >     struct drm_rect *dst =3D &plane_state->dst;
> > >     unsigned int rotation =3D plane_state->rotation;
> > >     struct drm_rect clip =3D {};
> > > -   int hscale, vscale;
> > >
> > >     WARN_ON(plane_state->crtc && plane_state->crtc !=3D crtc_state->c=
rtc);
> > >
> > > @@ -883,17 +878,6 @@ int drm_atomic_helper_check_plane_state(struct d=
rm_plane_state *plane_state,
> > >
> > >     drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation)=
;
> > >
> > > -   /* Check scaling */
> > > -   hscale =3D drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> > > -   vscale =3D drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> > > -   if (hscale < 0 || vscale < 0) {
> > > -           drm_dbg_kms(plane_state->plane->dev,
> > > -                       "Invalid scaling of plane\n");
> > > -           drm_rect_debug_print("src: ", &plane_state->src, true);
> > > -           drm_rect_debug_print("dst: ", &plane_state->dst, false);
> > > -           return -ERANGE;
> > > -   }
> > > -
> > >     if (crtc_state->enable)
> > >             drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip=
.y2);
> > >
> > > @@ -921,6 +905,90 @@ int drm_atomic_helper_check_plane_state(struct d=
rm_plane_state *plane_state,
> > >
> > >     return 0;
> > >  }
> > > +EXPORT_SYMBOL(drm_atomic_helper_check_plane_noscale);
> > > +
> > > +/**
> > > + * drm_atomic_helper_check_plane_scale() - Check whether plane can b=
e scaled
> > > + * @plane_state: plane state to check
> > > + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed poin=
t
> > > + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed poin=
t
> > > + *
> > > + * Checks that a desired plane scale fits into the min_scale..max_sc=
ale
> > > + * boundaries.
> > > + * Drivers that provide their own plane handling rather than helper-=
provided
> > > + * implementations may still wish to call this function to avoid dup=
lication of
> > > + * error checking code.
> > > + *
> > > + * RETURNS:
> > > + * Zero if update appears valid, error code on failure
> > > + */
> > > +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plan=
e_state,
> > > +                                   int min_scale,
> > > +                                   int max_scale)
> > > +{
> > > +   struct drm_framebuffer *fb =3D plane_state->fb;
> > > +   struct drm_rect src;
> > > +   struct drm_rect dst;
> > > +   int hscale, vscale;
> > > +
> > > +   if (!plane_state->visible)
> > > +           return 0;
> > > +
> > > +   src =3D drm_plane_state_src(plane_state);
> > > +   dst =3D drm_plane_state_dest(plane_state);
> > > +
> > > +   drm_rect_rotate(&src, fb->width << 16, fb->height << 16, plane_st=
ate->rotation);
> > > +
> > > +   hscale =3D drm_rect_calc_hscale(&src, &dst, min_scale, max_scale)=
;
> > > +   vscale =3D drm_rect_calc_vscale(&src, &dst, min_scale, max_scale)=
;
> > > +   if (hscale < 0 || vscale < 0) {
> > > +           drm_dbg_kms(plane_state->plane->dev,
> > > +                       "Invalid scaling of plane\n");
> > > +           drm_rect_debug_print("src: ", &plane_state->src, true);
> > > +           drm_rect_debug_print("dst: ", &plane_state->dst, false);
> > > +           return -ERANGE;
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_atomic_helper_check_plane_scale);
> > > +
> > > +/**
> > > + * drm_atomic_helper_check_plane_state() - Check plane state for val=
idity
> > > + * @plane_state: plane state to check
> > > + * @crtc_state: CRTC state to check
> > > + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed poin=
t
> > > + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed poin=
t
> > > + * @can_position: is it legal to position the plane such that it
> > > + *                doesn't cover the entire CRTC?  This will generall=
y
> > > + *                only be false for primary planes.
> > > + * @can_update_disabled: can the plane be updated while the CRTC
> > > + *                       is disabled?
> > > + *
> > > + * Checks that a desired plane update is valid, and updates various
> > > + * bits of derived state (clipped coordinates etc.). Drivers that pr=
ovide
> > > + * their own plane handling rather than helper-provided implementati=
ons may
> > > + * still wish to call this function to avoid duplication of error ch=
ecking
> > > + * code.
> > > + *
> > > + * RETURNS:
> > > + * Zero if update appears valid, error code on failure
> > > + */
> > > +int drm_atomic_helper_check_plane_state(struct drm_plane_state *plan=
e_state,
> > > +                                   const struct drm_crtc_state *crtc=
_state,
> > > +                                   int min_scale,
> > > +                                   int max_scale,
> > > +                                   bool can_position,
> > > +                                   bool can_update_disabled)
> > > +{
> > > +   int ret;
> > > +
> > > +   ret =3D drm_atomic_helper_check_plane_noscale(plane_state, crtc_s=
tate, can_position, can_update_disabled);
> > > +   if (ret < 0)
> > > +           return ret;
> > > +
> > > +   return drm_atomic_helper_check_plane_scale(plane_state, min_scale=
, max_scale);
> > > +}
> > >  EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
> > >
> > >  /**
> > > diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic=
_helper.h
> > > index 536a0b0091c3..32ac55aea94e 100644
> > > --- a/include/drm/drm_atomic_helper.h
> > > +++ b/include/drm/drm_atomic_helper.h
> > > @@ -52,6 +52,13 @@ int drm_atomic_helper_check_modeset(struct drm_dev=
ice *dev,
> > >  int
> > >  drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder=
,
> > >                                      struct drm_connector_state *conn=
_state);
> > > +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *pl=
ane_state,
> > > +                                     const struct drm_crtc_state *cr=
tc_state,
> > > +                                     bool can_position,
> > > +                                     bool can_update_disabled);
> > > +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plan=
e_state,
> > > +                                   int min_scale,
> > > +                                   int max_scale);
> > >  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plan=
e_state,
> > >                                     const struct drm_crtc_state *crtc=
_state,
> > >                                     int min_scale,
> > > --
> > > 2.39.2
> >
> > --
> > Ville Syrj=C3=A4l=C3=A4
> > Intel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel



--=20
With best wishes
Dmitry
