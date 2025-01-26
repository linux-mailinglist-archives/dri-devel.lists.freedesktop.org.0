Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06FFA1C7FC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 14:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D18B10E1D6;
	Sun, 26 Jan 2025 13:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FKYjL1JU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83C10E1CC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 13:29:19 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54025432becso4115895e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2025 05:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737898158; x=1738502958; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SX9MYTSclFR0wg3r+1EUbn52IF2ijQOVXV2N75ELiLc=;
 b=FKYjL1JUXCzDGCeg9oM9YNOvzhY5xHsWrq6sY8SRXFNhjtwVUBRbhXd5GyDoAzkPJp
 RNSCzL+NHZ6wGqSMwmXznh0hiOXKu6AOKY1GWyDGfAO9uUpBwbjmZwoC4D13aizHhoHg
 kv2czLgl43WeeHd1UQVETof3OMemnq2Ptjwm4cURpixgcjFW4YgpHXa0cPdwAPuqx7pW
 BZBY2eHHsU1etNBDbJ93ScCm3+2FIkGoSUISjNKIBmKJsqpw4mQt6/nYHN/m2ap+yYof
 Jh5HHIJtdx4zTJAwfH+jdrILuRAarJc8NMe0uWiuf19apFRn8epRvPiixnV9jOjBqPsx
 q09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737898158; x=1738502958;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SX9MYTSclFR0wg3r+1EUbn52IF2ijQOVXV2N75ELiLc=;
 b=FuZ6rkros0cGeOiHnkmS5h4SoOvHAv6BresK3df/Us8bnJBiXCYKSqeKqeTWB01Ls/
 VWooc4B+nin/MltXj3DtOg+HAAas5CIgxmWZAW4W/uThsGR4X6G0cSECnfibd1FsCBYN
 K2a0znh0GBr0YNdMkAL9RLvkpT6mx8tUYl8IgNaloELaOIMC+ca9LIsP3X+776kWL92M
 pGrTSAZ0NbHdioBgmtsD8545f46aH9Lvf21rZSu56YkTAXO8MGdpLfFUW3+hE5Ow45Us
 LU3obU9LHiA33z3Ir8sQl0UaIpk7INw7dpocghYSjqNTZzrkYdhUDkebm2VgKtjUBeGm
 IlFQ==
X-Gm-Message-State: AOJu0YxJwqy/he4LmgAgvI+KcEdmrHlFyQveUeACa9JJPXADclh1DvJy
 Owsy1Z/0MYoNkE8lEamVP+FqrV//Ppn5YMCHaSB9AchHoUm1HyC3sk5jhLrZd8s=
X-Gm-Gg: ASbGncsz2lcePrrgbIzsGNzljZg7LfLO3y0+ms3funqCaqwnJPl5Z4yS6UZpgWPBAGJ
 kZObpc+8KC9l2mPFoeFGWSVKl60OWpDjXNS7Lnw5Rk9d2Ds2MKCKlS6FpxEnKOwY1dHst3oMt1q
 Z7NaG/eAgjgGrmDjfB+N6udZLRtm1y3cLRqIrTJjmPspKgl+Fa6ubJVYOHoLFNBMvQhsf2MngpD
 MTe2AOPkYsVH8lS8coyCmaYsqrjyzd6Ox9NpGgagjxkbtKsQ2oIGvvjtvujLrg2skoO5io8JUTL
 RPMUosd1tQz7
X-Google-Smtp-Source: AGHT+IHfmHwDsIVDDU18s8k3+lcuyD5xVAkm66Onnq8gE2IJ4Oa+1KoJpdUO2EVL+jPU/OQ3U8votg==
X-Received: by 2002:a05:6512:4007:b0:540:1fb5:3f9f with SMTP id
 2adb3069b0e04-5439c28ae38mr13942554e87.47.1737898157961; 
 Sun, 26 Jan 2025 05:29:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543cbbd4cf8sm770488e87.201.2025.01.26.05.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 05:29:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 26 Jan 2025 15:29:08 +0200
Subject: [PATCH v3 03/10] drm/display: hdmi-state-helper: handle CEC
 physical address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250126-drm-hdmi-connector-cec-v3-3-5b5b2d4956da@linaro.org>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
In-Reply-To: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Klk620Is/1tbtYcXQ8FYuys+ryQfkRDd4Rrv8wsapQY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnljijCZprOrZwWqHJxsZAFAM6dj6mDFy8rsaRO
 6QKkE6uGU2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5Y4owAKCRCLPIo+Aiko
 1admB/sE+ydh5uJSpKj4Cz+Pt0QvIALY+Y3vS9INNJ8ZOQtD1hc8TlWDbv2L1wb8RDzKsKsaLC1
 g1SFMu/bgEalhZEgCx2HqjH2mjCnWrvybPrdBPE3QJlqtuulkSkU5pM/ywF5qaEdkN81T2+Xjii
 8fHRcZ6xzv1hXq+EIq/KLKdUMkpjST0jhvNI3ssFPG6supZqok1ENNlGa8UIL4e+oZyUk57dIKV
 l/A9ioRt0dpaCHCSs2+an1oV4zN4cdDhiFX7Moog/B+UA/832iFSywUG9w2Y07XJWYQv4riBQhT
 tfYvPQ2eQZPk3QYAzUt7W8b/RqMkkS9k0gckaO0tDFWbQ2W8
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
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2691e8b3e480131ac6e4e4b74b24947be55694bd..1e7ea9b387088d5f407b647a9a3fead7a2929a30 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -786,8 +787,11 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		drm_edid_connector_update(connector, NULL);
+		drm_connector_hdmi_cec_phys_addr_invalidate(connector);
+		return;
 	}
 
 	if (connector->hdmi.funcs->read_edid)
@@ -800,8 +804,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
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

