Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450955001B1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BEF10F15D;
	Wed, 13 Apr 2022 22:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865F110F146
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D15815C033E;
 Wed, 13 Apr 2022 18:19:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888385; x=1649974785; bh=yM
 jDNZk22ts1QSeZuHA3iHwk+1FDAWv58BJ1pfqsy94=; b=whdq+uqQW2un1gyfjq
 QH/YN4888u9WajBX6vFAnjzIXIm/0H3dnT7DmqEnv87XNVxuQAICx/F0JRuxFrvd
 jBoSJYdsPUeZ3VtIuzLd7+W5IC2xlLLWIDR30BHtuL6zjv5ydSTpOzE7Czl3L/QH
 V90CyPj8z5UYaSPfAHCySnGFxjtfxBrHaXUv74TwKHQmynfgrlCWE4JZHynJbUeH
 gifbwQA52NroLRoKZqU+rCtB6va60KonAfmTE3ohwg36qb3Xsjjt90XwmMRFpdIJ
 88yXZ8u57UFZnxNQhEwLraXeT4/bjSA3xsXeV3gyVMvB7ttGj7bse4a9xYVKWaRR
 hy5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888385; x=1649974785; bh=yMjDNZk22ts1QSeZuHA3iHwk+1FDAWv58BJ
 1pfqsy94=; b=o/8Pde0ihVf9vakWSJ1n68tyevicS+zcAaZm7XMY10IOCxXE/3k
 po4pyR51AAUrVHwYmXCbHsyrMxJOQfmkwukTuGlIo6QbPXPrceg0K3/VD5R5H1oW
 A9fkmmqGST3jlFXnqfEtq9CWDhz0FHG/0KtkRZsokjhNbKCxKxlN029jZyTJcPO4
 L1XuIOZkPtNTI9GGBy2OtRtu6NaOhDu051UnsDAmJzfP6O2BIARGPw9REoFYlT2Q
 Rg9GZ3+KiK0YlR5BhYR96LwzxvRzMNvyF3KBEviqET3TYoEbDqL5ZUTi4Zjymd7g
 IpXOgxYuYM1gt4Zw43gmmnfJkpaRF+sfC8A==
X-ME-Sender: <xms:gUxXYmlzzmd5E_pGapCyclHwlRi7EyOIlSvSfpgd4DO0QWEmUfjsIg>
 <xme:gUxXYt2VWWmV0BCM14pETKtdijxEicp53B9w1vINterkFgexd_4a12NKPODrzHR-U
 MQH3Xztx02q0jCWaA>
X-ME-Received: <xmr:gUxXYkq15RwDtSiJ4r7PhexTbsaPKnXpKpMfuJBNsi60wJTPKPNsW8L48QZTsnkfmGXlMcjGPrZfsxt7Zv7TIwe4rYV_sAkWfqvaO8bVk2qrxe1pZRUAU1E1PCrivsDogpss0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:gUxXYqkYyj82kfXzZO_ipJbVaQadtaZuhrgheaTCrSJm0ZtWQEQiKA>
 <xmx:gUxXYk0aREGZQ7JjmQeIqQZo7Yc5aauSviaP2xNvGiVMq-N2tnz0pA>
 <xmx:gUxXYhv9gn-xAXk8Zcb5b1UfIM5ilXUky45x4-IbTBxp3i1GKxqLcw>
 <xmx:gUxXYlW4NzoEqoBeR7b5ZHajiF0QBmyXDrOU_oYAI4K101oDvC1BTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:44 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 12/16] drm/rockchip: ebc: Add support for direct mode
Date: Wed, 13 Apr 2022 17:19:12 -0500
Message-Id: <20220413221916.50995-13-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, 3-window mode causes some artifacting. Until the cause is
determined, provide an option to use direct mode instead. Direct mode
does the waveform lookups in software, so it has much higher CPU usage.
This limits the frame rate below the panel's ideal 85 Hz, so it leads to
slightly lower brightness accuracy. On the other hand, it doesn't leave
random lines all over the screen.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/rockchip_ebc.c | 97 ++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index dcd8c8e8208e..93d689ff0933 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -162,6 +162,10 @@ static bool diff_mode = true;
 module_param(diff_mode, bool, 0644);
 MODULE_PARM_DESC(diff_mode, "only compute waveforms for changed pixels");
 
+static bool direct_mode = true;
+module_param(direct_mode, bool, 0444);
+MODULE_PARM_DESC(direct_mode, "compute waveforms in software (software LUT)");
+
 static bool skip_reset;
 module_param(skip_reset, bool, 0444);
 MODULE_PARM_DESC(skip_reset, "skip the initial display reset");
@@ -370,6 +374,59 @@ static bool rockchip_ebc_schedule_area(struct list_head *areas,
 	return true;
 }
 
+static void rockchip_ebc_blit_direct(const struct rockchip_ebc_ctx *ctx,
+				     u8 *dst, u8 phase,
+				     const struct drm_epd_lut *lut,
+				     const struct drm_rect *clip)
+{
+	const u32 *phase_lut = (const u32 *)lut->buf + 16 * phase;
+	unsigned int dst_pitch = ctx->phase_pitch / 4;
+	unsigned int src_pitch = ctx->gray4_pitch;
+	unsigned int x, y;
+	u8 *dst_line;
+	u32 src_line;
+
+	dst_line = dst + clip->y1 * dst_pitch + clip->x1 / 4;
+	src_line = clip->y1 * src_pitch + clip->x1 / 2;
+
+	for (y = clip->y1; y < clip->y2; y++) {
+		u32 src_offset = src_line;
+		u8 *dbuf = dst_line;
+
+		for (x = clip->x1; x < clip->x2; x += 4) {
+			u8 prev0 = ctx->prev[src_offset];
+			u8 next0 = ctx->next[src_offset++];
+			u8 prev1 = ctx->prev[src_offset];
+			u8 next1 = ctx->next[src_offset++];
+
+			/*
+			 * The LUT is 256 phases * 16 next * 16 previous levels.
+			 * Each value is two bits, so the last dimension neatly
+			 * fits in a 32-bit word.
+			 */
+			u8 data = ((phase_lut[next0 & 0xf] >> ((prev0 & 0xf) << 1)) & 0x3) << 0 |
+				  ((phase_lut[next0 >>  4] >> ((prev0 >>  4) << 1)) & 0x3) << 2 |
+				  ((phase_lut[next1 & 0xf] >> ((prev1 & 0xf) << 1)) & 0x3) << 4 |
+				  ((phase_lut[next1 >>  4] >> ((prev1 >>  4) << 1)) & 0x3) << 6;
+
+			/* Diff mode ignores pixels that did not change brightness. */
+			if (diff_mode) {
+				u8 mask = ((next0 ^ prev0) & 0x0f ? 0x03 : 0) |
+					  ((next0 ^ prev0) & 0xf0 ? 0x0c : 0) |
+					  ((next1 ^ prev1) & 0x0f ? 0x30 : 0) |
+					  ((next1 ^ prev1) & 0xf0 ? 0xc0 : 0);
+
+				data &= mask;
+			}
+
+			*dbuf++ = data;
+		}
+
+		dst_line += dst_pitch;
+		src_line += src_pitch;
+	}
+}
+
 static void rockchip_ebc_blit_phase(const struct rockchip_ebc_ctx *ctx,
 				    u8 *dst, u8 phase,
 				    const struct drm_rect *clip)
@@ -472,8 +529,13 @@ static void rockchip_ebc_partial_refresh(struct rockchip_ebc *ebc,
 			 * be neutral for every waveform.
 			 */
 			phase = frame_delta >= last_phase ? 0xff : frame_delta;
-			rockchip_ebc_blit_phase(ctx, phase_buffer, phase,
-						&area->clip);
+			if (direct_mode)
+				rockchip_ebc_blit_direct(ctx, phase_buffer,
+							 phase, &ebc->lut,
+							 &area->clip);
+			else
+				rockchip_ebc_blit_phase(ctx, phase_buffer,
+							phase, &area->clip);
 
 			/*
 			 * Copy ctx->next to ctx->prev after the last phase.
@@ -513,7 +575,8 @@ static void rockchip_ebc_partial_refresh(struct rockchip_ebc *ebc,
 		if (list_empty(&areas))
 			break;
 
-		regmap_write(ebc->regmap, EBC_WIN_MST2,
+		regmap_write(ebc->regmap,
+			     direct_mode ? EBC_WIN_MST0 : EBC_WIN_MST2,
 			     phase_handle);
 		regmap_write(ebc->regmap, EBC_CONFIG_DONE,
 			     EBC_CONFIG_DONE_REG_CONFIG_DONE);
@@ -581,10 +644,12 @@ static void rockchip_ebc_refresh(struct rockchip_ebc *ebc,
 	/*
 	 * The hardware has a separate bit for each mode, with some priority
 	 * scheme between them. For clarity, only set one bit at a time.
+	 *
+	 * NOTE: In direct mode, no mode bits are set.
 	 */
 	if (global_refresh) {
 		dsp_ctrl |= EBC_DSP_CTRL_DSP_LUT_MODE;
-	} else {
+	} else if (!direct_mode) {
 		epd_ctrl |= EBC_EPD_CTRL_DSP_THREE_WIN_MODE;
 		if (diff_mode)
 			dsp_ctrl |= EBC_DSP_CTRL_DSP_DIFF_MODE;
@@ -647,8 +712,12 @@ static int rockchip_ebc_refresh_thread(void *data)
 		 */
 		memset(ctx->prev, 0xff, ctx->gray4_size);
 		memset(ctx->next, 0xff, ctx->gray4_size);
-		memset(ctx->phase[0], 0xff, ctx->phase_size);
-		memset(ctx->phase[1], 0xff, ctx->phase_size);
+		/*
+		 * NOTE: In direct mode, the phase buffers are repurposed for
+		 * source driver polarity data, where the no-op value is 0.
+		 */
+		memset(ctx->phase[0], direct_mode ? 0 : 0xff, ctx->phase_size);
+		memset(ctx->phase[1], direct_mode ? 0 : 0xff, ctx->phase_size);
 
 		/*
 		 * LUTs use both the old and the new pixel values as inputs.
@@ -1048,12 +1117,22 @@ static void rockchip_ebc_plane_atomic_update(struct drm_plane *plane,
 		/* Convert from plane coordinates to CRTC coordinates. */
 		drm_rect_translate(dst_clip, translate_x, translate_y);
 
-		/* Adjust the clips to always process full bytes (2 pixels). */
-		adjust = dst_clip->x1 & 1;
+		/*
+		 * Adjust the clips to always process full bytes (2 pixels).
+		 *
+		 * NOTE: in direct mode, the minimum block size is 4 pixels.
+		 */
+		if (direct_mode)
+			adjust = dst_clip->x1 & 3;
+		else
+			adjust = dst_clip->x1 & 1;
 		dst_clip->x1 -= adjust;
 		src_clip.x1  -= adjust;
 
-		adjust = dst_clip->x2 & 1;
+		if (direct_mode)
+			adjust = ((dst_clip->x2 + 3) ^ 3) & 3;
+		else
+			adjust = dst_clip->x2 & 1;
 		dst_clip->x2 += adjust;
 		src_clip.x2  += adjust;
 
-- 
2.35.1

