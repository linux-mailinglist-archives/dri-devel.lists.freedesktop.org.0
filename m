Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E0B0B471
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 11:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59510E1A8;
	Sun, 20 Jul 2025 09:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="SV5nWdMg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="brCWYQyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B47110E17E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 09:01:10 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id E79461D0013D;
 Sun, 20 Jul 2025 04:51:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 20 Jul 2025 04:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1753001485; x=
 1753087885; bh=bhw2ewrAOF+6/14Z8vcFUEVAZhS4P7T9BPyZIX21AVU=; b=S
 V5nWdMg8nJ86MWTl3UfObR8Q/l2vdPIx6sN4CMQcaIeQ1WUbIS3f7Hzd0F14fqkw
 QQdAp146U5ntypv/YmX7pXfTfB4/0uX0YUUoOeo58PFXuZ/O0B2KslMeO/pKEdQ/
 MDAz6Ig8Knrm0V9HPHZ3vBFTq9Zf/DRjcMV8ncNt/r7gklZ9/PNjALIoIJW8zYoX
 g6B/s8HGoN0GJc4MRyQvjZxQ7w1NNjsEKye6tXC2c5hfEgywIWuNJeN9OzXMdhDp
 LPYeoguvLhXriLOxqoQvO1s277PGZpzKbylSEH1+Hd23oBtIZGS4pYvwacusJ9Dk
 N+GyEOfrobMhmcAhp9wlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1753001485; x=1753087885; bh=b
 hw2ewrAOF+6/14Z8vcFUEVAZhS4P7T9BPyZIX21AVU=; b=brCWYQyLLvQSqWD4C
 BMVn2wPMiB2zWF4L5dFZ6ras5PrhXp5uF9P3GfBEQzsD/E9XIECsgHvf7fHmvC4V
 GnhGDvB2dvWPv9kmVGL2aj3z0oBzq2PVcYsKNVa4SJVgLgz0VMlIVzWxkfhXDPE1
 C4s7JkKd9leBIfcplGGwzvu8LOx//tM/61VGtgjgoVYpUMyh4fH17GJKWgc5L8Ij
 /lk7XfTcnAwRYr5oosjsIXQXcz4qpP9YqLz8YLA4WwpfaeL1GJx7aYM7Cz8SUOK5
 osCHr5wXncZ/YfkQSLrw/88wHWxSAlPS1gvVUkRFBUZF5pgzSZwmyQN39pSYTlzN
 P3rIw==
X-ME-Sender: <xms:Da58aJBogR5BXCBXsTVxIK6MoIQn7u9LDP90-pZa5uIx466qNW-kIg>
 <xme:Da58aCYBx_vPx-eI4wPkgRYtdN-7kCDtNZGI_0BBfHT7CiBsxSugSRfb_qYk5T2SF
 1gCxSe-nibbhLWH4w>
X-ME-Received: <xmr:Da58aOzsMdPbjCldiTuvBF87yGRnmady1RTDHgqrazQ1wEr-ptOJP5jYGRmPAInksXuc6wFAhQN_wfxt_xWQka4lOPar6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
 lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
 hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
 hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
 theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
 gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
 thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
 kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
 hlrdgtohhm
X-ME-Proxy: <xmx:Da58aFcmrahDsfz-Bu24NfImZ28gP85f88VFqDYlcV-k0mFZjht_Lw>
 <xmx:Da58aEL7l2gLbInWtHp2XcA5qZomSPyT4dJu7wwoDiZytKAX7qfu-w>
 <xmx:Da58aO1M-M-_0lOmbo89FqjtQ4HNCWRBX9Rzi0B-B2nX6_4o61vnUg>
 <xmx:Da58aNZ4078qNEneu7z4i8qehIvYuCqmxFFP-5Mb2ZOHCiA9WU1sFw>
 <xmx:Da58aK8CGVoy-A8FjXiW3vWb2y2Ov9I7Uf7Vmc0e4cFg5CGJS14J3EAT>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:21 -0400 (EDT)
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
 dri-devel@lists.freedesktop.org, Ryan Walklin <ryan@testtoast.com>,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 03/12] dt-bindings: display: sun4i: Add compatible strings
 for H616 DE
Date: Sun, 20 Jul 2025 20:48:41 +1200
Message-ID: <20250720085047.5340-4-ryan@testtoast.com>
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

Add compatible strings for allwinner,sun50i-h616-display-engine. The
device is functionally identical to the
allwinner,sun50i-h6-display-engine. This is added as a new device rather
than a fallback as all other DEs are modelled this way, and the device
is essentially "virtual", with the relevant functional differences
represented in the mixer and TCON components.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- DE compatible added for H616
---
 .../bindings/display/allwinner,sun4i-a10-display-engine.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..117426862430 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -65,6 +65,7 @@ properties:
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
       - allwinner,sun50i-h6-display-engine
+      - allwinner,sun50i-h616-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.50.1

