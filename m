Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972F40206F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 21:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0F898A7;
	Mon,  6 Sep 2021 19:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AC7898A7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 19:37:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d6so10548211wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OTlNHYsCEcnge+pru6u4BNt1gvCAE0oKZkXh5DZT9jg=;
 b=LMqGvFIvlYO28zkJMzCHV1c/99V9BmmzNoU83XywKFwRtqMTh9MaSLOcl4Cy1j/OBa
 21kXlWSdnCt6GFHNigghuHYwDqU8Qfm6/tLdDpZQy/Ci2LC3J68Ly1kUooXYh1Y/HvOZ
 Q4IZvxMnqfJQjOJ4e3/x8NiOcIUBRqyj+8UoeQOZvK4js90AopX2KjOtG3andO+/RO0q
 3AHr4zdwg5egHkSNuH7Teaa8sUMDhev2h67YkxlQf+HjNCL8yTHi70FgITY7Atej2oS9
 wPjNOVKT+aLZSQDLyPBgBLDtNZOX5ibfz/9Glad3lHRnrKPD33lURFgCP9xtr+dxZUYD
 J/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OTlNHYsCEcnge+pru6u4BNt1gvCAE0oKZkXh5DZT9jg=;
 b=qM6FVsm7GYR78uQEzWsvG7lbMBPU0CyTm2F+UtudqZuIHsy5x3NnssIyVFzmnI3v53
 KL/frJsKJf6F2PU0jfTnPLqsonifRa9yefZEZXciQE2vb3oWcOFvtQU75UHhnOeHKtSx
 lIz+7VNYRGO2MbYRGNGoj38fVugJh9/orUEVFu3iKsUzVwOpCi855G6B2zZXHfOl3u9v
 THQCBgbyots2G0Xkzl5FzQ757vylgYy3bISNwfdSSQG/l3OZrSXoKxFEBSdk68Q2rnQN
 EWpNuwL6HvMp4hZ+x0k+dtVRq4ikinPN1FI16zztHvUwFEVbXVpYQ/HFlfweMS+B+O3S
 MwTw==
X-Gm-Message-State: AOAM5313I5TFLKYKSz9o8BAgvofs7PXfp/r1ic5WMGNrRjtMNUv7a/Is
 SzVMe5Gd18ulPPpryv8OFqtwOQ==
X-Google-Smtp-Source: ABdhPJzM23ncpLSMXzOVQEtFT04UY7liIwsnhRoTeDNFJORA5eY817jki9SktRwp+ctoIB/NTJnS5w==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr14823918wre.29.1630957021429; 
 Mon, 06 Sep 2021 12:37:01 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:01 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 0/6] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon,  6 Sep 2021 21:35:23 +0200
Message-Id: <20210906193529.718845-1-msp@baylibre.com>
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

It is version 1 of the patch series following the RFC version:
https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/

Note: This patch series is currently tested on v5.10 and I am currently working
on testing it on v5.14.

The series is now based on these patch series and its dependencies:
- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Changes in v1:
- Added DP binding documentation.
- Addressed feedback from the RFC.
- General cleanups in DPI and DP drivers.
- See individual patches for details on the changes done.

Thanks in advance for any feedback and comments.

Best,
Markus


Markus Schneider-Pargmann (6):
  dt-bindings: mediatek,dpi: Add mt8195 dpintf
  dt-bindings: mediatek,dp: Add Display Port binding
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: dpi: Add dpintf support
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dp.yaml         |   89 +
 .../display/mediatek/mediatek,dpi.yaml        |   43 +-
 drivers/gpu/drm/drm_edid.c                    |   57 +
 drivers/gpu/drm/mediatek/Kconfig              |    6 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 2881 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  580 ++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  248 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    3 +
 drivers/video/hdmi.c                          |   87 +-
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    4 +
 15 files changed, 3958 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

-- 
2.33.0

