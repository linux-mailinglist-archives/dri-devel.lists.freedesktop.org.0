Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F078F3FD65D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81C6E13A;
	Wed,  1 Sep 2021 09:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203B86E131
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 91A85580AF6;
 Wed,  1 Sep 2021 05:19:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 01 Sep 2021 05:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+IDpZWqHLZxZ/
 +9usMOrZ5icOaGJhchmI8t+OLelMfc=; b=xbykfo+Pysi3P6v6Nt1FlqrucPQCu
 qLT6YIDSBZXLES+0co6UPG4F8r/4qAj90Xljdv6Xh2R9B/5AUYLAjYUM8RWzR/uv
 U/6p62YQPq7rbpcCMH3YyhXh+wpe7daoNtxeb6Nqqeu8T+3YczMAgwS8D5pRxKuf
 cfmJGIUEMkCnSd1U/3FoNyF0lQJNE8WupAuS7FXZs4otTAA3enU8y2kEiiMKg21u
 pf8opIJdT39HeZoHfpqKkrxLI1KDzPVvWpXK0RVsnoYI5asyC/WENq9OEC3l6Fc3
 sp5XbyUs0sKMB+uIVnZwsMdClUbL2nlfLlgr4164LDAoOHxuldgCDiYGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+IDpZWqHLZxZ/+9usMOrZ5icOaGJhchmI8t+OLelMfc=; b=RIJb0g5k
 F+4wLHqj4oSr0vdoSn7it83inOzMxWcpWJ6UP+Ow4p6IMNPmrittnugwLE82xJ82
 1hPP8CMM3qIgwmRhtDiwOqa7SK/N9nb4MXQWNL15n0SUeGZrZI8zpBEo5ANWPZL1
 fa5tEmhvGFr80DQgUCxfiUZMZ5twey466wk09LzLta3zlzRd8nORwFVqj6FChu1J
 XH4xRASLCCeD/FMhb6wB8Mw37a+3boFyRC0uMBRuD6wT3/uNo7kbbeEL2dtQfb52
 iLwunJhM2/h+GNanAOj6TtY/e6fLLfVPQSBGbnNL7YXQxzyHPyanxHT/nkDxNnIR
 xF09c34pzA7+Jw==
X-ME-Sender: <xms:oUUvYephe-wqG2uv68YPhrDu-FNxjoudkHEPBz955NYExMW2B4juHw>
 <xme:oUUvYcoILwJ5PqJFsJFeDAqmPF0H1wQlTx7x5ELwXw3OUoVY6xNenau3CwBzZwslp
 yg8w7HS2dnr8jGjolQ>
X-ME-Received: <xmr:oUUvYTOShG1QIRXbPryNp1Vi7WF2M9O7eIjsJm56IK4Bmm1JA3yd1MxyJVF8weLhBRkRB9gHUOAIfz8FdqgDK1jJFgm4fIaaUbE5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oUUvYd59swK3IVQLzpMpa6lKN1Q7DBzEn-AFCQyJLqcy5D1Tmn22vg>
 <xmx:oUUvYd7PbTIn1UQmURVMhm2q9dkJjt32uJ1h46cBI6Dk4InALN4cvw>
 <xmx:oUUvYdiREccW2az-6slGCW_5rp9bGJ7X_GdlMknGfJEFZfG3uyNF4A>
 <xmx:oUUvYawVgKpg8AzUSLPiVr4MQRfcYICybO9uhEM-qImlqsTsYujNDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 18/52] dt-bindings: display: Move aa121td01 to panel-lvds
Date: Wed,  1 Sep 2021 11:18:18 +0200
Message-Id: <20210901091852.479202-19-maxime@cerno.tech>
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

The Mitsubishi AA121TD01 Device Tree binding doesn't really add any
useful content that is not already present in the panel-lvds binding
aside from a requirement on the data-mapping.

Let's move it to the generic panel-lvds binding

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/lvds.yaml          |  5 +-
 .../display/panel/mitsubishi,aa121td01.yaml   | 69 -------------------
 2 files changed, 4 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 09a818a60f2e..22f6cf1e134d 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -32,7 +32,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mitsubishi,aa104xd12
+            enum:
+              - mitsubishi,aa104xd12
+              - mitsubishi,aa121td01
 
     then:
       properties:
@@ -72,6 +74,7 @@ properties:
           - advantech,idk-2121wr
           - innolux,ee101ia-01d
           - mitsubishi,aa104xd12
+          - mitsubishi,aa121td01
       - const: panel-lvds
 
   data-mapping:
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
deleted file mode 100644
index 467a0ed4d444..000000000000
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ /dev/null
@@ -1,69 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/mitsubishi,aa121td01.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mitsubishi AA121TD01 12.1" WXGA LVDS Display Panel
-
-maintainers:
-  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-  - Thierry Reding <thierry.reding@gmail.com>
-
-allOf:
-  - $ref: lvds.yaml#
-
-properties:
-  compatible:
-    items:
-      - const: mitsubishi,aa121td01
-      - {} # panel-lvds, but not listed here to avoid false select
-
-  data-mapping:
-    const: jeida-18
-
-  width-mm:
-    const: 261
-
-  height-mm:
-    const: 163
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
-      compatible = "mitsubishi,aa121td01", "panel-lvds";
-
-      width-mm = <261>;
-      height-mm = <163>;
-
-      data-mapping = "jeida-18";
-
-      panel-timing {
-        /* 1280x800 @60Hz */
-        clock-frequency = <71000000>;
-        hactive = <1280>;
-        vactive = <800>;
-        hsync-len = <70>;
-        hfront-porch = <20>;
-        hback-porch = <70>;
-        vsync-len = <5>;
-        vfront-porch = <3>;
-        vback-porch = <15>;
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

