Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B8B3A0C9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E06C10E9CA;
	Thu, 28 Aug 2025 14:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="VaHDj0PY";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="C+edsKmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F047C10E9CA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:15 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id B45EF1380DBE;
 Thu, 28 Aug 2025 10:02:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 28 Aug 2025 10:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389741;
 x=1756396941; bh=d1uuzbyK+TBo4FKAGVpnZlWXc03joPgRcgcWkt54xQI=; b=
 VaHDj0PY+V+AsDh4qD25M+zhsGKWgtfDZDmedCbfP+EkCQywzgXWlXCSEVOZqjhv
 7UZDu6/4yqx3KWACwKGn5LTqKnxsBWoIjiIALvisrCm7/zS4GdUOU9F8QOqhZqr4
 52CERp0d39AmPJd9FDDN+AW75JzwtwpCvLw7mean4SYOlIFpXQVoUOPNBMh+jdEz
 D79ERgCHoJ1EgTJ2F9+G6aSnPOGIuNisCxV4zoA260iNJLDc+uc23w/RLNiTUPAe
 z2w8u8vZlTDOVQmyocuG6YW2KzUxtme3qVyz/azJd5mOmMaYtl2mh5bXR7hSIARr
 +RDkwh75QL1OIv6ORBFu3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389741; x=
 1756396941; bh=d1uuzbyK+TBo4FKAGVpnZlWXc03joPgRcgcWkt54xQI=; b=C
 +edsKmmgQpUUdgiXz5LRMt0w28yLVSrI7MsZIsPtNCituhTpwZWvWREvhgEUux8E
 UBUPU/V3A+VmSYDz/LJL2HcEQPGPbJn85jPh9iULAwQ9ptIoydbVftX5jaoxNChL
 pGf2VdxOMZu4rsUsCRI7dK4JTkGvJpAJiPVD4IgksWwaBzebhFRxXEdNyu/l5vew
 P0GAwEdjQcjBQf4I7zxFIuQygK9qSFWSxstrpmyON8c1VbcceKab4h0+EwHlrTgx
 VtIUyVBue5/yaokYBcyDn2mVXwQyuw65vK2hiNQ8nvdPBlqYAsqTumRJxGestZ0l
 cIHYxhton2o+jvcED5jaQ==
X-ME-Sender: <xms:bWGwaJOjUfAt2gPyXzDYH-QgJmwJCaGGpCEF_YS9LWfnNJUTQi4o_g>
 <xme:bWGwaKzDA0OMFWaVfRJCxHerCzhhNRw1vEilx6gOfrXXtVKMukX1cJvIXBs5IMyW2
 dJRufB8zrpTOT8c5E0>
X-ME-Received: <xmr:bWGwaC9T6uH96i2PXR13lLZfcIcmo8wmeaNpImOLE4UvHEniBDl75tdgju-d8XMrtL141uNjsLM1QkKRUb-Yt8MTLM8hd_X1i4qFRg>
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
X-ME-Proxy: <xmx:bWGwaMwXMChxee1x41cVZmcENyVrdN8cxsZouPfGzoov0QyiO-HTAw>
 <xmx:bWGwaHGFJ459KgUjWGFOoXpHCZ4kv4lQ07dAIJ1f4VXkCYekMANtJA>
 <xmx:bWGwaCnKTsBNdTFXQdp_hlUWzUIJOXQtsQOpCfMJzEJ8eJq_-3nYqw>
 <xmx:bWGwaDRt5Z0bkvGLPlUQu2b9W3E7SszPvHJLDA8J1WqUm92N57d-Xg>
 <xmx:bWGwaOEpaf--yyX6ZMRIBcyqRqWVh9eTLzAZ62ilQKNakq-L_QMdUoRG>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:19 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:33 +0200
Subject: [PATCH 14/37] nvme-apple: Add "apple,t8103-nvme-ans2" as
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-14-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=j@jannau.net; s=yk2024; 
 h=from:subject:message-id;
 bh=Jb83KxX2H7kR1o63dY79EQbQmU6FMtXfENWdCwzKWS4=; 
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiZadqXLVW/17dYSM90/iZHgq4LH/1RnpqsA7RybLB
 Ckm/ursKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBHO8wx/RW5UOcq4h897Z+b1
 dkFcZmbHiZmFYQxWMamLXq4qmr1On+G/0/STT/xviR66ueGsrL7KNjXWPxf99SodOUPr7JdPniH
 IDwA=
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

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/host/apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 1286c31320e630cb012009d6b962526e0553869f..1f57a7a20715cb2370f1e72872c2e08bde44bbc8 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1626,6 +1626,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(apple_nvme_pm_ops, apple_nvme_suspend,
 				apple_nvme_resume);
 
 static const struct of_device_id apple_nvme_of_match[] = {
+	{ .compatible = "apple,t8103-nvme-ans2" },
 	{ .compatible = "apple,nvme-ans2" },
 	{},
 };

-- 
2.51.0

