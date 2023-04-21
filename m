Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FE6EB9BA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1770210E353;
	Sat, 22 Apr 2023 14:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BAF89CC1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:43:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso7967535e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682091807; x=1684683807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sMEnXGj3u+SXU62VeCg+ELIQZXSDTJJuwOrlP/w5GEs=;
 b=bdUvv3JfOrVw/zILmIes6bmwuMa+wnr3MHyk5xmXizhrYrELmhf88wjSE2cmqquS3a
 fWkYFNsTAITXrjT18M9bgM1Dh+1PDe5JLBYYdc01bsQz4Ic1bTUPxA2yME+bnBil0/zO
 vKvbP/OAgkv4PS4aibBMZF8S757anBEQEaIrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682091807; x=1684683807;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMEnXGj3u+SXU62VeCg+ELIQZXSDTJJuwOrlP/w5GEs=;
 b=jZlamH6lB0aYnW8qOx5ukBBXaMlOhw3+Ig67hPHfHBW4LJng8CLFCx5Tz2lQuBCDQy
 WRTKo0A2KFTBJch/5+CmTHH5gnHbLgQkmGwOWYGejkA/BQqwpjx7q8I2N1xf4klDFKTY
 PQRpFB0VT+EkKfZWcl7B7sLrXPjFTPh0V2W2qbxMTv6hp/snx4i/AF9fc24/rbFk1lLs
 6b2M3dsm8aKR2KgiqYwYk/1gHEEGpK9fw/iuyZCv3elH7K5VrpAQaFgdShsxUDb/Xk4u
 BHCh7zU8JwdsNEMRFq41r+NWAyaY/Jhj+2GnRdtppKYFikH5EIUMUpapKPYtkNKlnVOC
 KALA==
X-Gm-Message-State: AAQBX9dbG96hb01W6tsWT7EOR2MypQcUu+r/lWIjg/JEJXTO4lcanOMi
 cmvLPJeD8+x/Y4Ot7ZuBydbi5Q==
X-Google-Smtp-Source: AKy350YnSQtq123y2pQ09gEzQfB5N3RkWCbeSE+y7DhwsFraKIM8xPzW/lvSXmN6tH+XvnykN9Qt2w==
X-Received: by 2002:a7b:cb47:0:b0:3f0:967e:2cfb with SMTP id
 v7-20020a7bcb47000000b003f0967e2cfbmr2410174wmj.36.1682091807382; 
 Fri, 21 Apr 2023 08:43:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.127.129])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b002e51195a3e2sm4651609wrw.79.2023.04.21.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:43:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] add displays support for bsh-smm-s2/pro boards
Date: Fri, 21 Apr 2023 17:43:01 +0200
Message-Id: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 michael@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds drivers for the displays used by bsh-smm-s2/pro boards.
It has been tested applying it on top of these patches:

Adam Ford <aford173@gmail.com> (6)
  arm64: dts: imx8mn: Add display peripherals
  drm: bridge: samsung-dsim: Dynamically configure DPHY timing
  drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
  drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
  drm: bridge: samsung-dsim: Support non-burst mode
  drm: bridge: samsung-dsim: Support multi-lane calculations

Series "drm: Add Samsung MIPI DSIM bridge" (https://lwn.net/Articles/925754/)
Marek Vasut <marex@denx.de> (1):
0adce1be8dc0 drm: bridge: samsung-dsim: Add i.MX8M Plus support

Jagan Teki <jagan@amarulasolutions.com> (9):
0a98655a08cc dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
b25b5384e27d drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
ee83295c036d dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
f18605b9b682 drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
8ab12dbce060 drm: exynos: dsi: Add host helper for te_irq_handler
c37c8e89af38 drm: exynos: dsi: Consolidate component and bridge
11276ea9964a drm: exynos: dsi: Add atomic_get_input_bus_fmts
2fe8a5f92c08 drm: exynos: dsi: Add input_bus_flags
5d79cf173994 drm: exynos: dsi: Add atomic check

Marek Szyprowski <m.szyprowski@samsung.com> (1):
b9ad1112014d drm: exynos: dsi: Handle proper host initialization

Jagan Teki <jagan@amarulasolutions.com> (5):
93b2ce0c329d drm: exynos: dsi: Introduce hw_type platform data
83d704dc0cf6 drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
f25b304ea948 drm: exynos: dsi: Mark PHY as optional
6c59da2ae519 drm: exynos: dsi: Lookup OF-graph or Child node devices
2186e15100de drm: exynos: dsi: Drop explicit call to bridge detach



Michael Trimarchi (7):
  dt-bindings: display: panel: Add synaptics r63353 panel controller
  drm/panel: Add Synaptics R63353 panel driver
  arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup
  dt-bindings: display: panel: Add Ilitek ili9805 panel controller
  drm/panel: Add Ilitek ILI9805 panel driver
  dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel

 .../display/panel/ilitek,ili9805.yaml         |  61 +++
 .../display/panel/synaptics,r63353.yaml       |  58 +++
 MAINTAINERS                                   |  12 +
 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   |   1 +
 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 111 +++++
 drivers/gpu/drm/panel/Kconfig                 |  16 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c  | 418 ++++++++++++++++++
 .../gpu/drm/panel/panel-synaptics-r63353.c    | 376 ++++++++++++++++
 9 files changed, 1055 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 create mode 100644 drivers/gpu/drm/panel/panel-synaptics-r63353.c

-- 
2.32.0

