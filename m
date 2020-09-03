Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953525D217
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3AB6EA93;
	Fri,  4 Sep 2020 07:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300736E5A0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F2B9CCB7;
 Thu,  3 Sep 2020 04:03:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DLnWksX2GU2bc
 dXPEtYsniHBmYXyJRSiMM5E1reodUE=; b=iBJgiVW5hPnxbHslMumGyEH+pvtwa
 apdbK4hpgNFYThkuz/at2bi8HwIpY+lN93KhxMppdevN7xDrMnyH13aBhx5WzKQh
 EQHR5L/4zptHlgmoLKgIJ9ZeDrBqrMVb7j3Xi3n29e210rOb2hihiVmHb6Q6abRI
 a0/zmiw5o9luoxIGfQDXrcWtrcWCy5vgY5aoAnaGlp8GU7UyzjC9v9qW6/HhI57P
 a9+B8OwlgPl3pdjiCO779LaPUMCRo1I5Bd3L2uSkuszNGMMHHntR1zFH3lg5JudR
 EGiGH4SADDs6la/UJnugXhEfKwgTA9lI4KRdYrcdwg0/Vd33KSOcHItSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DLnWksX2GU2bcdXPEtYsniHBmYXyJRSiMM5E1reodUE=; b=IG488LYy
 MGWZUEYmQI8fNf9PBRv2XoBnAoGYIcGy/YmRBGfVQXQjMYB8QT5aq7/AJTP7idUB
 kulb9jSEk+hDqokLtzvyAgEe3U4J5LX/B3kfG7BAsJs7A2o05G6m0SyCPcXjMRRZ
 MgWPCnyEi5x12jq1ioIdnONfL0l10U6V0nalOz7+10pE0aYutxqpOlmx+a2Sxs4V
 8B95OPdYQGaztxZayga9vfXxUBxlToylt09WAgme/mpLGMAEgsSN+5DZF3ud1qbn
 1roq+8niEvOlqVpJF/7jHHk79XulfOXRdrK18twR5V3s5TrsuT1MSwH98rZVzP8R
 b/AhwQPYi1h+XQ==
X-ME-Sender: <xms:TaNQX8dfFwBPipxH8lpvpk-LWyEfkT9N_tl8O3jz6I632PAiluvykA>
 <xme:TaNQX-Otai-zMd8tmGbxETOE4Nn4IRlJxQUiAnQ1fIBCBdg-ZLDS3WmaOlCjmj3US
 Lt5fkckLiAPIcpX6gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehke
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TaNQX9hTSifeDg7DHj2BhemhMNu1g2h1sfNzKMwMjUCQPou7SI_d2Q>
 <xmx:TaNQXx8v_WFC6mVBJVfrhc1Jg4aFiftnIW9owWQ9TSqtouhppajYNA>
 <xmx:TaNQX4uu-r8itMG06IuIb_3I8WdeQ27tB5ECkraepasnUqMDjY5lYw>
 <xmx:TaNQX4HENCSrPLPafI4xoQEwRUjbZT38zJuuPrUxWf7bhmQ745Fqmk_itME>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 372B9306005E;
 Thu,  3 Sep 2020 04:03:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 65/80] drm/vc4: hdmi: Use reg-names to retrieve the HDMI
 audio registers
Date: Thu,  3 Sep 2020 10:01:37 +0200
Message-Id: <a1ba5605fe1006a1ead5262ef3d66ea5d0750381.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The register range used for audio setup in the previous generations of
SoC were always the second range in the device tree. However, now that
the BCM2711 has way more register ranges, it makes sense to retrieve it
by names for it, while preserving the id-based lookup as a fallback.

Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 487c04de6b85..53c3b5ae1179 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -953,6 +953,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	const __be32 *addr;
+	int index;
 	int ret;
 
 	if (!of_find_property(dev->of_node, "dmas", NULL)) {
@@ -973,7 +974,13 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	 * for DMA transfers.
 	 * This VC/MMU should probably be exposed to avoid this kind of hacks.
 	 */
-	addr = of_get_address(dev->of_node, 1, NULL, NULL);
+	index = of_property_match_string(dev->of_node, "reg-names", "hd");
+	/* Before BCM2711, we don't have a named register range */
+	if (index < 0)
+		index = 1;
+
+	addr = of_get_address(dev->of_node, index, NULL, NULL);
+
 	vc4_hdmi->audio.dma_data.addr = be32_to_cpup(addr) + mai_data->offset;
 	vc4_hdmi->audio.dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	vc4_hdmi->audio.dma_data.maxburst = 2;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
