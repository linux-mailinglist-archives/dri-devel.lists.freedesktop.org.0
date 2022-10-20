Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9BF605AC2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DB310E56E;
	Thu, 20 Oct 2022 09:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C28D10E550
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F29E22B05E5C;
 Thu, 20 Oct 2022 05:13:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 20 Oct 2022 05:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257209; x=
 1666264409; bh=Sk4BFebag+VOrDKszwVl8BLZy6XUc1sTCb5w0z0P9Kk=; b=h
 Hn1Iw9VXUhyUR8FZ0DpuIURN5Euth77P6CoLSy5SSMcakOGxvAqKIU0fYPTJG5Q/
 XsbCm2c0x7cqXwo+TmsQoOnRCbgKoWeqyTdLo2YiBFIZBt2OT0kIeRpLX46+rHa9
 mcqa3MikNc2aMoSXq2/I4zIb8QwOxuOXgyPZ4KP/K/RT4rzigbcsIeatgPW+aVto
 AUq6bsf5vShwxLJTktA4CIgHWDhmOibMtF6EMM2eag7hUsflbIw/1wDOmX9rCEyk
 B8LPVb48twCPFfkPCq8xWV0CnKjXsD5fqxCktwWrmB7dheF72ISv6LreejXv5PeE
 SNdPIC+F8EZ3KUeffYPlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257209; x=
 1666264409; bh=Sk4BFebag+VOrDKszwVl8BLZy6XUc1sTCb5w0z0P9Kk=; b=C
 wGp57QQ4UJpxrp7H0eY0fOuPo76k8qtNIxkTqtAlbu5MdGSerFuttC6H6CE0v5pe
 FGYZJD7TA0X7C4EoHZ8P8LmY6HxFbhfB4lFub4J9wsgJHYnGIHJ9pvTRkq6bkIx6
 VpbptG+Kh78vF7++d6LzrlcRaC/WR4P0rY0iVdg1Z9HhrZcUGohYV8+ozX/+ft/k
 9igicH0yt5wClMCTaG29mzfFi6JBC9OZPrTU7THSJpxqasP83TCSUMEy2EVqvFKM
 ufFPmT54i3Vc61H9lwshID2YEB80vaEiYQjFBW5uGTIRd8u0U5pcowZ9LXJPL2+v
 KR3KCJrnkjVTA5mjgz23A==
X-ME-Sender: <xms:OBFRYyK4LI_pQzG2FXjrFvg75Iws_X2hWaubBhfnleMc63IiSqFiXQ>
 <xme:OBFRY6IOx6aAaxVvVZdtRYIQ65SXTGDq8Zqra01AHbjj8OakLhn3qVw5CJOX4pLkA
 bCMVCumKQySDZA5cNo>
X-ME-Received: <xmr:OBFRYysfn8ocM7xxMm5fPzfpECmz_BQLCu2LaK4xSrGW-VCcNQYQ5dl84M_DrnRL4izQgNZd99jCVCvC8KT18oHq_wISMTgHtluysGhR0Vn4Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:OBFRY3ZTSIaDQCJ81ikrf96A7IulTY7cgLKLzHrhwDfhGuspdjDZ9Q>
 <xmx:OBFRY5ZR06i_quHYcacFNSKAx2o1Q-fNj5o3LYOk_hAhJITccnAjpQ>
 <xmx:OBFRYzAddYgxKe4S1zq-EQVyDgqb9aHqLI5iLZlPkL1_1i24KtDydg>
 <xmx:ORFRY95JSI-wGcc1yZ86OGpRJ3NXI3OFvI-ngcb7rxvRWjvxT-jVcw52NB4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:28 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:10 +0200
Subject: [PATCH v4 2/7] firmware: raspberrypi: Move the clock IDs to the
 firmware header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-2-a1b40526df3e@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2427; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=vQwC10pcDMgH3Z7jjy/OWWSa/J/Ej9oSOOOeog/wkXk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq+0dydstwg5tbeuM0JC5LqA3bZTzlP2HigTkFv9kO98
 t+PWjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEfT8jw67NRSdfM88q27fhy5tzax
 hMHs75FG6nvZn9wto4W7+9x20YGe79LXr/cPtk/Ws8r74ctT1lqHnn1tzWuONme7yczq37wcAIAA==
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

We'll need the clock IDs in more drivers than just the clock driver from
now on, so let's move them in the firmware header.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 19 -------------------
 include/soc/bcm2835/raspberrypi-firmware.h | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 679f4649a7ef..ce2f93479736 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -18,25 +18,6 @@
 
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
-	RPI_FIRMWARE_VEC_CLK_ID,
-	RPI_FIRMWARE_NUM_CLK_ID,
-};
-
 static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_EMMC_CLK_ID]	= "emmc",
 	[RPI_FIRMWARE_UART_CLK_ID]	= "uart",
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 63426082bcb9..9b1db12d013f 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -136,6 +136,25 @@ enum rpi_firmware_property_tag {
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
+	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_NUM_CLK_ID,
+};
+
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);

-- 
b4 0.10.1
