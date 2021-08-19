Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED53F16AB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04186E7D0;
	Thu, 19 Aug 2021 09:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C826E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD1C7580B75;
 Thu, 19 Aug 2021 05:51:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 19 Aug 2021 05:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=0TrV8pyr34Uwz
 pgYoRLHZ7xkUTtfXFleEvzHDnnJ4vs=; b=zruJfObhEAleSvBmnXkQfq7z3aJgq
 0XLKcQc6UKMNBd7YIAs46v6lF3T+5+0KgoiN/QCeUC9vnR2PxUs3lnFt48quq/m2
 4a8CoQtbIRI1RkqDKCR6nBsPeKvnRA1jOTzAaVon8YJYZ3BCf+Eur20wX980zMLG
 /hPBuq63KdQdQwMyaGBg8dzcyc6ITPnfScAJUU6VZGgZ/Zr6kIALCHDVwcQdSdjT
 /bCI4ER1b0Kd1ZBfZPAifeKE86YCd57oqKvnh2t+PAFPFLW35rNZfX5OSceNXL6J
 N6MYjQLzZMM1XcXnjEg7nKd9BaLkdjytAOuK50vYD5lm+P3ytPmF1+isQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=0TrV8pyr34UwzpgYoRLHZ7xkUTtfXFleEvzHDnnJ4vs=; b=KamXiRsJ
 CMWbjFL2ZvXFvYvd801VanUpsSbLe7ze/VwTd84trJX/gRUoBGfraGoosOzhNyOM
 wgQ7lZhdMv9XFzbX7yeTJhTFSZC5sgGzpuKBolf2ZwXvYnkN85bEDPQ7UlsrO/4A
 eAk5RQEGB8gsCAVAHuqQJQKuCmmTpK4Wy+nm+SpA3DwAEoHlEqBWdn1a4I3eLdeG
 feCaft0f6eCsHhgM8ohBERcJt+9nMosp/qUMq3ehoc++aTFuzE6c/kY1h0kEK1fU
 E0IE/DNwUxxhKaTE+MNu58zQ68wgxWOhBM9nMTtcCFoyI+mkFIo+EgDiIKEBg3LD
 XBlppWrO4PnJzQ==
X-ME-Sender: <xms:pSkeYXroRuE7DSFhyaBKwTIqERWX4n2Khv5voo0DzNyp8VHUyin6SA>
 <xme:pSkeYRq0fAQEb_FGMLxPaw6EtuZezDt5uB0qt2-mfGCeIMkuljMTtYygSp_0nwy9R
 unzg1ID0v6EFUwidck>
X-ME-Received: <xmr:pSkeYUNjQH46oM-0DTSqHbF8m9rVoGWEs9quBI9AX9U28ZsybOR8iuY5Hqw226REQXAy-D4cwIy4omk86zMKiZ_zZyMb4AflgpO2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pSkeYa7hP3vWj5haJlKwxwZX9pbkE0hpgJjbdVDgjYprMtip5KqH5Q>
 <xmx:pSkeYW4voQtwqHntSMLBdi1R72oqwWfREH0KzYdV3fPDPA5X7veJcw>
 <xmx:pSkeYSiijGLhZOigKYktilUxhd3_h3S3ZtKeWfE_epujbRkmO1Ja8w>
 <xmx:pSkeYVT0scRYsD4ctd05bLZyj1Gw4TnIDZzGk106cSxqrvh8MwQkqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 03/10] drm/vc4: Make vc4_crtc_get_encoder public
Date: Thu, 19 Aug 2021 11:51:12 +0200
Message-Id: <20210819095119.689945-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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

We'll need that function in vc4_kms to compute the core clock rate
requirements.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
 drivers/gpu/drm/vc4/vc4_drv.h  | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 18f5009ce90e..902862a67341 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -279,10 +279,10 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
  * allows drivers to push pixels to more than one encoder from the
  * same CRTC.
  */
-static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
-						struct drm_atomic_state *state,
-						struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
-											 struct drm_connector *connector))
+struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state,
+					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+										  struct drm_connector *connector))
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index ef73e0aaf726..0865f05822e0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -517,6 +517,11 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
 	return container_of(data, struct vc4_pv_data, base);
 }
 
+struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state,
+					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+										  struct drm_connector *connector));
+
 struct vc4_crtc_state {
 	struct drm_crtc_state base;
 	/* Dlist area for this CRTC configuration. */
-- 
2.31.1

