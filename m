Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D222B3A04B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260EF10E9C6;
	Thu, 28 Aug 2025 14:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="eDcTrfzA";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="S2wUbCB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D3210E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:11:15 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailflow.phl.internal (Postfix) with ESMTP id 6B09A1380D5B;
 Thu, 28 Aug 2025 10:01:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 28 Aug 2025 10:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389718;
 x=1756396918; bh=vy5P+sVfFDLufoc1hr5t7CIOk5hDThc1B/C8ffqi79w=; b=
 eDcTrfzAOKyq/bxHh2lCMbl2JSIw7Mpp/tObd3p0pr0IP9ZHtco2Baj3zlVxC84U
 K5gKbmBW2C237b0AnhhmRs6iiPZ9AosUaAK7dknW24Wd/I5M4iK6fi6+aNHEKKsz
 S9wkGUPzwfa0UJtAU5LKURqXnvbYoPuV7+CWh/677OnMkGaQZSBLNEk0lSzDXaPo
 GWxl8c8CpGvs7DA6sNL19s76+a5mcPqLBmB8xPvjKKaUZBH2v66/3bTttYcMY/9V
 1PJKYo1bBXiPaV4Yge+SHsDCmV0wbRcHv4KmlUGOB7KXLniF+Q1V+0fhkkLF0XnW
 CUGhsvkAM5qBDudZbvO5qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389718; x=
 1756396918; bh=vy5P+sVfFDLufoc1hr5t7CIOk5hDThc1B/C8ffqi79w=; b=S
 2wUbCB3mA1SaillVH2gAhunGRvU24zh5dqRNNJSWtGnTC1lPZ1gTRD4xmNPFarUz
 3FzBu3CeXMggcpNLo/vUSu+tl7qovuhAemkHttSBt/wt7+pk6PkEz6cHdt7cB0/c
 KUd2MNwoyJHYuz1aKxiKxDk60URH2mXkMvmnj9Fat7hBtOwBt5+uaRzgoPP2Mc4n
 YHtU96AydTIRMz94g2Sk5aie8ULvQPDcd41d6HTycQLi+LTSnvkASakIPZM56v1U
 4Y3trm3TMxBQDGhNzgHdhJJ0PhVHgFrcryI//k/B5sBwBLRyvu+bp4UFKBwxUaoV
 ruoZnmYMJjYUhgIqMizSg==
X-ME-Sender: <xms:VWGwaJMmdrelBtksrDlgkjFIdpFHmN0AQyNnsAreqqRMRIL3Tig5PA>
 <xme:VWGwaKyKQZ_LyuNLKOLzDcoRpVrVs6jpSPiydg5ahrE4WEblnOv-EjrVvbdPIQUpA
 gyXWwpTbopQsFpnXOM>
X-ME-Received: <xmr:VWGwaC8OAh0WXQnio_gRpOP5j6kf48I7bA3SvxWC_tHByQoE_DYlxcuM_iWhLLsWsdKvcXZ0udrrd2ViLTgvsJQxUOba-i6Wd2uAJw>
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
X-ME-Proxy: <xmx:VWGwaMy2TAccEVGFV2Ss5AQ_2tHcgjiSit4VJkX9yDVAksFj04YVnw>
 <xmx:VWGwaHE4MdjhW9TeSIYsRgzcWHnejngAPhiZ7xDG88O9cr9Po5wq_w>
 <xmx:VWGwaCkBQgGcTgWH1PrAv_6yJOAKG_30lqzKlWHbVRcsqSEK2YgDqw>
 <xmx:VWGwaDTY3XzBQnG88wzR8jG0SyK5q8q9262ENhUdxM5zQMRjGGft6g>
 <xmx:VmGwaCx6COjUroOlpo70uJCsw9fbQcXNUtAvIsanbl7ymxXDDbog2jel>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:56 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:25 +0200
Subject: [PATCH 06/37] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t6020-aic compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-6-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=Pv4jjMM4dvnLYycFcNWkhCi0ehynlKJPAw0T2HGz9OE=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiRYuXdtshNO/WTCt7VHLNl0wmfe/l77QkQ9TT7z4k
 FJonKHcUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCJW5Qx/Za9Mbev6uP2+x+Xl
 y91Lvl8r+918f3fGf7eDVf1qcp/3zGf4H1xwKXj58dd/FIMFVi0zYGNhSb170eVHs8dXTfZ719e
 vZgEA
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

The Apple M2 Pro/Max/Ultra SoCs use AIC2 as interrupt controller. This
is the final SoC added as compatible as Apple M3 and later use AIC3.
Apple's A15 uses AIC2 as well but has no official support for alternate
operating systems.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index 2bde6cc6fe0ae4912f7cd7aacdde2980da87ce54..ee5a0dfff437816056bda0de5523bf38be4f49ba 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -34,6 +34,7 @@ properties:
       - enum:
           - apple,t8112-aic
           - apple,t6000-aic
+          - apple,t6020-aic
       - const: apple,aic2
 
   interrupt-controller: true

-- 
2.51.0

