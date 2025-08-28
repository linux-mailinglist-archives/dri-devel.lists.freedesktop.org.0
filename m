Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40664B3A0CC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6672D10E9CB;
	Thu, 28 Aug 2025 14:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="EXtsGfrs";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dq4irUT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125E10E04D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:15 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.phl.internal (Postfix) with ESMTP id F251C1380D6A;
 Thu, 28 Aug 2025 10:02:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 10:02:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389729;
 x=1756396929; bh=MBTlA9bf6H9BekSPgiPJC5QPw8jLl5cUkv029KRZOCU=; b=
 EXtsGfrsYeCJpkHMG6aFDAOlwR+gNVV5DUSHlOA/im72gO1GF9QlzzcNjmS/B/RP
 DYEF+anLaMLGXPFbmaRR7AWGtApdgLG1N0xc4Q9XhSyAts+9nvGBAKcLIAqENH/8
 ZpF9ukz2q85s6q0I504FbzhKQTZU43MX+c/eq4ANIUhvXezPpfaMps8mO+KsRneG
 gkMavC7tyTxMHqONpWBdkJqotpLC4Yi62xf4D89IyAUnKeqeci4/3ay35SbkPW4H
 82RKNajBptb0hS1YTXtURIt5mZvr56l34Em+rbwoBg+DgZKkhtmbtF9FfnjlxIW0
 4wWsD11UJzwYYNfZUgrA1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389729; x=
 1756396929; bh=MBTlA9bf6H9BekSPgiPJC5QPw8jLl5cUkv029KRZOCU=; b=D
 q4irUT/C6ZmNtxzqptwA6OayqhTAxWB7qcZEwxniH7jsL+y8AUFqRWI1O5nIJyyj
 hRI5opNUvJm5OQeU1w5ax9qQW5FxvUhy5NgXfM0eIPJ6g1UUlXXaL2eeUicYzjMx
 vF1Tc2np9g+SStfSjIP4Kme/DPLD9Df3tzuS62cYcVXrzPb2tmIxfhJ7qbqSS5lS
 Zu7jnmfMSOnkzTar/70eveHlKtPAbYnjr+r4R9CI7WajhJGpIHAkpOGusGzPMDfQ
 jaE8HOap5wL+YSVKvoXrMSz9RRCawTH+fGjmY13+CRWV33QZxj2FNvXxeZrYRZO+
 gh3GHdWgF66KVzP+JVElQ==
X-ME-Sender: <xms:YWGwaCEsY1F7t6PZBszYNS2BlioExBoQrqef0KDuiLMrMou5O7pmaA>
 <xme:YWGwaKxTb0Bk_xQ34a9XQhFSyGquHc6NvvYgWYTVLzlU2QBkMdPJee7AOYn2xrg4c
 kPdoszRZGycCnpqCo4>
X-ME-Received: <xmr:YWGwaFE06hByE8IsNfzUajzzqQKmBE5jLF_OfXo-j3zaGhGN5u6KtRvsgG3uuNV5qfoTy3gF6fXAZDQZmdIs1aeM_3xeiZzrnyG-nA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
 ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
 mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
 ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
 ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
 hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
 gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
 gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YWGwaHCHWISot8L8BS-q_vcrxfZjyVjMCSSwiMuV47GKGnJhMCtSVw>
 <xmx:YWGwaHm9-t0Pe5DIIx2LIXxMtsVJQ0rzTioUfSziBvrKX_IZBnSE_w>
 <xmx:YWGwaBp-xcc7LpO5GOeQ1WGAgseHtjB9yIIPpUy_0HSeJCmUFIAObA>
 <xmx:YWGwaB6Axf80E-f1rgBG2VJVpv8quT2S67XmrYVUZg51T6yM98AcEg>
 <xmx:YWGwaGyPTEo_JrymHwwWw68Af06-0wFZo3q-OX8si-i1xNUamlks9GI3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:07 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:29 +0200
Subject: [PATCH 10/37] dt-bindings: i2c: apple,i2c: Add apple,t6020-i2c
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-10-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=mInquFHKr71yLfuiC0RFAihJsABUBSqTyun36GQrCzw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiRY18ZV6az4EPfR7qtzx6XtXlajtJpNHZrdfMyxn3
 XS9cvKpjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABOxiWP4X9z5OFRj1oqfQU/c
 NRlVd8b/WfHxm+Ln6Y/Vy3O+FUwKk2VkeMT6WFDSUsTkx/G4L78dfyl3Hi5ZUpOXsf/A03MnfXL
 K2QA=
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
lists with the generic compatible "apple,i2c" anymore [1]. Use
"apple,t8103-i2c" as fallback compatible as it is the SoC the driver
and bindings were written for.

This block is compatible with t8103, so just add the new per-SoC
compatible using apple,t8103-i2c as base.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/i2c/apple,i2c.yaml         | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index fed3e1b8c43f67b8f5a19e5c1e046b0e17ab8017..500a965bdb7a84e4997b52e8c19dcc1a7ee0cff7 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -20,17 +20,22 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,s5l8960x-i2c
-          - apple,t7000-i2c
-          - apple,s8000-i2c
-          - apple,t8010-i2c
-          - apple,t8015-i2c
-          - apple,t8103-i2c
-          - apple,t8112-i2c
-          - apple,t6000-i2c
-      - const: apple,i2c
+    oneOf:
+      - items:
+          - const: apple,t6020-i2c
+          - const: apple,t8103-i2c
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,s5l8960x-i2c
+              - apple,t7000-i2c
+              - apple,s8000-i2c
+              - apple,t8010-i2c
+              - apple,t8015-i2c
+              - apple,t8103-i2c
+              - apple,t8112-i2c
+              - apple,t6000-i2c
+          - const: apple,i2c
 
   reg:
     maxItems: 1

-- 
2.51.0

