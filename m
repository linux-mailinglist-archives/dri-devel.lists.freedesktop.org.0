Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA171F82AF
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D08F6E41F;
	Sat, 13 Jun 2020 10:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F016E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:38:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7DCCC5801D5;
 Thu, 11 Jun 2020 09:38:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Jun 2020 09:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=fE9nFDf8bvkUK
 xQdeAn9b8Mf0rGQGKBryUWgZXvi4So=; b=WDTIL3v59nRbZ5++Sq9FwglrW3KQa
 dnrrGskjhXLcfSQwh+5OrsW6yfWCPd3Spm1Gqiqc4+OMD2Xvv+0iuPrkkLhBEXNT
 TShSNE+P2NVBXycnsfKd9uM827eylEoH5xiq/egxcF4bsBSzY942mGRJkvi0r6+S
 uvHQnlnqSHKxVfssGlqlO12yK1SUp2nr20Ldi0InymRmCoWhdGvgMLhy6+q/whuU
 wQ4kg9OFBE4D5OxAXpSHRAC31u4q25EPVFHiDIuajHBGbWk0Z6Om155FT5irejKg
 G1SuekgcrBCZNNnNM3VWx/wqF8nOgdZ0gcka2lmBxexOyJ/REcnySDyVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=fE9nFDf8bvkUKxQdeAn9b8Mf0rGQGKBryUWgZXvi4So=; b=r82AiJpe
 At1oz6KRTjKib80jETfxf5bt2rossEsOUkFA4IU+dbZ86uANxwVcFptJ8w+OO7kp
 Lq8sNT5kDK+dQ/0uxkAed3GPSiLOF08QYPbpbAavHnFr6htrTC4lIne8GdJyCnWW
 JO9JLiYRQ+inttbsSMU2hYVKv+pyql3HGrZ8lDCjXscLAWMXXzkyXud0aE1hMcQF
 WfY9vM0YNbqaJJ8huh/fu4HDLI/DJVi0A3zd3nEGlYxIKVwoYg5A9DFOoEJGtkl5
 mcJ6+mq/wNbh2RBmXFOjENtuhLIfWshrMtO0vL9WM18Yo3WIFQytqusWKB2YWkMG
 vGvMQ9ePqEwyQQ==
X-ME-Sender: <xms:4jPiXkuCOVr06TX1LMi9u4lf9rqSnQnaYvWV8hpLIYIw2BqS1ljC_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4jPiXhf4pYQyzoHkiewrnYVf4GXlVXGtv76gYpn8_-ncDidyHsH6fw>
 <xmx:4jPiXvyjIzaIzikk5BO2MusG1jMOqY331vUqMTK_9yLpg8JUbTz8MQ>
 <xmx:4jPiXnOmtAseSoLD1-nkaAN-b_JCZTw-l_26bFyByn8HV9D6MIN8Jw>
 <xmx:4jPiXhO26faw7exuJvjYPoebjnpc125MSggyuNxxx2knPgrXoBvjEA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13E7A328022E;
 Thu, 11 Jun 2020 09:37:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 1/9] drm/vc4: Reorder the bind order of the devices
Date: Thu, 11 Jun 2020 15:36:46 +0200
Message-Id: <2d7fcde29dec429442eb76afc51d8cc275cb407f.1591882579.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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

We'll need the HVS to be bound before the HVS for the upcoming reworks, but
it needs to happen before the PV are bound so that the code to set the
possible_crtcs field works properly on the TXP. Move it right between the
two devices.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 7792c97d4303..38343d2fb4fb 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -343,8 +343,8 @@ static struct platform_driver *const component_drivers[] = {
 	&vc4_vec_driver,
 	&vc4_dpi_driver,
 	&vc4_dsi_driver,
-	&vc4_txp_driver,
 	&vc4_hvs_driver,
+	&vc4_txp_driver,
 	&vc4_crtc_driver,
 	&vc4_v3d_driver,
 };
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
