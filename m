Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428DB0B46F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C372810E2DD;
	Sun, 20 Jul 2025 09:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="KwIyqXfo";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="G0rpmCGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3544410E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id E7E3C1D00121;
 Sun, 20 Jul 2025 04:51:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Sun, 20 Jul 2025 04:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001474; x=
 1753087874; bh=/BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=K
 wIyqXfoPvyrZVS1a68agipuehvKjP9dJT+pqqP+FM3bwve61xU2PqqiSIaLQpp11
 2zpkM1oOFAMhpCGIbiecOZ0sh758BG5BZrfv1oSQafYdmqwSlK1f6YHYrDcISAVF
 ZWe2nrQncnCSRO2fO7qqHQl4OHxrWvBeH9xDXsz4jgWCBQJZEHeitShGngNvOfO0
 zUOplTIpgAXfH/HPnmnnuPeZAeL5juHIeYegBU8hNqMYFaV1OaClHHUrYi+k1KR0
 Gj8BqjuNsEjZG9zaickeL6O2d+NlNKLyPGvmObsBad1IMKEhyqLE3fNSo0GPfP23
 /9C2lQc8xbFSzXMxUClKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001474; x=1753087874; bh=/
 BGi5ucU1o2+iAEAe5eZtkdao45tn34zo5WJJl1KkNs=; b=G0rpmCGtIxqM+R1Uj
 mSugcY9gDpNbp1nd8qK7ia0a5leAZcWZ8kl5j0i7Lqxd3TMj6XkVH9D9yEoGz97O
 XaW6IXwtj+Hes4cGQfqBhk3CuOfwNmdgvRJD0BG4wRK6vruBJe9jvs0dnm1p2sZH
 tVCYuzZNPckRGLu47e0olPYl0LZMS+DsqxwegtmMgxp2Mazif0sMYQ/LUAt3t6LF
 DoBR7EKlCi/Q/GvG+Skl9hn+LxbObjosroLNi4vEvS6kubWglfQuQWFV9khHfums
 FeYxymgF67qU0D6EvlPer2CKLZjqXEJfvYx7u++Th6/iaolGfljZ6L8F7RKjkKgX
 iZpSA==
X-ME-Sender: <xms:Aa58aLXs4agY2z3zt3Q5FF9PkqcJTnjPkg3xWiSnkNJRhnw9mLGbIw>
 <xme:Aa58aLI2SmZzGR-GfxokaNu1qSNHgoAWFaS2Uf2qyNVh3R8UaS8bBPIJPV9e2BmKT
 0BOufjJIA9IlAu49Q>
X-ME-Received: <xmr:Aa58aHBAgB0eeFfRSzqaiXxRYLPVURu8-oGqhx1SmygZE_K0IL24YtPaBapEUalbLVmD5R2hOxpnUTEX2xYovo-ZbsJBmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
 theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
 gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
 thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
 kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
 hlrdgtohhm
X-ME-Proxy: <xmx:Aa58aDFvcwRooZ_KA72kuTnwN8fjxTuEAcesu37azzUfEn2ZDw8Diw>
 <xmx:Aa58aMLlia4t9420gwrxf4NPUxp4gCfzkFLDGFpqRwsM_oA_dXIGRg>
 <xmx:Aa58aKpdgR9UhZfNYRrCR8KAgS0vIzP9mWyP4NrHSDKn7xAPYDhmuA>
 <xmx:Aa58aDi579743aJQG1eh7CYG8O0GWptCAl7A_NH2X8-E5pXeZ5TWKw>
 <xmx:Aq58aNX1vUrrOtcFSsXXNv1uSdoECT2LNLDUOz-K3yDkHnFxJEa6Lc1Q>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:09 -0400 (EDT)
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
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 01/12] dt-bindings: allwinner: Add TCON_TOP_LCD clock
 defines
Date: Sun, 20 Jul 2025 20:48:39 +1200
Message-ID: <20250720085047.5340-2-ryan@testtoast.com>
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

The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
connector. This requires additional clocks for the TCON_TOP as per the
T507 datasheet (which shares the same die).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d767835..2a12d047d2e1 100644
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ b/include/dt-bindings/clock/sun8i-tcon-top.h
@@ -7,5 +7,7 @@
 #define CLK_TCON_TOP_TV0	0
 #define CLK_TCON_TOP_TV1	1
 #define CLK_TCON_TOP_DSI	2
+#define CLK_TCON_TOP_LCD0	3
+#define CLK_TCON_TOP_LCD1	4
 
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
-- 
2.50.1

