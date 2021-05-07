Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146663766BC
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EDA6EE28;
	Fri,  7 May 2021 14:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3896EE28
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:05:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id D8D07FE2;
 Fri,  7 May 2021 10:05:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 07 May 2021 10:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=1Y/6ibLlSr8pw
 II8mTAg1YDwMKwUM98nwretj7QAvbA=; b=SCJjwuJAiFT3COu62reNPC6HBe6NG
 2pQmxeyQ3cslLYKSi+YN4uvGJN2lxgJtR3dGgzcfHhGhH2QXfgzy4B9C4+UiYyDP
 RRytUs/zyTEWUzjEp9oraOY7bu+8FkouHSwXXXGCLiUWgJqtxalyy6+dPOoV3R+i
 YUesci7Ob5/pese7lICDtpUheWbUuo57u/akV1hTH43oVha0KDPtnbSmYz55sPkp
 hGaWCc+83hWJjh8OVYBvWUoWNg6hGqDjV3epsRYrpNV9FdAvojL+R6GNSqYhQHZN
 SW/lQme0KrkUY80em9Ou6RsDzfBkOkdvGF47YySCS0r9945BIau4UcmSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=1Y/6ibLlSr8pwII8mTAg1YDwMKwUM98nwretj7QAvbA=; b=AyEv4al1
 k/00FANxirR6KuKDveL1t2xTS2v9DdbGZ+r3opG1NJ6pAdF12y6i1Ad25PWh8zZ3
 zNO1Uct17Q8AAYMSbYJ5AfqHWEj5QuUWu2QNbcob11Bwuy7O3IWo/YrI3VSn/poM
 rfqHWY7UwHyeeJ+EDIRhR3rHnyNHfOY5SYgPOQIXOCKfkXmLC0VKJ5VT17ymUTtS
 7Jcp0BmQF/nrqqOAS5QWlsg51ctBSTkvpR1VeGP02sFz/bACBI1n98Wqt2/1sgzA
 +OF/zIUwoOxT582kK4YetsM6CmJks/qloHa7XGs1i3qsM5xrlVip21gCh9/X4XGx
 QjED8BwlMDSqnQ==
X-ME-Sender: <xms:OkmVYGQ6_YQFvg2OQMwGZmZtOOUSBcHrdsrrwIiBdvW1nmrxm1mr-w>
 <xme:OkmVYLzQbfY2stP1piv0sWrpyM-rkYZMjmLDYs4qT8WqzmFpeTU-Igzkr-YTEQZmp
 1mG9B5YQG9QVI-I_ds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OkmVYD0g-wLcT-LOqVIa1dF2VpJYomCTN6eErnZfm8pufkBcdOhTGw>
 <xmx:OkmVYCD0AscbqTWgXaOmWaW1SOkLjmGYrIBYQwvP6Y3C63ahSR-R4w>
 <xmx:OkmVYPh1Wm1ShEqHYfmZ7V4f2nJbvegfG2ImJM7f4pgbNhGLnt-WeQ>
 <xmx:PEmVYLTOdVxETl46RmjLubofxfb24KSmyzbfzjO0YNJLqLmAXJQQGBuXZSo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/11] ARM: dts: bcm2711: Tune DMA parameters for HDMI audio
Date: Fri,  7 May 2021 16:03:34 +0200
Message-Id: <20210507140334.204865-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
References: <20210507140334.204865-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Dom Cobley <popcornmix@gmail.com>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Enable NO_WAIT_RESP, DMA_WIDE_SOURCE, DMA_WIDE_DEST, and bump the DMA
panic and AXI priorities to avoid any DMA transfer error with HBR audio
(8 channel, 192Hz).

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 462b1dfb0385..8a7350cfcd9c 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -352,7 +352,7 @@ hdmi0: hdmi@7ef00700 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "wakeup", "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
-			dmas = <&dma 10>;
+			dmas = <&dma (10 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
@@ -395,7 +395,7 @@ hdmi1: hdmi@7ef05700 {
 				     <9>, <10>, <11>;
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "wakeup", "hpd-connected", "hpd-removed";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.31.1

