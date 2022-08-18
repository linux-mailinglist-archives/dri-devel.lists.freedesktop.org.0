Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5CB598385
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 14:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92D5B98C7;
	Thu, 18 Aug 2022 12:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA2FB9CA5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 12:58:12 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id e4so1109952qvr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 05:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JREs+R+hOdRL2M18w+Jk20r5RGbAGO+48abMsau2ww8=;
 b=snbofhcdFPiN3fOFjF6aeLLdoxJtB43FeFCnw04qpjpodTioVvU0Xn9xE5o8G4wXgO
 nWxe5gHXWHill3ek76rnLkEpUyzselrQGIMLRSWBJINjRMRKejhGwIwpIeqijWfulxYa
 p1u473cUwPLaB6D8Bd3joZ7jjT0EWhTaHYhtOz4Jf1dkbFq/Qu78cw+nk1p7WA0Z7Elm
 VwLeZtjeS3/Hd4ovYKot7KPPDsie8oD+d3HaU559TNf3GECA8SB8JXTPmVG1TEK35+uo
 k9dplPuST2oKjRcdPnSe8tSdN7DdO+LEc+nEK/654IADlbeCSSj0FjIbTPAkW08GTAdK
 k1RA==
X-Gm-Message-State: ACgBeo3T9mVO8M4MviVVj+/laDKMOYbXwr3i5U4TcCsQKGJGCVGA/Ogi
 TlZM4pk7TuC7VZMbuttfwdxmKpquvWxDkQ==
X-Google-Smtp-Source: AA6agR5fvlsulQVHQ7I6DZ67Xk1BcBMLP68e5r4yAO4tXwCX0OzOFYhzbRuBqObgrZtGoTYb69uhLQ==
X-Received: by 2002:a0c:8081:0:b0:496:7822:c55a with SMTP id
 1-20020a0c8081000000b004967822c55amr2209955qvb.87.1660827491302; 
 Thu, 18 Aug 2022 05:58:11 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 y2-20020ac85242000000b0031f36cd1958sm921977qtn.81.2022.08.18.05.58.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 05:58:09 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3375488624aso9481787b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 05:58:08 -0700 (PDT)
X-Received: by 2002:a25:cf83:0:b0:692:78ad:f44c with SMTP id
 f125-20020a25cf83000000b0069278adf44cmr2546178ybg.604.1660827488283; Thu, 18
 Aug 2022 05:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
 <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
 <20220817075351.4xpsqdngjgtiqvob@houat>
 <CAMuHMdUusnhYodWGCxJBu-1Hd2KW-xdT8jxE_iVdQjDo8b3Y5Q@mail.gmail.com>
 <20220817131454.qcuywcuc4ts4hswm@houat>
 <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
In-Reply-To: <20220818123934.eim2bfrgbxsmviqx@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 14:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
Message-ID: <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
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

On Thu, Aug 18, 2022 at 2:39 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 04:01:48PM +0200, Geert Uytterhoeven wrote:
> > > I've looked around and it looks like the entire blanking area is
> > > supposed to be 40 pixels in interlaced, but I couldn't find anywhere how
> >
> > 625 lines - 575[*] visible lines = 50 lines.
> >
> > [*] BT.656 uses 576 visible lines as that's a multiple of 2, for splitting
> >      a frame in two fields of equal size.
> >
> > "visible" is relative, as it includes the overscan region.
> > Some PAL monitors used with computers had knobs to control width/height
> > and position of the screen, so you could make use of most or all of
> > the overscan region
>
> It brings back some memories :)
>
> > but on a real TV you're limited to ca. 640x512 (on PAL) which is what
> > an Amiga used by default (with a 14 MHz pixclock).
>
> > > it's supposed to be split between the upper and lower margins and the
> > > sync period.
> >
> > "Field Synchronization of PAL System" on
> > http://martin.hinner.info/vga/pal.html shows the split.
>
> Thanks, that's excellent as well.
>
> I'm mostly done with a function that creates a PAL mode, but I still
> have one question.
>
> If I understand well, the blanking period is made up (interlace) of 16
> pulses for the first field, 14 for the second, each pulse taking half a
> line. That amount to 30 pulses, so 15 lines.
>
> I first assumed that the pre-equalizing pulses would be the back porch,
> the long sync pulses the vsync, and the post-equalizing pulses the front
> porch. But... we're still missing 35 lines to amount to 625 lines, that
> seems to be counted in the field itself (305 lines == (575 + 35) / 2)
>
> So I guess my assumption was wrong to begin with.

The back porch is the number of lines between the last "visible" line
and the start of the synchronization pulse, i.e. "l" in the "Field
Synchronization of PAL System" drawing.
Virtual sync length is "m".
The front porch is the number of lines between the end of
the synchronization pulse, and the first "visible" line, i.e.
"j - l - m" (I think you used "n", thus missing lines 6-23 and 319-335).

> You seem to have used a fixed vsync in amifb to 4 lines, and I don't

Actually "m" is 2.5 lines in the first field, and 3 lines in the second field,
so "4" is not that much off of 2.5 + 3.

> understand how you come up with the upper and lower margins (or rather,
> how they are linked to what's described in that page)

These margins probably came from the Amiga hardware reference manual,
for the default 640x512 (PAL) and 640x400 (NTSC) modes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
