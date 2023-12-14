Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EDC812A49
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 09:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800FF10E190;
	Thu, 14 Dec 2023 08:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CCF10E165
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:25:13 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so10619678a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 00:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702542311; x=1703147111;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=raZdHuIfZmo8sVIIlB+4E73joCIULjSMqNEVVCKbeTQ=;
 b=TmDEfa5aAbfEAwyXRyJ6V3M2EgoUCxglZVh+1fB7yiy9cVgXfTiYQZCLcX5Cswo0rd
 +0KVG1S3dJlGobfyXAg2SwXWJFHQjU/HEiWfKfc8sWaY3CubCtYR3SEE1VFqi0c37lN2
 2jJBpN8ch5A9r8IZssQCzs1jqg7gC6bAuZciY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702542311; x=1703147111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raZdHuIfZmo8sVIIlB+4E73joCIULjSMqNEVVCKbeTQ=;
 b=QU/u5mHRBb+1NtZE47ugAXEfaBiSKmuIIr+aMSHRZ3rDQBM7s/G8lIi1ah4mpXTqvP
 5ZSJqeJ5jK60F+pd7lJf0zqJDhtoVx/I8UO5j6vnjro79zbSeB9ke42W7lpJ195By0st
 aipp+a9MVqYILhCgF2McWMQc26ofiS5bu7ykl1ySR0XSnA76b14+UAv8/6Tf6bCG4/u6
 jL/MyG28I8tyyhvyu6xWew322WV7Y/44HVao79ob0eLCgD8PHGr+d+yk6XyJffHlxPkZ
 zOqRrTJ+wViDaaz60Dt7AkfGRHa9REdGAaH1vxwCFGfuvcgruXU7qR2x+5AO4B2MYO7K
 LRCA==
X-Gm-Message-State: AOJu0Yx0jXnZNUUKmH4uFFOLRDTtCL9dxJhYZg48zgevBRDzxWdTQC5q
 O/6HDIiusQDruYjhscmBWsOfZw==
X-Google-Smtp-Source: AGHT+IEwqtoPH8cpgAfOky/qjhC4w5wCINRYQZuRUrWf8QH/ByS+0CimBtppfQ28CarPOGrM03rX3Q==
X-Received: by 2002:a17:906:3417:b0:a19:a19b:423a with SMTP id
 c23-20020a170906341700b00a19a19b423amr3145666ejb.165.1702542311617; 
 Thu, 14 Dec 2023 00:25:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 hw18-20020a170907a0d200b00a1cbe52300csm9026226ejc.56.2023.12.14.00.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 00:25:11 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] Add displays support for bsh-smm-s2/pro boards
Date: Thu, 14 Dec 2023 09:24:03 +0100
Message-ID: <20231214082457.18737-1-dario.binacchi@amarulasolutions.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 michael@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds drivers for the displays used by bsh-smm-s2/pro boards.
This required applying some patches to the samsung-dsim driver and the
drm_bridge.c module.

Changes in v8:
- Move the 'status' property to the end of the list of nodes:
  - pwm1
  - lcdif
  - mipi_dsi
- Add a newline between properties and child node (mipi_dsi_out).
- Sort the iomuxc node alphabetically
- Rename pwm1grp to blgrp

Changes in v7:
- Drop [3/4] dt-bindings: display: panel: Add synaptics r63353 panel controller
  because applied.

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
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Squash patch [09/11] dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  into [07/11] dt-bindings: display: panel: Add Ilitek ili9805 panel controller.

Changes in v2:
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

Michael Trimarchi (1):
  arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   |   1 +
 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 121 ++++++++++++++++++
 drivers/gpu/drm/bridge/samsung-dsim.c         |  14 +-
 3 files changed, 133 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi

-- 
2.43.0

