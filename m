Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5493D108A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F5F6E4CA;
	Wed, 21 Jul 2021 14:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A4D6E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:04:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 030E558046C;
 Wed, 21 Jul 2021 10:04:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 21 Jul 2021 10:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+9YaThr8txEJp
 s+BUwDjKHeJ9kUGyYux8hfurYpNnpA=; b=AQ2FmL1TotNE9HUlG6ZWTHu7BNVsa
 i+HrAORN+Of1iDkbuokmvhQwvIDBKU9AYtSxBWIHcN9y6nH8v2QRC2uB+NQgPJUI
 brdkntFYdJbR7foiHxptDUZB4Moqs6M8WLT5+aLffjFxYRM9z33luEUkThiJFZtL
 FLfNIqFRAK7zW6V5hQ4SbBkT0rxYNjulusJ3O55jZWfP91GWH21RStOVD33woNT+
 kFntKqRVmx56BgSEhXrH5evAv8XPv2m5dHPUH69qhNEm8c3n7ndj1iRCSnjmsrwv
 ZzseVhiYzRduC+FFs07u9IYX7bRMgYofFbrppAv1nbiB8+RoUuiEX7IDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+9YaThr8txEJps+BUwDjKHeJ9kUGyYux8hfurYpNnpA=; b=IdkDw7uW
 +fmmKpe4XXowfHt0hWT7eShsvjGXyVwKkDV1uWyxH2asLlSMaU0A/KNtslWHWg5D
 JedGGQ9ZiMdEBIW/KE7FJOqfN+tO771KHnkFZSn5mG7so9vyvUsy8B4ckRifEe2R
 kdQqrH4Ub6B6fVWkOIAhixHctzt3gkPjQKCCpjpI3vCmiF/zLpln8sYfVc1YCqy8
 yOmW42cYuVc4AH6JLBfRGgtmtAhMPQDDaLNh6BuxF9l3XNjRRs7Bi1B+Ty428P97
 ptLLUwmwhXteDGVL3BVWt+0zeDE4MlwrRWVd1Q5uipTfBjeOyGfwyYCuvPVsMrfC
 iDJRs4qWDnGrHg==
X-ME-Sender: <xms:gCn4YAv5iPBtrpg0YBoR_Y1Ek0IrsKrjnKD8J3OAAfQIqft1QdByig>
 <xme:gCn4YNcHLOLSykLPm5AnP3VFefBvFjret8Tjyh0qQmn7Q0LxZVcwTWs9pBisjaEfI
 uTB9x94MZ_4tl_7BXk>
X-ME-Received: <xmr:gCn4YLzYXn_UhyfMGekKc8ZYCeaQ7DoYAm0SkVK-w4ghHL7X39zNYvnMdmkr00J7KOgwp9yzYOWByvutkoRTHowPXOeD4pBFp8_Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gCn4YDOcTozfzaxWqaRB1Sj9F2vhkZlk2rN0PYQZAf4bGcFcFUoI-g>
 <xmx:gCn4YA8YFtP0SnByj2qIwA5vGS-VCxd3NeLkyg4iTeyqYPGdYc0etg>
 <xmx:gCn4YLVUwGpofrPnzVdVMHYzGH3vLIRCIpw9ajQDYC_4a12bQbpYUA>
 <xmx:gSn4YB3M_tu6VRMfFyiKdx_gQbEMJHadc4cbUMvNZGMh5Hcj3FBrWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:04:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 10/54] dt-bindings: display: panel-lvds: Document panel
 compatibles
Date: Wed, 21 Jul 2021 16:03:40 +0200
Message-Id: <20210721140424.725744-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The binding mentions that all the drivers using that driver must use a
vendor-specific compatible but never enforces it, nor documents the
vendor-specific compatibles.

Let's make we document all of them, and that the binding will create an
error if we add one that isn't.

Cc: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/panel/lvds.yaml           | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 49460c9dceea..d1513111eb48 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -31,12 +31,18 @@ allOf:
 
 properties:
   compatible:
-    contains:
-      const: panel-lvds
-    description:
-      Shall contain "panel-lvds" in addition to a mandatory panel-specific
-      compatible string defined in individual panel bindings. The "panel-lvds"
-      value shall never be used on its own.
+    items:
+      - enum:
+          - advantech,idk-1110wr
+          - advantech,idk-2121wr
+          - auo,b101ew05
+          - innolux,ee101ia-01d
+          - mitsubishi,aa104xd12
+          - mitsubishi,aa121td01
+          - sgd,gktw70sdae4se
+          - sharp,lq150x1lg11
+          - tbs,a711-panel
+      - const: panel-lvds
 
   data-mapping:
     enum:
-- 
2.31.1

