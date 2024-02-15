Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCE856FC3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 23:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E0A10E387;
	Thu, 15 Feb 2024 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="DA/Wr6ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBCD10E387
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 22:05:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5114fa38434so1634405e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 14:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1708034707; x=1708639507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6rc6eGU7njaSrd3gOPv3RWA0Ip0OaiWxwVmzreal714=;
 b=DA/Wr6okgrrXCSBZF7Ub8xFExscFGj1Win/GwzwPPrRLj+QY9V63fnjWgbyL/xCBOE
 vhbC7UspmJqq+HbVJZKlxAYI0FSqmHWE3GMNGj46Eegw+przSVMCBSnPgCp6LqQ5zzgG
 2j0G8fu7a9zSB+yxXr2WyVrkvyvPJ6FdFjdaMjZ785IOeylwN2ZLELmvu9jIrw1u6zR1
 Oh/jtUF10oXBjjzOb8dow6pbMrXLCesi+5VUaqfRYEd+EfVSCaGSYUTOCSQTOMjIBhYA
 q1BXMll/gNSrB2A0h5XwPuj9VFMfdMDC6CqDtDEuq43kNT3cbC6wDMOQ4ykIc18J1saH
 lPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708034707; x=1708639507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6rc6eGU7njaSrd3gOPv3RWA0Ip0OaiWxwVmzreal714=;
 b=GFuo59JD73EHxbpC2fVbWKfkZ0FHEsJ0VuJs/4WuTPRWaY1Kqd5W8H79adfPoUnktv
 IM5HZ8POZwOwlsA8ypTHT+aEawyU0bwIo8SeMNHHFCeoPb0/K2B2ds/4XOXHMDbfs2EX
 YhU06iqTy4e+CkqVlaS4QsXMuvalkMrqQ3bxIyPDvmmny0E9J6QIXmt7lE0NWLBuV6pA
 VkzsHiurp2Z4IJvMW1+lMk+OgRoiSqLUK7+zAvIvEA70K1o73ffo4a50tmQbfRdgwzTA
 HokFpyfTliHvFxbQpfjvHTJ2JKr677vTjgs2kvSv7ttPmx8qqq7czWVwnYymCIh+YFUI
 1ZSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtpoFLX9dFXa1Pol+74IDd8wlRGM9r9rE+DOmRfIo12B8AOoGyzpTOXwyZVtVWoZ97xbMn5IDTQaSZN+udpGJVmOvEuTN5PU4mzUiuvxMd
X-Gm-Message-State: AOJu0YyUfQW/7L78z45y82ny2eBbwUOVFRXQNPInJNQvyq/HiAR5gdGG
 I6zdUnRjbo2dfjwUaElgvotER1kdTEFcihKesu7hibcB6TCkGKoA
X-Google-Smtp-Source: AGHT+IGSIYZ0XnvTKya7l899GJk/rCpQGsTezNi2GKDId5wCowIGk1MLv8BFbvHyGiVhfeUDOVhy5Q==
X-Received: by 2002:a19:e054:0:b0:511:79ef:529 with SMTP id
 g20-20020a19e054000000b0051179ef0529mr2474521lfj.55.1708034707051; 
 Thu, 15 Feb 2024 14:05:07 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7b54-ff00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7b54:ff00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id
 p17-20020a1709060e9100b00a3d11feb32esm945630ejf.186.2024.02.15.14.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:05:06 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 adrian.larumbe@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 stable@vger.kernel.org, Steve Morvai <stevemorvai@hotmail.com>
Subject: [PATCH] drm/meson: Don't remove bridges which are created by other
 drivers
Date: Thu, 15 Feb 2024 23:04:42 +0100
Message-ID: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
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

Stop calling drm_bridge_remove() for bridges allocated/managed by other
drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
drm_bridge_remove() unregisters the bridge so it cannot be used
anymore. Doing so for bridges we don't own can lead to the video
pipeline not being able to come up after -EPROBE_DEFER of the VPU
because we're unregistering a bridge that's managed by another driver.
The other driver doesn't know that we have unregistered it's bridge
and on subsequent .probe() we're not able to find those bridges anymore
(since nobody re-creates them).

This fixes probe errors on Meson8b boards with the CVBS outputs enabled.

Fixes: 09847723c12f ("drm/meson: remove drm bridges at aggregate driver unbind time")
Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Cc: stable@vger.kernel.org
Reported-by: Steve Morvai <stevemorvai@hotmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This issue was reported by Steve off-list to me (thanks again for your
patience and sorry it took so long)!
The Meson8b VPU driver is not upstream, but the problematic code is.
Meaning: This issue can also appear on SoCs which are supported
upstream if the meson DRM driver probe has to be re-tried (with
-EPROBE_DEFER). That's why I chose to Cc the stable list.


 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 -
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 1 -
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 3f73b211fa8e..3407450435e2 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -294,6 +294,5 @@ void meson_encoder_cvbs_remove(struct meson_drm *priv)
 	if (priv->encoders[MESON_ENC_CVBS]) {
 		meson_encoder_cvbs = priv->encoders[MESON_ENC_CVBS];
 		drm_bridge_remove(&meson_encoder_cvbs->bridge);
-		drm_bridge_remove(meson_encoder_cvbs->next_bridge);
 	}
 }
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3f93c70488ca..311b91630fbe 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -168,6 +168,5 @@ void meson_encoder_dsi_remove(struct meson_drm *priv)
 	if (priv->encoders[MESON_ENC_DSI]) {
 		meson_encoder_dsi = priv->encoders[MESON_ENC_DSI];
 		drm_bridge_remove(&meson_encoder_dsi->bridge);
-		drm_bridge_remove(meson_encoder_dsi->next_bridge);
 	}
 }
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 25ea76558690..c4686568c9ca 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -474,6 +474,5 @@ void meson_encoder_hdmi_remove(struct meson_drm *priv)
 	if (priv->encoders[MESON_ENC_HDMI]) {
 		meson_encoder_hdmi = priv->encoders[MESON_ENC_HDMI];
 		drm_bridge_remove(&meson_encoder_hdmi->bridge);
-		drm_bridge_remove(meson_encoder_hdmi->next_bridge);
 	}
 }
-- 
2.43.2

