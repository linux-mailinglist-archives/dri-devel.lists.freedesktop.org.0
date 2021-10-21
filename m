Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A390435DE7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CF66EA14;
	Thu, 21 Oct 2021 09:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDE26E425
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:27:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r7so553537wrc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 02:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZYjp3Dh8hYAEBhaoFo5fj7lc6MgCHR723xl76CUYQw=;
 b=53f8z8rb58oZUqdOszfjJfIxosmnNwBcT1tAWZBniM9HagD5l5e0NJ8M5Oi4LwEmaE
 0pmfn0sSI9zhlBuDjCHI6LvDeNF8e4YQrNVKDeRJ03VQ+xkOANXibCao2miiaaAtVERk
 WHM3i67jMrN0iEMwhYdibUilq9GW9ZGmpLseHf/SX9T+xLW1iLih8aBd/HiETzTFrDCn
 O2bZTFE1SVtseOO1JGcYp3AqMs2T5lc2ft6QIVD+IvTuNCd0LvWem6Xv+Aw7eIXVZjS+
 QYLM3b93FYUKaMpAk1YI1I0dmzD0xOnzREXZnU1uL1p8LLzuyScie0IEUZR47dGFS1U9
 ToMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DZYjp3Dh8hYAEBhaoFo5fj7lc6MgCHR723xl76CUYQw=;
 b=NwOFPp7xNE6vowYXnp0OnpXeVm7Z6X1Vag3XgFNFxSaDMS5/NyRz6EEWgpQAtisIUN
 mSKDsAQG01qsE+3PHJ3qQM3Gt0q3exbq7qDuEE7AXZLaePIb9cTw9X/9Z51BFjLA2O/u
 Zerj7O77cBg88QKEdYIp4s9iHW+RwBvm1NtKTw9ZsBTkI6VlRa1NRzhzV4LrmaK9i04/
 b2nqFFv0/ZFmBNrYZqrH/saT2qD/BdSCSJXk7v04K4bAksebGXh+7pNHTv+skccA3UlF
 pngUleyHEv4yRJPnK/PM29G09vZSdxtdvomdT+j5KCvZywPHW9p49a5ENURzwRMcnf0e
 QQnw==
X-Gm-Message-State: AOAM533uSTcK7biAMVaApzcwBdCfz0W1q5C0cX0+D4tc32XTtZEjYZbM
 BT9DqkdUpO9Syk6zvegANIRlcw==
X-Google-Smtp-Source: ABdhPJxKwvQe1h4U5lHSzGW5G0U7Y6O6CUrkRgxaTKQUauPRqxI+Wryg0o4Rsh3TqDUBSnokeRxL1Q==
X-Received: by 2002:adf:f305:: with SMTP id i5mr5850502wro.155.1634808445339; 
 Thu, 21 Oct 2021 02:27:25 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id d3sm4538468wrb.36.2021.10.21.02.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 02:27:25 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v5 0/7] drm/mediatek: Add mt8195 DisplayPort driver
Date: Thu, 21 Oct 2021 11:27:00 +0200
Message-Id: <20211021092707.3562523-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

this series is built around the DisplayPort driver. The dpi/dpintf
driver and the added helper functions are required for the DisplayPort
driver to work.

In v5 I reworked the mtk-dpi so that dpintf is only using the same three clocks
as dpi does. This lead to the removal of the separate dpintf binding document.
Also there are minor updates to the mtk-dp binding and driver.

The series is based on v5.15-rc1 but also applies cleanly on linux-next.
Note: This patch series is currently tested on v5.10 and I am still
working on testing it on v5.15.

Thanks in advance for any feedback and comments.

Best,
Markus


Functional dependencies are:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210921155218.10387-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20211004062140.29803-1-nancy.lin@mediatek.com/

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
v2  - https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
v3  - https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
v4  - https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/


Markus Schneider-Pargmann (7):
  dt-bindings: mediatek,dpi: Add DP_INTF compatible
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   87 +
 .../display/mediatek/mediatek,dpi.yaml        |   11 +-
 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2813 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  535 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  199 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  219 ++
 drivers/video/hdmi.c                          |   83 +-
 include/drm/drm_dp_helper.h                   |    2 +
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    2 +
 22 files changed, 4019 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.33.0

