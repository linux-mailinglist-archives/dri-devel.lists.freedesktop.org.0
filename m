Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5150D36F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4B110FD50;
	Sun, 24 Apr 2022 16:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F7210FCDC
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:27:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 231395C006B;
 Sun, 24 Apr 2022 12:27:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 24 Apr 2022 12:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1650817620; x=1650904020; bh=jS
 AQioVCfjpv/SLyFbyb4J2+q2O/sEhXHaA/OKfch5E=; b=owH8nFbrV52KXis1jY
 saHuNJNk2iaCJfvgGc/5hy6qVCVBpUxgvMpP2f+1mSU90rPv0yjW78TAO+88d12M
 Ik+shxrRh7w0tZV1ThDBjEhl8Q3pE22T70xpSEtHfCNhFR4v+prC0Ou7ljtw8Qqs
 Sc1Uq2IzzYwmpEgllgRlZ5UhUmPDI817AoIbzYtrHaY8Mi2VEUTCWtPpVrnRNzUJ
 pFouG8HQWxma2kxFKIMHVDTUgxhTVnhIUJrIOMcOkSJoFBnXMIczFnvxdbxxpONo
 /PyNbMZf4+Z32O4rUN3vQxXeLIWAQ/1nq0hi2fE5oz+Lnktsuy1XLnUQyVj31Bw/
 huTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650817620; x=1650904020; bh=jSAQioVCfjpv/SLyFbyb4J2+q2O/sEhXHaA
 /OKfch5E=; b=t0JVulGjxI4PsCXNuXNVbyincET5yoEBeY/yYSnzub+xXUAq65R
 hbVuiYd/SBTWe8sd0IPP/3ayZdWyvFNFDu8zP3T0RTVrWsP+MTR64qY420tNhMA3
 Ek3XOtS4apzSWqbG6vYFJ+oe4/8znt4tpOhZUb6FIBSm7zE+mAWvd+EZdh1Zx8+j
 W7zukWCtyq36fL4sxVoiwtZE/SvY0krtkctcvn/vtY2zSl0HsOjBXKp+Vn3uUtGp
 J7UtxM7OP5C0JTqblS9UxVhAFFZqYUs5NNbNxTglEwj2tgm/ZrgDCDOwKEwq5qhm
 my6RF94vjKLfpCNG7lJx8WfjGmnvLZCT+jw==
X-ME-Sender: <xms:U3plYjB7FB0exoC0CwYNxAE5m8h3h44KS4xEETiWTP25PQRWl7IYdA>
 <xme:U3plYpivm0CR2oHO8iT3Y1j_Wzy2IY1ILk101Cg1lyeJE62NCliBBwjRObEqGpREw
 GIo336d6cr2m8ZGyQ>
X-ME-Received: <xmr:U3plYumrjAm0NRi98tmGAFY2cmC5nNHG6ON9Eoq2ofEhOtETgr0YtIZnpX-NpIkaU29EXAr646SKnnsYdsJ9zoj9KXJowBNZJA8Omb8c1xpb5xpyuy3MsRbLba_JlIhmaHQOUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
 udefiedtveetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VHplYlz0B0Hz-b8oEcKPGZyhOuVbZ2MC7Hl_K0tnb7UuS5DLhdRTaA>
 <xmx:VHplYoR3AR_vn3CkaPDlzCF0dkc0iiiQyVBmymP4PHIhMfnZf8ZJww>
 <xmx:VHplYoYXl6sb3ozlDQqOyOQt-feduj_REUdPDKEgXYJiHV-5qA55ZQ>
 <xmx:VHplYsYX2uZZQNc-VKixgQI0wECDG9s-rk13dVftoBrcDd2-CyeRwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Apr 2022 12:26:59 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 13/14] drm/sun4i: Add support for D1 TCONs
Date: Sun, 24 Apr 2022 11:26:31 -0500
Message-Id: <20220424162633.12369-14-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-1-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
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

