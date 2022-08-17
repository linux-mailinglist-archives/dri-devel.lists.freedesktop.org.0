Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF23596A78
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AC9112112;
	Wed, 17 Aug 2022 07:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111610FFA3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:38:14 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id h21so9845272qta.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 00:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MoCGxpdBSZqOnL0zHKYLDEdga6g996l84p2nV9SRtCY=;
 b=clKHevPUHY6r2/pNsCdBySDsYHgdl+NnqClp21BSl2xTd2ooyBwiYE5c17JE0+vMot
 H4ZCM2oHtbkVGqM8p5dOhhkaNm4bt2kNjmwNFSFHZwYAlL900M3h1famRFizmxILFhI8
 LkfX4sp2bp3XLrsTcr4DcAq4kXR5Gm1KVDcYGvdHpSL5XEDaRAqUEaD89i8wUDr4dS76
 hYiFEp37xILj2d64kom+ouuTWdBQegk05h6eJePsWVHgIwc+cfZU0Kfr55lkhJKOkCz5
 3oe6HWgqDkqjFMfuqjbHIO7atmHFybxJ/SW34DNHwaIhPoeeA1dpe6Ub9/Vdf8/7gB4i
 Ndiw==
X-Gm-Message-State: ACgBeo02OMC3jptZ01BGWUu15ka4s+EuqPfhGM+BFsy4FV/4HHb46kx2
 vQOoS9CCzubCWl1jTJWuv0IGN/u0RLlzZA==
X-Google-Smtp-Source: AA6agR7gxoR1f6PQV+blUvhef+gh+huHRe/HGPF0vspJjNQm3th2ZhRfuN9qreVFtc0dMkRM0HkVsA==
X-Received: by 2002:ac8:5a86:0:b0:31e:d114:1964 with SMTP id
 c6-20020ac85a86000000b0031ed1141964mr21336627qtc.572.1660721893125; 
 Wed, 17 Aug 2022 00:38:13 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05620a0d8a00b006b9b319adacsm13687964qkl.126.2022.08.17.00.38.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 00:38:13 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-333a4a5d495so100531257b3.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 00:38:12 -0700 (PDT)
X-Received: by 2002:a25:f06:0:b0:670:1685:d31d with SMTP id
 6-20020a250f06000000b006701685d31dmr17606473ybp.380.1660721490548; Wed, 17
 Aug 2022 00:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
In-Reply-To: <20220816154956.pkdpxmmw27mia5ix@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 09:31:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
Message-ID: <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
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

On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > >
> > > > > I think the former would make more sense. It simplifies a bit the
> > > > > parser, and we're going to use a named mode anyway.
> > > > >
> > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > mode name, I think you want to add them here.
> > > > >
> > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > >
> > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > >
> > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> >
> > Above you said "I think the former would make more sense", so that
> > should be "1280x720,tv_mode=hd720p50"?
>
> No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p

I disagree: hd720p50 and hd720p60 are different TV modes.
Treating them the same would be similar to treating unmodulated (e.g.
component) PAL-N (25 frames/s) and PAL-M (30 frames/s) the same.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
