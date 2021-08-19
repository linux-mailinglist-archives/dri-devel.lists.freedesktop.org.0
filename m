Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC543F16B0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A46E829;
	Thu, 19 Aug 2021 09:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C296E829
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 685E5580B73;
 Thu, 19 Aug 2021 05:51:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 05:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=CaFI6+LXuxT7D
 +FuRJiZ4FDd63wUReOYb6e1ACznRWA=; b=gGRp0xBqmCAG89506O8s3ErzcWcBT
 UyDATIZS+VWsdLOIZUPWVc6MHNK18Hqcp+UpSFaAQiWSANrFMjaxcZGlgmNgcb7O
 mnN5RWMxKj/7DfjUz5pMUnRidRp2TH28QDWe3zIYTc+BO5AhM8l07NgIFvI1FoyZ
 kfnewZVCP+YjOC+mx+YUK1t2IRhXMyufW96fcNb39oDG8cbD/EV9jYnePuYPZrK/
 Nz+asOE7mM3pzDJpnUmW79bhzMvApm9EWoVSQpvbhZ7j7Loix1mj+ocTEYSnYwZ1
 CLjV6YKCKGVmoZRLmcoulE0Ce4pzv3cRVln50y0jVyh6Q6LmOkDizUJJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=CaFI6+LXuxT7D+FuRJiZ4FDd63wUReOYb6e1ACznRWA=; b=TiC/VrTH
 gSCvsReXTMpbkcDYt2xaZ43w959jVhwZdP0R3xtTZ5IQfbzN+YSV38bCasPAfcUG
 CRkSMO/LxNU3nztOH4s0uXO17yOdJhyTLUejMPvRlYzdvqvWr6QNf7kTUr1RK9AG
 7sNKGraxDcP+su5F9+211lEER02OQ8URJO7OSxKtRw6+4in8LXpmA1lpgb1um/1Y
 FOwyUWFSuY/32Hf51y5USSzQawcCiWvN3dQy3+DlZZClhe7BDQ7IJmeGtwH9xOAX
 wKjJRDmjk3IQghrHRGmULVJUr7Za7MNLAOn+VSYxQrnwP6BLEWwx5zmfw8mSXGlX
 nZzCdPWA4l1RRw==
X-ME-Sender: <xms:rykeYQXaLnLubQ3j_WTVx8d2gNputPrFy-L6vry2tqfcpO8gkcwhNQ>
 <xme:rykeYUluZVAsHXMqGlg7hXKoISErG40cBRfsuQhrLIRwBF_CQ1D1F5vzpY6n9aqj3
 _nZ81uh2CVmRc_4fwY>
X-ME-Received: <xmr:rykeYUbj8UwO79enHPnHiGZCzDlSp-63Dd5BW9SeIw0dLZOBxaXRzkIWLbC62tnHB8hmCnYogk1B5Ko9hV9KjIpXo9Cd5-b3D17s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rykeYfUUmpJyFQpUDwrVD6wUAJBGk0OPpai2ccXNiqccnqNknv2paw>
 <xmx:rykeYanOjt4HIkqlGjYugXw2jBeiR6gA6I8K8Jr-mXTmEohHCFohGQ>
 <xmx:rykeYUdwLKNmzID3qlWoXxMzOySINQRPD59axtnhjZFUe0i1lSPEOA>
 <xmx:rykeYf88vvtiL7wapxbqs0AB8lWU3Uz8rVQ0ED2t90TCr83LJK06Ug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 08/10] drm/vc4: hdmi: Raise the maximum clock rate
Date: Thu, 19 Aug 2021 11:51:17 +0200
Message-Id: <20210819095119.689945-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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
index 251dfecf1d4c..d2a720e05ddd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2330,7 +2330,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
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

