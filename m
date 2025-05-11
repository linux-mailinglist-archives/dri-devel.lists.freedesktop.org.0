Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C97AB27D6
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 12:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9687E10E122;
	Sun, 11 May 2025 10:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="i3S+WGeP";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kErphGK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799AA10E042
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 10:51:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 2F40B25400BF;
 Sun, 11 May 2025 06:42:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sun, 11 May 2025 06:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1746960121; x=
 1747046521; bh=UTj1TQ3UzfUaFlJMo8jmRBYGB00N5HWQvTQpSvFZjqA=; b=i
 3S+WGePZOptv4IL8IW/rWeTknhmTG+3TGDz2Wp8dI7BK68HVoI8qp4+lPLqXfo/0
 81BS07F7MfigCHmUcOw3XbGwrXplWrcRY9EjG/f+5+FI8BwGNrAHFQulYyr8csKz
 QhjBIUOa//fAjyIHW8OFe9ImDFLzplOFqZGRi1Dynqa8cK9Jry3UHqpJ5XqVPVTK
 /2pHNB+tMdeFWzviICy2gWnuzJ4s++vXXUsUjTk4QNjC11n8Ev5I3DMlYm+SmHPL
 Lm+PY3xTccF/xQtYcgXguymxo3OM3a1AZ5GWe90TxPAwq93yc209gSMFnobU5K3H
 cOd/vjEUtniEzKgcYVgFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1746960121; x=1747046521; bh=U
 Tj1TQ3UzfUaFlJMo8jmRBYGB00N5HWQvTQpSvFZjqA=; b=kErphGK1xFIZZuYMu
 /FH5xF8OWLpbND377CIJ348WNW2tgEYFZv3POx7X82QifMHf9wSbN30IxekTZw0W
 3ydai2hXZkvfXGUa4q2FkFax1tmQi55tt/ksPzy4Y7tsU8DRQ32TGxRupUPprMzG
 RKXxvOWWb5bMKEAoQW5YAdCDCd1JJbnhzfHIoR2waex37HWoF5RUhoDmBLFdctw0
 lhU/nI+J5J+yzJcI5w0PPb6Wxpk+qrhcbJliisXDPfkIahIXGmh2wqaMbqOdWrfr
 qWZpVn/ry/4ZygOPhBBtji8h/TDsQtxdUZSq6tKHtTzDZdndYJZH3gXIMJjzryAB
 AlEfQ==
X-ME-Sender: <xms:-H4gaNvN6iEKFW3Vo2MAzOvPKKbrlgptHSyp6mUVHxjMC1dSt1PCJw>
 <xme:-H4gaGeExl3viXa0XMqawiSYYxpwBaZgw8A0GuduVsi_c58Z7jHH2qlNh8pN9YvSM
 381J8FXyxM8diVvMQ>
X-ME-Received: <xmr:-H4gaAxCz6Duyxf2H5iEnRALpawtPgbSOlNPTaw_XGr6EtCBhVqiaG7EysMdwh6BerTkmAuGh6QUDulIBnG2qx82IvSG20o-bU-kIm7ZTODy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekudeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-H4gaENTiT1fBFP9nCes-wh-6cA8a-pdByI-dHhFAriR1YmmqG3HIQ>
 <xmx:-H4gaN9pTqypRSgl8t7cd04PmmcIQuQxj9Ufygi-79_63PAAtD3C5Q>
 <xmx:-H4gaEUK_Exn6gFav9Wfu2CiTKDLQ0nYcnKM6n9tVgM1UqRrvQD6QQ>
 <xmx:-H4gaOfuw_jLJWgliVjd7hz1NVut7TdGJDwJLHGhBHV-KypanSGC7w>
 <xmx:-X4gaNCnXC_gCBt30U4nUu1iGG5PS27M_5lzGt3joGJQ3vjPhuqr-6rO>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 06:41:54 -0400 (EDT)
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
Subject: [PATCH v10 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 11 May 2025 22:31:14 +1200
Message-ID: <20250511104042.24249-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
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

Add a display engine bus binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.

Changelog v9..v10:
- Remove maxItems, this was added in error to the bus binding (rather than the mixer binding) when it was split from the other bindings in an earlier revision.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..ea7ee89158c6 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-- 
2.49.0

