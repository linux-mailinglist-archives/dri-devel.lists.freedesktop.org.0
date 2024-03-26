Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BB88C106
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340FA10E725;
	Tue, 26 Mar 2024 11:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NjKzl8aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3557B10E735
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:43:39 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5cfd95130c6so2946091a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 04:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711453418; x=1712058218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JJfNLPGXQjdD5E+CQgcIovMfTBNJAPrFsXk8DSz3Bc=;
 b=NjKzl8aBIaoLUREEsZx22Y6CPp/LF0f99RqoY8zK1Iw5jK6vAUn2JyrH0ooMh6T7XG
 DpmOiO442D24x4XuRlLgEFsYdq51JM2c6JCONCG5JIRzVtw4Eu7tTYmBEnkA2rAEc6Cr
 catL1NOayX6xLdm3FrHZWsumRjje/bWDldIPIjFOoiPQ8u3nRzHaBLXjFq6rJxMLZDxn
 GPYcm3y8rXWtpwZaUkbBFhVHO3icbVA/7hOdC0BRVpc8XCAVWr+pcOhPC99L96dtYAe5
 T1NeB+MeEF2fdRTlSbnL7Wsusj4vJUZSd2Var14etRltsp2Lfa1gG6QD4TRGa5VriRB2
 sfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711453418; x=1712058218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7JJfNLPGXQjdD5E+CQgcIovMfTBNJAPrFsXk8DSz3Bc=;
 b=lrj/tONny2zGday38XZ0vPlElv2zPr3iKLz+Ye0OwpOhfJWtkutSqa4cV4vGEe0HXU
 rIJsTiP95uwRNKPuAtq3vUitLRWPKM1X4RYNmdfF0GChmHlJD17qqLPRJ5NyBj0edUgS
 HUcv5qTlfQDvU7Qm4UEq5Txgtz01TS0aO9iuu9rLkKXGr/kPcVofyfbwUO9ZEPbR72rs
 A/CMpMcQQkhbp/h721gkDq4plpSMuiq4n/74ZEDo9DnshqoOjYbWVHt5w5wImnNDSngl
 LoyY5cqm8kz0tasHS281D7NjcJ54+IUmy4hxSXohpnIMz/LT9SYc6bnuJqWVxz8uBRg6
 e0wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlPKKZgHaHo7tCnvz/x2U+N5TmrCwMpXAYxekBPIO5nXoIEjsa5mOMSsVLZhKswvnroXwZ83NoXh/bITDi54nT5dI+2haNceugyHiiXFzR
X-Gm-Message-State: AOJu0YzRbdMhIQokP2X3wk1+ceEzpn7zVhZwnFWa/lsSo0Wq61QHpWd8
 9DSdifaMTfyG6cAn1xlKaWD+mMEHBsBKwFuljPcFEULDFViwXjybqIIZj6aT+ifQj51Bd3pnqqD
 I9kdbbZQLFy5IxZa/EjiLl6sRpM8=
X-Google-Smtp-Source: AGHT+IFJr4BwXlddlBEjDngUlpX7zK9gcwzqV6NzPa916601f5z9OcCg5f1L0di5ibf8HMxg/xfxr8hQHHEfl93yHwc=
X-Received: by 2002:a17:90a:4a0c:b0:2a0:3dc1:2926 with SMTP id
 e12-20020a17090a4a0c00b002a03dc12926mr7088214pjh.17.1711453418128; Tue, 26
 Mar 2024 04:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com>
 <ZgHxSHDAt7ytqDC1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20240325220338.GE23988@pendragon.ideasonboard.com>
 <ZgJ9P3Wx2A2n9Gt+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
In-Reply-To: <ZgJ9P3Wx2A2n9Gt+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 26 Mar 2024 06:43:26 -0500
Message-ID: <CAHCN7xKWUQwfNmTB_bu4Kqm-b6PSPBHvyf8yfRbL53rB20-=DQ@mail.gmail.com>
Subject: Re: [PATCH V8 00/12] soc: imx8mp: Add support for HDMI
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, 
 marex@denx.de, alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org
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

On Tue, Mar 26, 2024 at 2:46=E2=80=AFAM Tommaso Merciai <tomm.merciai@gmail=
.com> wrote:
>
> Hi Laurent,
>
> On Tue, Mar 26, 2024 at 12:03:38AM +0200, Laurent Pinchart wrote:
> > Hi Tommaso,
> >
> > On Mon, Mar 25, 2024 at 10:48:56PM +0100, Tommaso Merciai wrote:
> > > Hi Adam, Lucas,
> > > Thanks for this series.
> > >
> > > This series make HDMI work on evk.
> > > All is working properly on my side.
> > >
> > > Tested on: Linux imx8mp-lpddr4-evk 6.9.0-rc1.
> > > Hope this help.
> > >
> > > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> >
> > The DRM side has been merged already. The only missing patches are for
> > the PHY, and the latest version can be found in
> > https://lore.kernel.org/linux-phy/20240227220444.77566-1-aford173@gmail=
.com/.
> > You can test that series and send a Tested-by tag. I'm crossing my
> > fingers and hoping it will be merged in v6.10.
> (same here :) )
>
> Thanks for sharing! :)
>
> To be honest I test all this series rebasing my alvium next branch on top=
 of media_stage/master (6.9.0-rc1)
> All is working properly on my side.
> I found v8 into the commit msg here: https://patches.linaro.org/project/l=
inux-pm/patch/20240203165307.7806-9-aford173@gmail.com/
> then I'm thinking this is the latest.
>
> I'm going to switch to your suggestion that looks more recent :)

Sorry about the confusion.  I was confused by the versioning too when
I pulled from different parts of Lucas' stuff.  Since varying
components were applied at different times, and the remaining part was
based on the wrong starting point and not applied, I reverted back to
the versioning of the PHY which was the only remaining part other than
device tree stuff.

adam
>
> Thanks again,
> Tommaso
>
> >
> > > On Sat, Feb 03, 2024 at 10:52:40AM -0600, Adam Ford wrote:
> > > > The i.MX8M Plus has an HDMI controller, but it depends on two
> > > > other systems, the Parallel Video Interface (PVI) and the
> > > > HDMI PHY from Samsung. The LCDIF controller generates the display
> > > > and routes it to the PVI which converts passes the parallel video
> > > > to the HDMI bridge.  The HDMI system has a corresponding power
> > > > domain controller whose driver was partially written, but the
> > > > device tree for it was never applied, so some changes to the
> > > > power domain should be harmless because they've not really been
> > > > used yet.
> > > >
> > > > This series is adapted from multiple series from Lucas Stach with
> > > > edits and suggestions from feedback from various series, but it
> > > > since it's difficult to use and test them independently,
> > > > I merged them into on unified series.  The version history is a
> > > > bit ambiguous since different components were submitted at differen=
t
> > > > times and had different amount of retries.  In an effort to merge t=
hem
> > > > I used the highest version attempt.
> > > >
> > > > Adam Ford (3):
> > > >   dt-bindings: soc: imx: add missing clock and power-domains to
> > > >     imx8mp-hdmi-blk-ctrl
> > > >   pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc clock to hdmimix
> > > >     domain
> > > >   arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
> > > >
> > > > Lucas Stach (9):
> > > >   dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
> > > >   phy: freescale: add Samsung HDMI PHY
> > > >   arm64: dts: imx8mp: add HDMI power-domains
> > > >   arm64: dts: imx8mp: add HDMI irqsteer
> > > >   dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
> > > >   drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
> > > >   dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
> > > >   drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
> > > >   arm64: dts: imx8mp: add HDMI display pipeline
> > > >
> > > >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  102 ++
> > > >  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   84 ++
> > > >  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
> > > >  .../soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml     |   22 +-
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  145 +++
> > > >  arch/arm64/configs/defconfig                  |    1 +
> > > >  drivers/gpu/drm/bridge/imx/Kconfig            |   18 +
> > > >  drivers/gpu/drm/bridge/imx/Makefile           |    2 +
> > > >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |  207 ++++
> > > >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  154 +++
> > > >  drivers/phy/freescale/Kconfig                 |    6 +
> > > >  drivers/phy/freescale/Makefile                |    1 +
> > > >  drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1075 +++++++++++++=
++++
> > > >  drivers/pmdomain/imx/imx8mp-blk-ctrl.c        |   10 +-
> > > >  14 files changed, 1876 insertions(+), 13 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridg=
e/fsl,imx8mp-hdmi-tx.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/f=
sl,imx8mp-hdmi-pvi.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8m=
p-hdmi-phy.yaml
> > > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> > > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > >  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
