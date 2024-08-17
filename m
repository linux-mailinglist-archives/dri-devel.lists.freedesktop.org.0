Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7C955A50
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 01:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67C510E13A;
	Sat, 17 Aug 2024 23:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="sn3klfnu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="lMkTH9Px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8310E13C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:16:14 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal
 [10.202.2.42])
 by mailfout.nyi.internal (Postfix) with ESMTP id BB51C138DE75;
 Sat, 17 Aug 2024 19:08:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sat, 17 Aug 2024 19:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1723936092; x=
 1724022492; bh=f1TPnNtTM3x2iLsRgGjU/0cEPMVgpkQcmK9wREZgxl4=; b=s
 n3klfnud5nISDEsvIVJgQy+1Uwnk7ExKRLKBP5TLLagPfnFNOovpKtC196oEBBze
 VBOtEQFMz8mmCYOjPTnZY1S2yV+5urJspiUkCDxsNWkRLEahpTx6mgRSf8a2yQGD
 BVgO5V0rh8XL0eSvyLh43t49TkkT7el4FaG+h4nodWQJTtaCbEMl5f6dumLjsjke
 fewUkRZVnJ/JR8E+94HPtOeilVDQ+6K93peVm47Ub9E8WFBtoYrETNjVqsRtPIUh
 NtsWMK/kV4w+/MvEZWSD8cxYPdXwFUgWfvea6quEuoIifL/LD6NGJnfpUm2+DOrx
 ObN1H3XetBbOw87oquj1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936092; x=
 1724022492; bh=f1TPnNtTM3x2iLsRgGjU/0cEPMVgpkQcmK9wREZgxl4=; b=l
 MkTH9PxoHCAXglLwkgYIQuaDyqg4ElxkLRSx94QZVz6Kz4yuWV58XDi1gOUIAQsk
 w2js5p4wUG8gvQSDsfFWDtpwtutcNyohqUD21uIUlhhrV+TXNUMXvSOw+lPl2GkC
 2xjOZUP4lAbY+o5440nyObX8MJ2p9Xat0FJk/bd65UwyK+tZbcNSpLlXzGMAI79C
 S8PDffR3l+m5vrvfMJ9QuXZmbXjG5anuMWhhxwOpvee43E1/pqASQn/4cbwWPkiG
 QPhRW4eK3XJN2pNUwBIPI/l7qqrCbKSaHliZb1bCdvPBEMgxygwmW9A5uv/gmnPB
 mwhKcfzQCKZnBZ4vYu2Fw==
X-ME-Sender: <xms:XC3BZpSMog1XZpeLpWv-wg6sB-VP2bR-IN9AAxcPG2ElsjCLvgbbLg>
 <xme:XC3BZizv6BDtxqGrp7EFysqSwD0_EHnkiFWVTx2RpwTGk7CCQL_p4Yu_wbiLKZ1HV
 6o4Sn23x-lH0N7JsQ>
X-ME-Received: <xmr:XC3BZu21_xVBAtNoIQcI0CD56NwmeOMSvi6v-73TvuTl0MDP-cE15WyGgLpeOmmF1TQzxny_bgEdiscqB1us5X8GklWACc_AjCFhW14_CGrTv2AF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:XC3BZhDQspxr2fNbxVBDzabPIiXwy5bxS13ljYVg63XhyZ0JLY-ITA>
 <xmx:XC3BZii7FEpz4ZVbRo5X4KYK0p6JI-0yRyVXNW3a8_d95Ag_Qc29BA>
 <xmx:XC3BZlo8wOSokFJv0m5n4QnvG8RP1AlMKs5nIZJoR3etr9uPSeunmQ>
 <xmx:XC3BZtgfqD0N9nwTsKhAoI2Mj9LoAEA7UmUTc4JjR4w10NLt7zRAvQ>
 <xmx:XC3BZiTlkOA0-Dph3w8f20nDXkPaxT0-mrdEm3kQO6z1iTviMdcKGCjm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:08:05 -0400 (EDT)
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
 Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 21/26] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Sun, 18 Aug 2024 10:46:08 +1200
Message-ID: <20240817230503.158889-22-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
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

--

Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad2..c37eb8ae1b8ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,6 +24,7 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
     maxItems: 1
-- 
2.46.0

