Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBECB3A0E1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224A410E9E7;
	Thu, 28 Aug 2025 14:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="UuyqMvBN";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="F+W/o6He";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C85910E9D3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:16 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailflow.phl.internal (Postfix) with ESMTP id 22D6B1380DA3;
 Thu, 28 Aug 2025 10:02:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Thu, 28 Aug 2025 10:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389736;
 x=1756396936; bh=HMFCNVAPQOnR7larKcxLlHdDjWHMXNcExYYHKxBMdJY=; b=
 UuyqMvBNq24/QXKZPL0pusjo0qhIqlNuUY9SrfaGWw5SrulUyNmkbuIbLn3rCAen
 s17E5fLVcubPezC30TTNVYYe27ZPRSqdnabqxB6zEkEC1AcTHpskqcJUNuf3H5oe
 WMhGf3ujsCD3amtZb4wfCkgFu3pK2E7ruUNnELQclUIym2wg3dAJ78e6rPY3zHmC
 zAKXggbRCnZZaAgWszDy76dCvl0bYPAQIV/rQOJy0E+S6tiFNGU6NoQOZ+4rKbyL
 vAtzd7Oyi/r9YdSqbvVSxVs685pra9qABh0ICd1LLu6Go2QYSyKo/HC9g/GElm6j
 tNpmHepz86Va7P2gnTPDbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389736; x=
 1756396936; bh=HMFCNVAPQOnR7larKcxLlHdDjWHMXNcExYYHKxBMdJY=; b=F
 +W/o6HePOOgz32PZvdNatSHgjsUNm6BzWQLrIQOMA5aHQMhsaGw57Q4U4jH4Gs2m
 HYhiS/FGfH03eacVnF6bOV/DrPOhKSWHjxzmJuaVAALSKethLoPcDPUCVPIxbxaQ
 OgRj7QnM05cbO+Bu8g2Z2wTgpB86uu2j62+anlqa4qSwgeqXvxJq4xIAwNEFn3Dr
 wObUPUt1Nbv9Gr4gaHwZnz46znqS4lCvoG6G8zeSvTsrrUmOSMMJ6UdPapD9I6g6
 js0wI0nz7LFDpM/dHbRZQOWiiwfKQHw7cvQ771pK5Myuql8O556Y/kVqyAnjiUtV
 7ScgyJytsi2F/Yk9xfYkQ==
X-ME-Sender: <xms:Z2GwaLEWQ1OkrXwLLpenTNWCPzkK6t9fwVHKLTN9lggogxBjTi2L_Q>
 <xme:Z2GwaPySQ1bV5NGaCkDKUgRMKbQbqYQRC3mFY8D9RlT8Go7iA9oZCjON9vKQJWPjB
 YGP_MBFTvPayNDtONA>
X-ME-Received: <xmr:Z2GwaGEJ68rnVjUnSZRzmUY4D5eKmBlQXKL27xgbGF9Dbq0Y5O-aI4g8CI9nK-IfX5yCyf6k8MBA3a3wUWTY_Tb5dv3yLGpAll3Pdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
 ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
 hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepjhhohhgrnhhnvghssehsihhpshholhhuthhiohhnshdrnhgvthdprhgtphhtthho
 pehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehkvghtthgvnhhishesohhpvghnsghsugdrohhrgh
 dprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgr
 ghhisehgrhhimhgsvghrghdrmhgvpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvg
 hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Z2GwaECf38Ad1NcqUUYfo19TL6jJN1_0WIlKuXDYxwZUQYFi5SGBrg>
 <xmx:Z2GwaAnBpFbvmp2A-FsbyLRoNbPdjWoaAWExV1TA21Fsb-_VbwP_aw>
 <xmx:Z2GwaGpiHBDfhK9Ne3RKDFu14dLAUzJ5iyLx61UbrfbpSB0zwARJQQ>
 <xmx:Z2GwaC6WpLdsnt67sqRupI1GIAENEBWu0AXKr2if6T0z7lyfttcSqg>
 <xmx:aGGwaLyNZqtMsvKomW4AYJHIuz9YC1BUp7WPgRr6rQbZ7kjKUu539zoa>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:14 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:31 +0200
Subject: [PATCH 12/37] dt-bindings: gpu: apple,agx: Add
 agx-{g14s,g14c,g14d} compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-12-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=1heJWvhlQGBFIEyUbx4LzvmA4oE4diJodCrWb1fWmRk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiRYreHYp7r51/JrRaSdxMcE5rrEJnNvFiiaK7Xydq
 Gboe2ZfRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIm4tjP8r/Z4vvJL6MSyW4c/
 HLB+V/D2qnD0hd0TFdgMNUribp1iqWD4X8Z/ZyPP1viJ5td1Pp+bcd27uvzl6jMhbgY77y2pr7h
 bwA8A
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

Add compatibles for the GPU variants found on Apple's M2 Pro/Max/Ultra
SoCs.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
index 51629b3833b0a8c296eaccdfd6d9eeef02a5bc63..05af942ad1744aa9a3cc523567d4382a22eed796 100644
--- a/Documentation/devicetree/bindings/gpu/apple,agx.yaml
+++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
@@ -16,11 +16,17 @@ properties:
           - apple,agx-g13g
           - apple,agx-g13s
           - apple,agx-g14g
+          - apple,agx-g14s
       - items:
           - enum:
               - apple,agx-g13c
               - apple,agx-g13d
           - const: apple,agx-g13s
+      - items:
+          - enum:
+              - apple,agx-g14c
+              - apple,agx-g14d
+          - const: apple,agx-g14s
 
   reg:
     items:

-- 
2.51.0

