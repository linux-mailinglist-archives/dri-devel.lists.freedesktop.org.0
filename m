Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1AB3A0E0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57C410E9E6;
	Thu, 28 Aug 2025 14:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="KIDDe+Zx";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hQMIZH1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E310E9D2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:16 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailflow.phl.internal (Postfix) with ESMTP id 3431E1380DE6;
 Thu, 28 Aug 2025 10:02:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 28 Aug 2025 10:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389774;
 x=1756396974; bh=T8xN/iqDkOn71z+fREDGMNZzbTOc4h60ar9j2mlPV4c=; b=
 KIDDe+ZxGWRsramjH9KrQT3q18mTBP3E6cL2T5A/nqlDjiPfy9BNUvb7oJhplU8c
 HsbEUs9/X1t2sMJgPmp9JCPgn/HtW+dhxo+/9MJiAOiKJN9qFiPDmr13kEkXfZdH
 s156+yq8G6sWl7e/pTFd+UbTbb3TDTYyqii9D87q0700WX8phvFXN75UYZ0bUu6/
 Pw9ufRcvYS1rjF0jA/TFHNreCLaKwgJ4hJWltg2L88vI8PXuJc5CTkQATx5Qk8ff
 MuQgrKAde58f363mLkOmEY7sevj4yrhgNMYd/S1alcrJ6gy9wNJ1rIaaq34/uCn1
 C3j6mpS9AoNx5GZyWVRvwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389774; x=
 1756396974; bh=T8xN/iqDkOn71z+fREDGMNZzbTOc4h60ar9j2mlPV4c=; b=h
 QMIZH1Dkluk7A+2u5P4RMT2YOLVOtr7s9Gz1Evs6ewWjI8MmuadTOkm0zFV9O6JA
 xRXBoChsvWg4CQPO3sTF5HUhL/5RvF/Ork9IgvaGvDxfEz+Cf89QQhz71ajMrOFN
 stGetv98xHETovP2WIMmLmaIENl753Bi4SubaYSbgwwtjfMVw0X9gdD+I0R3L9ps
 3x3WYyegSpkAz2Wtqj268fRJoh38mPCFd4jSW2JsxS7v0PcP4LDOzEur2R/+sHEt
 WVTWQOb75eSPulucr7DjAlZa+688noaxuIvdJ5QjOVrMgg8ROYVg6ediVIX1klFH
 SFJwvrrfR7GnM4+2P5btw==
X-ME-Sender: <xms:jWGwaDW0bTov43y0UL4sLFvhYJ75LVW-VJid6cr4O10hr1v1terJug>
 <xme:jWGwaDA8nbrbjAFzCTsbA-D1Z8Os0lsZTl8JKLCeLUi_He4YLyp1Z8DttC-uMl8gj
 MRuyvNC8l4J7ncqeGc>
X-ME-Received: <xmr:jWGwaIXMDCeugPgBk02W55jjpIRVhuDLf3fxrJylmPlHjOnzaGF4srkLadCRKfV-RzkX9-mOjb7FOv0R_GqMcAaaOTLEdbzKN4gdDA>
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
X-ME-Proxy: <xmx:jWGwaJQNwm0EY5_dLVcm2MDuU1W1K58ndkQ-ttU8t_XSAOkF_HDDww>
 <xmx:jWGwaM0yne_D8xfRW7V5csD6Xav0v7syyD7Pic7tRnePyZH0EJkT0Q>
 <xmx:jWGwaN7qykDR_xlSAc1ueKyiKH50HCtNtL5Plar4AtRoKFOYyArxmQ>
 <xmx:jWGwaJLnfKNFQZENF2VCXWU_KkVYYJ3tSkR32cmckx5i7o_Rrfg6aA>
 <xmx:jmGwaGpRnmacwZMD579NYvgSi_RW2nsNkxwgqhiC8jqQY7CRRgG_p8Kk>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:52 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:45 +0200
Subject: [PATCH 26/37] dt-bindings: clock: apple,nco: Add t6020-nco compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-26-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=ksd8fQMskBAFAvCl8rDDBcxkxE6SpDReXl8/rn9eLjs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVZTg/zmztV9faZY4zBXdaHlo+5VHzpV/uZ9LOW7L
 O5TJCTfUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCIZhQz/bByKK5dppiV5FL+y
 DE+ca8Qyc344y0cD6cdbVxWZXVh2h+F/fW651c4nO+fsjrii+ps9fIax30e1q90PWG5632TfHuX
 CDwA=
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
lists with the generic compatible "apple,nco" anymore [1]. Use
"apple,t8103-nco" as base compatible as it is the SoC the driver and
bindings were written for.

The block found on Apple's M2 Pro/Max/Ultra SoCs is compatible with
"apple,t8103-nco" so add its per-SoC compatible with the former as
fallback used by the existing driver.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/clock/apple,nco.yaml | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/Documentation/devicetree/bindings/clock/apple,nco.yaml
index 8b8411dc42f60f83ee23dce117583e2982db5cd0..080454f56721f42d4f916d77d63d5ea71d2379cd 100644
--- a/Documentation/devicetree/bindings/clock/apple,nco.yaml
+++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
@@ -19,12 +19,17 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t6000-nco
-          - apple,t8103-nco
-          - apple,t8112-nco
-      - const: apple,nco
+    oneOf:
+      - items:
+          - const: apple,t6020-nco
+          - const: apple,t8103-nco
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,t6000-nco
+              - apple,t8103-nco
+              - apple,t8112-nco
+          - const: apple,nco
 
   clocks:
     description:

-- 
2.51.0

