Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5B560037
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E189E14A67C;
	Wed, 29 Jun 2022 12:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651A614A650
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3E99F3200971;
 Wed, 29 Jun 2022 08:37:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jun 2022 08:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506277; x=1656592677; bh=Vg
 0cWJtqqElTCl6tVP4skGdbRIDcuLGMMvNJof+9i/I=; b=JqPZPVhPmcisWkKSCE
 w74Tv3A6MtPFh1vJW4ofrTccyIWQAryZfrXIHSq2izrMKIOvsEPDpmlTPf/rsqzo
 KrE7QuvG6xKOUu07dtZFvvVa5ZxeycTz5NRTso7nro3iWmZMTN1w9Re8UBUuePz+
 XR/8qiiSLL/MjVXRFyK02BF4X33SJQByqv8fHBa1VInBLjrbm5KKUWXGsqZKJvfB
 Nm/rCuLk2B6PzxwRAxniKACXYTYpXDFLzTJ+4UF1WxraWh956pSfQREiAdC46nBu
 6gWrLexTreko6Lmzo1r4DmQ/jQSaz/yL9/nF5sByvo6zn8ahUq52j70DTt8w/PuS
 mrsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506277; x=1656592677; bh=Vg0cWJtqqElTC
 l6tVP4skGdbRIDcuLGMMvNJof+9i/I=; b=vUOg00wZsV73km/Czl/L9jJPluYX7
 X7frjRVvzgixI7BVF9gDRz0CgwQIZwlfSEC4psMDz4Yd/g5vQIsZmeNW6zatjtyH
 0F56snPrvdtP+ZpfUjxRmX7ObRKC1UtS14n2zQp5/A7UO3dowv2tjQmuJT9HZXEM
 lA6889yuIT34Gou6nLLYW1lR23fRXdxsI2gJPohu9DX7W8i+qXG74+sni15eDBX+
 ytf9uzIUzSO45OtDEjsgUd7fiq4p6NaaDAj2gtipDG/VULVY9y8iK7ZCeZ68DRmK
 +btEb3BKGZtGJLfDyUznjfOc632unzxKAxCIhHDRTHcfXb04x70eEaOFw==
X-ME-Sender: <xms:pUe8YpXX3tUT_vtx6BGmVrJ2251NGCa1CHIRVoZAd8r75g2GuM35xA>
 <xme:pUe8YpnE44BfHmorRgoWDA49b5CCO7ZZACXO2wZBKvM7bPX5idvZCQuh-aSaUSHDa
 an93MysCQEo-xhdfEI>
X-ME-Received: <xmr:pUe8YlaDCGaFrC9B2ly517W4EMGo9Vomcr5ysXIzRFF3LrKgtydWpIJxP094cjFeXBZoozzsZszWWwFeImqWcrHrEEltCHA5TZHxr9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pUe8YsWbygNF5bduBJh0-j5U-amaYF28xgrgKssGv85Dt53ENEpZgA>
 <xmx:pUe8YjkVF1GWkRSTT4_ryjEm15ZMAR1SlGGlzO-cJXZL_K03Colk-w>
 <xmx:pUe8YpfbV8MCH9U06YfhOOw_ULGb6Bbs1eVeoUAnFH__7YgwQQ3NAg>
 <xmx:pUe8YsByKdWbl-e_YvEDVX_Ol4REGlhhqEV9PPnY1WiMvgMtOO5BIw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 55/71] drm/vc4: txp: Protect device resources
Date: Wed, 29 Jun 2022 14:34:54 +0200
Message-Id: <20220629123510.1915022-56-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

