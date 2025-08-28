Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2BB3A0D7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83E910E9D8;
	Thu, 28 Aug 2025 14:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="QSfGsLBu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fliw0l3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E610E9CA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:15 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.phl.internal (Postfix) with ESMTP id 54F7A1380DAE;
 Thu, 28 Aug 2025 10:02:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 28 Aug 2025 10:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389744;
 x=1756396944; bh=M2iMoMuWKPileIoEWnr4HEQnopXO/M4SnWfH9o37EXQ=; b=
 QSfGsLBuIU0Ijiytjx3wkb7VeSHz6D9gp/eXBqB8EQFItQq9jBNJc3OSYab6o4eP
 uum6CtK5joRGiXx09nzSMeub5NOQeJVriHMRxDFswX3VCwi3D5tbsyE4uWmgovr7
 ENyPJTZNIXXVcgyOaC/S7UFKImcdUuMjx7THqDOAxA+Us5WyrP0xFnroCDjZIQdo
 b6K6/meSm/RdkShe7o2+OD+JOhBF+iaI2tpOyBWQ+W+GE8O2LE051sJpLsmjrHlA
 3IaoBkYTCwQFBvu5OTUIH0sj4/u3BNm5vNAiFYVG19Rvu5+24zNPjfT2uR9mhQz/
 53uUqcPYMjXKdnro8cMFRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389744; x=
 1756396944; bh=M2iMoMuWKPileIoEWnr4HEQnopXO/M4SnWfH9o37EXQ=; b=F
 liw0l3x0GjEXVzr/v6xwru66+fQ7ipcA1zLttyYz5azNN82VUXgA4xC7zda8a65l
 PMbVrd0g/DTqhEz/sCwwMNXemM1y3GFU7pV/8SxsIBHnTFX6dclnLsgfQhd0iQUk
 MVmADzF49AWXN7Sngi0w/VpDGaVHlh+N8kCkOEY6Up7NtLAJvxP3D+QTApb+Zdxe
 wH8xIr/jORCvFTY04fRuQLM8DyeoZapFoAaHo6KEkAX1QGSd9sI8ZYjRx0jz8Son
 Gkfb0ishZtY+zrhOWjvdHODsVPBkuQyUCujnVsoVo4scEUd1iZ+pLEWFGl1NPIa1
 dU0KM8p0L1Js84n6oSjrw==
X-ME-Sender: <xms:b2GwaBPZV6Yc6pBfAdDN0cmpg0l5f7ko9k40kqUUN8oL5_w0wR9a3g>
 <xme:b2GwaCyLualUVJnbIuDlF6oXEDaaG0wBen9t6j3Us4W14MFLqkS98Nsa6u20Lj5Gd
 utHylo7Eyaqqx3kFH4>
X-ME-Received: <xmr:b2GwaK9EjdieurpMQ7Wmqf2qywY08wNg8E9lHqcn6ccyFlXiFnRRYyRmsLYL4AY_HBaXzOpCEAXpZ0Sen2hHd491Nl6mkT8ehaPfjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:b2GwaEzriTIp3F1os66OJrt_tmMEP-GWzFtpzGz_Sp7SUIornbZX6g>
 <xmx:b2GwaPGSa6Q9v_O9EN_Kp8yyl95dXVwjzZlv5hWI_qZQIJBj27CF_Q>
 <xmx:b2GwaKmJadH7Uc0y6Pv8wWEZ8ZB3X33_8rNETMzyrUti8g50FY4_6w>
 <xmx:b2GwaLT2VXivlqD2b5AuBMyrQD8uWBUvLUblmuwFS5rNf-7kmQLCCQ>
 <xmx:cGGwaKzoZAfVYTbHEpqjHi_tdyuKIH9HoEvcYZgyVF19dgUPuOqsw5ln>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:22 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:34 +0200
Subject: [PATCH 15/37] dt-bindings: nvme: apple: Add apple,t6020-nvme-ans2
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-15-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2340; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=Mho2OjViGa90r2gQMrmzE7gYFPoJqXSER+dRg1JxY98=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiZbrnNL3iDV2fQ+esWT7nmcBUw095etWSjBKOKvEy
 X/Y4n6jo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwERWz2H4Xzl14+/9pjvt/k1q
 ZXt7/ZGs8ulfvOsUZgV1mZ2cWS2RsJ7hf+nn2CReFpZJezcv3q38aDmv0gnxc7/8NvhoLfh9kPm
 vARsA
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
lists with the generic compatible "apple,nvme-ans2" anymore [1]. Add
"apple,t8103-nvme-ans2" as fallback compatible as it is the SoC the
driver and bindings were written for.

Invert the condition for the 2 or 3 power-domains check to allow using
"apple,t8103-nvme-ans2" as base compatible.

"apple,t6020-nvme-ans2" on Apple M2 Pro/Max/Ultra SoCs is compatible
with "apple,t8103-nvme-ans2" so add its per-SoC compatible.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 29 +++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index fc6555724e1858e8a16f6750302ff0ad9c4e5b88..fedfacbca93714d988310f53a0a4c951d9342a61 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -11,12 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8103-nvme-ans2
-          - apple,t8112-nvme-ans2
-          - apple,t6000-nvme-ans2
-      - const: apple,nvme-ans2
+    oneOf:
+      - items:
+          - const: apple,t6020-nvme-ans2
+          - const: apple,t8103-nvme-ans2
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,t8103-nvme-ans2
+              - apple,t8112-nvme-ans2
+              - apple,t6000-nvme-ans2
+          - const: apple,nvme-ans2
 
   reg:
     items:
@@ -67,20 +72,20 @@ if:
     compatible:
       contains:
         enum:
-          - apple,t8103-nvme-ans2
-          - apple,t8112-nvme-ans2
+          - apple,t6000-nvme-ans2
+          - apple,t6020-nvme-ans2
 then:
   properties:
     power-domains:
-      maxItems: 2
+      minItems: 3
     power-domain-names:
-      maxItems: 2
+      minItems: 3
 else:
   properties:
     power-domains:
-      minItems: 3
+      maxItems: 2
     power-domain-names:
-      minItems: 3
+      maxItems: 2
 
 required:
   - compatible

-- 
2.51.0

