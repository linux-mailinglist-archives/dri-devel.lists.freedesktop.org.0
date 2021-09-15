Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A540BCEF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 03:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E116E885;
	Wed, 15 Sep 2021 01:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DFD6E884;
 Wed, 15 Sep 2021 01:10:51 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id a66so1728870qkc.1;
 Tue, 14 Sep 2021 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFsIrIsUJA10emZTQ9WdZY7m0L0AdB4Qt0/aDsH3C0o=;
 b=DUMxrgRYECkVYyGpJy1IZ6TwdNDkgGWRI9+iOFO/XyPYGQCFY0ooLK8O86eGSOHF6j
 mGOT4twS4+/LjpiFaJ4ummDPmU69Vecd9vy3nz/n8FzK5w0wGt6TRqlKeycGLEXTQcgb
 9DbiDHpFHM23T7fQ6Ix3oP8b4tF6/yREX7AA5yRL8C4mRGqOcJZkpVPs8tEQyDwXOpVx
 doQe0vYkQPxIlF+IRNU37R/NKYUzZ07OhYTK7lI8WmtcfacVIeZc6h2auayc4Kjqfm78
 PTewg/6YMQjx9lLSwGjTiqYpT6kl3CITB3fOfSLVkuXdLgAOgJfwuGeLoPZS3e7PwmYg
 kTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFsIrIsUJA10emZTQ9WdZY7m0L0AdB4Qt0/aDsH3C0o=;
 b=Ky+nZ3tDAYcMB0dzNnIuQAJryFI/nq8BmgZ9EY0OHE6LiFhW+KuSq92wlytSS9CAbz
 lhzHqVNLKsHrj5GM0kNRJ41roL4cKcVIKgGb/tl3dYiuD/qWf1ea79dNE7YkjhyiyqrQ
 5aM6z2onBdUiNt6+KGQy5gy+PW0mC01h7++U/SyM4byMlPXPUL6HGluY0NNa0RglUeCu
 uQFap4QeDB5XReC+717Nhn/ySAjlr9a4zFZf6R9JidiC97EKNAzVew62aqWHNlYehwCS
 JFzMq3//Ib5mT2Z0ayJb2nfLsy72xsRJXhAUZByZggnYpjfGho30BysMOvy/YAr1qxHB
 Dwxw==
X-Gm-Message-State: AOAM531Lv9tg0A/l3QFx0Ba4fnkD+A4zDKA82e2AxEJIsacciuNTDx55
 cYhx7Sox2/i4xlTJgcyQqi6z14+L7538VxnH1M0=
X-Google-Smtp-Source: ABdhPJzu+c1FhspoPYhHLZWxGOnO2JWauEKNmChoxGK3avx1CYb6bFVTwYYn3YuioXwKHth49+HYcqY4QLT8J6U29w0=
X-Received: by 2002:a37:68d0:: with SMTP id d199mr7536284qkc.96.1631668249998; 
 Tue, 14 Sep 2021 18:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210913193509.3575-1-anarsoul@gmail.com>
 <87r1dr34nk.fsf@intel.com>
 <410de2c8e865446ec7f9d72a419b2674d34891bf.camel@redhat.com>
 <87v932zt5j.fsf@intel.com>
In-Reply-To: <87v932zt5j.fsf@intel.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 14 Sep 2021 18:10:24 -0700
Message-ID: <CA+E=qVdELSDKWBwyayTDjRr+RXuWjXN6Vb8EzbgS_0YTb=1dFg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: add a delay before setting panel brightness
 after power on
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, 
 Aaron Ma <aaron.ma@canonical.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Sep 14, 2021 at 3:31 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 14 Sep 2021, Lyude Paul <lyude@redhat.com> wrote:
> > On Tue, 2021-09-14 at 12:09 +0300, Jani Nikula wrote:
> >> On Mon, 13 Sep 2021, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> >> > Panel in my Dell XPS 7590, that uses Intel's HDR backlight interface to
> >> > control brightness, apparently needs a delay before setting brightness
> >> > after power on. Without this delay the panel does accept the setting
> >> > and may come up with some arbitrary brightness (sometimes it's too dark,
> >> > sometimes it's too bright, I wasn't able to find a system).
> >> >
> >> > I don't have access to the spec, so I'm not sure if it's expected
> >> > behavior or a quirk for particular device.
> >> >
> >> > Delay was chosen by experiment: it works with 100ms, but fails with
> >> > anything lower than 75ms.
> >>
> >> Looks like we don't respect the panel delays for DPCD backlight. The
> >> values are used for setting up the panel power sequencer, and thus PWM
> >> based backlight, but we should probably use the delays in DPCD backlight
> >> code too.
> >
> > This makes sense to me, you're referring to the panel delays in the VBT
> > correct?
>
> Yes. See pps_init_delays() and intel_pps_backlight_on(). The delays
> aren't applied to DPCD backlight, I think it would make sense if they
> were.

I guess it explains why it usually stops working after suspend.
Probably BIOS doesn't re-init the power sequencer on resume.

> BR,
> Jani.
>
> >
> >>
> >> BR,
> >> Jani.
> >>
> >>
> >> >
> >> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
> >> >  1 file changed, 4 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> > index 4f8337c7fd2e..c4f35e1b5870 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> >> > @@ -210,6 +210,10 @@ intel_dp_aux_hdr_enable_backlight(const struct
> >> > intel_crtc_state *crtc_state,
> >> >
> >> >         ctrl = old_ctrl;
> >> >         if (panel->backlight.edp.intel.sdr_uses_aux) {
> >> > +               /* Wait 100ms to ensure that panel is ready otherwise it
> >> > may not
> >> > +                * set chosen backlight level
> >> > +                */
> >> > +               msleep(100);
> >> >                 ctrl |= INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE;
> >> >                 intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
> >> >         } else {
> >>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
