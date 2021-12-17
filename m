Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD5478C40
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 14:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ADD10EAFD;
	Fri, 17 Dec 2021 13:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E23E10E665
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 13:25:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E15A0580153;
 Fri, 17 Dec 2021 08:25:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Dec 2021 08:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=dHIUDc6qA+Yft
 j/Hs32hLA0/3KHWaXUFK40JZlnJjB4=; b=hXaw9fUNBpJ3mLvPAIiJHWNbSG+vE
 889rwIorNLfK9ZONObBZtLdvw85cI/AdJPKXW7o1OSsWSZ8zAbm2mJwIohSA94Io
 eqSPmcIWT28xAdCCRYW/2TX3jjkoj5RzUy49d2fkYLGdgYoLHfB5ZA6Y4tNnA2v8
 YG31j3C8cSJWivp9DCq8SZ6WsLfuP4TdXFB/LRcUa1vEAMcmAtbGqnY7om0wH/B0
 NZcFaEzpBSne9oskpmuaOkFUFAe3iTbtdhRdJZi1HY0c9bqhjh4Rr/6I7zPW4kjr
 pD2CmYBL5jmEZ4pCTr33hIodQYOOguhz6oJj11dCdjlnUxXvV102ji4eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=dHIUDc6qA+Yftj/Hs32hLA0/3KHWaXUFK40JZlnJjB4=; b=AHmlqzKs
 529kDrPLEJxg01/B2PGaeUsxUSWMEWxg1L37r8eMQIrokwpaudprD2zEwK4wzf+Z
 WE7FW8zdDI+x2g2Qxp0F56MXjlYdkXkGjyHGaAgtNs1yRqOD83aeNqYqrn5OgwLi
 B6ao6KrPpFqY/uMQ9GPbzODgA7WLBlB26GMHronK2NfupNuX+xwlGEUnM8CoyFuA
 10LSCOmkqhHrpDlPhQiRfmRkzOUfVmLm7tUFf/Ik1+VU7QcG3Tjx0/PJk0Id7dTl
 bkeQClv9i8WpVnGKKOSSOFg9Ui5p3S4BiUDjnpNecHpZ3lBL+QoGau19eYcwFEl1
 MdRqflb0CAY7Kw==
X-ME-Sender: <xms:tI-8YewrxfrrUg3CUzWCbhFsSldnnOmhMrWYPtCRYfcyI3L3VoB6wA>
 <xme:tI-8YaTX71jy_xuI4Q9QbGJns-dn7hBi5ksJolZ0ukKYChzc3nWSAk84IepU3EM0C
 W0Z_XmZYLOlkN9jC6o>
X-ME-Received: <xmr:tI-8YQWBbFSL3zEb-IWOWJdwH8LC7PbEopg9La9fu2iRcLH7hrdI_e6hDFvGYkf4WMFTqywoLk3mt-6WU8GDDIic1d2oWkODyUkOumE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
 ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
 himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
 gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
 hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tI-8YUjZnPljOJmzIGNb6Kbe6qjlOt_QxQPc3B3tGNl_KqIObmf2jQ>
 <xmx:tI-8YQD4oi09mHquti2tFUKF_5dHeDQLzm7xNJ02c2WUyhtza-YFqQ>
 <xmx:tI-8YVI0GvrRN8cBcLkmAtVkvqa9jz0vl8e61JA_843AdSqoPbEd3g>
 <xmx:tI-8YQvcOixOVVcMkknTO3t6UTf9auJBFvB1M_0VSRsrNIUmH5nXdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:25:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Date: Fri, 17 Dec 2021 14:25:02 +0100
Message-Id: <20211217132502.95880-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217132502.95880-1-maxime@cerno.tech>
References: <20211217132502.95880-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the previous patch, let's introduce a generic panel-lvds
binding that documents the panels that don't have any particular
constraint documented.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Added missing compatible
  - Fixed lint
---
 .../bindings/display/panel/panel-lvds.yaml    | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
new file mode 100644
index 000000000000..fcc50db6a812
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic LVDS Display Panel Device Tree Bindings
+
+maintainers:
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml/#
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: panel-lvds
+
+  not:
+    properties:
+      compatible:
+        contains:
+          enum:
+            - advantech,idk-1110wr
+            - advantech,idk-2121wr
+            - innolux,ee101ia-01d
+            - mitsubishi,aa104xd12
+            - mitsubishi,aa121td01
+            - sgd,gktw70sdae4se
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - auo,b101ew05
+          - tbs,a711-panel
+
+      - const: panel-lvds
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - data-mapping
+  - width-mm
+  - height-mm
+  - panel-timing
+  - port
+
+...
-- 
2.33.1

