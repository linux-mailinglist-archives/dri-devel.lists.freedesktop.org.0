Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70E31F57D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9FB6EAB2;
	Fri, 19 Feb 2021 07:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8A2D6EA6D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:55:28 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsCZl9zcdJFRNCsCllTfQn; Thu, 18 Feb 2021 23:55:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613688928; bh=7FEtguxMJO83d1FzQZd9NxyR1NOhBnugwDzOTx2pVyU=;
 h=From:To:Subject:Date:MIME-Version;
 b=QvLuT3qTQKqMo79MwbEVmI/o3GMP+Q5N90yKJwheUVMXq3Q/4rAMKgWUmrb8nvl8A
 ohQ6XlvCUcVrWcp0WEOjPMJN+d6GZsdIFcim0vD4Fj7pfqO/4rA0xwl1ryO9KmD/Zn
 l85vCxwlPQ73p1mcfya2hPhB7neohjNQmENby2iezxIiJdE5xyoE4DHVCujlUk4Iqj
 fysyjb8/KGaNGkZc2K2ThccUN2We5muD0ffw+NlkaElUVGsmtH2YAInm3Okoe29thx
 y+1PkA93qUjR9vt2qD+7sRNlgz2vLb8jikC69E0jxnh6gqSkZzMglVTpjNCGUSEJY5
 KkAMzTwpNplcw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 3/9] dt-bindings: display/panel: add Jenson JT60249-01
Date: Thu, 18 Feb 2021 23:54:51 +0100
Message-Id: <20210218225458.823773-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMlRVChZpjW23YHe9pGrRsHV6LOvC2YACAuEKXeTg8piFdD3rnnx1Pwif7VQ1pFju2v7BzfcAMrLUbxosMRc9a1SQ2rmbdgazfdhu5nkcSFGRZvykNye
 gyLvjxbBbC4iQYd63a++aQuiERrjK4dq2h7NXGkbtBIDsmO5o9ENXysBNP3GakjwFLBbbAnGKCb2RxR56Ewev+51f8Tge8keSx7nVhqp1HmZfh15Fqlwn0KX
 rtmB2tKr0f5vK0lb291UMTGlGYaQVPS9JIr0U0HY4pNJjTKV6pa4Y9OMRGCvgFa3t3lB7Quqj8zxaMY8YDyfJwLNdpjjH6xADH/aUXsfQ+4uZ7TE36+/59Ez
 Rj4ATG6tlVZnJsrp+pjGBsVCU5AeBbASCSz1fYsPfYfauGE28KKvgzHg1gDG/8cM1fs/INaxXtsC5P95G8QOxBgF6xmEtvic3WlDA0cJcMG7FKG2go+d2NMk
 oFR2ieoXvIye8P+HTQGne+JOo3XI3HnWGhVtZb0wbzxqY/MkeGN+GZCPeyn61hzWEHMjp9XB29EIq2JD4SC9umSZvoHfDyxT8ieXRe5EVQDdiz+k3uMeF8Gs
 1TTjt1qJ3WoSE7cEOhpivQvx9clGF/dskxDyL4NKAjUVAuOvLBD/r06T2/A1L2Tpw00sl+d/RmAH4ymx9EVE5t2RGJAo9nbYf2rWb+VBeQmvKlcjSEja+M4e
 72BinYA03ZYoME//g2h1HTQ+QvM0sdHZbw2/FxcBwt3IrKL0SyhYLREX2nbmEngakl4KlLBDuL/iXxGvmpElx6uOKNzIGOfJX+r+8pRvQC+g85jNTxr3Yg==
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, allen <allen.chen@ite.com.tw>,
 Max Merchel <Max.Merchel@tq-group.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

Add DT binding for "jenson,jt60249-01".

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d4359f09818a..08afd6501094 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -167,6 +167,8 @@ properties:
       - innolux,zj070na-01p
         # Jenson Display JT60248-01 4,3" (480x272) TFT LCD panel
       - jenson,jt60248-01
+        # Jenson Display JT60249-01 5" (800x480) TFT LCD panel
+      - jenson,jt60249-01
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
