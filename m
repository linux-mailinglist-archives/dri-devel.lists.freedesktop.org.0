Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B488BB99
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 08:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA0C10ED7F;
	Tue, 26 Mar 2024 07:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eiml46kM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29C510ED7F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 07:46:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5688eaf1165so7111366a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711439171; x=1712043971; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cs2IwigS62lW2NUemYpoxv0KHk0e1rYE/O58ogrWzrM=;
 b=Eiml46kMB+bG0wtlM+CaA61PX7w7UR8GoG1YEVoU9YATvqGnCDPTv6Ct4b6cPoshyQ
 68jJ0hsDXZXubT8ZJ4y0ihK+/iwzHZE/6B8ZSJOsNVmmT4acHMmbIuz2IYtSh4r0ae/y
 3GUFQy2KLxpuXjYj7zl59SgRFDIS6I9O+jh5hj3SW0jMq91Se1PoON+1aoD4dmixms6p
 rleNNjltoP5hW/bqze4JoqArC5P4XqGb+mM7fEM4eucTRDaCPcYXIKfCqV2zRM00mX28
 1jtD09IDombQWC8X3tjBPXzKdqKBWbBrMc5rJHB1FYyb81VYCNoQ7yFMw44X8K4ElmsW
 K9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711439171; x=1712043971;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cs2IwigS62lW2NUemYpoxv0KHk0e1rYE/O58ogrWzrM=;
 b=H1pd/4H34uOdOzgStGPtye3Sy30vWVFuvr/ycXbpXIYHGug6AGH6KZ9hCpCKzVJqCR
 3cpJFxYDG6BbS6iWRjCuSAR/Qlcr+hbZ07b1cePeGWibJHBLqM/I7L7sTyR0Dyo4Uq7E
 Q6GSG0tfYUADvYyMWgKWI/2gKfZK9HWjzp7YV/VmUoccyF3AFy7g3+ly7SLYzzXSdIOx
 LuyEIiJhi1h9iWe6Cf23F/17OxoVkpB5Q7lHE7XgGIMEO3OaOTgWl6+MRgQRl7oDhtqb
 8f0hX3tZQz6i5W87LUWiHEoRMfJL/wnP5D/qsY9GjdV8Gg4ATpC5jzmAAdnOoCcpUHEu
 +ibg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2JrCRQ/FSrkLUseae7YtbKTiHvb5nAkjE90y5FF+G94Z6JEWn9l0kD7FrGsM/e/Fiz1SYTOf+FCSkcE5tUtRFpWERh3aVuPkyiaHg1uMb
X-Gm-Message-State: AOJu0Ywz4RdjxAt29sYQtCp8KCN0/P+ZLqAo0Q+/SSBk2oqdnxoxSAKo
 5CSV4IqMUaKCnoZmIcx3f6M+iIU80naY5FGInJZ9yUalt7gMIZ/U
X-Google-Smtp-Source: AGHT+IGrIlCSSn2r2+Hg+P0/A4xj4OXP7apyF3284aGBI7zxVjMxD5nzUTRKGklIY7bvBEYmSkW8Iw==
X-Received: by 2002:a50:8ac9:0:b0:568:a420:7d80 with SMTP id
 k9-20020a508ac9000000b00568a4207d80mr6923066edk.27.1711439171189; 
 Tue, 26 Mar 2024 00:46:11 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation
 (net-188-217-49-82.cust.vodafonedsl.it. [188.217.49.82])
 by smtp.gmail.com with ESMTPSA id
 dh16-20020a0564021d3000b0056c1c4b870asm1167067edb.16.2024.03.26.00.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 00:46:10 -0700 (PDT)
Date: Tue, 26 Mar 2024 08:46:07 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Andrzej Hajda <andrzej.hajda@intel.com>,
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
Message-ID: <ZgJ9P3Wx2A2n9Gt+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240203165307.7806-1-aford173@gmail.com>
 <ZgHxSHDAt7ytqDC1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20240325220338.GE23988@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325220338.GE23988@pendragon.ideasonboard.com>
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

Hi Laurent,

On Tue, Mar 26, 2024 at 12:03:38AM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Mon, Mar 25, 2024 at 10:48:56PM +0100, Tommaso Merciai wrote:
> > Hi Adam, Lucas,
> > Thanks for this series.
> > 
> > This series make HDMI work on evk.
> > All is working properly on my side.
> > 
> > Tested on: Linux imx8mp-lpddr4-evk 6.9.0-rc1.
> > Hope this help.
> > 
> > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> The DRM side has been merged already. The only missing patches are for
> the PHY, and the latest version can be found in
> https://lore.kernel.org/linux-phy/20240227220444.77566-1-aford173@gmail.com/.
> You can test that series and send a Tested-by tag. I'm crossing my
> fingers and hoping it will be merged in v6.10.
(same here :) )

Thanks for sharing! :)

To be honest I test all this series rebasing my alvium next branch on top of media_stage/master (6.9.0-rc1)
All is working properly on my side.
I found v8 into the commit msg here: https://patches.linaro.org/project/linux-pm/patch/20240203165307.7806-9-aford173@gmail.com/
then I'm thinking this is the latest.

I'm going to switch to your suggestion that looks more recent :)

Thanks again,
Tommaso

> 
> > On Sat, Feb 03, 2024 at 10:52:40AM -0600, Adam Ford wrote:
> > > The i.MX8M Plus has an HDMI controller, but it depends on two
> > > other systems, the Parallel Video Interface (PVI) and the
> > > HDMI PHY from Samsung. The LCDIF controller generates the display
> > > and routes it to the PVI which converts passes the parallel video
> > > to the HDMI bridge.  The HDMI system has a corresponding power
> > > domain controller whose driver was partially written, but the
> > > device tree for it was never applied, so some changes to the
> > > power domain should be harmless because they've not really been
> > > used yet.
> > > 
> > > This series is adapted from multiple series from Lucas Stach with
> > > edits and suggestions from feedback from various series, but it
> > > since it's difficult to use and test them independently,
> > > I merged them into on unified series.  The version history is a
> > > bit ambiguous since different components were submitted at different
> > > times and had different amount of retries.  In an effort to merge them
> > > I used the highest version attempt.
> > > 
> > > Adam Ford (3):
> > >   dt-bindings: soc: imx: add missing clock and power-domains to
> > >     imx8mp-hdmi-blk-ctrl
> > >   pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc clock to hdmimix
> > >     domain
> > >   arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
> > > 
> > > Lucas Stach (9):
> > >   dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
> > >   phy: freescale: add Samsung HDMI PHY
> > >   arm64: dts: imx8mp: add HDMI power-domains
> > >   arm64: dts: imx8mp: add HDMI irqsteer
> > >   dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
> > >   drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
> > >   dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
> > >   drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
> > >   arm64: dts: imx8mp: add HDMI display pipeline
> > > 
> > >  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  102 ++
> > >  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   84 ++
> > >  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
> > >  .../soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml     |   22 +-
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  145 +++
> > >  arch/arm64/configs/defconfig                  |    1 +
> > >  drivers/gpu/drm/bridge/imx/Kconfig            |   18 +
> > >  drivers/gpu/drm/bridge/imx/Makefile           |    2 +
> > >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |  207 ++++
> > >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  154 +++
> > >  drivers/phy/freescale/Kconfig                 |    6 +
> > >  drivers/phy/freescale/Makefile                |    1 +
> > >  drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1075 +++++++++++++++++
> > >  drivers/pmdomain/imx/imx8mp-blk-ctrl.c        |   10 +-
> > >  14 files changed, 1876 insertions(+), 13 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
> > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> > >  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > >  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> 
> -- 
> Regards,
> 
> Laurent Pinchart
