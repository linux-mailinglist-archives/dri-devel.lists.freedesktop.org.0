Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7791B7FDB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8E66EB2C;
	Fri, 24 Apr 2020 20:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AE6EAA6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 797F11459;
 Fri, 24 Apr 2020 11:37:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8kX7U+71bNCoQ
 d0UZnXDfrbq6WXpGjWMX/ORI+DR4Lk=; b=mMN9+utoRK0bKa7rYt6Xl7X4heAcG
 I413crPbhNzZCu3ZOnurx9ZPfrEK3oQZkKYDM83EbEiiPoeOJjH363BkQIo786jY
 gSO8uxSPV4s8+Rn+/QStiOuyrWj/R8LbZGbSpKneaVmRdeXxjpk/tyx37b6HxvTc
 AS1iz/OvaR63ziyk+EnlRreE0Iy6nX6km37oNJIu1mTiL/Ilqmb/9togbEd8BfFq
 /3lOkLDO/hE7bKJiZSVVAYngIXtI+IFQTdALlFza9KDqe8ysAuCSgbvXP9XKhzZc
 n8k5MP4skUYOj9MfQT9tQ5C1uUHEjDn4EUcmxbGiE8H8aR6y9yzKcFaJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=8kX7U+71bNCoQd0UZnXDfrbq6WXpGjWMX/ORI+DR4Lk=; b=3WTBgldZ
 oR/ONGVpMsiQoe7EevnRp6Z7PlOVUouBt51R6rbT+kx4HkRk0b8002MLqoBNFTDR
 lqL1IxgpxYgAHeUa7+AaHYjshHPYlRTVqEcG88nVpoBOKQEA/4Fd5FJnkvC/Ihwl
 9VBrosACr5ab7xTYu/sUCgHg8dexRKcQCwJvp81iRo7Nlov4Rt273/uack8MSpdQ
 rcJ8V7/P/uEZLLfguZ/po/XgSJ1rBI5R99JkpH4WbOj3MyNhLwSWobrhxxsYNgxJ
 Kqb3E8N58c8uYXiIVBsiF+UN6Xal/x4DAtpKpK80B0l3wvbV4pbV11q/58eq7zGe
 kAkgKeQq0Bhj6w==
X-ME-Sender: <xms:sQejXkZBY8McKQzgyKRLnH6ETsp1R86rk4wmfPs0CCVM4MfK1701TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeejgeenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:sQejXlriON35UToHcW2jJQ0dnJAC0ynsJrCNURuiFMAYf6h961ayJA>
 <xmx:sQejXmMDa7oSuZ9m4tHO_sUbpZHBuFcYF2nvFPxZnXt4A8ubWIh_Yw>
 <xmx:sQejXpxW39u-PKg55vO3bMdH2POD0fRX7-derF8x4NuiLtHxYZdlOw>
 <xmx:sQejXlncic9zvjRArg9ESFQIPM8JMXFGr9Tkpme87ziBobBbnmBLJIxULKw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7AAA3065D9A;
 Fri, 24 Apr 2020 11:37:20 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 85/91] drm/vc4: hdmi: Use reg-names to retrieve the HDMI
 audio registers
Date: Fri, 24 Apr 2020 17:35:06 +0200
Message-Id: <6c4c4a79fec5ed1ba34250d863cbc5be3034a4a6.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
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

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index df3973acbe88..07304d156eeb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -955,6 +955,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	const __be32 *addr;
+	int index;
 	int ret;
 
 	if (!of_find_property(dev->of_node, "dmas", NULL)) {
@@ -975,7 +976,13 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
