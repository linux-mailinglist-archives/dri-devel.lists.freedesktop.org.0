Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE60343983F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD786E09F;
	Mon, 25 Oct 2021 14:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3525D6E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 455005805C4;
 Mon, 25 Oct 2021 10:11:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 25 Oct 2021 10:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=8h8wODmNrdTqs
 fbXQ5PfTsnBLTFzbR/jmBUcdYMUs1w=; b=JHfuQ0CKmif9b/DyF4FNpOY7OU7KZ
 3wiIBblEfIAP5QrFQX0IZWHxTDx50pYubU3UrWsP0esevjjSjsdBfpAgWW/0nBdZ
 n+EiFZ8jUocp1v9rQyi8eQp3adoFoGhlBTd+hwqYJbeVDYoechce0yf9phNPETe3
 BmuveWaDgPNdQfua5mguZlBHORWVsVks6B6TQkI29TJ07tDJ6cAoDc8K4N1cRWEp
 Rh36n/Kgr/Dqmvs5EG3A+P/qVCM4YsyWlTaV+eyxDjmHk4OSeQHM7ReB3I/rVoi1
 xPKZxcKIKiWBsGQz23PFQZ5Ces3HQD1pUCvZBU4S2zwXGJ7naXORhgeUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8h8wODmNrdTqsfbXQ5PfTsnBLTFzbR/jmBUcdYMUs1w=; b=bdE5svAa
 5YFyKQgEx1kJzd8u1eVecl5Ty7lxh+FsfSs0dUxijagk4cvKtOrdcq1XR+t3AHdW
 8htUNU4/mkcK778LMPN1ZMHM9HY5DOBH1M6l6/05w2KlqYS8bSXOBra6pbl9frsB
 ZoRfdI8OGsEHCOgtkTmbpiSy1AK6u5zVTGWf/9yRbtzVoxfAB6129jgIoLacUfpz
 U6ipROa0dCyEYJzvY/beTd+/dafSH//mfXXHxOVrdu7v3WRUSaDVIUmVcY10I5ux
 jFMb/AGFK9H5NWTnEKhoyEHicEVBrfjSwtEBp43Sg87UNN8Bm8fGy0LvNjWGYbf7
 STU88y+MlFnvmw==
X-ME-Sender: <xms:Gbt2YbrsoEEKFtHh5LuKr_M8mKfq2M9v7KqxUMXfdsiWwJ0YEpUfyg>
 <xme:Gbt2YVoDolX3-g08kWr8fYbbJ7esWVf1CJ9uOBfSa4-tE8PPJtLwqFNXSjs2fuIWE
 -h2JMEDLsD_z8ED8VA>
X-ME-Received: <xmr:Gbt2YYOhVh9-AipCrwZ5IG7oqY7knlZI25ZE9WHhrNqBu8-k9kz-rdFLscx8wMFkvdM0AcoMAxlvpf_GZjQzHEml4rVuMpv9nPer6mOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Gbt2Ye7ipfAbKWskNjnFcKb7bmPsMmX6xJfB8vUVFmBd6678lx52DQ>
 <xmx:Gbt2Ya43L1T7KKtorT6K--Dx7AZA-OCtmtjdrodB27KiMuf9UTNGTg>
 <xmx:Gbt2YWilb_3bXhc5gE268nYa7bqnOG3E-6BdxlwKaJMBVAR_ZrMfFg>
 <xmx:Gbt2YTGb0ZZVoscpyCRDhykMxkupCZoD8wz_3aui8zAKJA9y_VHmXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:36 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 9/9] drm/vc4: hdmi: Introduce a scdc_enabled flag
Date: Mon, 25 Oct 2021 16:11:13 +0200
Message-Id: <20211025141113.702757-10-maxime@cerno.tech>
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

We currently rely on two functions, vc4_hdmi_supports_scrambling() and
vc4_hdmi_mode_needs_scrambling() to determine if we should enable and
disable the scrambler for any given mode.

Since we might need to disable the controller at boot, we also always
run vc4_hdmi_disable_scrambling() and thus call those functions without
a mode yet, which in turns need to make some special casing in order for
it to work.

Instead of duplicating the check for whether or not we need to take care
of the scrambler in both vc4_hdmi_enable_scrambling() and
vc4_hdmi_disable_scrambling(), we can do that check only when we enable
it and store whether or not it's been enabled in our private structure.

We also need to initialize that flag at true to make sure we disable the
scrambler at boot since we can't really know its state yet.

This allows to simplify a bit that part of the driver, and removes one
user of our copy of the CRTC adjusted mode outside of KMS (since
vc4_hdmi_disable_scrambling() might be called from the hotplug interrupt
handler).

It also removes our last user of the legacy encoder->crtc pointer.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 22 ++++++++++++----------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  6 ++++++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8fb8e7e57f9c..7b0cb08e6563 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -615,6 +615,8 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 		   VC5_HDMI_SCRAMBLER_CTL_ENABLE);
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 
+	vc4_hdmi->scdc_enabled = true;
+
 	queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
 			   msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
 }
@@ -622,22 +624,14 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	struct drm_crtc *crtc = encoder->crtc;
 	unsigned long flags;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 
-	/*
-	 * At boot, encoder->crtc will be NULL. Since we don't know the
-	 * state of the scrambler and in order to avoid any
-	 * inconsistency, let's disable it all the time.
-	 */
-	if (crtc && !vc4_hdmi_supports_scrambling(encoder, mode))
+	if (!vc4_hdmi->scdc_enabled)
 		return;
 
-	if (crtc && !vc4_hdmi_mode_needs_scrambling(mode))
-		return;
+	vc4_hdmi->scdc_enabled = false;
 
 	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
 		cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
@@ -2511,6 +2505,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi->pdev = pdev;
 	vc4_hdmi->variant = variant;
 
+	/*
+	 * Since we don't know the state of the controller and its
+	 * display (if any), let's assume it's always enabled.
+	 * vc4_hdmi_disable_scrambling() will thus run at boot, make
+	 * sure it's disabled, and avoid any inconsistency.
+	 */
+	vc4_hdmi->scdc_enabled = true;
+
 	ret = variant->init_resources(vc4_hdmi);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 5d3e97703e8d..36c0b082a43b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -209,6 +209,12 @@ struct vc4_hdmi {
 	 * Protected by @mutex.
 	 */
 	bool output_enabled;
+
+	/**
+	 * @scdc_enabled: Is the HDMI controller currently running with
+	 * the scrambler on? Protected by @mutex.
+	 */
+	bool scdc_enabled;
 };
 
 static inline struct vc4_hdmi *
-- 
2.31.1

