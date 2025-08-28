Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835CDB3A0D2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC7D10E9D0;
	Thu, 28 Aug 2025 14:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="T8P6eJEd";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ktpHhLio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5110E9D0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:16 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id DFB7E1380D69;
 Thu, 28 Aug 2025 10:02:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Thu, 28 Aug 2025 10:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389726;
 x=1756396926; bh=Nb4trnMSm8TGPxR4zQ7deJPXuZqG4DeNFaJrpNc7mFs=; b=
 T8P6eJEdDCFE5f/HQgMOVD3ump5mRpzbiBFcrO2cuJdxhyNZmUHUoSOIL5gAreMK
 63Yq3Xuaj27foBbkhL3Fh73riBIy+TsxVjIORpfFUiyNtYo7g5GoIEGNxM5V7iff
 IUufu897sPC1gwBDUHNH+bpB0lKVyNng/z6GhvQlR0ISxaAy84h/YSAp3hkNNUWo
 1j6+IQcSejmbYevyrVfiiNcwx6R98iJ0kkDl/kk0R0bb2cHz3lqdzT6Wmtmh9GlZ
 iH52z+kHaTxWpybNbZoNUgus/QP/WaNe+pWHOYXrKF+vjhg0CZbUTyMs64D4O+9X
 Sj49x1wzAAfR/NO+rl6+9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389726; x=
 1756396926; bh=Nb4trnMSm8TGPxR4zQ7deJPXuZqG4DeNFaJrpNc7mFs=; b=k
 tpHhLioDV0I27AE028XcZnz8CFX8yktVwM+Y2bewLUwMVrxqU/T/epESj18Z/3yV
 OhDJZXm4MorjKZmODmxC9NENYoLYxfrqJKeQUWTwEn6Js1bBu8ihgZFZSOZrKwwF
 XI5ZwQUzkl3DZK1+/kQsCDNhT+XAO5r/nx4Br5i9sglc0qLCZdPSiCZ0p3/LjBjY
 jHLFpsRnmSOPbMelSo92wcbSuAJ4eHksXNKosd30eJSc4sw7UqfCFArdpeOSQl07
 0nnny/ladcmJBI5dOpUxbW7zAFD5ktmAnWburQMwm8yTSX5PZzYYodFFgQbQO9hn
 27l5mvOFQ6KDvlrx/Angw==
X-ME-Sender: <xms:XmGwaGbAsYWKJkAfLmPJcw_20aDgJIz92HtRZnx15HmoIzJdkTLkkw>
 <xme:XmGwaA1ztqRCxpTeS4PsX4vSKEgLvaVeC8oair7kAhY-InS88z1NmEqISUO4_hOfn
 6PXAQa5i_-9yNKGbSU>
X-ME-Received: <xmr:XmGwaJ62z7TpUolCOKucfwOCRENOgEbN3cOjCccjhboo9lztp_PUxkCqEkrzVhaCOCWlAQpvp7GaNsjnuJfi6J_es0XSf_ONn8R3bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
 ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
 mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
 ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
 ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
 hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
 gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
 gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:XmGwaDkwHmUo6tJbpzq_1liTzJSCyCsEnItYCICV_4JKbANy2iM1YA>
 <xmx:XmGwaA4xFA9qjXv_yvlnTbeI12ZDnTzMPQPDo7h8Aewp201Bbb8nDQ>
 <xmx:XmGwaIuSz1CFrNYqS0gvYEv-Zg4XeL7F2Vb5_CGZlV9uaH6Yn_z8hQ>
 <xmx:XmGwaDu6mT21re_h7Uf_FepJ0rzrmdCPlumcKYTaP2XqjZr6zlsdkg>
 <xmx:XmGwaP02_rRG9F44QhKv5H__M_a8_YcohStN_TD5pDwIepkB9ccvLvOC>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:05 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:28 +0200
Subject: [PATCH 09/37] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t6020-pinctrl compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-9-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=XWF5pr8WY9xbf4tj8dh/0ec6hk5fhKera/8T4j7mtt0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiRYv4j4sCFN6P12T055tdcsJ+xnRR803zl6wOpfj2
 B975zixjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNRUmJkmOy6nyN24d5dtff5
 ut5ov5jtbnf464feJjbHdMeovK7PnxkZtm+5NqVo27beRMfUCa6+7xdZ54ZE8G7p37A+zD5nr6A
 mKwA=
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
lists with the generic compatible "apple,pinctrl" anymore [1]. Use
"apple,t8103-pinctrl" as fallback compatible as it is the SoC the driver
and bindings were written for.

The M2 Pro/Max/Ultra SoCs use the same pinctrl hardware, so just add its
per-SoC compatible using the new base as fallback.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 63737d8589442953a77e3bbab08f8b59990fb33c..665ec79a69f1db1020668c68ecbb7e215cb7cb28 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -16,17 +16,22 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,s5l8960x-pinctrl
-          - apple,t7000-pinctrl
-          - apple,s8000-pinctrl
-          - apple,t8010-pinctrl
-          - apple,t8015-pinctrl
-          - apple,t8103-pinctrl
-          - apple,t8112-pinctrl
-          - apple,t6000-pinctrl
-      - const: apple,pinctrl
+    oneOf:
+      - items:
+          - const: apple,t6020-pinctrl
+          - const: apple,t8103-pinctrl
+      - items:
+          # Do not add additional SoC to this list.
+          - enum:
+              - apple,s5l8960x-pinctrl
+              - apple,t7000-pinctrl
+              - apple,s8000-pinctrl
+              - apple,t8010-pinctrl
+              - apple,t8015-pinctrl
+              - apple,t8103-pinctrl
+              - apple,t8112-pinctrl
+              - apple,t6000-pinctrl
+          - const: apple,pinctrl
 
   reg:
     maxItems: 1

-- 
2.51.0

