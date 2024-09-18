Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B3997BADD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 12:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703A10E57B;
	Wed, 18 Sep 2024 10:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="GS7UbPwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FA810E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1726655539; x=1758191539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aneck0p7nY/G/FoVB3Oq8sKnXIBqstZG0l7fh3E4DHM=;
 b=GS7UbPwSkvuiqpCbYENIMFxWA+b7CEbUzbD+llJiScARkgDzQ3q4kWPH
 vBQtXmCMTeaXcmMuIVKK9iZ2q4n5MXpPACkQ4X9qWHF/wxHufweF+14uv
 onkSqU2Q5hNkMyb1EvrthiYxojxjbCO8VJZLDNXDridVNECvy2rszCv3D
 +hhC0GNNprLRGDsrbocl/mIfCa31G/TjSj5ohxdPjg4nPYMvIMmFmSEwZ
 wViUwMoHRmmKVHdNAOkMnGCah7k8fHFRgPCZCfA82zetqBTSx6eKf2Tuh
 GJ6fOnB9rBvBEtiMzOKZutAlmXRNLve4bolHpQARVosFQfzLZ4zrlL8Wj g==;
X-CSE-ConnectionGUID: u1rM2jTbQye/0AWlcIXYhg==
X-CSE-MsgGUID: UiGWGq4+Q5SsZ1s1JENHjA==
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="32558784"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Sep 2024 03:32:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Sep 2024 03:31:52 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 18 Sep 2024 03:31:45 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dharma.b@microchip.com>, <arnd@arndb.de>,
 <hari.prasathge@microchip.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v4 3/4] MAINTAINERS: add SAM9X7 SoC's Microchip's MIPI DSI
 host wrapper driver
Date: Wed, 18 Sep 2024 16:01:18 +0530
Message-ID: <20240918103119.385597-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918103119.385597-1-manikandan.m@microchip.com>
References: <20240918103119.385597-1-manikandan.m@microchip.com>
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

Add the Microchip's DSI controller wrapper driver that uses the
Synopsys DesignWare MIPI DSI host controller bridge for the SAM9X7
SoC series to the MAINTAINERS entry.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Drop T: section
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 333ed0718175..10b3a2b99717 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15103,6 +15103,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
 F:	drivers/gpu/drm/bridge/microchip-lvds.c
 
+DRM DRIVER FOR MICROCHIP SAM9X7-COMPATIBLE MIPI DSI HOST CONTROLLER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
+F:	drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
+
 MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

