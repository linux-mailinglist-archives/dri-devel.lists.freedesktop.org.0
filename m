Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE397DCB2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 11:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D310E30E;
	Sat, 21 Sep 2024 09:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="sZPTYghP";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="HW2wqJ7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386D610E30E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 09:54:30 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 9C7801140248;
 Sat, 21 Sep 2024 05:54:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Sat, 21 Sep 2024 05:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1726912469; x=
 1726998869; bh=dEDyralYYaQn2QfQR2YuZ/xoXuzcrJFKzSdD+O92AAg=; b=s
 ZPTYghPuFNFqErU6az+cb+bGo/TSeHnba1uCsYXuWEB7XRS39r6eZDzJQZX+J5mA
 rHnJ1LHDj1CldRfXcxsXedPgiPGIpJ4N1IUV+kHjzNrr6i6RPJgKCWW2Ee0IDwPh
 2TnN+bZoiotF4yYcW+LNQTn3DEqQmHhfDfI041brzoZNDDKkPUmbueB3us6Rs0A8
 krzbhvkd+HiEDMZcCc1TKT+bIi3Tg+OeNfaaqdyOKxXOolt9X3N7IUwsgFXukiC0
 ivx0gJkHCaM8okdYO34pjYO8tOJNUySAVprW6iIcQ6JxANTqwwifheTPbx7lJu98
 pmn0b3Veyy36lZ4/EoJgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912469; x=
 1726998869; bh=dEDyralYYaQn2QfQR2YuZ/xoXuzcrJFKzSdD+O92AAg=; b=H
 W2wqJ7royn4l52rnK+JH/97Ni1aS6JPn3HEl8HJfGOdSCue3Ya94qeTHYt3ypFQP
 nOhrVXGw/UAyadz6mPqwAOBAlTvEAGkGsQnZoR9KGkeiCRz8ibLQ3k28fP8X1Wxp
 oV1oRNZ0VoT3fg82HbF0aBZ7QTu1jAnjf5bm9oI09LZPcehlWTyox8DrdC5Quwqq
 NnSIaE/ZiKB/EZJh4rQbjPxJmu/Nk0S1tPqtQeDfOXITaXbTOKdJOsghD8qo8tKp
 wHlgDQOGjJzLLx0hIECeachfz6SA/2azjuSAUlTOqHd0cPM0H0qJdDcnHR2TODxi
 FWeu1Pptc4S1gouSJ8QKQ==
X-ME-Sender: <xms:1ZfuZgenpcghNjq0rU2Ve6BT3kxkIvjdqnX1EG1HrOaDS4p_Jbnf4w>
 <xme:1ZfuZiOEApfBwwrqWoiG0ZU6BJ1_P6ZqI0dY1r6oXTbMUskt4-jB4ioT9D_HnFYnG
 p7gINoydrW7SltyZA>
X-ME-Received: <xmr:1ZfuZhgNbrCdJKck4MRl30wcAvmNhvAsGjsRvjUcblqWtDArD7F0trfGs1nRX-vpwQzHafsu3kYKqXcUBf_zN4blxy337o97vtQ7RQ9XvYLF1L1j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
 ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
 gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
 ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
 thhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
 thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
 homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
 hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
 htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1ZfuZl-PoiUx9il2ZJs0A6UwnyEhV_TdkxuZzy-o6q7GwvJBQIFOeg>
 <xmx:1ZfuZssp3tzVWYil4E-T_ltJV-KbhZPpwFuLUx_DwNEqoMy8lrRTzw>
 <xmx:1ZfuZsHJLrbcFfZHMJUvJdkFWdCMsKePpOplAOXVA9R0EZV-MqMWqg>
 <xmx:1ZfuZrPeuGnouHhwEClWafAmX4Go9oIvpKjmUpHvWHYDTWACdDtMFw>
 <xmx:1ZfuZptBw0HKa16LCoi8H-GglCHGVirpNlifqMH2eLAIIvnQ94otf3TQ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:54:23 -0400 (EDT)
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
Subject: [PATCH v4 20/26] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Sat, 21 Sep 2024 21:46:09 +1200
Message-ID: <20240921095153.213568-21-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
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
2.46.1

