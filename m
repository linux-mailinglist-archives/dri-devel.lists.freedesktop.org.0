Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E388A7ABC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 04:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAB8113095;
	Wed, 17 Apr 2024 02:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="lYXOKnMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6E5113095
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713322229; x=1744858229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RW42ADRJHbjCU+N4jM5hsf6GoRXrS/Cmrp4V+FIUu5E=;
 b=lYXOKnMaZyrWuMXppWaL6Lc9NwTDRVDIaqoGmZFNX29DURIC2Cut4XcG
 FV4RzZOuMABsxXtu5KmKG5ZbRUTShgGv+gmLLb01ptEefw8epvXuk7Osx
 pvKWJLhf9XOZsaJibxw+6YFG1Z/fkU1oNSD6Vc3a3uSpyUoBI1xYOUgnn
 29Wfp5WTChJ83U3WeAZnqTuLiezifXtw9NF4ueukq3m01j3l5AhM9UZ4k
 hg8N7nGyG+00uoz6+fryMSN1at425TolR4qvg4aORBsJhmFIgqE/VJS0N
 U1+JhCcXPglppsUJdH8IEZtK0LT+gjCH4ngPJL5pM5BQK4gdHAB8v4zfV Q==;
X-CSE-ConnectionGUID: lGxh+0ByRtCkzh726CowEg==
X-CSE-MsgGUID: TmGpvyGHREyqXt8rLiNfvA==
X-IronPort-AV: E=Sophos;i="6.07,207,1708412400"; d="scan'208";a="252174814"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Apr 2024 19:43:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 19:42:43 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 19:42:32 -0700
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
 <dharma.b@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH v6 3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
Date: Wed, 17 Apr 2024 08:11:36 +0530
Message-ID: <20240417024137.144727-4-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417024137.144727-1-dharma.b@microchip.com>
References: <20240417024137.144727-1-dharma.b@microchip.com>
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
v5 -> v6
- Correct the file name sam9x7-lvds.yaml -> sam9x75-lvds.yaml.
v4 -> v5
v3 -> v4
- No changes.
v2 -> v3
- Move the entry before "MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER".
v1 -> v2
- No Changes.
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c23fda1aa1f0..e49347eac596 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14563,6 +14563,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/pwm/atmel,at91sam-pwm.yaml
 F:	drivers/pwm/pwm-atmel.c
 
+MICROCHIP SAM9x7-COMPATIBLE LVDS CONTROLLER
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+M:	Dharma Balasubiramani <dharma.b@microchip.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-lvds.yaml
+F:	drivers/gpu/drm/bridge/microchip-lvds.c
+
 MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

