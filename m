Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F683B5E3F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A1F6E453;
	Mon, 28 Jun 2021 12:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527DA6E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C2BD55804FF;
 Mon, 28 Jun 2021 08:43:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 28 Jun 2021 08:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=NEZ2QM3tf8Lht
 QofwUv9vuRki9oLSU2r4DmlnZqyNbE=; b=AsQm4+x7kdJzjV4XLzrn6AYvVMFth
 QeovHJ4w+g6o/GDcN3nDOxzHqi5M/w0C/eD1e3f9g7E0761Z+0zxJVYEm0wJh6Os
 fUh5DwW+CgaF4EjXKk1jBU+3qnrtqrKdyHJY3E2OTIDIIjM1fpfruIp2p5iMpfTw
 KfmouiJ/gJdl4l4fdCUgD7PxjczmQSheIysDFfXDafHD3Hjjti5SA5qzzW17+uTg
 OftuBLkiC0tP3BMTVDItKVOCnE2apBX+PFetQAZIoGSop0lbktbLvBtg1x1XjUDE
 uhPC1DiPehFVSyt708Vc9mqjmX9PWf6VTwm95a6+wFYx1SZLtEwvvxvIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=NEZ2QM3tf8LhtQofwUv9vuRki9oLSU2r4DmlnZqyNbE=; b=lCl4cvM1
 1mrxxON5TKjJ7/0Ot1vAaReQbl5ehcMPHOKQy1jcVmTQThbCaGw77Z8+8ZQ7ctFS
 Tt+FNugvtsa2OUbu+yZu+Q9GyGBx9Wnzic0lRVMFswt0FSpyVtrH7pCqWTFS3yaH
 0KkXyQKJFIduhlHCL+RUrR94aJ6qO3WZ8lp+aYY5+qvR1ugz9Z4VlwLgJg+Krq1O
 JC/BNS0DArOEjsb2FgV6MEJ3X3ixb+A9bm5Q2qJxrbBnOdDk4v4iDxKHtLLeOteM
 0dk1EGmIKFYho83AzolfnIMNEB5zNiQyIFo7BoSV17pJi6Ewg4j/PVw5H5GzT0aJ
 FBR6LW9Vl2HuKw==
X-ME-Sender: <xms:48PZYN77-jbweO9HTXH-rRQlwFhijjdra16wMeho_ZMU-Cj0W3DKMg>
 <xme:48PZYK7NxONge4UrcZubz0nOBKQy9agxJGc-NOQD1XwoYj5wdR35U-QGE2zY7zdmd
 BGW1fKQi17xFF5AP4Q>
X-ME-Received: <xmr:48PZYEc_XkPcou39U0Bh5LVi-3Q8w1QJIgy6s47VAV3NfgJZztSwDfb0zUPXCCp81GmJo39n86BbkWR5-73w_3ZUxIgSs8m95YQx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:48PZYGInUojp_pqBN9cWzrR1NS5nhz9HUH-RRYVLRmZfW7xWZEw89g>
 <xmx:48PZYBKV-GAlH1XLSecNtucqC4qEryWkVM0WO3r1ME6W7LIyOFjdPQ>
 <xmx:48PZYPxARClUWFuTHKdkJsPRPGdTxn2cl_IhIorWR2ahpPa9hf55aQ>
 <xmx:48PZYK7uKwXtv861qGvsv5W-WadBZQbYH3aFNvaftsorf3tVwIw4XA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 08/10] drm/vc4: hdmi: Raise the maximum clock rate
Date: Mon, 28 Jun 2021 14:42:55 +0200
Message-Id: <20210628124257.140453-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have the infrastructure in place, we can raise the maximum
pixel rate we can reach for HDMI0 on the BCM2711.

HDMI1 is left untouched since its pixelvalve has a smaller FIFO and
would need a clock faster than what we can provide to support the same
modes.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e7fdda8a1bfa..46f656fd31b9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2280,7 +2280,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= 600000000,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
-- 
2.31.1

