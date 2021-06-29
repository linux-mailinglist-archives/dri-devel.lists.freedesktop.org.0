Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2683B72C8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB6B6E88E;
	Tue, 29 Jun 2021 12:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F13B6E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:57:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 05C8D580434;
 Tue, 29 Jun 2021 08:57:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 08:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+0noQHyBdsaNs
 Y62SeSff4pVGGZeR97tW4oMo1Ggqqo=; b=YqeI9cdu8F67JFCZq/tK5mbGapTYg
 AFUO/uRQ9OBH2hX/hpuZH44lIiSf6PCmquFVk4L4qZbYZfNT8p559LwNWpPnFVIG
 +MhNjECXd0sI6y1ndLn3ybb/m5M1kLBtwfCG16AhGJZVOsv8X9qy6XFeyRlCH6cT
 fTUzAAYocxyTu5RsICRliUpLfHea692FimjLSY0v5zVc4H7+fmvATfZrq6ak2JsI
 gOYM19AiHOXVgVL8drHNmoWQNbi+XRuYC5c33ML8EAIV/rbclpCo8padKfzeH+6N
 KPVWKjHuvb7isaXWqBoy5EuSH7SngLb+7C1PAwixDdFq4CEPXgL/6luUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+0noQHyBdsaNsY62SeSff4pVGGZeR97tW4oMo1Ggqqo=; b=DEqFtsBU
 UEYnbCaMVFVaYxYd4jnRBCVilCyeiW2y5DoqA2JWR29OiuBNdrsv17dy+0U4VF6W
 0Do5bze8pwtHFRxdBzP0MoQ7pJ1ZXWWz342wSFDTronytZBbwLg6vKRnmRj/TJeh
 J/o5CIVHbG/iXPN/8mRKZ6/h3fbHMwRI7Lxg9W1I1oXJ1aMzXPTaQpcFzxjO/8SO
 I1z437YmsQXDSyp0fxQaCEJRndCn4TQxcG/NRhUKmPKGQfOnhs1KEwKlavzZxAGd
 dBYX2y8LxPbM5zF2O3bn4ejOVWejWs8FLuOxc+ft9hhc6ZwbD6A5llv1CnnNEYci
 fyNgqug7SV2uCw==
X-ME-Sender: <xms:zBjbYJr39vBITRLB1knozN5avw5U4UFIZyfBNN9T_PUHH8NgPiNPNA>
 <xme:zBjbYLrkiZFQIVsq-K3Wmy3axyC18YLbIXLxoluacotAxEhskYtwcgfxVG16Ag3M1
 yeH2TesEV9Tzsw1oxQ>
X-ME-Received: <xmr:zBjbYGPXDfrxuMw_9k6iFLQRMzaD71qAG4lDOWWyTcVrXQAM05duje9m372lCoV5W7dOCAY1eGzRw5jt1_8-kymBRL8CbIFZhRUx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zBjbYE4Tj5XwqjyufmpbuD8hSVJcICK9hANEnxggkTNeLsFM-OuyzA>
 <xmx:zBjbYI4Qb-WYmu_yx6V4VLZptHtb2VanOInikhMIZCrhs1G6r76s5g>
 <xmx:zBjbYMg8-GBUnQqUoxbb3uNC7N1Njfdskd1r4pqkX7u98yPKxyN2Ug>
 <xmx:zRjbYErTkqSEDR-AgBBbT6PIgnnAiqWVRgYiVUhtYlPbbY2apl_vsA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 08:57:48 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/4] drm/vc4: hdmi: Split the CEC disable / enable functions
 in two
Date: Tue, 29 Jun 2021 14:57:35 +0200
Message-Id: <20210629125736.414467-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629125736.414467-1-maxime@cerno.tech>
References: <20210629125736.414467-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
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
index b3db38d37550..3f244027eb58 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1735,7 +1735,7 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	return ret;
 }
 
-static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
@@ -1748,38 +1748,53 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
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

