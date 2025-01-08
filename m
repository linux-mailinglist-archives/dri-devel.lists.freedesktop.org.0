Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8527A06342
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F4C10E8FF;
	Wed,  8 Jan 2025 17:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UenRY4H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FB610E8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:23:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso699225e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736356972; x=1736961772; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IuMTWEE34LTwCONdBQJyem43lDwsYMStQjJZkRaJVcs=;
 b=UenRY4H+5UlZo1C6uUh0FxZiUpO9FbksT7ChO0YKtgv+o0NCrNgzdK8iejPxncZeQD
 GL9G8CrkMG3FStYJCmGX572iVXYyiglLem3WHJ0CW0cTYb6SNduY79DmzevEkQcX7FCH
 5xDxGBMRoKOJof0rw92IsdU5620RT61nt4G7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736356972; x=1736961772;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IuMTWEE34LTwCONdBQJyem43lDwsYMStQjJZkRaJVcs=;
 b=GyH7fmKJOJ2FEGKpCz/HjI9HQBJd3jzRCcvqMa8URk8hoBYJjkkNa0an6kokKZmwqA
 aN0rXYi2c5EZ3XJTGNroJO3SnkZ2taz7ClZfv+yqqHmxl1cVkw7ievsejykBScKk/KOW
 twPr6OF+CD6XtfMxg/YHBoyFqgTQtyZKYSoTUJmlYaOSC8xzmh841NoyaSTA4fBavTGi
 +cQDNOA7DpTHlmkJPkcpdsY2ZwQm+kcIYTSvlFLex6ECJYd597YxAdm8DF1tUywwoyWD
 4f4FHpDaDNkSvfUT+ZydexTz15f41clmKLx5an2l2s4V7KEuscOcUGDRhdmqsibu4WDI
 r9eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4tNNTL27kSyMFKoXqKVno52jTQIjPAr/Zflg5UH4xvU2xmlEqwvktw+FIHQd1ML/tRGbcUnorWd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5UnnvmxB7l4VPz+HgaTW7DG4SfvvIsjmjHlqx3jGHEaCzsqU8
 cXDxselLUvQhVJYx3n/AEGxROSuLn23Q9yD+xUQEJtg/3mZpvmYYUrQxV3YArxk=
X-Gm-Gg: ASbGncvOtrUTCjQJBta7eCZHGiZ5xSzDPEeNzXT96+JFCOZ0YHKln6gtXHsz/7bEsgv
 tta8d1y824L5EZIT0siY5RsB9NnYG6dHrgmbuc3CjMUoniXMWOgjYDaTuEPoS3LXX30qdo+WSA1
 BcvUnG21VvPzE7F3wDqBJSQQS3WDOBiKg3SH6n8lQDJQ+jrH6WeDdhLjoV2ObTCQpX1beaZ3rwn
 F8RcbVoSHrtHldN/HIxrIRwkSRxK8jyuym7zXq80ZO10HrQE9oUyv5RfWH6HTd6kr2z
X-Google-Smtp-Source: AGHT+IFEMwtCfoeJHstuBjqegXmKONZqguaFEUxX6l3zfOwFrjeGaCm5Xp7gFWDt4HWLwsA5joed2g==
X-Received: by 2002:a05:600c:3c97:b0:436:840b:261c with SMTP id
 5b1f17b1804b1-436e26ab54fmr31196825e9.19.1736356972080; 
 Wed, 08 Jan 2025 09:22:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm45640785e9.1.2025.01.08.09.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:22:51 -0800 (PST)
Date: Wed, 8 Jan 2025 18:22:49 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Manasi Navare <navaremanasi@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Message-ID: <Z360aeAkou2OXMCg@phenom.ffwll.local>
References: <20231010170746.617366-1-daniel.vetter@ffwll.ch>
 <20231011092051.640422-1-daniel.vetter@ffwll.ch>
 <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edea5e48-2723-49ea-ad03-8cd3d9aa53b3@suse.de>
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

On Wed, Oct 11, 2023 at 12:53:14PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.10.23 um 11:20 schrieb Daniel Vetter:
> > msm is automagically upgrading normal commits to full modesets, and
> 
> Can you give context or pointers here?

See Dmitry's enforcement patch set he just sent out. Also finally got
around to picking this up again.

> > that's a big no-no:
> > 
> > - for one this results in full on->off->on transitions on all these
> >    crtc, at least if you're using the usual helpers. Which seems to be
> >    the case, and is breaking uapi
> > 
> > - further even if the ctm change itself would not result in flicker,
> >    this can hide modesets for other reasons. Which again breaks the
> >    uapi
> > 
> > v2: I forgot the case of adding unrelated crtc state. Add that case
> > and link to the existing kerneldoc explainers. This has come up in an
> > irc discussion with Manasi and Ville about intel's bigjoiner mode.
> > Also cc everyone involved in the msm irc discussion, more people
> > joined after I sent out v1.
> > 
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
> >   include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
> >   1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index cf8e1220a4ac..545c48545402 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -372,8 +372,27 @@ struct drm_atomic_state {
> >   	 *
> >   	 * Allow full modeset. This is used by the ATOMIC IOCTL handler to
> >   	 * implement the DRM_MODE_ATOMIC_ALLOW_MODESET flag. Drivers should
> > -	 * never consult this flag, instead looking at the output of
> > -	 * drm_atomic_crtc_needs_modeset().
> > +	 * not consult this flag, instead looking at the output of
> > +	 * drm_atomic_crtc_needs_modeset(). The detailed rules are:
> 
> Comments on the text from a non-native speaker:
> 
> 
> I assume that you follow RFC 2119. I'd leave out the new sentence ('should
> not'), as it is weaker than the actual rules. Maybe list the rules directly.
> Something along the lines of "Drivers consulting this flag must follow the
> following rules".
> 
> > +	 *
> > +	 * - Drivers must not consult @allow_modeset in the atomic commit path,
> 
> 'atomic-commit' because it's the code path for atomic commits.

Maybe I'm wrong, but my understanding is that English generally doesn't do
compound words connected with dashes, you just line them up with spaces.
Which can be confusing sometimes, especially since German very much makes
a distinction here.

> 
> > +	 *   and instead use drm_atomic_crtc_needs_modeset().
> > +	 *
> > +	 * - Drivers may consult @allow_modeset in the atomic check path, if
> 
> 'atomic-check'
> 
> > +	 *   they have the choice between an optimal hardware configuration
> 
> comma after configuration

Nope, because English doesn't have unconditional comma before relative
subclauses. Instead the lack of comma signifies that the subclause
specifies essential information which cannot be ommitted without changing
the meaning of the sentence. Which is the case here for all the commas you
want to add.

See https://prowritingaid.com/grammar/1008112/comma-before-which-where-who

> 
> > +	 *   which requires a modeset, and a less optimal configuration which
> 
> 'less-optimal'
> 
> > +	 *   can be committed without a modeset. An example would be suboptimal
> > +	 *   scanout FIFO allocation resulting in increased idle power
> This sentence is hard to understand for me. Is it 'scanout FIFO allocation'
> or 'scanout-FIFO allocation'? Maybe also try putting a comma after
> 'allocation'.

See above, I think this is just English being English.

> > +	 *   consumption. This allows userspace to avoid flickering and delays
> > +	 *   for the normal composition loop at reasonable cost.
> > +	 *
> > +	 * - Drivers must consult @allow_modeset before adding unrelated struct
> > +	 *   drm_crtc_state to this commit by calling
> > +	 *   drm_atomic_get_crtc_state(). See also the warning in the
> > +	 *   documentation for that function.
> > +	 *
> > +	 * - Drivers must never change this flag, it is only under the control
> 
> Maybe try 'it is under exclusive control of user space' ?
> 
> > +	 *   of userspace.
> 
> I'd also order these points like that
> 
>   - must not change
>   - must not use it in atomic_commit
>   - must
>   - may
> 
> so that the 'don't dos' are first.

I've done your other changes as suggested.

Thanks, Sima


> 
> Best regards
> Thomas
> 
> >   	 */
> >   	bool allow_modeset : 1;
> >   	/**
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)




-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
