Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4263A372F8
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2950410E27F;
	Sun, 16 Feb 2025 09:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="oElcBui2";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ANWtG75V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CDE10E289
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:07:43 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 4E5531140132;
 Sun, 16 Feb 2025 03:58:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 03:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696293; x=
 1739782693; bh=BJw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=o
 ElcBui24Qlq2zx1oSgK3qwLOp7MFxqRmhvRIfR4timFnM2HIqEp9S1yZOnljq5zc
 2tvgX+a61XcrmAguZBeSXAtyJWJ2S72PKA3VomOSl5VnxIhMKPQmUSs/2XjKZy1q
 1sOwQi1D0rNDwPWJ45FLIDQIf4Od4okxHBAdPISYrvNOOPPIkfZYm7TYotxYWNG1
 0s+0LQeBOnR6hxsx1qFsxfm0hA9QoszkmWzNelvEaCYEj57WWY5S8xxbAUePlcYH
 UTauxz3M+ejqnEAa0Et1rOnCNzhz1ddvO23OTs3d2u96VklhaG0VmEq6dn1ePLk8
 ZHFUtmwjOLt4fOwZFoa1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696293; x=1739782693; bh=B
 Jw/apkD9aGn51IELkXxp/idESG6pC1H6gAPScSoptk=; b=ANWtG75VbxqB/5Wma
 VP/rdeBJIztZ3uS2rBkTMyF/L8dM1fOhjSdH/hiuGJPbQH1pZcbVFyEMExmEb6L7
 RSL62FFacTP8Em8WDb1T4xEW4CtYUEZThMysUmloTlusnY6BRJP5VoH3NFvpmAYk
 jKnHFnLwRVM3RK5LfmMk5gsSP+YK9Fz6OvT85Ko2RFuXJaKyHyJ3qjNQYNzIkYWy
 jTYhq/jXig15tpfyXwhf4PMQaCt3nhxY51TYoInCLbuyxAJFnQ54l8HS3BC4oP1f
 3HePJDZ8495fLMRK9I7GV8wDtCEHK7D4h/7gqKry2FmRnuqkGS7fIiunm1c6AGpr
 4uyzg==
X-ME-Sender: <xms:paixZ_qr2QTAm8i2p4q73N7NZXi7cCkfCfkFCXbsd_MfIQ9xaoki0w>
 <xme:paixZ5rxnj--Za1-M7LLZom9ir3fXK9j-fp45ugPlzLpNaQztP6DiJnac3HhNTMtF
 u2y_iNiMn_LEtcHfw>
X-ME-Received: <xmr:paixZ8OSFSG_abclg50PFXJjCKN1q_SbRu701aNA4Cn8-hasIIJnkXlIH3oinFZaEqhV_k3l54oBzNRK8RSFlSQIyDihOsHpRLLax_3LBGLq>
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
X-ME-Proxy: <xmx:paixZy4bsiKKDncRFzXMqtSB2yo8onRytPz58JUpMsUM27q25Sf6HQ>
 <xmx:paixZ-6q7Pi28wEBwNkTqAJ6RH8X2_DVUbdK6EbBKttH1-548uLucA>
 <xmx:paixZ6g3pRZgJ8Xjshw965bHQLKMojtB0RXnWZqKBbdjLu1a4Etl6Q>
 <xmx:paixZw4014UsUfzebGjfbvFhHCiOI6D56QA4QKJMynDI3IMQlyh7aQ>
 <xmx:paixZxzQ1AlfKIplLF0MQeYb3Eh9bk9VfZid3pg2482pjTUeDSSy91Rs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:06 -0500 (EST)
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
Subject: [PATCH v6 20/27] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Sun, 16 Feb 2025 21:50:51 +1300
Message-ID: <20250216085432.6373-22-ryan@testtoast.com>
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
index 9845a187bdf65..317a27cf590b3 100644
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

