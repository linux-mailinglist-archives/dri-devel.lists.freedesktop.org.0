Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011D5A0119
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96C3BFB4C;
	Wed, 24 Aug 2022 18:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD12113E08
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 08:59:45 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id mz1so4720965qvb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=2JD+X/GOYgljDqW3V4/txiGVTXdbLlGZCC1UfMUdTQc=;
 b=y1czP5AMD/Spkiz4xz/GFFJ8l7IwnfpAAbpt+CKLVNvsGMltgFSZAiIpwJXuOI0BIS
 RUwjc3rkRPMdTTiTBdfInJjnMzYukIO203YGkoxKR7S07HBtaw8YlYuwGjgQdSMPuF6l
 OJIeSpdWRMeumuKG8bec5T9Qxna/z1kKiKST13n3euHaNDjXT6gL8co3C4Hlmooq8D1C
 2kgpyGEk2n/Ka755U5LMxHNckmelslJXEp6c6WzRf422+YamLWv6U08eGHgp/kysUpKh
 4jmw2eUlk6eizAFASRbWNI1vb5X52tqjxkrp5DQM64bO9DOrHHfj8sQyNunWJW8PkWxP
 FVHw==
X-Gm-Message-State: ACgBeo3c819veUsey7TqBnA3DyKYcYhXE1bBlHa0727HPl+itO0AWJWp
 6o7VhN9bCEvyrrm8B23dO94TFP9NmmKqpA==
X-Google-Smtp-Source: AA6agR40H1g3hZRrQq1q5xx6XNbLsuMv4/14Hc9h2fiLXoKc57vJXn+BZHkPHJM/qus6YDOm5Vm1yA==
X-Received: by 2002:a05:6214:23c6:b0:491:99e3:80ce with SMTP id
 hr6-20020a05621423c600b0049199e380cemr11887528qvb.111.1660726784232; 
 Wed, 17 Aug 2022 01:59:44 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05620a15ee00b006b8e049cf08sm6598803qkm.2.2022.08.17.01.59.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 01:59:44 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-32a17d3bba2so214591777b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:59:44 -0700 (PDT)
X-Received: by 2002:a25:880f:0:b0:67c:2727:7e3c with SMTP id
 c15-20020a25880f000000b0067c27277e3cmr18847109ybl.36.1660726327196; Wed, 17
 Aug 2022 01:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
In-Reply-To: <20220817075351.4xpsqdngjgtiqvob@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 10:51:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
Message-ID: <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Aug 17, 2022 at 9:54 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Aug 16, 2022 at 05:00:38PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > > On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > Multiple drivers (meson, vc4) define the analog TV 525-lines and =
625-lines
> > > > > modes in the drivers.
> > > >
> > > > Nit: strictly speaking these are not analog modes, but the digital
> > > > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > > > 13.5 MHz sampling frequency for pixels.
> > > >
> > > > In analog modes, the only discrete values are the number of lines, =
and
> > > > the frame/field rate (fixing the horizontal sync rate when combined=
).
> > > >
> > > > The number of (in)visible pixels per line depends on the available
> > > > bandwidth.  In a digital variant (which is anything generated by a
> > > > digital computer system), the latter depends on the pixel clock, wh=
ich
> > > > can wildly differ from the 13.5 MHz used in the BT.656 standard. (e=
.g.
> > > > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC=
)).
> > > >
> > > > So I think we probably need some way to generate a PAL/NTSC-compati=
ble
> > > > mode based not only on resolution, but also on pixel clock.
> > >
> > > This would also fix the comments made by Jani and Thomas, so I quite
> > > like the idea of it.
> > >
> > > I'm struggling a bit to find how would could implement this though.
> > >
> > > From what you were saying, I guess the prototype would be something l=
ike
> > >
> > > struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_cl=
ock,
> > >                                                 unsigned int lines,
> > >                                                 unsigned int frame_ra=
te)
> > >
> > > But I have zero idea on what the implementation would be. Do you have
> > > some resources for this you could point me to?
> >
> > Horizontally, I think you should calculate left/right margins and
> > hsync length to yield timings that match those for the BT.656 PAL/NTSC
> > modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
> > requested, you want to calculate left', right', and hslen' for
> >
> > | <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hslen'=
 --> |
> >                         @ 14 MHz
> >
> > so they match the timings for left, right, and hslen for
> >
> > | <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hslen =
---> |
> >                         @ 13.5 MHz
> >
> > As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
> > you want to make sure to align the center of the visible part.
>
> So I guess in that example if we want to center it, left =3D=3D right and
> left' =3D=3D right'? What about the sync length?

No, left and right are asymmetrical, cfr. front and back porch in
https://en.wikipedia.org/wiki/PAL#PAL_signal_details
I.e. if the pixel part is reduced, both the left and right margins
should be increased by the same amount.

From the table linked above, hslen should be ca. 4.7=C2=B5s (fixed).

> > Vertically, it's simpler, as the number of lines is discrete.
> > You do have to take into account interlace and doublescan, and
> > progressive modes with 262/312 lines.
>
> So we only have to deal with 525 and 625 lines total (without taking
> interlace and doublescan into account), right?

Yes.

> I guess we still have the same question, we probably want to center it,
> so top =3D=3D bottom, but what about the vsync length?

Unfortunately that table does not mention top and bottom margins.
But according to drivers/video/fbdev/amifb.c (see the "Broadcast
video timings" comment block and the definitions of the "ntsc-lace"
and "pal-lace" video modes), they are asymmetrical, too.

Vsync length is 0.576ms, so that's 9 scan lines (I guess I didn't
have that info when I wrote amifb, as I used 4 lines there).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
