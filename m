Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 287382A74CA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 02:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316766E96F;
	Thu,  5 Nov 2020 01:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5806E96F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 01:16:11 +0000 (UTC)
IronPort-SDR: fP5qnlc2DR/Nht5/DSBaT+RmCf8RmBPevMmhPlNFFxYD4JjDTLaRvJqWDNfv8gjpUybi/blMMP
 kqA7g1laVOig==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187180159"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="187180159"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 17:15:59 -0800
IronPort-SDR: 46UUGSMB1QXH0+mdz+Yk8eQXddYzDgObmLeBjKR8Q1ycfoGIEICb4EzGI17ldyIZzzIrm1GMWL
 v423+hOFVB+w==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="471445663"
Received: from pschung-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.255.72.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Nov 2020 17:15:58 -0800
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org,
	anitha.chrisanthus@intel.com
Subject: [PATCH v13 2/7] dt-bindings: display: Intel KeemBay MSSCAM
Date: Wed,  4 Nov 2020 17:15:26 -0800
Message-Id: <1604538931-26726-3-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604538931-26726-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1604538931-26726-1-git-send-email-anitha.chrisanthus@intel.com>
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
