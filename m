Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61FC6A048
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF86C10E4D0;
	Tue, 18 Nov 2025 14:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bl8KBuN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB14710E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:36:35 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5959b2f3fc9so508517e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763476594; x=1764081394; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y6Voq0GRJwbVB5Ud6eqsoz8Deil83ba6/78LmZuuOio=;
 b=Bl8KBuN57GwFe+KEfOWTUhjblah+yDucRN2wzjCDSHbBNrBFdjBbRQF/lezdtSpsqP
 CWzN19CQS0WyHkBx4zAWe9cBy6WWAi9/TZyKHvA9v0KZOmpKk5K+kw+YsDvbEnHyubdy
 rkgkBJb7bwAfR9stkxkIoLCcZivyz0QATSKxPw+tnLeJX4/BKwUzvghnmLaj65xLwu58
 EVvMsAXU9RwTBbqyRZf580W5JxGjVLSF5i8XR2+vHkFi/iLxhlEbs9E8pmKsJ5AA/3pg
 Q0wb1OqZ/fnRCzE0lqsbRDclDFvu8URmwKx7Y1iL/fd/ZDg9Fuhj3kI32LweDLbXtxL/
 LMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476594; x=1764081394;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y6Voq0GRJwbVB5Ud6eqsoz8Deil83ba6/78LmZuuOio=;
 b=sssxFGaWUiPz5gXI7m7P3wBuwAcntBDHJmQIK+jIEX45HIEPwc4k74EyQPeHDFk4SM
 /vVD+kK3vROJJxAOj6rSmemr4O/vUEIAKxQ4DM7Ft/F+m5vF5fuUssNZLaFlMEQ623j9
 GojmbBz6X7QBIWg4lkPGum9ex3lc27CTiZN8x15OZTfb/3RutQVtaxi35e9lau4d1zD6
 0lg7qI9peQ6nJQHitZHSj4KlT9xXKrcKkABK1ktaK8V7XJ1NEJSCelvxddLCRKCHeRYJ
 Iys1PfuJiBzCMIqrhn0hoMjbZEbPkoM3Mn+OLAW/qUO6ASkGgJTZ0ttcd/YySmuJ/p/L
 PF1w==
X-Gm-Message-State: AOJu0YzPNjvFggrZ9AONyiCGn3FESP4n1VYIwwB3um0Fqqe0XaTDO++d
 AbFZZcWVovrWsVwXD9udztJsYCi3b0/CQMBe/YFiOngqUA82IHJ0pgXMKOOxOIxXrS4=
X-Gm-Gg: ASbGncvHSyvVVxbxbHTwyOKXeaXIoA21OUgjAYw2IkyXs4RNmm+Y1H9rJJUzhp5LtJI
 c7oq2cb+jHfBUYBxbhtrJd4BGseIalLg8AFbM2wGagVqWj5nDnOwuA6YCWQm53P8As7CVteV47y
 B4y381VtxXtQUFNgMb4LaTN3eEBEAXu7mUUu3jbzYFyv90AzuXKV7n0qg01hKaQU1+LAtQaviol
 f9Cdu29Bvf7cPCG3uWcA+W28NwjXXwko7J9FJgUSlk993sZCAM7Z7nJa3ykSDnEOLjmnXIVnovf
 nk3nfG1E+E8/Vz+pGRK9ShgUdonDuzpC1vtfc1Rz6NWsLNyrMb6GE/QTiu93hSt4ZVobJzz2TLb
 sEsCLu6MD4VJUf+g+L2/btDphSt3SiRJhbhA44iQDtgIAVkt493R4q18r1bFRfHskXQlphTOlt5
 6pK1H48RESH4yG6urIToX+po0hQcG/OeLWBLH0kiVSKBTIw7zsbUCstk0N672reiAWmA==
X-Google-Smtp-Source: AGHT+IHuRAfdYD4bkCkXQzm/ea/1Tzt5yWvWJ5jl5KjnlhYhPPbLeti1M/oytNz6VAwH5hDhO779lA==
X-Received: by 2002:a05:6512:2342:b0:595:7bd7:41d4 with SMTP id
 2adb3069b0e04-595841bb9b0mr5828579e87.23.1763476593949; 
 Tue, 18 Nov 2025 06:36:33 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:36:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:36:03 +0100
Subject: [PATCH v2 1/3] drm/atomic-helper: rcar-du: Enable CRTC early on
 R-Car DU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v2-1-4fedf10b18f6@linaro.org>
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

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

Introduce a variant of drm_atomic_helper_commit_modeset_enables()
which enables CRTC before encoder/bridge. This is needed on R-Car DU,
where the CRTC provides clock to LVDS and DSI, and has to be started
before a bridge may call .prepare , which may trigger e.g. DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fix this by restoring the enable ordering introduced in commit
c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable"), to enable CRTC early.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 drivers/gpu/drm/drm_atomic_helper.c           | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 include/drm/drm_atomic_helper.h               |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..f03b93c72b8f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/**
+ * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This function is a variant of drm_atomic_helper_commit_modeset_enables()
+ * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
+ * where the CRTC provides clock to LVDS and DSI, and has to be started
+ * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
+ */
+void
+drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+						    struct drm_atomic_state *state)
+{
+	crtc_enable(dev, state);
+
+	encoder_bridge_pre_enable(dev, state);
+
+	encoder_bridge_enable(dev, state);
+
+	drm_atomic_helper_commit_writebacks(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
+
 /*
  * For atomic updates which touch just a single CRTC, calculate the time of the
  * next vblank, and inform all the fences of the deadline.
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 216219accfd9..b2403be4436b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -544,7 +544,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..d7fb473db343 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -93,6 +93,8 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
+void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+							 struct drm_atomic_state *old_state);
 
 int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 				     struct drm_atomic_state *state);

-- 
2.51.1

