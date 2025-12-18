Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BAECCA3C3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 05:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3057A10E37F;
	Thu, 18 Dec 2025 04:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="e8CkfoRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0910E37F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 04:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1766030774; x=1797566774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OF2PUxH2qRVusojO/w+86bR0YYO5hGWehmU/Y3eJPmE=;
 b=e8CkfoRQ/I7ONWU6w1eAYHIPU/GMB47HY05cFT/pUNt1+p4x1oX8jOTG
 u9U+Glj1XtM3cYopUbwe7KcC+twM8tHnQrdQ/AFKvArTH8iG7MDgM7RwQ
 KtboWLmE3rTHnFGomQqlof/zKuiQLLu4qShlJwYSW9Zs6QJUe5jrV2Jo4
 TAjrpb7rmET0OOahMhYAnEmE+y0tgXuxut7gAFcx2oX75FmCzhqKAeooK
 4r7s+Fn/yTl0eerVA57SLlcH4fq1xjv3DXuVkoIYecEPP+TQd6h2cmkcQ
 9x5Qr6f5Is8p2e4S6ctkIaWSeBVhG0QilOTerdgkrfkBl8ez1WGYVBTmX g==;
X-CSE-ConnectionGUID: ERyhO/A+SXOvLHDrUOSkIQ==
X-CSE-MsgGUID: H5O1PS6JT4aSd/uQWyIgLA==
X-IronPort-AV: E=Sophos;i="6.21,156,1763449200"; d="scan'208";a="218033974"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 21:06:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 17 Dec 2025 21:05:32 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Dec 2025 21:05:26 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <manikandan.m@microchip.com>, <dharma.b@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: mfd: atmel,
 hlcdc: Add sama7d65 compatible string
Date: Thu, 18 Dec 2025 09:35:19 +0530
Message-ID: <20251218040521.463937-1-manikandan.m@microchip.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

base-commit: e8c28e16c3ebd142938aee296032c6b802a5a1d4
-- 
2.25.1

