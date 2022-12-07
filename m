Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E2645961
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCAC10E04D;
	Wed,  7 Dec 2022 11:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B2710E04D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B68A5C01F4;
 Wed,  7 Dec 2022 06:55:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Dec 2022 06:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670414114; x=
 1670500514; bh=cgmG7mw8sSm/aU9WnG7N6p0KXB0hCVQObDUWl5bXwfQ=; b=U
 sYQjaukD978c2Dp2FfHcV4YUFy3SYgRZRgAfSkRXUkp6XciXN8XIHt/x95DRDkvX
 D1Vtg5n74uIHxgaBS0lRmQsiYxQWPh5YThbbpHkaPqkY7J5fFCS7DreYH+mYp5+P
 lxBhTwe/VfEa/Sde5FSM5mTosb7u2613zM0s0Ux2O8ucWU1NzJC4BqnWT3csRNOt
 S8pEu1xs0F+JAgvguxGLb688E6oSfwvZk6EoRD0sqVCuO40ZSnQ+6Pyom6uvldNY
 KdfP3MbdE/Yj2KmQNbhCbDxFQlUniso3Ut75RQS3dXeWvzcBPR6CHpZIY9V46OYT
 WgMijRfF6Nip71YZ7aEnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670414114; x=
 1670500514; bh=cgmG7mw8sSm/aU9WnG7N6p0KXB0hCVQObDUWl5bXwfQ=; b=F
 5ccBQjw88qzkIN/dGuW04BiP/m5KplyeKHkPE4IT2TsTDH8LQBz6AKswQ89y3hhC
 raRJqOoIToJp81XcqdWw27nwS7q7K4KIsYJokT4hujzgzlq+2GO0kWwzs2+0g/ei
 bGljPyhpG97qaO8l29OjNjnM8Q3hQ5CApxxwb6UceuSkUYX8x1qt31L59toXJTwQ
 UbCCdJTewE2ihdHXaGsKwFU0Zv1MnpVqX281cGAOw6aiBug7Q+yIQcApMjs8jG0E
 o1lHggIrRZNAnTn6vImq1qfSFAMaq30Fgd1BNqxOKu4eavAq/Zv9KxmYcvp3vDiT
 mo4ziyTItBhHqZXg4DsSQ==
X-ME-Sender: <xms:In-QYwELGf-L7oItZQ_ArLtYIOjMoF6SCmIZdwd545NxxCOxn_Zakg>
 <xme:In-QY5Wxbmhr56R8bOZG5QhPsJqDJ4SAD5WN8rj7bF4im6teh3af428IWUgWthFpb
 svXRypEHTQulyUNp9E>
X-ME-Received: <xmr:In-QY6LSac2YEveDcvD9ligwQUt1RyHQvc98xZHQp3-ul0uDgCP43NWoazqUmMha9mhCSb5YyniowZnqNW9dLaUAthcZCnZDvfzaYAMOImCe2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:In-QYyGnh3dpTmAfzIXzAgu_ocJYGxhQModvdySt8kphfYvWJNPWWg>
 <xmx:In-QY2WTmbHRlKDrPaZFh8gXdMJuWkySupCgAj5OtpgazHS6x-kv0g>
 <xmx:In-QY1Mc05B-fHI2sz8gMvonXj89Nsvlbwoniir30wZoZZW1XGqV-Q>
 <xmx:In-QY9PF-xVNIyPfFfCpBK5mkEwRX9uD9vRckeqPFLdUAW7vVVwdPw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:12 +0100
Subject: [PATCH 01/15] drm/vc4: hvs: Configure the HVS COB allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-1-1f8e0770798b@cerno.tech>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=3299; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=gS9nk+DcYW7vrzV9Rm2F4RRdq3qs8C/lQLAO10ZViPE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6lbcuzy1jv2N9IRF2dutcq8aFy6dorzKRyRc4Vz1q8oO
 h+aCjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEM42RYVO6if0/toPvkmTXW3qfVZ
 HjrNLQ4Lx8Q6KVZVvBuS/JLxkZ3jtxn348J0RkxtNn5555P+UzOxtqV+6p0WKz+XrvUQMZZgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The HVS Composite Output Buffer (COB) is the memory used to
generate the output pixel data.
Until now the vc4 driver has been relying on the firmware to
have set these to sensible values.

In testing triple screen support it has been noted that only
1 line was being assigned to HVS channel 2. Whilst that is fine
for the transposer (TXP), and indeed needed as only some pixels
have an alpha channel, it is insufficient to run a live display.

Split the COB more evenly between the 3 HVS channels.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 56 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c4453a5ae163..d615ba7db920 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -776,7 +776,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_hvs *hvs = NULL;
 	int ret;
 	u32 dispctrl;
-	u32 reg;
+	u32 reg, top;
 
 	hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
@@ -912,6 +912,60 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 
+	/* Recompute Composite Output Buffer (COB) allocations for the displays
+	 */
+	if (!vc4->is_vc5) {
+		/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
+		 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
+		 * TXP composing RGBA to memory), whilst the remainder are only
+		 * 24bpp RGB.
+		 *
+		 * Assign 3 lines to channels 1 & 2, and just over 4 lines to
+		 * channel 0.
+		 */
+		#define VC4_COB_SIZE		20736
+		#define VC4_COB_LINE_WIDTH	2048
+		#define VC4_COB_NUM_LINES	3
+		reg = 0;
+		top = VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE2, reg);
+		reg = top;
+		top += VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE1, reg);
+		reg = top;
+		top = VC4_COB_SIZE;
+		reg |= (top - 1) << 16;
+		HVS_WRITE(SCALER_DISPBASE0, reg);
+	} else {
+		/* The COB is 44416 pixels, or 10.8 lines at 4096 wide.
+		 * The bottom 4096 pixels are full RGBA (intended for the TXP
+		 * composing RGBA to memory), whilst the remainder are only
+		 * RGB. Addressing is always pixel wide.
+		 *
+		 * Assign 3 lines of 4096 to channels 1 & 2, and just over 4
+		 * lines. to channel 0.
+		 */
+		#define VC5_COB_SIZE		44416
+		#define VC5_COB_LINE_WIDTH	4096
+		#define VC5_COB_NUM_LINES	3
+		reg = 0;
+		top = VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE2, reg);
+		top += 16;
+		reg = top;
+		top += VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE1, reg);
+		top += 16;
+		reg = top;
+		top = VC5_COB_SIZE;
+		reg |= top << 16;
+		HVS_WRITE(SCALER_DISPBASE0, reg);
+	}
+
 	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
 			       vc4_hvs_irq_handler, 0, "vc4 hvs", drm);
 	if (ret)

-- 
2.38.1
