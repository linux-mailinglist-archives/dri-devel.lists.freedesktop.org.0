Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936688B319
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268C510EB0E;
	Mon, 25 Mar 2024 21:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="irUFmlpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD8710EB0E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:49:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso5987098a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711403340; x=1712008140; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qUM4vmKmjA1gYO0tbm7KTA4LmIiK39ngypqIHIOvMUY=;
 b=irUFmlpcodY1b0tGmn2X3GPidBwyel3JrtXBQpUsWb9Hd84rWrTbBik4vmxn9Dc78p
 tmU3ihz7r+5QGAZLG/Twn9zuIWE7M/w7HLwdO78KMdius9N/kMyPaFQrM9cR2i66VSch
 yRrNijWD9Bp9I8RORkS1NXSLTwYwRYeYBPOHpl+8j+/GJjeQgXjzq0lxwDBr25OLXzua
 3Qs4ZyLOXMjpZ1wdJ9faBqxtujR8swJ+jIG9dZB4u2/yxcDYK47dpOT4nV+UeXsz5/0G
 JL1cymEYr/kslaHI28eUwZQo+rf0CcU2rwX0hGhqRJG3xsPpZ6n4969EFurGr1sUB0g4
 Ds2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711403340; x=1712008140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUM4vmKmjA1gYO0tbm7KTA4LmIiK39ngypqIHIOvMUY=;
 b=EIJhcxDTnO59h5hvhBrV7l2Zn6LxlsSUiezN/ygux/JEs8PP+pGDq2BNShaPqMc/0p
 3y9FAlxnf8+JMfPYAf2jMmKHVVjskrPyF/0UVGfrkaHiHIp4vGHQLmBXAx12B1dA2GCi
 SQORWnBTxPP4viIlpekpG3Z5uvdJ0DcRhNVLBzpedwQBIQr0fQcugaoyI5XTN9jnDMB1
 zz6ZyLJdqd6BpqZBHOcW6lD713b7w5tLJbyb0A0qytKj7QbDTRVZEweX36HP/gH2pWzH
 t48WrAfCshCVbyj7LPd+xZdbXizdXdsHTFrUsXXqr3AtyKnd9jNmd82sRNLJJnDEDsNa
 RUaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVScEQFsi110KrrCCoXejtZIhKMAE0Qh1/8BClznFfbmyX6OWWby1nf3WkeDkSOi7qZC3HNQNpczzSV4un2tGhh4drXBi715SovOD+SFE38
X-Gm-Message-State: AOJu0YyueA6lQcYwoe3nLXhIUUJ9h60EbId8OtI8G/GszbzGf0036ef/
 A8II02vmt8+UMS1+RNfOMAKTsN9mBxfXHNHhJ2n4LYlX1ljP8BHM
X-Google-Smtp-Source: AGHT+IGqzF3fHuQAIWMVhReRKPOloiG3GIJOv/fRY7SrojJhBUXyuiPBtXLwZklMVo7FZ83sKnItLQ==
X-Received: by 2002:a50:d685:0:b0:56b:83ff:e044 with SMTP id
 r5-20020a50d685000000b0056b83ffe044mr5778673edi.1.1711403340182; 
 Mon, 25 Mar 2024 14:49:00 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation
 (net-188-217-49-82.cust.vodafonedsl.it. [188.217.49.82])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a056402100d00b00568abb329a3sm3403484edu.88.2024.03.25.14.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 14:48:59 -0700 (PDT)
Date: Mon, 25 Mar 2024 22:48:56 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Message-ID: <ZgHxSHDAt7ytqDC1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240203165307.7806-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
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

Hi Adam, Lucas,
Thanks for this series.

This series make HDMI work on evk.
All is working properly on my side.

Tested on: Linux imx8mp-lpddr4-evk 6.9.0-rc1.
Hope this help.

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso

On Sat, Feb 03, 2024 at 10:52:40AM -0600, Adam Ford wrote:
> The i.MX8M Plus has an HDMI controller, but it depends on two
> other systems, the Parallel Video Interface (PVI) and the
> HDMI PHY from Samsung. The LCDIF controller generates the display
> and routes it to the PVI which converts passes the parallel video
> to the HDMI bridge.  The HDMI system has a corresponding power
> domain controller whose driver was partially written, but the
> device tree for it was never applied, so some changes to the
> power domain should be harmless because they've not really been
> used yet.
> 
> This series is adapted from multiple series from Lucas Stach with
> edits and suggestions from feedback from various series, but it
> since it's difficult to use and test them independently,
> I merged them into on unified series.  The version history is a
> bit ambiguous since different components were submitted at different
> times and had different amount of retries.  In an effort to merge them
> I used the highest version attempt.
> 
> Adam Ford (3):
>   dt-bindings: soc: imx: add missing clock and power-domains to
>     imx8mp-hdmi-blk-ctrl
>   pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc clock to hdmimix
>     domain
>   arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
> 
> Lucas Stach (9):
>   dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
>   phy: freescale: add Samsung HDMI PHY
>   arm64: dts: imx8mp: add HDMI power-domains
>   arm64: dts: imx8mp: add HDMI irqsteer
>   dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
>   drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
>   dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
>   drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI
>   arm64: dts: imx8mp: add HDMI display pipeline
> 
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  102 ++
>  .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   84 ++
>  .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
>  .../soc/imx/fsl,imx8mp-hdmi-blk-ctrl.yaml     |   22 +-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  145 +++
>  arch/arm64/configs/defconfig                  |    1 +
>  drivers/gpu/drm/bridge/imx/Kconfig            |   18 +
>  drivers/gpu/drm/bridge/imx/Makefile           |    2 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |  207 ++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  154 +++
>  drivers/phy/freescale/Kconfig                 |    6 +
>  drivers/phy/freescale/Makefile                |    1 +
>  drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1075 +++++++++++++++++
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c        |   10 +-
>  14 files changed, 1876 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> 
> -- 
> 2.43.0
> 
> 
