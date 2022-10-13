Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFA5FD6BB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB1810E55F;
	Thu, 13 Oct 2022 09:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFA910E552
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 480685C00D5;
 Thu, 13 Oct 2022 05:13:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 13 Oct 2022 05:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665652394; x=
 1665738794; bh=bShaN/7NERGul8hcL4IyWVx5LIqH+sRwvrBsPYVMzg8=; b=E
 AiosCw/vKKYwxEjD5hfuO1Hg5/6A1SmEpDMxSHTiKxgcFrJJu+4GZzRGDtJBMQ1K
 OY9N6D414TUzQ/FLW/Nc3OjmqmdY7ezuTlSE9X4WclH4grJxR6DfzcE0fUVSYMq1
 EPY5OHkAYL6NqOA6q0rdhtkV8gqBQpUCfHX9Dn25gM1qDoPXdSdBQtcdvbwFYAwf
 s1Nxu6PWscII1xtCQirriwo/XPqg3Yg+afBYqXi/FK4pp+zKIUv9XteBZHn0a3AI
 jGw+VQUJnMxQUUOwWCcHc5YvewsUI97STuNfVrJo55amFfWBTplhkRRV5Qv3YKwT
 dR98nPINGTQHb3ttl6how==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665652394; x=
 1665738794; bh=bShaN/7NERGul8hcL4IyWVx5LIqH+sRwvrBsPYVMzg8=; b=j
 YMV69Ay0N0U2JJzwInr3WafU2oixNPkiJdfF2YPp/XY5XO3CMMrFWH0Ocp5mLFka
 yxAkg03BnqsamL2DEIOhoq7QC4X/lJJndfSO4+sDqkMPZbOz2qvwIx39Vl75FGHh
 /bTcfXlgLgqTmQMaCbquTojPOOlnH983tz3wZCnjCBHgsx6ZSdq3yS9ncN0wizw/
 KnP+hqT9AzpNcw8UgcW2FzXu+IwKEDmNRSgRK9nwLw7FJN/aCjeu//yMGPGaJAq5
 tHP3XJX5jO5sLY1pkyB5ndEQUiKOxKg7ffKflBA+sYidLcY/bwZxxS2ZBTGn/UI/
 bZkYEmlvWEho9DSGisJkQ==
X-ME-Sender: <xms:qdZHY1ZwODZ42-7JlsljxWtiH7_hxCRF6IMjB8x_LwqDpO2tBThhJQ>
 <xme:qdZHY8Y0MzaPWdolsRLZyL0_0xcAuVYgglvPABNOwhIcodmDS9QjjXD883oO46XOl
 7McYBL-J40aoqD0oAA>
X-ME-Received: <xmr:qdZHY3-0H2dTqK872rIOOb85Ge066IYe2WHH1Ue9q3TrZc_AQshbB-m-3b7yOcZjyqwmsQWR_Q4QrAZf5Hy9l8rshMLEjbil9UoZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qdZHYzpgoTDdMpdmBg41iiN5fGrK-Cpsaom1f0ehaR9oNZE6ebo0JA>
 <xmx:qdZHYwrZ5e6ydA5LmlVuW4lQlgiayq91Seg7jj9MQPOEK7m8Fc_33w>
 <xmx:qdZHY5QB-3o6-tpsb1TMHC3ez358Sjc_P_bM_0hdhLPeN0QSpFCCLA>
 <xmx:qtZHY-YWM8NPyI_SNL9hKPnZ9rs49u3m2kgzFE_Vo1IQDwxskY54RA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:08 +0200
Subject: [PATCH v3 1/7] firmware: raspberrypi: Introduce
 rpi_firmware_find_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v3-1-fc56729d11fe@cerno.tech>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=vWcb/Ejr0pN1Zc4Oe8EeogxMKfphDG9wQuTjtg3Mq60=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15ak3nFobW54oXNCbZfu6iq9loUWm5a33orgzM6MvRpc
 PzGko5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABN5cpDhr+y95YVh1vNUBB7H84l7+8
 pyZX0+u21iWPevGJZT/EqGKgx/OFrTv35m8Um/ctvqzp8T19L/9cQkXDx7bMeUJ11OognreAE=
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
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A significant number of RaspberryPi drivers using the firmware don't
have a phandle to it, so end up scanning the device tree to find a node
with the firmware compatible.

That code is duplicated everywhere, so let's introduce a helper instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/firmware/raspberrypi.c             | 7 +++++++
 include/soc/bcm2835/raspberrypi-firmware.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 4b8978b254f9..b916e1e171f8 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -311,6 +311,13 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id rpi_firmware_of_match[];
+struct device_node *rpi_firmware_find_node(void)
+{
+	return of_find_matching_node(NULL, rpi_firmware_of_match);
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_find_node);
+
 /**
  * rpi_firmware_get - Get pointer to rpi_firmware structure.
  * @firmware_node:    Pointer to the firmware Device Tree node.
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
b4 0.11.0-dev-7da52
