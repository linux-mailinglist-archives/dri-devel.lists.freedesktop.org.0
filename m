Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BD6E95CC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D4310EC4A;
	Thu, 20 Apr 2023 13:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8B110EC4A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:24:47 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2470e93ea71so699425a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681997087; x=1684589087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZwnhlLJyEh47311bVCrbK3D/ImOBY4/qp9iGa9ZeGIo=;
 b=ONIzX+fsmDFZ4VbgBdRcHCgYHnrSBP1dFd4aeE6I/29jSqTT3oOqtHUSmy8E2/Ki0A
 tSuP6Sh+TV8SNTGnG2V269F++sAwCMx/idYluhMe60Ihd1umwwpTKOjVY7wDo0trl6+E
 TEM/iFJhyla8toZ69F301BIJQSJiBWzWnGjrgib0aNCDydCMw58wBOYy4ESOOGZTYET7
 D+bjvDnhu7F32xSO9A4iXFmfHwdjerlFtiNilL+yEsA8qlbrlKLo12pbtJhQSBx7YbCU
 v/luq3oLXXXoQ/8A5LxnVmiY6APx6fn2PukIWFuL1lVrRiKbCJMJoqITAXbULrGLnybz
 ST1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681997087; x=1684589087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZwnhlLJyEh47311bVCrbK3D/ImOBY4/qp9iGa9ZeGIo=;
 b=Wpf1YOsXgA8EyMcahRZljNGrkf0mhKVkhP40P+14mgFcSgN+5E7/NVTA39uqNkma/R
 8MVVV7ZlOVW8nAV/TcYYFww5qmadHIc+2DcE8/WgLkIC9+7OviYq5ylI4zvtLwX/SQDk
 nX3xtho/C9pTnSw3/lKFwHOtOImf+MC0EZuX/EQl1pMM5QVjDM8dMzKIGFgyzQnjiJ2d
 pNzcqsqljAr7XJVAK9WmAZARYYx4g1uAOtsmY/G646em9v57J1TIFZF97EMl7qEX42gv
 Nbjqz+uCyoiwN662T1oZBsarcKfrxBWChxbEsnToC6yR3lbKx5B1zbhExErteE7+HrHi
 9xcw==
X-Gm-Message-State: AAQBX9eaXZuoGqeQRrIla5HvuWREJ7nyvAdWvjB4f9iq86ElU20K+hN1
 KB4vxuJVEV1TpUZgDuSKgnCxsh2zCQY5EijMHOQ=
X-Google-Smtp-Source: AKy350ZxG7RnlBrwRhQPUD6zN9rrL3FtZOktidwEmb9/Y/dRFeXtlhMFYCzZzu1ezgYBgH1ZgYDRjh15kvl1e16dSkU=
X-Received: by 2002:a17:90a:e7cf:b0:246:f710:4f01 with SMTP id
 kb15-20020a17090ae7cf00b00246f7104f01mr1573886pjb.35.1681997086466; Thu, 20
 Apr 2023 06:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <3e47f0d1017fe4c9f71a5de65f32c6ba1662efe2.camel@pengutronix.de>
 <CAHCN7xL4+9NogrnXA1PEWorwY7JpSGBozDtHT83JvzjfinmS+A@mail.gmail.com>
 <CAHCN7xK8K+DsNAFTVAezwJQzZ7RCDb2CjCBZ8dNb=S8d1BmtMA@mail.gmail.com>
 <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
In-Reply-To: <f42a2a11c1a2df4d773b61a449e8f4d5a9a010d1.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 20 Apr 2023 08:24:35 -0500
Message-ID: <CAHCN7x+bZHZHxYk=qC3QFS07kLO85w_rj1tOuX1Y3fJXekmvMQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane
 calculations
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 8:06=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Hi Adam,
>
> Am Mittwoch, dem 19.04.2023 um 05:47 -0500 schrieb Adam Ford:
> > On Mon, Apr 17, 2023 at 6:55=E2=80=AFAM Adam Ford <aford173@gmail.com> =
wrote:
> > >
> > > On Mon, Apr 17, 2023 at 3:43=E2=80=AFAM Lucas Stach <l.stach@pengutro=
nix.de> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > Am Samstag, dem 15.04.2023 um 05:40 -0500 schrieb Adam Ford:
> > > > > If there is more than one lane, the HFP, HBP, and HSA is calculat=
ed in
> > > > > bytes/pixel, then they are divided amongst the different lanes wi=
th some
> > > > > additional overhead. This is necessary to achieve higher resoluti=
ons while
> > > > > keeping the pixel clocks lower as the number of lanes increase.
> > > > >
> > > >
> > > > In the testing I did to come up with my patch "drm: bridge: samsung=
-
> > > > dsim: fix blanking packet size calculation" the number of lanes did=
n't
> > > > make any difference. My testing might be flawed, as I could only
> > > > measure the blanking after translation from MIPI DSI to DPI, so I'm
> > > > interested to know what others did here. How did you validate the
> > > > blanking with your patch? Would you have a chance to test my patch =
and
> > > > see if it works or breaks in your setup?
> >
> > Lucas,
> >
> > I tried your patch instead of mine.  Yours is dependent on the
> > hs_clock being always set to the burst clock which is configured by
> > the device tree.  I unrolled a bit of my stuff and replaced it with
> > yours.  It worked at 1080p, but when I tried a few other resolutions,
> > they did not work.  I assume it's because the DSI clock is fixed and
> > not changing based on the pixel clock.  In the version I did, I only
> > did that math when the lanes were > 1. In your patch, you divide by 8,
> > and in mine, I fetch the bits-per-pixel (which is 8) and I divide by
> > that just in case the bpp ever changes from 8.  Overall,  I think our
> > patches basically do the same thing.
>
> The calculations in your and my patch are quite different. I'm not
> taking into account the number of lanes or the MIPI format. I'm basing

I was looking more at the division by 8 and the overhead correction of 6.
This number 6 also appears in the NXP downstream kernel [1].  I know
Marek V had some concerns about that.

> the blanking size purely on the ratio between MIPI DSI byte clock and
> the DPI interface clock. It's quite counter-intuitive that the host
> would scale the blanking to the number of lanes automatically, but
> still require the MIPI packet offset removed, but that's what my
> measurements showed to produce the correct blanking after translation
> to DPI by the TC358767 bridge chip.

How many lanes is your DSI interface using?

>
> If you dynamically scale the HS clock, then you would need to input the
> real used HS clock to the calculation in my patch, instead of the fixed
> burst mode rate.

I think what you're saying makes sense.

The code I originally modeled this from was from the NXP downstream
kernel where they define the calculation as being in words [2]. I am
not saying the NXP code is perfect, but the NXP code works.  With this
series, my monitors are able to sync a bunch of different resolutions
from 1080p down to 640x480 and a bunch in between with various refresh
rates too. That was the goal of this series.

Instead of just using your patch as-is, I will adapt yours to use the
scaled clock to see how it behaves and get back to you.  I have
finished reworking the dynamic DPHY settings, and I've fixed up making
the PLL device tree optional. If your patch works, I'll drop my
calculation and just build off what you have to use the scaled HS
clock when I submit the V2 and I'll make sure I CC you.

adam

[1] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/br=
idge/sec-dsim.c#L270
[2] - https://github.com/nxp-imx/linux-imx/blob/lf-6.1.y/drivers/gpu/drm/br=
idge/sec-dsim.c#L914

>
> Regards,
> Lucas
