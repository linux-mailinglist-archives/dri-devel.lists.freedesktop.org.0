Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC34389942B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 06:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBB3113899;
	Fri,  5 Apr 2024 04:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="e1EnpbT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0ECB113893
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 04:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1712291855; x=1743827855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=po9zb6Qn/5fT2i3jnTl0DLe9EyYWr9PtZv3ZiG+LgXk=;
 b=e1EnpbT5QH41yFtuNPQVF7grp8P9iF1tAY3Hq9nqjD467WMW83bfOn+2
 4n5y4pfGEwW5TuhkXR43iSU0Mfwz2gD6+3qRwp5KVoFx0sGGJKlOpR2BO
 p6Sr3gTYxJL65oG4cz150RgMOT3uEq2m+wZunZwJ15y11sUokVZH9iPg1
 THhyRZY/T0NJtVzjY8xi99aiSvVF/LCjfYIVTGf5Xz+BjzaT9yVkdIXWf
 msLmgPy7TC+TiQtRGvYwZgZCDlwOLpP0oQr/QynvpivjHA48gedzZDx7f
 yZya8NGiEEJym5lBWW0VrEQjibrjY5WBG0/p8Ek1nQev1dsN7vwLVPNIR g==;
X-CSE-ConnectionGUID: pa7nRkquTYe1ezaz9E3PHg==
X-CSE-MsgGUID: 7CFef4+2SuuC2PUB3XjO2g==
X-IronPort-AV: E=Sophos;i="6.07,180,1708412400"; d="scan'208";a="186866936"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2024 21:37:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 21:37:14 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 21:37:02 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, "neil .
 armstrong @ linaro . org" <neil.armstrong@linaro.org>, "rfoss @ kernel . org"
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
 <Manikandan.M@microchip.com>, "Dharma . B @ microchip . com"
 <Dharma.B@microchip.com>, "arnd @ arndb . de" <arnd@arndb.de>, "geert+renesas
 @ glider . be" <geert+renesas@glider.be>, "Jason @ zx2c4 . com"
 <Jason@zx2c4.com>, "mpe @ ellerman . id . au" <mpe@ellerman.id.au>, "gerg @
 linux-m68k . org" <gerg@linux-m68k.org>, "rdunlap @ infradead . org"
 <rdunlap@infradead.org>, "vbabka @ suse . cz" <vbabka@suse.cz>, "dri-devel @
 lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, "devicetree @
 vger . kernel . org" <devicetree@vger.kernel.org>, "linux-kernel @ vger .
 kernel . org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel @ lists .
 infradead . org" <linux-arm-kernel@lists.infradead.org>, "Hari . PrasathGE @
 microchip . com" <Hari.PrasathGE@microchip.com>, "akpm @ linux-foundation .
 org" <akpm@linux-foundation.org>, "deller @ gmx . de" <deller@gmx.de>
CC: Dharma Balasubiramani <dharma.b@microchip.com>, "Hari Prasath Gujulan
 Elango" <hari.prasathge@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>
Subject: [PATCH v5 4/4] ARM: configs: at91: Enable LVDS serializer support
Date: Fri, 5 Apr 2024 10:05:36 +0530
Message-ID: <20240405043536.274220-5-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405043536.274220-1-dharma.b@microchip.com>
References: <20240405043536.274220-1-dharma.b@microchip.com>
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

