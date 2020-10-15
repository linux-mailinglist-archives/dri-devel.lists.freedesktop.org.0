Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A52913F3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023CD6E22B;
	Sat, 17 Oct 2020 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD426E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 09:36:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 52AA17C8;
 Thu, 15 Oct 2020 05:36:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Oct 2020 05:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FZs5a9C23ycx6
 2Wbw6P9wyCCk7gb7aty79pnPUuMtVE=; b=AvT+BWXLmLiXuX4a8b4HbjXfGG/Cj
 P0FCnp7iUsGnUgRoA+KpBo8luimUIB5tU/l4Nm8rjKdI/j69xpkKFaKg8EPrpxG9
 AmqIQ3QYV7OOzbXuwUOCU/xZdbSWo8erPYYIEH0a0RA1vuNss7NTKZQGOXeBi9lc
 Ah+Y38KQOG7+UHsFI5EcRzRWbCDjLqgrduY7Uo/9xNiKHFZuFQ9jHBA15CpBGMa3
 xKPAp11YSQoRnecrW25vbES4jIMcqEuMxOjh+U1qS91xQM2KRdnWuLxmuvkSRK4u
 ToVOeCrL8jgB+xtfOd28RFCiuwIy2C/HY5ThzbVGOhowj6z42fHtTzl6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FZs5a9C23ycx62Wbw6P9wyCCk7gb7aty79pnPUuMtVE=; b=azELejjj
 e1mOoOhzH24qKpGved/eUZ5ryij0iBcA5IqLq0G6GJ/MdmY+pVGGdOfUNJ/GrYDM
 sv7FoBQRso+NJwvOcQ90BsDjdTTGRQiSxpzvyBOFoF+UPE4jNQbRSgoWUSlC6apc
 Wvv3/9Q/2RfFMy9NKKUfu2w8OQu3gWS3SWHxgr1hJstnhd/XpxB3uZA9CEwdswZD
 1SmfBh88twtoDkWM17WFKAz7RZjjDVm5yJ3QkLCk64c2ZDkY+CTn+rWtzCSQpjM6
 wuuhtX9Kilp28ZkojHijGt7lWG0u6XAkODHLKZ/Ubwvzo6MVfixcO93L+1DsR8YP
 2hH0iuTCoVzKug==
X-ME-Sender: <xms:LhiIXzOnuHrpBW7J5m1S2kQuI_UwIs9sWGe1zwC9ynTPcQ_A6RABng>
 <xme:LhiIX98e0csmI96CHxFhG_Ffe0Y7g2pV8VQa8UGrU4AARlrzLsYigsPDiGpVEABhb
 9F5bARU6FAKQRryxx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LhiIXyTXunhGIY4qGQCBkztNfjgDtG8GbmhGafGFv55R7KCvLhCyDg>
 <xmx:LhiIX3te6xZfrst7ptoc-qNBhziy5K9PLi3pi0OVCUyKEFpuof5tKg>
 <xmx:LhiIX7eAwTg4lPhM0fl7cwGEs4QIDMOl-7y6hZemq0dZi20pD35m3A>
 <xmx:LhiIXzQ_uijCu_cKCw8ZhznSKa1sr1nxMDKQDIIyEoumfOoy0WNczg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78BEF328005D;
 Thu, 15 Oct 2020 05:36:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/3] drm/sun4i: frontend: Reuse the ch0 phase for RGB formats
Date: Thu, 15 Oct 2020 11:36:41 +0200
Message-Id: <20201015093642.261440-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201015093642.261440-1-maxime@cerno.tech>
References: <20201015093642.261440-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Taras Galchenko <tpgalchenko@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using the scaler on the A10-like frontend with single-planar formats,
the current code will setup the channel 0 filter (used for the R or Y
component) with a different phase parameter than the channel 1 filter (used
for the G/B or U/V components).

This creates a bleed out that keeps repeating on of the last line of the
RGB plane across the rest of the display. The Allwinner BSP either applies
the same phase parameter over both channels or use a separate one, the
condition being whether the input format is YUV420 or not.

Since YUV420 is both subsampled and multi-planar, and since YUYV is
subsampled but single-planar, we can rule out the subsampling and assume
that the condition is actually whether the format is single or
multi-planar. And it looks like applying the same phase parameter over both
channels for single-planar formats fixes our issue, while we keep the
multi-planar formats working properly.

Reported-by: Taras Galchenko <tpgalchenko@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_frontend.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 7462801b1fa8..d32b12cbbb60 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -407,6 +407,7 @@ int sun4i_frontend_update_formats(struct sun4i_frontend *frontend,
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
 	uint64_t modifier = fb->modifier;
+	unsigned ch1_phase_idx;
 	u32 out_fmt_val;
 	u32 in_fmt_val, in_mod_val, in_ps_val;
 	unsigned int i;
@@ -442,18 +443,19 @@ int sun4i_frontend_update_formats(struct sun4i_frontend *frontend,
 	 * I have no idea what this does exactly, but it seems to be
 	 * related to the scaler FIR filter phase parameters.
 	 */
+	ch1_phase_idx = (format->num_planes > 1) ? 1 : 0;
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH0_HORZPHASE_REG,
 		     frontend->data->ch_phase[0]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH1_HORZPHASE_REG,
-		     frontend->data->ch_phase[1]);
+		     frontend->data->ch_phase[ch1_phase_idx]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH0_VERTPHASE0_REG,
 		     frontend->data->ch_phase[0]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH1_VERTPHASE0_REG,
-		     frontend->data->ch_phase[1]);
+		     frontend->data->ch_phase[ch1_phase_idx]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH0_VERTPHASE1_REG,
 		     frontend->data->ch_phase[0]);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_CH1_VERTPHASE1_REG,
-		     frontend->data->ch_phase[1]);
+		     frontend->data->ch_phase[ch1_phase_idx]);
 
 	/*
 	 * Checking the input format is sufficient since we currently only
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
