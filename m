Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF86AC65DB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EB710E56F;
	Wed, 28 May 2025 09:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="gdqJXUbu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ld6z4N28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5CB10E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:25:41 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 3FAE5114017F;
 Wed, 28 May 2025 05:25:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 28 May 2025 05:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1748424340; x=
 1748510740; bh=WnDy8W03sMnHBjQtKFoNIn/mPbUS43+Xn/e+s1J+xFs=; b=g
 dqJXUbucBVQR+vqwNqQNUn2a1g1cjSfR8rsbq1v7eMUms6jG/zcpD60J/jqyliHZ
 TDM5VvYe35f9lHq49W9Gm+1JzlvC/a2ROOX1iS4kcbCUzcbzV7s8pj0wqBM8FrKw
 r5goCZqxl0KcMAT9AMAecKtJMdYBaNXDnCV6ik9zfTTKdkX0f8ODNHAoOzM2530U
 QuCIvs5bpRJvHX5i7ueBrtnkWJNICIFsKyK1N16udklfbLCZpv0lE6+IklGieveS
 UCTSd/bEH1r47SWt/FfIsUN4BypGiR0Wid1npVxnJa8a4ML1UwOcOkC59vOz64pr
 OGyJaID/z/EQo/jUk1bJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1748424340; x=1748510740; bh=W
 nDy8W03sMnHBjQtKFoNIn/mPbUS43+Xn/e+s1J+xFs=; b=Ld6z4N28UwYuyuF7k
 O0DSx51QP5YVkMd1lxTqUdaaKte67dksMDQemBirMKZOD6qjaq1+PCMxOf4XrLF3
 7q2PXVtOyyMG4issJ3D2V8vDaSWk4Fq5s1wmCwGKWTrgOzFEqaY6J1+Q8DYDrnvp
 a3ZIyC7is/Vsqv2EDw2WWDP4CZpn6LK5M+Upu05D56dWJOMAJ/jBH/X6RZDcHx8C
 a/DAVJNkNX9FRmsTSxs0O+OiRrTk+5qxc00AoC8q0KteOYOiXCWTCMKUNCEJijY6
 4PFBhSP1jNgV7ETOChkX+VlSfMAdDEGe6SNI+RilI+XWpYycIpgaCA8QPq2w0/29
 WRkvw==
X-ME-Sender: <xms:k9Y2aDvmvQyTUtnV3ufkSiP4iu8kcVnuWvIRWv-fU6xT7eorqFNwiA>
 <xme:k9Y2aEclDrpKUDVIXJmxfabAZaqPnyPCqhZhUk9ODfCHzIjG-P-MxCHVKYPkzU8Wi
 jrz2W9Bmw5mifUBUg>
X-ME-Received: <xmr:k9Y2aGwBWNQ8Tb1xbJeeTwcoXcC2wyITdwJI1mgiKKIPa4AVUJI08GHezCk4qvY2wg_iC3iyq8S7yheEjdexzCWI0LJ7ylzbdI3lP9Rs7o2h>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdekleculddtuddrgeefvddrtd
 dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
 fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
 dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
 jghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhi
 grnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvghrnhepffehieffgedt
 gfffjeetveegfeekleeileekveeuteffteetudffveegieeiheetnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgr
 shhtrdgtohhmpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtg
 hpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhs
 segtshhivgdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtse
 hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhes
 shhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
 hpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdr
 shhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhoh
 hllhgrnhgurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:k9Y2aCMPM7dENFi4Q61L7WWFnhFwcc8pQy2UHI6KxwwkrRMtyUBHmw>
 <xmx:k9Y2aD-o3mpG3hztt_8cXFe0xj4WiFS0IbVoPFwBv-2PC_KB-Cak_g>
 <xmx:k9Y2aCXZ8Mj5Dqw5wxamG4woF3h2asWYyQ5FTiUDKYXup4tQDXGHKA>
 <xmx:k9Y2aEdEXaiDKMp81J3KN3u-pzvy7ipprsoGjTpP_2kmQjfFqERpDw>
 <xmx:lNY2aOKuJD5lISiZHwasfkxTpks7Fb4s_tKcapaQLxnqyp4KMlRzj3pm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 05:25:33 -0400 (EDT)
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
Subject: [PATCH v12 5/8] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Wed, 28 May 2025 21:22:10 +1200
Message-ID: <20250528092431.28825-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
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

