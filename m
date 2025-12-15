Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D3CBD1C3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70F610E230;
	Mon, 15 Dec 2025 09:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="dd9G6/l9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Mon, 15 Dec 2025 09:14:43 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B010E230
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1765790083; x=1797326083;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJLQFJraqizUE67dqXdm91xUJsTZgel7BQijceu5F8A=;
 b=dd9G6/l9WNyoUM2yBNRmxh0VHtwTfhFF3vpqbNoWty18D+1vsovqHZfA
 f4hep8+GJEXDlcEPhZdd/PoLeHDdrPcq4L4P/ANmZvrxct5ntoIPt5crh
 ou9vRqKmCyQzUBNCjrfw/q07YjJtQ5SqIrC8v9ZDyPqiE4dtO+uheFwvf
 A6DYE8EYu14TdnVvkaRj1wJbGrNcPu6moZ/ALJISSoNa7aGf7HIX9v5C4
 jR7apzx/hgYLYBKtkylN10ZyaLv0hJyPMC0SC+gaKaBu2HPTGldxpoQf/
 avw8Ij7Ta84jRl4Ktm1zi+QaRRBLZMUn63kDfEAp2inDOSJ+5g0gASbtM g==;
X-CSE-ConnectionGUID: PcTJoc4CSZSXBJPpFg6KMg==
X-CSE-MsgGUID: MAb+FIXPRJKeJQCgXrPXHw==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; d="scan'208";a="217865848"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2025 02:07:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Dec 2025 02:07:06 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Dec 2025 02:06:59 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] dt-bindings: mfd: atmel,
 hlcdc: Add sama7d65 compatible string
Date: Mon, 15 Dec 2025 14:36:38 +0530
Message-ID: <20251215090639.346288-1-manikandan.m@microchip.com>
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

Add LCD compatible string for sama7d65.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
index 4aa36903e755..dfee8707bac2 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
@@ -25,6 +25,7 @@ properties:
       - atmel,sama5d4-hlcdc
       - microchip,sam9x60-hlcdc
       - microchip,sam9x75-xlcdc
+      - microchip,sama7d65-xlcdc
 
   reg:
     maxItems: 1

base-commit: 7f790dd21a931c61167f7bdc327aecf2cebad327
-- 
2.25.1

