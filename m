Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461308A957C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 10:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570DD113AF1;
	Thu, 18 Apr 2024 08:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="usvMwDNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C47E113AF1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713430758; x=1744966758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0CpQwN2sY7E8w9r+RH403hk74qO8mXZSxBiz6OoTlT8=;
 b=usvMwDNrOOHV1aZm15tDshDISJCglxYqPaH+KrED4C6evXwpNF1JSACD
 t4kLZeYCD0hdHNwlEZHiNyzD3urciijCKe5uwDsHT5fx4gsijSglM9C3K
 xpHLAurbwkDguUlsSAYjgsn86EKpswug7XA/i0Tnr+Cd4fL5SpWMBL4iM
 n3q0+T2VgU8x9WtjfxCPveaIvWK+8EclhFSi9IywtXAN47yfT0Sx6Vz0Y
 Nh+QbGrv5+iO+KZO7dXTDD1B1ToG2IUp6HWEQj3n8v6UvEytd9ZmZbdyG
 GyUFWe2hV/HY2PIa9pU3sX2n2wgnOHQ6QoP/HtBSEegG/tmF8Um/R/j8W Q==;
X-CSE-ConnectionGUID: R+PXq/rzTeCdCQmY8Xy7jA==
X-CSE-MsgGUID: hF1xpleMR0K5xu0Z7/mHaw==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; d="scan'208";a="188866875"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2024 01:59:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 01:58:57 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 01:58:45 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>,
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, "neil . armstrong
 @ linaro . org" <neil.armstrong@linaro.org>, "rfoss @ kernel . org"
 <rfoss@kernel.org>, "Laurent . pinchart @ ideasonboard . com"
 <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, "maarten .
 lankhorst @ linux . intel . com" <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>, "tzimmermann @ suse . de"
 <tzimmermann@suse.de>, "airlied @ gmail . com" <airlied@gmail.com>, "daniel @
 ffwll . ch" <daniel@ffwll.ch>, "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt @ kernel . org"
 <conor+dt@kernel.org>, "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, "alexandre
 . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, "claudiu . beznea
 @ tuxon . dev" <claudiu.beznea@tuxon.dev>, "Manikandan . M @ microchip . com"
 <Manikandan.M@microchip.com>, "arnd @ arndb . de" <arnd@arndb.de>,
 "geert+renesas @ glider . be" <geert+renesas@glider.be>, "Jason @ zx2c4 .
 com" <Jason@zx2c4.com>, "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>, "rdunlap @ infradead . org"
 <rdunlap@infradead.org>, "vbabka @ suse . cz" <vbabka@suse.cz>, "dri-devel @
 lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, "devicetree @
 vger . kernel . org" <devicetree@vger.kernel.org>, "linux-kernel @ vger .
 kernel . org" <linux-kernel@vger.kernel.org>, "oe-kbuild-all @ lists . linux
 . dev" <oe-kbuild-all@lists.linux.dev>, "Hari . PrasathGE @ microchip . com"
 <Hari.PrasathGE@microchip.com>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, "Hari Prasath Gujulan
 Elango" <hari.prasathge@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>
Subject: [PATCH v7 4/4] ARM: configs: at91: Enable LVDS serializer support
Date: Thu, 18 Apr 2024 14:27:25 +0530
Message-ID: <20240418085725.373797-5-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418085725.373797-1-dharma.b@microchip.com>
References: <20240418085725.373797-1-dharma.b@microchip.com>
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

Enable LVDS serializer support for display pipeline.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changelog
v6 -> v7
v5 -> v6
v4 -> v5
v3 -> v4
v2 -> v3
- No Changes.
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 1d53aec4c836..6eabe2313c9a 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -143,6 +143,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_FB_ATMEL=y
-- 
2.25.1

