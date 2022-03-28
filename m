Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259534E9B35
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB4A10ED54;
	Mon, 28 Mar 2022 15:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB2610ED53
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:08 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9BE803201E00;
 Mon, 28 Mar 2022 11:37:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 11:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=Y44JGw0nAmMFW76fyDAc3fwphRtxjT
 PHRw7UpRh2K8c=; b=hlrjUpOSTg2B0ihUZ/uTQDKlpPTn05ce6TeHc5sDRVSLMW
 SBUxUSpT+KiR148mMqz4TGTBHw5SYEAUOXujzENVuTjgibcxk15LILlgbvHBXC73
 EC0GZb0Y4lYddb12Rp94CYaKsfr4H7b8nS/U6UIxdkFe/YC8V/6l22zvDstpO445
 IWTZS8VZBT/5ZAZlyVXXgrwMv0PXFxm+VCDw9rYGelWjx8u0fEDTluVmgGNnt20a
 JVLb4e4NcsDteSlRtaHKdMqAzREt52ACSa49f9ViUjZfd9HpCb4Q954Lyq3EHJGG
 YZcpwRGuoBL5M5VzpvjqnOYcZPpegY3mwdBOQaTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y44JGw
 0nAmMFW76fyDAc3fwphRtxjTPHRw7UpRh2K8c=; b=ExkpA/cAmpMda5ABTIN7Qe
 Xn0JzIdY8e55B81SO4e6BCXx3q/vzfIQZ2e9YtHwZ7TPMvXcgj358zDXTPVBlYPv
 xJWI49MuvbZOGJx03Hiw+0ZmKMSxYVRecTzWQZgoB3VC2U5DYxlBwEjEMpr0YYWj
 WCTtlAAnj/0JLC5ux5J7lT1HIo8xGmRVzFQ3PZPMGrSD37j+MqwxPiMqt4bp5BdC
 TvPIC9w+WnZpGM+gzYp8lqhKIce8myRV/tRoelyYD3R9bvtCitOczxqjqnmCc17k
 h+oTcFm0U9Q8rFlZaLAfqty4buLIprT6FrZOMFqTMT02DEDZT8tN5/wefdSLQBmg
 ==
X-ME-Sender: <xms:IdZBYmzW0PU2zXR5SzulHchuBieus-FFwyZS4tI2oK-q2VLHjYj9IA>
 <xme:IdZBYiRwFuZCVUdIScEqLhBoKuagBi0C8Zwf03Z_YuSCP2kAiQqfprvAToBQJIePi
 vZHOL6G2l4n7nv4bRM>
X-ME-Received: <xmr:IdZBYoVv3rBbZEsu17n-ftVSiDSvfR-bq2YyPPqJ2lP1M-651jojPPKfxyLJ2IwFP6AjECNSD7adiu1FBIrZiO6X6oAVbNaYQbY5Jmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IdZBYshlZpCvFafr8KDd2N9ptIsFYlWwHF2ocHiLyRhR1MNtBA0BQQ>
 <xmx:IdZBYoDKrvsHyd3jV9lj8XiK7Uq9aw7yr90sD-s0DECMocnGa-izyA>
 <xmx:IdZBYtLUQWLg8zZFzYVDdHfvSDCLNu0eJkqFxeWqtypLpVooc9SzXw>
 <xmx:ItZBYr_XSepS4tFFaiiRzE_DvNf1d-ZJxruohrymJETIN_XdcARsSw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/vc4: hvs: Reset muxes at probe time
Date: Mon, 28 Mar 2022 17:36:54 +0200
Message-Id: <20220328153659.2382206-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328153659.2382206-1-maxime@cerno.tech>
References: <20220328153659.2382206-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By default, the HVS driver will force the HVS output 3 to be muxed to
the HVS channel 2. However, the Transposer can only be assigned to the
HVS channel 2, so whenever we try to use the writeback connector, we'll
mux its associated output (Output 2) to the channel 2.

This leads to both the output 2 and 3 feeding from the same channel,
which is explicitly discouraged in the documentation.

In order to avoid this, let's reset all the output muxes to their reset
value.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 604933e20e6a..911968a1c97b 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -582,6 +582,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_hvs *hvs = NULL;
 	int ret;
 	u32 dispctrl;
+	u32 reg;
 
 	hvs = devm_kzalloc(&pdev->dev, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
@@ -653,6 +654,26 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 
 	vc4->hvs = hvs;
 
+	reg = HVS_READ(SCALER_DISPECTRL);
+	reg &= ~SCALER_DISPECTRL_DSP2_MUX_MASK;
+	HVS_WRITE(SCALER_DISPECTRL,
+		  reg | VC4_SET_FIELD(0, SCALER_DISPECTRL_DSP2_MUX));
+
+	reg = HVS_READ(SCALER_DISPCTRL);
+	reg &= ~SCALER_DISPCTRL_DSP3_MUX_MASK;
+	HVS_WRITE(SCALER_DISPCTRL,
+		  reg | VC4_SET_FIELD(3, SCALER_DISPCTRL_DSP3_MUX));
+
+	reg = HVS_READ(SCALER_DISPEOLN);
+	reg &= ~SCALER_DISPEOLN_DSP4_MUX_MASK;
+	HVS_WRITE(SCALER_DISPEOLN,
+		  reg | VC4_SET_FIELD(3, SCALER_DISPEOLN_DSP4_MUX));
+
+	reg = HVS_READ(SCALER_DISPDITHER);
+	reg &= ~SCALER_DISPDITHER_DSP5_MUX_MASK;
+	HVS_WRITE(SCALER_DISPDITHER,
+		  reg | VC4_SET_FIELD(3, SCALER_DISPDITHER_DSP5_MUX));
+
 	dispctrl = HVS_READ(SCALER_DISPCTRL);
 
 	dispctrl |= SCALER_DISPCTRL_ENABLE;
@@ -660,10 +681,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		    SCALER_DISPCTRL_DISPEIRQ(1) |
 		    SCALER_DISPCTRL_DISPEIRQ(2);
 
-	/* Set DSP3 (PV1) to use HVS channel 2, which would otherwise
-	 * be unused.
-	 */
-	dispctrl &= ~SCALER_DISPCTRL_DSP3_MUX_MASK;
 	dispctrl &= ~(SCALER_DISPCTRL_DMAEIRQ |
 		      SCALER_DISPCTRL_SLVWREIRQ |
 		      SCALER_DISPCTRL_SLVRDEIRQ |
@@ -677,7 +694,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		      SCALER_DISPCTRL_DSPEISLUR(1) |
 		      SCALER_DISPCTRL_DSPEISLUR(2) |
 		      SCALER_DISPCTRL_SCLEIRQ);
-	dispctrl |= VC4_SET_FIELD(2, SCALER_DISPCTRL_DSP3_MUX);
 
 	HVS_WRITE(SCALER_DISPCTRL, dispctrl);
 
-- 
2.35.1

