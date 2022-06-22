Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04842554D58
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0591133A2;
	Wed, 22 Jun 2022 14:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CE21133A1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:00 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E256A32009B9;
 Wed, 22 Jun 2022 10:34:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908498; x=1655994898; bh=f/
 +jdXtZfqZAbj7YVJjemah/vwRNbw9TyYh7IM+6eUM=; b=aNxYYQy0BMpcmjbgl2
 uYcmbBjn24khqCoYveYeudWT4YVAcwR47EJxX4WRdzoI6YuFik1EaD+wQe+jLM/F
 zsx82hLMxeLTFrdURat7P0ElWU/I4O/ASB+Aw+D9UAJFs7chBqC882k/vsd4LGoj
 3Ve1FnSHlADB9syYJLvPKlg+j2amV5MoCqPD+CUu2n5/NaegA2of2aTRW76gSHhN
 buj7Oo6Q5y3a9jBSkXOfClWW8f81o2bLMq5V2fIh5evWAd63wDqCfErBUTw9V+AK
 BlH51owia/3BRVaXAIPXpILpBWLlD9iI0HgBq+NkfSpSoqkxCjROYjHj01M4ursD
 QZHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908498; x=1655994898; bh=f/+jdXtZfqZAb
 j7YVJjemah/vwRNbw9TyYh7IM+6eUM=; b=eYEAElGzf0iIpz6FGIXEqxcCr+5G6
 0y16zYhZW6goglEN7SvESync/MCmMS8xn11XU1bsLUZeBvxFj1Y166Gx8senjipm
 eZXJ9XxvdQ3ECXszdrYABWQLCce4ZD+vsJsttmQVjAOoTnwXY/FrUgWX4y8EkzD8
 PyQTJEHaPFrbvvB6aEtg+uPObVtKl4X5rpKbq+HSpMaQ+tWdvV2CfwNWG/j++VtG
 6ahYHNYzvnQdJw+OibviKyOk7/enINWDnHmP9jFecSNcmKFqFRgxZbtSS8Q+jZ5c
 XBdS4Zab4i4FXz6r/o9F2LlliF64riM1CGGN2zMgoVPqQ+a4duyrwgsDA==
X-ME-Sender: <xms:kiizYhgOTJkmegDoYQLDAOXPxUVUFZmfz7Bi8ii4XDfh7qyTE5YCLQ>
 <xme:kiizYmCsIbC_2Acw5oig89ruIo5nST57mCe9G9SN9ugO8-X2Ip8xF8KAFWstplmEu
 FpX7rPQIb47IaGQRUg>
X-ME-Received: <xmr:kiizYhH9FF-5NQQXL4sVfkpUbRd4RKomUhs2cbQvpPSfTCc7SS74ukRbRzIRRt9QSpL8KxzLQpwsm2cutrLTZ_CTXeFJ4QyV2LQzd3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kiizYmRy3KVIpyiBm044kKy-WbUnF500ii7qjkoPnMcFB2Y_kHH47Q>
 <xmx:kiizYuxQFhaHrPE_dekT0fmm-OcAZkWfeRX4b-Q5pUZy4Kvb16i4PA>
 <xmx:kiizYs4Yqzacv-ijh42-RMaNd5Df4G769rOoeDJjPRcVustBVO-2Qg>
 <xmx:kiizYouvXCzPZ0NRXJM0ip4ycyIe4JYj-_5j9Bv45EpbBF8AXTo9fw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 52/68] drm/vc4: txp: Protect device resources
Date: Wed, 22 Jun 2022 16:31:53 +0200
Message-Id: <20220622143209.600298-53-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our current code now mixes some resources whose lifetime are tied to the
device (clocks, IO mappings, etc.) and some that are tied to the DRM device
(encoder, bridge).

The device one will be freed at unbind time, but the DRM one will only be
freed when the last user of the DRM device closes its file handle.

So we end up with a time window during which we can call the encoder hooks,
but we don't have access to the underlying resources and device.

Let's protect all those sections with drm_dev_enter() and drm_dev_exit() so
that we bail out if we are during that window.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 0976d29adc7f..0748e3f6d40f 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -274,6 +275,7 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 					struct drm_atomic_state *state)
 {
+	struct drm_device *drm = conn->dev;
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
@@ -281,6 +283,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
 	u32 ctrl;
+	int idx;
 	int i;
 
 	if (WARN_ON(!conn_state->writeback_job))
@@ -310,6 +313,9 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		 */
 		ctrl |= TXP_ALPHA_INVERT;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	gem = drm_fb_cma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
@@ -320,6 +326,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 
 	drm_writeback_queue_job(&txp->connector, conn_state);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_connector_helper_funcs vc4_txp_connector_helper_funcs = {
@@ -346,7 +354,12 @@ static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 
 static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 {
+	struct drm_device *drm = encoder->dev;
 	struct vc4_txp *txp = encoder_to_vc4_txp(encoder);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
 
 	if (TXP_READ(TXP_DST_CTRL) & TXP_BUSY) {
 		unsigned long timeout = jiffies + msecs_to_jiffies(1000);
@@ -361,6 +374,8 @@ static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 	}
 
 	TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
@@ -444,6 +459,16 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	struct vc4_txp *txp = data;
 	struct vc4_crtc *vc4_crtc = &txp->base;
 
+	/*
+	 * We don't need to protect the register access using
+	 * drm_dev_enter() there because the interrupt handler lifetime
+	 * is tied to the device itself, and not to the DRM device.
+	 *
+	 * So when the device will be gone, one of the first thing we
+	 * will be doing will be to unregister the interrupt handler,
+	 * and then unregister the DRM device. drm_dev_enter() would
+	 * thus always succeed if we are here.
+	 */
 	TXP_WRITE(TXP_DST_CTRL, TXP_READ(TXP_DST_CTRL) & ~TXP_EI);
 	vc4_crtc_handle_vblank(vc4_crtc);
 	drm_writeback_signal_completion(&txp->connector, 0);
-- 
2.36.1

