Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B6A5BD2CD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 18:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5700D10E073;
	Mon, 19 Sep 2022 16:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1375510E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 16:59:44 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z97so112400ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date;
 bh=9tro2oCAbN+mbj/HKR3A46hDRnbE6tXzNt27JGPID68=;
 b=3+jXsVMUL/Ek+ltKfy4Qawu/Pw7TG6cilfl66vkc4y+DYBPaYgtZv1p4BbwPzksphk
 JrvJcC2YSX1q79FG93ETJekmw3tJYHSmTkJzTSb9haW1ufGrB6/zpIKUw2WjPXDUqkty
 mytztxw4ljT+7oFObNfw355aMnszO8HFBpZ06YiwMdxjiDP9KYGIJo+btpD+n24uVcMk
 654kSXHO0di8SuPyIdU5b6g6AIBFMvuWA6WGjnZovZIIxTWOcDIRY2tP9+ZCvUX6Drj5
 kun5QOWjkofHQj2/Ac6bkvQF3GxuIg8j9PewpKjOsGLg2CFIL7eItD4m+dvfX5hVs93D
 uP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date;
 bh=9tro2oCAbN+mbj/HKR3A46hDRnbE6tXzNt27JGPID68=;
 b=vjGHl+kRkh1sBanMIFOSTYwstbTMYdI5XedRhaRygFnU0qsnorWipOs/wQvLuHQMRl
 5RaO2gIUCZJBbrn2TQXgMopV71oSZWmwDmC8Ei8eqQoSP6US7+cjF+YaJyREZ0Hs5yO+
 IAhzsQib7JDg3UWJihxM9eGUn6LSfP3u3VPdV6VJSuIv1zehZM4cehCBccdjCr/yzisY
 Cy14gCt5R7+6/aR4e+WbO1SF+h5Qv7wd9i0cLhNnWytRWd53VMjZuwwidGl6E71hwxdV
 yD0lfTE+A7LJ/ClnrysYEw26S0mR7bUiwo5w6ZA5MHYQ3MgnqncXffq7XPrIqT6lWNCz
 5reA==
X-Gm-Message-State: ACrzQf2nDotqClIUvcrn5v6GcadXRDqsgXwGSLjG1f0jhaVEqh+x7rPM
 NLLXitX8LQRlUKZCIVhjTMRROw==
X-Google-Smtp-Source: AMsMyM6iRL5JBprCZvHk9dT8PMtpt98i7hlA72vdPks7s4qBaJDnnZvv+4dOv8WBquTaxJ2hX5EXvQ==
X-Received: by 2002:aa7:c448:0:b0:44f:c01:2fdb with SMTP id
 n8-20020aa7c448000000b0044f0c012fdbmr15838234edr.88.1663606782531; 
 Mon, 19 Sep 2022 09:59:42 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:59:42 -0700 (PDT)
Subject: [PATCH v1 00/17] Add MT8195 HDMI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAB6fKGMC/w3KSwqAIBAA0KvIrBPUnV0m/Aw5pAZOtRHv3iwfvAmMg5BhVxMGfsR0d4HdFKQS+o
 mashiccc5463XJjY72XCAjBkYdR+ipyOlvrWv9dLIU6FIAAAA=
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:55:58 +0200
Message-Id: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for HDMI Tx on MT8195.

This includes a split of the current "legacy" hdmi driver into a common
library of functions and a two dedicated compilation units with specific
code for mt8167 and another for the "new" mt8195 SoC.

Support for the new mt8195 hdmi phy and the dpi/drm_drv adjustements to
support hdmi.

Based on next-20220919

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

---
Guillaume Ranquet (15):
      dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
      dt-bindings: display: mediatek: add MT8195 hdmi bindings
      drm/mediatek: hdmi: use a syscon/regmap instead of iomem
      dt-bindings: mediatek: set the hdmi to be compatible with syscon
      drm/mediatek: extract common functions from the mtk hdmi driver
      drm/mediatek: hdmi: add cec flag
      drm/mediatek: hdmi: add connector flag
      drm/mediatek: hdmi: add frame_colorimetry flag
      drm/mediatek: hdmi: add mt8195 support
      drm/mediatek: hdmi: mt8195: add audio support
      phy: phy-mtk-hdmi: Add generic phy configure callback
      phy: mediatek: add support for phy-mtk-hdmi-mt8195
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8195
      drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
      drm/mediatek: Add mt8195-dpi support to drm_drv

Pablo Sun (2):
      dt-bindings: clk: mediatek: Add MT8195 DPI clocks
      clk: mediatek: add VDOSYS1 clock

 .../bindings/display/mediatek/mediatek,dpi.yaml    |    1 +
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |   91 +-
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |   45 +
 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |    1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |    2 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c             |   11 +
 drivers/gpu/drm/mediatek/Makefile                  |    5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  143 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |    5 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    2 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  647 +-------
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |   16 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  477 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |  225 +++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c         | 1602 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h         |   31 +
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c     |  539 +++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h    |  329 ++++
 drivers/phy/mediatek/Makefile                      |    1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         |  673 ++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         |  204 +++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |   15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |    2 +
 include/dt-bindings/clock/mt8195-clk.h             |    4 +-
 24 files changed, 4429 insertions(+), 642 deletions(-)
---
base-commit: ec65813678c97a05766d29f1ec40bdf1b30bc3d6
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>
