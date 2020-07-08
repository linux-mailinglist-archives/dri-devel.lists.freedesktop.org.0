Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9A219958
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783E06EA29;
	Thu,  9 Jul 2020 07:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDC66E905
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 29ADE2F9;
 Wed,  8 Jul 2020 13:42:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=w13OGPPr5xLPF
 fNdGgAvwXGU0LzBOM3S5NR8R2EchZ0=; b=VWW54A6cXbJAGiR7gCKlePNvuBYvS
 3ajlFKyNBvKC4nRpMw8tN8q2667aYl6ZOOoZQeQ2AjnRZjKijqbOAUMCVTH9sMBo
 9/HSoq4IfmQMxtAtvYMSn9QzrRgfWNVlM/VaEPZoESTWZms4rcKdLQZ59y06Iz5f
 QaT4s4ASNR1F+izYKQoyPsTiGapeMEtIGSYlEMeiXby892lG478HN9CafXug6ckZ
 EEUjDBaZyAnmKUz6Smi7nyjdqWejnTkjY/Ux8/zyoBM12iKYEjmbs1PixWKp0j4G
 O1Jds/4wOaCGpSh9EluOGAfh4u6e8yqiYpYh5CcobwjofifYGSDPqxU2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=w13OGPPr5xLPFfNdGgAvwXGU0LzBOM3S5NR8R2EchZ0=; b=YFEq3mun
 ukcivyxLZ23yXOuHIrIRnFI2zGXW/mTKTujjRaE5dqHib8TI/O3DMFzFVicq/Eht
 bKbnw8rg9WoaeOc8rUiAlyouG6ZVi/1anxSu9+VH+ewpmx7G8bR/q/SrCTZHSf+G
 fHPhsgbEuF7DsUGk7kIljA4Rettv+EoRJ0vh0jMD3jSY6RK9kOs1w7uyQRUZmW07
 ae7UGZDMagsrb4rDN6S01RpzDBHENMfW1MxZIUXwKDh5YKo/impzzfIbXtRmcgvu
 h66OiXKK+OmAv876dxphq48TH4QS1rnuuNc0UJOg7hp0UX2puqFeXn0F4RFXa/0y
 +P3C0y5IR5YQSA==
X-ME-Sender: <xms:jgUGX8tkpKmnLa53hRMdvgST2G5VfbtJTHc7Q-bnkRiLNujSSW7AOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jgUGX5dopyp4ywQlVRsn4TNXhi_YX6FqfpRfymSZcMA-9QsCMC7Y7Q>
 <xmx:jgUGX3yK0-VCaTNrKATiWpD2PHNfnxEGDSHQZSTMZaLgNUeCdPhhxA>
 <xmx:jgUGX_PKsGBtBHqXbXNHZ4ZNZORwp5oEDQ4b6c972g2ypktL3hVuWQ>
 <xmx:jgUGX5NGKBqLrD3HKeRfxqGxRFri2xoqbZ7otX3r5A4imCIP1QsyOrCfmzk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6810D30600A3;
 Wed,  8 Jul 2020 13:42:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 05/78] drm/vc4: plane: Optimize the LBM allocation size
Date: Wed,  8 Jul 2020 19:41:13 +0200
Message-Id: <3496764856363a45b80c0505da486fdeb8a48feb.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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

The current code is using the maximum of the source line size and the
destination line size to compute the size of the LBM to allocate.

While this is simpler, it starts to be an issue with modes such as 4k with
a quite long that will consume all the available memory, so we no longer
have that luxury.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index d0771ebd5f75..23916814b4e3 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -437,10 +437,7 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static u32 vc4_lbm_size(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
-	/* This is the worst case number.  One of the two sizes will
-	 * be used depending on the scaling configuration.
-	 */
-	u32 pix_per_line = max(vc4_state->src_w[0], (u32)vc4_state->crtc_w);
+	u32 pix_per_line;
 	u32 lbm;
 
 	/* LBM is not needed when there's no vertical scaling. */
@@ -448,6 +445,18 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	    vc4_state->y_scaling[1] == VC4_SCALING_NONE)
 		return 0;
 
+	/*
+	 * This can be further optimized in the RGB/YUV444 case if the PPF
+	 * decimation factor is between 0.5 and 1.0 by using crtc_w.
+	 *
+	 * It's not an issue though, since in that case since src_w[0] is going
+	 * to be greater than or equal to crtc_w.
+	 */
+	if (vc4_state->x_scaling[0] == VC4_SCALING_TPZ)
+		pix_per_line = vc4_state->crtc_w;
+	else
+		pix_per_line = vc4_state->src_w[0];
+
 	if (!vc4_state->is_yuv) {
 		if (vc4_state->y_scaling[0] == VC4_SCALING_TPZ)
 			lbm = pix_per_line * 8;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
