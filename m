Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EBA56B6C1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABCE112BD9;
	Fri,  8 Jul 2022 09:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47E6112BD9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:59:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7E70E32009DB;
 Fri,  8 Jul 2022 05:59:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 05:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274387; x=1657360787; bh=vu
 iyxcdI5nxQqQVLjP3bcCf8apO78i1+UvmhPCvMVtg=; b=VzqZOQ+giZtH+Z3naj
 woPVtkdeKkjx5OLcTYHmjdMu+/IB1rFcdcy2mZIKTvauEumS9oSfHce2jBJW22R2
 IG468rGjDI+WTMhsbVP48KZuyWPtyiehOGa0jkD+PiLXU+TV0fVTIxSwX+URYFdJ
 a1mAK6tzwwP9qafzgwVyUYZrhcgNJS8JlhNYdw57Xk2OAoffldJ4kKsW2Z13Atd8
 OOicFG9xjeJqMFouzR8GrK4Rx5NFGUnXKgoOusWWYupk+iDMb61UobB3BM6LKI24
 XBsy1O4NWmVmkaK8FH5ZEZM/kdeLL9Gj1GuJBQHDxnLGbtHpd5zGMEC9tHqzX78J
 PrVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274387; x=1657360787; bh=vuiyxcdI5nxQq
 QVLjP3bcCf8apO78i1+UvmhPCvMVtg=; b=uPspF3z7fjeme+KPeXBIDbkWFQans
 Li6TvEssir3bf5f7BNVeW3BNXlcI4eLrrSLV5p4Gu1x2TVOFxtHxod7cBC/Db6QI
 B6JNeFMSFvAE94UOwTQvAjJa8w+byc+/EooiJThzd37ugUf1cUVTRGLPUu88n+zy
 XyGyGVM2VU2+r6yFvnORuPCuBaqpQ36Bhto688YTe5HryCtw3BaIBSEnDEPRRbUE
 6hb3krG3Fb6CYOhT34TxW2xYcfse30OlZnRdMOJHDcquVc3TDt6hd0qb1D2Vs4e8
 aWTaoD2S4zl+cbTk1b8wZ06IU8Lnv0FkgGXJwY+D9BqlhqUzhMdAy5KEw==
X-ME-Sender: <xms:EgDIYoW5sCpqLVgWhmRC97-C5y6nuJS-hbFkP55Ps3umqf4sy57HGg>
 <xme:EgDIYsmXfpjgGtjLx7px9Lozj_tLo3QpqqAlIOm03Q13YHCvtmnv5rAfXzpTiglxS
 YRmG83iQdUtXqESrUg>
X-ME-Received: <xmr:EgDIYsaO8dzMM_WvJg68pNB8y9rN0vGto0WR_a_-HoGKt-oLazq1PbQMA6M0O_Jd8ZEN6z2lBtooLSe8XnDN0v3Or8LqRhgypRfzUlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EgDIYnUai7C2jJyR17giutra1qDQTGWSiW-9NzcMki6qiYrJA014Ow>
 <xmx:EgDIYikmHzseDmc5tj2AGJZYkpuoJkADQcchndEPxR1dg3jYnOUAQA>
 <xmx:EgDIYsexPmX3B5QdXRJFUpinEkO2cccdPLEOqXct0MJP-4JF_a4bXg>
 <xmx:EwDIYjCjj_E9v1V-Ecs6mTM3OC87ZwWmsUDpRWboUAva15nJX5YeOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 53/69] drm/vc4: txp: Protect device resources
Date: Fri,  8 Jul 2022 11:56:51 +0200
Message-Id: <20220708095707.257937-54-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

