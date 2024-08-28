Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BFC962BDE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AC510E580;
	Wed, 28 Aug 2024 15:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GA6TBWRw";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="b6xZ/aVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 358 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 15:17:05 UTC
Received: from a7-51.smtp-out.eu-west-1.amazonses.com
 (a7-51.smtp-out.eu-west-1.amazonses.com [54.240.7.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C4110E57F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724857865;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=l4Gpo7LOU8NlLxSl1iKgM/8EeAwhluE9ALPDPnDi79g=;
 b=GA6TBWRw06IFuPhTxtbmqf6iKNkM08X1qtJ27TlMlHP3wgTzYxhKh5XIEAKZOPyU
 kemH3ebYiJ/Ld8pp+Q2tDs/eWvivAOS23mm6jzdEVE0UqdKNa3Ng3PZ/wU3CzR5wzRp
 WoTqlcm0KyFAZ6PWzi9VIlsBnCfIIguwuIcQJa4gzTrFdnmlIGSiRDKXnOV33T0eNqP
 3apGrHnbRWs+V06bQPPCYYBD1ctT9z1mdUW7jSrADAWxiYXPjkMsMbzB0FrAgooUXbY
 vXKcO9zwUv8Dy1gGKIpTZh11QGunV/cAhsUmVzaVbzSndODjrRuLybPm7e8bRoa1ShO
 BCGHdYjX8g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724857865;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=l4Gpo7LOU8NlLxSl1iKgM/8EeAwhluE9ALPDPnDi79g=;
 b=b6xZ/aVMadwXjO8u3Vvj5b0db70vGdBiQoYfwhld9IazeEAth2NHQPf/Uumuk/wz
 eKhxlho83fm/aPY/qw5bA5/7JLZq4znus/SEpAAxqezu8WV6HYGlesI0ec27PrUNf/u
 +Xwz1Gy6pTKs9XjAGybQJHO0QcmsqMH4rFIp06Mc=
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Chukun Pan <amadeus@jmu.edu.cn>, 
 Muhammed Efe Cetin <efectn@protonmail.com>, 
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, 
 Dragan Simic <dsimic@manjaro.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ondrej Jirman <megi@xff.cz>, Jimmy Hon <honyuenkwun@gmail.com>, 
 Elon Zhang <zhangzj@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 06/11] dt-bindings: mmc: Add support for rk3576 eMMC
Date: Wed, 28 Aug 2024 15:11:05 +0000
Message-ID: <01020191998a55a9-697c3a2c-237e-49bb-b3dd-45762198d74f-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828151028.41255-1-detlev.casanova@collabora.com>
References: <20240828151028.41255-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.28-54.240.7.51
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

The device is compatible with rk3588, so add an entry for the 2
compatibles together.

The rk3576 device has a power-domain that needs to be on for the eMMC to
be used. Add it as a requirement.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 38 +++++++++++++------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index 4d3031d9965f..aff8106ec361 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -10,18 +10,19 @@ maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
   - Jisheng Zhang <Jisheng.Zhang@synaptics.com>
 
-allOf:
-  - $ref: mmc-controller.yaml#
-
 properties:
   compatible:
-    enum:
-      - rockchip,rk3568-dwcmshc
-      - rockchip,rk3588-dwcmshc
-      - snps,dwcmshc-sdhci
-      - sophgo,cv1800b-dwcmshc
-      - sophgo,sg2002-dwcmshc
-      - thead,th1520-dwcmshc
+    oneOf:
+      - items:
+          - const: rockchip,rk3576-dwcmshc
+          - const: rockchip,rk3588-dwcmshc
+      - enum:
+          - rockchip,rk3568-dwcmshc
+          - rockchip,rk3588-dwcmshc
+          - snps,dwcmshc-sdhci
+          - sophgo,cv1800b-dwcmshc
+          - sophgo,sg2002-dwcmshc
+          - thead,th1520-dwcmshc
 
   reg:
     maxItems: 1
@@ -38,7 +39,6 @@ properties:
       - description: block clock for rockchip specified
       - description: timer clock for rockchip specified
 
-
   clock-names:
     minItems: 1
     items:
@@ -48,6 +48,9 @@ properties:
       - const: block
       - const: timer
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 5
 
@@ -63,7 +66,6 @@ properties:
     description: Specify the number of delay for tx sampling.
     $ref: /schemas/types.yaml#/definitions/uint8
 
-
 required:
   - compatible
   - reg
@@ -71,6 +73,18 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-dwcmshc
+    then:
+      properties:
+        power-domains:
+          minItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.46.0

