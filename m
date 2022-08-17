Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6CB59705B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 16:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A170D9475C;
	Wed, 17 Aug 2022 14:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFC5945DF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 14:04:44 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id mk9so10109018qvb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4dcyblUn3bURjZBjn5VOr+f2Wy5bXXXMGqJEHlnVqeg=;
 b=t+e8UOr6uM7VdwGvlVuIDVlaKuwWyIIDQBX9+GZzg8iJB783maP3dilWBycZOqxm+m
 eQHNevhGNt5q7suZbmw/PDbX/RiTlN9hbnQ1witlJObS0YqwCha/J3yG/ER7HemhP/M9
 QAWoY5ZTtT1CA5rVjA4bg6LIX9vL/00oLYEg8mBd/YemSUE8vV2OsJLvuzA99YSsHRvt
 1ey2Ol5OufCKtj4JdgIxo8YbHCls4MnQG/4+C84TZQ7Fk7R5qSmX9i96XeGoxVUg9YW8
 ndfaMiUamCOTB7YdajbV1R5W9BxSWYzM2Hydf2+Yj2jUAXG4WrVg1rNUeOsYfEIRzf/K
 zRkA==
X-Gm-Message-State: ACgBeo28v3yxtrpTEpvYFqdYnNEyylzkw7FJGrqHG4zao2QGyIxPTQIP
 qDemte8/shOZWHS6ypQ96wtBdcfuibd+qA==
X-Google-Smtp-Source: AA6agR7xFNNLH/8HyNyKuWOpvmR7Yk8Jk0ZYv8vOeiyU6ELc9R9LlidSZGNSAv4slLcUjMddursnXw==
X-Received: by 2002:a0c:f3cd:0:b0:496:aab3:e309 with SMTP id
 f13-20020a0cf3cd000000b00496aab3e309mr1846636qvm.78.1660745078752; 
 Wed, 17 Aug 2022 07:04:38 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006bb2cd2f6d1sm8364513qkp.127.2022.08.17.07.04.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3246910dac3so233319427b3.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:04:37 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id
 68-20020a810f47000000b0031f434b05eemr21824312ywp.383.1660745076963; 
 Wed, 17 Aug 2022 07:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
 <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
 <20220817111454.pn2iltvyo2drebq7@houat>
 <CAMuHMdU57g1rNoLo65jhLK8mk4YkNEbMz1E7XKWk2dnCxTr=gg@mail.gmail.com>
 <20220817131854.jwmhqvhfhp77bbr3@houat>
In-Reply-To: <20220817131854.jwmhqvhfhp77bbr3@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 16:04:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
Message-ID: <CAMuHMdXrfH9MArXesfNCvqayiq17u7XaqtSvXTNt4V10=obSHQ@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 03:05:52PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Aug 17, 2022 at 1:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Aug 17, 2022 at 10:35:07AM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > > > > > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > > > > > >
> > > > > > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > > > > > >
> > > > > > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > > > > > mode name, I think you want to add them here.
> > > > > > > > > > >
> > > > > > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > > > > > >
> > > > > > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > > > > > >
> > > > > > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > > > > > >
> > > > > > > > Above you said "I think the former would make more sense", so that
> > > > > > > > should be "1280x720,tv_mode=hd720p50"?
> > > > > > >
> > > > > > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > > > > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> > > > > >
> > > > > > I disagree: hd720p50 and hd720p60 are different TV modes.
> > > > >
> > > > > I agree, and I don't see how that command-line doesn't express that?
> > > >
> > > > Oh, I see what you mean: yes, it expresses that.
> > > > But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
> > > > where the TV mode specifies both number of lines and frame rate.
> > >
> > > Only if we're using a named mode, and naming is hard :)
> >
> > That's not true: "640x480,tv_mode=PAL-N" would give me a mode with
> > 625 lines and 25 frames/s, "640x480,tv_mode=PAL-M" would give me a
> > mode with 525 lines and 30 frames/s.
>
> In that series, "640x480,tv_mode=PAL-N" would be rejected as invalid:
>
> https://lore.kernel.org/dri-devel/20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech/

It would become supported once the ideas from thread "[PATCH v1 04/35]
drm/modes: Introduce 480i and 576i modes" are implemented...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
