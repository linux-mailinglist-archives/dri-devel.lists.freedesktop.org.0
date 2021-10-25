Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68563439838
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4036E044;
	Mon, 25 Oct 2021 14:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0862A6E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4BE705805BE;
 Mon, 25 Oct 2021 10:11:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 10:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+IImRsaklZmEP
 pnsbnEfgBS+hcD0/x7tghNZEPXbb5A=; b=nFkPk5gwamNeiScNZ/pQkhsE4+g09
 YukXzABN2PaWqeSShDHLOmjzyPTbFgpE/j0iAr2ZQ5LrWhR28nLvMk7tu8P5kgFh
 uF8NriAXaD0KZtupWDbzwRrBFyGKITpyfkbDHbBfXLHKPwWTqhOdTmuJk1sWEQZ9
 /mVr7fY1EkgEucjp3pguSv3jWA5gqEDlKV8XeNF4W2VYvZuVgUJCs0UIra7dnP36
 HfUWHASFBtdkIi4C2eSFv84D9dkkGCRu6RhrXCQtKXwvV5JDTKrkXmq3IeFzecgA
 gCKAyQCW7+l2WuMkEXliagpDY/Sh23+oAeE35hCmjwEH3hCc3wk040ffg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+IImRsaklZmEPpnsbnEfgBS+hcD0/x7tghNZEPXbb5A=; b=kk0XMcAK
 3R/ATnQwTQDT+qpNTXqFgJ80SFZ9iQ1zzrOb6F/icUj0nmXppi07pY/S0SAbmafv
 fPBuufz6fEYVs0ne/eHRaQ27fe+8QKy0OVD0cISDCku70mtAHZBFACj9navXDCh2
 lgbRgPaIp2Z/4Iv+oCijxt4teonNnAdpCnPu7UUBx5FFzTXWdM/ljOC+bKkQ1tT/
 qwewUNU6BtCQov/T3OFq04JfYLNm+uXO0TJ1bLnDiEm8VeegIAqfOH8iwbBWk79v
 Wb8fXHdxC0RhRmepg2VqZ8HQlVAp1M9xFGp4YnQm8hLvHpUuofx2/KeyI2J9yS4G
 /jCv7svQu6DNNg==
X-ME-Sender: <xms:D7t2Yda1iTjQdP8ubdAPC83gyWymzsxh-o9gFqgXCru_aWrbuvQuTw>
 <xme:D7t2YUbMPkkBur2RK4NHftXkgzQCzValuqz0F14s6WQvDtgR9KApuAuSK0zIa2dkM
 abcii6VhKexd9WqKVo>
X-ME-Received: <xmr:D7t2Yf81LJd3QN3AoA_FySOs_pEAp-6sY_wgafO8r8Jg-MVal2w654MjUpK1KS0naj4V9PMRIEUvdB4hF62qTqpo7pbIpkZNEcpHtUAG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:D7t2YbqDTUQ9jrFn10gDal7Dn7r9yV1Q-OTQgqu0D1UFnESqtU1CQQ>
 <xmx:D7t2YYr2FbG0zopDtqo1tZTHHPGLZx0IheWq31JuWh7NflPqHLKfKQ>
 <xmx:D7t2YRSR-JVIBfWAK2r-S-GO8fZLmnzXWpqhHUo3_lX78EOoqt4gfA>
 <xmx:D7t2Yf0GE4A7vJFWeGfpfUFlVkAB8XJtTH38Qa3PSM6gEsrBACpOCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 4/9] drm/vc4: hdmi: Add a spinlock to protect register access
Date: Mon, 25 Oct 2021 16:11:08 +0200
Message-Id: <20211025141113.702757-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025141113.702757-1-maxime@cerno.tech>
References: <20211025141113.702757-1-maxime@cerno.tech>
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

The vc4 HDMI driver has multiple path shared between the CEC, ALSA and
KMS frameworks, plus two interrupt handlers (CEC and hotplug) that will
read and modify a number of registers.

Even though not bug has been reported so far, it's definitely unsafe, so
let's just add a spinlock to protect the register access of the HDMI
controller.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 202 ++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h      |   5 +
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |  37 +++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   2 +
 4 files changed, 236 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8cc84395f4cb..484450831483 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -118,6 +118,10 @@ static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 
 static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_M_CTL, VC4_HD_M_SW_RST);
 	udelay(1);
 	HDMI_WRITE(HDMI_M_CTL, 0);
@@ -129,24 +133,36 @@ static void vc4_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 		   VC4_HDMI_SW_RESET_FORMAT_DETECT);
 
 	HDMI_WRITE(HDMI_SW_RESET_CONTROL, 0);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc5_hdmi_reset(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
 	reset_control_reset(vc4_hdmi->reset);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_DVP_CTL, 0);
 
 	HDMI_WRITE(HDMI_CLOCK_STOP,
 		   HDMI_READ(HDMI_CLOCK_STOP) | VC4_DVP_HT_CLOCK_STOP_PIXEL);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long cec_rate = clk_get_rate(vc4_hdmi->cec_clock);
+	unsigned long flags;
 	u16 clk_cnt;
 	u32 value;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	value = HDMI_READ(HDMI_CEC_CNTRL_1);
 	value &= ~VC4_HDMI_CEC_DIV_CLK_CNT_MASK;
 
@@ -154,9 +170,11 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 	 * Set the clock divider: the hsm_clock rate and this divider
 	 * setting will give a 40 kHz CEC clock.
 	 */
-	clk_cnt = clk_get_rate(vc4_hdmi->cec_clock) / CEC_CLOCK_FREQ;
+	clk_cnt = cec_rate / CEC_CLOCK_FREQ;
 	value |= clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 #else
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
@@ -175,8 +193,16 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 		connected = true;
 	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
 		connected = true;
-	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
-		connected = true;
+	} else {
+		unsigned long flags;
+		u32 hotplug;
+
+		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+		hotplug = HDMI_READ(HDMI_HOTPLUG);
+		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
+		if (hotplug & VC4_HDMI_HOTPLUG_CONNECTED)
+			connected = true;
 	}
 
 	if (connected) {
@@ -369,9 +395,12 @@ static int vc4_hdmi_stop_packet(struct drm_encoder *encoder,
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	u32 packet_id = type - 0x80;
+	unsigned long flags;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) & ~BIT(packet_id));
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	if (!poll)
 		return 0;
@@ -391,6 +420,7 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 	void __iomem *base = __vc4_hdmi_get_field_base(vc4_hdmi,
 						       ram_packet_start->reg);
 	uint8_t buffer[VC4_HDMI_PACKET_STRIDE];
+	unsigned long flags;
 	ssize_t len, i;
 	int ret;
 
@@ -408,6 +438,8 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 		return;
 	}
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	for (i = 0; i < len; i += 7) {
 		writel(buffer[i + 0] << 0 |
 		       buffer[i + 1] << 8 |
@@ -425,6 +457,9 @@ static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 		   HDMI_READ(HDMI_RAM_PACKET_CONFIG) | BIT(packet_id));
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	ret = wait_for((HDMI_READ(HDMI_RAM_PACKET_STATUS) &
 			BIT(packet_id)), 100);
 	if (ret)
@@ -544,6 +579,7 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 {
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long flags;
 
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
@@ -554,8 +590,10 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
 	drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
 		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
@@ -565,6 +603,7 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	struct drm_crtc *crtc = encoder->crtc;
+	unsigned long flags;
 
 	/*
 	 * At boot, encoder->crtc will be NULL. Since we don't know the
@@ -580,8 +619,10 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
 		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
 		   ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	drm_scdc_set_scrambling(vc4_hdmi->ddc, false);
 	drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
@@ -607,15 +648,23 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 					       struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
 
 	HDMI_WRITE(HDMI_VID_CTL, HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_CLRRGB);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	mdelay(1);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	vc4_hdmi_disable_scrambling(encoder);
 }
 
@@ -623,10 +672,13 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
 						 struct drm_atomic_state *state)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long flags;
 	int ret;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_VID_CTL,
 		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	if (vc4_hdmi->variant->phy_disable)
 		vc4_hdmi->variant->phy_disable(vc4_hdmi);
@@ -645,8 +697,11 @@ static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
 
 static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 {
+	unsigned long flags;
 	u32 csc_ctl;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	csc_ctl = VC4_SET_FIELD(VC4_HD_CSC_CTL_ORDER_BGR,
 				VC4_HD_CSC_CTL_ORDER);
 
@@ -676,14 +731,19 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 
 	/* The RGB order applies even when CSC is disabled. */
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 {
+	unsigned long flags;
 	u32 csc_ctl;
 
 	csc_ctl = 0x07;	/* RGB_CONVERT_MODE = custom matrix, || USE_RGB_TO_YCBCR */
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	if (enable) {
 		/* CEA VICs other than #1 requre limited range RGB
 		 * output unless overridden by an AVI infoframe.
@@ -715,6 +775,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi, bool enable)
 	}
 
 	HDMI_WRITE(HDMI_CSC_CTL, csc_ctl);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
@@ -738,6 +800,9 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_HORZA,
 		   (vsync_pos ? VC4_HDMI_HORZA_VPOS : 0) |
@@ -761,6 +826,8 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 
 	HDMI_WRITE(HDMI_VERTB0, vertb_even);
 	HDMI_WRITE(HDMI_VERTB1, vertb);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
@@ -784,10 +851,13 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 					mode->crtc_vsync_end -
 					interlaced,
 					VC4_HDMI_VERTB_VBP));
+	unsigned long flags;
 	unsigned char gcp;
 	bool gcp_en;
 	u32 reg;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
 	HDMI_WRITE(HDMI_HORZA,
 		   (vsync_pos ? VC5_HDMI_HORZA_VPOS : 0) |
@@ -846,13 +916,18 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
 	HDMI_WRITE(HDMI_GCP_CONFIG, reg);
 
 	HDMI_WRITE(HDMI_CLOCK_STOP, 0);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
 	u32 drift;
 	int ret;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	drift = HDMI_READ(HDMI_FIFO_CTL);
 	drift &= VC4_HDMI_FIFO_VALID_WRITE_MASK;
 
@@ -860,12 +935,20 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
 		   drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
 	HDMI_WRITE(HDMI_FIFO_CTL,
 		   drift | VC4_HDMI_FIFO_CTL_RECENTER);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	usleep_range(1000, 1100);
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_FIFO_CTL,
 		   drift & ~VC4_HDMI_FIFO_CTL_RECENTER);
 	HDMI_WRITE(HDMI_FIFO_CTL,
 		   drift | VC4_HDMI_FIFO_CTL_RECENTER);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	ret = wait_for(HDMI_READ(HDMI_FIFO_CTL) &
 		       VC4_HDMI_FIFO_CTL_RECENTER_DONE, 1);
 	WARN_ONCE(ret, "Timeout waiting for "
@@ -899,6 +982,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	unsigned long pixel_rate = vc4_conn_state->pixel_rate;
 	unsigned long bvb_rate, hsm_rate;
+	unsigned long flags;
 	int ret;
 
 	/*
@@ -967,11 +1051,15 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	if (vc4_hdmi->variant->phy_init)
 		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
 		   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 		   VC4_HDMI_SCHEDULER_CONTROL_MANUAL_FORMAT |
 		   VC4_HDMI_SCHEDULER_CONTROL_IGNORE_VSYNC_PREDICTS);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	if (vc4_hdmi->variant->set_timings)
 		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
 
@@ -991,6 +1079,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
+	unsigned long flags;
 
 	if (vc4_encoder->hdmi_monitor &&
 	    drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED) {
@@ -1005,7 +1094,9 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder,
 		vc4_encoder->limited_rgb_range = false;
 	}
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
@@ -1016,8 +1107,11 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
 	bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
 	bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
+	unsigned long flags;
 	int ret;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_VID_CTL,
 		   VC4_HD_VID_CTL_ENABLE |
 		   VC4_HD_VID_CTL_CLRRGB |
@@ -1034,6 +1128,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
 			   VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
 
+		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 		ret = wait_for(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
 			       VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE, 1000);
 		WARN_ONCE(ret, "Timeout waiting for "
@@ -1046,6 +1142,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			   HDMI_READ(HDMI_SCHEDULER_CONTROL) &
 			   ~VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
 
+		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 		ret = wait_for(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
 				 VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE), 1000);
 		WARN_ONCE(ret, "Timeout waiting for "
@@ -1053,6 +1151,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 	}
 
 	if (vc4_encoder->hdmi_monitor) {
+		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
 			  VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE));
 		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
@@ -1062,6 +1162,8 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 		HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
 			   VC4_HDMI_RAM_PACKET_ENABLE);
 
+		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 		vc4_hdmi_set_infoframes(encoder);
 	}
 
@@ -1183,6 +1285,7 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 					 unsigned int samplerate)
 {
 	u32 hsm_clock = clk_get_rate(vc4_hdmi->audio_clock);
+	unsigned long flags;
 	unsigned long n, m;
 
 	rational_best_approximation(hsm_clock, samplerate,
@@ -1192,9 +1295,11 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 				     VC4_HD_MAI_SMP_M_SHIFT) + 1,
 				    &n, &m);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_MAI_SMP,
 		   VC4_SET_FIELD(n, VC4_HD_MAI_SMP_N) |
 		   VC4_SET_FIELD(m - 1, VC4_HD_MAI_SMP_M));
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
@@ -1205,6 +1310,8 @@ static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerat
 	u32 n, cts;
 	u64 tmp;
 
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
 	n = 128 * samplerate / 1000;
 	tmp = (u64)(mode->clock * 1000) * n;
 	do_div(tmp, 128 * samplerate);
@@ -1234,6 +1341,7 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
+	unsigned long flags;
 
 	/*
 	 * If the HDMI encoder hasn't probed, or the encoder is
@@ -1245,12 +1353,14 @@ static int vc4_hdmi_audio_startup(struct device *dev, void *data)
 
 	vc4_hdmi->audio.streaming = true;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_MAI_CTL,
 		   VC4_HD_MAI_CTL_RESET |
 		   VC4_HD_MAI_CTL_FLUSH |
 		   VC4_HD_MAI_CTL_DLATE |
 		   VC4_HD_MAI_CTL_ERRORE |
 		   VC4_HD_MAI_CTL_ERRORF);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	if (vc4_hdmi->variant->phy_rng_enable)
 		vc4_hdmi->variant->phy_rng_enable(vc4_hdmi);
@@ -1262,6 +1372,7 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	struct device *dev = &vc4_hdmi->pdev->dev;
+	unsigned long flags;
 	int ret;
 
 	vc4_hdmi->audio.streaming = false;
@@ -1269,20 +1380,29 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	if (ret)
 		dev_err(dev, "Failed to stop audio infoframe: %d\n", ret);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_MAI_CTL, VC4_HD_MAI_CTL_RESET);
 	HDMI_WRITE(HDMI_MAI_CTL, VC4_HD_MAI_CTL_ERRORF);
 	HDMI_WRITE(HDMI_MAI_CTL, VC4_HD_MAI_CTL_FLUSH);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_MAI_CTL,
 		   VC4_HD_MAI_CTL_DLATE |
 		   VC4_HD_MAI_CTL_ERRORE |
 		   VC4_HD_MAI_CTL_ERRORF);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	if (vc4_hdmi->variant->phy_rng_disable)
 		vc4_hdmi->variant->phy_rng_disable(vc4_hdmi);
 
@@ -1337,6 +1457,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base.base;
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
+	unsigned long flags;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
 	u32 mai_audio_format;
@@ -1345,14 +1466,15 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
+	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_MAI_CTL,
 		   VC4_SET_FIELD(channels, VC4_HD_MAI_CTL_CHNUM) |
 		   VC4_HD_MAI_CTL_WHOLSMP |
 		   VC4_HD_MAI_CTL_CHALIGN |
 		   VC4_HD_MAI_CTL_ENABLE);
 
-	vc4_hdmi_audio_set_mai_clock(vc4_hdmi, sample_rate);
-
 	mai_sample_rate = sample_rate_to_mai_fmt(sample_rate);
 	if (params->iec.status[0] & IEC958_AES0_NONAUDIO &&
 	    params->channels == 8)
@@ -1390,8 +1512,11 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	channel_map = vc4_hdmi->variant->channel_map(vc4_hdmi, channel_mask);
 	HDMI_WRITE(HDMI_MAI_CHANNEL_MAP, channel_map);
 	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
+
 	vc4_hdmi_set_n_cts(vc4_hdmi, sample_rate);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	memcpy(&vc4_hdmi->audio.infoframe, &params->cea, sizeof(params->cea));
 	vc4_hdmi_set_audio_infoframe(encoder);
 
@@ -1667,6 +1792,8 @@ static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 	struct cec_msg *msg = &vc4_hdmi->cec_rx_msg;
 	unsigned int i;
 
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
 	msg->len = 1 + ((cntrl1 & VC4_HDMI_CEC_REC_WRD_CNT_MASK) >>
 					VC4_HDMI_CEC_REC_WRD_CNT_SHIFT);
 
@@ -1685,11 +1812,12 @@ static void vc4_cec_read_msg(struct vc4_hdmi *vc4_hdmi, u32 cntrl1)
 	}
 }
 
-static irqreturn_t vc4_cec_irq_handler_tx_bare(int irq, void *priv)
+static irqreturn_t vc4_cec_irq_handler_tx_bare_locked(struct vc4_hdmi *vc4_hdmi)
 {
-	struct vc4_hdmi *vc4_hdmi = priv;
 	u32 cntrl1;
 
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
 	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
 	vc4_hdmi->cec_tx_ok = cntrl1 & VC4_HDMI_CEC_TX_STATUS_GOOD;
 	cntrl1 &= ~VC4_HDMI_CEC_START_XMIT_BEGIN;
@@ -1698,11 +1826,24 @@ static irqreturn_t vc4_cec_irq_handler_tx_bare(int irq, void *priv)
 	return IRQ_WAKE_THREAD;
 }
 
-static irqreturn_t vc4_cec_irq_handler_rx_bare(int irq, void *priv)
+static irqreturn_t vc4_cec_irq_handler_tx_bare(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
+	irqreturn_t ret;
+
+	spin_lock(&vc4_hdmi->hw_lock);
+	ret = vc4_cec_irq_handler_tx_bare_locked(vc4_hdmi);
+	spin_unlock(&vc4_hdmi->hw_lock);
+
+	return ret;
+}
+
+static irqreturn_t vc4_cec_irq_handler_rx_bare_locked(struct vc4_hdmi *vc4_hdmi)
+{
 	u32 cntrl1;
 
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
 	vc4_hdmi->cec_rx_msg.len = 0;
 	cntrl1 = HDMI_READ(HDMI_CEC_CNTRL_1);
 	vc4_cec_read_msg(vc4_hdmi, cntrl1);
@@ -1715,6 +1856,18 @@ static irqreturn_t vc4_cec_irq_handler_rx_bare(int irq, void *priv)
 	return IRQ_WAKE_THREAD;
 }
 
+static irqreturn_t vc4_cec_irq_handler_rx_bare(int irq, void *priv)
+{
+	struct vc4_hdmi *vc4_hdmi = priv;
+	irqreturn_t ret;
+
+	spin_lock(&vc4_hdmi->hw_lock);
+	ret = vc4_cec_irq_handler_rx_bare_locked(vc4_hdmi);
+	spin_unlock(&vc4_hdmi->hw_lock);
+
+	return ret;
+}
+
 static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
@@ -1725,14 +1878,17 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	if (!(stat & VC4_HDMI_CPU_CEC))
 		return IRQ_NONE;
 
+	spin_lock(&vc4_hdmi->hw_lock);
 	cntrl5 = HDMI_READ(HDMI_CEC_CNTRL_5);
 	vc4_hdmi->cec_irq_was_rx = cntrl5 & VC4_HDMI_CEC_RX_CEC_INT;
 	if (vc4_hdmi->cec_irq_was_rx)
-		ret = vc4_cec_irq_handler_rx_bare(irq, priv);
+		ret = vc4_cec_irq_handler_rx_bare_locked(vc4_hdmi);
 	else
-		ret = vc4_cec_irq_handler_tx_bare(irq, priv);
+		ret = vc4_cec_irq_handler_tx_bare_locked(vc4_hdmi);
 
 	HDMI_WRITE(HDMI_CEC_CPU_CLEAR, VC4_HDMI_CPU_CEC);
+	spin_unlock(&vc4_hdmi->hw_lock);
+
 	return ret;
 }
 
@@ -1741,6 +1897,7 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
+	unsigned long flags;
 	u32 val;
 	int ret;
 
@@ -1748,6 +1905,8 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	val = HDMI_READ(HDMI_CEC_CNTRL_5);
 	val &= ~(VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET |
 		 VC4_HDMI_CEC_CNT_TO_4700_US_MASK |
@@ -1778,12 +1937,17 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	if (!vc4_hdmi->variant->external_irq_controller)
 		HDMI_WRITE(HDMI_CEC_CPU_MASK_CLEAR, VC4_HDMI_CPU_CEC);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	return 0;
 }
 
 static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	if (!vc4_hdmi->variant->external_irq_controller)
 		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, VC4_HDMI_CPU_CEC);
@@ -1791,6 +1955,8 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	HDMI_WRITE(HDMI_CEC_CNTRL_5, HDMI_READ(HDMI_CEC_CNTRL_5) |
 		   VC4_HDMI_CEC_TX_SW_RESET | VC4_HDMI_CEC_RX_SW_RESET);
 
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	pm_runtime_put(&vc4_hdmi->pdev->dev);
 
 	return 0;
@@ -1807,10 +1973,14 @@ static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	unsigned long flags;
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_CEC_CNTRL_1,
 		   (HDMI_READ(HDMI_CEC_CNTRL_1) & ~VC4_HDMI_CEC_ADDR_MASK) |
 		   (log_addr & 0xf) << VC4_HDMI_CEC_ADDR_SHIFT);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	return 0;
 }
 
@@ -1819,6 +1989,7 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 {
 	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
 	struct drm_device *dev = vc4_hdmi->connector.dev;
+	unsigned long flags;
 	u32 val;
 	unsigned int i;
 
@@ -1827,6 +1998,8 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 		return -ENOMEM;
 	}
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	for (i = 0; i < msg->len; i += 4)
 		HDMI_WRITE(HDMI_CEC_TX_DATA_1 + (i >> 2),
 			   (msg->msg[i]) |
@@ -1842,6 +2015,9 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	val |= VC4_HDMI_CEC_START_XMIT_BEGIN;
 
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, val);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+
 	return 0;
 }
 
@@ -1856,6 +2032,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
+	unsigned long flags;
 	u32 value;
 	int ret;
 
@@ -1875,10 +2052,12 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
 	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	value = HDMI_READ(HDMI_CEC_CNTRL_1);
 	/* Set the logical address to Unregistered */
 	value |= VC4_HDMI_CEC_ADDR_MASK;
 	HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 	vc4_hdmi_cec_update_clk_div(vc4_hdmi);
 
@@ -1897,7 +2076,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 		if (ret)
 			goto err_remove_cec_rx_handler;
 	} else {
+		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 		HDMI_WRITE(HDMI_CEC_CPU_MASK_SET, 0xffffffff);
+		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
 		ret = request_threaded_irq(platform_get_irq(pdev, 0),
 					   vc4_cec_irq_handler,
@@ -2167,6 +2348,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
 
 	dev_set_drvdata(dev, vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 33e9f665ab8e..006142fe8d4e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -178,6 +178,11 @@ struct vc4_hdmi {
 
 	struct debugfs_regset32 hdmi_regset;
 	struct debugfs_regset32 hd_regset;
+
+	/**
+	 * @hw_lock: Spinlock protecting device register access.
+	 */
+	spinlock_t hw_lock;
 };
 
 static inline struct vc4_hdmi *
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
index 36535480f8e2..62148f0dc284 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
@@ -130,31 +130,49 @@
 void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 		       struct vc4_hdmi_connector_state *conn_state)
 {
+	unsigned long flags;
+
 	/* PHY should be in reset, like
 	 * vc4_hdmi_encoder_disable() does.
 	 */
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
 	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0xf << 16);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_TX_PHY_CTL_0,
 		   HDMI_READ(HDMI_TX_PHY_CTL_0) &
 		   ~VC4_HDMI_TX_PHY_RNG_PWRDN);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_TX_PHY_CTL_0,
 		   HDMI_READ(HDMI_TX_PHY_CTL_0) |
 		   VC4_HDMI_TX_PHY_RNG_PWRDN);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 static unsigned long long
@@ -336,6 +354,8 @@ phy_get_channel_settings(enum vc4_hdmi_phy_channel chan,
 
 static void vc5_hdmi_reset_phy(struct vc4_hdmi *vc4_hdmi)
 {
+	lockdep_assert_held(&vc4_hdmi->hw_lock);
+
 	HDMI_WRITE(HDMI_TX_PHY_RESET_CTL, 0x0f);
 	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL, BIT(10));
 }
@@ -348,10 +368,13 @@ void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 	unsigned long long pixel_freq = conn_state->pixel_rate;
 	unsigned long long vco_freq;
 	unsigned char word_sel;
+	unsigned long flags;
 	u8 vco_sel, vco_div;
 
 	vco_freq = phy_get_vco_freq(pixel_freq, &vco_sel, &vco_div);
 
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
+
 	vc5_hdmi_reset_phy(vc4_hdmi);
 
 	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL,
@@ -501,23 +524,37 @@ void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
 		   HDMI_READ(HDMI_TX_PHY_RESET_CTL) |
 		   VC4_HDMI_TX_PHY_RESET_CTL_PLL_RESETB |
 		   VC4_HDMI_TX_PHY_RESET_CTL_PLLDIV_RESETB);
+
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 void vc5_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	vc5_hdmi_reset_phy(vc4_hdmi);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 void vc5_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL,
 		   HDMI_READ(HDMI_TX_PHY_POWERDOWN_CTL) &
 		   ~VC4_HDMI_TX_PHY_POWERDOWN_CTL_RNDGEN_PWRDN);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
 void vc5_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL,
 		   HDMI_READ(HDMI_TX_PHY_POWERDOWN_CTL) |
 		   VC4_HDMI_TX_PHY_POWERDOWN_CTL_RNDGEN_PWRDN);
+	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 99dde6e06a37..fc971506bd4f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -442,6 +442,8 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
+	lockdep_assert_held(&hdmi->hw_lock);
+
 	WARN_ON(!pm_runtime_active(&hdmi->pdev->dev));
 
 	if (reg >= variant->num_registers) {
-- 
2.31.1

