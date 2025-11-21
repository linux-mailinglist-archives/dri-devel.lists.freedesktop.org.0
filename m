Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9DFC79FC0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8510E887;
	Fri, 21 Nov 2025 14:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mkCFPPKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EBC10E887
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:09:11 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-59583505988so2900441e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763734150; x=1764338950; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
 b=mkCFPPKnCIACKUcMj/1pNFyYMMBApg5jB3Iwfy5W8p/PU3NmHYrF5dqFIYWU7l1aCc
 REpx36CNZGgxj4ydNeRNEDNCZYbNnrP81HxOab0Y0YAgoXuOIMqUuIAfQPokGJBomSSU
 J/le/IU6eKgXLcqMomwhGhkMfV17vmVS8zFFZDXWTLEaYzq+/dj/YsUIRuPkg9JEZp9H
 WPV0c1TTY2g5xTa2vpbhSIg/NfTvFKh72O3audSljnrZFfVK1Lmla1ZNnRZiwG6bnyYx
 Cchqq66m5LFJIa6MfSsRDxX6/SwG0Bf6Q3iqXnJUWrspppJSl67yNskt2kcAO6mfmhXb
 7gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763734150; x=1764338950;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ad/4om2M/AQ7PqpIcaRnNBk8hiQAbDj8O1LhlyygVkg=;
 b=hgR1FgSQA4E0UM5BuihFxNTT0iBebgPpVg5hjaPntknJ9JFC5RYXo4I2qt/yvVaiY4
 APl9LieHbkkbCwHq+VWOY7bTR3QbTsZQNhYqDKKQ6CPShYyzYKWJyxWGTEcSWX2xs/Uj
 HctAlykPNWxi7UJZqE7vWW/G0uJtia702EENP2fWLMUUhPCmG7X/Gs22AHc4vRQw5izh
 WSrAGY9pe4fxWsW/+46U8c39RP9afslAe2l/fxd92JmcxgiGVWWXuN5V33tjJ+lBSykP
 UGJvqZlk/SwVKJuPQv2PHS0vt4/q7JWJhQg/1lli7pFwsORcLTn9rsv5lGGiZgh4UrQl
 cqqQ==
X-Gm-Message-State: AOJu0Yxmpp+CGouviNJojE6kwEs89W9DIz3gQG3TA3BrnQb7clFYqK6Q
 1mjWK2s9oo6pKQD88JzZ+LzXHcMVv8EGBsg3vFmZNl7RyREKPiHGGe5d9jB84NYLWVw=
X-Gm-Gg: ASbGncvxcF8o/YP/+D0aJcL1Z0j5wXJfMDqQcFIRK91rcaWWtMLEXxUAFWYYEyxOCmt
 qk03BRv9cbZMTVGiH9hgJFY/PgMP7fWyYd4z1h6qwx9JbwakHGgCwHHZc9/3vQ4WdKWHu2sYnR5
 KVqFjWaFLNLyZ7uqOx3j2ectF0iSgPYKdWSqS+iDji2VSGYna1S7h7Iw5GnQ/GEfrj+8o4MMYMY
 cDBqS3njA7BK5lteYt916BsQzq7d4N1GMTzZvbZDuqxCEinENwi2ZQXdqa3Y+m/Oj98GazfJhj2
 jE/zatvc84QK+mzqEt3+uQXIvqjLLyjseePHRCaxHEetPpuUJ427ymCS7UDniK2jCMKQPzQDum8
 WZ0TJN2f2g5AmGqSVustgVEKKRISLIXc2hg27VoCuPeypgvhYEzLLQQXXEnyE13oCeUzNpbmK81
 +VhsG7RAG2XaojRv+sHaO999VBdAfSE/m+LzeyTKcqTdq1z5rlSP9I6mTfpwPyHNXFKw==
X-Google-Smtp-Source: AGHT+IGGcDGEKQITT5/tGvcE73xIUckd+xCT0V0Qk+ljyWya35+gF4rei0wl07b04qDunpMZy60+Ew==
X-Received: by 2002:a05:6512:ba3:b0:595:9195:338f with SMTP id
 2adb3069b0e04-596a37a17fbmr1051650e87.23.1763734149570; 
 Fri, 21 Nov 2025 06:09:09 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 06:08:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 15:08:32 +0100
Subject: [PATCH v4 2/3] drm/mcde: Create custom commit tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-2-d89bf8c17f85@linaro.org>
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
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks when used with MCDE.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

Solve this by implementing a custom commit tail function
in the MCDE driver that always enables the CRTC first
and disables it last, using the newly exported helpers.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..290082c86100 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -100,13 +100,48 @@ static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/*
+ * This commit tail explicitly copies and changes the behaviour of
+ * the related core DRM atomic helper instead of trying to make
+ * the core helpers overly generic.
+ */
+static void mcde_atomic_commit_tail(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	/* Variant of drm_atomic_helper_commit_modeset_disables() */
+	drm_encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
+	drm_crtc_disable(dev, state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+	drm_crtc_set_mode(dev, state);
+
+	/* Variant of drm_atomic_helper_commit_modeset_enables() */
+	drm_crtc_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_writebacks(dev, state);
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
+
 static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
 	 * the case with e.g. DSI displays.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = mcde_atomic_commit_tail,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)

-- 
2.51.1

