Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3AA372FC
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2369510E289;
	Sun, 16 Feb 2025 09:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="ppAJ+TwE";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="mhFc/Qh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AC810E281
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:07:43 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.stl.internal (Postfix) with ESMTP id 4D2511140138;
 Sun, 16 Feb 2025 03:58:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Sun, 16 Feb 2025 03:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696301; x=
 1739782701; bh=8S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=p
 pAJ+TwEbooChpbktJxalBPRlKtBwZqxM42ncKll28dXvx9dOCPN91keqYTrXGGRy
 sNwQnVwSlWeSGnHF9EXy9Vul3mZNY1KfWLpQKPGo0nW/8zPBvU7wTEzLy7i4KjnU
 yvrTf6vdO61kJejRKkxNT9s+gNxdbyKGuosuO4RKme5FrC+os/PgLDR+yF0U06HN
 f48IVUXeong5Jzkj80T4XMJVk7RpxwqUhcTLnSS3v6xXy+LqSMybAeM0hzGKTXJz
 K/evpzCX4RvpQHzvfULo7hUU92FagLnru1DwZBLfYoMRxBddb05xTJF9KzJ/JXNo
 ifYjV8Y61M8XYOcwyHDgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696301; x=1739782701; bh=8
 S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=mhFc/Qh1pYV586Qqi
 B6MhPm5MwiZs5GcSNfLZaqbVAq924ZrPweSAwxYazF9LUIXFzMN0DRvKDuKoZIVp
 hlQbnN8oAX+Gqx7Xgdxm43HZH3CYh9GskSSHc9q3umSUWJcckIekin+YXrGTb2lB
 C1eD6hQloksoTFWkiF3YiGSnve5Ol53GJssdrl04XVeCWrLLvtJuDU2kKpHPoRIw
 HW7/0tpD7p5gUtMLkQsohd/sceXv4iR/UFjsL55zOo6dw42Jf1ztjhge8llPGImI
 P8PdiBflBj3X+8zY2y6RzquhWvaw/9wjwTmMKzZkF4XdR6A79ijS4inTj3pwNLMP
 FkGvQ==
X-ME-Sender: <xms:rKixZ5Ex5OYP4IGl9_ynsuYcNaZsc8mV4J1Tjxus4-Sha80kmF-iyA>
 <xme:rKixZ-V8Uwsazr_jYHpV0tf4DEpsCNflukqhKyoqHCnqDoAwaKZnVY2mGuulScyBk
 HPfpbhJ0OWfC9yYrA>
X-ME-Received: <xmr:rKixZ7JDPoU81pWSyCAXMkWiRTZxuIiWIfUjH_2kdaqreola1VdyQHIyVgymlGyr2HrepFrBZwLWOyRbsl26ouUVbckQh8mKf06BLp-pajTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rKixZ_EqULXZ-p63WoXRhjBbNLN4-29iZxwYtKfsWLDN9WX87cb2lg>
 <xmx:raixZ_WSJgq0GEpwb47WOfVDO1jiVfDULfYykvx7UzQzO0XoSYnVgQ>
 <xmx:raixZ6NMN2uG7vQ6hMR8lWicBc5FjIiiiPLnLAU8a91gYAJiufy_4Q>
 <xmx:raixZ-2kR8i5xWnIvp31PrANdeBHTGof6u3wcwzEnhgtGdmhdzDPig>
 <xmx:raixZ1_9PLqVAioWh6f8MI50Om9h0lYpG-2Rkzh4ipggMCFCLDBQGJLJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:14 -0500 (EST)
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
Subject: [PATCH v6 21/27] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Sun, 16 Feb 2025 21:50:52 +1300
Message-ID: <20250216085432.6373-23-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e40..7fcd55d468d49 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.48.1

