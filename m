Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2E35E200
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51C46E7DC;
	Tue, 13 Apr 2021 14:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B02D6E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:55:00 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 611E61610;
 Tue, 13 Apr 2021 10:54:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Apr 2021 10:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LLdLJhh4jEqWF
 L/xhSPB0h/aBQb9gcviduOTZSu5sYM=; b=isc60mT3pB0/Qd0/MKqo7MmF1ghLv
 1v2VDRSRWbecwOWhDwR/sDRg4KRdhe1GtfiegdtJqR+Qcexq6cAvmz3eZrHkUA/P
 0inDx7Hzw3VQjKBEUw/85Yv7BNC0UKuyoYd3s2vyKOwBoYjOCzU7PiVCbeubdB7K
 cWRaiFxXf8UEUw0hCLZbTjzlEIuKLRkv3/DBd6WL5cuTZwlFCYDMyVch78cODuS5
 ajVz0tuaTFH47Epi9kVL0Gyyfx3Nbra2Qp5RT8U+ySvd6fIPcDIH/BfZDPH+PVAj
 k1NEhPmv1TVCLQ8FA/vUv883Ad0cDoIUCDcImYWyNXJk3jdVFkOZtgs1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=LLdLJhh4jEqWFL/xhSPB0h/aBQb9gcviduOTZSu5sYM=; b=kCu6bC8W
 ZELFWSRjNR+IZuyXKQlfvvI5xBI/xbVghQJe+aSJaWzabgYbNGgkbFUxVHqsfXU+
 JehCJXLrTH8KMnT2jlZK3qKjfiltPPj4mC8WeBItGRCdoKMjIA2xmBnYX/iQF9LF
 yi6Mxfx+4iK8gaAc74VwAB9XEIMJqe+CfSgIwSpr84/qw//P/cXT1vVMNDQODzLL
 0ziCaY10XM4/KFtHszz8SplEroyuDnXHpafhbnRVd/cTN0908ZJHXDRlq71EO8S7
 Wu09PVGK/j1g60JvMlQ6MG0pgkhsxEn/sOBlNHW0af7QQMKlEigQJT/9K5nVPEx6
 yTJ+4FbBmdqFbQ==
X-ME-Sender: <xms:wrB1YCJKNMQoW4DdI0GdBGk-Eiu1wd5zAz1cs5myeVw5NC5AMlTUIw>
 <xme:wrB1YKGdq8DtCK77f6KcssCvX_g6xSVOtpf_PN58__WSU3TQocG33HY5qjQ8bgvAT
 9gYdqjELNYeaqM8RJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wrB1YPm4QcjlGc0SgMYdwEAQAI4oFiGG7tzf0BonIYWMPEOO_ANGWw>
 <xmx:wrB1YPJkYoXPt6z_MQ4B_eFOES_mPL1mw2mS6DGGxGB5W_EuEb0RkA>
 <xmx:wrB1YIZwrStFMg_0GM9FdYRU0SO64rc2YAb3_AUboVWOnVd5v1SVkw>
 <xmx:w7B1YA0Fy8mqYCxzSkuhkQROpwT6nRmSbMwdZiH6sh3QyVbB4sWBap6q8XU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB741240069;
 Tue, 13 Apr 2021 10:54:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 9/9] drm/vc4: hdmi: Raise the maximum clock rate
Date: Tue, 13 Apr 2021 16:54:41 +0200
Message-Id: <20210413145441.483977-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413145441.483977-1-maxime@cerno.tech>
References: <20210413145441.483977-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index bda12fea0dce..aecda5766a9c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2212,7 +2212,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= 600000000,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
