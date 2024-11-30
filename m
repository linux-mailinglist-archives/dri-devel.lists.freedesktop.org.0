Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B89DEE6F
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE44F10EE36;
	Sat, 30 Nov 2024 01:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MpOWwc8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8210010E5BA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:52:52 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ffc76368c6so40467191fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931571; x=1733536371; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=;
 b=MpOWwc8WJ05/wLydEYr6WrARz4fcobf45PRQ/IhqrPg08+krolRl6F+VKNrA9XgZ4J
 6EP89Ts8UF6EeiDta5gDLXhXxlQQR8TfiFSRQdzXPcTN23ZclPChBoGqLMNQ5/YF28ZA
 wm24HlZ4lAEXb1vUED5pSBWGlzmNKE4y9g/L+7psCGYTp44EQ1bljqhsYwkN0d+93wfY
 qh2TG/RgMoeg7V2z+OgzMQp1i49ya2Ed83n29FvoX224QDHaa0NJie6JZWxNotDTqWaT
 C1eUty+gly6bHz+nw2st9p5i2POVYNmk9H7c9AeEfUD6sA5WP5Jy7xdVRCAesc8MxdOv
 XOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931571; x=1733536371;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqzd45OJ/2bjI5cuXyLBaiv2D5kR3sXVh9d8XfqZ3RA=;
 b=dTIWOy+U2PgcsNebQFZoLdYbaaYjhZmWJsHIbZTLRzJIy3fA3+1IBoZE/p9LuW4b9R
 RfipirRTKASiVD22sUv8TOH+mktZfqRDGaJKTeKLg78iBGVHGgCNA0izodFEo/h9lP03
 zSgdF/J+9a3ImYkEwwOKfLfF/dusZPzr3IG3wN9zZELV7ikp4KLe0TJRyjxogBZYsnyt
 nAILdo4WfmPK2TBuMdhpuz63C6k2//ayr3I/Qjt1Hbieuz9QJMKajkRSzFmfBtzsp2wS
 HAOHqotNLxjYxkB0eZIFt2nA6CWLkWf6X6Lh6z+OYlFPhbwUS+S+DdTlOxvJcBdXNgu2
 W9AQ==
X-Gm-Message-State: AOJu0Ywq19jr4xKm7qnuMKwHFGjAusvydHiKn/LvCNbhp2OkdCk/z0Eu
 n9Vqo1CSY3V2ZDzhp3JyQXVfUSeVvP1Oua9i5F4aP8UVGH1gEyozubqb6zC18zU=
X-Gm-Gg: ASbGncvZAm1J3Fz+K+5LdbE7Q2guxamn6ihoWS/J4W5FFM+19vNXhNiOpZlc7QyB31/
 t3Vic6rR9Nx5In0B98mHY1uiWHn1zL7c8M8mg1F2ePsLxJk0AmfueX7cuLiX0GjlJ4MGIp5uEFM
 j3Y3X8bekueNwBnF5CEMr6wfCcMoQBNnnxjKTfip0o0+QQiEbJC2ae+FBju75moLnhLwosHSYrd
 Y1fXtnftnrMVWg/ju+S4sDgiN/U5ROHb5PzH6qfxFDzyLppqB2PdjFg6Q==
X-Google-Smtp-Source: AGHT+IEm8Yb0TxS+eVr/75rrNhY8EmahWTK3d4I/qjVsct4VbSz/US+qIlExC4PPMtJ+C61FxhlMpw==
X-Received: by 2002:a05:6512:124f:b0:53d:ede3:3e0 with SMTP id
 2adb3069b0e04-53df00a924emr13257471e87.11.1732931570640; 
 Fri, 29 Nov 2024 17:52:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443172sm636408e87.84.2024.11.29.17.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:52:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:52:31 +0200
Subject: [PATCH v5 06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hdmi-mode-valid-v5-6-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=At9SvTe5LA0QiGChV0O2Dfze46Fe9tZ8M4odvfGUE7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm/gUrzKupzPQSPNAvUfGl7XQ6IFP4Mjuc6k9
 OiwxKE8NgSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pv4AAKCRCLPIo+Aiko
 1UbOCACfmiglysJU/tIyjGlA11c+mgJ7cYK2eOEWh0ZSy72NW65KgY5a8FbZ9EVCQERqWc7dP90
 abFOIQdTPse1qE2HvCyMqVIHoKKywUEf4E5vhK1BOu4ArILzt6nstUi+E03GQUFjvM2cTgf7lZC
 edUwdUGA5Lm0pJq04VtA/+pg5wi6+qb33fd00ohAnTYmpBWYYRLGm6ytcdhJuewk6P3AOo7hT27
 VbGBcMiGZNp3E3P4Tvk6KoR0Nm7SOKWMpn6omYVsIhV19KKTtk2UPYZWDe45jm5te3OB0TScfc7
 HaKxP4L24nxyZtXeCB/cUIMb9RVM/dcHbcZ6lkb25qQPXzn4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b9fc4d981cf4d682bedd978795cf7284d2650e74..297afd89036ba8fba571379f5b6d63227eadb66e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -580,6 +580,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
+	.mode_valid = drm_hdmi_connector_mode_valid,
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
@@ -1765,7 +1766,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1773,8 +1773,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return MODE_OK;
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

