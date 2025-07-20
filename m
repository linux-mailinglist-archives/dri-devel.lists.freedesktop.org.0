Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E598B0B472
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D39410E1B0;
	Sun, 20 Jul 2025 09:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="bSUMvM7e";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="jYr+wwFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0D810E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 52AC41D00162;
 Sun, 20 Jul 2025 04:51:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sun, 20 Jul 2025 04:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001491; x=
 1753087891; bh=hlPZgFzf2NXFW3QntPWHKb62LQJwz9K5qw8/HEhsnjE=; b=b
 SUMvM7ezJwkUNXho4kCKO6iVkQUUzLVW+YmKEDOGi3QCWAKkP0S13/BBifSjBH5e
 ELvI1ED5LmVVJgVLu/OiVDHR5WQdn02ZrHsYdE6rmJrj6s+9Hqkl6dxnR5TBGzXJ
 qgGx1De2mMJeAzs8AzPgZSdZxhHNpikaF+u9XKOvgnTm53UcTN3vfzMPZtgV/Yph
 IC7pqPGuEXgFP7q3rr8WpRBJ82ffItsLyudIswgsc+YGymduh4ho49WtQwUSX2ro
 EZub8WBQfCa1WrN2eHPce+HWOgWk1CMGQY5hDk+4x8Ou1keeGkp9HDXSC4HCP0YT
 UDFPo9bm8wEzwwTCbVPvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001491; x=1753087891; bh=h
 lPZgFzf2NXFW3QntPWHKb62LQJwz9K5qw8/HEhsnjE=; b=jYr+wwFIsMwHfbwD9
 LZeNcnX9CrRmX5F22n95m+qzVCHH0VpLp7gfQyjIkSKuvO6/q1qwe8XfSf9CGP1C
 CAjHbL3slffMwaDW19FHulZr0Eo0XToiAL4Pd+zGIZYT5XFKYybVUg6pxHNquDqm
 AZUv+qrgsc3fxkbWjYwq+kqsO2i7eU+yDcUKOUkeKUmGsrW0x8cJzIPdjt6XyTZy
 O7BD5h7aW1quCpug/W3ZaRxaU1t6fnHtFLgGF85hhyTMBPq2qe+9YJK+cV4WqM20
 gVPDqJ8WwYpedgd/H78oNS0yBWvlY6SMaC3dnnWdEaxhgd6mQtW/6vBSEQ3KA0sW
 bAyig==
X-ME-Sender: <xms:Eq58aHnCzB5jxWOThXqaN5kfZ7_UlGpu9VB9ZI0MxExDgU9BO8esyw>
 <xme:Eq58aFufb79zOql2uH6GbezcAP4iP1Wa57SGHFrXZFLq_KrpMEC-oxgnVIBCusCGJ
 DqMA8P_uV2ZfWvtrw>
X-ME-Received: <xmr:Eq58aH3n_G4Dm7K_fGE3JSibuhx-3O4Z28FetH6FvAJmsb749Zt3EOdlSUzbB55DlW0X2OupBGclpwWye34vL5lb7sDD6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
 theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
 gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
 thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
 kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
 hlrdgtohhm
X-ME-Proxy: <xmx:E658aBQc5BbZtn-gqEHQa_5QQJS3a4DVIjYDHOY9RQ8yn7kXMRfkwA>
 <xmx:E658aLtqAicRCet-boC8elvYh66N_HUX25mgrPMIAKwMNdfx-CM5nQ>
 <xmx:E658aHJ5_DS86O-YVOOgEiKvNIoq1TcueVAQWXL-Z6-4wUC8ZV05gw>
 <xmx:E658aHfrNeMh-mFTTZvKuWvNq5cHIv5oooPW1PFa4DJWD4JuNO3c9A>
 <xmx:E658aMCL-pC3twdCfk9DSAS1E2pN6J26J7ldSNaTXcqtuHnqv9BeH3UJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:26 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 04/12] dt-bindings: display: sun4i: Add compatible strings
 for H616 TCON TOP
Date: Sun, 20 Jul 2025 20:48:42 +1200
Message-ID: <20250720085047.5340-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
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

Add compatible string for allwinner,sun50i-h616-tcon-top with a
fallback string of allwinner,sun50i-h6-tcon-top.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Add H616 TCON TOP compatible.
---
 .../display/allwinner,sun8i-r40-tcon-top.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..80f1e49f5b7a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -39,10 +39,15 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - allwinner,sun8i-r40-tcon-top
-      - allwinner,sun20i-d1-tcon-top
-      - allwinner,sun50i-h6-tcon-top
+    oneOf:
+      - enum:
+          - allwinner,sun8i-r40-tcon-top
+          - allwinner,sun20i-d1-tcon-top
+          - allwinner,sun50i-h6-tcon-top
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-top
+          - const: allwinner,sun50i-h6-tcon-top
 
   reg:
     maxItems: 1
-- 
2.50.1

