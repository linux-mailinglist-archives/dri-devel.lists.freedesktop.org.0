Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22B1B7FE3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89676EB26;
	Fri, 24 Apr 2020 20:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1536EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:35:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 030D67EB;
 Fri, 24 Apr 2020 11:35:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=QuNnjLTy9RNDV
 bBJK6dCprswSE6BtAg0WvZwRmfFQZg=; b=ZKQ6ct6O1M+LDrOqaE50nYh6AiLC0
 ItNdopuP3WumtV7dxprdML/ordP7eSN1IPE9tUhzB1gL4BQAAnvhEmrS01ba6hNT
 E/46Ky287M+RkmOmaJb8zir/kmTLLBYatgKpgoLwVCpsSgl+R13vuOiR9LV6zwMT
 Ijlj9IyZr9PhhDWPWqp3NuybXVwbxkx4mzLza6azcFt19VXptDFbrqu5Ws2lD9qu
 No4CUtIKkGUDP+GgiIRCvXG4cVGGQk63xDm+y6WriQHYIc3EWZM3/BCVJyKoXDPI
 deWqGKIze4TOxXJzwB1N1/daI/z6d4Ts1JKNtRh5YeljDIZtuv1wZ88ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=QuNnjLTy9RNDVbBJK6dCprswSE6BtAg0WvZwRmfFQZg=; b=uKm8sUgZ
 vI0Q/of6T6mo21jR1EIt+VHz5A8ldWtPSI8uRbgESTVODHS13v3cGAdK57O5tu8C
 bbJgpcdLh4QbYkuvVd2IpLFoNxwJ4isWEaXS8yY0eNkNF9qdcKJrP/n0FyeePJiX
 5TCGWoLG++lIad/J9GcSJxwdLuYiQT5L0GkdFQGJHKptQg1VZkrunjGT5SWx5Lan
 xXn16vW7Qdb+ktAJYyim5W/opDcBljc0P4Hlrf9PRXRCv+hcZ3oS5WRnDXrqhsgV
 GyQ0/bzakIR8Zkh/AdmY3UuJ33qgoCK2AeJ8w/SBJnfh1sd5dm+nCFT1iVILoXjN
 EBv7WCI/WFoJhg==
X-ME-Sender: <xms:QAejXu0idgZ3JOQ6YqSgKg3ZNnP94XCvA7WvdntmY4sIRtgNsJkm5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QAejXiWu15kxWzVNVQwdrxQsZuwSY6U7FyESro7wXogjqvRQobGH6w>
 <xmx:QAejXvy2iSShnMVnu2Lkv6AiCPm4d7zFlwW6sREBSAyA9H8LIuR6UQ>
 <xmx:QAejXm07FGZdmNZqmZWh4_QbD7H2HRQJUFJ28JyHG_bnomW8eb7P7Q>
 <xmx:QAejXiQuC7o4FxBiyARSEBf0Y48kT63HFcaOtzGjK8VEit0Y1bkD8ig4QOo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCA313280063;
 Fri, 24 Apr 2020 11:35:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 04/91] firmware: rpi: Only create clocks device if we don't
 have a node for it
Date: Fri, 24 Apr 2020 17:33:45 +0200
Message-Id: <b181d867cb9523e1877a3dfd258bafde2988024f.1587742492.git-series.maxime@cerno.tech>
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

The firmware clocks driver was previously probed through a platform_device
created by the firmware driver.

Since we will now have a node for that clocks driver, we need to create the
device only in the case where there's no node for it already.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/firmware/raspberrypi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index da26a584dca0..1874f41b007c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -210,6 +210,15 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 
 static void rpi_register_clk_driver(struct device *dev)
 {
+	/*
+	 * Earlier DTs don't have a node for the firmware clocks but
+	 * rely on us creating a platform device by hand. If we do
+	 * have a node for the firmware clocks, just bail out here.
+	 */
+	if (of_get_compatible_child(dev->of_node,
+				    "raspberrypi,firmware-clocks"))
+		return;
+
 	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
 						-1, NULL, 0);
 }
@@ -262,8 +271,12 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 
 	platform_device_unregister(rpi_hwmon);
 	rpi_hwmon = NULL;
-	platform_device_unregister(rpi_clk);
-	rpi_clk = NULL;
+
+	if (rpi_clk) {
+		platform_device_unregister(rpi_clk);
+		rpi_clk = NULL;
+	}
+
 	mbox_free_channel(fw->chan);
 
 	return 0;
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
