Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E5C6A04E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACD010E4D3;
	Tue, 18 Nov 2025 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xqVTA7Y2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F9E10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:36:39 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5942e61f001so5578744e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763476598; x=1764081398; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0bycRO5ju+g9tmmqMlsbxCbRXsywPFhsV7WY8G2XSAs=;
 b=xqVTA7Y2BkVnp4AQ51OwwE6GJBif3i4lTQQ5fECS0ptd+0MyPzidFhr0HqF121KItk
 TfgCMQzZ/henXRILPR3goDZpldYo6XvQEbn7pjGqOYaI/1T9/tWo9HxiwcDyeokyF9t6
 mpYxt4Zy27uVwzVJ0qjfeTFMgYE2eqXWsEnMcqOKXHuhyUMxxLiz+c5vv26mzN2NxYkB
 t1KluqCKFBy9ut3ztgoQr59KebHZQq/XU3k5lV8RSs3oJt/N5bwCPra+FHw77NLRT8gT
 QHizsVUcEtu3Brd0kwjEJnjP4pSnh/gt2OzxX1bBSiYZuWQEPJ/1lCsPM4bGV1NKF0HP
 R/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476598; x=1764081398;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0bycRO5ju+g9tmmqMlsbxCbRXsywPFhsV7WY8G2XSAs=;
 b=UIU8C4YkNuiP8tRnb1xKS+AM01TM4cLv1JKXGmJ9+9AFocmt9HKLUC2dXeFIL6TznW
 iOgnYSzq46aMstMWH33xlbRrwHqYPc4De7GhY8D8XWbgIRD9keIZelqE5PsmDRkusqp6
 Z/FRhL06BD989b+QmBh5PSvHedBniNOMEGZljKijkUaUjATeQ4DCl5QQEJ3aqA/o/Uce
 hn9WjOlm5OomIKY/uT1wzuMWioulB9PSO8DvAntGxw0Cb4/EdXPVcxUt7Av9glIFMtpe
 skFEFR3sHySXIkAteZXzfxOAKNZtwzLlHyjZVaeY1UHIDjqHFT6AYnk9551N26yOr7Rw
 Jmfg==
X-Gm-Message-State: AOJu0Yy121J569yj1T1KW1exdN3MI5p9JuKFw5bXvxW8E+kgQPaE3qU3
 KNUIYmn9cPI3v4LfGgcBZnkMQk6txkQgylDy6dyuPMpdy3ik5ZW+rWNtaP0B8RsYJDg=
X-Gm-Gg: ASbGncvXNZ9fze+7nnRnQ6cbi2Edp3buX65amR1WFSErtFVTyEUb9mXMkMhFiQeuW8c
 K1PNKE7WAqw6EO1iyMQ7Lf8cYVpJ/MxauzLB3x5Dc0hjHFIgwZ/P8B9be89uyzOTT6+CGdRmDDb
 FrJaRHWUCtnJ/WQnkTleXQ4q+FV6/wx49FJDWtQLIZVaEy2yOSgHCqo9aUuKF1AXOrmPTdFzWYG
 Mh3AUiGe13Pvcv4RZl2bt8dQU3f3xG2Q/7H+Z4Bp59ind7MKv1Uu/euJ+sdSxOpXwKvNoZQ3nBI
 YDSPYVhmMqD+lYbHexTBsCQIaWQydGK6Xwsh/+IlJ2clL6OOF1kH/aF1KywJb38/VxEzVxddg+v
 Rxeu5Zclyn3NO5T6RVMNA48eALmI+bvuOLyIjmicL6gaNkSjUZKS/aQwu2G48j+AuZS3uGvmToX
 d+WE0VTgGE8y1qwWFHsv/UbRb2vFGPRq0KY7O/WfGv/NghPnZPGMKpVryxrhaIneWu1A==
X-Google-Smtp-Source: AGHT+IEjIbE007XQ42Lov4SPdYVQSps/79scrhFaNGH/VJZzATj+erAnkiycTvxb8UPryBCvY5yJjA==
X-Received: by 2002:a05:6512:3e05:b0:57d:1082:e103 with SMTP id
 2adb3069b0e04-595841ae2b3mr5805736e87.16.1763476597995; 
 Tue, 18 Nov 2025 06:36:37 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:36:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:36:05 +0100
Subject: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
In-Reply-To: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

This adds (yet another) variant of the
drm_atomic_helper_commit_tail_crtc_early_late() helper function
to deal with regressions caused by reordering the bridge
prepare/enablement sequence.

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

This patch from Marek Vasut:
https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
solves part of the problem for drivers using custom
tail functions, since MCDE is using helpers only, we
add a new helper function that exploits the new
drm_atomic_helper_commit_modeset_enables_crtc_early()
and use that in MCDE.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c     |  6 ++++--
 include/drm/drm_atomic_helper.h     |  1 +
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index eb47883be153..23fa27f21c4e 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2005,6 +2005,41 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
+/**
+ * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
+ * @state: new modeset state to be committed
+ *
+ * This is an alternative implementation for the
+ * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
+ * that support runtime_pm or need the CRTC to be enabled to perform a
+ * commit, and also need the CRTC to be enabled before preparing any
+ * bridges, as well as leaving the CRTC enabled while unpreparing
+ * any bridges.
+ *
+ * Otherwise, one should use the default implementation
+ * drm_atomic_helper_commit_tail().
+ */
+void drm_atomic_helper_commit_tail_crtc_early_late(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	drm_atomic_helper_commit_modeset_disables_crtc_late(dev, state);
+
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, state);
+
+	drm_atomic_helper_commit_planes(dev, state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_fake_vblank(state);
+
+	drm_atomic_helper_commit_hw_done(state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_tail_crtc_early_late);
+
 static void commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..f3833d20c0fa 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -104,9 +104,11 @@ static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
-	 * the case with e.g. DSI displays.
+	 * the case with e.g. DSI displays, and also make sure that the
+	 * CRTC is enabled before any bridges are prepared and disabled
+	 * after any bridges are disabled.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_crtc_early_late,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index d479afcd1637..1e85df5eea4f 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -64,6 +64,7 @@ int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state);
+void drm_atomic_helper_commit_tail_crtc_early_late(struct drm_atomic_state *state);
 int drm_atomic_helper_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock);

-- 
2.51.1

