Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AB481140C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58A710E2A6;
	Wed, 13 Dec 2023 14:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247A410E2A2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:04:48 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1ceae92ab6so926211466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702476286; x=1703081086;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxEUP7qYPBcDPYzsksTnnlAXJNNegc2JSrRO3JNlQY4=;
 b=kRqIpV9FPouJWkTvKOEHrlqH7/2xf8+oNHSt53hIPAJk1M2Y9TdGpGMWZiMOfMXTxt
 YuKaanMWsPFtEthC1icum9xP+wa/o3HkSvenhegf7EwUAqQ0yE+CQWqtIS4mPC23hs9O
 BhaBvfEB0Y2JTHJ7LmwXk9Y9d8YkVqsgQOYA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702476286; x=1703081086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxEUP7qYPBcDPYzsksTnnlAXJNNegc2JSrRO3JNlQY4=;
 b=g5k6AFtcTi8XrgBDGNsymbxdIw+FAK1T9AqpBEYp1YMK3m3CT3/RGwe/on0rESssjt
 NQDnzyxHOJzXYdugV7aSksXsnejmY40Me0nZT/87dWBpoDEXNS5VEA47GxQtD7ZgIduW
 /Y2G8/AZ8mXpHZhX9hdFHQxIzTvkY72Z7M9hu4Qb1yjQmnYncHP7Sh5LsO6Ul4I48JPU
 aC8gM2lVa4RvFHQo2yzU6pGgA/W09BqAvFPKlNzwpyw74YJiXfFIRL2SHT3RCllfmofe
 DDW01omZGjV0zKtfxs0kITduHOET0vRarci+coPXIijZRnHCej5nwsXrLASji4aO0P2n
 FISA==
X-Gm-Message-State: AOJu0YxVTSMd01dYHAhmZ+h5GQuWlQ0wJ54QbJEschPxQutLTyv19GMX
 N7xd+O+FT4CRNg8sGMA46eAMXQ==
X-Google-Smtp-Source: AGHT+IEhnj9Dk+3Iy7miMJdrLcUIRMNmcjW058SMV2W+UJd5eQMjPJjB0agCJO0xZSSdrYvij6DwUg==
X-Received: by 2002:a17:906:2098:b0:a1c:654a:1c0e with SMTP id
 24-20020a170906209800b00a1c654a1c0emr4061606ejq.21.1702476286492; 
 Wed, 13 Dec 2023 06:04:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 sf22-20020a1709078a9600b00a1ca020cdfasm7797635ejc.161.2023.12.13.06.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 06:04:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] Add displays support for bsh-smm-s2/pro boards
Date: Wed, 13 Dec 2023 15:03:41 +0100
Message-ID: <20231213140437.2769508-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds drivers for the displays used by bsh-smm-s2/pro boards.
This required applying some patches to the samsung-dsim driver.

Changes in v6:
- Drop patches:
  - [06/10] drm/panel: Add Synaptics R63353 panel driver
  - [07/10] dt-bindings: display: panel: Add Ilitek ili9805 panel controller
  - [08/10] drm/panel: Add Ilitek ILI9805 panel driver
  - [09/10] drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel
  Because applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  Drop patches:
  - [01/10] drm/bridge: Fix bridge disable logic
  - [02/10] drm/bridge: Fix a use case in the bridge disable logic
  Because they are wrong

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski.
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Squash patch [09/11] dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  into [07/11] dt-bindings: display: panel: Add Ilitek ili9805 panel controller.

Changes in v2:
- Add $ref to panel-common.yaml
- Drop port, reset-gpios, and backlight
- Set port and backlight ad required
- Replace additionalProperties with unevaluatedProperties
- Adjust the mipi_dsi node based on the latest patches merged into
  the mainline in the dtsi files it includes.
- Added to the series the following patches:
  - 0001 drm/bridge: Fix bridge disable logic
  - 0002 drm/bridge: Fix a use case in the bridge disable logic
  - 0003 samsung-dsim: enter display mode in the enable() callback
  - 0004 drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Dario Binacchi (2):
  drm: bridge: samsung-dsim: enter display mode in the enable() callback
  drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Michael Trimarchi (2):
  dt-bindings: display: panel: Add synaptics r63353 panel controller
  arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup

 .../display/panel/synaptics,r63353.yaml       |  61 +++++++++
 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   |   1 +
 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 121 ++++++++++++++++++
 drivers/gpu/drm/bridge/samsung-dsim.c         |  14 +-
 4 files changed, 194 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi

-- 
2.43.0

