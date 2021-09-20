Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2741112F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3516E442;
	Mon, 20 Sep 2021 08:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC716E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:44:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w17so19294135wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP5QWfzsaU49KYqjn5I4kDilzjyCt1o6LBhMWE6h2zk=;
 b=tvBzZUBhhKM/V5Mc+zPF0GHJsAG5N/a4OsO26F2ZWBq2hUWcFwZG2Ja9LCRN4W5cN/
 2JCxGyBp1kopW+zQXAkJYZvHUumN5ZrwuNmbjSXtwh0DCymLFu9Ud0zDcmHN87UbGHfg
 6PUBTjToIUeQk3YECQIfjaW/RhgmDu78BntPkfMvSG4qAYQxDk/5cSRZ0cPNuAcjdLUW
 9TVpEykGJAeQF2TiNwQya1rkoglgQUKzfeUB29rzoasji8k5JAF1NUUAyfL8e5MTz5Ob
 csVDJGFTAnaKg4TPgXAdrVU4I3a3Pm/NOiWUb1oJ36PN8EivcmX9gpXXvD+wBHXWzLIz
 Rumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP5QWfzsaU49KYqjn5I4kDilzjyCt1o6LBhMWE6h2zk=;
 b=V9w0gGViZ76MsTW3r2yff+QWM+H4xlkZv61dAUiCsP1XuaMrIqzOER71kaAj274TyS
 RnPPee6givUFkl/gnfcKKpy/DDJz5Xy8Ouyu+Ns4ipU9DBdkSPX3uamWUSZpGrCw9szM
 MRLuQlEVSYxBf9+ukBMuxKdQt+NhV2UuZf788wYOe4/NwrVerWAN8taXrsnHb3HTqKJm
 sY6XMyDRXo3PmTDJhGHH9bSGPUI53hfxGtqn36eidC5LZFDQYygKrdwZGs+blToFSHrD
 Tm0uqespN2Bs4pAoELtQ91ArMmieYTmYCi140HkcxWIsbnL1WybEmAkRz83Cs37YjLEM
 QFNA==
X-Gm-Message-State: AOAM532+66B99lCrl57XGsJnyyTHt1ZTTNR7B4rOGDSRrvJuoNqiklyv
 f8tuXYGt4xETHpS8eRffM6vQDg==
X-Google-Smtp-Source: ABdhPJxiKMhEJInOM2ibVykhU8PPCOv7Ymx0xv/l9nNsd52khYEKtv2XNA5e8Cmba26ySupkVMI3mw==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr27021202wrr.98.1632127472956; 
 Mon, 20 Sep 2021 01:44:32 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w1sm18433911wmc.19.2021.09.20.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:44:32 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 0/6] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 20 Sep 2021 10:44:18 +0200
Message-Id: <20210920084424.231825-1-msp@baylibre.com>
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

this series is built around the DisplayPort driver. The dpi/dpintf driver and
the added helper functions are required for the DisplayPort driver to work.

For v2 I rebased the series on top of v5.15-rc1. There still is a functional
dependency on many different patches pulled in through the main two
dependencies, vdosys0 and vdosys1, but I wasn't able to get a clean base with
these patches yet so to continue improving this series in the meantime, I
decided to go with v5.15-rc1 as a base. The main potential merge-conflict
points of this series with other series are mtk_drm_drv.c and
mtk_drm_ddp_comp.* etc. which should be easy to resolve later on.

Note: This patch series is currently tested on v5.10 and I am still working on
testing it on v5.15.

Dependencies:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Older revisions:
RFC - https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
v1  - https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/

Thanks in advance for any feedback and comments.

Best,
Markus


Markus Schneider-Pargmann (6):
  dt-bindings: mediatek,dpintf: Add DP_INTF binding
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpintf.yaml     |   78 +
 drivers/gpu/drm/drm_edid.c                    |   74 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2855 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  498 +++
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
 21 files changed, 4140 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

-- 
2.33.0

