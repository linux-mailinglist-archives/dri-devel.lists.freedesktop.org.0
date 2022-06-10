Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960A54625C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086A512B0EE;
	Fri, 10 Jun 2022 09:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49111B4A4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CC965C004D;
 Fri, 10 Jun 2022 05:30:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853454; x=1654939854; bh=Ju
 CaFDhe915usM4FF4qhPEZ1cu+TDtCAqKhSGycW0ak=; b=IxhuIoXLc/qktILxct
 Fj+qysqYZCBuDC6GEpKp8MoC6RWjrGKqGNzkMyAWCRBuOgdoMpBah/gbpLZaREES
 brrcSKfG5UtDn+u+0S4TbWiUE5d+VM/Qd5SiHMeAHE1wKGDcp0HKuO3bU7Gzxm4e
 QymMEPw66Ig77YGMNxNdTtKTOBn8+OB1DHQaRqGF7kbkGZrektMe3hGvGJDoD9+i
 c3qucAB2ZqtMN+69rwcz1ovSbF7qePngChzJgBhkNxjLFB6Bky78m70bNarSloQ2
 M8KhWOchaRvVjRO1F9bWtNl8pt5RTi3dDATpMMnyS1hDzaGmkx/xk1ImkSZAIZaN
 bvyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853454; x=1654939854; bh=JuCaFDhe915us
 M4FF4qhPEZ1cu+TDtCAqKhSGycW0ak=; b=EBrW4Kxbu2z+8aXwoKzYspr0Wv61n
 u2FZv/1HuXmxrOrmQW/wdK7PmELc8ATR4CS2CTNaj7aWmmCIuMjWVkq0qDHR0q0z
 OJ3Wt+b0pA6pKJ4g3t+Nn7XyR6LB2xVvanFlcgZ/oc8k2ujgFZOY2ZOyc+epUR6O
 S5aTPvDbNKQe8CNceOpvaTmNbPaqmSfXMX2CEJ520zmMHnDgSSX+1aVRg5W6YO38
 Esm11jKzwS6/3y8tS30vFfhxJKWMYo8Utrqw+hTAc+sqvRg9Cr8vLGJlkAmFrmTu
 PIW6FLQSyIvAOvrhcXTRx+RSBoyPaASXWQ/Yosye2gXdwc6BrUcZIK+8w==
X-ME-Sender: <xms:Tg-jYpPpc4oLRQBktvU5hRxeUHtYxwGw9FcRH2l9p6Q8-H4yhOymRQ>
 <xme:Tg-jYr-hriyAdnuSo59JCm5W5JjUyclRZaL1vJTjwJW-r0qtuC0GkIcLhN6FKUT1J
 GIEIt3vR8dqsW6neng>
X-ME-Received: <xmr:Tg-jYoTQIKHBlxOwy0j_pf2td1oJ6J6663uYDD_VTmHyeog1v6R4FQCDmN2Wdp9Zrki4MLaMQFB5FKczYgNESXolYs_txL73WI0qV84>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Tg-jYlvM4gwjnkT9pgH0yWnI1aAtsjPlEdUUX8cTu__2ulFxKavEBg>
 <xmx:Tg-jYheJUsqXHYi0GBILKymhsZPWK_2p1mLN6LBaWl2UddHLqLMVmw>
 <xmx:Tg-jYh2laSAXSbECejaxKhaytxvCdOSdjviYSQoS0XKzZ-aMwGCfPw>
 <xmx:Tg-jYo6YldUkvudIiq6dF-ScMzo6H_eVR4KbwKcS-nhKrKWG30ZMlw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 49/64] drm/vc4: txp: Protect device resources
Date: Fri, 10 Jun 2022 11:29:09 +0200
Message-Id: <20220610092924.754942-50-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
index 3f214b702c47..fee00b7003ab 100644
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
@@ -345,7 +353,12 @@ static const struct drm_connector_funcs vc4_txp_connector_funcs = {
 
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
@@ -360,6 +373,8 @@ static void vc4_txp_encoder_disable(struct drm_encoder *encoder)
 	}
 
 	TXP_WRITE(TXP_DST_CTRL, TXP_POWERDOWN);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_encoder_helper_funcs vc4_txp_encoder_helper_funcs = {
@@ -443,6 +458,16 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
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

