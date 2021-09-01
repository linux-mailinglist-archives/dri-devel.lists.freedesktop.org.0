Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE403FD65E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ECA6E15D;
	Wed,  1 Sep 2021 09:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEECD6E15E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2B714580B15;
 Wed,  1 Sep 2021 05:19:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 05:19:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Lmxk/iY9lXpDy
 GZnbE6M/ltzW3Z2reaejq/REFXa1GQ=; b=4N+xEelDU2MSselcbQXvP5NKz4/Fk
 bQ3QKRuiO86LYmryH2a6+PPH8pHsnrQzUALZl5cN6aIsKzoI0gsGmoDbDqMYVVGh
 QWExMnrVsi3OWSHYaSx6Znx9VV/Up8U95+oWBq3cB2umBkFA9oYHjobXbEnq4suN
 iX7u3lRggLEgAdEOMgeU0ZducarYd6LG3MCmBp/HMkIWwb7u8CS3O4XgCA7itOYi
 Vqe6nm5nnDf5s9OejQKAxDkvPyBEoKvp41lY9Pm55uKp5lPe4TQ63djqIazSfr6k
 F15oGm5Yn9LixOPwjulibB5ibX/1by+txuhVeG/P4yO98uZ1lxz19MZ3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Lmxk/iY9lXpDyGZnbE6M/ltzW3Z2reaejq/REFXa1GQ=; b=fFUOSAdG
 FlNhMy71yo7ljGdFC1kMjJ9E2no11s+sdMfkFhbN1kew9K6Mo7rdzAtVyw2/1Jfm
 3Sz+2W8AxSGBfcSy292FFePxcevd1uqXzOR9+F9qO4PdlNUUINIpbDrKEi5rHleq
 yCemJgrHz+DIPxwuCE+IdZiSWe4KkLSQwVG/GwpfGN4SxFbzBqEXiph+xU+TUKC/
 +25kNfAdVAZvDdtI0etK5Cxu0lc/V5XyV/73PinQfPoxsPf1Q6PvP9mgStg3FbQu
 nSheX65U9U0qL0+jG05PhZt3thEJBIBxzVugoZI8HsJ8g5LiKJh1y12qx/+c8vTm
 c1Jd2/e/yKo9Vw==
X-ME-Sender: <xms:o0UvYfTAsZYEB4qng-4v2UGiO-NOkCke3VcfLWx7RfA76Ujopn-RvQ>
 <xme:o0UvYQx88J3Dixa8DvUJJczGx7_kjzZlcNo2TKv_aUeSj0Vd75GXBvp6n-BAtaSzS
 FRBacsOzWqtqT4qE00>
X-ME-Received: <xmr:o0UvYU3xRwkVQd9nJcsAlWbYqWbp3hOej4HYWdI3NqGm_PZuoJ-NfwpylTWA_llhigGZ5WXt2Y9kIyr366gTXO37kwnjIVRpGgN2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:o0UvYfBXTBT9iZrgR6J3RVo9QvrZxLDoRXPJRsq_e6MRDtPyKkd61A>
 <xmx:o0UvYYjVBqkDa9Gmy9ovfAIWfiIBIsia3Z7BkE-X0GFCvDgPF3cRFg>
 <xmx:o0UvYTq3B2a1fCldjQgo6KflyDV8_DS3bwPdJ9F3TOFIPOIM7vBwHQ>
 <xmx:o0UvYdbZbUqEMnZxLI6LfWjn4mJXzJci8zzI4-n4XCksScm7bsPfxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 19/52] dt-bindings: display: Move gktw70sdae4se to
 panel-lvds
Date: Wed,  1 Sep 2021 11:18:19 +0200
Message-Id: <20210901091852.479202-20-maxime@cerno.tech>
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

The Solomon Goldentek Display GKTW70SDAE4SE Device Tree binding doesn't
really add any useful content that is not already present in the
panel-lvds binding aside from a requirement on the data-mapping.

Let's move it to the generic panel-lvds binding

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/lvds.yaml          |  2 +
 .../display/panel/sgd,gktw70sdae4se.yaml      | 68 -------------------
 2 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 22f6cf1e134d..1563d57bc793 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -35,6 +35,7 @@ allOf:
             enum:
               - mitsubishi,aa104xd12
               - mitsubishi,aa121td01
+              - sgd,gktw70sdae4se
 
     then:
       properties:
@@ -75,6 +76,7 @@ properties:
           - innolux,ee101ia-01d
           - mitsubishi,aa104xd12
           - mitsubishi,aa121td01
+          - sgd,gktw70sdae4se
       - const: panel-lvds
 
   data-mapping:
diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
deleted file mode 100644
index e63a570ae59d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ /dev/null
@@ -1,68 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/sgd,gktw70sdae4se.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Solomon Goldentek Display GKTW70SDAE4SE 7" WVGA LVDS Display Panel
-
-maintainers:
-  - Neil Armstrong <narmstrong@baylibre.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: lvds.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: sgd,gktw70sdae4se
-      - {} # panel-lvds, but not listed here to avoid false select
-
-  data-mapping:
-    const: jeida-18
-
-  width-mm:
-    const: 153
-
-  height-mm:
-    const: 86
-
-  panel-timing: true
-  port: true
-
-additionalProperties: false
-
-required:
-  - compatible
-
-examples:
-  - |+
-    panel {
-      compatible = "sgd,gktw70sdae4se", "panel-lvds";
-
-      width-mm = <153>;
-      height-mm = <86>;
-
-      data-mapping = "jeida-18";
-
-      panel-timing {
-        clock-frequency = <32000000>;
-        hactive = <800>;
-        vactive = <480>;
-        hback-porch = <39>;
-        hfront-porch = <39>;
-        vback-porch = <29>;
-        vfront-porch = <13>;
-        hsync-len = <47>;
-        vsync-len = <2>;
-      };
-
-      port {
-        panel_in: endpoint {
-          remote-endpoint = <&lvds_encoder>;
-        };
-      };
-    };
-
-...
-- 
2.31.1

