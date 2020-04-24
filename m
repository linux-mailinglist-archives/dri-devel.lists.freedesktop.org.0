Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C21B7FF3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1236EB5D;
	Fri, 24 Apr 2020 20:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99473896C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9B85F1458;
 Fri, 24 Apr 2020 11:36:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RZBN3MbgcEFAH
 BaADdNdwB2P6fayKSZ6ak4G/krg+rk=; b=idrkZXnUF+NCbQssNUAmhs4NcSJtJ
 qXmqiZvI8E570cGKis1DsgYwBhxDV56Zl8GENyFX7V82HeObWMOo6feXvJeltbc3
 7u0fm4gC7bg+906JE51INK6mffyUZQXZ5nUYJT5/yDfks/8OjcrX3qUv+oixO7DL
 DVd7J3q59f6ZqjASbMsZV0q1JQ+2QExWFZqNRp7asvjWBYcNBZYaGJkBy3V0c+AQ
 3KiPrZzGAHncDwXHMTmNXvp6kUa6qURzUcR6xWo9okttEn8Ooq3ZRxIn6c77Udxf
 CYXea00Jf6yu4+J0uaF94+w6ZRugsGhkVFIYRKTB/vam0G91z7G8YJ7RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RZBN3MbgcEFAHBaADdNdwB2P6fayKSZ6ak4G/krg+rk=; b=UwaWsHSI
 KH0guK4v9aITs1UqQ79TgAM1c+C7YLJmmi8eo29qDwlKZzCEDQw2vCv8YqzpWtwa
 AboEbmpsMWJvQAopVCQ4hL4N0wLHlskqnje8iU1+FIp6SRRDh3+vqzK4zvy6Ukjf
 vvTUPhzbw1aN7CCgoTSDqU6TbmiXBGOW49NjB9bEAy07wj+8pxk5b4K7VxTc14bZ
 GREnzmG1BzUPYLfPzBmN5IBQ7vBzeKfbT1NgPR+yJM9bqsCYLCa+Dsfarg4zjC5L
 J4nLQOGgpZtlzjHYvOMhRW3OyTX6qcaLk9CdI/pU4WDqX9YSjkkcNzZ+AK23SYGA
 TD1gj5HT4j6G6A==
X-ME-Sender: <xms:fAejXpRsWpGDiT68WIJuALPPiPK9aoKRvWojcDxg9TN2RFngg28iag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fAejXnJszll0Nj_a4rT1c2K0s18cgllovCD0gwNKhlDQm2jTdivOPg>
 <xmx:fAejXsvVGLrdSAODNVSjpfO9X_SuT2jYulya_H6dlZOj434mLE19xA>
 <xmx:fAejXu__VfQguBPGw2suiW3Q8Ye1uNcMlb_q-3IRfv6NHRRwhTiYmw>
 <xmx:fAejXg1L1v3ACvYyWhbbIcShpfuxK6VfyPQIlaSwRKMgUL0Lw6_hHXCXT38>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3F923065D97;
 Fri, 24 Apr 2020 11:36:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 47/91] drm/vc4: crtc: Turn static const variable into a
 define
Date: Fri, 24 Apr 2020 17:34:28 +0200
Message-Id: <153ceee1cd4823d03e5c64c95be15b03208e45f6.1587742492.git-series.maxime@cerno.tech>
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

The hvs_latency_pix variable doesn't need to be a variable and can just be
defined.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 5d713fbae139..06bda23cd560 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -44,6 +44,8 @@
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
+#define HVS_FIFO_LATENCY_PIX	6
+
 #define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
 #define CRTC_READ(offset) readl(vc4_crtc->regs + (offset))
 
@@ -231,18 +233,17 @@ vc4_crtc_update_gamma_lut(struct drm_crtc *crtc)
 static u32 vc4_get_fifo_full_level(u32 format)
 {
 	static const u32 fifo_len_bytes = 64;
-	static const u32 hvs_latency_pix = 6;
 
 	switch (format) {
 	case PV_CONTROL_FORMAT_DSIV_16:
 	case PV_CONTROL_FORMAT_DSIC_16:
-		return fifo_len_bytes - 2 * hvs_latency_pix;
+		return fifo_len_bytes - 2 * HVS_FIFO_LATENCY_PIX;
 	case PV_CONTROL_FORMAT_DSIV_18:
 		return fifo_len_bytes - 14;
 	case PV_CONTROL_FORMAT_24:
 	case PV_CONTROL_FORMAT_DSIV_24:
 	default:
-		return fifo_len_bytes - 3 * hvs_latency_pix;
+		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
 	}
 }
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
