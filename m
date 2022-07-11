Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307C570935
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0D19034C;
	Mon, 11 Jul 2022 17:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F6490322
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E8F15C00F4;
 Mon, 11 Jul 2022 13:41:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561273; x=1657647673; bh=vu
 iyxcdI5nxQqQVLjP3bcCf8apO78i1+UvmhPCvMVtg=; b=EC9hLzoBpZlbToh5jw
 d/thQzUDf/PWwvn35DDlNERAjaQcEK7SNZgQt2ToI8/Z+2YFI6foOwt3Md+uSV6n
 5MvpzpYbVICEawVjla2RsfbB69jRzs6T22KCJh9W0Rmva2dzRvt4zcglQhb1mjHU
 DzaY2UNisTM0U6/CW2DbapnvLotP0EVozpJ2mjc+GLM7sYsuVDzO9nDup+u0twxC
 yruYifOVC2LFMANpy/eCcU2OH/upPD2FQJjp3O4SKoNnYlr98t9D0CP9qgxbalw5
 lenzWgiIYYEKgDntaDd8SECQ3PI2ThaHuTJUWCmQxxbt6cOjrGpiRv8WXHg916Lc
 XkEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561273; x=1657647673; bh=vuiyxcdI5nxQq
 QVLjP3bcCf8apO78i1+UvmhPCvMVtg=; b=vV6+ib+cM42CUKWwkiA5cUCr6QIPW
 4ZvCy8NM8oaP25ojs4domFII4Vv6WV4vYUkReLD80F9bMVPIVYate0AeE64iDP4A
 olS1l4UpDTNxMzI8ERMEuerRvZ1ub5D5Wu4PsT4Uq46n+kcFHkKYMihttAFvu37G
 esQWFskH4F1knob1+EQ1sBAVDOmObMu76t7QOgVhvktVSC4vpEZoGOv74S9A9vXo
 n6LnChT8M+oL5iWdAQLMR9ZPZe7OEpjhrNr9oCaSBAveXxt8OC2EwoY7mQ8Q7Mt0
 lpbdBo3IyUfwXppxWwLpqD/dlXHEbuq0EvHBliXWuf3RvB7bIbMdUk1lg==
X-ME-Sender: <xms:uWDMYmAfGIsUKoemO400k8VzaSFndO-e1vjod0f32Zj6mXA9fu8G6w>
 <xme:uWDMYgi461luKdVOQKMd52dFIP1GLXxpv8bdvzxr0-DoSrEECw1Pks7CC5zm9C6-7
 mBKxuaRARapBuHKgwM>
X-ME-Received: <xmr:uWDMYpnjdJ9A5UByd1WLrZ-NjYLshcGrezNGunLNgr8Wrokk69aEytEmak0XDI5KYsk5DL_46CbiODb4OgbR23ZNBT5o0Zzm3sQCgcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uWDMYkzKL60-brba3g7f4IJm-YVebO92fPH_miAhSkpdAdDyNTyhqA>
 <xmx:uWDMYrQubU_1skYFtwnPock2nrt5Pq8IFqAu5QH6Sy_HmOc61sCTZg>
 <xmx:uWDMYvY2SZCKWnGR_vh_u18DUKKu-fTLLEAzeGBX_peRThxuCIdgvg>
 <xmx:uWDMYpNPxpeRHwtlzz9Xe8HIdj2P4mtGxK1bkBSLVN9MDxOf14INBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 53/69] drm/vc4: txp: Protect device resources
Date: Mon, 11 Jul 2022 19:39:23 +0200
Message-Id: <20220711173939.1132294-54-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 7e5212bcf8e6..f6f61cf5f3f7 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -275,6 +276,7 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 					struct drm_atomic_state *state)
 {
+	struct drm_device *drm = conn->dev;
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
@@ -282,6 +284,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
 	u32 ctrl;
+	int idx;
 	int i;
 
 	if (WARN_ON(!conn_state->writeback_job))
@@ -311,6 +314,9 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		 */
 		ctrl |= TXP_ALPHA_INVERT;
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	gem = drm_fb_cma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
@@ -321,6 +327,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 
 	drm_writeback_queue_job(&txp->connector, conn_state);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_connector_helper_funcs vc4_txp_connector_helper_funcs = {
@@ -347,7 +355,12 @@ static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 
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
@@ -362,6 +375,8 @@ static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 	}
 
 	TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
@@ -445,6 +460,16 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
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

