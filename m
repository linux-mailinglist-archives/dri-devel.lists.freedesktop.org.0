Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA863FD656
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C846E084;
	Wed,  1 Sep 2021 09:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16566E073
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:18 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id E6A7B580AF6;
 Wed,  1 Sep 2021 05:19:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=UG4V63LsRa+ih
 MW8trf2Hja3yc/9NOeyTCI/9D5mq8k=; b=B7uM3XO+B7AJm2X2XMg58DqEyIbQD
 scU6NT9yXJug7EkryevhYDQVEUMJThvHI9bqSUzwKza7MjJM06KGxJiilMKo5u/8
 +wpcfeG4tnCGRozhh5jwCcArh9kdQSlSMdQW15IwsYUG5g3qHl1elz20vT70HpPs
 HGH6aYeZbGl21Y5CanhLaKuUrhsYQ2nkIPzRaajlKCCJbWrTjg9g9HEKQbkip4i0
 VOVSVzZ+QYXGVPBJo9fkXyrKiS3Tfe2/13rlBiURZSXv1+ggM9vN8uLTFXY12nzU
 vqXAZu/jhpm8CqMCXxsXJxcoPKxL9GfKg1115BnzoS8PyCIgw8AtEKQEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UG4V63LsRa+ihMW8trf2Hja3yc/9NOeyTCI/9D5mq8k=; b=CJWGfMw7
 2PN8XYs7wi8Inf6EhPQ9vzFNb7XpOrf348v7b235oM/+exszNXHxjRNkxRPX+Ykh
 H13TGa7vhZfcCecsnRP3HK36FKS/jVGA7fWCN7oOxauOIi0Jx5AFITy8b4RVRq6r
 4mHtAZQzJelQnrOP3D4M+icnx9cnK6aEjTiT1sumW02pF+D4A1r5mOir5DBLrceZ
 BPb3yoqv73gqgjeeIICtod5EXp5VNjFOSAwR2zKbm2fsB4Jto+LBSIQBcKTvvtEK
 rZwZO7tZzTmVVTdQHYsQ6fIqpsu+bFT+LVuieFXL2I9zk52DKSSw5UtvGjahwB1i
 w7d2eZduR/gFlw==
X-ME-Sender: <xms:lEUvYYxLQf4N0w3iwjwAPzvHh5DS9yrUDua6dC3ZKE6xtDYgQCsXgQ>
 <xme:lEUvYcQOs0AnNY74ERcuGe61EHUxr0k-t7aD-cbnxM-qJ9rMq3pMzlIWnp6ESJdPJ
 8wniMcKQX9PBQSjcm8>
X-ME-Received: <xmr:lEUvYaW5kfeKtxX8ae5YU_C9MLjhb7iopMIoMZQcdtZmnEnzKjFZS7SRh3g0LIWWIz4g4k4yYP2Khw8HLctnIPMufz31NeIrj4iR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lEUvYWi11dSCEN391PQXufsdGBR1Gmx2Ab9WGyeAj-WB-pLF6phQWg>
 <xmx:lEUvYaBxHUho5Wf6kaRNXdC_92P8IggnSGvUpMTqCcoufwBx6QpQ7Q>
 <xmx:lEUvYXK9BSnCilJ7ZhmjCExDnpfcDd_CEQvghnTLspuCLAv7IRSQfQ>
 <xmx:lUUvYe6rQ5cWtOOvkiBrnVRWwFaPsbGI0mtZQ_AAdTVKdXDFcf0JcA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 11/52] dt-bindings: display: Move idk-2121wr to panel-lvds
Date: Wed,  1 Sep 2021 11:18:11 +0200
Message-Id: <20210901091852.479202-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Advantech IDK-2121WR Device Tree binding uses most of the panel-lvds
binding, aside from a requirement on the data-mapping and the
definition of the dual link binding.

The LVDS dual link binding applies to any panel with a dual-link setup,
and thus could be made generic, and we can move the data-mapping
requirement to a conditional.

Let's move it to the generic panel-lvds binding

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../display/panel/advantech,idk-2121wr.yaml   | 121 ------------------
 .../bindings/display/panel/lvds.yaml          |  88 ++++++++++++-
 2 files changed, 87 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
deleted file mode 100644
index 67682fe77f10..000000000000
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ /dev/null
@@ -1,121 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/advantech,idk-2121wr.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Advantech IDK-2121WR 21.5" Full-HD dual-LVDS panel
-
-maintainers:
-  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-description: |
-  The IDK-2121WR from Advantech is a Full-HD dual-LVDS panel.
-  A dual-LVDS interface is a dual-link connection with even pixels traveling
-  on one link, and with odd pixels traveling on the other link.
-
-  The panel expects odd pixels on the first port, and even pixels on the
-  second port, therefore the ports must be marked accordingly (with either
-  dual-lvds-odd-pixels or dual-lvds-even-pixels).
-
-properties:
-  compatible:
-    items:
-      - const: advantech,idk-2121wr
-      - {} # panel-lvds, but not listed here to avoid false select
-
-  width-mm:
-    const: 476
-
-  height-mm:
-    const: 268
-
-  data-mapping:
-    const: vesa-24
-
-  panel-timing: true
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for odd pixels.
-        properties:
-          dual-lvds-odd-pixels: true
-
-        required:
-          - dual-lvds-odd-pixels
-
-      port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for even pixels.
-        properties:
-          dual-lvds-even-pixels: true
-
-        required:
-          - dual-lvds-even-pixels
-
-    required:
-      - port@0
-      - port@1
-
-additionalProperties: false
-
-required:
-  - compatible
-  - width-mm
-  - height-mm
-  - data-mapping
-  - panel-timing
-  - ports
-
-examples:
-  - |+
-    panel-lvds {
-      compatible = "advantech,idk-2121wr", "panel-lvds";
-
-      width-mm = <476>;
-      height-mm = <268>;
-
-      data-mapping = "vesa-24";
-
-      panel-timing {
-        clock-frequency = <148500000>;
-        hactive = <1920>;
-        vactive = <1080>;
-        hsync-len = <44>;
-        hfront-porch = <88>;
-        hback-porch = <148>;
-        vfront-porch = <4>;
-        vback-porch = <36>;
-        vsync-len = <5>;
-      };
-
-      ports {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        port@0 {
-          reg = <0>;
-          dual-lvds-odd-pixels;
-          panel_in0: endpoint {
-            remote-endpoint = <&lvds0_out>;
-          };
-        };
-
-        port@1 {
-          reg = <1>;
-          dual-lvds-even-pixels;
-          panel_in1: endpoint {
-            remote-endpoint = <&lvds1_out>;
-          };
-        };
-      };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index e4e49e06f302..9b3b329e4e67 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -39,11 +39,26 @@ allOf:
         data-mapping:
           const: jeida-24
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: advantech,idk-2121wr
+
+    then:
+      properties:
+        data-mapping:
+          const: vesa-24
+
+      required:
+        - ports
+
 properties:
   compatible:
     items:
       - enum:
           - advantech,idk-1110wr
+          - advantech,idk-2121wr
       - const: panel-lvds
 
   data-mapping:
@@ -105,7 +120,34 @@ properties:
       data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
 
   port: true
-  ports: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The sink for odd pixels.
+        properties:
+          dual-lvds-odd-pixels: true
+
+        required:
+          - dual-lvds-odd-pixels
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The sink for even pixels.
+        properties:
+          dual-lvds-even-pixels: true
+
+        required:
+          - dual-lvds-even-pixels
+
+    required:
+      - port@0
+      - port@1
 
 required:
   - compatible
@@ -122,4 +164,48 @@ oneOf:
 
 unevaluatedProperties: false
 
+examples:
+  - |+
+    panel-lvds {
+      compatible = "advantech,idk-2121wr", "panel-lvds";
+
+      width-mm = <476>;
+      height-mm = <268>;
+
+      data-mapping = "vesa-24";
+
+      panel-timing {
+        clock-frequency = <148500000>;
+        hactive = <1920>;
+        vactive = <1080>;
+        hsync-len = <44>;
+        hfront-porch = <88>;
+        hback-porch = <148>;
+        vfront-porch = <4>;
+        vback-porch = <36>;
+        vsync-len = <5>;
+      };
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          dual-lvds-odd-pixels;
+          panel_in0: endpoint {
+            remote-endpoint = <&lvds0_out>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          dual-lvds-even-pixels;
+          panel_in1: endpoint {
+            remote-endpoint = <&lvds1_out>;
+          };
+        };
+      };
+    };
+
 ...
-- 
2.31.1

