Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F6F494988
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C35410E80F;
	Thu, 20 Jan 2022 08:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D5110E84A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:34:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso13387182wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l4TZ5UDtPCpi3dzy9W8w8WQyo0zsSi5jn2xfhVD5fbo=;
 b=lub++lC2f3+52eFEtC1nUTcbBd2UhhILGOi1yiif6gldAHzCV70G/6sDeZDtuqiH3F
 cizdtfPuczw88g7OZfH7W51djFqDqbUGS2jsXXH3YiAFdZX9Qm/OFpwPsRHMEKwsfVdi
 J4iTY5OVxJIh8KQ+h/2l0PFh12MsIHbormxiX+YjXdKgtpqTyFCTThw29etqNJTqOm6l
 TF4iiGHO6Cuf3hMnnwzmzOhdSbm0Fwt9Ya1ROjHJBHUHrK4PoJ5fgNbBgIaddqSi9Ow5
 fOBAAJzGCY8kzRork5wUMyLvILlZ+H4NYm0h4llu6fs06SgE8uZnYi/kPYam3Q79sRf9
 tP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l4TZ5UDtPCpi3dzy9W8w8WQyo0zsSi5jn2xfhVD5fbo=;
 b=2Tej0UFJcYoXqfUKoWWUH5erJxfTMfiEBjWYQaUrtp/nlJYV+scOTft8/tdNlcgR9g
 hqz1mZ1J3zQmxeoU8bTdaP7FInxgYquudy+b+1rCLdMZ94sZkTO2bICk86hQSqCDI1C9
 CXtRJKI+RyAI9P5CiEyvhmYr7tB24CcY9UrYhPzWB42rCB4STZxSkICcPFJVGI5bv4qb
 vQlNdgxHEe8HMu7T/r3HWVuUXDwPYSLpKBVD2J7Qi35ARAKQnOQkpVYlJBmdYlDaLNR4
 7cMBpZPch71xEctNUquornl8ZYsprefD6LtSXsax/D+UCY2l54Vcyo/rwVc0peF1AKgL
 lDsQ==
X-Gm-Message-State: AOAM530qhb6H4UNYjme3/jegtcclsX4RdpG7hfv4+8bVhokrNBg+HMjI
 GvKZi/oID6xSPWXrzpumVvBqbKEK2aR4cA==
X-Google-Smtp-Source: ABdhPJzsxF0Wuif23nZSM7TU0/9IHoZKbLE30jfoz96/IwCn0zmIhVD8V7URRFP48pHILbnyDdCdIw==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr3087303wrq.552.1642667646479; 
 Thu, 20 Jan 2022 00:34:06 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:04 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v2 0/6] drm/meson: add support for MIPI DSI Display
Date: Thu, 20 Jan 2022 09:33:51 +0100
Message-Id: <20220120083357.1541262-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3540; h=from:subject;
 bh=vln6g8eX8d0Ot+mPNz/VI3dMlLp99bhNTBEXd2qzYUY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2EaESHuM6rqMnZqKOBQCEcL4U+1MratD7lhiZg
 kHxb8hyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdhAAKCRB33NvayMhJ0f8+D/
 4vO+jRAGroWwShltg2+Nepbkf3v4X9zxv12YBzI3AWVnzfdSLykGbVixhCh03xYCZ2aVdBB/KiivZA
 G1QTrsEY01KOM2eDMOYfhlTMrm/dBC/XWAOi63LsIOyA9lPd9x6Y0Bp+cQB5vGXrS8402avPtU5QLd
 PHPPp0Uw7pf+zMEfK6DcRaXMRz1bbuZkDL1vgDwBQBYnkFFI4pFeIM5bJtGSVsvyCKICukPnldWUws
 uaIkZuMYQN/Pyn4iqMJuXqkGgN3Ec0fnaVD1+1/JqipZ+bvmL2mTi9ufvjh0AybvbYP2s2X+lod9WC
 PfqoOf4QOnECp8KW/EzaI/D5+Q9n2WWlSE2FayEYGqxqfKNo+0tJp58ksvMVeZGwnHhANJ60WSXUQa
 6JBIOa66rUaDX/MkMbZUjEB8QVesayYNgTpL/nkhuo8Fybrp9vm/RUCRZXB5OC8FcsmrMrq40oDDhl
 hGpcCZAG85Q4mmi6MGNuSuTkaEDzOgPoMo6GLcdzZvsO/nR6rUYsRzmm+DGgC4OyUOJGwF84OJSSXS
 Ny9R28XoQL36Usfz2+PJonX54qoMsEDMt3CXjsppRxVOOCWhyZ1JVNNMYP5HKi1TmJtcWkdJBbxxgS
 2TZV6tvZNlh+SvxAbCNDo2vPTb8MSQ9HoBBdi0Gk08yKfE19z/fDoLTx2l0Q==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This adds support for the glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

This patchset is based on an earlier attempt at [1] for the AXG SoCs, but:
- the AXG has a single clock source for both transceiver + pixel, which makes it an
  exception instead of a rule, it's simpler to add support for G12A then add AXG on it
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

Changes from v1 at [3]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com

Neil Armstrong (6):
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  dt-bindings: display: meson-vpu: add third DPI output port
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: vclk: add DSI clock config
  drm/meson: add DSI encoder
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 116 ++++++
 .../bindings/display/amlogic,meson-vpu.yaml   |   5 +
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |   7 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 357 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h     | 160 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c     | 160 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h     |  12 +
 drivers/gpu/drm/meson/meson_registers.h       |  15 +
 drivers/gpu/drm/meson/meson_vclk.c            |  47 +++
 drivers/gpu/drm/meson/meson_vclk.h            |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 211 ++++++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 15 files changed, 1106 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

-- 
2.25.1

