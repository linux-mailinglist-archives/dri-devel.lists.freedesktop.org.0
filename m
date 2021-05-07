Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8BC37679B
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812276EE60;
	Fri,  7 May 2021 15:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198116EE60
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:06:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D0C417ED;
 Fri,  7 May 2021 11:06:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 11:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=borrIZ8w7kAn6
 eeyppaiVPtd3HiHizxW//+VZhV4w18=; b=OTga3Pa9d4+aV7H2N9lNplVyP+K/O
 yEcIs2cWkWx0n6ZPob1QFtM6atBEQqeMLHw04viUuCebpjTAouSP/7dpwiDfDc0A
 cmN1BO/cQqkn9jum6YHIgv2jjpKKw808JqqzI+lgnzby2QMzNPSW/Kx9bEn9IYeQ
 6cOYIEAkNtwbinkLFFq+3RGeT9CbJBWDriOuYkMz4InIXtPPZvwUcZW+6QIjqpk1
 YddYwqFKboI7rynHwHclLaf47Oie082uWRYzZqgQbtdkjBiFbUASuburJ+W48OR0
 jBB0cLy+KHJJDORgHgAvEAvmaKk3EOwOg57dZpMgWfGcE4SzkloujhMCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=borrIZ8w7kAn6eeyppaiVPtd3HiHizxW//+VZhV4w18=; b=RQN1poOu
 A+C7jDDO9GSxGUatW42tt53l2T03b4XLJa8htXY5n4kc74gWqk09xBVE0g5wwBir
 oenBqBzn7peXwMjq9QBU+yIiuFxZpHdX6nJNM71CPiujPNyFPGYZcFoVvETZ94aO
 zuLaZvv14y5oxFiXlZGs+FGn3IuM8/a0RHbllEj1sFmzFmt8+E814ZGplJ1uiIiR
 M7caiL8vDsqGRr7MhL7hCe0NNhcCAxQtG/JNEMs+Xy2f2CJ4o8OgrBc1DGPLfOtW
 APVg7AT8jkrH5uWFhy+wv4vsQJCwXVDw6TK5JY3xraWTiu+w9+E8Qx4gpAPpaNc2
 mYkUxUiiV6x/0g==
X-ME-Sender: <xms:aFeVYIloiVxfA07tTpvnWZos0qgUnoBFqY3aPFSTXkof26Xb5TUGvQ>
 <xme:aFeVYH20rk5YyR0cinvAwqW-sSsVSXj-sMCeB300Z-pEFNslgi11W8Ta1Acz9o9Th
 2s0VskoPVthTZnh1G4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aFeVYGp_JzdC1sFiFBAdRUH6xI7GPHx0K158_M8MWcZMZqZI0NcrjA>
 <xmx:aFeVYEno5Z5IcCBlXtcFEUeFR3o6A3qf-P1v_MgrIDpSHGTKZgMjKQ>
 <xmx:aFeVYG1BJeQ7JUObMyccV6UxpxwL3Pgk_SmqI__0nfpXNiU1mwpleQ>
 <xmx:aleVYMM3P1iwfyUMlKk8h0Eu8oY1aVgPeofRQTFNVxkMgmkFQvqNsFBVCJM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:06:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 11/12] drm/vc4: hdmi: Add a workqueue to set scrambling
Date: Fri,  7 May 2021 17:05:14 +0200
Message-Id: <20210507150515.257424-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507150515.257424-1-maxime@cerno.tech>
References: <20210507150515.257424-1-maxime@cerno.tech>
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
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like some displays (like the LG 27UL850-W) don't enable the
scrambling when the HDMI driver enables it. However, if we set later the
scrambler enable bit, the display will work as expected.

Let's create delayed work queue to periodically look at the display
scrambling status, and if it's not set yet try to enable it again.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bda12fea0dce..4fa7ea419594 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -482,6 +482,8 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
 	return true;
 }
 
+#define SCRAMBLING_POLLING_DELAY_MS	1000
+
 static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
@@ -498,6 +500,9 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
 		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+
+	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
+			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
 }
 
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
@@ -516,6 +521,9 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 	if (crtc && !vc4_hdmi_mode_needs_scrambling(&crtc->mode))
 		return;
 
+	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
+		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
+
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
 		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
 
@@ -523,6 +531,22 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
 }
 
+static void vc4_hdmi_scrambling_wq(struct work_struct *work)
+{
+	struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
+						 struct vc4_hdmi,
+						 scrambling_work);
+
+	if (drm_scdc_get_scrambling_status(vc4_hdmi->ddc))
+		return;
+
+	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
+	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
+
+	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
+			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
+}
+
 static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
@@ -2031,6 +2055,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
 
 	dev_set_drvdata(dev, vc4_hdmi);
 	encoder = &vc4_hdmi->encoder.base.base;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 3cd021136402..00efcf291c5a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -126,6 +126,8 @@ struct vc4_hdmi {
 	struct vc4_hdmi_encoder encoder;
 	struct drm_connector connector;
 
+	struct delayed_work scrambling_work;
+
 	struct i2c_adapter *ddc;
 	void __iomem *hdmicore_regs;
 	void __iomem *hd_regs;
-- 
2.31.1

