Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20643A58F7D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7330010E3CD;
	Mon, 10 Mar 2025 09:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="HgwUrg5m";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="O1f6YZNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA9110E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:25:00 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 38F0B1140122;
 Mon, 10 Mar 2025 05:25:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 10 Mar 2025 05:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1741598700; x=
 1741685100; bh=LoiPw4x9/yEnLQUi5WhZAfDONB5Hr8eHgbP2VwzzCG4=; b=H
 gwUrg5mVEKVpF0Pwkd5kpMoPVrvrRgGwrNUQchQ3QTZHGkDY6W+lpQNf45sjwcGu
 zYHP+Rkk2fClxEiUAjGPH8dxt6QwlmmBl4y3F5h056BjX53psroPOLyHl7e0avvr
 LI/C58/yEn9699Ta6wojI/akGlGMOiif24tAKad/16owhBQfvVSc/kNmGECoZniB
 HCeGamgY21EyJcDXyh2yIZHJdzXv+ElaRtevtuyEYLxCDQ5wkmgiQB6QK6QY4L0+
 XtXAv9eri9QTqkT7cGqL/vgldcd3nt/p+hU/I0W4BqAIZRYzOavBDXdt1dB1ICnx
 RpQsk+ypA6EdT4hmUhS4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1741598700; x=1741685100; bh=L
 oiPw4x9/yEnLQUi5WhZAfDONB5Hr8eHgbP2VwzzCG4=; b=O1f6YZNdC1+D9GxZD
 X3HDSDcJGyIwQIJAs5NLgUqAK1AlfruRdNrsGanOyHIOILq4E9uBdtIni3/qix/6
 ShjYSMqgyZ5tqDQK6N01n36Dt2jLLVLajS0aEKKjTNpiTJRCegtZgBxC+kegY/Xp
 SKu9LgFSqoavS/7Wp4UkC8ufcMPBc0cGVvezlumFkJDLkN3nc/EFmUvYJWqeoeb3
 AkkXCmrfm/FeMiiFJebqok+/8tIcFC6otW3pnwfCHY0NMfqnvfbe9URmXKi6KjC9
 p9CaPtygoKe3DOmMcj8zPvTi0jlfuEsPgbTe4fMujGiLPUGRN0/2y/6tXeOaOzTC
 U1cmg==
X-ME-Sender: <xms:7K_OZ1oOl6x-eVCuaJEAZ1XNZbVqpBYZW5eA_flZLULzJRTQaP5fHA>
 <xme:7K_OZ3oUJMLiWrKutgy_XgGdGlASO39oWi7TDyKl0AeZjXUdqmTTBuJ6toGY7Jjxz
 ECKYEt-A7wQtwIM0Q>
X-ME-Received: <xmr:7K_OZyOsmrfCc-idFwKLcFgxqFk9bOBxqNR49PdktqjUCap8UIfaEMkB-hHzgJT4pHfiB1wDWEKM94nA9dQcejTtaj9tF8_6gPhmnrXEo4ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7K_OZw4pqnJLPsuJgkIIQpXF4Boy4LX7PVK6gn562-t2VTajlbYeCQ>
 <xmx:7K_OZ07TgewCYTXmXRhr7KpYR45rX40L06eMCHOineeiB5vf76i3ZA>
 <xmx:7K_OZ4io7UdlVE-ODuA76Rh-TmqcgOZ4pC_rq_dKv8KTZ8rmLZjlsQ>
 <xmx:7K_OZ26DmOXhC89a0NVzPaHh-ALwdtJDbahA43rVcqF-AbJZ2k8Fiw>
 <xmx:7K_OZ_xNSU_kXaFODEwTuXGfdWWSVrJGFAqfVoCz6NvmKEg9MBnwKwEm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:52 -0400 (EDT)
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
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 07/11] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Mon, 10 Mar 2025 22:09:53 +1300
Message-ID: <20250310092345.31708-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310092345.31708-1-ryan@testtoast.com>
References: <20250310092345.31708-1-ryan@testtoast.com>
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

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- increase reg maxItems to 3 and add conditional for h616-de33
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..274f5e632733 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   clocks:
     items:
@@ -61,6 +63,23 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
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
2.48.1

