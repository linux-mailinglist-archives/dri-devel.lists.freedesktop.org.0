Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E23B3A0E5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35FB10E9E4;
	Thu, 28 Aug 2025 14:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="XVx2JXVs";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="M9B1JpB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD19210E9D1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:16 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.phl.internal (Postfix) with ESMTP id 7B5D61380DDF;
 Thu, 28 Aug 2025 10:02:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 10:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389768;
 x=1756396968; bh=Du2NKwG5kjMYapHOMS4ErXJWLOLHI7y0mRPWnckCGRc=; b=
 XVx2JXVslCNQrTUX6rMoc1H7c2pxiOBr/8LPm6wIqOKxdCv+QHmPBNgrMYh95Z5U
 K4cBQMGovl4oSnILs6zNdv5tK3jFUXDTRrIhe1g50zbzNxszK7wNkq5ob4HPAnY0
 b03g0A22gjONulPBYxXi806CEXZsIMiX8zs16Avq9/r2J1C+AwPNGDNVeemRDJv8
 2jssWp87a4zz506RU4OrbroPa/RDkd8KboIjDADAUmkZ72wVRfVvubQNwnWDUuzj
 Z/pirRclbwhBbqe34B3wuMiAWJIWSUvYGKxhAjupElveZ2tT1KkAwQldPzsGqXf5
 ZlySZzbaf0UzDQF2uHnWLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389768; x=
 1756396968; bh=Du2NKwG5kjMYapHOMS4ErXJWLOLHI7y0mRPWnckCGRc=; b=M
 9B1JpB0tfJ1T56e1NRwnWbkXUmlcBKGZH4+xdITs4w/cImWR8iyg1Xmg3j0zUZPB
 WtePFO9bBaV3rgBB1hGDt9vWt6pydPsdKDmDXmisO4Yor5Ag8CxaR2D+sJniNSkv
 zy5ukD/RxczA06gBH8B+9e4juyaAX/dwFF7hXwB9GFpXixdyrH5OXdM9RjhFQb3E
 UNJphIXK2geZIbuV0Hh8BtuMJRHW9l8m4rnhvOU9Ik7N0k0whKdr9ayV5nqtJvBA
 BfkTPjvnnySiRGEUpk6HKrVXukWHPsl2bXUg4rCovGCgiYq0jQ812KW6A4R89Ioa
 RnueoScCE5BsvW+88LKTw==
X-ME-Sender: <xms:h2GwaAQ4MbLkyoZi9f0lO1GdMb4vPLLSekvjTpZ_jMfO2C3JRdoKlw>
 <xme:h2GwaMl9v4ShPl11JvqRTZXyWLi-vxJOl8dSwRxIpKJoZNR4hRjMrFR2hwsOUoJCl
 sODnC-bFXg7nKKLTis>
X-ME-Received: <xmr:h2GwaIifykCToSnYn8qw43gKpf837ce99C2vu6T8dDmnGnJYDI57fN1D7X2kcNIpbqm9SB4V3UDbwW4OS1sBmqNFpqWGBtNeh8Lbjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
 ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
 mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
 ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
 ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
 hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
 gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
 gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:h2GwaLGPVKIKQkx1jsX_5SRtkyw-LqoFRPZ39xXJjyOfF4C0uZLVGA>
 <xmx:h2GwaPJPgnCkyL21NymVJSXi1zUPu5YO6XiN2reFMTUfH4B929XGZA>
 <xmx:h2GwaBbp0j-Jas6AvKviCk3p9Fp_oS9ioMRcivi0SphoQqvxs362cg>
 <xmx:h2GwaB2Ga6XeWUNvtrJOZKcxFnC9d_x1pKdMHpavHztJBv9iZtWjog>
 <xmx:iGGwaG5Xw12NZGk-ViJ0x2NWqhdr93bxXtmPBuMfv4b-L4KcIh0EKMi->
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:46 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:43 +0200
Subject: [PATCH 24/37] dt-bindings: watchdog: apple,wdt: Add t6020-wdt
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-24-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>,  Lee Jones <lee@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=ykPAcrH7nH5stpCWnGizSLioWRUE/N+dbccnuhE6jU4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVa3tMJLl0+1OZ/j/LDzZME5F7n/Z841PWcWM3LT4
 n25aL5tRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlM4GD4Z1Giqb1S+v2NDXJH
 yy8dMMtfFTrdOlH5nbfDbo4iyb6wRIb/Pt7bcg+f5JNyXn+xYMH10DC7+B9tZq83XNolrtTw1us
 6GwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,wdt" anymore [1]. Use
"apple,t8103-wdt" as base compatible as it is the SoC the driver and
bindings were written for.

The block on the Apple M2 Pro/Max/Ultra SoCs is compatible with the
existing driver so add its per-SoC compatible.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/watchdog/apple,wdt.yaml    | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 310832fa8c2803d463148954ed30795b11d97cb2..05602678c070d764331795f6df91abbc55eb0f2a 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -14,17 +14,22 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,s5l8960x-wdt
-          - apple,t7000-wdt
-          - apple,s8000-wdt
-          - apple,t8010-wdt
-          - apple,t8015-wdt
-          - apple,t8103-wdt
-          - apple,t8112-wdt
-          - apple,t6000-wdt
-      - const: apple,wdt
+    oneOf:
+      - items:
+          - const: apple,t6020-wdt
+          - const: apple,t8103-wdt
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,s5l8960x-wdt
+              - apple,t7000-wdt
+              - apple,s8000-wdt
+              - apple,t8010-wdt
+              - apple,t8015-wdt
+              - apple,t8103-wdt
+              - apple,t8112-wdt
+              - apple,t6000-wdt
+          - const: apple,wdt
 
   reg:
     maxItems: 1

-- 
2.51.0

