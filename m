Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CCBC768F0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 23:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467F310E7D7;
	Thu, 20 Nov 2025 22:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K5hIZUH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342AF10E7D7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 22:56:00 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5957c929a5eso1976557e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763679358; x=1764284158; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9V19WHZJ0LiGdpxDp5Xzjy+hNnmDgOEjSJETgzGbOoc=;
 b=K5hIZUH9miuf6v2zvXOs9CUj2yd4Zz1FCsgfCdufOBikfr+9pQD+I9xtFNOfcLCpU8
 14n355bxhwVLDg7x2onefUd3C9v7vNfl3zhN6i3A2QfRnwnNKKDWqlhmCCaZFowtoMWd
 5vlw6+NLIOrL90Zz+abq/1IdHK6yd3b3PfMte9ju6x5wmHsDfVmWxvEb8QT8mNfSK40U
 v40atOHc7MYGR62LigJfk9benRQagcIdFKWTOexnEet1Iow2we7sUbRR0LBQc5kHJsHi
 Eu+x319SXAB4UXoIF3Yc0m2ETOv1NFF3FjEKdI1/l7KEM8/q4MYpQyM4qEImC2JCPYcs
 tgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763679358; x=1764284158;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9V19WHZJ0LiGdpxDp5Xzjy+hNnmDgOEjSJETgzGbOoc=;
 b=lqY+BE0qlYDKa7VzflMiTrN18i89ga7gmdJD1mWXqr7GoNxY9I6R3GEa9hTs9tEsES
 39QhT0WzTkVOcnCU2mGrSsuTZBSow+xEX4ohJ1ocQk/4BK0U1H2Tn4l24D8BuzZLUEIE
 eiJDz6cCoSMr0keQ+B8up171u1nmN2+E3l0yp5M2TYpw7DC01dsXSXc+U3MZ+HRoRyWZ
 cTJitR6nnMu20BSqv/OkYinyvL+fqxolyL6qo30uP2kB8gA7OZ6JVQb5lp8LBKyv67ZW
 DneSWTyZNyA8P1gFKUDf6D1pS6lWoEbEZqNNfYg0bK2RxLQwoTm2KwOdtNJO1sHno8F+
 yphw==
X-Gm-Message-State: AOJu0YygDmnXmGLQknZ43j4N/798J/NMIXMDCJPxF+rHcLu5ZDTmGTHO
 p0uF8j/DGJehRmzHLU3cTE+gsyRXVRdidisV4ioXqW3fArS0vNJOkdSkUEGFihFXfvM=
X-Gm-Gg: ASbGncuFaT/BhElnfsKsLkV/HJMbfmx6nnc9dbdc+tRA6rhK20RDDW9PRKSBTO/89o2
 DHtcoJIl0aXp0weSm9zzW9WY6fhxXenwpcdqLezBjU/vPgj5k688Jyj/8d7gemVxSxHRnIF5YCD
 d5gxj5kEDdQMQMsoxxTdO1LmjC5fqASy+emcSULZN6iYW1ik99C2zpzO4LXuO1D7cNE98UrtOLk
 9+N3vZdZ1ZLa/KY4YSZJeACQo2oImVG9CDJbNL0qgECa29y8R0nnAxehEq+YmeAnzohvyiMbRYB
 +fsQuaWAGCPtWlh1FEXcj7e2AQKfdGm9SbEEv7K6hInGC6dGbRtEGRf6E+12e5vVyNdLO0F9DP0
 IG5RmSt19Woak2Fb4NQLTDryLis4z4nxVyME0LltUleDiCYtIoIDqVR1zD4Kh6fUz7j/cqz5NhZ
 0AHl9P0xC1fHl0OApuY1c2FCCAXkdAF+Ol1aQO/UnzjHHITX6OBaIgFKg=
X-Google-Smtp-Source: AGHT+IFQCy93+vVkz+zyf4jE1GvNsq0F+1SIQdV2kOxKmGKnmCHkK+0WJ82nyGq7goP7wnuIqeRZsA==
X-Received: by 2002:a05:6512:3d87:b0:595:83f5:c33f with SMTP id
 2adb3069b0e04-5969e2d4b98mr1713739e87.19.1763679358449; 
 Thu, 20 Nov 2025 14:55:58 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 14:55:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 23:55:34 +0100
Subject: [PATCH v3 3/3] RFT: drm/rcar-du: Modify custom commit tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-3-24b1e9886bbf@linaro.org>
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
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

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused regressions in all bridges that e.g. send DSI commands in
their .prepare() and .unprepare() callbacks when used with R-Car DU.

This is needed on R-Car DU, where the CRTC provides clock to LVDS
and DSI, and has to be started before a bridge may call .prepare,
which may trigger e.g. a DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This is a modified version of Marek's patch using the approach
from MCDE. I'm pretty sure this driver also needs the original
semantic ording during disablement, and it surely doesn't hurt
to restore it too.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 216219accfd9..d1d756f40fc6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -540,11 +540,30 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 			rcdu->dpad1_source = rcrtc->index;
 	}
 
-	/* Apply the atomic update. */
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	/*
+	 * Apply the atomic update.
+	 *
+	 * We need special ordering to make sure the CRTC disabled last
+	 * and enabled first. We do this with modified versions of the
+	 * common modeset_disables/enables functions.
+	 */
+
+	/* Variant of drm_atomic_helper_commit_modeset_disables() */
+	drm_encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
+	drm_crtc_disable(dev, state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+	drm_crtc_set_mode(dev, state);
+
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_writebacks(dev, state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);

-- 
2.51.1

