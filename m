Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA9B3B3CA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A907310E0C2;
	Fri, 29 Aug 2025 07:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kG3/lYj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE62A10E0C2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 07:05:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3ce772ce0dbso922539f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 00:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756451157; x=1757055957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNEPTqZi/7bPFbDHtLTOaaHKFKd0cf7LdGjAAfOz8EE=;
 b=kG3/lYj1Qkett+SEWEbaTbAf5vFYGZqSJdoPK4b7bpoHGVtI/LEKvS9YAIxkTOeIIE
 xCyw/8R2hfKD3pNTKSjOFjG7o0vN3NS4JMkfF9fjwV49gp/rApG5AHOdbJPFVPvkEwlq
 R0WNGUr5NqtTIZzNO6WLPr6TJZUJ2zxPYJTWJ1GhgGFmsX2vrZVYSX92uSqDcGCirhu3
 mS7ijeuvp86Q+9uE1U0Mrcf4d08xbhlmWFfd0rc0bsr8oTiVw6ro5rLdCYeayqOuuQTA
 H79Mq+R6xaaUTILoDJsKhXF7vWzqPmphw7S+fN4sB+6sFqKAtvdahPVG7dBQm6Llu8hV
 /r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756451157; x=1757055957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNEPTqZi/7bPFbDHtLTOaaHKFKd0cf7LdGjAAfOz8EE=;
 b=u9RKzbJ5lNUy3Ok+oGHwPPejZFVgA07EL6uj3yyhjJUk2068flpyiwItgWyjoAQXPr
 4zGdyot2i/0O1ZixmQZhzuLOvcU9obtWZhYNIioy3XEdWgvtI4eTZEDepI+/4vGktQwh
 +ZNzEnlGhEeHpFLApOqnqqXSBd6AijU0Y8A9S30gAz9WHGGxHLC0o9aKpJn4Y4zutSj6
 dtLegNpHnBAU1brVPU/Kaf1Ad/BUT94sW3Gs/NAt9CMX+QX9gPU78kZyWq4bgI5+nuOg
 uuqaFx+nHE1l93ZJDKav6UxoEE/ialqyc1Og9W2qXapfd9tfa3V0rWIWGGFS6s+RZwZ0
 TUqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYlDSGVX5JcpsdhAw9Muu6XIxz9KeG0yXIAM2WuELmrMUTeD2C6k3cn57JEhrbeZYjjcQ5RJokKdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5YuX9q06uAre4sOhprdeAjV6vvaWE7GpTwIU8pGGpaUgzVLbk
 8BJbj9AOsdE5pr1vjE7UoUnDyRLnWYzESI0YhIBDHWAljv3ytuTcAUNLcvIzfBx6PI+8GESjoci
 bwyRCX1kmps5P28YtvbqzB/ngN0HoeA0=
X-Gm-Gg: ASbGncvKjf0hg7OvDxdoQs9AhGWdcvbjhYfeepxTtCGvWgr8PDqkRdMepvuiB9lCfoL
 4KWBCRBzEcLtMcoavrdF1VD5ZgWL5jijJSZIYLhXrfR2mO5V+5dHA8c5ktsOTdBxpQdFBMokyCH
 0O7QuiuquMthWA/ICwYmLiRPUexhhXwi/UOpeTaClEcoUVMegqfXP32iSqHNjgAKTZZWw7p3iBy
 aWSnFLP3qGKKy3uHhU=
X-Google-Smtp-Source: AGHT+IGXvbXOcj19XnruUNyzz7sCZJtBcE1ugNlGUJcQ+lWmHZNXEX7dQgfWsT/2E2qiYE74RzUuAZOyfwAf0jx0+GY=
X-Received: by 2002:a05:6000:22c2:b0:3c8:acd2:75d9 with SMTP id
 ffacd0b85a97d-3c8acd2812emr16190955f8f.40.1756451156619; Fri, 29 Aug 2025
 00:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <2263218.C4sosBPzcN@senjougahara>
 <CAPVz0n3AvQaFrpeyUODpqOwkxxinjWgMQTgqvD4hAZvdqprVdA@mail.gmail.com>
 <18894880.sWSEgdgrri@senjougahara>
In-Reply-To: <18894880.sWSEgdgrri@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 Aug 2025 10:05:45 +0300
X-Gm-Features: Ac12FXzmilSrHiJWScmOpCjw2MVssM9bFAGoeDiBX7hXsR-oymkUtqcsKAMUCRQ
Message-ID: <CAPVz0n2A+dR2Rvwf-S_OpgAKE1BVwVnD2nLw=s-z=7W_A_+yKw@mail.gmail.com>
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

=D0=BF=D1=82, 29 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 03:3=
0 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thursday, August 28, 2025 7:23=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE =
13:15 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Thursday, August 28, 2025 5:28=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=
=BE 11:13 Mikko Perttunen <mperttunen@nvidia.com>
> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > On Wednesday, August 27, 2025 7:45=E2=80=AFPM Svyatoslav Ryhel wr=
ote:
> > > > > > =D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80.=
 =D0=BE 13:36 Mikko Perttunen <mperttunen@nvidia.com>
> > >
> > > =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > > On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrot=
e:
> > > > > > > > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80=
. 07:09:45 GMT+03:00, Mikko Perttunen
> > > > > > >
> > > > > > > <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > > > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryh=
el wrote:
> > > > > > > > >> CSUS clock is required to be enabled on camera device
> > > > > > > > >> configuration
> > > > > > > > >> or
> > > > > > > > >> else camera module refuses to initiate properly.
> > > > > > > > >>
> > > > > > > > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > >> ---
> > > > > > > > >>
> > > > > > > > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > > > > > > > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > > > > > > > >>  2 files changed, 2 insertions(+)
> > > > > > > > >>
> > > > > > > > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > > > > > > > >> b/drivers/clk/tegra/clk-tegra20.c index
> > > > > > > > >> 551ef0cf0c9a..42f8150c6110
> > > > > > > > >> 100644
> > > > > > > > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > > > > > > > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > > > > > > > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table
> > > > > > > > >> init_table[]
> > > > > > > > >> =3D {
> > > > > > > > >>
> > > > > > > > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 }=
,
> > > > > > > > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > > > > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > > > > > > > >>
> > > > > > > > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 }=
,
> > > > > > > > >>
> > > > > > > > >>    /* must be the last entry */
> > > > > > > > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > > > > > > > >>
> > > > > > > > >>  };
> > > > > > > > >>
> > > > > > > > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > > > > > > >> b/drivers/clk/tegra/clk-tegra30.c index
> > > > > > > > >> 82a8cb9545eb..70e85e2949e0
> > > > > > > > >> 100644
> > > > > > > > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > > > > > > > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > > > > > > > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table
> > > > > > > > >> init_table[]
> > > > > > > > >> =3D {
> > > > > > > > >>
> > > > > > > > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > > > > > > > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 480000=
00, 0
> > > > > > > > >>    },
> > > > > > > > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > > > > > > >>
> > > > > > > > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 }=
,
> > > > > > > > >>
> > > > > > > > >>    /* must be the last entry */
> > > > > > > > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > > > > > > > >>
> > > > > > > > >>  };
> > > > > > > > >
> > > > > > > > >I looked into what this clock does and it seems to be a ga=
te
> > > > > > > > >for
> > > > > > > > >the
> > > > > > > > >CSUS
> > > > > > > > >pin, which provides an output clock for camera sensors (VI
> > > > > > > > >MCLK).
> > > > > > > > >Default
> > > > > > > > >source seems to be PLLC_OUT1. It would be good to note tha=
t on
> > > > > > > > >the
> > > > > > > > >commit
> > > > > > > > >message, as I can't find any documentation about the CSUS =
clock
> > > > > > > > >elsewhere.
> > > > > > > > >
> > > > > > > > >What is the 6MHz rate based on?
> > > > > > > >
> > > > > > > > 6mhz is the statistic value which I was not able to alter w=
hile
> > > > > > > > testing.
> > > > > > > > I
> > > > > > > > have tried 12mhz and 24mhz too but it remained 6mhz, so I l=
eft
> > > > > > > > it
> > > > > > > > 6mhz.
> > > > > > > >
> > > > > > > > >Since this seems to be a clock consumed by the sensor, it =
seems
> > > > > > > > >to
> > > > > > > > >me
> > > > > > > > >that
> > > > > > > > >rather than making it always on, we could point to it in t=
he
> > > > > > > > >sensor's
> > > > > > > > >device tree entry.
> > > > > > > >
> > > > > > > > Sensor device tree uses vi_sensor as clocks source and sens=
or
> > > > > > > > drivers
> > > > > > > > don't
> > > > > > > > support multiple linked clocks.
> > > > > > >
> > > > > > > AIUI vi_sensor is an internal clock so the sensor cannot be
> > > > > > > receiving
> > > > > > > it
> > > > > > > directly. Perhaps the sensor is actually connected to csus, a=
nd
> > > > > > > the
> > > > > > > reason
> > > > > > > we need to enable it is to allow the vi_sensor clock to pass
> > > > > > > through
> > > > > > > the
> > > > > > > csus gate?
> > > > > > >
> > > > > > > That leaves the question of why the csus pad would be muxed t=
o
> > > > > > > vi_sensor
> > > > > > > by
> > > > > > > default, but perhaps there's an explanation for that.
> > > > > >
> > > > > > From downstream T30 sources csus and vi_sensor are always calle=
d in
> > > > > > pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed t=
hat
> > > > > > latter is used as camera reference clock since most sensors has
> > > > > > reference clock around 24 MHz
> > > > >
> > > > > It's possible that the csus pad is still outputting 24MHz. The pi=
nmux
> > > > > options for the csus pad are various clocks, so it would seem log=
ical
> > > > > that the clock source for the pad is one of those clocks. However=
, on
> > > > > the
> > > > > clock framework side, the csus clock is just a gate. What I'm con=
fused
> > > > > about is that since on the clock framework side the parent of csu=
s is
> > > > > currently set to clk_m, I don't know why setting the rate of csus
> > > > > would
> > > > > affect the output of the pad, given clk_m is not one of the optio=
ns
> > > > > for
> > > > > the pinmux.
> > > > >
> > > > > It's be good to verify the register value for the csus pinmux to =
see
> > > > > where
> > > > > it thinks the clock is coming from, and then check how that match=
es
> > > > > with
> > > > > what we are seeing.
> > > >
> > > > TRM does not provide such data, it has only register address with
> > > > layout for it as a plain pad control, that register has only DRVDN,
> > > > DRVUP, SLWR and SLWF and I don't see a way to decode clock value or
> > > > parent or anything similar. If you give me a method I will calculat=
e
> > > > those values.
> > >
> > > I notice that on Tegra20, there is a mux pingroup called 'csus', whic=
h has
> > > the mux options PLLC_OUT1, PLLP_OUT2, PLLP_OUT3, and VI_SENSOR_CLK (b=
ased
> > > on upstream pinctrl-tegra20.c). The TRM also says 'Enable clock to SU=
S
> > > pad.' about the CSUS (or SUS) clock.
> > >
> > > On Tegra30, however, which I guess you refer to, I guess mux pingroup=
s are
> > > gone and each pin has its own mux (again looking at upstream pinctrl-
> > > tegra30.c). vi_mclk_pt1 is now its own mux with the options VI, VI_AL=
T1,
> > > VI_ALT2, VI_ALT3. The drive group for this pin is still called csus, =
so by
> > > that name it only has the drive settings as you mention.
> > >
> > > Are you testing on Tegra20, Tegra30, or both?
> >
> > I am testing on Tegra30 since I did not have compatible Tegra20 device
> > (with supported camera).
> >
> > > I've looked at some Tegra30 schematics, and they show a signal called
> > > VI_MCLK being routed to CSI cameras.
> > >
> > > > Another theory is that maybe csus is used for VIP cameras only and
> > > > vi_sensor is used for CSI cameras, but they both have to be on in
> > > > order to work correctly. Csus was removed from Tegra114 along with
> > > > VIP, might not be a coincidence. Moreover, T124 uses vi_sensor as
> > > > camera mclk source.
> > >
> > > I see the CSUS clock still on Tegra124 based on the upstream kernel. =
There
> > > is also a CAM_MCLK pin. It seems Tegra30 has both VI_MCLK and CAM_MCL=
K
> > > pins, which both can output the clock. After Tegra30 there is only
> > > CAM_MCLK.
> > >
> > > Looking at L4T r21, in tegra12_clocks.c, it defines the clocks mclk a=
nd
> > > mclk2.>
> > > There is a comment on mclk saying:
> > >                        .clk_num =3D 92, /* csus */
> > >
> > > whereas mclk2 is vim2_clk. These clocks are indeed defined as gates, =
with
> > > vi_sensor / vi_sensor2 as parent, set_rate being passed onto the pare=
nt.
> > >
> > > All of that wasn't very coherently written, but to summarize my thoug=
hts:
> > >
> > > On Tegra30, we have
> > > - Pins vi_mclk and cam_mclk. Both can only source from (vi_)mclk whic=
h
> > > also
> > > goes by name csus. The mclk/csus clock is a clock gate with vi_sensor=
 as
> > > parent.
> > > On Tegra114 and later,
> > > - Same situation, but vi_mclk is gone, so instead we have cam_mclk
> > > (possibly multiple with associated mclkN and vi_sensorN clocks)
> > > On Tegra20,
> > > - The vi_mclk pin has a variety of mux options, one of which is
> > > VI_SENSOR_CLK. I expect this to correspond to the same behavior as la=
ter
> > > chips, i.e. sources from the csus(/mclk) clock, which sources from
> > > vi_sensor.
> >
> > While this is all quite interesting, how to configure this properly?
>
> Fix the csus clock's parent to be vi_sensor. Point the sensor's device tr=
ee
> clock entry to csus. The sensor's clk_enable should then ungate csus and
> clk_set_rate should flow to vi_sensor to set the rate appropriately. In t=
he
> board device tree pinctrl section, set the vi_mclk pin's function to VI
> (should be default on Tegra30, but best to be explicit).
>
> I think that should do it, but it's all theoretical of course :)
>

Ok, seems to work correctly. I will add same setup to Tegra114 since
camera is not operational without same CSUS gate if you don't mind.

> >
> > > > Here is a fragment of Tegra124 clock tree (dumped from Mi pad 1)
> > > >
> > > >          pll_p                                 on     13  x34
> > > >          408000000
> > > >
> > > > vi_sensor2                       $ off    0   3.0      136000000 mc=
lk2
> > > >
> > > >                    $ off    0            136000000 vi_sensor
> > > >
> > > >         $ off    0   3.0      136000000 mclk                       =
   $
> > > >         off
> > > >
> > > >    0            136000000
> > > >
> > > > > > > > >Cheers,
> > > > > > > > >Mikko
>
>
>
>
