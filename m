Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB56E5795
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 04:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D7F10E084;
	Tue, 18 Apr 2023 02:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCED10E084
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 02:43:27 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-63b60366047so1271986b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681785806; x=1684377806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmIO4AdDKQdy+8t5oD0ActH/+eFcz+x5x3nOJUUqhCQ=;
 b=ZYk8e0xnFpSbdWGBL12gfnkN8bm66ghxLYzKfJSzINawVMKpggmz1STUYKM922oyOt
 Eaq2nakbFzVsulDAExekVrQChKfXHBw/lKK83+dnrqNUyApP3KvSTCXu2jy/s8j6wtzO
 wogs34JGO0c8R8X51ZRT/zyd9MUDd+7tEJhHSGl9sdHuFN+Al+Q+psLL05mQcBOO16eJ
 8Q+9mYJLw1AIz3/PC+iPn7m3JgSm49iFCG+AbJKgmAUaPc5GbBpeej/a7OCW2f5HWFK7
 wnbkYY6ca1IRlVhgZI+fVaeuqxInU2LmuXDpXdK0ev/nwPJM6+qxILSmHH0VlhVGx7z8
 HDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681785806; x=1684377806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmIO4AdDKQdy+8t5oD0ActH/+eFcz+x5x3nOJUUqhCQ=;
 b=KdC2+NzB0fobjazdRNuYSDorY8xH5iO6nmRtUdSTthb/0tx52w7ZEOrR3bVjWQXQBV
 hiGY8/KaQpYpUy61+1NAAQ/8Va1fjYTtZIMVgehiMhPB6FKFrIRj04hP5zVILEJF70BU
 aNypI8hj4IXFofyWe/wxy6qzNmdruhpKYsAglqTFOvkVpUwSGIbvzbCcYgahak9wAd8B
 8ScWtgZxF5k67Qb0kelUWidOfcpFp7i2bFFOudrFiecb7yZUzERca+t/xK8XHmsLAcFZ
 nNuFl91ah+07xH2jmpczh0viYGXCap/GR9j+IYECHwpOFP3CSdFRQNwq0FSK/hVeVewg
 EuyA==
X-Gm-Message-State: AAQBX9fRDJ4yyWBiFXG+xKMnUGe0ynEdb+OWnYCawvW2EGx6v3lA1llK
 qh6hc0OihvwNG33pTjUkFjT2ml5hHkjTIfvwD6s=
X-Google-Smtp-Source: AKy350aqgDdKIo5YoTPII4rMPfWaTsReCveuBWc1lewoRA1K3Hlesmnd9usHQaRZbq3AjGXKObrTSc1kQu7Xxza7oCY=
X-Received: by 2002:a05:6a00:228b:b0:63b:641d:76d8 with SMTP id
 f11-20020a056a00228b00b0063b641d76d8mr6976290pfe.2.1681785806554; Mon, 17 Apr
 2023 19:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-4-aford173@gmail.com>
 <8db7ad8da4805d7eb4471051676d179e193ee399.camel@pengutronix.de>
 <CAHCN7x+hFu15TM0w5DXzmWZRKEN6=MNNTVLNtpNxbirVGrapdg@mail.gmail.com>
In-Reply-To: <CAHCN7x+hFu15TM0w5DXzmWZRKEN6=MNNTVLNtpNxbirVGrapdg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Apr 2023 21:43:15 -0500
Message-ID: <CAHCN7xKmFzuwFVO1eR8fdVQ9iXUuB0zVadFYG5_6t8p0=dPG+w@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
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
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 6:53=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Apr 17, 2023 at 3:38=E2=80=AFAM Lucas Stach <l.stach@pengutronix.=
de> wrote:
> >
> > Hi Adam,
> >
> > Am Samstag, dem 15.04.2023 um 05:41 -0500 schrieb Adam Ford:
> > > NXP uses a lookup table to determine the various values for
> > > the PHY Timing based on the clock rate in their downstream
> > > kernel.  Since the input clock can be variable, the phy
> > > settings need to be variable too.  Add an additional variable
> > > to the driver data to enable this feature to prevent breaking
> > > boards that don't support it.
> > >
> >
> > I haven't checked if this generates values close to the ones in this
> > table, but I guess it should be worth a try to use
> > phy_mipi_dphy_get_default_config() instead.
>
> I didn't know that was a thing.  I like that idea much better than the
> table.  I just pulled what NXP had and tweaked it to fit the mainline.
> I'll give it a try in the next few days, when I have some more time.

I tried phy_mipi_dphy_get_default_config() and the function return
different values than what NXP's table returns, and the screen doesn't
sync properly.  I will try to figure out the mathematical calculation
to generate the values for this DSIM instead of using a lookup table.

adam
>
> adam
> >
> > Regards,
> > Lucas
> >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c |  85 +++++++--
> > >  drivers/gpu/drm/bridge/samsung-dsim.h | 254 ++++++++++++++++++++++++=
++
> > >  include/drm/bridge/samsung-dsim.h     |   1 +
> > >  3 files changed, 326 insertions(+), 14 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.h
> > >
> <snip>
> >
