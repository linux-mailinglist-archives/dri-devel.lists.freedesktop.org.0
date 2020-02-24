Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697816A2C4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE406E36F;
	Mon, 24 Feb 2020 09:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F916E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 09:08:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5BB97546;
 Mon, 24 Feb 2020 04:08:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=aifkvOv9zRXxq
 ekpFLQ5g38F+d5Q84waAiGnY1d0dKA=; b=zHSiWKUe7BUqGibMMMhnFdpnYy8Dx
 oByM038YZepKvUtdWuQOGr4vYJJH9F0OXpnbuIR8Oi9jApxP8tU/KhBqsTvvV0vv
 DBzJbXqetR8TFArPMUR4aAdst0uwvyqrEswOvxYjWBCMBlfJFLU/YXW9z7rKsAak
 3Hcdqbf/X3I1z4Wl15Pqc6U0YYJK/aSMuyGT5qcVlW1YA2uX7uSNW6ekTn7fi5CV
 8kWH1lNMF529NADRn/OZ3fK5b9Q1SVmPUoOFbAJyNTr5rKYJG3mJz27Ma/z9D634
 ipagutWNS5u8BY/ky45mBV9MkeqoTONvZuVFcT7YhP+UfpRoVorbj39TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aifkvOv9zRXxqekpFLQ5g38F+d5Q84waAiGnY1d0dKA=; b=1xcIzN5f
 gOFRqaiMEamDf/QyBFmL3lGKaSkXDVmJ06S7KxJyJwWUB+e02yoWwp2dH07UIs7j
 wNYuDq5URg95zfqdoX0Y9ASNBL0yRpDFu/aDAHrclGclYCaEneolDmbF3UDwkjSb
 VE5q1lvq1lC89HOT15zID9Fp+Ius0vuU8uV9kL6aQN9fmO18FPR8qyb3LPwGZbgy
 T6Xcd51F8lY05CZk1Tx9q0nJ+TF6rex6ZJYjl5m0hrhk3qfTQ3CEnVzW144+wIlT
 sDZvj+cRAL6/GlOsGtJVbQirT7dggba8UdUEh4Cp4fKffVghdjHHT/lKkCXzMMHu
 5W2oIRe8JwfVUA==
X-ME-Sender: <xms:p5JTXs19rhtFYaY82D5yzQIgVw_brvbEr9V3ZjcvahqdWYbtQazwRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:p5JTXrWzcu65fd7BNERv_UFmOuaodSuZEZXYkz_g9Gq58rIyBqpvRA>
 <xmx:p5JTXv4O0vZWktqygUmnO0ZcINf3962OKgvpqa68gqn4WiB58E-dEQ>
 <xmx:p5JTXqKfD_YNibKbolYbPLwtJTxnXmem66a4ya7ztWp2upEv2HM_3w>
 <xmx:qJJTXnWek_2MGiM6ogkQRZ99oSOfnPswzMty1JkG9z9WdVLowfdLRlYP4hw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 502763280064;
 Mon, 24 Feb 2020 04:08:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 04/89] i2c: brcmstb: Allow to compile it on BCM2835
Date: Mon, 24 Feb 2020 10:06:06 +0100
Message-Id: <0ec2a26c7492b1ef6554d3bdada7a6fb8b41ab1c.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:39:03 +0000
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Wolfram Sang <wsa@the-dreams.de>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711, supported by ARCH_BCM2835, also has a controller by the
brcmstb driver so let's allow it to be compiled on that platform.

Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..9b8494de4a59 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -476,7 +476,7 @@ config I2C_BCM_KONA
 config I2C_BRCMSTB
 	tristate "BRCM Settop/DSL I2C controller"
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
-		   COMPILE_TEST
+		   COMPILE_TEST || ARCH_BCM2835
 	default y
 	help
 	  If you say yes to this option, support will be included for the
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
