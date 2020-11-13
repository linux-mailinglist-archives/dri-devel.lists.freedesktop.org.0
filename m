Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565012B3AF1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0B89CF8;
	Mon, 16 Nov 2020 01:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDA16E53C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 15:32:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 250E558033E;
 Fri, 13 Nov 2020 10:32:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=15DRL6eRbXmJF
 EjptRNW89hdTERA9eTxlwA8nGMkYeQ=; b=NbjkpjXsN/e7nF+gXvgVukj03NU8q
 Wv1e03iiTNXpUScR/kHPr7oXiNkf+TZh0RBlTjOKlhOhNBUDBgj5j5tH9BAGf/SV
 jki8Z4FnrdBGtmrUuLUeIrKg6vMAgZXe+6c6VZ+b0Hro+3lFbtTYzD8SdDtbM/xg
 r1u4ag7RjWh+hChByetr+1I9Y9NXn3nkbWMX9T4Ah8AOK1n1oyhwRKcfnVPTFzbh
 wSS/sIXbHArNWoXagXcynI+xfhb9jLA+16xu61YoJWIo0lcZgRqiTXGLERUFGjYt
 6qcfjgsa4PJXtr1sEGC4Dfl9If8H9z2hKJUk2u1lQObhEJfzOjJWzVygw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=15DRL6eRbXmJFEjptRNW89hdTERA9eTxlwA8nGMkYeQ=; b=AwDyDe0u
 qS/TEJa+0nuBXJwQ3G8C6kX5uI7GL6vox0/RZmIdKnHKiq6TK+SGzum5B4oFAoT4
 FFjYCzitx2jzHEWj8NxjqDPk8b9FzDs0Hkk6eBphnIYp9bjxnhYNhiHx7TKy5O+K
 4dovRF6AU9zjibnK/Ax4ul4uZqdin8JDuN/K+kz7o/IozL0t/UOJoa8i6m/8Y3W2
 9OSVDW5hlaGzLO6Xqy7MAhw0ZncLRXr5ar8MeF3K7dvnTZ2GRzCBReDPLKmqw+jS
 JIZcV+QAc7/ppSmeqpQZfqcPG/4gfx0VaRfm1XTNDlq3GFzIZofn0FVfCsPcgm+m
 Y357snm2iLONag==
X-ME-Sender: <xms:CaeuX9LmIOkfc2Z5JRuA1xO1CGRQhTKPt4IUvVOm7MTCpntEzWIMlg>
 <xme:CaeuX5IP8f-_OtzgYPSahTBOcm9q-uAmQBozlrLF-NTuMjqtS8c0mSYwoYb5Fodzk
 69169sJ1Qyh1YsjpYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CaeuX1slmXtNB3GEKZCP2vnk-KwGGISmRGSImJh52PfFnHM32yf9VA>
 <xmx:CaeuX-YVjNblTjYdxR0LtZ4jcyczTo1QwilI9NFa7XtoSvaTvVZW7Q>
 <xmx:CaeuX0a7nRUOy9KB--Ja2HoHXT5y1J7g4IC9RY9L-aZ8zsPxZ-a1WA>
 <xmx:CqeuX6xr2zrsteEntNsSIY3iyeXp9UvyvTVW9UIcCzpgHlCZP8iPpA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A1E53064AB0;
 Fri, 13 Nov 2020 10:32:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 7/8] drm/vc4: kms: Remove async modeset semaphore
Date: Fri, 13 Nov 2020 16:29:55 +0100
Message-Id: <20201113152956.139663-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113152956.139663-1-maxime@cerno.tech>
References: <20201113152956.139663-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have proper ordering guaranteed by the previous patch, the
semaphore is redundant and can be removed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 13 -------------
 drivers/gpu/drm/vc4/vc4_drv.h  |  2 --
 drivers/gpu/drm/vc4/vc4_kms.c  | 20 +-------------------
 3 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 29b77f4b4e56..65d43e2e1d51 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -699,7 +699,6 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 		container_of(cb, struct vc4_async_flip_state, cb);
 	struct drm_crtc *crtc = flip_state->crtc;
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = crtc->primary;
 
 	vc4_plane_async_set_fb(plane, flip_state->fb);
@@ -731,8 +730,6 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 	}
 
 	kfree(flip_state);
-
-	up(&vc4->async_modeset);
 }
 
 /* Implements async (non-vblank-synced) page flips.
@@ -747,7 +744,6 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 			       uint32_t flags)
 {
 	struct drm_device *dev = crtc->dev;
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_plane *plane = crtc->primary;
 	int ret = 0;
 	struct vc4_async_flip_state *flip_state;
@@ -776,15 +772,6 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	flip_state->crtc = crtc;
 	flip_state->event = event;
 
-	/* Make sure all other async modesetes have landed. */
-	ret = down_interruptible(&vc4->async_modeset);
-	if (ret) {
-		drm_framebuffer_put(fb);
-		vc4_bo_dec_usecnt(bo);
-		kfree(flip_state);
-		return ret;
-	}
-
 	/* Save the current FB before it's replaced by the new one in
 	 * drm_atomic_set_fb_for_plane(). We'll need the old FB in
 	 * vc4_async_page_flip_complete() to decrement the BO usecnt and keep
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 9eefd76cb09e..60062afba7b6 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -215,8 +215,6 @@ struct vc4_dev {
 		struct work_struct reset_work;
 	} hangcheck;
 
-	struct semaphore async_modeset;
-
 	struct drm_modeset_lock ctm_state_lock;
 	struct drm_private_obj ctm_manager;
 	struct drm_private_obj hvs_channels;
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 849bc6b4cea4..79ab7b8a5e0e 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -414,8 +414,6 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
 		clk_set_min_rate(hvs->core_clk, 0);
 
 	drm_atomic_state_put(state);
-
-	up(&vc4->async_modeset);
 }
 
 static void commit_work(struct work_struct *work)
@@ -473,14 +471,9 @@ static int vc4_atomic_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 
 	if (state->async_update) {
-		ret = down_interruptible(&vc4->async_modeset);
-		if (ret)
-			return ret;
-
 		ret = drm_atomic_helper_prepare_planes(dev, state);
 		if (ret) {
 			up(&vc4->async_modeset);
@@ -491,8 +484,6 @@ static int vc4_atomic_commit(struct drm_device *dev,
 
 		drm_atomic_helper_cleanup_planes(dev, state);
 
-		up(&vc4->async_modeset);
-
 		return 0;
 	}
 
@@ -508,21 +499,14 @@ static int vc4_atomic_commit(struct drm_device *dev,
 
 	INIT_WORK(&state->commit_work, commit_work);
 
-	ret = down_interruptible(&vc4->async_modeset);
-	if (ret)
-		return ret;
-
 	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret) {
-		up(&vc4->async_modeset);
+	if (ret)
 		return ret;
-	}
 
 	if (!nonblock) {
 		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
 		if (ret) {
 			drm_atomic_helper_cleanup_planes(dev, state);
-			up(&vc4->async_modeset);
 			return ret;
 		}
 	}
@@ -1006,8 +990,6 @@ int vc4_kms_load(struct drm_device *dev)
 		vc4->load_tracker_enabled = true;
 	}
 
-	sema_init(&vc4->async_modeset, 1);
-
 	/* Set support for vblank irq fast disable, before drm_vblank_init() */
 	dev->vblank_disable_immediate = true;
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
