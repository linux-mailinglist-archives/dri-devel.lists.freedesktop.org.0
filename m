Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9227FB38ACA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2CE10E8AB;
	Wed, 27 Aug 2025 20:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vwvuU6hk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5A710E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 20:24:05 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57RKNvl81825101;
 Wed, 27 Aug 2025 15:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756326237;
 bh=n21umJ49TC+htP1odhxAT26FoC5frxXZhZvqEYwIH48=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vwvuU6hkHzDTacwnVr9XLAHXeE7ilVhxRmdcp+qVl8isYlFEYSiWyPY5RsdQAUsPh
 JjmxWNmkK2OQUZRnRGWMtgocBjDMIrJ+O36ibZ1t3DVro57CpPgNvet9uaIOXhfPuc
 5wIp9FZOsYAnVqU+RO01HLIPnz4ChWGJweN1fl/U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57RKNvJb2950685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 27 Aug 2025 15:23:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 15:23:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 27 Aug 2025 15:23:56 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57RKNvVA3367091;
 Wed, 27 Aug 2025 15:23:57 -0500
From: Nishanth Menon <nm@ti.com>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, <afd@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, Nishanth Menon <nm@ti.com>
Subject: [PATCH V5 3/5] drm/bridge: it66121: Sort the compatibles
Date: Wed, 27 Aug 2025 15:23:52 -0500
Message-ID: <20250827202354.2017972-4-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250827202354.2017972-1-nm@ti.com>
References: <20250827202354.2017972-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Keep the compatibles sorted alpha-numerically.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V4:
None

V4: https://lore.kernel.org/all/20250819130807.3322536-4-nm@ti.com/

 drivers/gpu/drm/bridge/ite-it66121.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 9b8ed2fae2f4..cd74f3966560 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1619,15 +1619,15 @@ static const struct it66121_chip_info it6610_chip_info = {
 };
 
 static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it66121", &it66121_chip_info },
 	{ .compatible = "ite,it6610", &it6610_chip_info },
+	{ .compatible = "ite,it66121", &it66121_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, it66121_dt_match);
 
 static const struct i2c_device_id it66121_id[] = {
-	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
-	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
+	{ "it6610", (kernel_ulong_t)&it6610_chip_info },
+	{ "it66121", (kernel_ulong_t)&it66121_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it66121_id);
-- 
2.47.0

