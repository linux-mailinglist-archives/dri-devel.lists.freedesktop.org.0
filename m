Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88A2D5E83
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B266EAAF;
	Thu, 10 Dec 2020 14:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F01E6E566
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 93AC8EC7;
 Thu, 10 Dec 2020 08:47:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ILrwATdFQbDXy
 /hbJDA31S4DpWf2MY5kgd2rVvGLBCM=; b=d6nzjjUC08S5ahztcn353xTFz4jwk
 M6imtSFXJ+cfXtXyAhxLh2gEbVft6ScAGDvAXdSfTL3h5m+NA7thXeUfYIQI/B+x
 xEz6LCeCdMi1AJkfR0qPT0U6mF9ePcuoYomEGx9Ks1192UksxbSZ40SggoR+4VGR
 HuAifR5DYFjn1DxRMzekU9mXdo5rJ5OiXSLeVh5HDuyApsdcaf3LwXPl1Du/jRpI
 o+u2yNbahPw/EL3DHmn3PnjZh5ile1fxzTnlbu0ymnjqJ7M2gEkx9OempLDwtL37
 YdT3QSB66kKo6LIS/PYZVLsnOE5sgtocuAP8StUYYoa04d/ZeoqYRuAZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ILrwATdFQbDXy/hbJDA31S4DpWf2MY5kgd2rVvGLBCM=; b=AQ/qt3Xx
 NWA1PWSberWpd9hczwVW/jxuMmZbL0Gt+qSpJzn+Az7NfJaimEP9/kgwa/Ihxzm7
 /l1LSMq3h64e6BzcTvEY0B6UzWxfUYk6Snqzg41Tf6FvYUd7xoxMXfRZy6Wk/gtr
 A+GiqkFSN3zyt6dSVqFKFolvPB4ioyIiI1YjuC+pC0rucJgjO/vijKPFWUmvLgs6
 Nhp6XRU9ny/54ulin2Kdg/cQt8Q3Yx4Vd+IPxzFeCjDBuSMw1iWHUybHOtUY87DL
 0+guFLC1YHG9Kp/ow8ZY/YHb0n5hVGgQ5cQB9SRB/pkweDBEdyAUgsxCrUs+uoOf
 oBv3m5roYBGESQ==
X-ME-Sender: <xms:1SbSXzN0gQro9MUZEX31A5-_C6rBU9Nb25LeGgSryMfGoHb6cBR2tg>
 <xme:1SbSXxo_Tr40dl4faA5wq_3vMLgaOz007hcXNEsI6Ug3D4fMBCNOfuoCWJRg5BXsF
 7NDTimdhxwsAIQ3XBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1SbSX66HcdO8wUY7D8Uyn6q9x16DIDHIl-wlC4eDI52VZ6GJ4NlkmQ>
 <xmx:1SbSX5FgJTAy3ns9p1zVzd5keJsuAdbRWk6z1PDS131D2KYvXvZo4g>
 <xmx:1SbSX83rwvdv8VUBgS3JmIydtvkS2PFjLoRhJhZL1oLyMJ1OkuPf-g>
 <xmx:1SbSX5i4i8WOhRz24Cpr8EJQrGkzSik5RMfPHOEmJxqt3-CzIPfntZr6LIA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7CE6108005F;
 Thu, 10 Dec 2020 08:47:00 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 08/15] drm/vc4: hdmi: Introduce a CEC clock
Date: Thu, 10 Dec 2020 14:46:41 +0100
Message-Id: <20201210134648.272857-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the BCM2835 had the CEC clock derived from the HSM clock, the
BCM2711 has a dedicated parent clock for it.

Let's introduce a separate clock for it so that we can handle both
cases.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b93ee3e26e2b..0debd22bc992 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -145,7 +145,7 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 	 * Set the clock divider: the hsm_clock rate and this divider
 	 * setting will give a 40 kHz CEC clock.
 	 */
-	clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
+	clk_cnt = clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
 	value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
 }
@@ -1740,6 +1740,7 @@ static int vc4_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->hsm_clock);
 	}
 	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
+	vc4_hdmi->cec_clock = vc4_hdmi->hsm_clock;
 
 	return 0;
 }
@@ -1833,6 +1834,12 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 		return PTR_ERR(vc4_hdmi->audio_clock);
 	}
 
+	vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
+	if (IS_ERR(vc4_hdmi->cec_clock)) {
+		DRM_ERROR("Failed to get CEC clock\n");
+		return PTR_ERR(vc4_hdmi->cec_clock);
+	}
+
 	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(vc4_hdmi->reset)) {
 		DRM_ERROR("Failed to get HDMI reset line\n");
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 720914761261..adc4bf33ff15 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -155,6 +155,7 @@ struct vc4_hdmi {
 	bool cec_tx_ok;
 	bool cec_irq_was_rx;
 
+	struct clk *cec_clock;
 	struct clk *pixel_clock;
 	struct clk *hsm_clock;
 	struct clk *audio_clock;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
