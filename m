Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BACA3596F43
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 15:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5143E91F22;
	Wed, 17 Aug 2022 13:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E5A113808
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:12:01 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id s199so15331492oie.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wT+w/e1pir6od65k8fW73wcIBpWHrOcKqnuAFp6tc4E=;
 b=wLG2mcVKtE0u8URGt/CpXFG3V5JnQeVgQHAJpEBJwicTCFanhKJMTvEv61yf/lNs75
 TloCyRgf7dLj8DfUE+Avnw9QS81aeH/UN15JZsLyeoGVbvKzPT/y46sRT59GllzroQfT
 IcOboP1oFBQz7Tti2OoUlgGw2uw4u7033T6MIKIVGc2WdMHG/UbFqrnCN4GHg85Tkk2d
 cQk5goadRIF7VZSQZDwXR3/of8uwU5ZYPNYDwEXWaiL3vI1L5QGxXJEuHgoI8vT1rL6m
 sR2XV5soPljVUUlNgPX60kRBeXCO3r0d6NrAypLle3992GcDn8gZCi2zN8WGTm7grS1q
 PtgA==
X-Gm-Message-State: ACgBeo2XSNIDE7sd00eMIYHJc5inraPqS0rmMcRPRGMFONyqUFrzrnn8
 qqJMTV1YYiD8Aml4ltdYWmN3rM2BEYgZJw==
X-Google-Smtp-Source: AA6agR60ql924DpkO3UzvqXmyrpaCZAn0rV9J98mpERsbMlKUrdcQ7oHS40dwRw5AwEJ6U+yIMETUw==
X-Received: by 2002:a05:6808:1294:b0:344:a101:39f6 with SMTP id
 a20-20020a056808129400b00344a10139f6mr1409699oiw.119.1660741920580; 
 Wed, 17 Aug 2022 06:12:00 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49]) by smtp.gmail.com with ESMTPSA id
 k9-20020a056830150900b0061c3753c30dsm3330617otp.17.2022.08.17.06.12.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:12:00 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id
 v12-20020a9d7d0c000000b00638e210c995so1156052otn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 06:12:00 -0700 (PDT)
X-Received: by 2002:a81:502:0:b0:32f:dcc4:146e with SMTP id
 2-20020a810502000000b0032fdcc4146emr14565309ywf.316.1660741564697; Wed, 17
 Aug 2022 06:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
In-Reply-To: <20220817111454.pn2iltvyo2drebq7@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 15:05:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
Message-ID: <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > >
> > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > >
> > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > >
> > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > >
> > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > >
> > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > >
> > > > > > Above you said "I think the former would make more sense", so that
> > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > >
> > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > >
> > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > >
> > > I agree, and I don't see how that command-line doesn't express that?
> >
> > Oh, I see what you mean: yes, it expresses that.
> > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > where the TV mode specifies both number of lines and frame rate.
>
> Only if we're using a named mode, and naming is hard :)

That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
mode with 525 lines and 30 frames/s.

> Honestly, I'd be inclined to drop the hd* for now from this series. I
> don't have a hardware to test it with, for some we don't even have
> drivers that could implement these modes, we don't have a spec to work
> from, it looks like a recipe for failure :)

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
