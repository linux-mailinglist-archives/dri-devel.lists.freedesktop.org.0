Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B46131F584
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857376EAB6;
	Fri, 19 Feb 2021 07:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FB506EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:55:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsCZl9zcdJFRNCsCjlTfPl; Thu, 18 Feb 2021 23:55:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613688925; bh=s/UERopb9u0RDrgH/LWOENkyuqsgqusgzZkHdljYKTk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rdhb/i9stIJCzNzxXLxApmzLCiMQJBI5FAHm+kO3JzZyMkHYL1Yd1Z4c+kiNyTIvJ
 pa1M2d/GoyVaW02RWFvS2w7Z73/ZXY1zn11iV5awYFNMqyMZZeXMaSmcjXpGCvF7rv
 uY049t9gwelNcBCUsYdKupGeRp7AUJO6ulnuunxw3KJ2/cajWxzgBz0qbLLUwkC0K+
 k30gj+0X6M5UicrsF9AITw9XAjvaKYgzuz90mSsQu7Tnpe39ckqdGQYOh8OnMNBHeC
 6lz5kP2Ty5vd56FEgZxctkslINj+rbpYanWWQRW23jUKaowCkfEviGdm/jOTlblWat
 BLqW+p+Wz9jmg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 2/9] dt-bindings: display/panel: add Jenson JT60248-01
Date: Thu, 18 Feb 2021 23:54:50 +0100
Message-Id: <20210218225458.823773-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNGSe8xYL/gly+QRtGwDO2BRDu0xq01vqHThCGzmD+zo53ZA/Ax+nhZGi0ZYcXVVQ9yxSfod5BHxa8gUg1itK5rCV+fRCoKr4AZR2ykez4CasqVgGJCG
 tZFamF3ONC/ndY6yCQymmWsGTqtuqr8dFIw6+F7/NWf4h8pHqqFI/IDTuTf+V1vB2hz/LQXEua2Nancwd3P0ihLzCf8DkYcqy1IkSQIYhfNKifilOxRIIZSW
 j58AW0DFL1bQ4JILH2apQmg0GY6NPTZv2Bcy5aliOpfbLa7iuGgPna2xTlteRKOQlmCCygonhzBBOGXLEUB7svyRXLvBLbx8h8JQdd4yUdyrFkdxl5lqXaAD
 4AUVhFX63LvEeOT3Dg5rnXIFe764/440kNg6jvLOv0w28w8+7zWLp8SGZq6AWX7JCJqqFjms/yKP6ICu88vBbkotBHTZJ+I9N1E2/QnU+nEEPehIg1C79JYF
 uAqPC2953ivmuUKfKnl9/ryDV+SEHaDlgcWXGb+55Tv/7GtfcWrgfjJPn/n5i5bSjBglUAGeMT5Xvo4y5Q4S8OcdJI/cKx4IvyIsV0HCqMtAZeof5W31YDES
 IrfrrfiQv8NOvGFLHIADRsAOV+Oq2/RdEanN1T4ub1Szjqe3H/5Wx7sMJwgvl0rmOev15X+6gpV7hEh37K+sN9jQJJHEoZA1Izzl/s8yfYJBn+W0MdKgdQBY
 oG6J9RGluGvMVdyd5MXDZpbzb+6qaknAiOcq9Oo/iChtFRxNHRNj38sQ32n0pvR+VaHjVmN6pX/7Jc1rgOCnbWmfiLaqIzWq3BmA3nHpm6PlNoTg6o3O4Q==
X-Mailman-Approved-At: Fri, 19 Feb 2021 07:54:58 +0000
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

Add DT binding for "jenson,jt60248-01".

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 27fffafe5b5c..d4359f09818a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -165,6 +165,8 @@ properties:
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
+        # Jenson Display JT60248-01 4,3" (480x272) TFT LCD panel
+      - jenson,jt60248-01
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
