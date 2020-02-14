Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E1160CDD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C966E593;
	Mon, 17 Feb 2020 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAA26F903
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:24:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 333FC734E;
 Fri, 14 Feb 2020 07:24:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=bC7S86a4jGL63
 niIbDq1SRfkrzDp7RcwzpEdiRnR5HQ=; b=tjVpa68swhCHL7XkAD4r3YiwBDAk9
 AsTaFK31nPwN+5FI/obez2qZjo4kgraENOyfJrx1UEvWiTSn0Ks9TfDkHZcjSHT3
 Ya77mY44vvdhnYbP12yF3cPSLnrnYJ8QW912zlIGtIK3Bz23zYzhG9MlgoOF31Ow
 aSp5aetfk0ojcp6xIRi+E6bTze/DqLC30SFutGfTknxtnTNAwLJsCcS+LQwlDmjH
 I2GoeIQlTOWTu4GwZTg6aBQOmxQyz0jwMsgE17CfPt4r+LHlpDjJZdHRnoPDxsXN
 jb6kLZEek7M4Us3W18b+PUE0uN0wTx05QUIb5sH2pBa9GkhU+BH6CgXxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=bC7S86a4jGL63niIbDq1SRfkrzDp7RcwzpEdiRnR5HQ=; b=YRsFt0v4
 1LH+T6thCxVx7vprAn5UedpAkslwwc//hZB102bNJgEhTPFAh+csany84R916EIp
 HSQE9KgBKRYvb3hVgvMGs8yz1Sw0YgqT8zVlCX5Zlx0RgxHtgknPzeCH4x7a2voU
 lOqjbJNjMjhX7VxDLII0vMNcfxCdsG+cHO/6A1q2JuhacAZRJ071L7VNh21jgnQK
 vkLbZGAtOh6OuqVJiaGHcxvO8SFdQHtvFhEm5j4v9MpeJWrg7Is/ox/ErAOMhSFo
 vPQe6cwrSdxSS8BSQ3kwD8BgxZuFduI0jx0zy+z9Ph0xzeS3QQ3H4i+Hku/ZyMFS
 q6VD5MbtD9pTyw==
X-ME-Sender: <xms:kpFGXhsusgwAHOvZcK7Kxvw037sIa4Rvd1G6b0N91JwEWSKrNo2voA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kpFGXvab4L3-G1AVtcr9IekTDnEp9b6OfTc4w5xlnjP22tJOu_Uabw>
 <xmx:kpFGXgRJ3qct5HqMTOaNbL4FzfMp-o6wvm1Kmhg-J_CRfZt0FhVXGw>
 <xmx:kpFGXrW0E1ZQWX8IGIQEvoI0K02zNH66es2IatLgJLlh79WLuzJccA>
 <xmx:kpFGXnMKd3W62XOua_YekANTasW8RddF4Y2ogTrkEj20EKjNCiQk5g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C60113060EF2;
 Fri, 14 Feb 2020 07:24:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/sun4i: lvds: Support data and clock polarity flags
Date: Fri, 14 Feb 2020 13:24:41 +0100
Message-Id: <011bbc064e12acb5d8848721f8ff94e50754a9e4.1581682983.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our LVDS encoder can change the polarity of data and clock signals on
the LVDS link. Make sure we don't ignore the matching bus flags.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index c81cdce6ed55..fdf143042f83 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -404,6 +404,8 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 				      const struct drm_encoder *encoder,
 				      const struct drm_display_mode *mode)
 {
+	struct drm_connector *connector = sun4i_tcon_get_connector(encoder);
+	const struct drm_display_info *info = &connector->display_info;
 	unsigned int bp;
 	u8 clk_delay;
 	u32 reg, val = 0;
@@ -449,9 +451,17 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 		     SUN4I_TCON0_BASIC2_V_TOTAL(mode->crtc_vtotal * 2) |
 		     SUN4I_TCON0_BASIC2_V_BACKPORCH(bp));
 
-	reg = SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0 |
-		SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL |
-		SUN4I_TCON0_LVDS_IF_CLK_POL_NORMAL;
+	reg = SUN4I_TCON0_LVDS_IF_CLK_SEL_TCON0;
+	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
+		reg |= SUN4I_TCON0_LVDS_IF_CLK_POL_INV;
+	else
+		reg |= SUN4I_TCON0_LVDS_IF_CLK_POL_NORMAL;
+
+	if (info->bus_flags & DRM_BUS_FLAG_DATA_LOW)
+		reg |= SUN4I_TCON0_LVDS_IF_DATA_POL_INV;
+	else
+		reg |= SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL;
+
 	if (sun4i_tcon_get_pixel_depth(encoder) == 24)
 		reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
 	else
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
