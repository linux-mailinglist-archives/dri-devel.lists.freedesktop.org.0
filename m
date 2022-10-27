Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924EC60F810
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242EC10E611;
	Thu, 27 Oct 2022 12:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5810E611
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:52:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 681583200392;
 Thu, 27 Oct 2022 08:52:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 27 Oct 2022 08:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666875172; x=
 1666961572; bh=XLoY6/AIOx7GxUWpn4fPxhdJ84XuveOm5Oti9fOQbTQ=; b=E
 VZCWoS/+J3cfUe2Xm6fHOyr287iVnqPZre+poXfmhzNiGyJ8xRcPp22h5Q2gar6t
 cF1wmzuEZ+mlm0uRXEIZKyUFe01ZAQ7djyJDa2FYBxYR88jZ/0XlMOcpQfnhgqC2
 8vB4UoMH1dUrmAMfYSK1nkMDgBwQ90YbHyHVbxZR4/0Ysm6km5tThv5jpVyvjJXm
 sGQmRqDBETBZPYBzcjDviKzjFdaVy9GsQ9EzPXdzu1wgNlTXZjyu7GzGbKNKa+/m
 Mgbg1XzbpiObOmANUdIou8WwxACVMMp7UcHHChd5KMYBOif/lrLcCYWVIvSMwyOr
 oWlTiUOnCoS6HwbcnG9wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666875172; x=
 1666961572; bh=XLoY6/AIOx7GxUWpn4fPxhdJ84XuveOm5Oti9fOQbTQ=; b=o
 O/y49EJLy6ZGLFozmlVtAfw4WHfY4oTcPmFHth64OSmzZQU2PaxmUPaKbmiynFZB
 wzdW79MY9wy+Fy7Jsbj+wnK+8sDGoYBkhxLYLAeOE2FJrjhOzpW3fUkh71SstX3a
 KtSYF9MDzcspiJYmABHwJAmm0SIms5ZVH+JCyd/MuT0B7OA51A9sUek3u6mFn+Dq
 m54y0WECTA53D9jpHYEdGAHpte5ODVcZt7oHvLWt+5JYB9FWpN69IIpI6tGj5eqs
 H4srqg+JNr8tWqpENlScwqaDtLosUCAi1wWUFndpSviKi6fCy72LKJRp+6AbocTY
 hTg72XbYTTGCHSnwB6swg==
X-ME-Sender: <xms:I39aY5iKqr-DjL-055mnEiu6eDVs3BGpIjU2z0KExaZ67EVOdRr5EQ>
 <xme:I39aY-CuN7AlmSM_aMukaXc_jO8puCe2iwuy0v_5_V7ZU4-IjYQbWaZ2zgF6rB_P6
 7PNOpC1LexJlP_eZ2s>
X-ME-Received: <xmr:I39aY5ENs3zpkc56cIvHJ6mTjCEjkLRIXMD_ysIBTE28cdLGg4ENdd0QWSUxdBx9sB1jxjpPaKkBqdk0P0Ooz73Z21StTN8wocBHvctj-DyINg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:I39aY-R4_Ho0JE8n-KZyHVN8NwH3wfGT8ShHJLH0LmYSgelLv5dcyw>
 <xmx:I39aY2wVkJitQV5fumunyOXgmE46MYRpfUa3adarWwfAV1bE0IISvQ>
 <xmx:I39aY07DDlFQue0HOqS0uNv2dPBa7r1PuXMSJw35igwJuiSn7xltBA>
 <xmx:JH9aYykE6EP49FvKSzyvQY-ZAQGcJOAFhjkA696aMmr9snJB0_SDmw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:52:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 14:52:41 +0200
Subject: [PATCH v5 1/7] firmware: raspberrypi: Introduce
 rpi_firmware_find_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v5-1-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=2vslMbMdS0Ot1OIkS9uhKRt2nTBeQBge9lhrJ7SVTlc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TIvmwS4C1wOrvz6q3bPFeUlbBful/o1nN3aHxX736ec
 LUygo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABO5bs3wzyZZpczq5rv/ezP5vmtWfJ
 zez/V/1xr5fWl/Flacu7f4+2JGhvcTV61PdYlsuqqVK/FS/mgOe9pFvdXB4mvkWZxtpx1N4wMA
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A significant number of RaspberryPi drivers using the firmware don't
have a phandle to it, so end up scanning the device tree to find a node
with the firmware compatible.

That code is duplicated everywhere, so let's introduce a helper instead.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
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
b4 0.11.0-dev-99e3a
