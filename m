Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B753925D21F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41B76EAC3;
	Fri,  4 Sep 2020 07:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A396E19A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 08:03:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2277BC41;
 Thu,  3 Sep 2020 04:03:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 04:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WKSncUv9dhCPO
 APdM5DHWDMzEkwvHSOhVAoOY0lrLNQ=; b=dDuI/DP+vLFbJK7DpTGGMmfig8XcK
 lwpG9LcboVt8DW+EC5RmtLaMIgV0cwT5IYb+EsD+RTb2CvBt+KzHvGLLPSF0SaRG
 A/N+oHeboqB4flPCsp4qx4OanBf2VNeG5B/bMXpEAFP8RnWh3LdO5rYF8xVaz3z9
 hTROEM63OQu+pic+7EUXNTSH6daVl+8DMWO4T8FDWL7wlTdfRdCu1z5c6bGmF1GQ
 cBsPZhnep9vaNlRC6TZuo7zXr0/APzU7BasSZHY4BWUtt03xNCJ7H4B0Xn0T9qSZ
 FvrtPkiuNQkSJToNM7waZ3hA+XKq4V7pkkP2P8s1xEiRYZOJwXlG4L11Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WKSncUv9dhCPOAPdM5DHWDMzEkwvHSOhVAoOY0lrLNQ=; b=TtcNn7i9
 L1lgXoCiXAPaJpO5ns7bFrtyH89qRS1pAZf17SDjebZrs0Uqj3+67//ffTvyRi3X
 5x+qkqlmE5MINo7X0ZQkvbUNhW5BIjG9UXk6UQTjEENgcaD4wo1ZCbIwO4oVsMWF
 Z2H19lwtxx2w0yf4JtjTGHL6oXCmohbZw3yUTwZI1bDIFmTMLKc0t2HgPRAiE/+9
 Razho+Fyu50zAZRiPiJN8Me0DG8+0UGZ9XYv2i7k4dDKzn5pKN7ydXNfUnnPFRBF
 NP4mc6kwu+U5nQDMSf/dipF57uWIlX6HlzC5G7OFk5HolHR5nc4NBOnZImnRichP
 niQti39my88U7A==
X-ME-Sender: <xms:RqNQX_xb2UUP4KrH7F2sEoyg5eZLt5iiNDJH2PQB1ob3hWhPSdSVSA>
 <xme:RqNQX3SudqJ7OVWXszv8HidS3giKGlKk5y9jfRIP-N7AhJbopzD549ZW1sROINK3V
 qy6YAaJ9zRr4lKNWCU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
 heehvdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehge
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RqNQX5XXlC-8t6kM1tWzdTQIP4BDjGrySb0QigftzBsEfHJG7yyN5g>
 <xmx:RqNQX5gUTzT8AE4iNYFTCjW12GPs9NnJjrzpwWUqR0afF1AJYK3Zgw>
 <xmx:RqNQXxAZkFoFTOwr_2J-lUqj_lO58Ju9e703f6A3Z2f0NCv8-4VbqQ>
 <xmx:RqNQX2IHPhxYO8mnQp68_W9sVMWngzvO1H8uyXbQchp2xNQYh4eZnvhdltY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5EE25328005A;
 Thu,  3 Sep 2020 04:03:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 60/80] drm/vc4: hdmi: Add CEC support flag
Date: Thu,  3 Sep 2020 10:01:32 +0200
Message-Id: <bd0c4afa83b4e121692352cdc2dd1886162c7552.1599120059.git-series.maxime@cerno.tech>
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

Similarly to the audio support, CEC support is not there yet for the
BCM2711, so let's skip entirely the CEC initialization through a variant
flag.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bf537c6d413f..a26b6bd61f74 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1178,6 +1178,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	u32 value;
 	int ret;
 
+	if (!vc4_hdmi->variant->cec_available)
+		return 0;
+
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
@@ -1476,6 +1479,7 @@ static int vc4_hdmi_dev_remove(struct platform_device *pdev)
 static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
+	.cec_available		= true,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 794216f3228d..3f07aebe89f1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -33,6 +33,9 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
+	/* Set to true when the CEC support is available */
+	bool cec_available;
+
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
