Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CFB537ED
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8310EB6B;
	Thu, 11 Sep 2025 15:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="pkTbr6We";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F272910EB6A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1757604929; x=1789140929;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/mLGAizM4D0NKvOiayu53Ks5IeoiBFtYbwR9O/5P3ws=;
 b=pkTbr6WeS+Tk5ciyiJ/aoaGOGTc3DVI4krWtj4uAsKBdbwwP+3KDYbK4
 KmrbKwK4EZPrRfh7Ge3Jr6yV8PL/hn/LyEvl9l/5EkoLNqxkZ16GOvld+
 PoDDE7MIjpiDiK5UosFDhY4o/A2PRejU+4l5rO0cyFDi3rTm+RiOqS31a
 l9cWHJM6ruZyKJZcjUQkdKaFrUPZkcz6+4JPDZ3jpd0ZSsWq8IKIgqWrq
 fF2htSNyv97bq0wRd4Ppac/fbCmXLf09HANNq2TaIF+Y8Hi0RqpDjwoBL
 fG76Vv53p0Xl4l6rWF4B1cCpETmVhL3qHNaOP5WPcyaCkDMGShlsd0nTQ A==;
X-CSE-ConnectionGUID: wLSDZ5hSTNSXS1TQWmJymw==
X-CSE-MsgGUID: 2qR1GhkmSEm/uyQPjbW9Nw==
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="213773303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2025 08:28:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 11 Sep 2025 08:28:00 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 11 Sep 2025 08:27:57 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 11 Sep 2025 17:26:29 +0200
Subject: [PATCH 5/5] ARM: configs: at91_dt_defconfig: enable GFX2D driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-cpitchen-mainline_gfx2d-v1-5-d7fab1a381ee@microchip.com>
References: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
In-Reply-To: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=751;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=/mLGAizM4D0NKvOiayu53Ks5IeoiBFtYbwR9O/5P3ws=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8ahV5kvmMVNL/+e/elgq0JlwT5+r5DOZ6c3ivmsnm2du
 OXfstlNHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAimxcwMvz0WTLN12Nn8fwP
 E6v6Gm/zns2aMYE5mVEw+nr2rAyOghWMDIdvLzv5er3/n2AdjqcCNy/v3jGtaGXezbAfG8Qa7rM
 fV+cAAA==
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
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

The GFX2D GPU is embedded in both SAM9X60 and SAM9X75; enable the
driver to use it.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb9545d6d2210b2f3059e6807779a0..85e9b52152aec6746f660dd0c299cd5aa12ce2ea 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_OV2640=m
 CONFIG_VIDEO_OV7740=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
+CONFIG_DRM_MICROCHIP_GFX2D=y
 CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y

-- 
2.48.1

