Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6ABA08F5F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA31D10F074;
	Fri, 10 Jan 2025 11:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l6yc5gI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8B810F074
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:29:58 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30227ccf803so15668121fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736508536; x=1737113336; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+lCA58zl22vmnlxhnNGgCm+vw5K42PZ70YAVZOIIBqQ=;
 b=l6yc5gI9TBx5x7DzgP5qXmuwB/LHEb6z8bo1M4K1X7JHQB05I4P/YR2gUzuKLkJCbO
 bIhuGIG5EhpPxnYMJ55zanSrqY1ccZU4ughFglg2SupX9PrZRD+lG0bTtZ77LLnj+9WA
 gbm9umDNOrspnOzPRzVVmc8AdpS2JG+CiNIbKDfjXNnywOyAj7O22nG32Q+bhQAZzl/K
 G6K9ApQkXVhG6m57SG9437fvo3VLpZFVl3SG//NO5WshOW6HegWDQTGukTKubmUSlTt3
 NtkLLhkTjWGZ5GCIreyRldDwLg3+cThazSgJJo5e/ZS5/hiprrWb9Uwmbe9W0XZVMFJP
 FZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736508536; x=1737113336;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lCA58zl22vmnlxhnNGgCm+vw5K42PZ70YAVZOIIBqQ=;
 b=apqD+Rz1Ds9Y2j4iR1J/FWmPFw7cYXAWLrXOwhFGSJYfNPTW9kFHEdYAnEFXAUaSEi
 BOybktsNKCUvtTqAWPCi6WARx+ESF3NMHc0rMdL5i09hG+FXVM+oOCZg6GQthnBmpYgP
 vfqcU1R91VBq5aDIb8x0LwjQ4luxJM7y47CVK2YthVb4/RclVS+EUtnW4q+WYTYejbRf
 TH7yAGFDS9xB2oXGuTVYqxdv9sBPx6uepAYWrEK5IuAS3YR+D4YN2lCFSqMaV9B6r2op
 e07VlxD6dvj79q2ePUSZBiMu5kx4zArAXPcrxnQM4009TDmwbOSvZeRL5iMXOQzkGP0i
 xQJw==
X-Gm-Message-State: AOJu0Yw798mOmJFfQJsA5XxlPNCahQT0OiW77/kndiH3O5ntR+bU4Eu0
 mVeD9G+vN3sAaATDdoyRJ/0i0gtlbUUdS0He4JwSq39HbBL2xx6aT5lX8bEnLh4=
X-Gm-Gg: ASbGncuK9jwaxco1FcEi7INcsHkMv7P01jaHSZocDSiwFXtABiHeWosZATB6niF8RhS
 T62Nix1iss5LCVyPsLG95YgZ3OknWjQrHm9FR3bFIicmTxgVC1m3mYyKQQHBItCGnGh13IBfuX+
 IKzsg2pASwZ6CZIxu7JT/CU+5oJehj7yT2doESzPKDV+XvizXrXHRcHcjmmPzjw7FP4IG+czAY3
 GvCU9DUcjgjOGr9uN6zr2+YXgOpUgUOSu2rffS7scpgjSmmSg4YQi76p2WyaFs8
X-Google-Smtp-Source: AGHT+IEOPIMRVDtDLngWQv6T4mJCYf94Cls0yjVGrelXIXJN7WYv2+ZfXiTOIPUP1xGQ/AFV4XTzPA==
X-Received: by 2002:a05:651c:505:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-305f4560b73mr37374901fa.18.1736508536499; 
 Fri, 10 Jan 2025 03:28:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c78e8sm4711081fa.86.2025.01.10.03.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 03:28:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 13:28:46 +0200
Subject: [PATCH RFC/RFT v2 3/8] drm/display: hdmi-state-helper: handle CEC
 physicall address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-hdmi-connector-cec-v2-3-9067c8f34663@linaro.org>
References: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
In-Reply-To: <20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j8/VCHgmb1raNVFOKXZe7b5PFQfOvnrzhw7RbdPY+gs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngQRuXgTmjpnV77bPG2LC26+aPczuLo/m1ppW9
 3R6veBDEUSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4EEbgAKCRCLPIo+Aiko
 1f/vB/0aijxn/oGkAbYDK/tnKmfkOUE5zcXSkq3jWXc14Svo5QCOLNU0QjE1pq3Z5cHqrjAsXXP
 Z+ecOyJh1g+M6v+oQz5Bq0bwF1jWhJYGEyP6DXcDkD97wDWJ4plKOoHsjQQI7OpJaaqKRIfgBEm
 wd4olaWCVfZNSUHJkS/Fs2Mc45DKUVHcyBuc+FgknU31WH07hOzruJCnMnP/BDIB5LV+06fTvqC
 Lvd/uYt7ptVgCXUPWSSh0u/3sz+KQPP8EgH/LOuLesQl8uC0LXINqyw+toSMkVBhiwpvXNGk7Dr
 VYVRkWAN7EMEfrmjz6qY2piQ4Vy0wc9+n1fK3MITbM3RLHI3
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

Call HDMI CEC helpers in order to update physical address of the
adapter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index cfc2aaee1da08a103cbf933c891d5cc31b0886a8..b060cc265221049f5509e852903bd0a4ca651e80 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -786,8 +787,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		drm_connector_hdmi_cec_phys_addr_invalidate(connector);
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -800,8 +802,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		// TODO: also handle scramber, HDMI sink is now connected.
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
+		drm_connector_hdmi_cec_phys_addr_set(connector);
 	}
 }
 

-- 
2.39.5

