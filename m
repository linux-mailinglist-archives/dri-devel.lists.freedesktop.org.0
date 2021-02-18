Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F26E31F57A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FE46EAAF;
	Fri, 19 Feb 2021 07:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70A8E6EA6D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:55:31 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsCZl9zcdJFRNCsColTfRo; Thu, 18 Feb 2021 23:55:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613688931; bh=vrDdx4jaNnQ08H1SRW2pXywd3/GMbTbufkzCtFWYTwg=;
 h=From:To:Subject:Date:MIME-Version;
 b=AX/qROxidaJZ/HMkDeNwjwNfSMVi2vsSOnvMwOgkDW47ma7fk1zRQ9GOnThtOuf2P
 1SmjkEPIM+b2DOhdeHaGwqaXAWo4wXODFOEtTqFBGbvjGDCmnY1xgZTeMGtd4JIq+o
 L0Q73e/n0FuyKtrjMpeW+JtgKcWYNDg+jW+oPdPpyJlxBxAPYu+pMoRa3H0XHNo5uV
 bukj0Hb4679GT6dy3Rz6+M2Px0FuROGhkm+Yx93II7LkoIUN44VFVkZ7L81EoYfzlB
 /HSTWbB1TCiH/tmBakOqJ0FvQpy9o48lZH/qx4JVDdOGp++9okiam8WiKu9shCoWHd
 Ncyl9vW6H9vag==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 4/9] dt-bindings: display/panel: add Jenson JT60245-01
Date: Thu, 18 Feb 2021 23:54:52 +0100
Message-Id: <20210218225458.823773-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
References: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAoiG6ddxTD/yG2FtqTs+ccXu9fT6nAimSuKNvCmWGpxBRP5zgErxzg57qbt8s6iH3BcgWlhe4iFYYOUDAjQ3kh3s1xHDyROuJk1Cxhv3jcpClcxhogK
 PJ4Cr/j9ofuN+4aKg2pXTACG0fF7Lkd7BYoU+tW8fRCevj39HPmdyUGDkeXupWMvSOn9dCtck8B/ucsbkjEhYuRd5S6+z0oIanHuRbJakLJjdxo0Pen9kVtR
 E0OwSftBtXyVW6FWCVIc2zQ/fqATwl7wXJS8uJ3pk9j7h41wvQPdrdZncejZ08aBtaF9ok73LH3DKSDAjBFadB/E2RZsmVznLVZPq6Uq98TF1wspttUmegy/
 3JtjO1d8Qfpb7dfT1YlPeQ0d7gYF+O7gUW5de45m3kqMFE5j/jEog8Y7+eep9jrmO8OXVPu5tXXWDq2I7Br7toumbV5PDk3zcEyUAmo0Qu3EzFovraIEc+nA
 iNQXxxKwLmgWAoP0sXRcgIU2mu5yzA+/m4pLQnnlfbwTx+9qcUPPDLBHt4iGb26UZsI3rjRZTfxNQ/bEa+qGY+CBp+dexgB1H8fFXwrkZsXCDidjOopObdbj
 4pok64vmRKmTo/2VkQnelIbV+KXVxxVcjT7d0WZiuBUMrHDHBLImBmkyk9RjBX4P4H8KnMPoo7QahIEAyZVVtcFoFR2yfg61RGgYjygcJryXk5aBdbOMlTtD
 uIAbu73Qev6iB0KbLM8yOj0xlXvOVLGK3O/FEtb80yRvOvpq/cZmXaS16O6RYs0DxiyE6AW4Ce7Ohs8UwZuKZtWnkAAGfSw1M7OhtgMMFE69/IDMCsksaA==
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

Add DT binding for "jenson,jt60245-01".

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 08afd6501094..fd0d2a573350 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -169,6 +169,8 @@ properties:
       - jenson,jt60248-01
         # Jenson Display JT60249-01 5" (800x480) TFT LCD panel
       - jenson,jt60249-01
+        # Jenson Display JT60245-01 7" (800x480) TFT LCD panel
+      - jenson,jt60245-01
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
