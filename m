Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837D9FA3CF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 05:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116210E0CC;
	Sun, 22 Dec 2024 04:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="shXRlPQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AF210E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 04:47:30 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6efe5c1dea4so24717137b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 20:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734842849; x=1735447649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qXoND6O11mq97Zk2qfFQAMBXTO4GQEYwGOWJHinBSI=;
 b=shXRlPQnpzyR9F8l+nhVZzcUOcgG+K1+u8fVXZ77I94jkv4+sSlAwgHUH215LBajKu
 JlNWka4TJKp8JuvR0GCtLyMNKILlc8BddRov0rL0kPTmqRvvlZ+dgl380pksE5H8uW8y
 0qeFAfBPKqfApTBDxkhvJ28Yv8k6GzRC3lJz1okiYSoKkODQr2UU0TR0znO3C+1apya1
 ODR08IkGODz3vDSIzkAREXeNvXjQfAKPYEKDXhFq7bTveO0CDaM+SZO+4tX98FQeCuBs
 YyAvKeqpuoNhzWP5HgR0TyIH/MnoG6ix6RBP1dOjDUF3Freu+9VrpkvdNq6I9P3RFA5y
 Ierg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734842849; x=1735447649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qXoND6O11mq97Zk2qfFQAMBXTO4GQEYwGOWJHinBSI=;
 b=rJAJm4TKFZIjY51QSayF1R/R/HqC7eX97q6Q1cJY48GNZcfoxI0R6nYxuig5x/qdEo
 yKmXY3Ndb2toOmPfEdTMk56n/CU/5oZfwEqFN6K7AoUt1cAKF4iyj8Xdf9bVbmOzGAwc
 yC6RJU+v13NaynzlVAgci6vPFUEiJPsn119WNGr/61g8muzl2BiHbXZmbsYlj+CAYzFq
 mz51/rZtUevdBEqx3YqT3pSYtCO5d0XDZKrZKx1bRBejs2p3KdYxpKcvrlx5PXWCWMxi
 CQH/cvw1++526XjJW3JsaDRK3G73aT3BZcRUh/lbTBlTt5eHR4GkRs0vxzRKSYsYo/Kt
 XB6g==
X-Gm-Message-State: AOJu0YyjIrV2A27tsp48dGfuUq/iUdeZ+1ogmPHXi8xXWQPrZjF+KQ+E
 P3ebwzAcwsequCc6edzvJEPPblhmmXr8t0yrqSccN/5KKZdsSLhpkfjEyjCp3M0AY17bL/OsEMd
 JL9es3FqjzIU0UAzBX9Frs7Bw4DNN5JNVC+eM/Q==
X-Gm-Gg: ASbGncskNk9QIk/XBY51TzmdJq5DbA0wyxbFlvmXo5sXwYCXYzHWN55yF51UfxxA96c
 3p6zXtBIXxVqGHelRSwkqSpm6iy3R8wXud1eu982Mi9zDPB8aUW8D
X-Google-Smtp-Source: AGHT+IE+JYIikqirF4cWT36/2N8rJ7PXBnk9hOw1VlrYFdwXv2kSYGjyAhsQVVrB1KNYU/DSRUHw2IUjBeX8N/Khvfc=
X-Received: by 2002:a05:690c:5808:b0:6f0:21d6:4494 with SMTP id
 00721157ae682-6f3f80d9131mr41072687b3.7.1734842849587; Sat, 21 Dec 2024
 20:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20231011092051.640422-1-daniel.vetter@ffwll.ch>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 06:47:18 +0200
Message-ID: <CAA8EJppQ+wthunhqPsyUuVpEVmu46Eh3HveJwuq8p+LHWR6Ygg@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel.vetter@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Manasi Navare <navaremanasi@google.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
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

Hello,

On Wed, 11 Oct 2023 at 12:20, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> msm is automagically upgrading normal commits to full modesets, and
> that's a big no-no:
>
> - for one this results in full on->off->on transitions on all these
>   crtc, at least if you're using the usual helpers. Which seems to be
>   the case, and is breaking uapi
>
> - further even if the ctm change itself would not result in flicker,
>   this can hide modesets for other reasons. Which again breaks the
>   uapi
>
> v2: I forgot the case of adding unrelated crtc state. Add that case
> and link to the existing kerneldoc explainers. This has come up in an
> irc discussion with Manasi and Ville about intel's bigjoiner mode.
> Also cc everyone involved in the msm irc discussion, more people
> joined after I sent out v1.

I have been looking at the drm_atomic_helper_check_modeset() issue, I
couldn't help but notice that this hasn't been committed.
Maybe it's time for v3?

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Manasi Navare <navaremanasi@google.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index cf8e1220a4ac..545c48545402 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -372,8 +372,27 @@ struct drm_atomic_state {
>          *
>          * Allow full modeset. This is used by the ATOMIC IOCTL handler t=
o
>          * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers shou=
ld
> -        * never consult this flag, instead looking at the output of
> -        * drm_atomic_crtc_needs_modeset().
> +        * not consult this flag, instead looking at the output of
> +        * drm_atomic_crtc_needs_modeset(). The detailed rules are:
> +        *
> +        * - Drivers must not consult @allow_modeset in the atomic commit=
 path,
> +        *   and instead use drm_atomic_crtc_needs_modeset().
> +        *
> +        * - Drivers may consult @allow_modeset in the atomic check path,=
 if
> +        *   they have the choice between an optimal hardware configurati=
on
> +        *   which requires a modeset, and a less optimal configuration w=
hich
> +        *   can be committed without a modeset. An example would be subo=
ptimal
> +        *   scanout FIFO allocation resulting in increased idle power
> +        *   consumption. This allows userspace to avoid flickering and d=
elays
> +        *   for the normal composition loop at reasonable cost.
> +        *
> +        * - Drivers must consult @allow_modeset before adding unrelated =
struct
> +        *   drm_crtc_state to this commit by calling
> +        *   drm_atomic_get_crtc_state(). See also the warning in the
> +        *   documentation for that function.
> +        *
> +        * - Drivers must never change this flag, it is only under the co=
ntrol
> +        *   of userspace.
>          */
>         bool allow_modeset : 1;
>         /**
> --
> 2.40.1
>


--=20
With best wishes
Dmitry
