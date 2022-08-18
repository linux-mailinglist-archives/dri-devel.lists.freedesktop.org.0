Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8659881F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452F7BC346;
	Thu, 18 Aug 2022 15:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C64B5C63
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:56:51 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id x5so1417795qtv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Bxc+m3Zk+4Bct+cVi+3Jt/UsQ5UzvU/3z9/2O8qvP0c=;
 b=rnoiCejWcahmeCshJ5OcwBStGyDNQ3OXHVjaPvAcLpJHQImhWcyF58Qnlr7WMrKXw5
 GDRh4eCkSIVZNrDgHQ0CEYFVE0kvyuPBmtJll1R9kaG0TnxQjpGX4r4//OyvIq7aFSCY
 KZ2R0NBI3Im7lL0L6oGeMr8wGPZLaEuRF9sOUGGolZax+JcIcXKnfngvs/o64H6I/kA1
 FA2q1x0+HqsIf32n87TzCvtMgFSJxhSQyjGwWwLuByt3tjhdrLno2NPz3mct9ZOa8m2b
 YS3HcHwrcfWTCLShsrp4UJedPl/4mX57lKh0nHeN1Y8mKD2G6B0nWvGgHqpTPecOtpVk
 cFKg==
X-Gm-Message-State: ACgBeo2Ouo2Xr7vMoNwnHPjLNwpP4O2mKntAMy1maTL4B1leX0gOsUcT
 9wVpJy9jwnu3fGTWiqEFDJDerxhGquiL6A==
X-Google-Smtp-Source: AA6agR78ODQWT/vU3bkSCuyXvC/DQ0e6TvFw3/BNjoLBgETU8GQMxvPWXiI2/Ib+ALD48ci1uVQmsQ==
X-Received: by 2002:ac8:5a55:0:b0:343:72f9:7053 with SMTP id
 o21-20020ac85a55000000b0034372f97053mr3215369qta.518.1660838210228; 
 Thu, 18 Aug 2022 08:56:50 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 l8-20020ac84cc8000000b0031f0b43629dsm1216826qtv.23.2022.08.18.08.56.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 08:56:48 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-32a09b909f6so53540667b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:56:48 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr3505302ybl.89.1660838207734; Thu, 18
 Aug 2022 08:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
 <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
In-Reply-To: <20220818154641.ouvrar5s74qu74zn@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:56:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
Message-ID: <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
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

On Thu, Aug 18, 2022 at 5:46 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Aug 18, 2022 at 05:34:30PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > I started adding more sanity checks to my code, and I just realised I
> > > don't seem to be able to reach 720 pixels over a single line though. If
> > > I understood it properly, and according to [1] the active part of a line
> > > is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
> > > in the timing section has pretty much the same numbers, so it looks
> > > sane.
> > >
> > > At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 = 702
> > > pixels
> > >
> > > It seems we can go push it to 52350 ns, but that still gives us only 706
> > > pixels.
> > >
> > > Similarly, if I just choose to ignore that limit and just take the
> > > active time I need, 720 * 74 = 53280ns
> > >
> > > That leaves us 10720ns for the blanking period, and that's not enough to
> > > fit even the minimum of the front porch, hsync and back porch (1.55 +
> > > 4.5 + 5.5 = 11.55us).
> > >
> > > Are those constraints merely recommendations, or am I missing something?
> >
> > You are missing that the parts near the borders of the full image are
> > part of the overscan range, and may or may not be visible, depending
> > on your actual display.
> > The full 768x576 image size from BT.656 is not visible on a typical PAL display,
> > and is more of an "absolute maximum rating", guaranteed to cover more
> > than analog PAL.
>
> So the overscan range is not part of the active area, unlike what HDMI
> is doing for example?

Indeed. DVI-D and HDMI etc. are pure digital (let's ignore they are a
digitized variant of old analog VGA ;-), hence there is a one-to-one
match between pixels in the image and pixels on the screen (ignoring
scaling).  But even when using an analog VGA input on a modern
digital display, you have controls to e.g. move the image.

> Is there some minimal timings available somewhere to fit those absolute
> maximum ratings?

I guess they can be found on the Internet...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
