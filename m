Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF64FCDF0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD2D10EDE8;
	Tue, 12 Apr 2022 04:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B5610EDE4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E5ACB3201F1D;
 Tue, 12 Apr 2022 00:28:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 12 Apr 2022 00:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737729; x=1649824129; bh=jS
 AQioVCfjpv/SLyFbyb4J2+q2O/sEhXHaA/OKfch5E=; b=dowpTa5LZdIxxp+nIi
 Pl0wXMy8nI4m7zV2yq3HvoCxdiUBcNW3m5Bsxe0CEARYnce+MfFzZvasNZcV0Zvi
 57ApH9N6MZZeV4CiL0YN2sCiXDNKQL+K/nhCqvQRcH5vHcy5y1jwHEbjnTneQIUJ
 DVKh68bQDYd49bIeiF1TH6DJc3yQv2PKnyRsy/jzSZuOd4hyoTo0J/TDcriZPDe5
 uWsP5R0S+naJE8w/gX6qDKiNjT6THHxHq4QAQK1zm1QSNZ2X0M7jHvZpQn7xzI0M
 yqJbwB8GEZu3n1EumLUcoeOlV8vQYa84o08Jn6OcvBLiVjGp7a5DxFvlgs6vB+WY
 pLvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737729; x=1649824129; bh=jSAQioVCfjpv/SLyFbyb4J2+q2O/sEhXHaA
 /OKfch5E=; b=NftlAV747ggiVcq6SSlQH8aO9xf+bRBcTH4CZIbxI7xdNqMhK0O
 tZKWq22Jh9jMVBan5QjgRXiAs1pjz4P1RES4k9KISxcv6tlfyc4dhlsz4wb/zAA5
 XXsvViNEOTD1MjVdEVEuYGiygGlGP886lnrCmIe4c5l2v/PlgZbSvv6UMsTIXoGl
 QDKvOpDmyL/XXonzcl3DxaufLWer/gg1YmZTyb/NeDd0Q514w7rHgO3YBlmF/mV3
 A8pSnslGvlFrbMqj4lHAdB8LsAmneSsSfUMAhaKQtOfA2QKNoRVQRtLiAKEeMsce
 O1K61+9onAYh0EWguXfQnowmh0LAN3w+GXg==
X-ME-Sender: <xms:AQBVYtSFhn4rYafff1DKl-gaC0V_HlHolaWeXtKt-lM1rehcvvMcfw>
 <xme:AQBVYmyP6Tr3CUSD4mq40bH-zRWmVquLYQIKvw39ZYGEc4m7_9WXkA8KCjXlIUFTv
 YIXaAgP5-DMaYGvIQ>
X-ME-Received: <xmr:AQBVYi1xPcPxKIMwf5-zRG9W3o0etc_uTqb_LpTaWA-GLUNfWEbMm5OUm2l6aHqJyiItUmGsjV7wSdFiRkVYx9jnTV4wCajUXSHy7l6SlvWUCPF4KNkqZhZkJJPKkyEHhQiedg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:AQBVYlAKN_XOwtP3y21vy844AQFgm5LhxDDbLp7uF-S2V63qUCMgyA>
 <xmx:AQBVYmgIt_nUJGtSvEC5Ojwx3i_1oN3Nee9FffNKUNH1ylvo4GEEZw>
 <xmx:AQBVYpqgQjWqV8T-0ZjKtp5dFPMimkEsHYeBciIDB0yflI6MQtX-aA>
 <xmx:AQBVYtoNis-NW91HDa0DE5jaDavdVDlTJTYTZ-7AD-9l11SVZQhQHQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:48 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 13/14] drm/sun4i: Add support for D1 TCONs
Date: Mon, 11 Apr 2022 23:28:05 -0500
Message-Id: <20220412042807.47519-14-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

D1 has a TCON TOP, so its quirks are similar to those for the R40 TCONs.
While there are some register changes, the part of the TCON TV supported
by the driver matches the R40 quirks, so that quirks structure can be
reused. D1 has the first supported TCON LCD with a TCON TOP, so the TCON
LCD needs a new quirks structure.

D1's TCON LCD hardware supports LVDS; in fact it provides dual-link LVDS
from a single TCON. However, it comes with a brand new LVDS PHY. Since
this PHY has not been tested, leave out LVDS driver support for now.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 88db2d2a9336..2ee158aaeb9e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1542,6 +1542,12 @@ static const struct sun4i_tcon_quirks sun9i_a80_tcon_tv_quirks = {
 	.needs_edp_reset = true,
 };
 
+static const struct sun4i_tcon_quirks sun20i_d1_lcd_quirks = {
+	.has_channel_0		= true,
+	.dclk_min_div		= 1,
+	.set_mux		= sun8i_r40_tcon_tv_set_mux,
+};
+
 /* sun4i_drv uses this list to check if a device node is a TCON */
 const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun4i-a10-tcon", .data = &sun4i_a10_quirks },
@@ -1559,6 +1565,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-lcd", .data = &sun9i_a80_tcon_lcd_quirks },
 	{ .compatible = "allwinner,sun9i-a80-tcon-tv", .data = &sun9i_a80_tcon_tv_quirks },
+	{ .compatible = "allwinner,sun20i-d1-tcon-lcd", .data = &sun20i_d1_lcd_quirks },
+	{ .compatible = "allwinner,sun20i-d1-tcon-tv", .data = &sun8i_r40_tv_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
-- 
2.35.1

