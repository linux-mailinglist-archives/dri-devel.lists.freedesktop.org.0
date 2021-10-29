Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87D43F52A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 05:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692DE6E9B3;
	Fri, 29 Oct 2021 03:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C786E9B2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 03:04:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f3so9851238lfu.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sz/ywpybSJaNoGZvXE51S8svzpVWcQnnlH6Pn9KYkKs=;
 b=ZmEiiWHwwmH9sspvNf9mrhJ2ObRJ3h0nMIjxiw96VyoUUf9YSApSJZfqOXVvoxC9o2
 2nNTRvI+hOfArkWqypwmgKHyrVVKMwWTM00K9H7hhtbiIoc8SL9+33+ElDW6nyEssJBo
 JBmzSYJX96qhj2o4D4Ul/QQM756ARdbZUdL8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sz/ywpybSJaNoGZvXE51S8svzpVWcQnnlH6Pn9KYkKs=;
 b=JYEip/j+MFrg0ZldB6b6FR9bOyZ3RcjgGCOW7PM1aYqQeT7VxmcwkiCqlS9+iwuQDA
 zg+n7c/uoXLmVLcSHjexg4QG+yxYVF97/TXxS83omGp+YNdXf2NXKj4RVPkwv8H2jOQH
 8c2yYprQL3bDZp1/UQxwOcw9+fYHQYI8j8yScD0UK5ago+LzPhmMEoRTClwLp47Gbj2L
 iIbGaZdEOb11J8vByjOJxaEY2hrQmCwWsG8qqtjjgdaB3+XVVLRkC8LVnlF/VODK1shd
 VyEMlUdWSd3Nhg3BIq8wRzZNdMrjB/4GtTsb2/tUozmsenFOUpYpMsOH+QQH6rOFEqsU
 NoMA==
X-Gm-Message-State: AOAM532HCqvu0TznXkkdSzHlEAJPNNOF1axlxDvdi6I/Glva0LSYG7mz
 bsZPT9+tGoWSefhLGdezXiVB0sVI5c+rzGbgR0Cfbg==
X-Google-Smtp-Source: ABdhPJxC0NS1t4ZTrK/U/w98ca7x/r/R5fRiRRC7PwYozOenIJEgQ0sp7JZwf/0TjkDGytKndTNOyCau++3Cm6xcZng=
X-Received: by 2002:a19:c1c2:: with SMTP id r185mr7493994lff.275.1635476645375; 
 Thu, 28 Oct 2021 20:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211026192104.1860504-1-markyacoub@chromium.org>
 <20211029004220.GA10475@art_vandelay>
In-Reply-To: <20211029004220.GA10475@art_vandelay>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 28 Oct 2021 23:03:54 -0400
Message-ID: <CAJUqKUpop4JodJjT+HBR7ayq2=G_8UdJatLFhty5XZTZ7xL8QQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm: Rename lut check functions to lut
 channel checks
To: Sean Paul <sean@poorly.run>
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de, 
 Mark Yacoub <markyacoub@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Oct 28, 2021 at 8:42 PM Sean Paul <sean@poorly.run> wrote:
>
> On Tue, Oct 26, 2021 at 03:21:00PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > This function and enum do not do generic checking on the luts but they
> > test color channels in the LUTs.
>
> I'm not sure there's anything inherently specific to channels, it seems like
> one could add a new test to reflect a HW limitation and it would fit pretty well
> in the lut check function. I wonder if it would be better to expose the types of
> tests required by the crtc such that the atomic_check could also do the test?
>
So the tests of the color are pretty unique to intel devices, no other
device is using it so I didn't think it adds a lot of benefit adding
it to the lut check. However, it's still in DRM because technically it
can be supported by any driver. But once it is, the driver will have
to expose the tests it wants so we can check it in atomic_check. but
given that no one does expose any test but intel, i just left it only
used by them.

> Sean
>
> > Keeping the name explicit as more generic LUT checks will follow.
> >
> > Tested on Eldrid ChromeOS (TGL).
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_color_mgmt.c           | 12 ++++++------
> >  drivers/gpu/drm/i915/display/intel_color.c | 10 +++++-----
> >  include/drm/drm_color_mgmt.h               |  7 ++++---
> >  3 files changed, 15 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index bb14f488c8f6c..6f4e04746d90f 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -585,17 +585,17 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
> >  EXPORT_SYMBOL(drm_plane_create_color_properties);
> >
> >  /**
> > - * drm_color_lut_check - check validity of lookup table
> > + * drm_color_lut_channels_check - check validity of the channels in the lookup table
> >   * @lut: property blob containing LUT to check
> >   * @tests: bitmask of tests to run
> >   *
> > - * Helper to check whether a userspace-provided lookup table is valid and
> > - * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
> > - * the tests in &drm_color_lut_tests should be performed.
> > + * Helper to check whether each color channel of userspace-provided lookup table is valid and
> > + * satisfies hardware requirements. Drivers pass a bitmask indicating which of in
> > + * &drm_color_lut_channels_tests should be performed.
> >   *
> >   * Returns 0 on success, -EINVAL on failure.
> >   */
> > -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
> > +int drm_color_lut_channels_check(const struct drm_property_blob *lut, u32 tests)
> >  {
> >       const struct drm_color_lut *entry;
> >       int i;
> > @@ -625,4 +625,4 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
> >
> >       return 0;
> >  }
> > -EXPORT_SYMBOL(drm_color_lut_check);
> > +EXPORT_SYMBOL(drm_color_lut_channels_check);
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> > index dab892d2251ba..4bb1bc76c4de9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -1285,7 +1285,7 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
> >       const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
> >       const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
> >       int gamma_length, degamma_length;
> > -     u32 gamma_tests, degamma_tests;
> > +     u32 gamma_channels_tests, degamma_channels_tests;
> >
> >       /* Always allow legacy gamma LUT with no further checking. */
> >       if (crtc_state_is_legacy_gamma(crtc_state))
> > @@ -1300,15 +1300,15 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
> >
> >       degamma_length = INTEL_INFO(dev_priv)->color.degamma_lut_size;
> >       gamma_length = INTEL_INFO(dev_priv)->color.gamma_lut_size;
> > -     degamma_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> > -     gamma_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
> > +     degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> > +     gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
> >
> >       if (check_lut_size(degamma_lut, degamma_length) ||
> >           check_lut_size(gamma_lut, gamma_length))
> >               return -EINVAL;
> >
> > -     if (drm_color_lut_check(degamma_lut, degamma_tests) ||
> > -         drm_color_lut_check(gamma_lut, gamma_tests))
> > +     if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
> > +         drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
> >               return -EINVAL;
> >
> >       return 0;
> > diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> > index 81c298488b0c8..cb1bf361ad3e3 100644
> > --- a/include/drm/drm_color_mgmt.h
> > +++ b/include/drm/drm_color_mgmt.h
> > @@ -94,12 +94,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
> >                                     enum drm_color_range default_range);
> >
> >  /**
> > - * enum drm_color_lut_tests - hw-specific LUT tests to perform
> > + * enum drm_color_lut_channels_tests - hw-specific LUT tests to perform
> >   *
> >   * The drm_color_lut_check() function takes a bitmask of the values here to
> >   * determine which tests to apply to a userspace-provided LUT.
> >   */
> > -enum drm_color_lut_tests {
> > +enum drm_color_lut_channels_tests {
> >       /**
> >        * @DRM_COLOR_LUT_EQUAL_CHANNELS:
> >        *
> > @@ -119,5 +119,6 @@ enum drm_color_lut_tests {
> >       DRM_COLOR_LUT_NON_DECREASING = BIT(1),
> >  };
> >
> > -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
> > +int drm_color_lut_channels_check(const struct drm_property_blob *lut,
> > +                              u32 tests);
> >  #endif
> > --
> > 2.33.0.1079.g6e70778dc9-goog
> >
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
