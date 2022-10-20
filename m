Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA6605AC6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155C410E5BE;
	Thu, 20 Oct 2022 09:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F71710E550
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 563692B05E55;
 Thu, 20 Oct 2022 05:13:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 05:13:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257203; x=
 1666264403; bh=JJ4wZVpV4l1NnGgL9LoWV0Rx11A6i0MrMPUMotPda6c=; b=g
 fMOzwMSTlwra2s9rB29kjauPvAJp4krsG7f4Z+qTRZYAlJOL1v0+/DKmfJ8fMPut
 UVaZbZZfA796b82qeVQJiwdiRPiWKXGwC/1lpMZDS0zW8AP2IATIXIvEoI2EGhe2
 ZW25lCB8VhpKLiXlDoa+1GzTSPHGG4kDybNQHxKGPwshhtwv8m1Z8Nht7QbQVS2X
 4XvQHTUQDzcdpWZiPay7LBCAWokTRDhU3fXQKJiFGBHE7a3qoTxZOWKKJwE9ZeaL
 +HrHjDY0h4tIaMTb0BkwYhJbjznf55s5Zg5Z9FtH3Qom7IMdXYBst8wO/hBwGkbl
 HDkgBCLju53ufdj7wz3Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257203; x=
 1666264403; bh=JJ4wZVpV4l1NnGgL9LoWV0Rx11A6i0MrMPUMotPda6c=; b=D
 o10H7tx3Hb+FalSdHa4qS0q10g1DEuOgkeNuoNE0ZGpmp7YS1GNUSXnw/JBFODEN
 BDDuUNDqFBWbBe+2qBV3Bzyx3F/DMFvfjNuOKe3T6E6BN4G1UaBy1MVdIt32qnAx
 TR3gVZRrmIRx+cR7/hp6TWP+cDVmZPKRi6UtUgTFcH6PLEGmdm/b+QO7WnLSAaB8
 hJHjt+h6cS0+a1YX5afCOm66sFqbQ6iK3K6VOe+Irt6SDFh1M++AQFSZy5watBDT
 j1HaOhGGWFMDjvNielC3iLHvBwOiI3X7vP2BZbncvUjrN4gJhQEYIkxdeTErv171
 8zN+MgUtTI5HWDEb1UtYA==
X-ME-Sender: <xms:MxFRY5tvUaLvIRfRCecqvRU4LBEeEybNitWQfiIBCQiRE8_mDhtuWw>
 <xme:MxFRYyfjy9uGRqVYvQn16cE7iq_1zN1WvEZtjByhOoE9gN7RvLFo_1vv-zcOwSDjD
 90tbl7Ez3FP2IAS5NU>
X-ME-Received: <xmr:MxFRY8wZOfWVCk_LBl0y1eGO9mVVfdbyDS-28RKpCIwB712GMbu1tG9XdLSiqJA1dOF9kyR3cGH266CD5AKO-kIODpX0oX185byISWdYT-SbLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:MxFRYwOwcKvvEHQIJRGeiTIuNe5n7UQOxjKv2XsI5xTyDRiOKMX0cQ>
 <xmx:MxFRY59nJVbP4ObVI_A1gRgDlPDuHM0omYHHCVRcTii4BvybQ3-ZgA>
 <xmx:MxFRYwWVgDIg0UTLbclZbbEz-SEXLsym9iGI1hRAv7Q07va6TfFnZA>
 <xmx:MxFRY4cAISRU919nIp0-lXfVNp4vBucO8rdF7hjcIy2KiXn7-7j2dFrYyDU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:23 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:09 +0200
Subject: [PATCH v4 1/7] firmware: raspberrypi: Introduce
 rpi_firmware_find_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-1-a1b40526df3e@cerno.tech>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2789; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ZSj0VJea8u0i5Q2vnxlThNbrs4wjN9dVZ0f3te/Rd5I=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq+MFpf7CN4Re2fZKMV1zP6CXfbXmi+TzN69f/fj5y8J
 9aO/O0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARozqGn4wM6e9rtf213r9Z5iGVIf
 p/sq7Fhge+Cxap88xLmtn1wpzhf6T/7i3ehmcf+TGt1OkU2VyWFLXaIF6Q54y0W/KXRXNaGAE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A significant number of RaspberryPi drivers using the firmware don't
have a phandle to it, so end up scanning the device tree to find a node
with the firmware compatible.

That code is duplicated everywhere, so let's introduce a helper instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/firmware/raspberrypi.c             | 18 ++++++++++++------
 include/soc/bcm2835/raspberrypi-firmware.h |  7 +++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 4b8978b254f9..932a8bef22fb 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -311,6 +311,18 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id rpi_firmware_of_match[] = {
+	{ .compatible = "raspberrypi,bcm2835-firmware", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rpi_firmware_of_match);
+
+struct device_node *rpi_firmware_find_node(void)
+{
+	return of_find_matching_node(NULL, rpi_firmware_of_match);
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_find_node);
+
 /**
  * rpi_firmware_get - Get pointer to rpi_firmware structure.
  * @firmware_node:    Pointer to the firmware Device Tree node.
@@ -366,12 +378,6 @@ struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_rpi_firmware_get);
 
-static const struct of_device_id rpi_firmware_of_match[] = {
-	{ .compatible = "raspberrypi,bcm2835-firmware", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, rpi_firmware_of_match);
-
 static struct platform_driver rpi_firmware_driver = {
 	.driver = {
 		.name = "raspberrypi-firmware",
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 811ea668c4a1..63426082bcb9 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -142,6 +142,7 @@ int rpi_firmware_property(struct rpi_firmware *fw,
 int rpi_firmware_property_list(struct rpi_firmware *fw,
 			       void *data, size_t tag_size);
 void rpi_firmware_put(struct rpi_firmware *fw);
+struct device_node *rpi_firmware_find_node(void);
 struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
 struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
 					   struct device_node *firmware_node);
@@ -159,6 +160,12 @@ static inline int rpi_firmware_property_list(struct rpi_firmware *fw,
 }
 
 static inline void rpi_firmware_put(struct rpi_firmware *fw) { }
+
+static inline struct device_node *rpi_firmware_find_node(void)
+{
+	return NULL;
+}
+
 static inline struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
 {
 	return NULL;

-- 
b4 0.10.1
