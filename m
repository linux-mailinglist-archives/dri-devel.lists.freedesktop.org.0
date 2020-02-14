Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F069160CE4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EAE6E81B;
	Mon, 17 Feb 2020 08:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172BB6F90D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:32:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3490460DC;
 Fri, 14 Feb 2020 07:32:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=l8eDDHNYcUg2vqAcfVnoMzWlXT
 5rDFAUpSbmbYQS3/Y=; b=q7gl3hyDPfv4sQi//Gm+Ml6FO8bhyR3GNEh7WiVISb
 SbVB6DhN3qalZYC5wcU7ph7/+PF5MiXbhfmRaoNp5iYgaphdWcSh1YyG1B8jbXmm
 JztJ0zS/9c4MKb5C/bfD/Rfv8acL4i+jMf/9yqG+9r57WiTWf054ox6ul2ErWAe7
 YZB8okJH6HFUqubaloTLrte0+vu1qwI5rMFjDNKBEzEtfvviglHjMjYOISLOW8bm
 wxHDLiXuw0uNYJyATOEMpkqX9lFnC8jmc666tbKITveR42x5rTPpElc9TS0TL1Bq
 o6IxPWx6fUUgsoZMbZegJfT64L7BeehNNrDPkfdUw4jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=l8eDDHNYcUg2vqAcf
 VnoMzWlXT5rDFAUpSbmbYQS3/Y=; b=wiCQvRziYW5SdgAKHR2T14J2bLJpYnQ2K
 85PDUHPxX0b6vlQ0prgHagQ3+ljh+I6Dubdy7a75eXNdIDAudUrk/yynyJw/3gqA
 ODBXMrUX7yFWiBub70o6I3f/8cpTJ0iPyBnljoP7yqKLhgH0ZAwn8XX1r9+97dCn
 JrQNEJQq2ATJJxiEgYcwJLzxES7l/frCtlP+Pd79F4rTTIE9x2XrgDlv9wjZSc5Y
 9b3C7ZACWfAO7WzR1U8oexueAx9k+G4kzfIaxBOKvzgpP+L7L0tTGS6NIlk5UFsN
 RiUmNaDESfIAZjEypQ91kFtiOuRm/By6o7e9L5PXxMGkTNjkjfK/A==
X-ME-Sender: <xms:b5NGXhWX3W3AAbQV8McMdGewxQy9sYVUFgWX5IIpD8CSTg8yg7W4Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b5NGXki6WnYOVVKbSUrCyeCStEIhBTixD4yTYqd2Wxt7QTwkwEFfSA>
 <xmx:b5NGXkIyfYWw1VqMCn774jPEIVrKdTEsQ9i-3vynQAZR34835F8W4g>
 <xmx:b5NGXucuKNKGrQUP4-lV08lyvklhLtrnOlBDkXhQmYT1RnIKp-mQ-g>
 <xmx:cZNGXoiTlcty2ifP9whSTomBfktvCQTMLQbDHaojQSVIfPaKu--bcg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 813DC3060C28;
 Fri, 14 Feb 2020 07:32:47 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link
 property
Date: Fri, 14 Feb 2020 13:32:43 +0100
Message-Id: <20200214123244.109300-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SoCs that have multiple TCONs can use the two set of pins on the first TCON
to drive a dual-link display. Add a property to enable the dual link.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 86ad617d2327..aa6dd8409dbc 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -105,6 +105,13 @@ properties:
         - const: edp
         - const: lvds
 
+  allwinner,lvds-dual-link:
+    type: boolean
+    description: |
+      On a SoC with two TCON with LVDS support, the first TCON can
+      operate over both pins sets to output in a dual-link setup. This
+      will be triggered by setting this property.
+
   ports:
     type: object
     description: |
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
