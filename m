Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C91402726
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D21B89DD8;
	Tue,  7 Sep 2021 10:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC8D89DA4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:39:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n5so13199942wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F98RMuT2qFWn1szuv2XyNIrHwLbg9F30PRmPPAi7A0M=;
 b=MDFH+AX1/fhl1Q9N+IereO8Pv8T3Mm3NxuqG0nXQ0iJM91QqmIndAAnmE5IN5EETDV
 emEiMPVTOYFSILl9MQAzJF4Zv5FHPLdOEjm0hg8AIR2PnQC9sepBJ6EzIxxd2S/r7SIP
 q5tJFNrIEn5ojPe/SmJQYKTTZoUc8dnjnu1ukSMlz78DtSeHOhjnfwHdaDxnEwCe22mG
 vDZHysPOUYvrwgDrYg6cFSTpLxUzsZhf1r3NFwTahZRauK4C86uoYipp2ZaKib5yQPAJ
 vLFpP2yYlff4IDGqrAQzxQ5dxgYcNAg8H/CiMCQCJZ/ZPs0sBG2HXOOIW5TVQT3PsTFi
 DYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F98RMuT2qFWn1szuv2XyNIrHwLbg9F30PRmPPAi7A0M=;
 b=R8e851ko4MVeNofUniVFdB184aN+nlRh4mqIzLGGI5pk+9+qDTna68gkQ4f8umAl3u
 5NHcsYiZQA/wf+bY2h15WUngvtgZdR0dn4835/DHdsQ4wL5iyd4DCtbvep/Hv3X9g5D1
 IimjdHdK+XpWEXbiDi2dRUKLNqpjdTkhViBSGpWeR78GizPwfldCBwL053qPa+GKKEpK
 YOzMRsIndfAAFiuuCk5DARm3YTKznodSjSe77CwM/HiiYpYqRJbedWh52npyc3sHaEyP
 fuTzoNwRC9f6RE8qbubSjuKcB7f5q3PcR/Ru9kQN1sLNZYsv/sPlLtBxZKEE57u5EFOg
 XEBA==
X-Gm-Message-State: AOAM530tcWEc+ffcYNa3se9JmfoXZ77o2nj0t3kbXjklZe77iKeLmxoy
 n4LGa5nI6wHHD/pWC40LT0B12WXsiCjvKPQhWYQ=
X-Google-Smtp-Source: ABdhPJwRMagq1ACw4+bT2LsmQvYIfLHSi87xUNxOtgU30yHDEHYEuHkRzaIGYpva6Z4k8qxO99HQvg==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr17652012wrp.94.1631003959316; 
 Tue, 07 Sep 2021 01:39:19 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-3317-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6141:3317:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id m186sm1737027wme.48.2021.09.07.01.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:18 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 0/4] MT8195 HDMI Tx support
Date: Tue,  7 Sep 2021 10:37:17 +0200
Message-Id: <20210907083723.7725-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Sep 2021 10:28:27 +0000
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

This small series aims at implementing basic HDMI TX support for the
MT8195 SoC family.

This series has been tested on a chromium 5.10 kernel but not yet on an
upstream 5.14.
It builds, boots and probe on 5.14 but due to some missing dependencies
in the drm chain, it couldn't be tested as of today.
I'm still working to get this series fully tested on 5.14.

This series is based on:

- Add Mediatek Soc DRM (vdosys0) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825144833.7757-1-jason-jh.lin@mediatek.com/
- Add MediaTek SoC DRM (vdosys1) support for mt8195
  https://lore.kernel.org/linux-mediatek/20210825100531.5653-1-nancy.lin@mediatek.com/

Guillaume Ranquet (4):
  phy: mediatek: add support for phy-mtk-hdmi-mt8195
  drm/mediatek: add mt8195 hdmi TX support
  dt-bindings: phy: Add binding for Mediatek MT8195 HDMI PHY
  dt-bindings: display: mediatek: add MT8195 hdmi bindings

 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    |   46 +
 .../mediatek/mediatek,mt8195-hdmi.yaml        |   99 +
 .../phy/mediatek,mtk8195-hdmi-phy.yaml        |   71 +
 drivers/gpu/drm/mediatek/Kconfig              |   10 +
 drivers/gpu/drm/mediatek/Makefile             |    4 +-
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 2413 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |  147 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  541 ++++
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  276 ++
 drivers/phy/mediatek/Makefile                 |    1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c    |  777 ++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h    |  179 ++
 13 files changed, 4583 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h

-- 
2.31.1

