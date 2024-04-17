Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659C8A7AB7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 04:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE22111308E;
	Wed, 17 Apr 2024 02:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="SDQK/7lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19D511308E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 02:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713322181; x=1744858181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=goGGs6Qp9Tc+FkcaAXqOOsCkNMDrE5spBraGeJFsMKc=;
 b=SDQK/7lgHLhOFX41OBPHrnec/5u9pBqN2hO0EXn/XQ0rY0sZSDVQJ/af
 jzCHjlDxJJFR+64ybwghdStU3krbWsum8oV1NJsuPHCb8UNUE8NRq5/uB
 5ir+akgh3IUAMaQKC6DeMr0j0INKHFRHN59F2TlqAVX7iii8ovnVaSFOz
 m7W6kImtB73QkOCpHoLuhPy1EzGjH5gRL0vV6ZPsitPpbjfckCajOcaSm
 oaXC0dxwFC/RFQ/i1OTj2vkukAKYcslPSQ1ZbGhhS75KT55neUY9SbLqm
 puK1TKmFlc6b3d/5M0z9uaJ0Ag2OVgTiqh9j81Q6EFRvamBPSOx6vkUWj A==;
X-CSE-ConnectionGUID: ts5yT8NnQNWB+QLFSWVn+w==
X-CSE-MsgGUID: c+22nOXKRialMAC1qQZcKw==
X-IronPort-AV: E=Sophos;i="6.07,207,1708412400"; d="scan'208";a="21373558"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Apr 2024 19:42:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 19:42:08 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 19:41:58 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <Dharma.B@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <Manikandan.M@microchip.com>, <arnd@arndb.de>,
 <geert+renesas@glider.be>, <Jason@zx2c4.com>, <mpe@ellerman.id.au>,
 <gerg@linux-m68k.org>, <rdunlap@infradead.org>, <vbabka@suse.cz>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Dharma Balasubiramani
 <dharma.b@microchip.com>
Subject: [PATCH v6 0/4] LVDS Controller Support for SAM9X75 SoC
Date: Wed, 17 Apr 2024 08:11:33 +0530
Message-ID: <20240417024137.144727-1-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

This patch series introduces LVDS controller support for the SAM9X75 SoC. The
LVDS controller is designed to work with Microchip's sam9x7 series
System-on-Chip (SoC) devices, providing Low Voltage Differential Signaling
capabilities.

Patch series Changelog:
- Include configs: at91: Enable LVDS serializer
- include all necessary To/Cc entries.
The Individual Changelogs are available on the respective patches.

Dharma Balasubiramani (4):
  dt-bindings: display: bridge: add sam9x75-lvds binding
  drm/bridge: add lvds controller support for sam9x7
  MAINTAINERS: add SAM9X7 SoC's LVDS controller
  ARM: configs: at91: Enable LVDS serializer support

 .../bridge/microchip,sam9x75-lvds.yaml        |  55 +++++
 MAINTAINERS                                   |   8 +
 arch/arm/configs/at91_dt_defconfig            |   1 +
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c       | 228 ++++++++++++++++++
 6 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
 create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c

-- 
2.25.1

