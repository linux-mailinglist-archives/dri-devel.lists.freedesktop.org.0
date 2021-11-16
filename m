Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99DF45344B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249386E11E;
	Tue, 16 Nov 2021 14:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FA46E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 14:35:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5C8523200F76;
 Tue, 16 Nov 2021 09:35:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 16 Nov 2021 09:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Kqnv2tIYf/B23
 8nXcJbzP5y+cD2Jp2CMJrf76vGTrUw=; b=fDyHaw6mtbglLdvJUNxlh3lZOVIeK
 eA57TBVPevKdvEa6hnCkSJQv3fxzUzga6tHlCGrDmX40SlwyLJ8qwj1uSg9/g05f
 OBgw+uEIhF/j10tzSJvYAClNcdMGg517libINAL3aZwSY+h6HD+SSGYlyLB8Hn9O
 kk9np3ue+uwkfxDHPydgCezjWNWgpqTvWw31S94EHPjnBGHUk1WFPLkB5NdDXaRH
 aprEWBf8ECU2cuUPg7tYDWydKb7CIHf3kBaC5VJwbzMLFsDfoRJypeYSOIWGbJOj
 3hgo/lGew1o+GlVwoFeurV3HOf/X7TGHmTTupc7uo1n/ctiwGAQ16+4Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Kqnv2tIYf/B238nXcJbzP5y+cD2Jp2CMJrf76vGTrUw=; b=E5DpxCqy
 4VshVMg0eZwG8A2/HVAUJu1VsV1IbzR6ASSmO5tUmRtGTUczCh94Tiyc3CCXYM0n
 tsDNP5kK89KszodFzAYVz1QnwTpUDhFt84TtTRNK8EKfRSTDfzBR5Kg+GdSbnBOt
 WQqHdhmgyK8NRzw/dxUmFnKvE+z9WGW1/zQ7cntTOBhjicFNS8K0OBYnVJDeccpQ
 OqnhYVWP9BwuZKO9f58Kqu9QF/SBsYmMPVeddq44wx/1HR6ozjhe/TaVnNmJj1Vk
 p4GChFPZ1E36QRG3gSZp8/0MxfkUmmIBdyAUbzkdujIFtH7xUrif5Se43gzFEFi7
 Se7NQMyoPare8g==
X-ME-Sender: <xms:n8GTYbASTfkEvt7IsYGDyr5rneG6zTw5TlN6M6FK13OYCF93lKU-kA>
 <xme:n8GTYRgx0YZINTt-lyofEpJ6EUnsbhewo8104Y6bTSuh27kSENWKHD39wPXTGy11z
 PRZleRO8i3kcJnuc9g>
X-ME-Received: <xmr:n8GTYWnPrWL-_-NiSftasnsFes2mTaovNAPyVgua1ttN5qpOrrDkYECx3XGT1xx1J472sZmYoi_ZvXCMnE2SmmPv4g-TAEQWocljlvxB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
 ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
 himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
 gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
 hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:n8GTYdwRCbQxhk_9n_aH_hCXCGNNIs8NeWsIZIrkn-SBcUO2btQAMw>
 <xmx:n8GTYQQH_Ei14rfJe85EfTCP6mSQiYbj6JJoyDqi63c1nWTj0vKxTw>
 <xmx:n8GTYQYxM_L7a5jITL-DHlSMxIcizK9xrVGmZ0zjKQAJF_lEq_-YSg>
 <xmx:oMGTYTFkA_0fvZLO-4JF-oM_YSGJJbyuMa_YOmJdac1NN4P-UjTyPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Nov 2021 09:35:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Date: Tue, 16 Nov 2021 15:35:03 +0100
Message-Id: <20211116143503.385807-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116143503.385807-1-maxime@cerno.tech>
References: <20211116143503.385807-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/panel-lvds.yaml    | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
new file mode 100644
index 000000000000..f6ce8e29391e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -0,0 +1,56 @@
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
+  - $ref: lvds.yaml#
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
+              - advantech,idk-1110wr
+              - innolux,ee101ia-01d
+              - mitsubishi,aa104xd12
+              - mitsubishi,aa121td01
+              - sgd,gktw70sdae4se
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

