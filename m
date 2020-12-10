Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281792D621E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DD76EAAF;
	Thu, 10 Dec 2020 16:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88E6EB10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:39:12 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id i18so1416288ooh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 08:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJRm3v7ItvgaUjkJm+5j/gJn9WVwcF1OXOWEzmMuGHQ=;
 b=arxEe6LRGbDK1IP+jBK+aqQuMT8HLqp6LWtKFgBu3gjAGqe8lQrGhEwjIfsYXsBpHX
 50nhoiTDZmvH72q3McNiEaK1ST+2MbR/4tziplo1JQmUpuAatIDxG359NWddxnCZYhIs
 N09zHcyK+ES+xzuhWevS22S8wBwRGsmbTAJqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJRm3v7ItvgaUjkJm+5j/gJn9WVwcF1OXOWEzmMuGHQ=;
 b=IYckpQxlhW7StNNhLOxhAIRYEdhsGYpnZZ87gjpkK2gRUpuNkTNXc82GBCv0JL6efN
 f9JR7yCWNZM1ckiGqN2LNl6CAVJoJnKZKJCZgI4rvnVrGkTQB2+nEfe+61pO5r/mkxQY
 eNP+RscAMO+06R2m4xfIWEaYuY9pe+OjeTn70zuPJcnPqmHExFJDPooUMEXun0xMLxxL
 F8bAQx9QXCiK7yIOibVqKMx1RrAZnmwZbj3xGieHyfs1RJ9a1iBw14Q1wywkj+2wyAny
 Bhl7Grdd64E82O0qtdVpelBV1FfbMEQdVyVseRHHep1ZxEJmm7PN2z60qP8Hf6m1EGji
 QLOQ==
X-Gm-Message-State: AOAM5305anl+POVKhzAMVOkDB4hTIgtBjtuM1HmW6tNNX5NH1T+h6nTu
 oBUmVu5H7VSo3Rd5cNo3ez9q6pi1EmaZIuRcitQjdA==
X-Google-Smtp-Source: ABdhPJwpVWwnbYDBlFnGD70gZR3qqU440owjD9INTHJDtFqEbSTm4jX/DMKmJNjOlV0btOu3mCvqSZRxK33/OQsVTdc=
X-Received: by 2002:a4a:84c9:: with SMTP id o9mr6531848oog.28.1607618351960;
 Thu, 10 Dec 2020 08:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
 <20201210140852.1040054-2-tomi.valkeinen@ti.com>
 <20201210152739.GF401619@phenom.ffwll.local>
 <39cc67d5-1977-df56-0fbb-1b8531398e81@ti.com>
In-Reply-To: <39cc67d5-1977-df56-0fbb-1b8531398e81@ti.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 10 Dec 2020 17:39:00 +0100
Message-ID: <CAKMK7uHzT-tG2_iwk7kfPRPi27O5Rkz5P0fweUgdE1eL=YYRdg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm: automatic legacy gamma support
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 4:43 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 10/12/2020 17:27, Daniel Vetter wrote:
>
> >> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >> index e82db0f4e771..80e3797f0f01 100644
> >> --- a/drivers/gpu/drm/drm_fb_helper.c
> >> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >> @@ -46,6 +46,7 @@
> >>  #include <drm/drm_print.h>
> >>  #include <drm/drm_vblank.h>
> >>
> >> +#include "drm_crtc_internal.h"
> >
> > So this is a bit annoying, because thus far we managed to have a very
> > clear split between core and helpers. And I think we can keep that.
> >
> >>  #include "drm_crtc_helper_internal.h"
> >>  #include "drm_internal.h"
> >>
> >> @@ -136,15 +137,15 @@ static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
> >>  {
> >>      uint16_t *r_base, *g_base, *b_base;
> >>
> >> -    if (crtc->funcs->gamma_set == NULL)
> >> +    if (!drm_crtc_supports_legacy_gamma(crtc))
> >>              return;
> >>
> >>      r_base = crtc->gamma_store;
> >>      g_base = r_base + crtc->gamma_size;
> >>      b_base = g_base + crtc->gamma_size;
> >>
> >> -    crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> >> -                           crtc->gamma_size, NULL);
> >> +    drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> >> +                              crtc->gamma_size, NULL);
> >
> > This is only used by legacy non-atomic drivers. It's pretty much
> > impossible to make kgdb work with atomic drivers, so really let's just not
> > bother and keep the code as-is.
>
> You're right.
>
> >>  }
> >>
> >>  /**
> >> @@ -946,7 +947,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
> >>      drm_modeset_lock_all(fb_helper->dev);
> >>      drm_client_for_each_modeset(modeset, &fb_helper->client) {
> >>              crtc = modeset->crtc;
> >> -            if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> >> +            if (!drm_crtc_supports_legacy_gamma(crtc)) {
> >>                      ret = -EINVAL;
> >>                      goto out;
> >>              }
> >> @@ -964,8 +965,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
> >>              memcpy(g + cmap->start, cmap->green, cmap->len * sizeof(*g));
> >>              memcpy(b + cmap->start, cmap->blue, cmap->len * sizeof(*b));
> >>
> >> -            ret = crtc->funcs->gamma_set(crtc, r, g, b,
> >> -                                         crtc->gamma_size, NULL);
> >> +            ret = drm_crtc_legacy_gamma_set(crtc, r, g, b, crtc->gamma_size,
> >> +                                            NULL);
> >>              if (ret)
> >>                      goto out;
> >
> > Same here.
>
> Yep.
>
> >>      }
> >> @@ -1024,12 +1025,10 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
> >>      struct drm_device *dev = fb_helper->dev;
> >>      struct drm_property_blob *gamma_lut = NULL;
> >>      struct drm_modeset_acquire_ctx ctx;
> >> -    struct drm_crtc_state *crtc_state;
> >>      struct drm_atomic_state *state;
> >>      struct drm_mode_set *modeset;
> >>      struct drm_crtc *crtc;
> >>      u16 *r, *g, *b;
> >> -    bool replaced;
> >>      int ret = 0;
> >>
> >>      drm_modeset_acquire_init(&ctx, 0);
> >> @@ -1053,18 +1052,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
> >>                      goto out_state;
> >>              }
> >>
> >> -            crtc_state = drm_atomic_get_crtc_state(state, crtc);
> >> -            if (IS_ERR(crtc_state)) {
> >> -                    ret = PTR_ERR(crtc_state);
> >> +            ret = drm_crtc_gamma_ramp_set(state, crtc, gamma_lut);
> >> +            if (ret)
> >
> > You're nesting an atomic commit in an atomic commit here, that will go
> > boom. I guess ideally we'd move this into drm_client_modeset so it
> > remembers the fbdev gamma ramp and does it all in one go. Otherwise I
> > guess you need some kind of different helper, not sure what.
>
> What do you mean? Are you mixing drm_crtc_legacy_gamma_set with drm_crtc_gamma_ramp_set (yeah, I
> didn't quite know how to name the latter one...)? drm_crtc_gamma_ramp_set does the same thing as the
> removed code, it sets the gamma_lut in to the state. It doesn't commit.

I mean my brain's not working today at all :-/ You're right.

> drm_crtc_gamma_ramp_set does a "setup the state so that this gamma ramp will be on screen", which
> means setting/clearing GAMMA_LUT, DEGAMMA_LUT and CTM. I wanted to have that logic in one place,
> which means we need to export it from drm.ko.
>
> I could just inline drm_crtc_gamma_ramp_set, but then I need drm_mode_obj_find_prop_id, which is
> again not exported. I could also inline drm_mode_obj_find_prop_id as it's trivial enough loop. But
> this sounds uglier than exporting a function.
>
> Personally, I don't remember when I have used fbdev the last time (other than simple tests), and I
> could as well just leave the code here as it is. I have no idea if this fbdev setcmap is a big
> feature that has to function also with HW that only has a pre-gamma table.

I have honestly no idea how much this is used. Maybe just throw a
FIXME comment on top of this here that it doesn't handle degamma and
should be moved into drm_client_modeset.c? And then leave the code
unchanged, we're not breaking anything by not implementing degamma
support for fbdev. Whomever cares can address that in a neat and clean
fashion.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
