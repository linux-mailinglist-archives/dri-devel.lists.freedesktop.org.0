Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244B598792
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2C5BAD74;
	Thu, 18 Aug 2022 15:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E370B9C69
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:34:47 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id y18so1381013qtv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BdTL8OyIz+/3rytShFZM3z6S1gIkodI1YMP9MoMjPuw=;
 b=v+sHhmxKSjiDUhqX6eOVTEsOS5DeGcwnkU2ORfkVfiumqfKif13cQ85ILeD2K8bH2g
 7v2bhQfGKKBPLpVExo8Obz3XibBXalMGAAwyp/7WWx0+aIyugRSWRygh9cfGsPrPTKP6
 ewI/F/CK0PImJdfJzb+raA/AMeoV6xy5IeO4o4NVxKlKjtM0L+VXAn3S96NpMmTlHJs5
 n/kgIfTAELRez1nV05nU6qvxNRY2o36jBvV2H9ihQ55WxI3zyA9e6+hK+vCDL45535U5
 k9+2ju84XmZBji4UPF3l4dsbfe+8bWWpaEnJ7HHEMcq+kQY9f1Ds0YNA7ndUFDfpwkvC
 bzkw==
X-Gm-Message-State: ACgBeo1NVdANrH80Y0kpBmbjiVv6O66EZDTNGTb391yrhHtOKll2PAlT
 qy2ivX5bfF/pg5GDRp9ZH65dCDd9bXEudQ==
X-Google-Smtp-Source: AA6agR5S99lzk1VV8jJXPrgqfpqbn26h1PJ0azipam1XbOxla9P4Yh7o0OZ2gpLnth8o7P5DbLxFhg==
X-Received: by 2002:a05:622a:1207:b0:343:4a8:7580 with SMTP id
 y7-20020a05622a120700b0034304a87580mr3046511qtx.601.1660836885977; 
 Thu, 18 Aug 2022 08:34:45 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 w25-20020a05620a0e9900b006b5bf5d45casm1708689qkm.27.2022.08.18.08.34.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 08:34:44 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3378303138bso10839927b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 08:34:44 -0700 (PDT)
X-Received: by 2002:a25:f06:0:b0:670:1685:d31d with SMTP id
 6-20020a250f06000000b006701685d31dmr3249700ybp.380.1660836883756; Thu, 18 Aug
 2022 08:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
In-Reply-To: <20220818134200.cr22bftmjn226ehn@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 17:34:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
Message-ID: <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 3:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Thu, Aug 18, 2022 at 02:57:55PM +0200, Geert Uytterhoeven wrote:
> > On Thu, Aug 18, 2022 at 2:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > > > I've looked around and it looks like the entire blanking area is
> > > > > supposed to be 40 pixels in interlaced, but I couldn't find anywhere how
> > > >
> > > > 625 lines - 575[*] visible lines = 50 lines.
> > > >
> > > > [*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
> > > >      a frame in two fields of equal size.
> > > >
> > > > "visible" is relative, as it includes the overscan region.
> > > > Some PAL monitors used with computers had knobs to control width/height
> > > > and position of the screen, so you could make use of most or all of
> > > > the overscan region
> > >
> > > It brings back some memories :)
> > >
> > > > but on a real TV you're limited to ca. 640x512 (on PAL) which is what
> > > > an Amiga used by default (with a 14 MHz pixclock).
> > >
> > > > > it's supposed to be split between the upper and lower margins and the
> > > > > sync period.
> > > >
> > > > "Field Synchronization of PAL System" on
> > > > http://martin.hinner.info/vga/pal.html shows the split.
> > >
> > > Thanks, that's excellent as well.
> > >
> > > I'm mostly done with a function that creates a PAL mode, but I still
> > > have one question.
> > >
> > > If I understand well, the blanking period is made up (interlace) of 16
> > > pulses for the first field, 14 for the second, each pulse taking half a
> > > line. That amount to 30 pulses, so 15 lines.
> > >
> > > I first assumed that the pre-equalizing pulses would be the back porch,
> > > the long sync pulses the vsync, and the post-equalizing pulses the front
> > > porch. But... we're still missing 35 lines to amount to 625 lines, that
> > > seems to be counted in the field itself (305 lines == (575 + 35) / 2)
> > >
> > > So I guess my assumption was wrong to begin with.
> >
> > The back porch is the number of lines between the last "visible" line
> > and the start of the synchronization pulse, i.e. "l" in the "Field
> > Synchronization of PAL System" drawing.
> > Virtual sync length is "m".
> > The front porch is the number of lines between the end of
> > the synchronization pulse, and the first "visible" line, i.e.
> > "j - l - m" (I think you used "n", thus missing lines 6-23 and 319-335).
>
> Ah, yes, that makes sense
>
> > > You seem to have used a fixed vsync in amifb to 4 lines, and I don't
> >
> > Actually "m" is 2.5 lines in the first field, and 3 lines in the second field,
> > so "4" is not that much off of 2.5 + 3.
>
> Is it? If I'm reading that drawing well, l before the first field starts
> on the second half of line 623 and stops at the end of line 625, so 2.5
> line, and on the second field starts at the beginning of line 311, and
> stops half-way through 313 so 2.5 line again.
>
> Then, for the first field, m starts at the beginning of line 1, stops
> half-way through line 3, so 2.5 line indeed, and then on the second
> field starts on the second half of 313 and stops at the end of line 315.
> So 2.5 again?
>
> Thus, both should be 5?

Possibly. Note that this for the official broadcast PAL.

I never looked at these signals with a scope, but I wouldn't be
surprised if some
device on't bother implementing the "half-line-sync", and synchronize
the start and stop of the vertical
sync signal with the start of a horizontal.

> > > understand how you come up with the upper and lower margins (or rather,
> > > how they are linked to what's described in that page)
> >
> > These margins probably came from the Amiga hardware reference manual,
> > for the default 640x512 (PAL) and 640x400 (NTSC) modes.
>
> Ok.
>
> I started adding more sanity checks to my code, and I just realised I
> don't seem to be able to reach 720 pixels over a single line though. If
> I understood it properly, and according to [1] the active part of a line
> is supposed to be 51.95us, and the blanking period taking 12.05us. [2]
> in the timing section has pretty much the same numbers, so it looks
> sane.
>
> At 13.5Mhz, a pixel is going to take roughly 74ns, and 51950 / 74 = 702
> pixels
>
> It seems we can go push it to 52350 ns, but that still gives us only 706
> pixels.
>
> Similarly, if I just choose to ignore that limit and just take the
> active time I need, 720 * 74 = 53280ns
>
> That leaves us 10720ns for the blanking period, and that's not enough to
> fit even the minimum of the front porch, hsync and back porch (1.55 +
> 4.5 + 5.5 = 11.55us).
>
> Are those constraints merely recommendations, or am I missing something?

You are missing that the parts near the borders of the full image are
part of the overscan range, and may or may not be visible, depending
on your actual display.
The full 768x576 image size from BT.656 is not visible on a typical PAL display,
and is more of an "absolute maximum rating", guaranteed to cover more
than analog PAL.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
