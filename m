Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90262AB9A84
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40E910EA4B;
	Fri, 16 May 2025 10:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="M5sP1i8e";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ANWFHuh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D9A10EA4B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:52:20 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E8391254009B;
 Fri, 16 May 2025 06:52:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 16 May 2025 06:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1747392738; x=
 1747479138; bh=WnDy8W03sMnHBjQtKFoNIn/mPbUS43+Xn/e+s1J+xFs=; b=M
 5sP1i8emXpjVdDyrvN/UF28S0X++edFe4+1KQwrLagFBhZRZEpf6gJ8Gwk6upIQb
 2756M3S/COml4L9rtbrC5qyp+YdvBIigCi8NPmd+AmTRXuosCW66m4PtdTwAtApU
 8k1iohd8NEYVyQntjeni0b/bICWUMhCNWSCgU2iWzJOBfc/336kM8wJ7fcE4uexS
 AfGIuzoenXKy2i1VNQJMRDjFJl9ORWsAMMOqH8X+7QkDkZpZCpmtrDacaI9/oqXB
 mfnbEQ4oR9YJhdCys4SJAUkegHcuG8BwzKH9UZ7Y5iVeIxENOJtu/CRAcveExUvp
 zEHkjjMD/B1hrKwakmGxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1747392738; x=1747479138; bh=W
 nDy8W03sMnHBjQtKFoNIn/mPbUS43+Xn/e+s1J+xFs=; b=ANWFHuh1O+WlpjaP5
 iSWNatd7QXOB/xnOnf2YLsKxGRsw/2fo+McUtfBhmZjn3MFJ0gATmCgL5GySzfcM
 WBy2RWcnlXmVLiz8OFdX9FJt+BiqMYMQQR90m7vtwkAmu55DBBFBX5rXHYf9x5Z5
 jsTxCWfnrWnM9LF3DpH3SBm2q2XhGG8/HXB8tXVlzJirT56zmEJcghmvQ11GI4B0
 vp6ecwliXkBnf9qqe/43EL3Sm7revv3NejGGPxeZA6j4PBi8v3OcxS1aB+EFW4nT
 7LC+dBKtbv9OEngTfiaVSuTYRHDltLYJPykCA6RhYZTJJrtOmADA82KS+WILb5Fg
 EZVpw==
X-ME-Sender: <xms:4hgnaBGyE250BAG5wHg56VVHvPIMB9_FBqHuLZ_QRix4oioPoJppWw>
 <xme:4hgnaGUzAL5HrV6XzPJm_aGH7J_GQrkhpdjWce2zTrWH_kU_-A8YPpss8iTxeDWU7
 Gt2IGd-JYfRbk-y8A>
X-ME-Received: <xmr:4hgnaDL4vgKLyRaF8aXDg9RUEFYvpZkvI1qBdIL4ZCXohpDFAC_-lWjAJORi1d0CrSh7xRJm_HelIomwFnFLHJC1lspkFca7XbF6jWpJw0Iq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4hgnaHEFSC0CffzVsG1-odmH-wAtzouB1_61N48oeVjKCECec6uSBA>
 <xmx:4hgnaHWb_Tp4m5NGNZA1d9DpQ9RibElGQ7QbJFzMT8u-B845vgI9DQ>
 <xmx:4hgnaCPraD6plmLY0sO4TjGp9VJMlp3ah276qQkUSxbhiZFajBOJIg>
 <xmx:4hgnaG0hz2bFwck3icdpFvtsJkQzmDUZ7UnFAHalIjCg7W_mjcY0mg>
 <xmx:4hgnaPa1Fjp9cZlS-ZhE2c861Iz3p0DPTzhCRgx_NGFcOXyjLC5iKZ4M>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:52:11 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v11 5/8] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Fri, 16 May 2025 22:44:22 +1200
Message-ID: <20250516105101.11650-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516105101.11650-1-ryan@testtoast.com>
References: <20250516105101.11650-1-ryan@testtoast.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Note that the DE33 mixer requires 3 register blocks instead of 1. To
keep things simple the maxItems value for registers is conditionally
removed for the H616 and replaced with the block names from the vendor
BSP kernel.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- increase reg maxItems to 3 and add conditional for h616-de33

- Increase reg maxItems to 3.

Changelog v9..v10:
- Use named register blocks rather than by count as names are available from the Allwinner BSP kernel.
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..cbd18fd83e52 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
-  reg:
-    maxItems: 1
+  reg: true
+
+  reg-names: true
 
   clocks:
     items:
@@ -61,6 +63,34 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-de33-mixer-0
+    then:
+      properties:
+        reg:
+          description: |
+            Registers for controlling individual layers of the display
+            engine (layers), global control (top), and display blending
+            control (display). Names are from Allwinner BSP kernel.
+          maxItems: 3
+        reg-names:
+          items:
+            - const: layers
+            - const: top
+            - const: display
+      required:
+        - reg-names
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.49.0

