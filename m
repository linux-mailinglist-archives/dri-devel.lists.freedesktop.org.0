Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCF2A5A86
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 00:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F436E90B;
	Tue,  3 Nov 2020 23:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4F96E909
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 23:27:09 +0000 (UTC)
IronPort-SDR: Ik2TlEyOQwo0679WIsGAfCBm48IJN7wiSawF1Tuz9M15mLmgiIwAc5naEIJmUfRT8JK+SM8WR1
 RbpYZPEqNFdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="166550713"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="166550713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 15:27:09 -0800
IronPort-SDR: S5uqpn+a4jy0sgA4KfSMde1cUrDclfKJktYvE8EeW9r3wYiAkB715wuunyfk4MoSqea6u9k9gd
 R8mMeeJxF7Ww==
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="528679666"
Received: from adamreyx-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.36.83])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 03 Nov 2020 15:26:47 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v12 2/7] dt-bindings: display: Intel KeemBay MSSCAM
Date: Tue,  3 Nov 2020 15:26:13 -0800
Message-Id: <1604445978-14924-3-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604445978-14924-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604445978-14924-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: edmund.j.dea@intel.com, sam@ravnborg.org, narmstrong@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch add bindings for Intel KeemBay MSSCAM syscon

v2: fixed compatible (Sam R.)

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
---
 .../bindings/display/intel,keembay-msscam.yaml     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml

diff --git a/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
new file mode 100644
index 0000000..40caa61
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml
@@ -0,0 +1,43 @@
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
+description: |
+   MSSCAM controls local clocks in the display subsystem namely LCD clocks and
+   MIPI DSI clocks. It also configures the interconnect between LCD and
+   MIPI DSI.
+
+properties:
+  compatible:
+    items:
+     - const: intel,keembay-msscam
+     - const: syscon
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
