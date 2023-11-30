Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42727FF17C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 15:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A0510E701;
	Thu, 30 Nov 2023 14:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4C010E701
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 14:17:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a18b478e4e9so88820966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 06:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701353833; x=1701958633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ESC3Z8t3GSKVJF84FzlAhVLsYO0WyF4hoPNvK+j5Hbs=;
 b=IupD7JHG50tWYX+W5yIad35JMtsqk0UMvO7mK/ETuxWjia94Kd6ZhrOk3AK+q26DQW
 LggNcJPz+4jzGiGRvpDTqyGpvBbnPbsxiWv/OMn3UnzuMnmh8NRSLb0R1qO5hkk8HbJT
 r1egcYMhpe9qORjqVC4hGPtbOcU1jBv0G/U98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701353833; x=1701958633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESC3Z8t3GSKVJF84FzlAhVLsYO0WyF4hoPNvK+j5Hbs=;
 b=rwJyNAXN9CZhUrXFsQxPhA+c0cnoVMjFX1jUSdWqcElIKjLLWvfY9FVCSyscuvFyBo
 T/KEeefH7OdzrMDkahPgCNBUj19e9IMtIRfFeR0JcJDhC/LfuvUyxhQ65AxcHH499lRq
 hxwBsfuQb+wn+1spbTl7HFxUPX+WJIcDiVruXXYuYwZX5KV6Kd2xg1NQgVnwRfJFoK2O
 SLi0bGCvF2Ev7HtKb/BURIRwRSzAMijVLzwlUWBuylfMFgrjdVP/UwmA1gZlVvxDReIY
 XK4/TpdlzYz+ATQiIuY395kLZXPN2OJ9gw74tnKWhv8xhUSizNWqidR80v8mUjJHtjg3
 sk7w==
X-Gm-Message-State: AOJu0Yy2wwdXwjMQgaY7RDffcQElShzILNlxdwckQykgvP0dS+FL0iVg
 //sH0HYCOMr+22trq9kiXwA8IA==
X-Google-Smtp-Source: AGHT+IFkAH2FcOD1Q0ahrwsncvN97nn7yoMftNwfM5We6w66ngAQcE4j0ZdqU7sIKPny9KSQaNePww==
X-Received: by 2002:a17:906:20de:b0:a01:811c:ce9 with SMTP id
 c30-20020a17090620de00b00a01811c0ce9mr18312430ejc.0.1701353833265; 
 Thu, 30 Nov 2023 06:17:13 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 my18-20020a1709065a5200b009f28db2b702sm716064ejc.209.2023.11.30.06.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:17:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] Add displays support for bsh-smm-s2/pro boards
Date: Thu, 30 Nov 2023 15:16:17 +0100
Message-ID: <20231130141705.1796672-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski.
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Drop power-supply
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
 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 121 +++++
 drivers/gpu/drm/bridge/samsung-dsim.c         |  14 +-
 drivers/gpu/drm/drm_bridge.c                  |   9 +-
 drivers/gpu/drm/panel/Kconfig                 |  18 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c  | 418 ++++++++++++++++++
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 375 ++++++++++++++++
 11 files changed, 1086 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c

-- 
2.43.0

