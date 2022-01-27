Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D150749E4A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50CF10E72F;
	Thu, 27 Jan 2022 14:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CB110E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:30:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 59E6F580616;
 Thu, 27 Jan 2022 09:30:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jan 2022 09:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=9jqvBNEXxiJ05K
 vgfYiwu9j9Lx4ulg4vj1HxXScHchI=; b=c5QQrAPSOuEdtUZcsaCRfEOL2LRpFM
 CDN6tLYgMy4fngsKH1IUAY9JOzNm1vbaPmraf9avsXMAMETffeS5xaZqOBKRhANn
 y7Cx2ChBgjMzVd/zQuBzH7N2iHQ9vN+ot1vTv+yU+yvA1HhD5DFJQIChMgUjMA6e
 eweKXHle/VNYbutgYOPEYPpf2ewwex8Sbpg6vSMtjYTk8xNsgym7yIcDJDDTvLQg
 g69l6gpOs+vSO6cnVraD3mq+YYd8qSOwz2j+KN1q23BpQJWqv7/pihZ6eukukJD0
 RRWHrwzoyyoFafufma2kaFByh7Vz1gqrKmiZ70RBW0wFw/AYISGHIrWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9jqvBNEXxiJ05KvgfYiwu9j9Lx4ulg4vj1HxXScHc
 hI=; b=fPn0KWFGsyA5QrAUSjqLqMgAb8xWb8BI5eIXrbyjuKnL7DTVL5kJbMdzq
 8FGbBA3UehsIhM5tV6HSFVLVXa5DKMPXjisUuwcyQclWLt50LkI4AjRPhBNKrrDN
 a+zxG2DwIdineiA9RScJAmRs13tJSQ4Oh+w5UXkArXVDguQv1ef/lGUF7EQqOp+l
 3+jUNoks6Bwm2L+nyNL1YZ2AZeShmQKuk3z1gPLviwU2dCTpD0FUH2p08IHitycm
 pBGx/D80O0fHoam8aLmrwkhvVWtqZeHAQLE3/oVNj9huhrA/pcQJfWTFe/7QlmIa
 itMRTdFH1w+nqxf/rMrw77lrERHZg==
X-ME-Sender: <xms:nKzyYXm1YUHa5NLv0HyIbCGrB_EOujYAzSm-XmfbgOWMvhKZAoiUpw>
 <xme:nKzyYa0WJyHracXYTITjmwYk6dUlfaXofQWBnoHgKtjGt79hgPsbIFQ6TtJisVGYA
 eq9ZLfYKv9paBHtFvs>
X-ME-Received: <xmr:nKzyYdpt4CBz5KmTvfsXWDtEDvbLxriClAC48Emh_pbhQZbx9KQysPEz4rFq0SFhvbiqF6JjzjEFti5WRZv_VgIfXgCw7oXFhHeWI9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdeuhfehjefgueetgffgfeffveegvdduhfegffejgfefuddufeeghfdttdff
 tedtnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdpfhhrvggvuggvshhkth
 hophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nKzyYfkNHDgriL_j13ebe0Q0WRMj0VwQRLcNqJSHxhiHvUyB2_QR9w>
 <xmx:nKzyYV1tTyQLfwRnxkLo-39wxhEeKIOJZttsEypfZVVntFD_3vRRgg>
 <xmx:nKzyYeu6tcqteOSwaHaTj_K1aHbRhvOSV5PxmSsfXHxPrgIZdKXUug>
 <xmx:nazyYfyeJEngq-x-aiPORnwUJJLyGG2uhYVbumMCeIRYNc3L-JOZRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:30:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v4 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Date: Thu, 27 Jan 2022 15:30:45 +0100
Message-Id: <20220127143045.310199-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127143045.310199-1-maxime@cerno.tech>
References: <20220127143045.310199-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes from v3:
  - Rework compatible clause

Changes from v2:
  - Added a MAINTAINERS entry

Changes from v1:
  - Added missing compatible
  - Fixed lint
---
 .../bindings/display/panel/panel-lvds.yaml    | 47 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
new file mode 100644
index 000000000000..c092a040424b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -0,0 +1,47 @@
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
+        enum:
+          - auo,b101ew05
+          - tbs,a711-panel
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 3f679974e3fe..8800765fc712 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6077,6 +6077,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-lvds.c
 F:	Documentation/devicetree/bindings/display/lvds.yaml
+F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
 
 DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
-- 
2.34.1

