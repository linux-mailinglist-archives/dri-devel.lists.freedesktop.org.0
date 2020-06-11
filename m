Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A51F82AC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167886E41A;
	Sat, 13 Jun 2020 10:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC86E910
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:38:44 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D62A35801DD;
 Thu, 11 Jun 2020 09:38:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Jun 2020 09:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gICVuJ6JxKf6T
 QPbCxr0GHMfBnZdU1/nxb1POOuoQgE=; b=X/AOES0MbnLou+TuWpjBo8gabvUj/
 bLtiuyEAus5zAF0VuVlLXe82tQqP0h6PjLSV7k6zh8g0b9XCih7t4Oqv4UnM6OOJ
 OCdmOVBtTbie9u/E8ssDcBxS+EsdAu4ynYLF/szb9KPwmexvQNv63/ocB0DyBGyW
 3oC+qy3uyypgPJjZ48PJfuL0GB5AudiyT4SW6Jc3sYqLa3Zr5se+QTKpi1DtrVvk
 WnhnUxdydhRKvivg6ax1bobXLaGQr6MQEuLORl9C13jcIFL3RQo0YIjajw9CTLwa
 lIhuYW9X1oAxv3b2ccYA18M7Gjv7SkgdB010W+Y9CpHJzwGV+SFNKECxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gICVuJ6JxKf6TQPbCxr0GHMfBnZdU1/nxb1POOuoQgE=; b=IZQwgbYE
 lJzAL5F1kbyC3drkqxzv1e47AkQIqCnhFjwxBLWmNIK11+WO6ZFhUBhD58aQPDQM
 VygDHAr1NP6Yqr1Lft3k/cfwtAcaZ4PtPKQ9pwwXkEWxji4B0JWMwFpYI3LOEkGB
 Y6dQi0u7QfQFDNp4gFMKvOLTR+v2+IkCII7SyrQ21HHwrXE07vO7HC1dznyoURrG
 fJtG/J5JeCiwKtXA/ySHOL4Z1FsWFyDrjWocWzzPPeF34eNsOFPuEfYarur2Va8b
 /knECGuS5ZeclsGATV5NXksnLKeoFBQbrEXpZS9QPU1uu+NFfbDdMAP7TX1Lh0dG
 V3rzJjbenTStWA==
X-ME-Sender: <xms:4zPiXmskKEeP4nHHtYF6DSoyKMhOdHSoZVBgQjmajmtptwhpV4CCOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4zPiXre_aQFikMkOfnu5xnsPDUXqecjcxYVCW-TE6fXE7g--bwNhtg>
 <xmx:4zPiXhxjWQKZOzfmNvnPrES6v-F2QU79gNfDWwAi20E8hVGUWguOjA>
 <xmx:4zPiXhPHzTn9qjsw8aQ_JAEEkHlQUKzOMxj6-i5VmKHOfI57Ma2iuA>
 <xmx:4zPiXrOlrqDmv2qmsq-EFYZIcT8wWQOd6pQLcJRvPoK5EfP5QsNgMA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A02A5328023E;
 Thu, 11 Jun 2020 09:37:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 7/9] drm/vc4: crtc: Move the txp_armed function to the TXP
Date: Thu, 11 Jun 2020 15:36:52 +0200
Message-Id: <12b383e7b8462e281b00c0a21b2b50f13691bead.1591882579.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TXP driver is the only place where we need to set the txp_armed flag,
so let's move the function in the TXP driver.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c |  7 -------
 drivers/gpu/drm/vc4/vc4_drv.h  |  1 -
 drivers/gpu/drm/vc4/vc4_txp.c  |  9 ++++++++-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index e30a5036d2e6..82ebdf8da108 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -390,13 +390,6 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 }
 
-void vc4_crtc_txp_armed(struct drm_crtc_state *state)
-{
-	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
-
-	vc4_state->txp_armed = true;
-}
-
 static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_crtc_state *old_state)
 {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1c49c27a564f..fa19160c801f 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -808,7 +808,6 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 			    struct drm_crtc_state *state);
 void vc4_crtc_reset(struct drm_crtc *crtc);
 void vc4_crtc_handle_vblank(struct vc4_crtc *crtc);
-void vc4_crtc_txp_armed(struct drm_crtc_state *state);
 void vc4_crtc_get_margins(struct drm_crtc_state *state,
 			  unsigned int *right, unsigned int *left,
 			  unsigned int *top, unsigned int *bottom);
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index bf720206727f..d9a8ab87ad25 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -222,6 +222,13 @@ static const u32 txp_fmts[] = {
 	TXP_FORMAT_BGRA8888,
 };
 
+static void vc4_txp_armed(struct drm_crtc_state *state)
+{
+	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(state);
+
+	vc4_state->txp_armed = true;
+}
+
 static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 					  struct drm_atomic_state *state)
 {
@@ -256,7 +263,7 @@ static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
 	if (fb->pitches[0] & GENMASK(3, 0))
 		return -EINVAL;
 
-	vc4_crtc_txp_armed(crtc_state);
+	vc4_txp_armed(crtc_state);
 
 	return 0;
 }
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
