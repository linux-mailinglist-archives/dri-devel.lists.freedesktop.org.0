Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF583F1B11
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062516E989;
	Thu, 19 Aug 2021 13:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9761F6E989
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:59:55 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 38E5F2B00560;
 Thu, 19 Aug 2021 09:59:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 19 Aug 2021 09:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gKXF5nLq9rUn2
 jzx/vOAy6T3H6ZUjYqDazxAlaD6/5k=; b=z5bYMddu5cs8nClLEU09yvcMdomUz
 YNJ4vaHxPIQHqR0yFRVNphCKKAgU2kAQmOo6r6qR3Hkjr85ZPsp2hGtTQTGPAZFF
 bveqlQtmaAktYk1opkx9XOmPQnZhHRd6JYm7qh5Q7xZ6USXT/Asd9h7ueLapBwXS
 1+rlCbx9IxgdGZw2ac1blPwfy2JbhfCXBebn57KL22/SOYZa8bUg1h3ITmxDLxgA
 t1gTwOhXLP94/IIvjywAhEoURDGtt8IHlkDfOyWlRrR/NVio14W1fThEFScYkXzW
 aEYMiRFBrLYfFQrlafJkh9VRwOSA5gavN155AXdte828N04wzdm87zweA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gKXF5nLq9rUn2jzx/vOAy6T3H6ZUjYqDazxAlaD6/5k=; b=JiLwp5Om
 Nw0yw38pAPQXN091eX9VVjUdUGW7uPnTmHmLkf490dqAEh0f5BDQvmpKcpvixLkV
 6ofJ620pAEtBMG1wkLK2AcFoBKeoVD9myl8MzhGw7cWvAGHy9PbnGJQu+biEQnrz
 RCk28QkywV1Gt1LpF4tZjzvXRGsWPUDoDm9sjlcffL5LwyDqq34I9yylk/Tp0Wsr
 o4yzYH8EyAgkUI67nlKOaKMQEfbov0ZrZiq7/Ad0oTgFE+Ipu+IjdZ3CfZ7vhueP
 1VMwsRApp4/zBYqQlba5y47LZ7PcbOqC2k7sC4Kd3x7P9YlYEmk7EsYr7qIyWFOP
 u8en/n7VRFpcKw==
X-ME-Sender: <xms:2GMeYc0RrhOiEo-QKoiNYBLXITcuns9eyw-sEdcCkgJiJYuUciUDvA>
 <xme:2GMeYXHeDTzNWa3iKkXWIwH_cA-77XACk-5BqwHzRsMkcq0s5mWegyDwu4lOdvRxS
 4X4-KOdyvmvQNW9etE>
X-ME-Received: <xmr:2GMeYU6UTQ3OEMakw8QKoA4ryUnlbNDCwmL-qfiXQRMEqQ1NyqncJ9G8wPgZd6eZUKz7DbIDY-mfxmDGSccegjDevC0mACVf51d3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2GMeYV2lEf5WHvsG8AEhRxHt_KK6jbvtg4-QklxMLXC2NO95w4qPrQ>
 <xmx:2GMeYfG6FFx5Id0KKeDe7MWYJmjPKIVs2Hpc0ncMPPfuQkVVJxvBqg>
 <xmx:2GMeYe-62qkqmtbOh11AnA9oqX__JA3EnBvKdzFTeWKnLOBJGL4U3g>
 <xmx:2WMeYVWLxTAASnq9S1CQatgPMEniywPM8TmCz3aYU72gbJFFgCRreOmp5-Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:59:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 4/6] drm/vc4: hdmi: Split the CEC disable / enable
 functions in two
Date: Thu, 19 Aug 2021 15:59:29 +0200
Message-Id: <20210819135931.895976-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819135931.895976-1-maxime@cerno.tech>
References: <20210819135931.895976-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to ease further additions to the CEC enable and disable, let's
split the function into two functions, one to enable and the other to
disable.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 73 ++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8458f38e2883..bfa35e32052f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1740,7 +1740,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	return ret;
 }
 
-static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
@@ -1753,38 +1753,53 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	val |= ((4700 / usecs) << VC4_HDMI_CEC_CNT_TO_4700_US_SHIFT) |
 	       ((4500 / usecs) << VC4_HDMI_CEC_CNT_TO_4500_US_SHIFT);
 
-	if (enable) {
-		HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
-			   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
-		HDMI_WRITE(HDMI_CEC_CNTRL_5, val);
-		HDMI_WRITE(HDMI_CEC_CNTRL_2,
-			   ((1500 / usecs) << VC4_HDMI_CEC_CNT_TO_1500_US_SHIFT) |
-			   ((1300 / usecs) << VC4_HDMI_CEC_CNT_TO_1300_US_SHIFT) |
-			   ((800 / usecs) << VC4_HDMI_CEC_CNT_TO_800_US_SHIFT) |
-			   ((600 / usecs) << VC4_HDMI_CEC_CNT_TO_600_US_SHIFT) |
-			   ((400 / usecs) << VC4_HDMI_CEC_CNT_TO_400_US_SHIFT));
-		HDMI_WRITE(HDMI_CEC_CNTRL_3,
-			   ((2750 / usecs) << VC4_HDMI_CEC_CNT_TO_2750_US_SHIFT) |
-			   ((2400 / usecs) << VC4_HDMI_CEC_CNT_TO_2400_US_SHIFT) |
-			   ((2050 / usecs) << VC4_HDMI_CEC_CNT_TO_2050_US_SHIFT) |
-			   ((1700 / usecs) << VC4_HDMI_CEC_CNT_TO_1700_US_SHIFT));
-		HDMI_WRITE(HDMI_CEC_CNTRL_4,
-			   ((4300 / usecs) << VC4_HDMI_CEC_CNT_TO_4300_US_SHIFT) |
-			   ((3900 / usecs) << VC4_HDMI_CEC_CNT_TO_3900_US_SHIFT) |
-			   ((3600 / usecs) << VC4_HDMI_CEC_CNT_TO_3600_US_SHIFT) |
-			   ((3500 / usecs) << VC4_HDMI_CEC_CNT_TO_3500_US_SHIFT));
+	HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
+		   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
+	HDMI_WRITE(HDMI_CEC_CNTRL_5, val);
+	HDMI_WRITE(HDMI_CEC_CNTRL_2,
+		   ((1500 / usecs) << VC4_HDMI_CEC_CNT_TO_1500_US_SHIFT) |
+		   ((1300 / usecs) << VC4_HDMI_CEC_CNT_TO_1300_US_SHIFT) |
+		   ((800 / usecs) << VC4_HDMI_CEC_CNT_TO_800_US_SHIFT) |
+		   ((600 / usecs) << VC4_HDMI_CEC_CNT_TO_600_US_SHIFT) |
+		   ((400 / usecs) << VC4_HDMI_CEC_CNT_TO_400_US_SHIFT));
+	HDMI_WRITE(HDMI_CEC_CNTRL_3,
+		   ((2750 / usecs) << VC4_HDMI_CEC_CNT_TO_2750_US_SHIFT) |
+		   ((2400 / usecs) << VC4_HDMI_CEC_CNT_TO_2400_US_SHIFT) |
+		   ((2050 / usecs) << VC4_HDMI_CEC_CNT_TO_2050_US_SHIFT) |
+		   ((1700 / usecs) << VC4_HDMI_CEC_CNT_TO_1700_US_SHIFT));
+	HDMI_WRITE(HDMI_CEC_CNTRL_4,
+		   ((4300 / usecs) << VC4_HDMI_CEC_CNT_TO_4300_US_SHIFT) |
+		   ((3900 / usecs) << VC4_HDMI_CEC_CNT_TO_3900_US_SHIFT) |
+		   ((3600 / usecs) << VC4_HDMI_CEC_CNT_TO_3600_US_SHIFT) |
+		   ((3500 / usecs) << VC4_HDMI_CEC_CNT_TO_3500_US_SHIFT));
+
+	if (!vc4_hdmi->variant->external_irq_controller)
+		HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
 
-		if (!vc4_hdmi->variant->external_irq_controller)
-			HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
-	} else {
-		if (!vc4_hdmi->variant->external_irq_controller)
-			HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
-		HDMI_WRITE(HDMI_CEC_CNTRL_5, val |
-			   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
-	}
 	return 0;
 }
 
+static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
+{
+	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+
+	if (!vc4_hdmi->variant->external_irq_controller)
+		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
+
+	HDMI_WRITE(HDMI_CEC_CNTRL_5, HDMI_READ(HDMI_CEC_CNTRL_5) |
+		   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
+
+	return 0;
+}
+
+static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	if (enable)
+		return vc4_hdmi_cec_enable(adap);
+	else
+		return vc4_hdmi_cec_disable(adap);
+}
+
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
-- 
2.31.1

