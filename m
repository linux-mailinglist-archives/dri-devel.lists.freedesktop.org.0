Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA6B396ED
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA0910E31D;
	Thu, 28 Aug 2025 08:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUiezZlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83110E31D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:28:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3c854b644c1so448833f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756369731; x=1756974531; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpesnFJVyd+1WSElG1QxZ3KYR404x+XI1vMOvjb/mRc=;
 b=SUiezZlvWDB5WPnY9k7w4yEXaX5XHj7XLq/p83uohH+7h+tBIN2apApagIwq/Xgi6s
 VXB3mHlVygzsjDKo72gmK9K66Sc/60bRPQjaIWADL0mIKqlD4BBy13AheETMYi1254Oh
 7Tq4JHLoUxhaACJK/Mxr2cG7AWTzrezrlg1mtg3+qKUxw7VPthqKbM4fC/7MBNSk33XW
 CB+HJHcxR5gSuqFAEytoexerskYghj0elxr/e2lABO9pfdhi+kBdL6DgaZB0hPhRM+XR
 B6NPpg5YKZ5KXJtsdKVxk88rloQ+Zh1axLUK/f4mRLIzGAzMwX+mtaGvFLBXiZYt4XS7
 2UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756369731; x=1756974531;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpesnFJVyd+1WSElG1QxZ3KYR404x+XI1vMOvjb/mRc=;
 b=e5RkRdSZ8qTeWK7MRY9oV3s8BqTBFwhz0SVOQso08BuVtnvKpntaqw+somjae/S5Gh
 r+YLPNUSHzJTlEt+mw2+lzEGkDcPxcCO5FrWYTBp0j5TC4N+Ae1963OTTKMFiym6bpzU
 zgdyepDshysd792PnagZRdpH1puFMRcD/3rhw2PphZIJGIAdncK+puxHPqmgDdh5SMCr
 htpkff4eoLIOjk/fr+3cGKvlFF8qgkUzR5SzZGKVk82QRvEYO0hjcnsmIxz8Lld/yCEk
 CuYEAceA/gIWnKJ8+uNPh26oKf8ibKBUJMw+6/9Rjzpqy0dQkgon63zQC9Fh234EWq6A
 vH5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpBQvpLLT7yGJkLjL2aUc1ZgfXvvx87x/2IBMy0BlAdbre8DQX91aZMDMgR28JHdubRy9XPmlHqY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqNUNTh5L7eYwsWlQwtxEtqcI0/sny7aXWwdZzbAWf3474Qod+
 lHqHO1mKqC1KJYq/oEsXlqP4M7RoDtj49xO65kfAXWEB/8/K9gbeHXR7oyk9rz9bhVq1Jgz84ms
 TlQ3T4KIq6eXtiWurMdjqgLlFtTgL3i8=
X-Gm-Gg: ASbGnctgbE50GYoGdoxPz9ktgdS0cClYbDg5eMk+ADqo3IKb8ndQ2ntvhqUDH3czLxm
 ePekCp6gnAVEPCHAmF80ISE2qRFnkhnbGQAGEGjMNbOachewul0svaYe96dLCVd8yxJrNtmTEtw
 nf+HX3lLEtWrbBYlhdaqU0y8gfZxXN+KmuR8+8KIe4aGMyFtgkQTt8KX8FPUY/c8YXslNLD0XUT
 PJPYIPB
X-Google-Smtp-Source: AGHT+IEJN93L6OfvheJ8qpGeyaKj7tInl9kGXKXiH50G67UoeYFDF1fUrz/n9HhBgSCb3G8VFX6qHSDcNMLXJ+92l0A=
X-Received: by 2002:a05:6000:2404:b0:3b8:d30c:885f with SMTP id
 ffacd0b85a97d-3c5dcefe32fmr18408263f8f.53.1756369731058; Thu, 28 Aug 2025
 01:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <14287352.RDIVbhacDa@senjougahara>
 <CAPVz0n0kCBAh7W0R766A_dXbcM3E=EoSXemuc0_rOm+Qch-a+Q@mail.gmail.com>
 <1797126.QkHrqEjB74@senjougahara>
In-Reply-To: <1797126.QkHrqEjB74@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 Aug 2025 11:28:39 +0300
X-Gm-Features: Ac12FXwopYF2CtbbHk1IPKIyjENT7P73gzlS4ZXYPFXyHgOEBnSGW1bYV8ES_VQ
Message-ID: <CAPVz0n2JdRXQ7oUJqXkmGO+EPZTq3t6k8HY7pWHT3eAVXj9T3w@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-staging@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 11:1=
3 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, August 27, 2025 7:45=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE =
13:36 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > > > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:09:=
45 GMT+03:00, Mikko Perttunen
> > >
> > > <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote=
:
> > > > >> CSUS clock is required to be enabled on camera device configurat=
ion
> > > > >> or
> > > > >> else camera module refuses to initiate properly.
> > > > >>
> > > > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > >> ---
> > > > >>
> > > > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > > > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > > > >>  2 files changed, 2 insertions(+)
> > > > >>
> > > > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > > > >> b/drivers/clk/tegra/clk-tegra20.c index 551ef0cf0c9a..42f8150c61=
10
> > > > >> 100644
> > > > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > > > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > > > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_ta=
ble[]
> > > > >> =3D {
> > > > >>
> > > > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > > > >>
> > > > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > > > >>
> > > > >>    /* must be the last entry */
> > > > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > > > >>
> > > > >>  };
> > > > >>
> > > > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > > >> b/drivers/clk/tegra/clk-tegra30.c index 82a8cb9545eb..70e85e2949=
e0
> > > > >> 100644
> > > > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > > > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > > > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_ta=
ble[]
> > > > >> =3D {
> > > > >>
> > > > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > > > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > > >>
> > > > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > > > >>
> > > > >>    /* must be the last entry */
> > > > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > > > >>
> > > > >>  };
> > > > >
> > > > >I looked into what this clock does and it seems to be a gate for t=
he
> > > > >CSUS
> > > > >pin, which provides an output clock for camera sensors (VI MCLK).
> > > > >Default
> > > > >source seems to be PLLC_OUT1. It would be good to note that on the
> > > > >commit
> > > > >message, as I can't find any documentation about the CSUS clock
> > > > >elsewhere.
> > > > >
> > > > >What is the 6MHz rate based on?
> > > >
> > > > 6mhz is the statistic value which I was not able to alter while tes=
ting.
> > > > I
> > > > have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6=
mhz.
> > > >
> > > > >Since this seems to be a clock consumed by the sensor, it seems to=
 me
> > > > >that
> > > > >rather than making it always on, we could point to it in the senso=
r's
> > > > >device tree entry.
> > > >
> > > > Sensor device tree uses vi_sensor as clocks source and sensor drive=
rs
> > > > don't
> > > > support multiple linked clocks.
> > >
> > > AIUI vi_sensor is an internal clock so the sensor cannot be receiving=
 it
> > > directly. Perhaps the sensor is actually connected to csus, and the r=
eason
> > > we need to enable it is to allow the vi_sensor clock to pass through =
the
> > > csus gate?
> > >
> > > That leaves the question of why the csus pad would be muxed to vi_sen=
sor
> > > by
> > > default, but perhaps there's an explanation for that.
> >
> > From downstream T30 sources csus and vi_sensor are always called in
> > pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed that
> > latter is used as camera reference clock since most sensors has
> > reference clock around 24 MHz
>
> It's possible that the csus pad is still outputting 24MHz. The pinmux opt=
ions
> for the csus pad are various clocks, so it would seem logical that the cl=
ock
> source for the pad is one of those clocks. However, on the clock framewor=
k
> side, the csus clock is just a gate. What I'm confused about is that sinc=
e on
> the clock framework side the parent of csus is currently set to clk_m, I =
don't
> know why setting the rate of csus would affect the output of the pad, giv=
en
> clk_m is not one of the options for the pinmux.
>
> It's be good to verify the register value for the csus pinmux to see wher=
e it
> thinks the clock is coming from, and then check how that matches with wha=
t we
> are seeing.
>

TRM does not provide such data, it has only register address with
layout for it as a plain pad control, that register has only DRVDN,
DRVUP, SLWR and SLWF and I don't see a way to decode clock value or
parent or anything similar. If you give me a method I will calculate
those values.

Another theory is that maybe csus is used for VIP cameras only and
vi_sensor is used for CSI cameras, but they both have to be on in
order to work correctly. Csus was removed from Tegra114 along with
VIP, might not be a coincidence. Moreover, T124 uses vi_sensor as
camera mclk source.

Here is a fragment of Tegra124 clock tree (dumped from Mi pad 1)

         pll_p                                 on     13  x34      40800000=
0
            vi_sensor2                       $ off    0   3.0      13600000=
0
               mclk2                         $ off    0            13600000=
0
            vi_sensor                        $ off    0   3.0      13600000=
0
               mclk                          $ off    0            13600000=
0

> >
> > > > >Cheers,
> > > > >Mikko
>
>
>
>
