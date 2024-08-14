Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80695196D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E1910E3A6;
	Wed, 14 Aug 2024 10:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="oVOeAk3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EE710E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1723632845; x=1755168845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wvyHmjI+aAqhTfrRSAqnJLQFzafV4/TL9UG+yqpNN24=;
 b=oVOeAk3Yl770jewEfoE+QsAZ4PCr2KJSxqdYU8/E6SplmOiysCnJg/3S
 D/n/Fl1kAejR68w5k4C0CF9qap/tY4MSV9VMV8avReSSIeyFRUVDLDZOl
 nXpRLu79QVyAd8KlrOdpZ5sBxKY8Kf4SPS1c7isLemUzY9nPHz8D9RNEA
 VY2h08AXwX/Oi7g864P8vecZayJo3sljL9C/WIC2k4ZD7kCPCGBEZLT94
 9VxvqNz1NZdtNvNXXOZTIsa7DnS94PUo9Vm/5/peqsmv+Wm8ebH0YQ/cY
 MqIl259XEksBXHh4GAkC8e5Dsn+baP364fAnJP3mmUx00j6OWeHIURe80 g==;
X-CSE-ConnectionGUID: 87Nj+HQzThCqvIYPn78NVA==
X-CSE-MsgGUID: YzRbsmiLSjaxuPPPrW0rsg==
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="261393484"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2024 03:54:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Aug 2024 03:53:48 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 14 Aug 2024 03:53:39 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <geert+renesas@glider.be>,
 <mpe@ellerman.id.au>, <rdunlap@infradead.org>, <dharma.b@microchip.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v3 4/4] ARM: configs: at91: Enable Microchip's MIPI DSI Host
 Controller support
Date: Wed, 14 Aug 2024 16:22:56 +0530
Message-ID: <20240814105256.177319-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814105256.177319-1-manikandan.m@microchip.com>
References: <20240814105256.177319-1-manikandan.m@microchip.com>
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

Enable the Microchip's DSI controller wrapper driver that uses
the Synopsys DesignWare MIPI DSI host controller bridge.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 6eabe2313c9a..beb29c4832ce 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
+CONFIG_DRM_MICROCHIP_DW_MIPI_DSI=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_FB_ATMEL=y
-- 
2.25.1

