Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEA5FD6B9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746810E64F;
	Thu, 13 Oct 2022 09:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D9510E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1BE895C010E;
 Thu, 13 Oct 2022 05:13:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 05:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665652396; x=
 1665738796; bh=ML+ODx52p7Zj2uoXLzDPtbac1cZv+/aiKbj3DuchnPg=; b=Z
 ztm9CmuT4VAB2juZKzyeSFGG0KmTGkeilo+yzIa/RX04+1ExkNDcceHwrUeyNLXu
 SdWtvJX7aLLK4UNNx9F1G1LRM1KqzEoyiKH0HGR5qk0G0xshUja5+6xSiTXF6mBV
 lHsd8qw3DBLDUHzeEskY8WtuKRubrlj/6gE2LkMYA7scjNcYENBupDXJUdJ9mJJu
 KO82lWdbMAEJKqWwPFlM1Hozom5N7yEdriGlK8Ug0dlMfNU+4NhY5Sw8xyouK9Lm
 7xhCZTV7s2t4x/bc6HRs4+sFdBqx0pFaFyz8VCX7b6bPeHYNK87e1h3WXfeU7EC6
 sk1FiWS1xVUP3t+yaUp7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665652396; x=
 1665738796; bh=ML+ODx52p7Zj2uoXLzDPtbac1cZv+/aiKbj3DuchnPg=; b=n
 HtSHUb+wyBBcF54w7Q/rgZo9noa80Q6Wy3vhZzQMn5q9KrDzuYiSV4U/VYPAB7gd
 7FpGt0Iu6v9Txu8wQ7PUs2uNOJ9duxR4vyYDYsNgDaaJtNLP7t5DDWF1ZYik5ju6
 37K8qzUCY20Rnxk14/wKdeh7mGiwGadenzCG2Ny7Ji1lpyK90nu6JWPvTGAGCiGt
 yo64YhTK2FszaEQmfsS8HaU2qJrFtOAiUL2MRBncL21iVriQ1SdpBeW7K1AIm4hi
 1JAZZfRb53t43Z4u3yuAXighP8b1FYUyyQzgzbmJaftCOtMf1BpmEMki8yI3/k+r
 S3xvxUqOSf76qlNfp2IYQ==
X-ME-Sender: <xms:q9ZHYyhjC4W2jM1BGQkink8Da0bc80orz0CivhWX7C0x8O1bTPcnxQ>
 <xme:q9ZHYzBExUHrWjA17LQXry6qRxxRyYPkbOQF_VtkShzP2VfsppBWj-kzkPKC0877e
 jLWNvLFrBSsW82fE8E>
X-ME-Received: <xmr:q9ZHY6GA4a-WcuZalOHAT5CCSELsYd4JORnnzwxlncNQJRIv0kxD6Z2AsKqE8PquR38nrPko2Ip0VmUsvZoWJ4PQcUDeH5pDTBMc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:q9ZHY7TW4_PnuvztOxpXOYeTjKy5NPAEwiRk572i2Y1WjXrpXujYmQ>
 <xmx:q9ZHY_zmG808zMiO5kCZHjtNI6UjiuIYuXFjgxMKbXslgCA9u-xAlA>
 <xmx:q9ZHY55dnl9LFcHZ4eeS6oI3iIPSeLQLyYT4wmFIV-LsKyqINZRtmQ>
 <xmx:rNZHY8jhwa1_zrFasOcN00GUkZ6l2-eX9OsQnQyVvEnn72eo_MNtsg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:09 +0200
Subject: [PATCH v3 2/7] firmware: raspberrypi: Move the clock IDs to the
 firmware header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v3-2-fc56729d11fe@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=O/C1GjD9JjcVdok+PjgiTRoaq2K0l0WecgWMoNXNBjc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15b0K5av2VF75NSt4gqL5EWt6vqMOaZyr9vz33GyT5uZ
 et6zo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPhYmJkOC+wr4r35bX1EyYeelvuFv
 DyUGPewwUFHOI36zNnfb3Xe5+R4Y1a/5b89Y5n9/w8uts69sa/cotjuYu1rgiuP9lyuenwYj4A
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

We'll need the clock IDs in more drivers than just the clock driver from
now on, so let's move them in the firmware header.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 18 ------------------
 include/soc/bcm2835/raspberrypi-firmware.h | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 876b37b8683c..1f5e6a1554e6 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -18,24 +18,6 @@
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
-enum rpi_firmware_clk_id {
-	RPI_FIRMWARE_EMMC_CLK_ID = 1,
-	RPI_FIRMWARE_UART_CLK_ID,
-	RPI_FIRMWARE_ARM_CLK_ID,
-	RPI_FIRMWARE_CORE_CLK_ID,
-	RPI_FIRMWARE_V3D_CLK_ID,
-	RPI_FIRMWARE_H264_CLK_ID,
-	RPI_FIRMWARE_ISP_CLK_ID,
-	RPI_FIRMWARE_SDRAM_CLK_ID,
-	RPI_FIRMWARE_PIXEL_CLK_ID,
-	RPI_FIRMWARE_PWM_CLK_ID,
-	RPI_FIRMWARE_HEVC_CLK_ID,
-	RPI_FIRMWARE_EMMC2_CLK_ID,
-	RPI_FIRMWARE_M2MC_CLK_ID,
-	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
-	RPI_FIRMWARE_NUM_CLK_ID,
-};
-
 static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_EMMC_CLK_ID]	= "emmc",
 	[RPI_FIRMWARE_UART_CLK_ID]	= "uart",
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 63426082bcb9..74c7bcc1ac2a 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -136,6 +136,24 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_DMA_CHANNELS =                       0x00060001,
 };
 
+enum rpi_firmware_clk_id {
+	RPI_FIRMWARE_EMMC_CLK_ID = 1,
+	RPI_FIRMWARE_UART_CLK_ID,
+	RPI_FIRMWARE_ARM_CLK_ID,
+	RPI_FIRMWARE_CORE_CLK_ID,
+	RPI_FIRMWARE_V3D_CLK_ID,
+	RPI_FIRMWARE_H264_CLK_ID,
+	RPI_FIRMWARE_ISP_CLK_ID,
+	RPI_FIRMWARE_SDRAM_CLK_ID,
+	RPI_FIRMWARE_PIXEL_CLK_ID,
+	RPI_FIRMWARE_PWM_CLK_ID,
+	RPI_FIRMWARE_HEVC_CLK_ID,
+	RPI_FIRMWARE_EMMC2_CLK_ID,
+	RPI_FIRMWARE_M2MC_CLK_ID,
+	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
+	RPI_FIRMWARE_NUM_CLK_ID,
+};
+
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);

-- 
b4 0.11.0-dev-7da52
