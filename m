Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8AD808A1B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1AB10E8C9;
	Thu,  7 Dec 2023 14:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434410E8CA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:17:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so124797766b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701958648; x=1702563448;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mF9zOE4ExgVr9gQbxX7r7tJN+TXsbkHqJB5gcZ6w0c8=;
 b=W7Qbzhja8vop+myjT7SP9P28VZmr96bq/rwv758ZuSEON+aMtwuF9icnviGJve435T
 v5gqjDorVgtaBZxBdecjzCMGhIFtXyiXtaNd5arlarZzuexjZGPTEDIJa4wObb1XLjmJ
 7BNwsCzvk+uIsuOnHR/FFy1Q1tciXlnBLjHD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701958648; x=1702563448;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mF9zOE4ExgVr9gQbxX7r7tJN+TXsbkHqJB5gcZ6w0c8=;
 b=cUokBKqPPFcpp8vfudxI82B6+b1G9ocMmJBF5Hkgl7MZCmDSHaZGQLswW9e9eAl2CR
 nJjfX/+hm5xUookB6+zajadqUtkiPsHs1nALuTi7dvH4K07VD2Kcmzg6A0O44nNvzgCZ
 9mcLQGA820Un2gMG38ksvJucKib3r8c2hy6gzuFfiDcWuImSRJg877uJmASnXpGIXpl2
 N3apYlqKhVFAOyoXzqCYZqrsEUmasf3WHW5lMEnmB4fkeXAi3YbCh8OacwhEWUVb+Poz
 MAWcx2n3NytZkTQUeSO0Ib8+n0WjSsVHZ0qs1k+rSVu0fiI3lKpwxsqwF/aIW+9DTkvk
 o1PA==
X-Gm-Message-State: AOJu0YxE178em/DpqkK0g2Y1YyC4bjk6Dppl48VJOCbGVgiJxBpPgEFf
 iML7AKZ0BLCsrkOTKDsg9Lavog==
X-Google-Smtp-Source: AGHT+IHol+ZevJoFf28hi8eUKxIiSNgtRFFCa/GbsGQny6bOEW6yOyjkTXz3Q9kNLO3rSY+QhvtvKg==
X-Received: by 2002:a17:906:408b:b0:a19:a19b:c72f with SMTP id
 u11-20020a170906408b00b00a19a19bc72fmr1394903ejj.127.1701958647742; 
 Thu, 07 Dec 2023 06:17:27 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9bf:959c:3c66:46c2])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906c09800b00a1e814b7155sm885421ejz.62.2023.12.07.06.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:17:27 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/10] Add displays support for bsh-smm-s2/pro boards
Date: Thu,  7 Dec 2023 15:16:29 +0100
Message-ID: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds drivers for the displays used by bsh-smm-s2/pro boards.
This required applying some patches to the samsung-dsim driver and the
drm_bridge.c module.

Changes in v5:
- Replace a 'return ret' with a 'goto fail' in the r63353_panel_activate()
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v4:
- Set the reset gpio to low in a single operation
- Remove duplicated code for prepare/unprepare callbacks
- Remove duplicated code for prepare/unprepare callbacks
- Add Reviewed-by tag of Neil Armstrong

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski.
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Drop power-supply
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Squash patch [09/11] dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  into [07/11] dt-bindings: display: panel: Add Ilitek ili9805 panel controller.

Changes in v2:
- Add $ref to panel-common.yaml
- Drop port, reset-gpios, and backlight
- Set port and backlight ad required
- Replace additionalProperties with unevaluatedProperties
- Adjust the timings of the panel reset
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

Dario Binacchi (4):
  drm/bridge: Fix bridge disable logic
  drm/bridge: Fix a use case in the bridge disable logic
  drm: bridge: samsung-dsim: enter display mode in the enable() callback
  drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Michael Trimarchi (6):
  dt-bindings: display: panel: Add synaptics r63353 panel controller
  drm/panel: Add Synaptics R63353 panel driver
  dt-bindings: display: panel: Add Ilitek ili9805 panel controller
  drm/panel: Add Ilitek ILI9805 panel driver
  drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel
  arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup

 .../display/panel/ilitek,ili9805.yaml         |  62 +++
 .../display/panel/synaptics,r63353.yaml       |  61 +++
 MAINTAINERS                                   |  12 +
 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   |   1 +
 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 121 ++++++
 drivers/gpu/drm/bridge/samsung-dsim.c         |  14 +-
 drivers/gpu/drm/drm_bridge.c                  |   9 +-
 drivers/gpu/drm/panel/Kconfig                 |  18 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c  | 406 ++++++++++++++++++
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 363 ++++++++++++++++
 11 files changed, 1062 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c

-- 
2.43.0

