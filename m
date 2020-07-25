Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232CB22DFF5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4755E89DEA;
	Sun, 26 Jul 2020 15:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4149D6E102
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 21:13:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BDf2844NDz1qrf8;
 Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BDf282DTBz1qxpQ;
 Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 81Xzyg1Q-2AQ; Sat, 25 Jul 2020 23:13:50 +0200 (CEST)
X-Auth-Info: huBxnMaJB8bGmdibLzzsadZvQwPexTv+ulkegwVSOVg=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz
 [86.49.101.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 25 Jul 2020 23:13:50 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: Add DT bindings for Powertip PH800480T013
Date: Sat, 25 Jul 2020 23:13:34 +0200
Message-Id: <20200725211335.5717-2-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725211335.5717-1-marex@denx.de>
References: <20200725211335.5717-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:44 +0000
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
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT bindings for Powertip PH800480T013 800x480 parallel LCD,
this one is used in the Raspberry Pi 7" touchscreen display unit.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 .../panel/powertip,ph800480t013-idf02.yaml    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml b/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
new file mode 100644
index 000000000000..8a2a4f79f365
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: POWERTIP PH800480T013-IDF2 7.0" WVGA TFT LCD panel
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: powertip,ph800480t013-idf02
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+...
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
