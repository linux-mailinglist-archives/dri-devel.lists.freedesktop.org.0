Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D5596B62
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 10:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BDF112F87;
	Wed, 17 Aug 2022 08:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A143112FE6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 08:35:24 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id mz1so4692080qvb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oGUO+aRsBeoQZf7v2A5uqTblY/HRl0z6pHKiV+qcGIw=;
 b=UZQMWKvrEuzBf5ry47rcD1tgA516kXid23gS2YxvTG6EpoZdJYS0bSz7jB0uTmWuRq
 S6KXt9Zz7bqiujFFTNz3B+dtHci9HZeooZ8lOIH45k+PzZD6SS6WpkhnOEowU5Mu25Re
 XjZQ+WZ2pFTOZs9GVPzbwx3PV5zah8RAEP1+w3HLYI4P2fx+qyvmqq1MErwYjzosO2ZL
 3/nZvWCMaqck5HWGBCMYqXhcTGOhwNORmSTn+5LVSHymZuqHq6ZURhLNeWE4vzOc8NCd
 vyaMkaLU21JHazff0HXQKWNyALxLR16SrytjPji3rl0ozz8UCTdrqGGJwdB1cjeVi5Vs
 YR9g==
X-Gm-Message-State: ACgBeo1p5+rx9AX6NMLCs+9cMIVtcQ1kIEk6kM9frYKktPU0DQT/+2Ow
 a3/5rftGP82A19nHa7PvJ8xCyzZYuiiCfQ==
X-Google-Smtp-Source: AA6agR5U+37MnrjahxVp5Vnt9Uz1XN1AdRJws1t/BbGrRJO1KeoM6sif0H0i8YQMrF5RIBcC6t4DFw==
X-Received: by 2002:a05:6214:29ee:b0:477:b98:8992 with SMTP id
 jv14-20020a05621429ee00b004770b988992mr21503624qvb.48.1660725322884; 
 Wed, 17 Aug 2022 01:35:22 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 w18-20020a05620a445200b006bb83e2e65fsm2110261qkp.42.2022.08.17.01.35.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 01:35:21 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-32a17d3bba2so213313767b3.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 01:35:20 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr17391450ybt.365.1660725320216; Wed, 17
 Aug 2022 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
 <20220816132040.uwirtjm5yr6rdd3q@houat>
 <CAMuHMdWevP=3af=NneAJEDfOR+sz1thrQEhAQPNGrgitBtLjGA@mail.gmail.com>
 <20220816141116.5nuszmilqv2exdb3@houat>
 <CAMuHMdXq_xGPx46bdnUFGDiG4kcgdxtXaRGTucFd3TRq8353dg@mail.gmail.com>
 <20220816154956.pkdpxmmw27mia5ix@houat>
 <CAMuHMdX0L6cO_jYXKZTv0sm9V39Eiy_STiknSkdRQG4k-9GJeg@mail.gmail.com>
 <20220817074710.w4c4xwj7edly2b5p@houat>
In-Reply-To: <20220817074710.w4c4xwj7edly2b5p@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2022 10:35:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
Message-ID: <CAMuHMdXeBakWr6geOWGxnjQYaU9Pi4tRvVFFtubyMJZTT2nPnw@mail.gmail.com>
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

On Wed, Aug 17, 2022 at 9:47 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Aug 17, 2022 at 09:31:18AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 16, 2022 at 5:50 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Tue, Aug 16, 2022 at 04:43:44PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
> > > > > > > > handle them through "@<refresh>".  The latter would impact "[PATCH v1
> > > > > > > > 09/35] drm/modes: Move named modes parsing to a separate function", as
> > > > > > > > currently a named mode and a refresh rate can't be specified both.
> > > > > > >
> > > > > > > I think the former would make more sense. It simplifies a bit the
> > > > > > > parser, and we're going to use a named mode anyway.
> > > > > > >
> > > > > > > > As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
> > > > > > > > command-line option" uses a separate "tv_mode" option, and not the main
> > > > > > > > mode name, I think you want to add them here.
> > > > > > >
> > > > > > > It's a separate story I think, we could have a named mode hd720p50,
> > > > > > > which would be equivalent to 1280x720,tv_mode=hd720p
> > > > > >
> > > > > > So where's the field rate in "1280x720,tv_mode=hd720p"?
> > > > >
> > > > > Yeah, sorry I meant 1280x720@50,tv_mode=hd720p
> > > >
> > > > Above you said "I think the former would make more sense", so that
> > > > should be "1280x720,tv_mode=hd720p50"?
> > >
> > > No, 720p at 50Hz would be either hd720p50 or 1280x720@50,tv_mode=hd720p
> > > and 60Hz would be hd720p60 or 1280x720@60,tv_mode=hd720p
> >
> > I disagree: hd720p50 and hd720p60 are different TV modes.
>
> I agree, and I don't see how that command-line doesn't express that?

Oh, I see what you mean: yes, it expresses that.
But it is inconsistent with the NTSC/PAL/SECAM/hd{480,576}[ip] modes,
where the TV mode specifies both number of lines and frame rate.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
