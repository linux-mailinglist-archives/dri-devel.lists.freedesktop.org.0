Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E4688C167
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 13:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9156610EEF1;
	Tue, 26 Mar 2024 12:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lk/W+XxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5F210EEF1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 12:00:33 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so935428366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711454432; x=1712059232; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Q+cRXbwSy+kj+jFr9nkKiGYcj2SC4D7bitszSSYK23c=;
 b=Lk/W+XxRNChg75VC2bTS6RTEfXtv+1sNx4lQApM7+RXqTdVF9OIYgL4wMHFJbpTy8j
 s4ZO4cIE+50VeoqOjzkDbAhpVe2pQpbIpL36vrHR0+tunlXYxtt3Rvxv5Nz1iTRv9pea
 fBFRDwVlNIGKRMyVOgTDHozY0JQHrJ5LYCh7PCmskGcHcQ70wKeljN4i7PUjpdEAgeFr
 GWPIYpR6PkDr7eXhlMyYrABgjMAIqOADNyHHzNEtaAUKitr9Gvxb7jWw1YP+WfkbceyY
 fizmLdhxMDPby4wQzDXA/VIICm91YipQrQRMkupzXfx0q0VVRZy2dEZB+JHAARaMfevD
 ZdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711454432; x=1712059232;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+cRXbwSy+kj+jFr9nkKiGYcj2SC4D7bitszSSYK23c=;
 b=eEbIhQ4rEQuo2XfCZtsayyVvxYzKSZb1O+0ce0NIijJ+7kwAt7CKpE0BewiBczGqtd
 kfjTJz0a42QU0EKHH/euFEqo9Q9kLsHL+RrnAbf9lhCzSAaPhy8PuZ3BVBHuHUPqNk9+
 Llw9wOjvbIcTp7N1EA2QfRL6W5vPslqMpjk7M6lZqkfycAXesVY9UTgDmr6xUARZjx+H
 /IKQ0ZVLQBxyQradO2s69FxMgwoGZ+tEBVcfeUHMPb3zAYhr1Qkxp8ErO+JF7bjDXyz4
 sV8anjLfM1UEVJtLeNn/Z8R1+2ft/tukPVftYCFK0FbQr8J4Bl6Mpf1AxVg7MYEokG27
 yuSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkFrdnK1hzeMlPpBEWUycqVY/p1vCXT+Dd8Fz3o6qxYQHG35OKVao+aNHUBy+bPIXFuWFEXrdmmpzMIRfC33Kv88GtZrjPEnmad0DuRMqd
X-Gm-Message-State: AOJu0YztgMa6J8p30qjiXKjzgFX6oxCGv6wA/ob8SawhXUXTozVWP1SU
 RnpqsCmrQE2/e57oTka3Y90q5uj2fvvVHt4a6iY9SXMjVm550lYt
X-Google-Smtp-Source: AGHT+IGTVHhqv1Z3qZT1O+W/QmPwT2rWCjt3Smjij2n/6C0H4oN7ExLhExY+im0uK0tJh985OvfRtg==
X-Received: by 2002:a17:907:86a5:b0:a46:e672:9619 with SMTP id
 qa37-20020a17090786a500b00a46e6729619mr1376237ejc.24.1711454431323; 
 Tue, 26 Mar 2024 05:00:31 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation
 (net-188-217-49-82.cust.vodafonedsl.it. [188.217.49.82])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a17090626cd00b00a45200fe2b5sm4128790ejc.224.2024.03.26.05.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 05:00:30 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:00:27 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, marex@denx.de,
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH V8 00/12] soc: imx8mp: Add support for HDMI
Message-ID: <ZgK42/ODNt7prTvD@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240203165307.7806-1-aford173@gmail.com>
 <ZgHxSHDAt7ytqDC1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20240325220338.GE23988@pendragon.ideasonboard.com>
 <ZgJ9P3Wx2A2n9Gt+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <CAHCN7xKWUQwfNmTB_bu4Kqm-b6PSPBHvyf8yfRbL53rB20-=DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKWUQwfNmTB_bu4Kqm-b6PSPBHvyf8yfRbL53rB20-=DQ@mail.gmail.com>
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

Hi Adam,

On Tue, Mar 26, 2024 at 06:43:26AM -0500, Adam Ford wrote:
> On Tue, Mar 26, 2024 at 2:46 AM Tommaso Merciai <tomm.merciai@gmail.com> wrote:
> >
> > Hi Laurent,
> >
> > On Tue, Mar 26, 2024 at 12:03:38AM +0200, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > >
> > > On Mon, Mar 25, 2024 at 10:48:56PM +0100, Tommaso Merciai wrote:
> > > > Hi Adam, Lucas,
> > > > Thanks for this series.
> > > >
> > > > This series make HDMI work on evk.
> > > > All is working properly on my side.
> > > >
> > > > Tested on: Linux imx8mp-lpddr4-evk 6.9.0-rc1.
> > > > Hope this help.
> > > >
> > > > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > >
> > > The DRM side has been merged already. The only missing patches are for
> > > the PHY, and the latest version can be found in
> > > https://lore.kernel.org/linux-phy/20240227220444.77566-1-aford173@gmail.com/.
> > > You can test that series and send a Tested-by tag. I'm crossing my
> > > fingers and hoping it will be merged in v6.10.
> > (same here :) )
> >
> > Thanks for sharing! :)
> >
> > To be honest I test all this series rebasing my alvium next branch on top of media_stage/master (6.9.0-rc1)
> > All is working properly on my side.
> > I found v8 into the commit msg here: https://patches.linaro.org/project/linux-pm/patch/20240203165307.7806-9-aford173@gmail.com/
> > then I'm thinking this is the latest.
> >
> > I'm going to switch to your suggestion that looks more recent :)
> 
> Sorry about the confusion.  I was confused by the versioning too when
> I pulled from different parts of Lucas' stuff.  Since varying
> components were applied at different times, and the remaining part was
> based on the wrong starting point and not applied, I reverted back to
> the versioning of the PHY which was the only remaining part other than
> device tree stuff.

No problem, thanks for clarify :)

Thanks & Regards,
Tommaso

> 
> adam
> >
> > Thanks again,
> > Tommaso
> >
> > >
> > > > On Sat, Feb 03, 2024 at 10:52:40AM -0600, Adam Ford wrote:
> > > > > The i.MX8M Plus has an HDMI controller, but it depends on two
> > > > > other systems, the Parallel Video Interface (PVI) and the
> > > > > HDMI PHY from Samsung. The LCDIF controller generates the display
> > > > > and routes it to the PVI which converts passes the parallel video
> > > > > to the HDMI bridge.  The HDMI system has a corresponding power
> > > > > domain controller whose driver was partially written, but the
> > > > > device tree for it was never applied, so some changes to the
> > > > > power domain should be harmless because they've not really been
> > > > > used yet.
> > > > >
> > > > > This series is adapted from multiple series from Lucas Stach with
> > > > > edits and suggestions from feedback from various series, but it
> > > > > since it's difficult to use and test them independently,
> > > > > I merged them into on unified series.  The version history is a
> > > > > bit ambiguous since different components were submitted at different
> > > > > times and had different amount of retries.  In an effort to merge them
> > > > > I used the highest version attempt.
> > > > >
> > > > > Adam Ford (3):
> > > > >   dt-bindings: soc: imx: add missing clock and power-domains to
> > > > >     imx8mp-hdmi-blk-ctrl
> > > > >   pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc clock to hdmimix
> > > > >     domain
> > > > >   arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
> > > > >
> > > > > Lucas Stach (9):
> > > > >   dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
> > > > >   phy: freescale: add Samsung HDMI PHY
> > > > >   arm64: dts: imx8mp: add HDMI power-domains
> > > > >   arm64: dts: imx8mp: add HDMI irqsteer
> > > > >   dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
> > > > >   drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
> > > > >   dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
> > > > >   drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
> > > > >   arm64: dts: imx8mp: add HDMI display pipeline
> > > > >
> > > > >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  102 ++
> > > > >  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   84 ++
> > > > >  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
> > > > >  .../soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml     |   22 +-
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  145 +++
> > > > >  arch/arm64/configs/defconfig                  |    1 +
> > > > >  drivers/gpu/drm/bridge/imx/Kconfig            |   18 +
> > > > >  drivers/gpu/drm/bridge/imx/Makefile           |    2 +
> > > > >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |  207 ++++
> > > > >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  154 +++
> > > > >  drivers/phy/freescale/Kconfig                 |    6 +
> > > > >  drivers/phy/freescale/Makefile                |    1 +
> > > > >  drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1075 +++++++++++++++++
> > > > >  drivers/pmdomain/imx/imx8mp-blk-ctrl.c        |   10 +-
> > > > >  14 files changed, 1876 insertions(+), 13 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> > > > >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> > > > >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> > > > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> > > > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > >  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
