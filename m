Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF09AB0887
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9A10E24B;
	Fri,  9 May 2025 03:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FWxAoh5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DD910E24A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 03:08:42 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-7080dd5fe92so14702817b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 20:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746760122; x=1747364922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHI4ppsEzBZRI81Zs2flbGsQenmb6fI0hGNQNfUSqyo=;
 b=FWxAoh5/tiZaqaLTHErUiJS7wYLB3ooM3aPujVaffvHKMr9d504/KZP/tiJnjgrvCP
 byUgKtVdA0gQAe79QYtNeb6brbA4jfWiEOTKa/jlAHmGmbEydizWEfxFAqcBihfGCmnr
 6yd4s3FC9Eb45c3qi+mlPpB8fbAta7f3c4+er0LhnsoWwJgyMhxus4a5MFbQMwsDqJd1
 aKiv0nH1hQsBfuQUbXYZ0YxKtJueaUZWf0PlsHEaZy9LM+4+MNMHDmW01ez9h9Y8UZvX
 X4iC1Yhl1jSKbz+aPTG5ca2+LTBvg3dPVQymHoBsJrFY3W+IIQJsj3o3QuwV36We3n3g
 vwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760122; x=1747364922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHI4ppsEzBZRI81Zs2flbGsQenmb6fI0hGNQNfUSqyo=;
 b=nsdEKez2OMU/WIncXybfhturMvdDe8qrVOgEFnhfu4k0MUdOb0KT2cDa3SKd4FJsFm
 icet7MDvQfzK/MEXgEy9YB8Iv5F2Nw89ORPF1BT2moFwxoE3YQjAbTA5TnLZ++ZFXpk+
 DDqETuVn1qaCcsydYbCH8UF8XsFlKcR+UXSLKCdqKYY75d1+UNBgN4xNy9Gh0+zfuJLu
 qujp20HVr4wWpAxa8haaENrUJN9rsYEqUH2VWyu7a9JsA8Y5i3RtC0NJrDNLymHIrfu9
 osEdULFO59GpUaFxYw9XNurKGB65tVGjI4rrbMojFts0W48rxk6t4ApGn55ZBPwX+1WJ
 PwzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt2zoi2+YLFsj1Ck8aPWfQh1B7HBkyrIrNiXcD297kVhz8lvmvynBFMFkdimfDP98AX0sdZw0AdBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypca1YtBuMG2QsVO9jjz+MUutcgm1NMEGM/iExtHNzTuMnNaxU
 LfA+k2BMVyHqYihZOLBE7gmFOtZK/KWhedvJSH6TtXizjWMpj2vkxaE76Lzk/YxqRndWowOsnC5
 6gpl29xJo9LuP7hJyfAvh3mHdrMjQWhfCZTeUZg==
X-Gm-Gg: ASbGnctHd12K2zx1pcVj1fk/Naf5VOv85JIU0E0GtmA2H+Lk1f4lSSqmE6VsOcs03P5
 p0fPU0DKYfcsBQKg5EJxhYOK3bwmj0jKnNtVeYBbQPuWQE6vB/NnqoGrTvUbZFg+Vth9eDrYVPv
 2JmoqfgBSUbZUhbL3R0muIVQ==
X-Google-Smtp-Source: AGHT+IEsXDASIzmYprExBPl4LogRqFg5eDp7hYbmNE7oXZcNevMIZVASWTighCbkXMHiMuOZAJdvbaomhbiURhxQMew=
X-Received: by 2002:a05:690c:4448:b0:700:a6be:d6b8 with SMTP id
 00721157ae682-70a3fb5683cmr25884547b3.35.1746760121821; Thu, 08 May 2025
 20:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
 <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
In-Reply-To: <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 9 May 2025 11:08:30 +0800
X-Gm-Features: AX0GCFvZnKBJWsJdmQ2it9cgVNnwhp-EM2d0BXlFc-71GKNHWB1m0DJqIw5fTRM
Message-ID: <CABymUCMuiKQwtuYW-HX4bwyTR4awm4scwXTWNzVCEmyQsQ29aA@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
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
5=E6=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B 18:47=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
> > Some display controller support flexible CRTC and DMA, such as the disp=
lay
> > controllers in snapdragon SoCs. CRTC can be implemented with several mi=
xers
> > in parallel, and plane fetching can be implemented with several DMA und=
er
> > umberala of a virtual drm plane.
> >
> > The mixer number is decided per panel resolution and clock rate constra=
in
> > first, which happens in CRTC side. Then plane is split per mixer number
> > and configure DMA accordingly.
>
> Here you are describing a behaviour of one particular driver as a reason
> to change the framework.

Yeah, the specific driver requires a change in framework. Maybe the
comment is not
proper?
>
> >
> > To support such forthcoming usage case, CRTC checking shall happen befo=
re
> > checking plane. Add the checking in the drm_atomic_helper_check_modeset=
().
>
> So, now drivers will get two calls to atomic_check(), one coming in
> circumstances which were not expected by the drivers before. Are you
> sure that this won't break anything?

Yes, it is a concern. Is there any way to limit the change in
framework to specific
driver with a flag, such as DRM_FLAG_CHECK_CRTC_BEFORE_PLANE?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb=
7c0bc9d57960314fe 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device =
*dev,
> >                       return ret;
> >       }
> >
> > +     for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > +             const struct drm_crtc_helper_funcs *funcs;
> > +
> > +             funcs =3D crtc->helper_private;
> > +
> > +             if (!funcs || !funcs->atomic_check)
> > +                     continue;
> > +
> > +             ret =3D funcs->atomic_check(crtc, state);
> > +             if (ret) {
> > +                     drm_dbg_atomic(crtc->dev,
> > +                                    "[CRTC:%d:%s] atomic driver check =
failed\n",
> > +                                    crtc->base.id, crtc->name);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +
> > +
>
> Too many empty lines. But the main quesiton is: why are you calling it
> before mode_valid()? According to your description a better place would
> be in drm_atomic_helper_check_planes().
>
Agree, that's the proper function. Will remove the empty line in next versi=
on.

> >       ret =3D mode_valid(state);
> >       if (ret)
> >               return ret;
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
>
