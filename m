Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980A7F88CD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 08:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE62910E22E;
	Sat, 25 Nov 2023 07:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0CED10E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:50:25 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 04AA524E0D8;
 Fri, 24 Nov 2023 18:44:54 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Nov
 2023 18:44:54 +0800
Received: from yang-virtual-machine.localdomain (113.72.144.198) by
 EXMBX171.cuchost.com (172.16.6.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 24 Nov 2023 18:44:52 +0800
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 1/2] dt-bindings: display: panel: raspberrypi: Add
 compatible property for waveshare 7inch touchscreen panel
Date: Fri, 24 Nov 2023 18:44:50 +0800
Message-ID: <20231124104451.44271-2-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-Mailman-Approved-At: Sat, 25 Nov 2023 07:24:41 +0000
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
Cc: eric@anholt.net, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 shengyang.chen@starfivetech.com, quic_jesszhan@quicinc.com,
 conor+dt@kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The waveshare 7inch touchscreen panel is a kind of raspberrypi pi
panel and it can be drived by panel-raspberrypi-touchscreen.c.
Add compatible property for it.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
---
 .../bindings/display/panel/raspberrypi,7inch-touchscreen.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
index 22a083f7bc8e..e4e6cb4d4e5b 100644
--- a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
@@ -22,7 +22,9 @@ description: |+
 
 properties:
   compatible:
-    const: raspberrypi,7inch-touchscreen-panel
+    enum:
+      - raspberrypi,7inch-touchscreen-panel
+      - waveshare,7inch-touchscreen-panel
 
   reg:
     const: 0x45
-- 
2.17.1

