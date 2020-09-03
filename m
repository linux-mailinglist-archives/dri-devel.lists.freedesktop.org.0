Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4925D22C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2344A6EB04;
	Fri,  4 Sep 2020 07:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA61D6E59B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 930D5B18;
 Thu,  3 Sep 2020 04:03:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=jnQt4XEB0EjaE
 69LUU8juUV5o++ManSG9KwUOjrWqLk=; b=YxiLJTnJ05XHPLIMyp/gM48L7d78s
 69NozG54Oajg2BEdr1fFnJwVHTLV8lF11bv0xEiN+jznG4wOS5BbFVfWg67Pqubr
 e7aX3h3Z2LvxeZOvzD9MmDuxofW72rl8CGuJsvzP7TeXErAIfcXPYGp0TXcljamg
 rxheudTjQJRdzZzjOYylrCe8wbW5HHM0SlO6osHmSNBsN+Akux6V7FO+n6R1WJme
 /gZfy+58po/tZAOS1y1VuHojwVGOFok9zTdTJOoActidSHkXSU+dhx/iidnl+p1n
 F2MdgwTVrx1rGAFwlM27O6w7Qs82+z8WT/VQqtHympL2WWPwofqf2twOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jnQt4XEB0EjaE69LUU8juUV5o++ManSG9KwUOjrWqLk=; b=EFKxLPL5
 ZkaIe2dKrYMMBz3Z7t3eiTgCGyHHp5wqGO7x0zPsnKnO+eHauTgvqCWWNERH8HJt
 Yu+pliG9ugJxOIHPXUOB9pm3ek1ozBnzsHWK+cZGIQ7r2+C8x3LpzHQFaV0pbE/V
 iD53XJpO12voHtC07yOrM7YAfSRZUzUdjVStxzojYmcp2RCkn4r7QuQV8ukEgtyf
 gSian0RGPUI3zhM6OzvM3ZNN3RaL4fYadJzjRBkbowyNQ97UilPH2ToKtJzTeVbX
 SugDYIXLGm09Xwmo7oYExZaKmLBQyXI5GxzokI0NDwY5x+zOlryg9CrPlvpZfAVp
 8Iz1OMLt8ot5FQ==
X-ME-Sender: <xms:TKNQXzmVFl0b1JWcLe2g5WgriBpbsyKaR5YNGvHl6j-OcoN03nYyxQ>
 <xme:TKNQX23bMDNCijNUcJp-hQyj1tyeIyJrak9BDA5asZssDI9qffJKqzwhdnxA0Sggg
 BnQqjn5Jjumu9gi8BE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehke
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TKNQX5qzzXbu58rstGL268O0MYEHwUndv0AoP1y5eOc9o3DpxFMv3g>
 <xmx:TKNQX7lAzcclJZuM4oAjNlBL4Ji9Dzzs8qZCZT2TN469aS8jMtorww>
 <xmx:TKNQXx2JWs_wdy1HqSqluIT9WiB9wzjx2aNptbgpWqoHnMU-Yd2z7g>
 <xmx:TKNQXytfS6wS_f6pzKngBUu7S90leQSgIfBl0IppBBXYs8AYpZ8AaoKXt2c>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFF85328005A;
 Thu,  3 Sep 2020 04:03:23 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 64/80] drm/vc4: hdmi: Use clk_set_min_rate instead
Date: Thu,  3 Sep 2020 10:01:36 +0200
Message-Id: <821992209cc0d7a83254bf26fe2bf507ef0994d2.1599120059.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HSM clock needs to be running at 101% the pixel clock of the HDMI
controller, however it's shared between the two HDMI controllers, which
means that if the resolutions are different between the two HDMI
controllers, and the lowest resolution is on the second (in enable order)
controller, the first HDMI controller will end up with a smaller than
expected clock rate.

Since we don't really need an exact frequency there, we can simply change
the minimum rate we expect instead.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 84273fe650d6..487c04de6b85 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -462,7 +462,7 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 	 * pixel clock, but HSM ends up being the limiting factor.
 	 */
 	hsm_rate = max_t(unsigned long, 120000000, (pixel_rate / 100) * 101);
-	ret = clk_set_rate(vc4_hdmi->hsm_clock, hsm_rate);
+	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
 	if (ret) {
 		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
 		return;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
