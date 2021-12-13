Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7C4731B4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BE910E7C1;
	Mon, 13 Dec 2021 16:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8CF10E7B0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:26:42 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 77CDC5801BD;
 Mon, 13 Dec 2021 11:26:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 11:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=NYzTodFUSDTQ1
 k8uArv9hmdu5xxvwWvdj/NMSohJE10=; b=hdQMscQAE9/i1zRx1WJA9ZO44OXr9
 r04PGf1xlnG3tky5p8+ITEBkUrRS+esDZUCWIylWLlRaRp/ocUW7UrBD+xzra8xh
 sLzYGzxXysPfeJssXkmKXvWtdLKTUBmalZcOiuMaJ/pz5XjbJLWqRDFmSj1jnzeW
 v+LZH19KUS8e9wQs9VOaV6NgnKnybXLS+w9biUdDpSSgarrHT2C2ErpVvBBJfXxV
 JAmh4mj8Ez9iSUpM3Cr3iidFG0QDjhUa4dtl0u3NN5M/4s7/TJwxfH63i7OWWszd
 Z7YwdS0KlU9PNvNeQRdqhuFT65chXx87zDiwOMXrfF5GMtB7onEeRQAlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=NYzTodFUSDTQ1k8uArv9hmdu5xxvwWvdj/NMSohJE10=; b=aKJTiMR1
 YfhzpE4JjhbmGoGaZc1Xh9AUviTeEpQNaiVCZI1idKl/PmepANLNRlUaq6Qfiqb0
 ZX3DPeT322BeGl4zG34IyzDBgYdMRSxQEBd+3VOKvKHrx5lcCAklnv4iflJnTSrz
 80kYHRGkyWQY2Una+ZwTkZ8hvbkJpuCyRozYl+CBiZHw8xRApum9VdmPkcGfQ5iC
 iMU/kdpTqVlDq1njysLIEJnct6nBiM2xMqZzZQidhMCjfIiDIhpCLsTrI16goNVi
 laxs+wAKtHEi8FhOeerKtpNL/1LvtOq94JHwOwoYpUgsYZOXiiDQASbO+In9SujL
 6coOZ+/9XZkNww==
X-ME-Sender: <xms:QXS3YbD-KPOyBnCL4xxj0nDSc1qXi0Hksf3pFGMzn1S2DpKWmSx-YA>
 <xme:QXS3YRitfA-RwnvVoxCJk1ZnyBHuWOHbAl8UWRKuSlRqhfTvrcwIGtZNgzIt_L1HF
 7Nzz47VwzCaXgZ6p54>
X-ME-Received: <xmr:QXS3YWmbGfUn2YOkmzY8cD4hk0pACXoPb4Rfo64iw9RROJVGBi3pfkJZC2Za8BH1hud9r3Q3VRDwia0FlilfZP7FkvHo0bTiCo8bU1AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QXS3YdztNvXSu0wT2xfTT96u_a0MHnnF03n6QvZ_anYD0g8IaEiOEg>
 <xmx:QXS3YQSzKg0PvnkGH6hcxIsiDMW5tqQtjwGF3Yp54SH6Xo7jG0C-Zw>
 <xmx:QXS3YQZtmvgpeVj51--5OOHQ0F-5LW6ri-H8HRC7Myi9O2mrd22_ug>
 <xmx:QXS3YRK4eb8cHOPC2ajCF_JC1AXd2kW8-cnJKQTBLuMMh5Slivjkbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:26:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>
Subject: [PATCH RESEND v4 v4 2/4] drm/vc4: Support nomodeset
Date: Mon, 13 Dec 2021 17:26:33 +0100
Message-Id: <20211213162635.252582-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213162635.252582-1-maxime@cerno.tech>
References: <20211213162635.252582-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have nomodeset on the kernel command line we should have the
firmware framebuffer driver kept as is and not try to load the
full-blown KMS driver.

In this case, let's just register the v3d driver.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..12694e2201e7 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -357,12 +357,22 @@ static int __init vc4_drm_register(void)
 {
 	int ret;
 
-	ret = platform_register_drivers(component_drivers,
-					ARRAY_SIZE(component_drivers));
-	if (ret)
-		return ret;
+	if (!drm_firmware_drivers_only()) {
+		ret = platform_register_drivers(component_drivers,
+						ARRAY_SIZE(component_drivers));
+		if (ret)
+			return ret;
 
-	return platform_driver_register(&vc4_platform_driver);
+		ret = platform_driver_register(&vc4_platform_driver);
+		if (ret)
+			return ret;
+	} else {
+		ret = platform_driver_register(&vc4_v3d_driver);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void __exit vc4_drm_unregister(void)
-- 
2.33.1

