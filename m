Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B8A1B96A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 16:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC3410E9CA;
	Fri, 24 Jan 2025 15:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="a7KUXlR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9210E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 15:37:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso14939335e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 07:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737733062; x=1738337862; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wKs2sXsb3Fmpshbg8ct9uIZl2b+3yE6jd5oQ2qZG9sM=;
 b=a7KUXlR1aKDCgo1ChfhczXHHVfzuANNp5SAZzOYvGc7fF7srCDNGfZUdXxisYk/20K
 71Gyjs2fWNK7wmsZRz01fgay3lMxQ5awvrDdv9j4pPB6/AFvEa+/tmNr4GmArrNuVzgv
 F9KNpNY1UXvPe7U69ISIJU0g+nT0hSAnf6vsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737733062; x=1738337862;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKs2sXsb3Fmpshbg8ct9uIZl2b+3yE6jd5oQ2qZG9sM=;
 b=ftMoLr0tlWWxhFP7Jwy7H/+WQp/3LzD35D3qX4wqJVl3SKVRztSTI8PfRgpeSgoQoi
 7GHGYIgRrqgYg1ydRiEJpyPqcpaTkkoX0PUDsvWjz38oPQvunC4U+r9UgxQdmOUDtFiJ
 HxyMdPZ629+/tAdtyEKnUjApKSpY5QrLck2XNIAbVZls7uJPRX1H8R9qn4+qflxNmb5U
 xeD6popGitz5Mwj43PRQaELOH9ghwcyNgXgJ8XiJErJ40aKNJdpc49Os3D3gxhrN0Uod
 4JstD9O7jQtr+1s1QZDobGH7Qh5Cgt8yrAikluvO0n3DzezIVfaFkB0rjk5iVQFdAU42
 SvoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS7qnAKj+PFO3YXCdrZCi1q2U+pRaNfhShTth1cIat4ikYsKdRHcmBR06fOCkWxxNvncpHYdVsN2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWRBRM0OykGb9zbiP+D5hSYpNm6LlPT2yF5jHcT+ivyfwks9BD
 zXfNHFjpVHNjz0MXYeM8tXGDV7ZStllPydP+x7pv2e9WRen4gCdwk1wKvEjIYfE=
X-Gm-Gg: ASbGncsg83K1SKdb/V9fbZIZOqqtYbIEi1zo3wOgYXIyWqv4AmohyhlbhG59Y3XcDxf
 D8k0Q9wYcV7i4v+JGlz3J93/X3TdV6vw/mQOlc5ihopTBNJIElF8P/1ajVvH6+ehwUjRuwZdy7e
 2x904R/0jvaPLwMiL+2irTzVK+okIEWWnT+W5QKgeEdI2mcjo84Dybp7EBGVw3cz7RpTIdaSH17
 R2rHTWSbV3dTl+ZdiL/ot3NPLCcSz/4sxPdtfp537TVRkPUvFGkdbzCLEDFBYG0g0TNOx/WcIxG
 9ewtsKrzhNahfheb
X-Google-Smtp-Source: AGHT+IEuZruYpm+m/S3swbgxLZg3ZYRSPjSYkPJ77/Sq30+2gSNYjiqyYD6oIqhqzOtVWi1flFhIZg==
X-Received: by 2002:a05:600c:154a:b0:42c:baf1:4c7 with SMTP id
 5b1f17b1804b1-438bd061259mr36094085e9.4.1737733062061; 
 Fri, 24 Jan 2025 07:37:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd508257sm29563785e9.23.2025.01.24.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 07:37:41 -0800 (PST)
Date: Fri, 24 Jan 2025 16:37:39 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <Z5OzwxBUjEDr00w6@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
 <Z5ODTg9iTjNKggzN@intel.com> <Z5OOo9yR7PVXXIj4@phenom.ffwll.local>
 <Z5ORyQ_49ZNmAxtq@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5ORyQ_49ZNmAxtq@intel.com>
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

On Fri, Jan 24, 2025 at 03:12:41PM +0200, Ville Syrjälä wrote:
> On Fri, Jan 24, 2025 at 01:59:15PM +0100, Simona Vetter wrote:
> > On Fri, Jan 24, 2025 at 02:10:54PM +0200, Ville Syrjälä wrote:
> > > On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> > > > There are several drivers which attempt to upgrading the commit to the
> > > > full mode set from their per-object atomic_check() callbacks without
> > > > calling the drm_atomic_helper_check_modeset() or
> > > > drm_atomic_helper_check() again (as requested by those functions).
> > > 
> > > I don't really understand why any of that is supposedly necessary.
> > > drm_atomic_helper_check_modeset() is really all about the
> > > connector routing stuff, so if none of that is changing then there
> > > is no point in calling it again. Eg. in i915 we call it just at
> > > the start, and later on we flag internal modesets all over the
> > > place, but none of those need drm_atomic_helper_check_modeset()
> > > because nothing routing related will have changed.
> > 
> > i915 doesn't need this because as you say, it doesn't rely on the atomic
> > helper modeset tracking much at all, but it's all internal. This is for
> > drivers which rely more or less entirely on
> > drm_atomic_crtc_needs_modeset().
> > 
> > Also note that it's not just about connector routing, but about adding all
> > the necessary additional states with
> > drm_atomic_add_affected_connectors/planes and re-running all the various
> > state computation hooks for those. Again i915 hand-rolls that all.
> 
> IIRC it only runs the connectors' atomic_check(),
> nothing else really. But maybe that's changed since I last
> looked at it.

It calls into connector/bridge/crtc callbacks related to modesets and mode
validation.

The thing is a few hundred lines in total if you include all the split out
subfunctions. Like the kerneldoc pretty clearly spells out that it does a
lot more than what you've listed here. Just i915 doesn't used most of
that.

> Anyways it feels like we're throwing everything and the
> kitchen sink into a single function here. Maybe it should be
> split into two or more functions with clear responsibilities?

I'm not sure you can split it up much, because modesetting is complicated.
Like even if you'd want to split out just the routing update logic that's
a pretty big mess with a bunch of callbacks so that we can pick the right
encoders to add the right bridges. And then have a 2nd function that does
the actual state computation/validation.

Not sure that's worth it, since only benefit would be for drivers like
i915 that almost entirely hand-roll their own atomic check flow and really
only need the connector routing bits. I guess if you're bored you could
give it a stab.
-Sima

> 
> > 
> > So yeah i915 doesn't need this.
> > -Sima
> > 
> > > 
> > > > 
> > > > As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> > > > whose only purpose is to allow the plane, connector, encoder or CRTC to
> > > > specify that for whatever reasons corresponding CRTC should undergo a
> > > > full modeset. The helpers will call these callbacks in a proper place,
> > > > adding affected objects and calling required functions as required.
> > > > 
> > > > The MSM patches depend on the msm-next tree and the series at [1]. The
> > > > plan is to land core changes through drm-misc, then merge drm-misc-next
> > > > into msm-next and merge remaining msm-specific patches through the
> > > > msm-next tree.
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > > Dmitry Baryshkov (6):
> > > >       drm/atomic-helper: add atomic_needs_modeset callbacks
> > > >       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
> > > >       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
> > > >       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
> > > >       drm/msm/dpu: use atomic_needs_modeset for CDM check
> > > >       drm/msm: drop msm_atomic_check wrapper
> > > > 
> > > >  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
> > > >  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
> > > >  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
> > > >  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
> > > >  drivers/gpu/drm/msm/msm_drv.h               |  1 -
> > > >  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
> > > >  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
> > > >  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
> > > >  12 files changed, 219 insertions(+), 89 deletions(-)
> > > > ---
> > > > base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> > > > change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> > > > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > > > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > > > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > > > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > > > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
