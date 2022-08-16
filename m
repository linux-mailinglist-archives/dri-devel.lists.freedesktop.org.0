Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09A595D75
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F8810F65E;
	Tue, 16 Aug 2022 13:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA572AB48D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:34:41 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id t11so8073913qkt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 06:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=hdhYrvwFVCJ/wIIa+DKIK8qp10gL+xmn48+Cm6GZTzY=;
 b=Iyp0HGvRUEbV8mGD+AYQBDr0mKU1wYJChEWA+Qc5PggNRrQMCIMfrDbYlbmj0ObeGC
 nJ7FlRT+HJfQKuDi+/jXiK0aYwk9PjVYBhVI53sffxhQuJ9wcqcGz3KdLE7lyHYmPcUN
 0ORm6lv4YiUo4rx0aBzqugRhVKqh9a41+U/Phtv/F+F96Ldtq1AQsU5Um4RmQ90q7GX8
 t0P79XrpS0qfWTKac1tpXKZX3vssyMrFkKL+pCspkoxCGEEJnyE84E6UPW6sMhNV4oQ8
 F/rekVPdTVQt4IOI0o/jCWD15TpugUQVm+G8pUE5ZPd2ANqLzS4uCuizNaTAgn6m5M8r
 3Xlw==
X-Gm-Message-State: ACgBeo1KRkM2s0+GCvrza4rB3jVW4DpTW52ZnObY0ldN1rTDKuibco/x
 6jkr9YthH82JBcJRTPSvJv/hdlUUHRfMzg==
X-Google-Smtp-Source: AA6agR4c6OLoP4b2tFVIwpPwVaqiP4WOegF4pwQtd2hYLzTMsuBv/1bfC3EATOYJNHtrb5c/lNog/Q==
X-Received: by 2002:a05:620a:24d4:b0:6bb:760:4b8f with SMTP id
 m20-20020a05620a24d400b006bb07604b8fmr9044497qkn.83.1660656880192; 
 Tue, 16 Aug 2022 06:34:40 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 bp44-20020a05620a45ac00b006b9439332e2sm11398157qkb.13.2022.08.16.06.34.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 06:34:40 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-333b049f231so39431817b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 06:34:40 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr10322596ywf.316.1660656559751; Tue, 16
 Aug 2022 06:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat>
In-Reply-To: <20220816132040.uwirtjm5yr6rdd3q@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 15:29:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
Message-ID: <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, Aug 16, 2022 at 3:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:25:18PM +0200, Geert Uytterhoeven wrote:
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
> > >   * 0 on success or a negative error code on failure.
> > >   */
> > >  int drm_mode_create_tv_properties(struct drm_device *dev,
> > > +                                 unsigned int supported_tv_norms,
> > >                                   unsigned int num_modes,
> > >                                   const char * const modes[])
> > >  {
> > > +       static const struct drm_prop_enum_list tv_norm_values[] = {
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },
> >
> > The above are analog standards, with a variable horizontal resolution.
> >
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> > > +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },
> >
> > The above are digital standards, with a fixed resolution.
>
> Are they?
>
> It's not clear to me from looking at nouveau, but I was under the
> impression that they were modes for a component output, so CEA 770.3. I
> don't have the spec though, so I can't check.

Oh right, I forgot about analog HD over component, where you can use
other pixel clocks than in the digital standard.

> > You seem to have missed "hd1080p"?
>
> Nobody is using it. If we ever have a driver that uses it I think we can
> add it.

The PS3 supports 1080p over component
https://manuals.playstation.net/document/en/ps3/current/settings/videooutput.html

> > In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
> > and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.
>
> It looks like nouveau only exposes modes for 480p at 59.94Hz, 576p at
> 50Hz, 720p at 60Hz, 1080i at 30Hz.

PS3 supports both 50 and 60 Hz (same link above).

> > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > currently a named mode and a refresh rate can't be specified both.
>
> I think the former would make more sense. It simplifies a bit the
> parser, and we're going to use a named mode anyway.
>
> > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > command-line option" uses a separate "tv_mode" option, and not the main
> > mode name, I think you want to add them here.
>
> It's a separate story I think, we could have a named mode hd720p50,
> which would be equivalent to 1280x720,tv_mode=hd720p

So where's the field rate in "1280x720,tv_mode=hd720p"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
