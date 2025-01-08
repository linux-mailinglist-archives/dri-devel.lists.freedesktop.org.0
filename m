Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A38A06327
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEDA10EC2A;
	Wed,  8 Jan 2025 17:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EdfhmN3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE47C10EC25
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:17:12 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso646434e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736356571; x=1736961371; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l9X8CQCnuPutcYoOcd2ZvWq5YsN89C/lf2G76Z1uyvM=;
 b=EdfhmN3Cg/xMt2PUWrTgN3324Mzid5mstAHWkasw/mhXC78WWnm3YGobRiXNpnOiPI
 tRiOpdEohpP4XLuj7J3nkEB0z9oLFFDGjKoyBgNZ93TQpuNjltQML7lKrc8tBmsjqLhj
 eKnV/BAHQCupf7Isy8I0Gf8xmIHROZUBJl9Bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736356571; x=1736961371;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l9X8CQCnuPutcYoOcd2ZvWq5YsN89C/lf2G76Z1uyvM=;
 b=WnjvegCeF64DNr+vOaUCMf5Y3Tk8/CcueSK5mqY1DBAayD/leCR+aAuS76JcsNj8Tp
 uqA8pVMVQw94xm2br57CeGfs9elE04hBxE7GpWQmkQ35tpe58buOsN3o1FZuTMwGGS4y
 cCGlHWgcC/OJvxsSPMCnVAmpZyAx9C+pM4tMPXxAi5LDDgoxHvqiTza84Ai3+WgQAMMj
 QrE/FUyer/feZBGy0K5krx9b0m45X+pAE8zgND5zohvPdsLg/0QRVzq81kiJx0eoofyv
 yfUbXzeE1VHKah4XTeNROTD5UOhSwN98gR6jnxmkHP4UxCy+PVHBGYRsyGzQKb5QE0sJ
 Imcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYE1/3o60i4L0m90qOmrPR9EWOuLYmu1SOXidyoxBwRQbYbUWnD89c2uOALwVSmQj8PTS0LXHUMPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhRVvJZz5SdRDxrZeiTJPhUcHk5hoHQqm8L+FD3G/QRH7CpPEt
 SJj6LszDCm0FeRAy5QTpEgcbPyfR8X6I3aigK0HxhAvq1J4JCR26p/9u65nGjNZzOh6OfWXc6LR
 +
X-Gm-Gg: ASbGnctG5T2gRyD1x4SPu5SmZWur1d+doGuknGByz7EjU7os5hONNWEy7J7F9pZDwzn
 wRFQZDAnM+wwqUgahmmOym6n//WpodR3Ur1i71iCJCglB+tuPmIogNAz2hTeKRK2guqUQvY8wYp
 cRCz6y3U4dTiAsc6nRKFE8xcFPM7nI+5A4mOmqoxxpZ+Yklfb6KfzfUmfw7D5NjeDXiEG97vIU8
 dU4rb54z+JQo1NxbJvS8ZBm0shE5xet5Zy1n6DTiS4W1tF4liAXbsTjZy70EDvMtEc8
X-Google-Smtp-Source: AGHT+IEbwJ/FJv1gTkfktoO4De/oO9VDHTz3du2nYjzacNpp69T+f56RzkkUF0gbXqDa7b64DGu42w==
X-Received: by 2002:a05:600c:1795:b0:434:f2af:6e74 with SMTP id
 5b1f17b1804b1-436e883c7b8mr941585e9.15.1736356113510; 
 Wed, 08 Jan 2025 09:08:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm52609101f8f.10.2025.01.08.09.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:08:32 -0800 (PST)
Date: Wed, 8 Jan 2025 18:08:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Simon Ser <contact@emersion.fr>,
 Manasi Navare <navaremanasi@google.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Message-ID: <Z36xDu0bs_-4LOlw@phenom.ffwll.local>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
 <CAA8EJppQ+wthunhqPsyUuVpEVmu46Eh3HveJwuq8p+LHWR6Ygg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppQ+wthunhqPsyUuVpEVmu46Eh3HveJwuq8p+LHWR6Ygg@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Sun, Dec 22, 2024 at 06:47:18AM +0200, Dmitry Baryshkov wrote:
> Hello,
> 
> On Wed, 11 Oct 2023 at 12:20, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > msm is automagically upgrading normal commits to full modesets, and
> > that's a big no-no:
> >
> > - for one this results in full on->off->on transitions on all these
> >   crtc, at least if you're using the usual helpers. Which seems to be
> >   the case, and is breaking uapi
> >
> > - further even if the ctm change itself would not result in flicker,
> >   this can hide modesets for other reasons. Which again breaks the
> >   uapi
> >
> > v2: I forgot the case of adding unrelated crtc state. Add that case
> > and link to the existing kerneldoc explainers. This has come up in an
> > irc discussion with Manasi and Ville about intel's bigjoiner mode.
> > Also cc everyone involved in the msm irc discussion, more people
> > joined after I sent out v1.
> 
> I have been looking at the drm_atomic_helper_check_modeset() issue, I
> couldn't help but notice that this hasn't been committed.
> Maybe it's time for v3?

Oops. Working on it now.
-Sima

> 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Manasi Navare <navaremanasi@google.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index cf8e1220a4ac..545c48545402 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -372,8 +372,27 @@ struct drm_atomic_state {
> >          *
> >          * Allow full modeset. This is used by the ATOMIC IOCTL handler to
> >          * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers should
> > -        * never consult this flag, instead looking at the output of
> > -        * drm_atomic_crtc_needs_modeset().
> > +        * not consult this flag, instead looking at the output of
> > +        * drm_atomic_crtc_needs_modeset(). The detailed rules are:
> > +        *
> > +        * - Drivers must not consult @allow_modeset in the atomic commit path,
> > +        *   and instead use drm_atomic_crtc_needs_modeset().
> > +        *
> > +        * - Drivers may consult @allow_modeset in the atomic check path, if
> > +        *   they have the choice between an optimal hardware configuration
> > +        *   which requires a modeset, and a less optimal configuration which
> > +        *   can be committed without a modeset. An example would be suboptimal
> > +        *   scanout FIFO allocation resulting in increased idle power
> > +        *   consumption. This allows userspace to avoid flickering and delays
> > +        *   for the normal composition loop at reasonable cost.
> > +        *
> > +        * - Drivers must consult @allow_modeset before adding unrelated struct
> > +        *   drm_crtc_state to this commit by calling
> > +        *   drm_atomic_get_crtc_state(). See also the warning in the
> > +        *   documentation for that function.
> > +        *
> > +        * - Drivers must never change this flag, it is only under the control
> > +        *   of userspace.
> >          */
> >         bool allow_modeset : 1;
> >         /**
> > --
> > 2.40.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
