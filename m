Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D584C8A4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 11:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC671131FA;
	Wed,  7 Feb 2024 10:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Rs13nRfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FB51131FA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1707301785; x=1738837785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R7H9cs6DbGLpBH+H9RkszszDtlqmhCAJkD+Ax/F7B3Y=;
 b=Rs13nRfUxIw/eVpl36DLb2Mk/vJSEwFvrF5HK2wbYv1KKHNDXLTpiUae
 pakzxzAdyjXOceX1Hge1msTFf9awOvYNYTiuQ5giRFVzEjRf4J+PiD1eP
 5u281nDpLRfILh1UVk/W2ioDUfX7tlXfQ5DaGJvdvKfoSsMvzv8X7VR3y
 7Wm0F9ApjjAUlxMnwMG58sVODi9eHjFyu2kx1/u64F+gs0ZPFSgVYnnom
 85yIidaSAWFYwGM/5Gi2Xc0rkfVJEddZUMK7sIkscMMH8kYsyd4Ck2NHH
 NC/AEa85SyhawThdpG5WUg6qUnYYYcyArS/par58KNztwqb6eOXqUUqNz Q==;
X-CSE-ConnectionGUID: j4AD8RfGT+KjBzGzRGPXfg==
X-CSE-MsgGUID: yxQHXMHUTNu7ReuQRkJiUw==
X-IronPort-AV: E=Sophos;i="6.05,250,1701154800"; d="scan'208";a="16412544"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Feb 2024 03:29:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 03:29:03 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 03:28:51 -0700
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
CC: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
Subject: [PATCH v3 4/4] ARM: configs: at91: Enable LVDS serializer support
Date: Wed, 7 Feb 2024 15:58:02 +0530
Message-ID: <20240207102802.200220-5-dharma.b@microchip.com>
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

Enable LVDS serializer support for display pipeline.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changelog
v2 -> v3
- No Changes.
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 71b5acc78187..6a7714beb099 100644
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

