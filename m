Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A104A58F76
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027D410E3CC;
	Mon, 10 Mar 2025 09:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="M+hRD7/n";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hbJqzDrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C1010E3CD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:24:45 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D94DD1140122;
 Mon, 10 Mar 2025 05:24:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Mon, 10 Mar 2025 05:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm1; t=1741598684; x=
 1741685084; bh=8KEUvLMaOF4POftDLbh7R+xk1UpszEm4+C2tEKJCjZM=; b=M
 +hRD7/n6wdfjuh7xGKS3jCiZ808HsEkTI8zX+ZcZpyen74u7rwgngM53Q9LFuMIg
 4RSA8KGD5jXkHTBrHYFFzv3j7fPUaz2YGM+N8if9Tbq1u7TBzFoxvRvqijPjTRKO
 aLO8+u7l/l84Jz7oakj8VcV7rk+CWojDsMzNSQUGjYWeNDxnBU21JLzXt+Sf5SFF
 WonlCweXao70jLOjondQyqelRT7aQSFHJN1/qkUEhSoqhQeoD9kjrSP4FwJbyncv
 tlq9RgkJoiI7hEzS2cfvLnGeX7DNngcSr+wFhYMFkC4lW2nFLb7zpnQJUT/Ru1ph
 9PIA900tEJoMLZKxpoc3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1741598684; x=1741685084; bh=8
 KEUvLMaOF4POftDLbh7R+xk1UpszEm4+C2tEKJCjZM=; b=hbJqzDrTvgJRWfu1x
 wUDTvfVXSTJzq0AN4edM04NOiqTUyghcdWuFj3rfpc4H2T5ZRszyn522pJTr6FYA
 GBgpkjwHU6u1Bn6QpaYbnmWS1kxkSVbroFXJWrEXjZ7RUE9Y9ZGyhwcw3mGf3AFi
 ZtLN8WUkBtz8VW3KxRGJmIJKy9zKyKyngC3qM/oXYcTMORe4EAXSr9bXQXhKjowX
 R+zXsg0ot5elJJ7bNWSRrHsHYnBveLSq5uxisGf1D2JawIgCbrcanGP+PQqmq77c
 e46HEWrYsdHWDx08U7a18S3ZnrgYkMzu/eRfyrRmGvtxOmVKgavgZYmsCY6Y7OC/
 Ii/2Q==
X-ME-Sender: <xms:3K_OZ8KTeujkBlMFm_DIxzkivuavLek-5SPVas1MFU18I0ZGjV4KYg>
 <xme:3K_OZ8JRv9clWu1Q2B3avb5KEwgF1wfF5g-wGBOCPgp4zgvkLonZNH3bUzi4x1ahE
 QCzhA2BUHq_cER3rg>
X-ME-Received: <xmr:3K_OZ8tzIlL30uJ82lT5tkJKYIV0jw6JnkdmaoB-PkKe_8-SIPjFvJakVAcov-7KGByEmtc4_qnu3q6JGM6KH_Oabfys-rRkyax12bzkde7Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekleekucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
 htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
 keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
 tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
 gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
 tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
 drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
 thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
 esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
 gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3K_OZ5Ybu_rt4sbpS0a0lyowIjf3AWRWJBnTNMhxgFWOsiUqpit3uQ>
 <xmx:3K_OZzZH_5rPpQ2Bp-bwd7EbBqps6Ii03wkd_rfdoghRHW5Y8N3vmw>
 <xmx:3K_OZ1ByWlMv7KA_uqCUkEjZbLD7ev4DLi2JI1Kd3sJMfFXjJPvXQQ>
 <xmx:3K_OZ5YdlPTZFR2JdHoLscyRJmRyodaj4xd14i9rrzbT4YWzDG63Ig>
 <xmx:3K_OZ4QkrgoE4ct1J5jHUag7VQs7pPSu5F-KNEzwW_TVCxJVO_Po1aSe>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 05:24:37 -0400 (EDT)
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
Subject: [PATCH v8 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Mon, 10 Mar 2025 22:09:51 +1300
Message-ID: <20250310092345.31708-6-ryan@testtoast.com>
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

Add a display engine bus binding for the DE33 and increase reg maxItems
to 3 to accommodate additional register blocks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..317a27cf590b 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,11 +24,14 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   allwinner,sram:
     description:
-- 
2.48.1

