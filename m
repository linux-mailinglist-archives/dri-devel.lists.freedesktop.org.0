Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A019EB2E9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E2E10E3C0;
	Tue, 10 Dec 2024 14:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cdruB5Nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABFB10E3BF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:16:57 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso5700647a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733840215; x=1734445015; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KG04n3jH1DFELR10HVCrrQfC/3zE3v8nOQLbFlHi9xk=;
 b=cdruB5NwNdLp6xuJr+5Q0vlDSG5nskQFFuX/N/8ZiruZ1D9TReUKJl+UW0L5hN3eSI
 GFTI8CcxVV1aswGyDvZ1GviS1GQnVNstnLV468BtZuLna77Hm5c1WP2+yd7NdOom500O
 bThyruAHHJSDx0g2RaasTfNYP7xd1GQlEDWIeVCioVBKwrzmPegJXESqy77tC2IN1JS5
 umAF8/XW7OIdXr9EH7z64inMc0fC1qhG8rifHaBQtqyFcql1RGF4u+vp7ps9QbnCkFIa
 Aj/U0ApXrnpJkH035gchx9cOCgW7qQZo2RD9xcaS9fLjokiBeAo1sfMH0tby+NCthjfd
 L/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733840215; x=1734445015;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KG04n3jH1DFELR10HVCrrQfC/3zE3v8nOQLbFlHi9xk=;
 b=fjloQO2Hgkbd6+NM38nH14nSZDv4pOUfT71zuQNGHDN4jzbkW1f1pzEUhXM1IL14+c
 9ugqiGN23UATjinkH0RVVRPRje6lgNxPsjLZDb1SJEtONk8n/g8aURkQpae9PFUXAu39
 J8w4J9GBYd+Zlh35AC1FKCipUyD013uFhEzJNoV3MIobpbke1PX6Mk7T1kpyzytblHvo
 vECgliJ1IAnBWTTP9Y/J0AHWGJYwx+2jvy1+XGCooENGYAM+RVnyii9p5SfEnR6z6u04
 +S1BE+o+a+IfyZxXftkYaZgvbb3vOtrpp3pPk0frzUagHYOu8wiVX5u2TfK7BJ73sQ3z
 9O+w==
X-Gm-Message-State: AOJu0Yyi6gzAEbJ6+DsSOBFwNU8jY77JI/K0CmP08JvOTGJIEvSvFzBj
 PZG4gXJ2sF8UTHoQ5ai4eI4H98FAKIsGdWA9h62LK3Pg1p9AC/tDyR7Ia5+P1EM=
X-Gm-Gg: ASbGncurcqSe9op5qKkzC+6uPryYrFVzW77ehnA+y/i29fRQixqM66Sm+rgeqgHG+xT
 JmBOTtY9x3emyOKlJnrbSFzTundig7ynL3l7yaNvquQl0qNbR85HOt3RM2J8chmjT/279CVc704
 ppixL/X/TmdGkI2Axu+/786dMRBG87tLrd3OPW/lWDQYU4e4lrEJtWWfVH5vtAS07OxMyer8uXQ
 8hoIkQoXL+M0X+gbJG2JQX5wcAUXdXNNmZ05KHBUh2f4jBhlC+sZ46JSmPyWQ==
X-Google-Smtp-Source: AGHT+IF8sFjqWDAeeHbyCT42Lo9bApykjgIi669+j87CMogHug4+toN6HpTcfoP9+THi9qi2bknF3A==
X-Received: by 2002:a05:6402:1d4e:b0:5d3:cd9a:d05e with SMTP id
 4fb4d7f45d1cf-5d41e2a7ce6mr3458173a12.9.1733840215431; 
 Tue, 10 Dec 2024 06:16:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dc2602b0sm5104362a12.18.2024.12.10.06.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 06:16:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 16:16:49 +0200
Subject: [PATCH 3/4] drm/bridge: lontium-lt9611: drop atomic_check() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-bridge_hdmi_check-v1-3-a8fdd8c5afa5@linaro.org>
References: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
In-Reply-To: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Dv9z5EQ6QS4Oh3NjXL0UPCIboG/Nxyen1A1+0E3853U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWE1S/0Nn6akcX1McXx0ZVZ1AI/dMr6QkkQx/u
 U7fii/uAsiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1hNUgAKCRCLPIo+Aiko
 1Ws5B/9oZ0/B7Eid9JGphPr14wDxOw29qknjLVHN5U7NEDQ8dTTi/dtbyoKPzfPnFFN9dIwGtem
 prJkHHRdfpP7LhRqHneiVD36zQCzdQLIgqZVBLaov/fZF6zWQ6hDKZn2LmAB7lDzbqm6QBuBPt0
 Mm06Ike4H+6d3galuqrXSJz9a747j81Lc1142qL1UGobmHzTb4gLlhLPab8l++29FWXY60kMImn
 0DKEX5nwYTHM0g+J8Zb+tRum977h8CXvl5yCLQJ/aOM7o0o32N59NziNqXFoN0ePdWDYXxdrqa2
 m7FfIhlygeUX6aIyYBkpvoM51yk+ZRB67f6CRUpo61LW/I7r
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

As drm_bridge_connector now provides atomic_check() implementation which
calls drm_atomic_helper_connector_hdmi_check(), drop the duplicating
callback from the bridge driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1ffbe473e4103dfc315a8cd3571e9407bf518797..71edb2b659de374c88b453a90a7cae902b97d91b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -767,15 +767,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
-				      struct drm_bridge_state *bridge_state,
-				      struct drm_crtc_state *crtc_state,
-				      struct drm_connector_state *conn_state)
-{
-	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
-						      conn_state->state);
-}
-
 static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					    struct drm_bridge_state *old_bridge_state)
 {
@@ -947,7 +938,6 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
-	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,

-- 
2.39.5

