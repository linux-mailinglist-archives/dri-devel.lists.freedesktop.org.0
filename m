Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED7E425C1E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E564E6F4C3;
	Thu,  7 Oct 2021 19:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108566F4DD;
 Thu,  7 Oct 2021 19:38:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 1946A2B009FD;
 Thu,  7 Oct 2021 15:38:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Z7pPxioYkvqtk
 cj6kzdylA56SKrdD8maYiES13Raowk=; b=ck0LrpGhPWbUzLzb2+bet1Gqbv/Hp
 SmKTVStKVusy6Pf6AVlMlahuroBeJbyvyxyA1udORaHIvkXGeR6YY3WtzlAFepna
 fCQadeA2boX9Y5dKIkXyxFMDAB7Fw1sS0o2bTQA+1PmHkclpDQT7Lz2PdHqFu+TV
 YtDmtlFoH2qQwhsy2eGCECU1voFPM1++O0DbnILnYEorfBcXWpj7tQJ6hVZCAmDd
 NV/XH+GCUCHkUF1lkyUTfsUhXaw9nB5VU16nuteCGc7cMOCIdm+aF1SNwuQPm5Bj
 66n8jG+SsVaKw7Z/NjHjNkvdFw15YArPOlAAgVKslHjG7fGsEZstBrSwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Z7pPxioYkvqtkcj6kzdylA56SKrdD8maYiES13Raowk=; b=lMjm1Fzn
 e2Bb2C5b6oiTWkkqXIDyCjYqlOaM9bOsrcinjDeB3E2056FcrScGcBJDN/lLNmdB
 f3Ynvj7GJP/myZU+lywH0k78Yi1/5rFb+Ym1SMtOpwY47H5Nxr1a7oS7Mxd8wEWv
 08GKc0YrhTVNqXmQ/O0xg3i9ljq4gq9DqWkKKV1UOAg0Xbpr4qWjvV+3J7FsEWX6
 ytUHMqdDpHe1E5VTG+vgDY2er1kUF4BWeRoqzrRzBVJyeuSB48y4cgwRM9REQVBv
 Oe48DBWVE0i5aTbDpM01b8nz0krQFpTi6OlS2yhHH/o2xtUjSX8mSGR4kX9jBlrL
 8Cw7lL3KKBH9mw==
X-ME-Sender: <xms:0UxfYf6BdRPDGythRir3nx39gqdbqtXsUg84A-tUcU4My7bSGyU0Rw>
 <xme:0UxfYU6p8D30GZZQ0F2kQnIiuCRaxMRXIFny_eVSrfqFemY5krEcNuVwsn39efEkY
 8-jZC5az7srRnIgjw>
X-ME-Received: <xmr:0UxfYWeC3EYJvx5oucdKsv2MOaR_Bmsnj-8hEmqwuxZmKzBB4OPQJv8JFAqalKmaVJZ->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
 ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
 fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:0UxfYQJ84xY-pdS76XEKC6sGiqLmSD3wCxf2SKCyb_uTAd5T9XQcZA>
 <xmx:0UxfYTJdYWpxSSry7fPH_5V6rmJd00E5L8O0uDRAM1NvCq7h96jmTg>
 <xmx:0UxfYZw2LoxVv6yvfwVCYn2d9rnLxocdhgvsui34INCweE_gCKib5Q>
 <xmx:0UxfYUWht6SIbQ25oNBQyrLYdur3CB9MVJUnz0rl8yAL6zSCbAE9GR2U0nI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:54 -0400 (EDT)
From: Fernando Ramos <greenfoo@u92.eu>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v3 13/20] drm/i915: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN() [part 2]
Date: Thu,  7 Oct 2021 21:37:48 +0200
Message-Id: <20211007193755.29579-14-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
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

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

NOTE:

I separated this change from the rest of modifications to the i915
driver to point out something special explained next.

The only difference between the old drm_modeset_{lock,unlock}_all()
functions and the new DRM_MODESET_LOCK_ALL_{BEGIN,END}() macros is that
the former use a global context stored in dev->mode_config.acquire_ctx
while the latter depend on a user provided one (typically in the stack).

This means that as long as no one accesses the global
dev->mode_config.acquire_ctx context in the block that runs between
lock/BEGIN and unlock/END, the code should be equivalent before and
after my changes.

The only place where I had to take special action to preserve this
condition was here, where I need to modify the old call to
intel_modeset_setup_hw_state() to use the new stack allocated context
structure instead of the global one.

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/i915/display/intel_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cb1142447186..670ce17789c6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11707,6 +11707,7 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 int intel_modeset_init_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
+	struct drm_modeset_acquire_ctx ctx;
 	enum pipe pipe;
 	struct intel_crtc *crtc;
 	int ret;
@@ -11758,10 +11759,10 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_vga_disable(i915);
 	intel_setup_outputs(i915);
 
-	drm_modeset_lock_all(dev);
-	intel_modeset_setup_hw_state(dev, dev->mode_config.acquire_ctx);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+	intel_modeset_setup_hw_state(dev, &ctx);
 	intel_acpi_assign_connector_fwnodes(i915);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
 	for_each_intel_crtc(dev, crtc) {
 		struct intel_initial_plane_config plane_config = {};
-- 
2.33.0

