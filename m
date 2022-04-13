Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35655001AB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE3910F152;
	Wed, 13 Apr 2022 22:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C40610F14C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CB4D95C02B7;
 Wed, 13 Apr 2022 18:19:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Apr 2022 18:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888387; x=1649974787; bh=fM
 itBsbOl69eJtZqeNqN7y5Gep0bncSngDUeMZp8zB4=; b=qJkffVFYB9u7OIdDzI
 T+1qUMCsmcnyDpSK9V3nkFZ5QOoQsHC/fGuXl63TdKyWdr72KmxelbV6YPH7WaQ7
 Baf3DTKZeommUEDIxwu+J+/OwRmkTX+phQZWLXNE4EyZ/80yATPkevMKvx6PQQku
 DvbyMupWMAu9HlWSjjud30mpLgrW1oaWCLhiDEuirEqfEAgEbRvOd2i1IWyhqqmo
 flEf8CWNhsligN4vGyse639Z6hV+Avv09HlueYb/KVCsbk7jLUeIaQ/MRmy+AFqH
 Q2lNi5ZeQNi5RgdxbYaaq+YAowpHa5WnFT3Ek6/aP2swQ7dSpi0Myn0Ctc3uTi6i
 TQNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888387; x=1649974787; bh=fMitBsbOl69eJtZqeNqN7y5Gep0bncSngDU
 eMZp8zB4=; b=iFab+bH6MXUBpnDsciPRLYKcTitrp1MRRAMJsBccGx0Yj72+C54
 qt0C6cHdYHQgI536AX+ZfWtAyYD1261wPAL10dugJO1L+R9kDXDwJVRzYgYhS3Wg
 igMT9SrlenjEXrpj5bTVasZpwFp+wTYHSKMLPgcjAoorkJILWjszYaFWU3DQZQ39
 kzqHcMf2F16lcAa/dIedVMMsg16vJ4kPkYy96vHFp+Wl3hOZO5/cA1pXmsNA5mBv
 zsHy4zQi4qGoDlhvchcnQ36PgsEErts66IqUmxTVpmtRw77/GCSsf9TTdbO3aOhm
 zWRxjedZPyxwL68m8khLTjbcXEqqG0X0ezA==
X-ME-Sender: <xms:g0xXYtq0gLXvboy0GsxiZEeC8KTPOSWdgxykZ1PovVlJ4GwE-fuRyQ>
 <xme:g0xXYvr4NvcVt8DFEIPal1TSYh8yQP0ibPrNXLjBWowNxIACW_-TP4vZEOP9ZuRuh
 jmiAInFIKbEKxjCzA>
X-ME-Received: <xmr:g0xXYqP28O_1v3d2s8ihZrOXJHO087D3eoZp-zESf8_e14M2VIr4Fr-CI38FgW4fW2UkcT1T6nqOAPJ6xgz7Dbstc3ddompA2lT8003K7gRMMdxShzkl4TjgGHbyO_TGYHrOKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:g0xXYo7hVqSxK_v7zzGMhpv6w6KepFsAHvIN3-z_fYIXJzfSddXmdg>
 <xmx:g0xXYs5hz1byBMezdfKKKFLPTyxIYqtTlpEW7lWtZLMNI6MdUBqs3w>
 <xmx:g0xXYghV-pY2RFYK-Fql4TxS4Wg9NTzzw67H8D0vf2TYdIIPKy9WuQ>
 <xmx:g0xXYvLtXab7fJiPDP0JtGnNjmKr3qpGhkjX6aYWjlmCpp-DDddHhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:46 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 13/16] drm/rockchip: ebc: Add a panel reflection option
Date: Wed, 13 Apr 2022 17:19:13 -0500
Message-Id: <20220413221916.50995-14-samuel@sholland.org>
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

Some panels, like the one in the PineNote, are reflected. Since the
driver already has to copy pixels, the driver can handle this with
little additional overhead.

Currently, there is no devicetree binding for this situation, so control
the behavior via a module parameter.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/rockchip/rockchip_ebc.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_ebc.c b/drivers/gpu/drm/rockchip/rockchip_ebc.c
index 93d689ff0933..9d0b2cdc5fdc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_ebc.c
+++ b/drivers/gpu/drm/rockchip/rockchip_ebc.c
@@ -166,6 +166,10 @@ static bool direct_mode = true;
 module_param(direct_mode, bool, 0444);
 MODULE_PARM_DESC(direct_mode, "compute waveforms in software (software LUT)");
 
+static bool panel_reflection = true;
+module_param(panel_reflection, bool, 0644);
+MODULE_PARM_DESC(panel_reflection, "reflect the image horizontally");
+
 static bool skip_reset;
 module_param(skip_reset, bool, 0444);
 MODULE_PARM_DESC(skip_reset, "skip the initial display reset");
@@ -1046,23 +1050,29 @@ static bool rockchip_ebc_blit_fb(const struct rockchip_ebc_ctx *ctx,
 {
 	unsigned int dst_pitch = ctx->gray4_pitch;
 	unsigned int src_pitch = fb->pitches[0];
-	unsigned int x, y;
+	unsigned int start_x, x, y;
 	const void *src;
 	u8 changed = 0;
+	int delta_x;
 	void *dst;
 
+	delta_x = panel_reflection ? -1 : 1;
+	start_x = panel_reflection ? src_clip->x2 - 1 : src_clip->x1;
+
 	dst = ctx->final + dst_clip->y1 * dst_pitch + dst_clip->x1 / 2;
-	src = vaddr + src_clip->y1 * src_pitch + src_clip->x1 * fb->format->cpp[0];
+	src = vaddr + src_clip->y1 * src_pitch + start_x * fb->format->cpp[0];
 
 	for (y = src_clip->y1; y < src_clip->y2; y++) {
 		const u32 *sbuf = src;
 		u8 *dbuf = dst;
 
 		for (x = src_clip->x1; x < src_clip->x2; x += 2) {
-			u32 rgb0 = *sbuf++;
-			u32 rgb1 = *sbuf++;
+			u32 rgb0, rgb1;
 			u8 gray;
 
+			rgb0 = *sbuf; sbuf += delta_x;
+			rgb1 = *sbuf; sbuf += delta_x;
+
 			/* Truncate the RGB values to 5 bits each. */
 			rgb0 &= 0x00f8f8f8U; rgb1 &= 0x00f8f8f8U;
 			/* Put the sum 2R+5G+B in bits 24-31. */
@@ -1136,6 +1146,13 @@ static void rockchip_ebc_plane_atomic_update(struct drm_plane *plane,
 		dst_clip->x2 += adjust;
 		src_clip.x2  += adjust;
 
+		if (panel_reflection) {
+			int x1 = dst_clip->x1, x2 = dst_clip->x2;
+
+			dst_clip->x1 = plane_state->dst.x2 - x2;
+			dst_clip->x2 = plane_state->dst.x2 - x1;
+		}
+
 		if (!rockchip_ebc_blit_fb(ctx, dst_clip, vaddr,
 					  plane_state->fb, &src_clip)) {
 			/* Drop the area if the FB didn't actually change. */
-- 
2.35.1

