Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343941B8033
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA96F6EB6B;
	Fri, 24 Apr 2020 20:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381926EAA9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:37:07 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 4174B1449;
 Fri, 24 Apr 2020 11:37:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Jn2Yw7XmN1tEg
 5k08HnR3ugajOh0QZLlXmPoZNcHi6Y=; b=RElFd/oYRjB9tjeC3kn5oVJ60yuCd
 QURBBzrcAbc32bEJ+4SW4KeU2ildyLGi1Sq+77BPRd98R2JV7neMDW9qHoMkYH1d
 lblRC4zuMinciWXc8jxLmxzsefU+TvLWIsCyj/xjFLUPUstLpaZyIyOAJ1XPjk36
 jwbIyfecZ/amqIrLBdprkNXCkzbfju3nMmnNAOsOLEMr7JHXzrzhO7N0dvNTQJSR
 MXO9XmpgjX/5wi0mU/OrhyxoecahMFRIXqUjyVG/KySYg43FThEGM4gFc5qpd1XE
 rEhVXmVImknGuH55SQ8RVypEyAV9ascfSfQlyo+WEX9WH7odggaUJL/OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Jn2Yw7XmN1tEg5k08HnR3ugajOh0QZLlXmPoZNcHi6Y=; b=BjO8et2s
 4A0Vjx0CXHZX1VjC0Tmwnw6hn58KyQznfBrZdiVoHGj6AKrop486k8QuPkxlkpU1
 +mi7g+eveW+xAFYsMjV52ThOY/QbRR91QjAfMI2GOG5FaKrgAkR9M81qiY2dYQZn
 0X/2gBnLdX0PoltAVDoIvhPwqa9U9PJUFK8pR5Ie2sYtOKuzqyI9j6ik3TzcxlOm
 /n+Nng/tQ/TKD5onV5xkGGQbSc7H92an16QGpWb66s8PQD+EJCDxToJfG//FJQhe
 R8DFY7xjIzBxvc4KxPkZaRFdsdZAItdQSuX6K4NzZBqHaDKOUhJSzGgIkTgoEcoy
 hhaCrZo655XK/A==
X-ME-Sender: <xms:oQejXkyStvesDgaeKPnwoL_tZVK-YEe-raF1xqofooOmLXnKF9oZ_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeeiheenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oQejXi7CvMeOCKCmUCZSocxlwWaRvYDaQ0nlYkxuO6hQbvLN7oY5NA>
 <xmx:oQejXsW33Zkh3X9xkRyPYgFRQROoWdnBb8rpYPvahnxjm0234OdF5A>
 <xmx:oQejXiI5Jb_UxBgcYeCaX5dqfPCX-x6_2D5c9hNj0RRs_6Ze1Zua6w>
 <xmx:oQejXqNCwJr-RVhwsckzff4tNT-uiZYD93dKOKjV9QQrhBIzBj2Lb0SPn5E>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 81F703280069;
 Fri, 24 Apr 2020 11:37:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 74/91] drm/vc4: hdmi: Add reset callback
Date: Fri, 24 Apr 2020 17:34:55 +0200
Message-Id: <18ce7e4d5612069dfb06aa48a61ed9385b31b21d.1587742492.git-series.maxime@cerno.tech>
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

The BCM2711 and BCM283x HDMI controllers use a slightly different reset
sequence, so let's add a callback to reset the controller.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 9d03b0e7edf5..4bd385f86034 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -68,6 +68,15 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 	return 0;
 }
 
+static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
+{
+	HDMI_WRITE(HDMI_SW_RESET_CONTROL,
+		   VC4_HDMI_SW_RESET_HDMI |
+		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
+
+	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+}
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -371,11 +380,8 @@ static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
-	HDMI_WRITE(HDMI_SW_RESET_CONTROL,
-		   VC4_HDMI_SW_RESET_HDMI |
-		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
-
-	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+	if (vc4_hdmi->variant->reset)
+		vc4_hdmi->variant->reset(vc4_hdmi);
 
 	/* PHY should be in reset, like
 	 * vc4_hdmi_encoder_disable() does.
@@ -1418,6 +1424,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
 	.init_resources		= vc4_hdmi_init_resources,
+	.reset			= vc4_hdmi_reset,
 };
 
 static const struct of_device_id vc4_hdmi_dt_match[] = {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index f7d0ca9447d2..93695674c2d3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -35,6 +35,9 @@ struct vc4_hdmi_variant {
 	 * clocks, etc) for that variant.
 	 */
 	int (*init_resources)(struct vc4_hdmi *vc4_hdmi);
+
+	/* Callback to reset the HDMI block */
+	void (*reset)(struct vc4_hdmi *vc4_hdmi);
 };
 
 /* HDMI audio information */
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
