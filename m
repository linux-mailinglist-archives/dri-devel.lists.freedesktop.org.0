Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F83C79FCA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2B910E8DC;
	Fri, 21 Nov 2025 14:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iHtR/LMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5667410E8DC
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:09:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-594270ec7f9so1893982e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763734153; x=1764338953; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d60XQjiW64npXlclebZS9Rgc/GJY+6pGwgEBihMlifw=;
 b=iHtR/LMjr0cDmWrUGkHjuOgmVTWHfj0QAusj/B4rYqEp6UyL6I5GJgJMyiNj5+giKB
 xhkEi5VX9TYkGft2AGYfuUTdPOch5zIzvYew7EYgJ34wh2/VHLni+pFbmqiF3CZfJ7G4
 HgD/un/OkjsN33h6rSdY3DGkMOf+WPW6EJXZpR8C56pM6EQYs1RiMTisMtMiv7bmcJ08
 5wiIRfTzZjmI3v4+jKO+mIHklwLIdynMA1xG4AjPgZfGi1NLco9S/fJVD0x+8Ng59MLx
 y0ice/pz2Bl4D7NTjex6WFj8Z3s8RKxGWmL/dVYL+9QL20fradUxuwamggfzukVwXfBH
 qW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763734153; x=1764338953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d60XQjiW64npXlclebZS9Rgc/GJY+6pGwgEBihMlifw=;
 b=SEvHlNuQx3pE6qBTOYIjQS3NOcA9eCK4QIKuJyDdxGVEaN0Ch+jXZoiof21Ux2ILQG
 oDikZ/OM5/mzyTUNxwPQiYxvCF1KS2j13r/OpCB/pyUtZ/0wbfussIW7mwXovwsNfz00
 hzWW+t6o+gDTUYxLPSquMW66ZqOOHIObthd3QsvnIcPXL+QfJxvaUW1ZBPJIdyhzegc0
 ilEtUQpZATOe5+VTafaiHCs/CN40aMJz3ZHycZBvx47lcxOpS/Io2lib3bnpQ/qKBZQO
 IIwnnoeIqTLfpV7s5gmE2/2ciQPnVuj9BZKUhJilxxzYcKTTAWtm/C9AcZZfU8vtPjNF
 FfqA==
X-Gm-Message-State: AOJu0Yw5EohFzbYAyAC47KVQbE5cVqd3czlC/tHDDr2rA5fvvFiGCbRo
 pC04NVo0YAzfFZ+huDUSkyDpcmP96vt7gswnp/2NreHdTwfjeXfU8TtGdc9YjigAtCw=
X-Gm-Gg: ASbGnctR4HJpJy+WiDMsGe9rDtfO8I72AY8P1finlolmULxtlASU6zW17QgXwLoUkAU
 mWA7aXeuHFW8/3mf8qN3ub3i/HRhS/uDrewHOoWtLXZGrkV7WL9chCJKKbzDhJmirtvhh5jWsn+
 2qq+2ZV+c3xMVSUGT9jT51Dpq2509tfHYGF7YmPl2nKaaeTe/TsXrJnY1Jy6YrCS0I8VQYHDqvv
 +Y7pk96ldFgfE96eOb2OPZbo3gbi41J/j6KOxpb9Xq6t9A79D1kx7h9Oa2FkGEag1VJvD/bwOhX
 nLlfEYr/qt5MSqn/TQWd/Ypuwwdo7bYWD6uEjjhsy8CbJMXuueWlozh78r8de5GrcOl1Bkd+4RJ
 1eVrhTDlABrV0Ab2J/bSxX1b3Qxpx497zc8PCyoFIP+BkR0jgr8VoIdCBu4q40LczR2n5754Ch3
 xD3KEK2U1pU5U9iLLUDq7WKM0B5t5jbkGMQeG9JOmSWssIsI4x7fsGjIw=
X-Google-Smtp-Source: AGHT+IFvk99EN3C1k7NRA4IPuhp3HI8V4IBTrZL8ZX0888GMzEzI9uRCSO8HT09T295ZD+Poj0Sdfg==
X-Received: by 2002:a05:6512:6d1:b0:595:76aa:8e with SMTP id
 2adb3069b0e04-596a3edac17mr794945e87.38.1763734152584; 
 Fri, 21 Nov 2025 06:09:12 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 06:09:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 15:08:33 +0100
Subject: [PATCH v4 3/3] drm/rcar-du: Modify custom commit tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-3-d89bf8c17f85@linaro.org>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
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
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
index 216219accfd9..704f5e067357 100644
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
+	drm_encoder_bridge_disable(dev, old_state);
+	drm_encoder_bridge_post_disable(dev, old_state);
+	drm_crtc_disable(dev, old_state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
+	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_crtc_set_mode(dev, old_state);
+
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, old_state);
+	drm_encoder_bridge_pre_enable(dev, old_state);
+	drm_encoder_bridge_enable(dev, old_state);
+	drm_atomic_helper_commit_writebacks(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);

-- 
2.51.1

