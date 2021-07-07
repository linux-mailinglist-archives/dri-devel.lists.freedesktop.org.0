Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C93BE585
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6A76E85F;
	Wed,  7 Jul 2021 09:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B8C6E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:23:15 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 58C412B0092C;
 Wed,  7 Jul 2021 05:23:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 05:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XTHw40j0cUt5d
 iDUpj05Fh3mhY0boF2BdP9TxoiGxwY=; b=fN7TG4L9NY+W8Yf1AqsdlUyx3Y71k
 C/1TYr801RHbabqkOkI8fn8a0j9ROKqXZyDm9apOzYuZKfEHUylfMlLwWPNME5JO
 CJuOkfeJHuP1stIfRkC8awjcfPhhEb4lC43KazvpJZoVhyYVPldYvZwrT9VQVP5q
 z6yXMULDKBC4Ou2wDK+F7xL2a8EL0BJ2Ltwy51lXKz62Dw9xjXfHFaKGbAj30Kjo
 i4OG66kuBJ9DGlIHAMloR4CH9pAvdGMTnTi7R05/xlzEI136RB8r22CHhVbwv2U2
 Do+ke70oJb9/9YLG2EaQLXlwZjhLiXY3BAtQNvLzlKdWflaW8TmfePxIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XTHw40j0cUt5diDUpj05Fh3mhY0boF2BdP9TxoiGxwY=; b=Hrz9eyTC
 fjdC0o6vogqOoEjMORB9nPQhBK/HaNzTjpL57gF1WSWVHetPtIJ9bPLrlwRHtCg4
 9ZQT+tuVe64kFchQpmEEStSFGFnueTTEK+N5XyutMBZPx9ukMuu++qU8+esn+tvK
 Tq6RXr3TH8JehILpyWt4w2qtb4ZHo/sD1ruQ5Kv7ycemSjMToLBNyC3SJA59qQj3
 5BACcqet4Ea1ONLasVNhS6+r+zpugUvultNCvDBZuLoZts1JtvQ8Y+37Wu+d8RY+
 FBemAdqGvBPn08ek3yvav2DbJiNdWl/4je5wLs2tczBIJzM/n9Y41Q3mQuMlIPIW
 h36D6P8YIvT8DA==
X-ME-Sender: <xms:gXLlYEVu7q8hciphbtidSly0SDqgLM15wpCn1I2RT2SituaH9-rwVQ>
 <xme:gXLlYIkNKeVt6C92NpERQ8x4d4c0v69KKfTSoRMEd2OvtQn5lcctrGRx-K9vU2_i_
 dxjpwzEm6EBJfNqBwA>
X-ME-Received: <xmr:gXLlYIYxULSCj1EGk43JnBH2Zr8p-OmlRVGWtliJsGaC70Rt1dQxeo876Q_dK88KO5PKrE1pEOjMQoakiYW9oCwC8Mgjs9ffdYBT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gXLlYDXmDvN8G5NiO22l26A5b9EGiqJ4gc8Rtt3-XOeCNNk1ZczNdA>
 <xmx:gXLlYOlmS0s8U7DmxGR5sLz7V_zp-G8qs5TcHF2JqBNPuKJeBCbFHg>
 <xmx:gXLlYIfDQjt-rb5j-vq6-L-no9OIeE225L3u7ek1C_eBoesTAnyWyA>
 <xmx:gXLlYI0VVY8Yg1b_Jh63x6gNTDZsvcmAqZ9oVb5SLYnW55kLPVkuObIQ4VE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:23:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 3/5] drm/vc4: hdmi: Split the CEC disable / enable
 functions in two
Date: Wed,  7 Jul 2021 11:22:55 +0200
Message-Id: <20210707092257.1465109-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707092257.1465109-1-maxime@cerno.tech>
References: <20210707092257.1465109-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to ease further additions to the CEC enable and disable, let's
split the function into two functions, one to enable and the other to
disable.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 73 ++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 38eb3caf6c44..825696e6ef02 100644
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

