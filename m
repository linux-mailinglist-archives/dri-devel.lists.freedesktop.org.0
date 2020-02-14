Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A39160D12
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B67F6E845;
	Mon, 17 Feb 2020 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84796E7D5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:24:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0FE03AF4;
 Fri, 14 Feb 2020 07:24:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=2f3VFRjW3B+zONorxo3OTyEyy8
 z5poB18m7XL4T/tlo=; b=ht49Dt1YpFBVR6qEV2lxiV0ZvCn9WXy/XSB8C8v3fj
 kizud/Z8YazI0LislRtAooDuAFtWqfMn3H5bQXX3bOsar0HU9QtKHV1OMT6kehMd
 zohdoS7aoBv9Pbto230VOwh6pXVnW/5wKnD2wX5S9+y5PvdJwRHgiE6oITiBR/TE
 vBtunnRT/VIegClqgGZ6BhfpMXcOUrlLJ64stOMcbBVi0EFoOo1njeAsppHWcnqi
 hBMWItowQPNvNtyLip0w8/ZTV695vthkeKZ3uiChDns/yn8KN58BgyRsWSguGYia
 1mfLYVYf20WD+j9mwr4ky37YVay09s+UN5YX391l8H8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2f3VFRjW3B+zONorx
 o3OTyEyy8z5poB18m7XL4T/tlo=; b=slO2uGFs4EkJN83M7x4pGERBGwNqyEh+1
 hXlAl8ZidI1J7pJ9ADDMySyfsWF2gTDxvXyFslTgoZCCGPcgrXG6foU6y9E3cGJW
 ZVjID9oIttD3FWgdoopxk8y4VSy63jKGCevrFiKvcJ0q6maM9xWvCD8oG6NwW9jj
 T7VOBfCq4hJhGiCV1FEN9HPLihIi9VnaVaVxk/qG9kDzdONCaOvH6SdLxwCWqs4q
 xYUlBc1PwIpsPFaSFvuGoYJ7U1OJN/D4hy5vT6MdtKSvjCH2YNcJLPezahPb7eY7
 DMqaRMv7ObsHsFGoLTsnQEWULJ6A9HTEEHLnDs3WEsaQN3YuSaemQ==
X-ME-Sender: <xms:fZFGXgNYKVkylRZpKb5k6Y9PPhxkoo43yJOAQM4IJ8lNyf7SiPOAYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fZFGXl4wnGzixgpbuwFprXm49iPzt5bjM5iFa3k3cTs3G_nx6ux6BQ>
 <xmx:fZFGXjV_R-Crz4VvDURlqG-OSApRvbsyj91j9KR6WgTyXv0248iVPg>
 <xmx:fZFGXsM3elag3TffXXGnSkZ1MbVzHukdPq2jivJLhmd6-4D3dAAjvQ>
 <xmx:f5FGXkLQNIDHojlcgi4bI8K3by7TVKbddCulJhR0ORtoNV6BteBWSQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E495A3280062;
 Fri, 14 Feb 2020 07:24:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
Date: Fri, 14 Feb 2020 13:24:27 +0100
Message-Id: <20200214122427.108675-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
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

The A33 TCON supports LVDS, so we can toggle the support switch.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index fdf143042f83..14026b4fa7c7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1475,6 +1475,7 @@ static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.has_channel_0		= true,
 	.has_lvds_alt		= true,
 	.dclk_min_div		= 1,
+	.supports_lvds		= true,
 };
 
 static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
