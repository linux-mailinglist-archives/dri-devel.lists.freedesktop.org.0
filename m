Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2326D8ED9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 07:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459D510EAD8;
	Thu,  6 Apr 2023 05:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2248210EAD8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 05:33:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94706a972f3so10045266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 22:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680759222; x=1683351222;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LlhKyDdCS8tjZZVSetQBGPdajpitrR2LB+A3xrN7ebo=;
 b=X09EU2h4W9xa0EBV9xkW23CpwYKt+/SSMHOFRifPyhmqjOXW06lU+vzbXPFCufRlVs
 E6YoWDfPEkRyqnPID/DDhYojT/rJqLSccuVuJ3RAsfDpbnceEHHr6KAmB+vdxbC+XtM7
 1vov1rpmIx1Uzps3lKaruYot0+YAdyeMfCM3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680759222; x=1683351222;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LlhKyDdCS8tjZZVSetQBGPdajpitrR2LB+A3xrN7ebo=;
 b=dgu2eNoevAekuuE9v7jjeeNwV+PKmiA/oD94GdT8GJhNmHy72AClZoxeX4OIxEQhEl
 Zima/bUfuibfHR5eHPgxA2Ueizwh7rr3PLj1aSNzcJlNFURqFrbaMGOvPKTb4JI9Gu2Z
 EMb9kOzCz/+uCqHYNHofV2Cdy9TBTQBj9gjkorxWWDgJZlcsqe8IojbwKNj6uyHTtqTu
 gLNN3C8OIfI2kG24BC8u3G96DII14ejIhcxlbxf061k99diualXA//drM3P6pylGvh+f
 woifC6dwJub/a7mWez3GDRxII7Zog5LzpIe6A4g5lSzv80p+H4NShQ8JCEWoIVQOYR5b
 L5tw==
X-Gm-Message-State: AAQBX9e9f3CQw4G8Yx1elR0188VrxdgZwJMtKtPK8dtc3YUtXmv9nrPn
 ycsn3RcfH8cp6m7BoaMlRruJBQ==
X-Google-Smtp-Source: AKy350bZSL9jYbQLkFQk5JwKFwqfd/z1/KvQgvEpWo1Gc/++msO3WANDZEiHwOh9/U7ZkH92ZT+Awg==
X-Received: by 2002:a17:906:20d7:b0:930:aa02:f9cf with SMTP id
 c23-20020a17090620d700b00930aa02f9cfmr3589925ejc.2.1680759222408; 
 Wed, 05 Apr 2023 22:33:42 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 ml15-20020a170906cc0f00b00947732c6521sm309396ejb.79.2023.04.05.22.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 22:33:41 -0700 (PDT)
Date: Thu, 6 Apr 2023 07:33:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/atomic-helper: Don't set deadline for
 modesets
Message-ID: <ZC5ZtOdJSM3nDapM@phenom.ffwll.local>
References: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
 <20230405133105.947834-1-daniel.vetter@ffwll.ch>
 <CAF6AEGsFTSSQMMnr8PkJ4CBhwVnYBsxdZGP1SO9aZyeLhO0Ohg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsFTSSQMMnr8PkJ4CBhwVnYBsxdZGP1SO9aZyeLhO0Ohg@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 06:50:22AM -0700, Rob Clark wrote:
> On Wed, Apr 5, 2023 at 6:31 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > If the crtc is being switched on or off then the semantics of
> > computing the timestampe of the next vblank is somewhat ill-defined.
> > And indeed, the code splats with a warning in the timestamp
> > computation code. Specifically it hits the check to make sure that
> > atomic drivers have full set up the timing constants in the drm_vblank
> > structure, and that's just not the case before the crtc is actually
> > on.
> >
> > For robustness it seems best to just not set deadlines for modesets.
> >
> > v2: Also skip on inactive crtc (Ville)
> >
> > Link: https://lore.kernel.org/dri-devel/dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org/
> > Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # test patch only
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Merged to drm-misc-next, thanks for review.

> 
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index f21b5a74176c..d44fb9b87ef8 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1528,6 +1528,12 @@ static void set_fence_deadline(struct drm_device *dev,
> >         for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> >                 ktime_t v;
> >
> > +               if (drm_atomic_crtc_needs_modeset(new_crtc_state))
> > +                       continue;
> > +
> > +               if (!new_crtc_state->active)
> > +                       continue;
> > +
> >                 if (drm_crtc_next_vblank_start(crtc, &v))
> >                         continue;
> >
> > --
> > 2.40.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
