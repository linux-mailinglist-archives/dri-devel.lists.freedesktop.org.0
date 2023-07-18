Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC49757994
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 12:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32FA10E160;
	Tue, 18 Jul 2023 10:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A432A10E160
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 10:51:01 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c01e1c0402cso4220409276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 03:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689677460; x=1692269460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrQJ3UxOgVoAawfwg9j7T2pPsm1v4sTaBHmMP3Nj5YE=;
 b=fjhhtzlc7BdaXnBDcBj8sWGXorBV9NYNTpLshb7pbMg2nttikv39Z2PjFFARxpQZTY
 8PmfXs/A9R3sCZ5dVmfxzFUStb6zwyojjtJ/y2BZAO7Hp68gaTLkKLajf0PlA+m4hD2/
 DI3UdTu8866o8GHK/4xepkn7vAoJJ5jm9+Y1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689677460; x=1692269460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qrQJ3UxOgVoAawfwg9j7T2pPsm1v4sTaBHmMP3Nj5YE=;
 b=Oe3nqyJ+3d4BwJPQC4WoflAqIKZ94BKPOCixro61gEsPHQdkHpxqcIbV4gDbW7EfHF
 J9S9cG2p+uHh6kZyoL286nCKQfr9VHnuZ/vQGfMirVDLO+oKcqVPI/9cEHh3qbTf2emw
 FD+8/BTje5018VzBpEzaAgTJh4JiQNkzD6HP4uJ2folmPj8AK6aKFRD92g0qGh97T4Ih
 v/0t0xmShK3haemupQPnwYEg8/A746+F5u57pBsaaZAjaKp2LQGKb8Vc6SefCKjjAiuq
 SW5htGbvTY8p9hB64+xn3FbCeies4xw8ULnnwxewx+se8os3nIxPYSdU/3w02HX360TJ
 uBBg==
X-Gm-Message-State: ABy/qLaPzI+OSKzfM2iPbv/ZKlL8cXYfNwaKPE3yjox5ueqF4T5cwhsc
 wdwgEpgdsdfFwRPnMdgCeabvoubB9V8viZJtgtcDfg==
X-Google-Smtp-Source: APBJJlHhs/NagGlswZYTgGnUzxbYnXLhfzaBkiHnHP045bqB4Z/YkDRs2OQp1KDd3VTeiy76FfdXcsBdaYpbz5EZs90=
X-Received: by 2002:a25:8249:0:b0:c4e:48eb:b8cb with SMTP id
 d9-20020a258249000000b00c4e48ebb8cbmr11195899ybn.40.1689677460289; Tue, 18
 Jul 2023 03:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
 <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
 <AM7PR04MB7046BF03266ED1CE21CFC3A99838A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <CAMty3ZDy7Ty2AUV+Ab60nvgBzyLB-ejM=Yij9RFyTNvJBG_EvA@mail.gmail.com>
 <DB8PR04MB7051B5AB0D57BCEF2FBEBAE99838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB7051B5AB0D57BCEF2FBEBAE99838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Jul 2023 16:20:48 +0530
Message-ID: <CAMty3ZDBSwxFZM0FE2ytvvQ0PXU9WNyWwvd_DOrKpe43HH2x+w@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, dl-linux-imx <linux-imx@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 18, 2023 at 3:19=E2=80=AFPM Ying Liu <victor.liu@nxp.com> wrote=
:
>
> On Tuesday, July 18, 2023 5:35 PM Jagan Teki <jagan@amarulasolutions.com>=
 wrote:
> >
> > >
> > > Hi Jagan,
> > >
> > > On Monday, July 17, 2023 2:44 PM Jagan Teki
> > <jagan@amarulasolutions.com> wrote:
> > > > On Mon, Jul 17, 2023 at 11:44=E2=80=AFAM Liu Ying <victor.liu@nxp.c=
om> wrote:
> > > > >
> > > > > Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> > > > > controller and a Synopsys Designware MIPI DPHY.  Some configurati=
ons
> > > > > and extensions to them are controlled by i.MX93 media blk-ctrl.
> > > > >
> > > > > Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DS=
I
> > > > > bridge helpers and implementing i.MX93 MIPI DSI specific extensio=
ns.
> > > >
> > > > I think the better way would add compatibility to be part of existi=
ng
> > > > dw-mipi-dsi.c with specific driver data. This way it avoids all the
> > > > platform-related helpers(extensions) and makes the driver generic t=
o
> > > > all SoCs which use DW DSI IP. It would be a straightforward change =
as
> > > > the imx93 drm pipeline already supports bridge topology.
> > >
> > > The platform-related stuff is handed over to dw-mipi-dsi.c via struct
> > > dw_mipi_dsi_plat_data as an argument of dw_mipi_dsi_probe().  It look=
s
> > > ok for vendor drivers to call dw_mipi_dsi_probe() to set the platform=
-
> > related
> > > information(rockchip, meson and stm do that), like pdata.phy_ops and
> > > pdata.host_ops.
> >
> > I understand this topology of having soc-platform drivers with
> > dw-mipi-dsi bridge. What I'm suggesting is to not add a soc-platform
> > driver for imx93 instead add add support directly on dw-mipi-dsi
> > bridge.
>
> It seems that directly supporting i.MX93 MIPI DSI in dw-mipi-dsi.c is
> not feasible.  The main reason is that struct dw_mipi_dsi_plat_data
> contains phy_ops and each vendor driver provides very different
> methods for phy, while...

Cannot this phy_ops goes to PHY core somewhere around and even it is
possible to add via driver data for imx93 by untouching existing
handling? I know it is not as direct as I describe but it is worth
maintaining the driver this way to keep control of the future
soc-drivers to include in dw-mipi-dsi instead of handling platform
code separately.

>
> >
> > >
> > > dw-mipi-dsi.c is generic w/wo this patch series.
> > >
> > > Can you elaborate more about adding compatibility to be part of exist=
ing
> > > dw-mipi-dsi.c with specific driver data?  I don't see clear approach =
to do
> > > that.
> >
> > Please check the above comments, an example of samsung-dsim.c
>
> ... it seems that samsung-dsim.c uses struct samsung_dsim_driver_data to
> differential platform information and it doesn't contain any callback, wh=
ich
> means comparing to DW MIPI DSI, Samsung DSIM shows more consistency
> across vendor SoCs from HW IP/SoC integration PoV.

Yes, but is it possible to adjust struct according to DW MIPI DSI.

Thanks
Jagan.
