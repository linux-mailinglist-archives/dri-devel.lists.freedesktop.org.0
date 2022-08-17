Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580B5970AB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 16:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8C994B3B;
	Wed, 17 Aug 2022 14:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CA694AFF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 14:09:48 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 r22-20020a4abf16000000b00448a8a2044aso2290484oop.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=9vGZaeYeF3C4CiTE5MgNIzB+zcyQS3be59eUDCUL+Fc=;
 b=kXalkW27LQ6Vf4hxvmrf28fQtUH8+qlWq2SXR9HV0DsySSa7fE2AqntPFNQDQ+j7OJ
 eqm8m6buuml2YI2jPF3AmNMF5M0sM44ElHD9gZ9pnwaQnGbsmedDUQcQW+EJJsn5K+eJ
 P3OJsbMTYw5sD5y2fGtWlmcMIpEOt0L5uhmO/PU6j1EmxiUcsgJ+GNbUuBRncJVRY/IE
 SV84C5Wka49L3YvNCQFFgZtMUCx1FkW9pHaHYRn2dbrAX520wbZtRHMyuShww4B6ex0O
 dUQLkqOXgUMQ6ewzRyrE0LGGsC3Kw7hL/cfqdsoD47wlGs3k2JHTOaYgkGelgN3G60OH
 Jx/w==
X-Gm-Message-State: ACgBeo2/Suj/J1UcGwjUjrOZukGF9dsvkwqxNMZc3Zng63qoOtrdVIji
 B3n2CH/3tSayVRGiI+1ZsYwHRT6QTFeS/w==
X-Google-Smtp-Source: AA6agR5h3oS9XrIEQrLTPC+PyaD5WvvNpAKguodZ3pw9xofG+JCyS17ab9ZR7L9vc3HMkgmEW8lGQA==
X-Received: by 2002:a4a:94a6:0:b0:435:f61e:d7a1 with SMTP id
 k35-20020a4a94a6000000b00435f61ed7a1mr7848215ooi.82.1660745386979; 
 Wed, 17 Aug 2022 07:09:46 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47]) by smtp.gmail.com with ESMTPSA id
 g4-20020a9d6b04000000b00616dfd2c859sm3353609otp.59.2022.08.17.07.09.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 07:09:46 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so1628223otq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:09:46 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr5998789ywe.384.1660744920203; Wed, 17
 Aug 2022 07:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
In-Reply-To: <20220817131454.qcuywcuc4ts4hswm@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 16:01:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
Message-ID: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 3:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 10:51:55AM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 9:54 AM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > > On Tue, Aug 16, 2022 at 05:00:38PM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrot=
e:
> > > > > > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > > > > > > Multiple drivers (meson, vc4) define the analog TV 525-lines =
and 625-lines
> > > > > > > modes in the drivers.
> > > > > >
> > > > > > Nit: strictly speaking these are not analog modes, but the digi=
tal
> > > > > > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using=
 a
> > > > > > 13.5 MHz sampling frequency for pixels.
> > > > > >
> > > > > > In analog modes, the only discrete values are the number of lin=
es, and
> > > > > > the frame/field rate (fixing the horizontal sync rate when comb=
ined).
> > > > > >
> > > > > > The number of (in)visible pixels per line depends on the availa=
ble
> > > > > > bandwidth.  In a digital variant (which is anything generated b=
y a
> > > > > > digital computer system), the latter depends on the pixel clock=
, which
> > > > > > can wildly differ from the 13.5 MHz used in the BT.656 standard=
. (e.g.
> > > > > > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (=
NTSC)).
> > > > > >
> > > > > > So I think we probably need some way to generate a PAL/NTSC-com=
patible
> > > > > > mode based not only on resolution, but also on pixel clock.
> > > > >
> > > > > This would also fix the comments made by Jani and Thomas, so I qu=
ite
> > > > > like the idea of it.
> > > > >
> > > > > I'm struggling a bit to find how would could implement this thoug=
h.
> > > > >
> > > > > From what you were saying, I guess the prototype would be somethi=
ng like
> > > > >
> > > > > struct drm_display_mode *drm_create_analog_mode(unsigned int pixe=
l_clock,
> > > > >                                                 unsigned int line=
s,
> > > > >                                                 unsigned int fram=
e_rate)
> > > > >
> > > > > But I have zero idea on what the implementation would be. Do you =
have
> > > > > some resources for this you could point me to?
> > > >
> > > > Horizontally, I think you should calculate left/right margins and
> > > > hsync length to yield timings that match those for the BT.656 PAL/N=
TSC
> > > > modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
> > > > requested, you want to calculate left', right', and hslen' for
> > > >
> > > > | <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hs=
len' --> |
> > > >                         @ 14 MHz
> > > >
> > > > so they match the timings for left, right, and hslen for
> > > >
> > > > | <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hs=
len ---> |
> > > >                         @ 13.5 MHz
> > > >
> > > > As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
> > > > you want to make sure to align the center of the visible part.
> > >
> > > So I guess in that example if we want to center it, left =3D=3D right=
 and
> > > left' =3D=3D right'? What about the sync length?
> >
> > No, left and right are asymmetrical, cfr. front and back porch in
> > https://en.wikipedia.org/wiki/PAL#PAL_signal_details
> > I.e. if the pixel part is reduced, both the left and right margins
> > should be increased by the same amount.
> >
> > From the table linked above, hslen should be ca. 4.7=C2=B5s (fixed).
>
> each pixel taking 1 / pixel_clock seconds (assuming pixel_clock is in
> Hz), and thus hslen (in pixels) =3D 4.7 * 10 ^ -6 * pixel_clk, right?

Exactly.

> > > > Vertically, it's simpler, as the number of lines is discrete.
> > > > You do have to take into account interlace and doublescan, and
> > > > progressive modes with 262/312 lines.
> > >
> > > So we only have to deal with 525 and 625 lines total (without taking
> > > interlace and doublescan into account), right?
> >
> > Yes.
> >
> > > I guess we still have the same question, we probably want to center i=
t,
> > > so top =3D=3D bottom, but what about the vsync length?
> >
> > Unfortunately that table does not mention top and bottom margins.
> > But according to drivers/video/fbdev/amifb.c (see the "Broadcast
> > video timings" comment block and the definitions of the "ntsc-lace"
> > and "pal-lace" video modes), they are asymmetrical, too.
> >
> > Vsync length is 0.576ms, so that's 9 scan lines (I guess I didn't
> > have that info when I wrote amifb, as I used 4 lines there).
>
> Thanks, that's some great info already.
>
> It's mentioned though that the settings for NTSC are "straightforward",
> but it's definitely not for me :)

As in NTSC just uses different pixel clock and horizontal/vertical sync
rate values...

> I've looked around and it looks like the entire blanking area is
> supposed to be 40 pixels in interlaced, but I couldn't find anywhere how

625 lines - 575[*] visible lines =3D 50 lines.

[*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
     a frame in two fields of equal size.

"visible" is relative, as it includes the overscan region.
Some PAL monitors used with computers had knobs to control width/height
and position of the screen, so you could make use of most or all of
the overscan region, but on a real TV you're limited to ca. 640x512 (on
PAL)  which is what an Amiga used by default (with a 14 MHz pixclock).
> it's supposed to be split between the upper and lower margins and the
> sync period.

"Field Synchronization of PAL System" on http://martin.hinner.info/vga/pal.=
html
shows the split.

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
