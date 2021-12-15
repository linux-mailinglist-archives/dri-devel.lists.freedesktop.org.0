Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E7475BCC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F7110E5C1;
	Wed, 15 Dec 2021 15:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D1110E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 15:27:24 +0000 (UTC)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id D6AC22243C;
 Wed, 15 Dec 2021 16:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1639582040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jWNNQnno8X1DiXd0bbBLVPxIZZjeGkw+MiyaRES/R1k=;
 b=2ICFgrh9qbOufdxDkYDPxe1UaYExnmFEialnK3cBX11rnjaJ3x+voYy1nlM7V9C78oLdso
 DNnRBPG3z8Ea6GCT6S0HwqHyR4+nzamAIwHTuiEvPHUIIMXX1Kyk4cjpFYk9WjS6/Npn37
 X1lwV5b3hcEjc6xPmUS0nwPjtvMSD9I=
From: David Heidelberg <david@ixit.cz>
To: Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] dt-bindings: display: bridge: document Toshiba TC358768 cells
 and panel node
Date: Wed, 15 Dec 2021 16:27:12 +0100
Message-Id: <20211215152712.72502-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Properties #address-cells and #size-cells are valid.
The bridge node can also contains panel node.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/bridge/toshiba,tc358768.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
index eacfe7165083..3186d9dffd98 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -69,6 +69,16 @@ properties:
       - port@0
       - port@1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^panel@[0-3]$":
+    $ref: ../panel/panel-common.yaml
+
 required:
   - compatible
   - reg
-- 
2.34.1

