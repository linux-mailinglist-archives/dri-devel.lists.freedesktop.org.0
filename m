Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B47868EA6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C7410E488;
	Tue, 27 Feb 2024 11:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SqFslsJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD5B10E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:20:44 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a3f3d0d2787so418964666b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709032843; x=1709637643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pnXM6WWQcg3IDBJByAfsL/lgbgu+x4Q2+A/bZxCbEqM=;
 b=SqFslsJGo99Ug4qdd/+5hvuTX9wSeyy+c//DhXbcA9iRO8qgFENfJoHTj8JcdLFtA1
 2rpW4i7mUItIhGF9uGJPmFwLShQB5QfoqF5SNizrmKas7mtAeqvJ1EFBPMEkcg/3Ye2E
 1WEuW9CaQVfA+8KJHh6SO/79zBX2sJh7pjDzNwbSe+Ri3zvAjxou3uWWKtYx6mL0VFkH
 UarLKhqdY2PQdQPmdeozDRNS7sHTlQYFBOkAadlAV8E0di0YTH74Tg3MFlBkrF7wZ8PK
 nsGu5HvV16iksdSqyO6bjlAg9JB/HA0yQq40kk9I4+skdlTaZSXE8XMcuwxGPQNemrjB
 2LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709032843; x=1709637643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pnXM6WWQcg3IDBJByAfsL/lgbgu+x4Q2+A/bZxCbEqM=;
 b=mvEonDSeFw83gRc7YOnq2GRl82HwpLK++QLsbIBwpZlNkJ+hW8puQMdFwBRu5iewjJ
 IU9y+cvwwxaXMEQ3TfmyWIaVxTJrbL4//VO0wPxOQeRSs0gY0m+XcKCf6+NdmlAq5RQP
 TaAXZxXPGVq44gxfm9ogzSrOhR5k/gqjY/suFE8rtzb/riIZE1kS4EZSCK1LXHQsAhYF
 0pftHCyMledAdxNKj8+0+0E8XJDcaHsr1W7ri68sCg6aOiVOPoW24lduqXlldaj9jJLA
 ae8vceA1uwJAOSq0YwxUiUk1y5BflC/wF+g8+gBE3mRWbcwO6AzHF1RxLjxVTNbqmbEp
 GZvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDyL1vRd87IGf+/r0RV/NWcRcLqTRXikry5OyRVRAccii/Fp8OL56TjFsGj6H/U+F/iWE2NCcf+obETmV6FOC66yMPHg636IKEksM1AHR+
X-Gm-Message-State: AOJu0YwP8qJ+hPvmBOE/8Hag1m4+/nxxBu1PTMGlrXptJhEHej0p5KTu
 PWVStcOX+3oGSBzAtYHGo4HTNkgNyuWubAdTurByRaAoe3x6FKXQ
X-Google-Smtp-Source: AGHT+IEGsRkSDIDre17ll6k4QVQtq1+8FNwawVjXA29IRqJ9XB/BZ3ve4EFN6atKrBPEtfW0wfA2KQ==
X-Received: by 2002:a17:906:1d4d:b0:a3e:272e:7b98 with SMTP id
 o13-20020a1709061d4d00b00a3e272e7b98mr5997598ejh.40.1709032842637; 
 Tue, 27 Feb 2024 03:20:42 -0800 (PST)
Received: from localhost
 (p200300e41f222300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f22:2300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a17090634d000b00a42ec98b9afsm654234ejb.158.2024.02.27.03.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:20:42 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Remove drm_num_crtcs() helper
Date: Tue, 27 Feb 2024 12:20:38 +0100
Message-ID: <20240227112038.411846-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
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

From: Thierry Reding <treding@nvidia.com>

The drm_num_crtcs() helper determines the number of CRTCs by iterating
over the list of CRTCs that have been registered with the mode config.
However, we already keep track of that number in the mode config's
num_crtcs field, so we can simply retrieve the value from that and
remove the extra helper function.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_crtc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 6795624f16e7..82c665d3e74b 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -107,18 +107,6 @@ int drm_crtc_force_disable(struct drm_crtc *crtc)
 	return drm_mode_set_config_internal(&set);
 }
 
-static unsigned int drm_num_crtcs(struct drm_device *dev)
-{
-	unsigned int num = 0;
-	struct drm_crtc *tmp;
-
-	drm_for_each_crtc(tmp, dev) {
-		num++;
-	}
-
-	return num;
-}
-
 int drm_crtc_register_all(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
@@ -278,8 +266,7 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 	if (name) {
 		crtc->name = kvasprintf(GFP_KERNEL, name, ap);
 	} else {
-		crtc->name = kasprintf(GFP_KERNEL, "crtc-%d",
-				       drm_num_crtcs(dev));
+		crtc->name = kasprintf(GFP_KERNEL, "crtc-%d", config->num_crtc);
 	}
 	if (!crtc->name) {
 		drm_mode_object_unregister(dev, &crtc->base);
-- 
2.44.0

