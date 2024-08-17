Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A8955A5A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 01:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963C010E152;
	Sat, 17 Aug 2024 23:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Wzxzj+vn";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="G4UcHx27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429AC10E13E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 23:16:14 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal
 [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 297B5138DE37;
 Sat, 17 Aug 2024 19:08:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Sat, 17 Aug 2024 19:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1723936085; x=
 1724022485; bh=oL2LeBhfbA7jLfpz3v+s/HHjqMyvCdVVxClnREF7xMQ=; b=W
 zxzj+vn7vRozEkfmlFlOYBjGIm51CI0Go/HW2EfZU582L7/QRw+RaRxV/apA8pib
 JOkFRMgZInfgjx3bJoN66LdcuNdjmrI0llQx9/k0j+KLRCQWcxgyHmypgSg9CmuS
 Qlo+imhd3MbgL0Jk6Yp6pR+mBdQAP+5W8DV0JaWJpBSZy1vAMQV2D3bHNcZNySdB
 KKshqFwDur4j6rBhdy8bJGDCedX3EeXoqASKsR6uVKihtYI6BIY9/Z8xbUsDo8JQ
 Kh4AQqopnZ/TeEWSa1JkYtZonkxOHwuSKBuKnsFBoa8H6R2/U2EIemRifi4HL8GT
 o98mcuOKXb7JfP84zytvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723936085; x=
 1724022485; bh=oL2LeBhfbA7jLfpz3v+s/HHjqMyvCdVVxClnREF7xMQ=; b=G
 4UcHx27s90AnX5D1SDEOPDidRW2uY+Ps8aXmIoLpe32WjvMM8erWKHPm/c5WO6Yf
 PV9yfjpO2j2+yBe8oNXL51eUO9ERSaDSlLN3XV2cPX+dFyZBZWvNI9l/osINP9Ox
 wFt9RlB1ixpQWzPZw4wyYD8071IKQctZY6fZWSvTh1aoIcSFEA0/Ba/Mg9mXz5uj
 QObAeLrFbG9OnBKiqWUfd1wecqVsaFTFjLp8VXqZP0UYCY7J351q1c3dc0dbWxHy
 RAMNZ9FOzbzhPThuw3SlnFjM88RgilWZWNt9bUIxHztSxiOmPmol5qSRb9NExuUu
 LY2SKYAPgA61U8a1wPO0A==
X-ME-Sender: <xms:VS3BZjnWhimb8su1gtnPvFAMx17UMmGiltMYFEhL-qfbf4GCdhRb1A>
 <xme:VS3BZm2IYgUVqUHeJeTSWQKWKL2KMZWJgGoC5FSw_uiL4kD5Rr0_vkfU2iGoeNV5v
 Yo7fN9IhGaEOIJA2g>
X-ME-Received: <xmr:VS3BZppcYhO6QoLlGhxWsWrSrdpIIc7n4JND4oewZ6pqxYQknTfMVWF3f0lmRfgfMRHtPu-HnjavCJ4YU3geXUpTkoO5z266RFSd72idWfELNcZZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VS3BZrk1785ga_HOL6xY1aMPjMijtAJYKa_FQS2AEXC04LTRl2snKw>
 <xmx:VS3BZh3a7TYgj8-t5EH7aiFcg6TzfTl8yFPsM7946IaFEZFCguyP7A>
 <xmx:VS3BZquI3s59_Egu4L6IyrMprCSg6061B5zvtU0r0x_uSzPuKTS3Sg>
 <xmx:VS3BZlVky72mkytrNkuPHJDVc68p6qeGfvs1FYlZa0pYcybQ4BDcjA>
 <xmx:VS3BZuUy_bzy8tmQlwwHI-3BdvC9gI1djQtnyRJhsxA4WUUuhMwBn9Yf>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:07:57 -0400 (EDT)
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
Subject: [PATCH v3 20/26] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Sun, 18 Aug 2024 10:46:07 +1200
Message-ID: <20240817230503.158889-21-ryan@testtoast.com>
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

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--
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
2.46.0

