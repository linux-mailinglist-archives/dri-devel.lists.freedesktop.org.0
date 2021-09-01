Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3A3FD65A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911FC6E0E1;
	Wed,  1 Sep 2021 09:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7676E0E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:19:25 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id C9CD8580B25;
 Wed,  1 Sep 2021 05:19:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 01 Sep 2021 05:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=w+cDPXeAXhPt4
 EwFiXD7zdQEhQIElGXlovgIUCKWC0w=; b=aBVEIBnVKlUnmFnBf9OxgCjHlUzNu
 axgWciJzWaZPWkRfqJ7UztXfdgWyZaxWbMw3byHT5NtImp22L2eZkiQZVqLlWibt
 GC9wMYr3DrlLTVw8MetVHWhv6sjVC1y1rbY3Gjo9WkF7lj5v5dgrRdLtRJGg77IV
 y9S/4cPjs67PzruAc+lPQ4JIiMncpOK7Tmh753RIKM4rLI6912fSDDgf59pX2t8+
 /VcVFnK/7e2VwX0nOK3MDCaCBB1y2x8oOVZXsF5zS6oSkqfXtOeOGQdeTncMLPiw
 J4f0rZ9ylvJT/a8cKPvBlWlV54VC0ObwOYUxJH3g4W4zZnOoecANZCE0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=w+cDPXeAXhPt4EwFiXD7zdQEhQIElGXlovgIUCKWC0w=; b=nBQYmexS
 4TsQpZaSQInu9R2LZ1K4kScJWR+ylf+zbWBCl7AOyD+RpgiyBE+8IGM0Mdwtf3o9
 AX9dQ9lXczPkWgm4ZVCNPUcylmlHTR/RH1zKD2MzPWnl7xxE2MjGE64eAWd+nD5F
 V2bXySzVdlOafDXYR8yCyoXUq9NKHxBgYGA8NPAqWlUc9bZZhO+huHSx5aOCLX8q
 B2yr/zr23wXNKaxgk1q++E18gWvNMQpE+SEklG/MtIrD1JLuNCNar7DEmPCB/YDx
 771nrol8K8gjIxe1euDDzQtD98x6ltqrlQC2Q1ML/8eJsO+ElN3QHhfKepAUgt9+
 QtJWtivkuAVQJA==
X-ME-Sender: <xms:nEUvYXL83NCdmTRZDUqB9Db9Jt_HsNTxmk7lO-Iyim7-fUhZ2e-6RQ>
 <xme:nEUvYbIE9FXa4Wd3fPpMEdCIYiJcB4MTrxlefps5j7NjdYCJpZWHhZqcIo6BrpG8g
 kfZV1nyAiw541mBklU>
X-ME-Received: <xmr:nEUvYftDlnwGSAa9CAYKu15jEzKodHHo3fgUXrzwsfK0jzaL-r-hBl22ODnfuzG_0l0Gpivd5aTFmMSclaIKWd3qGB3e3Z8PB6po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nEUvYQbgVae3BVgZ5dYHywZ0mghfkZhl8dPC4je_QvNrXrzM2e5H3A>
 <xmx:nEUvYeaKoVzTEA7Urlu05O0aVS1UOvcsZYMDH43VRpUEk7bMNn_jng>
 <xmx:nEUvYUBkgZTAPYcnFX3QLCDKbcV1Wo1qCPvguTAF2abkhiVtDD1MFA>
 <xmx:nEUvYbSiuIjhVzG1aFWuJ5cbC60s96-Q_YAllPng0duvkyrnxg3q8A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 15/52] dt-bindings: display: Move aa104xd12 to panel-lvds
Date: Wed,  1 Sep 2021 11:18:15 +0200
Message-Id: <20210901091852.479202-16-maxime@cerno.tech>
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

The Mitsubishi AA104XD12 Device Tree binding doesn't really add any
useful content that is not already present in the panel-lvds binding
aside from a requirement on the data-mapping.

Let's move it to the generic panel-lvds binding

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/lvds.yaml          | 12 ++++
 .../display/panel/mitsubishi,aa104xd12.yaml   | 70 -------------------
 2 files changed, 12 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 91a6d97a96e0..09a818a60f2e 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -28,6 +28,17 @@ description: |+
 
 allOf:
   - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mitsubishi,aa104xd12
+
+    then:
+      properties:
+        data-mapping:
+          const: jeida-18
+
   - if:
       properties:
         compatible:
@@ -60,6 +71,7 @@ properties:
           - advantech,idk-1110wr
           - advantech,idk-2121wr
           - innolux,ee101ia-01d
+          - mitsubishi,aa104xd12
       - const: panel-lvds
 
   data-mapping:
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
deleted file mode 100644
index 2d1c85e377cd..000000000000
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ /dev/null
@@ -1,70 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/panel/mitsubishi,aa104xd12.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mitsubishi AA104XD12 10.4" XGA LVDS Display Panel
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
-      - const: mitsubishi,aa104xd12
-      - {} # panel-lvds, but not listed here to avoid false select
-
-  data-mapping:
-    const: jeida-18
-
-  width-mm:
-    const: 210
-
-  height-mm:
-    const: 158
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
-
-    panel {
-      compatible = "mitsubishi,aa104xd12", "panel-lvds";
-
-      width-mm = <210>;
-      height-mm = <158>;
-
-      data-mapping = "jeida-18";
-
-      panel-timing {
-        /* 1024x768 @65Hz */
-        clock-frequency = <65000000>;
-        hactive = <1024>;
-        vactive = <768>;
-        hsync-len = <136>;
-        hfront-porch = <20>;
-        hback-porch = <160>;
-        vfront-porch = <3>;
-        vback-porch = <29>;
-        vsync-len = <6>;
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

