Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322A352375
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504766EDBE;
	Thu,  1 Apr 2021 23:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 523E26E147
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z1lYTe9; Fri, 02 Apr 2021 01:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319043; bh=sSzB+Fa4PcHGANJ9/MjMGrLaEW28R2VKApBgoqThR84=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ej+rrSJQE39SatxSt4vfzmVXo6fF9rpMTSjcESmGxl4sitO35znVU7qAZrFCXYRLE
 emmUQMPAnCKI60wchEASi4qxnVoGLccCj8ubcqfjs2crkwXCWmL+ePu8Mo1bZ3uPHw
 gNbPbRnHAAtxXziRSI58anbV2YNCDjJRDqyprJ2l48sPX/PDyPtsNq+F3hqOACVWh+
 WmFKJw3IG+tdq0L4x3MsGTs0DCsw9v+1b0UlA8bP7AHfkSt/mVthD33W/H803Sn1Ww
 iX6/Y+OqWiK/CHI96qluf3OPERoIYJdct4q/ZlJ+dQx/mMwuwWx3djjkYta7XUB5oU
 fQRCeEcTchQOA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/9] dt-bindings: display/panel: add Jenson JT60250-02
Date: Fri,  2 Apr 2021 01:17:16 +0200
Message-Id: <20210401231720.2470869-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfABcTNek/InxhOFVmjyGDGoZ5pVzGIpQeCNYRpi8K7cxWDJ3K9Vd3VNFh9/pFQtHqFGx075R+jxbCZFGOX5P/B5TT2YK9FmyTSieSjfPfJ+UR6k8KCtj
 d6eqoUluvST/jhtZMGzxLZ3SbAivElOeevW6q8mV35m9JPUt9c4fudTdccmQxCFZZnnWktXrsbmovFJGDQ/LWI/LM2dV/+UYUtLVYVH/OiZetbTmbkZeEezU
 sk7Zk4jAoOXXhIOv5JbJ1AeCcOTBh6c/+tHTolF6sYZpWCi8L8yrKuPNyfZENSmVbLqyk3JEe3wH6CTuafpdyJF8Dt1nG0kJUKuX51K2y4zw+HBOk7VtnXdF
 lMwCaQBfhpaMOUXT+B6qo6Z6c0Od6I9XRFoYtq/MVJzrfXtJKyswoQSkm0HA8O36tc5/KbtNFBQlX2Cnof0IiTtqUrAT8GMUTR6soqu/X4siQiV1wCMYoUpy
 HM+x9/pf79xJeXyG
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT binding for "jenson,jt60250-02".

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 68eaa353be0d..cd2f4421de7e 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -174,6 +174,8 @@ properties:
       - jenson,jt60248-01
         # Jenson Display JT60249-01 5" (800x480) TFT LCD panel
       - jenson,jt60249-01
+        # Jenson Display JT60250-02 10.1" (1024x600) TFT LCD panel
+      - jenson,jt60250-02
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
