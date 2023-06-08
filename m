Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6F728008
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 14:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2122510E25A;
	Thu,  8 Jun 2023 12:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22CD10E25A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 12:31:08 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-543a09ee32eso1205776a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686227468; x=1688819468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYaex83iYldjr4WaT4p4MVHnHxPq49V7RC/LIPfCpiw=;
 b=WH4zfkGRn+TYAKddwln2Mf7XTBKgcp+jgv0ocs4ewFionyv1Tk/7NwprmBJ1hZTxHy
 z7p1q7q42YfMw/Jq34Z25MilS8Qidt4AmA5wkMvtAff9DTWcd1FvOnZWB65Ja2cMGzLs
 Wmbu9vNgrYQD7qsIXgLp9tttql3zA9ZhTAgUAwLSZdAycaxlmuAw5tPzqqIJwxyXIonJ
 O2SA+FptbA8Twr3ZMQFqGDvPRW3VtIiKwjqMxircHAbt5hBj5aMP+IYSZYe6KNyczTo0
 J2o9vhDYVQ2DmBnoXlH1MWHYfw4MrQpq36f2o+OGfcgDqatOSW0Gp5BxoShsJL6UEbJR
 wn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686227468; x=1688819468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYaex83iYldjr4WaT4p4MVHnHxPq49V7RC/LIPfCpiw=;
 b=Qj0lq/lKTL9UP7NL0A81kLIKpWSaYmPF3ditFN9GcK1bAu0Dzp+iNlmiqPsAjUG8p8
 0ygUbp7kvT6TLaTKoMoUYfa0bruHrGHWL6kBhMW6k3h81rFhuTZQCFAqIebdYsdj/eEZ
 Orc0G7vXAyNDzYNQNGu1LaU1RvXil71HrsPEDro9Iqe+j/tog/52/m2/2fNmyAm8MvTA
 CLFa9xlQDHGINSw2d7p2TcTOceP4pMCLVIWuJGtgltdPrvLMk41Wk3SssJUgrr2kl0Yl
 0LJg/yFV2/c+JjSzSy/YaV1rpk3fe0hxQaTioNcZlfbWGEt6O64B8VKPh4swVesMg/6L
 TPjg==
X-Gm-Message-State: AC+VfDzVrtDZVPQVJ1n8i+otrEZ+A8ke5ix2jZ9E+KQy717Lctqgv37D
 8lUodRR1AbsXHI6MLyVWa+jm2EOOVR/r9RD6Ilo=
X-Google-Smtp-Source: ACHHUZ79SdbFXhWhPj+g4SPuGOYKNr6zjt8F3knEUXT3Yh7jB37ic8zcDORhrjLl68XbloQ/h75GKu3N8U40xoN+sRg=
X-Received: by 2002:a17:90a:19d7:b0:258:de1b:9dcc with SMTP id
 23-20020a17090a19d700b00258de1b9dccmr2497551pjj.9.1686227467375; Thu, 08 Jun
 2023 05:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230526030559.326566-1-aford173@gmail.com>
 <e1379d94-66a5-8538-abdf-de7770befb7d@prevas.dk>
 <CAHCN7xK9RaLRSK_jSbbuGBUf14-FOHsrawi2J8G29iHSOj2Nyw@mail.gmail.com>
 <bfd050f2-b39e-c091-614e-0c77fe324435@prevas.dk>
In-Reply-To: <bfd050f2-b39e-c091-614e-0c77fe324435@prevas.dk>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 8 Jun 2023 07:30:56 -0500
Message-ID: <CAHCN7xKdKGA02=ZDNQkVVVDV0AZTqd7QpHA2Nq9LNnbmK=hKxA@mail.gmail.com>
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 8, 2023 at 6:40=E2=80=AFAM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 07/06/2023 15.27, Adam Ford wrote:
> > On Wed, Jun 7, 2023 at 8:15=E2=80=AFAM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> >>
> >> On 26/05/2023 05.05, Adam Ford wrote:
> >>> This series fixes the blanking pack size and the PMS calculation.  It=
 then
> >>> adds support to allows the DSIM to dynamically DPHY clocks, and suppo=
rt
> >>> non-burst mode while allowing the removal of the hard-coded clock val=
ues
> >>> for the PLL for imx8m mini/nano/plus, and it allows the removal of th=
e
> >>> burst-clock device tree entry when burst-mode isn't supported by conn=
ected
> >>> devices like an HDMI brige.  In that event, the HS clock is set to th=
e
> >>> value requested by the bridge chip.
> >>>
> >>> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and shou=
ld
> >>> work on i.MX8M Mini as well. Marek Szyprowski has tested it on variou=
s
> >>> Exynos boards.
> >>
> >> Hi all
> >>
> >> We're testing this on top of v6.4-rc4 on our imx8mp board, which has a
> >> ti-sn65dsi86 DSI -> DisplayPort bridge. We do get an image at
> >> 1920x1200, but the monitor says it's only at 58Hz, and measuring on th=
e
> >> DSI signals does seem to confirm that the update frequency is about 57=
.7
> >> or 57.8Hz (it's pretty hard to get a good measurement). It looks like
> >> it's the lines that are too long, by a time that corresponds to about =
80
> >> pixels. But all the frontporch/backporch/hsync values look sane and
> >> completely standard for that resolution.
> >>
> >> Setting samsung,burst-clock-frequency explicitly to something large
> >> enough or letting it be derived from the 154MHz pixel clock makes no
> >> difference.
> >>
> >> Any ideas?
> >
> > What refresh rate are you trying to achieve?  It seems like 57.7 or
> > 57.8 is really close to the 58 the Monitor states.
>
> Oh, sorry, I thought that was clear, but it should be/we're aiming
> for/expecting 60Hz, or (154MHz / (2080 * 1235)) which is about 59.95Hz.
> We've tried with a variety of monitors that all have 1920x1200@60Hz as
> max resolution, and parse-edid always gives the same hfp/hbp/...
> numbers, namely
>
>        Modeline        "Mode 0" 154.00 1920 1968 2000 2080 1200 1203
> 1209 1235 +hsync -vsync
>
> > I would expect the
> > refresh to be driven by whatever the monitor states it can handle.
>
> Well, it states that it can handle 60Hz, and the pixel clock is also
> computed to be the 154MHz, but still, the actual signals on the wire,
> and hence also what the monitor ends up reporting, do not end up with 60
> full frames per second.
>
> > Have you tried using modetest to see what refresh rates are available?
>
> Hm. My userspace may be a little weird. When I run modetest I just get
>
> trying to open device 'i915'...failed
> trying to open device 'amdgpu'...failed
> ...
> trying to open device 'imx-dcss'...failed
> trying to open device 'mxsfb-drm'...failed
> no device found
>

One the 8MP, I think you need to append "-M imx-lcdif" to the modetest
command  to specify the driver being used.
I don't have my 8MP with me right now, but I think that's the right name.

> > The 8MP shares the video-pll clock with both disp1 and disp2 clocks,
> > and the imx-lcdif driver, which sends the display signals to the DSI,
> > uses the disp clock, so the video-pll needs to be an exact multiple of
> > the pixel clock or the output won't sink.
>
> Bingo! I enabled the
>
>   DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
>
> in drivers/gpu/drm/mxsfb/lcdif_kms.c, and indeed it got me
>
>   Pixel clock: 154000kHz (actual: 148500kHz)
>
> Modifying the 1039500000 in imx8mp.dtsi to 1078000000 (i.e. 7 times the
> desired pixel clock) gave me "actual" matching the desired pixel clock,
> and the monitor now reports 60Hz.

I am glad that worked!

>
> This product also has an LVDS display on lcdif2, so I'll have to
> investigate how changing the video_pll1 rate affects that. And also what
> to do about the case where somebody plugs in, say, a 1080p monitor that
> would indeed require 148.5MHz pixel clock.

That's the down-side to the 8MP with the shared clock.  According to
the processor reference manual, It looks like the MEDIA_LDB_CLK can be
a child of Audio_PLL2.  i don't know if you need both AUDIO_PLL1 and
Audio_PLL2, but the Audio_PLL2 clock is fairly flexible, so if you can
use Audio_pll1 for all your audio needs, and configure the audio_pll2
for your LVDS, you might be able to get both LDB and DSI to sync at
the nominal values.

adam
>
> Thanks,
> Rasmus
>
