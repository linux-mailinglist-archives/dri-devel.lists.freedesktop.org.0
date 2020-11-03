Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D52A5032
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 20:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C626E8D0;
	Tue,  3 Nov 2020 19:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0606E8D7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 19:34:55 +0000 (UTC)
IronPort-SDR: M6id70RQQa2eioCC+79z3qYhn+pJstnTbmf7boo0vMUdloDYS85Z7PaSHdVpQlRpo83dZBBz9t
 mSk2vlKizv5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156101999"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="156101999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 11:34:54 -0800
IronPort-SDR: hapBggNc2y6sDow6AutJpbNizMIflBBF+egKrCmShxL3FiCHPYE5kElxPJwZ6EF6weMv0z718Z
 SfDN5rSrspwA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="538610990"
Received: from adamreyx-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.36.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Nov 2020 11:34:54 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v11 2/7] dt-bindings: display: Intel KeemBay MSSCAM
Date: Tue,  3 Nov 2020 11:34:28 -0800
Message-Id: <1604432073-15933-3-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604432073-15933-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604432073-15933-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch add bindings for Intel KeemBay MSSCAM syscon

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
---
 .../bindings/display/intel,keembay-msscam.yaml     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml

diff --git a/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
new file mode 100644
index 0000000..10ed8d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/intel,keembay-msscam.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Devicetree bindings for Intel Keem Bay MSSCAM
+
+maintainers:
+  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
+  - Edmond J Dea <edmund.j.dea@intel.com>
+
+properties:
+  compatible:
+    const: intel,keembay-msscam, syscon
+
+  reg:
+    maxItems: 1
+
+  reg-io-width:
+    const: 4
+
+required:
+  - compatible
+  - reg
+  - reg-io-width
+
+additionalProperties: false
+
+examples:
+  - |
+    msscam:msscam@20910000 {
+        compatible = "intel,keembay-msscam", "syscon";
+        reg = <0x20910000 0x30>;
+        reg-io-width = <4>;
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
