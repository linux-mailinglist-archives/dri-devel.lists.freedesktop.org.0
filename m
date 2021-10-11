Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F04428A1A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 11:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654266E463;
	Mon, 11 Oct 2021 09:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359D76E453
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 09:46:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id o20so54071821wro.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSc57xuE9GFmk4sxP/W9phMrvO3YpoWm1qxIDAy9GJs=;
 b=aLMYJJl2jay10utJpCqgLmwjoJoHF2aWNffZ8CcQdQbjpmToq1xKpzaix08JuBwetA
 n15W8fKyqZhVG3QRv36cWd8qXOPo//x+dDwbY+YzcxYCdcJsOsuFtJgy1hPxgDVfs5Lg
 V0hqggcuQ08di7ZkzkVpudUVokVEYmNKzx0gk0mfEV7PxTFUP4AzPeEUlHyarb1QJnpu
 vV7FeRP0kJ49E8L0rXCaAuc4O2MGCjQqvqB/R1iraABe8wTaMiQW5Rkcqc5Ip1O3Rp2+
 GZeyaaTeyhQFIoZhM/jTR5qfghgQjGLsZoglkhL6NIxAWBfVkGcSfHgWrnXUhriYYgqL
 klbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSc57xuE9GFmk4sxP/W9phMrvO3YpoWm1qxIDAy9GJs=;
 b=A53t04AbuU5CGNDWk6EZT9CywJmfnBaaGNajCkqiN3bxG/ufhLd+dy5zaUYizyvToi
 AfP8XstisaEVQ/KLTMzz3k2Y2vnv8/LgoqNrILVrW8FaE4CUiLuci0g/EEeg4d+CAw9F
 GAqD1CA/4V12LEhqzsz35j4qBDs/J57cXC4bNFoM8LH/tgfw2AdXnWStRLgnSCQHo6lI
 tMYChIVvpGF2D+T38+lfxw/C24U0g4ITsMAZqOD6ra1YsX7t2PUJnq2vI8s0yyCU94wF
 9i//WvLNJ2X4ukA2rw3w/TRjtM1cTnpyw/HxAkqHdLv67iCHuizdQxrVKEf/CYDRgMWt
 ta9g==
X-Gm-Message-State: AOAM533y2pt6olzw8gRCK/BgP/FkjDw8ZrOqf+89i2+YNzgdqLgqojYN
 WetiE6g/0qzOYtEkBW3BvMadJA==
X-Google-Smtp-Source: ABdhPJwkrZ9coXI9B2VtoJT63Rqn0d6J1tuxlDndRciOkM9VYSuyidpeDF3QUBhFQb6wD8MsN7tNdQ==
X-Received: by 2002:a7b:cc0d:: with SMTP id f13mr18750694wmh.85.1633945590291; 
 Mon, 11 Oct 2021 02:46:30 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id o8sm21349291wme.38.2021.10.11.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 02:46:29 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 0/7] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 11 Oct 2021 11:46:17 +0200
Message-Id: <20211011094624.3416029-1-msp@baylibre.com>
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

In v4 I split the phy driver and dp driver into two patches as
requested. Also I added an entry for phy-mtk-dp in MAINTAINERS and made
tiny fixups to the binding files.

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


Markus Schneider-Pargmann (7):
  dt-bindings: mediatek,dpintf: Add DP_INTF binding
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  phy: phy-mtk-dp: Add driver for DP phy
  drm/mediatek: Add mt8195 DisplayPort driver


 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpintf.yaml     |   86 +
 MAINTAINERS                                   |    1 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2825 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  535 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  248 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    6 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    1 +
 drivers/phy/mediatek/Kconfig                  |    8 +
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-dp.c             |  218 ++
 drivers/video/hdmi.c                          |   83 +-
 include/drm/drm_dp_helper.h                   |    2 +
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    7 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |    2 +
 22 files changed, 4156 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.33.0

