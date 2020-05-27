Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0D1E59B2
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96806E49F;
	Thu, 28 May 2020 07:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C759B6E340
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:51:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3AECF582101;
 Wed, 27 May 2020 11:51:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Z5JNWa+khkkPT
 A5Ia7+v7mohqb/B090X4sPaakkB4jc=; b=qqWPMuAyTDdQfrfyYk1Ym0j/4p/Uv
 91o0yqsQMtl8AkIEiKrHrVTkhasZKcy+KhJqAqbSpDNchz3vkrDsRHM6L7ekh0T9
 +SMIniMCmTU+dVLVAX5btS4ko0f5JMTfs+qBXBnNX8PuWwY5hBiwaMa+r9goHnBs
 bOiafp2wfsZ96I8xPBcpJik/tjWnJ+xwkwn7iCHxxc21sTfqBJzSVbjtDge8bwhk
 1pVLrOVKQXLQ9fAdMJMp7m/e5id2UbxiYYfGI2Bfa4/RwJwCMsnZKuBJNyeYTPUw
 RruV6TmpTyOiVO/OveI/6hrjnX3UCZfgQ7E2bDWIrJ+Gjs/7TvrCXsDeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Z5JNWa+khkkPTA5Ia7+v7mohqb/B090X4sPaakkB4jc=; b=XlOWjSI/
 MV7i8bVZ8sMTprDuGNG8P4oDOJcKQ1O5LTBsKakTaVOL9Xy/UFcK+wqp2U55IIm6
 QjRJaWG0Ir8Y0xs29qyetxXo4qnrFsVn2lIhvizSThMc6gosRLO0XFqs4eAoH17/
 GXAnZ4u6e+Mxuv1C1NNoGKqwuZrH7p4jQf+FcoY+SXOmMkRecU+r38B37yHBpxDj
 JEFI9ur2NM+IsV+QDyRYDdS+S5T/t+gpVpyiIL9B2Jln8gjhb85gOSAyXYgr5KbM
 EwagJYi6Gg4c58Vo62XiU90TVk/eQNsjQ/cHRjWLg2jqdk1kQX/Lrr71Um76XKBr
 ZMg3PkjpJCTYOA==
X-ME-Sender: <xms:jozOXhDCp8m8hrjw9gGeTQxw__G6CM8fqjTp330kwSWpF6cWTbM-0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepieejne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jozOXvgcfqNDOY-hpin0hmQyB9PB7vquHF3dhNZGbbma4IQn30X5gA>
 <xmx:jozOXsl9uabmycJPIgdmCCrTRrNbekUoWBIMpNv8t8R08RC77io3-A>
 <xmx:jozOXryQLCye_aseRfXUS7KNs0ur5LpvzCHy7B50hkHipqxMcUgGTg>
 <xmx:jozOXjTVCJKduXePkdEL_RnQIdYY9Y7ocAk7dVOW4SP3jvne49xagg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C90743280068;
 Wed, 27 May 2020 11:51:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 092/105] drm/vc4: hdmi: Use clk_set_min_rate instead
Date: Wed, 27 May 2020 17:49:02 +0200
Message-Id: <c946ab1946901d2d9426ce24733ff1f190f6096b.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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

The HSM clock needs to be running at 101% the pixel clock of the HDMI
controller, however it's shared between the two HDMI controllers, which
means that if the resolutions are different between the two HDMI
controllers, and the lowest resolution is on the second (in enable order)
controller, the first HDMI controller will end up with a smaller than
expected clock rate.

Since we don't really need an exact frequency there, we can simply change
the minimum rate we expect instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index eda48f58dc01..c069bf8e6d7c 100644
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
