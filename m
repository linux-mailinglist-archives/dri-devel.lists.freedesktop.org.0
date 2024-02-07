Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95FB84C8A2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1511131FD;
	Wed,  7 Feb 2024 10:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="LCghbwMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA0B1131FD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707301765; x=1738837765;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wH2zsP9JGzlyrwRpnqv+pfFWgVa5nzc70+du/OHojQY=;
 b=LCghbwMnJ2KUFqylaLCqHKaJEkmFGVtWWApP6Zh4hKWZmJbEHTARnUHX
 m7ZVOFEAzaosKI4czMxZ3iijAFpFXb/GR32XNT484B6wG1R3XRcY81tLk
 U7R5MWk7pMRLothBqa/nv3JFuybY1h1OWtuARujbngVkTP6kCSKzEYylk
 QqxzqgimCg5XXyC4zX1briyhFJ6XSZ1Ne1bbJlgg0U7ZCyK1zBuVVYqem
 rhpcgYpkUZKn8FggwBmKODZDApfVbJMfunCDLsIO0rvTmILCTG/cC1ZXb
 YRXNvp0gpsk77ravNxlqfChowl57ziFCog4fgFykDH435NxGRwDSssNE2 w==;
X-CSE-ConnectionGUID: vlwDUa2MSzqzjUOhgJNZgw==
X-CSE-MsgGUID: Cg5+GJ1KSwChd2f5YCSPIA==
X-IronPort-AV: E=Sophos;i="6.05,250,1701154800"; d="scan'208";a="15886077"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Feb 2024 03:29:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 03:28:51 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 03:28:40 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <dharma.b@microchip.com>,
 <manikandan.m@microchip.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <geert+renesas@glider.be>, <arnd@arndb.de>,
 <palmer@rivosinc.com>, <akpm@linux-foundation.org>, <gerg@linux-m68k.org>,
 <rdunlap@infradead.org>, <vbabka@suse.cz>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
Date: Wed, 7 Feb 2024 15:58:01 +0530
Message-ID: <20240207102802.200220-4-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207102802.200220-1-dharma.b@microchip.com>
References: <20240207102802.200220-1-dharma.b@microchip.com>
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

Add the newly added LVDS controller for the SAM9X7 SoC to the existing
MAINTAINERS entry.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changelog
v2 -> v3
- Move the entry before "MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER".

v1 -> v2
- No Changes.
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c4cf8201e0..ce592b6cf375 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14216,6 +14216,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/pwm/atmel,at91sam-pwm.yaml
 F:	drivers/pwm/pwm-atmel.c
 
+MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+M:	Dharma Balasubiramani <dharma.b@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
+F:	drivers/gpu/drm/bridge/microchip-lvds.c
+
 MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

