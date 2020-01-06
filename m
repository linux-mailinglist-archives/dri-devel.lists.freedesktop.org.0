Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1E1320EE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723B789B7D;
	Tue,  7 Jan 2020 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35626E486
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 15:18:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A7206240007;
 Mon,  6 Jan 2020 15:18:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 2/3] dt-bindings: display: Add Satoz panel
Date: Mon,  6 Jan 2020 16:18:26 +0100
Message-Id: <20200106151827.31511-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106151827.31511-1-miquel.raynal@bootlin.com>
References: <20200106151827.31511-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Satoz is a Chinese TFT manufacturer.
Website: http://www.sat-sz.com/English/index.html

Add (simple) bindings for its SAT050AT40H12R2 5.0 inch LCD panel.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v3:
* Added the missing ".yaml" suffix in the $id.
* Removed the unnecessary "contains" assertion about the compatible.
* Added a precision : there is no public specification for this panel
  (known for the moment).
* Bindings checked with "make dt_binding_check"

Changes since v2:
* None.

Changes since v1:
* New patch

 .../display/panel/satoz,sat050at40h12r2.yaml  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml b/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml
new file mode 100644
index 000000000000..1ad6cafc1cc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/satoz,sat050at40h12r2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Satoz SAT050AT40H12R2 panel
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |+
+  LCD 5.0 inch 800x480 RGB panel (no public specification).
+
+  This binding is compatible with the simple-panel binding, which is specified
+  in simple-panel.txt in this directory.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: satoz,sat050at40h12r2
+
+required:
+  - compatible
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
