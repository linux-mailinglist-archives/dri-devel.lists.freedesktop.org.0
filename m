Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGHEM729cWkmLwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 07:03:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E662261
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 07:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4E10E8F0;
	Thu, 22 Jan 2026 06:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PPHd+3HD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A3F10E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 06:03:37 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64942ebf1a3so692016d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 22:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769061816; cv=none;
 d=google.com; s=arc-20240605;
 b=XcZIOp4uh/1HobekLP+Vds4D4C1ELXAotIpaDcyQ1otav8t82ntfEr8kO3zL1NJ+WF
 bBKS/r7ZWVo/CnRyJERFuDiAYKxRk3xX5cZ1QJN9GeTcbSy8odLZAIyqOQw/I4lkHPi8
 +jShI5qHpTmc+LBZXsBWegmjJS2MLr9TEkMfK+xlXhMFyyzSS/Ts4LTGyMVEB/AsTYx4
 eOsGlONDT3CvL+VQtO+70gDI5lUxi/hsvcxCAr837eykFebjQlUJTBN0B9AerfVbPwC6
 bzibes2meA1VmR2d00/kI97TmJ3moUaSeNpVmpJjoemlHZRHlSd5RfJwUyMuzcAz6jub
 EuRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Qx6mMtXyKOMz7O/Dvb869tTYqPo6ooYlALfEmNRzEX8=;
 fh=4jtbtTpNlF/ToPm/jO7iuKavqAISXSh2PJMEUwiBnAU=;
 b=NeTytJGwGmqYknEnw1tyMdn35j/c4Lk0KnIN8lUG4NvqjMNxJNZ/Pfvgz+ceOd5AWO
 HsFsiM/Cm244533BgbJi9f4I4GYAIhR8IwNnDBhQrrg32UfWVWMr2wD46LbuyFFhdUEI
 WwA4B+iDVU2YWUsBbVGEDZ8m/3WXECx272ryV2Xoe4JrUmKl41LpQXI1Xszyu8rpP6ux
 zICk8wn7+8lq+Ogir+yMBKgJYr+E+ISgcyExYEgO4QaT3co778YUNZWdj1S+lViGvPAm
 KS34itEBcd7JydhaoHaP69Bh6EYZUCKcdusBbfB9EX/l0Z4SLlfOIxOvVeE3PQq9ewDa
 W/6A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769061816; x=1769666616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qx6mMtXyKOMz7O/Dvb869tTYqPo6ooYlALfEmNRzEX8=;
 b=PPHd+3HDGqMs4A1SjASvQM1ri/+rXVNCUKgxLCNP68fuxgX7jLv6Il0CtkWhyAIg4O
 60PHZJEBVZvuSPUlx7m1Sllntqx5cFQHGyA69sBFkUf8RBn9DkxC3NWOpUBh0kIQxw36
 JUTnhdqRJn542oyPSLvmFnOSRXAQw/jNgsNY/kCjgZK6+TSY47lKjvZgueqQkTlt19rW
 hQeWP9GpTwKrg8gH1/cNm+5TzbH4WlrT/0HQZhcdUHnuvpj7p9bBhPHx5iog6g7u1G+C
 31a/XSoCcsUX8DGJzXLlklbSiCSTiETzp6ZrL48uUKzvFVI7qKrjXPFnlvqyz+Gzl9QP
 f9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769061816; x=1769666616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qx6mMtXyKOMz7O/Dvb869tTYqPo6ooYlALfEmNRzEX8=;
 b=fYsIA1koUjtE9pFymxDCqXRoav1VCTwX1uhwTgCqGQdpULNH/FVZnl9UZkkL1zHh5S
 QGH0okekAZ68KVsC/HLc4HO+/CduAGze60gTQZYqVRG8iTM3zQncJvXxQChVBYCeZtmQ
 Nj0I7i0rmmZPFFMPVMHMxYcECdU7gOOK2X3uShL85ubwvBiwBzP9XonAi0SVT0+0Uyak
 wAbp1XToOZvf38SNh5MCcA1OWiPv9RE+kA7jsZ03vzgUmjpArC9EmZ682JpRjj8PmWqV
 /RtQrVgcVg8Xh8g/MEHkPUrxJCaT4C+PLOMH1u06FRLoL4h5wGQo0weg7QPVTuKIIKsq
 NrhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5faYWPGXamBv2u5jA6cxOG3cQMxDufV4hYGkH+1Hd5ICEF5B+uNLUAfnOdBu5ar05ZwZJ853pb2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWTAQ+/KqYbPw3euBmHddkhpZA6XVbW9LTpXMG7UiLvxwjsRI7
 wMWf/IqNFHm0mIrcCI/e7ZDF4r1Pk1LWj/oJY6iW9zYy8R7SxCdaB44jNTvWxKWpdCbOGgTCiY4
 dW/XxkJPwb7qZH50st41KLt02M4MHr1eJpYFka/TB9Q==
X-Gm-Gg: AZuq6aLVZO8it4D1PPpdH48ZHbskAKw+HtoHZrz/X+e/iLLP+khO/HK8mLTgVx1wBFL
 d1F+GZ2UlGJ3P2iXS0jetHt5+PXPq4oyUS6Ouwzg+LEj69DrzUiC86lvVX0rmRfncy1ssLLHfGR
 rUl7VzTy4GmysVqFml8Oxm4EZOxv6E8mTcU6QEFC6aECvKqVMbbkBbrR4e1a51wkfNk0AhauFZS
 X0DuAqt7b2eUaFU2QtzUIKDIrTYgCler3+PobPcdiFLX4fem/ihcUoJ7Y6+ZI8RyiPWliWCf8UF
 KJU=
X-Received: by 2002:a05:690e:11cc:b0:640:fca9:bfd6 with SMTP id
 956f58d0204a3-6493c849206mr6112260d50.49.1769061816211; Wed, 21 Jan 2026
 22:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
In-Reply-To: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 22 Jan 2026 14:03:25 +0800
X-Gm-Features: AZwV_Qg1_79Xo68C21Ihi7tRuTlwZn5P1Uonir6pcjTQWXS1ANc_kg4p_DhgV2I
Message-ID: <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 812E662261
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > Currently, plane splitting and SSPP allocation occur during the plane
> > check phase. Defer these operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
>
> Why is it important? What is broken otherwise?

I see. Thanks! Will add below lines in next version.

By default, the plane check occurs before the CRTC check.
Without topology information from the CRTC, plane splitting
cannot be properly executed. Consequently, the SSPP
engine starts without a valid memory address, which triggers
an IOMMU warning.

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 112 +++++++++++++++++++---=
--------
> >  2 files changed, 71 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 2d06c950e8143..debdbbe6160dd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1484,8 +1484,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc =
*crtc,
> >                       return rc;
> >       }
> >
> > -     if (dpu_use_virtual_planes &&
> > -         (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > +     if (crtc_state->planes_changed || crtc_state->zpos_changed) {
> >               rc =3D dpu_crtc_reassign_planes(crtc, crtc_state);
> >               if (rc < 0)
> >                       return rc;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 66f240ce29d07..3c629f4df461d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1119,49 +1119,25 @@ static int dpu_plane_atomic_check(struct drm_pl=
ane *plane,
> >       struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_pl=
ane_state(state,
> >                                                                        =
        plane);
> >       int ret =3D 0;
> > -     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > -     struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> > -     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     const struct drm_crtc_state *crtc_state =3D NULL;
> > -     uint32_t max_linewidth =3D dpu_kms->catalog->caps->max_linewidth;
> > +     struct drm_crtc_state *crtc_state =3D NULL;
> >
> >       if (new_plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >                                                          new_plane_stat=
e->crtc);
> >
> > -     pipe->sspp =3D dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -
> > -     if (!pipe->sspp)
> > -             return -EINVAL;
> > -
> >       ret =3D dpu_plane_atomic_check_nosspp(plane, new_plane_state, crt=
c_state);
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D dpu_plane_split(plane, new_plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > -                                           pipe->sspp,
> > -                                           msm_framebuffer_format(new_=
plane_state->fb),
> > -                                           max_linewidth)) {
> > -             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RE=
CT_FMT
> > -                             " max_line:%u, can't use split source\n",
> > -                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > -                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > -                             max_linewidth);
> > -             return -E2BIG;
> > -     }
> > -
> > -     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > +     /*
> > +      * To trigger the callback of dpu_assign_plane_resources() to
> > +      * finish the deferred sspp check
> > +      */
> > +     crtc_state->planes_changed =3D true;
> > +     return 0;
> >  }
> >
> >  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > @@ -1186,10 +1162,6 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       if (ret)
> >               return ret;
> >
> > -     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > -     if (ret)
> > -             return ret;
> > -
> >       if (!plane_state->visible) {
> >               /*
> >                * resources are freed by dpu_crtc_assign_plane_resources=
(),
> > @@ -1261,9 +1233,9 @@ static int dpu_plane_virtual_assign_resources(str=
uct drm_crtc *crtc,
> >                                             struct dpu_global_state *gl=
obal_state,
> >                                             struct drm_atomic_state *st=
ate,
> >                                             struct drm_plane_state *pla=
ne_state,
> > +                                           const struct drm_crtc_state=
 *crtc_state,
> >                                             struct drm_plane_state **pr=
ev_adjacent_plane_state)
> >  {
> > -     const struct drm_crtc_state *crtc_state =3D NULL;
> >       struct drm_plane *plane =3D plane_state->plane;
> >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> > @@ -1273,10 +1245,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       const struct msm_format *fmt;
> >       int i, ret;
> >
> > -     if (plane_state->crtc)
> > -             crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > -                                                        plane_state->c=
rtc);
> > -
> >       pstate =3D to_dpu_plane_state(plane_state);
> >       for (i =3D 0; i < STAGES_PER_PLANE; i++)
> >               prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i] =
?
> > @@ -1288,6 +1256,10 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       if (!plane_state->fb)
> >               return -EINVAL;
> >
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> >       fmt =3D msm_framebuffer_format(plane_state->fb);
> >       reqs.yuv =3D MSM_FORMAT_IS_YUV(fmt);
> >       reqs.scale =3D (plane_state->src_w >> 16 !=3D plane_state->crtc_w=
) ||
> > @@ -1318,14 +1290,59 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >  }
> >
> > +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> > +                                   struct dpu_global_state *global_sta=
te,
> > +                                   struct drm_atomic_state *state,
> > +                                   struct drm_plane_state *plane_state=
,
> > +                                   const struct drm_crtc_state *crtc_s=
tate,
> > +                                   struct drm_plane_state **prev_adjac=
ent_plane_state)
> > +{
> > +     struct drm_plane *plane =3D plane_state->plane;
> > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > +     struct dpu_plane_state *pstate =3D to_dpu_plane_state(plane_state=
);
> > +     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > +     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > +     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     int ret;
> > +
> > +     if (!plane_state->visible)
> > +             return 0;
> > +
> > +     pipe->sspp =3D dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +     if (!pipe->sspp)
> > +             return -EINVAL;
> > +
> > +     ret =3D dpu_plane_split(plane, plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > +                                           pipe->sspp,
> > +                                           msm_framebuffer_format(plan=
e_state->fb),
> > +                                           dpu_kms->catalog->caps->max=
_linewidth)) {
> > +             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RE=
CT_FMT
> > +                             " max_line:%u, can't use split source\n",
> > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > +                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > +                             dpu_kms->catalog->caps->max_linewidth);
> > +             return -E2BIG;
> > +     }
> > +
> > +     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > +}
> > +
> >  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> >                              struct drm_atomic_state *state,
> >                              struct drm_crtc *crtc,
> >                              struct drm_plane_state **states,
> >                              unsigned int num_planes)
> >  {
> > -     unsigned int i;
> >       struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLAN=
E] =3D { NULL };
> > +     const struct drm_crtc_state *crtc_state =3D NULL;
> > +     unsigned int i;
> > +     int ret;
> >
> >       for (i =3D 0; i < num_planes; i++) {
> >               struct drm_plane_state *plane_state =3D states[i];
> > @@ -1334,8 +1351,19 @@ int dpu_assign_plane_resources(struct dpu_global=
_state *global_state,
> >                   !plane_state->visible)
> >                       continue;
> >
> > -             int ret =3D dpu_plane_virtual_assign_resources(crtc, glob=
al_state,
> > +             if (plane_state->crtc)
> > +                     crtc_state =3D drm_atomic_get_new_crtc_state(stat=
e,
> > +                                                                plane_=
state->crtc);
> > +
> > +             if (!dpu_use_virtual_planes)
> > +                     ret =3D dpu_plane_assign_resources(crtc, global_s=
tate,
> > +                                                      state, plane_sta=
te,
> > +                                                      crtc_state,
> > +                                                      prev_adjacent_pl=
ane_state);
> > +             else
> > +                     ret =3D dpu_plane_virtual_assign_resources(crtc, =
global_state,
> >                                                            state, plane=
_state,
> > +                                                          crtc_state,
> >                                                            prev_adjacen=
t_plane_state);
> >               if (ret)
> >                       return ret;
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
