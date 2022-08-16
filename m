Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72FD595EAD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EEA91056;
	Tue, 16 Aug 2022 15:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B6A910EC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:00:53 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id w18so3305774qki.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 08:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5LUM7nzor1/XqC5vXK/cNLgsMpFS8BfigyHBrmKtMuQ=;
 b=Opax8YGP5DfMwiNQb1mk//T+ikv5DjqAXywEvFpI1VZsfwYKQgAuMq+Bw5o8An+TXg
 tuCR65fOdM2fG9LAcNPIs7vnGVCqQt2fN5JV71+l8dXIRixwcyiq6vURM3T6hHF8BFm0
 EVfgJMgW5sWd6Ri+SuxrwDfob1jafzTAVEv94VRdHdblUC4X6iaFVjxewaWfxayPa9Zg
 N+NARaLpI5CNrBPPpG9TNdlcBj4zx0ZN/xNmsk4WV8Z0MepDPFQ4mBY/p5weRZm95g/z
 TpM3Qf9vRTBHDGUAYJ3N2x4U8rQ5FDlXfDEX5PiYrrghLS6KIYo7X2VEGN7a6n1cTFr0
 r35w==
X-Gm-Message-State: ACgBeo3A87iRrDNX/ImILcZziH7+5SAL8hb2xfOTDbbbkx9s8nR1pJbg
 x/YvIT3EZ4e3RYqLBRVSxk0lF4E6BB68xQ==
X-Google-Smtp-Source: AA6agR7NcboB4Y9kKyNXt3ViF8E3y74/8mGiaaAOK8Mak8N417PAL6t78wVU7L9UDrJjmxZP1agHhA==
X-Received: by 2002:a05:620a:2004:b0:6bb:54c1:38cd with SMTP id
 c4-20020a05620a200400b006bb54c138cdmr4464427qka.332.1660662051916; 
 Tue, 16 Aug 2022 08:00:51 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 bm34-20020a05620a19a200b006bac157ec19sm11391973qkb.123.2022.08.16.08.00.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 08:00:51 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-3321c2a8d4cso105199787b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 08:00:51 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr130640ybr.202.1660662049765; Tue, 16
 Aug 2022 08:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <CAMuHMdUrwzPYjA0wdR7ADj5Ov6+m03JbnY8fBYzRYyWDuNm5=g@mail.gmail.com>
 <20220816132636.3tmwqmrox64pu3lt@houat>
In-Reply-To: <20220816132636.3tmwqmrox64pu3lt@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 17:00:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
Message-ID: <CAMuHMdUNLPbjs=usYQBim5FxsrC1oJLuF+3JB7auzHHRoOqavQ@mail.gmail.com>
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

On Tue, Aug 16, 2022 at 3:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Fri, Aug 12, 2022 at 03:18:58PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
> > > modes in the drivers.
> >
> > Nit: strictly speaking these are not analog modes, but the digital
> > variants (ITU-R BT.656 and DVD-Video D1) of NTSC and PAL, using a
> > 13.5 MHz sampling frequency for pixels.
> >
> > In analog modes, the only discrete values are the number of lines, and
> > the frame/field rate (fixing the horizontal sync rate when combined).
> >
> > The number of (in)visible pixels per line depends on the available
> > bandwidth.  In a digital variant (which is anything generated by a
> > digital computer system), the latter depends on the pixel clock, which
> > can wildly differ from the 13.5 MHz used in the BT.656 standard. (e.g.
> > Amiga uses 7.09/14.19/28.38 MHz (PAL) or 7.16/14.32/28.64 MHz (NTSC)).
> >
> > So I think we probably need some way to generate a PAL/NTSC-compatible
> > mode based not only on resolution, but also on pixel clock.
>
> This would also fix the comments made by Jani and Thomas, so I quite
> like the idea of it.
>
> I'm struggling a bit to find how would could implement this though.
>
> From what you were saying, I guess the prototype would be something like
>
> struct drm_display_mode *drm_create_analog_mode(unsigned int pixel_clock,
>                                                 unsigned int lines,
>                                                 unsigned int frame_rate)
>
> But I have zero idea on what the implementation would be. Do you have
> some resources for this you could point me to?

Horizontally, I think you should calculate left/right margins and
hsync length to yield timings that match those for the BT.656 PAL/NTSC
modes.  I.e. when a 640x512 mode with a pixel clock of 14 MHz is
requested, you want to calculate left', right', and hslen' for

| <---- left' ---> | <- 640 pixels -> | <---- right' ---> | <--- hslen' --> |
                        @ 14 MHz

so they match the timings for left, right, and hslen for

| <--- left ---> | <--- 720 pixels ---> | <--- right ---> | <--- hslen ---> |
                        @ 13.5 MHz

As 640 pixels @ 14 MHz are less wide than 720 pixels @ 13.5 MHz,
you want to make sure to align the center of the visible part.

Vertically, it's simpler, as the number of lines is discrete.
You do have to take into account interlace and doublescan, and
progressive modes with 262/312 lines.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
