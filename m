Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A67B3A045
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F93910E9B9;
	Thu, 28 Aug 2025 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="ZJVV+dq/";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="YHOfFh1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3400510E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:11:15 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailflow.phl.internal (Postfix) with ESMTP id 2FB3D1380D6F;
 Thu, 28 Aug 2025 10:02:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 28 Aug 2025 10:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389721;
 x=1756396921; bh=4eUp0LkGYH8zL5culQFPCa/6LxhZErHa8BCWIC4IUjk=; b=
 ZJVV+dq/O8Z+pUv7IVqW84m/iHGdo+Y/ZmCB3CFVfDrMn/6kn3ck4i10cZA8LZBu
 4Tt3D+kQ3T1SOaU7waeen2G7yH0ot6XABg5Kkz9jaXIMXQTm3gTUHsZQbN2NKHxG
 VGPxIW0jA8DPJhV2wZz2JZWxvL+6Y0025UFg4JP1eYaVnunE1vhQoCbMhdVW+ii4
 kK7J3Dlp9VYhQo4PGnlMQUViAklMq1cTcQqQT53eFJ0Xc7bBOzcuhxFcomdDd3o5
 TG3yULqQE6bdCL4DFNVodHyBGtN2NJMTsBIsfSFP83a7Os3VHd1Qvh/3WgFxbrWp
 /JbcaM45jlRFyq9+/YQUvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389721; x=
 1756396921; bh=4eUp0LkGYH8zL5culQFPCa/6LxhZErHa8BCWIC4IUjk=; b=Y
 HOfFh1GZM5rLtrG83dSrIoP/kMI2oYz/Caxv7TT6HUg3IaL4fCmEd+JZn206wlKo
 uzXGvsRJnziAN/zU1oXH6KQjxSdz3gDDWHOlpP71JOGbN/kiGcoNwiPrvk8Xe5IT
 rGozy08hdYL7s3w5UYWfxYCYFIerF0zuxw0Q9r90a696ZFRk4hpRMtdF9awsVlM9
 Og7DkScWJcKCUjKCWAWRDkHWrKNJu228jh83G3baGd1cE4tpqA6Aq70NnzfWnxqK
 JCHOja5G/7Qi339qJ4StpY37+n9cauaQQmBLP/4lJAsXA5DDssOasRFhLIcX5RUF
 g67pYmwiqnnV/1EyySuKw==
X-ME-Sender: <xms:WGGwaD2M46u8tkzK7vSUmdv5Aw9b7a4aq1Rwha26AeaGeKMJtOafvA>
 <xme:WGGwaA6Q5B_H9e_ZzQtm59tZ0BSvKeMWN4twBitPClfzOBs5QsuLvSby_DnaL7pbC
 w-EbNKK54mc-7tJyKY>
X-ME-Received: <xmr:WGGwaOlkmUs8aMLcJ6BIR3Zew4UScuSRvHqKiwLV7zi_4uhEmDE6LFyE4QUEWKKNyBACoNldJR1qOnYAKmQPke_wyLHP5G9HfzikCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:WGGwaP6_HxVgfZRG4s0defM9QZffnKi2YCngNpYzx9ujWgM-h1FCXA>
 <xmx:WGGwaLsOZysCFDHpCo2ss46gBUJtjX6Ckw2HTBtlYAowcZnNbkep7A>
 <xmx:WGGwaKu67IWsMR5PXoAl6HT51EhW4zOfSLnq9M6m5dQuNu13VFRItQ>
 <xmx:WGGwaI6gERx6jx2juFhUPI14D_EeXDtzNT379lH6CiwAMe9-NSy9GA>
 <xmx:WWGwaMYvFkxVviJx67qVle7BbR3T1SNfQ3r5qUCPph4nnAQqMkg2xL2T>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:59 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:26 +0200
Subject: [PATCH 07/37] dt-bindings: iommu: dart: Add apple,t6020-dart
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-7-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=2yoEK5G7rSrteIzmeRbS6577DmwK9Iz3UN7TILmcPiM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiRYyT9YbneO57nvEovy32GSJ8hLb3Tum9qZeCLe3Y
 Zrf9WhVRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkclmf4K7jke6mr4lLBn06X
 KjQvMR48a8ff4TXlmOSDP3NVWzpcsxkZuhJeFj1ZFF1SbGlvt+D+aYaEtyotKt8bXk2dqblbQH0
 5MwA=
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

t6020-dart is compatible to t8110-dart and annotated as such in Apple's
device tree. Add its per-SoC compatible in case t6020 specific handling
becomes necessary. The dart instances on M2 Pro/Max/Ultra based SoCs
differ in one aspect from the M2 based ones. They indicate an IAS of 42
requiring implementing support for a fouth page table level in the dart
driver and its io-pgtable [1].

[1]: https://lore.kernel.org/asahi/20250821-apple-dart-4levels-v2-0-e39af79daa37@jannau.net/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/iommu/apple,dart.yaml | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/apple,dart.yaml b/Documentation/devicetree/bindings/iommu/apple,dart.yaml
index 7adb1de455a5b38dfb6c76303f11c8f95395e0dd..47ec7fa52c3ac6b3e111adf6998685f18f8602dd 100644
--- a/Documentation/devicetree/bindings/iommu/apple,dart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,dart.yaml
@@ -22,11 +22,15 @@ description: |+
 
 properties:
   compatible:
-    enum:
-      - apple,t8103-dart
-      - apple,t8103-usb4-dart
-      - apple,t8110-dart
-      - apple,t6000-dart
+    oneOf:
+      - enum:
+          - apple,t8103-dart
+          - apple,t8103-usb4-dart
+          - apple,t8110-dart
+          - apple,t6000-dart
+      - items:
+          - const: apple,t6020-dart
+          - const: apple,t8110-dart
 
   reg:
     maxItems: 1

-- 
2.51.0

