Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D9861511
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BDB10EC45;
	Fri, 23 Feb 2024 15:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EL2vyhal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B6210EC40
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 15:03:40 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d23d301452so12314021fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708700618; x=1709305418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bsmjM6WwTBzUeQ523EB+ChNwuteUkHGzR+sENItSXHQ=;
 b=EL2vyhalFgt5md/WO8+KVDEzMLjnSTeQY2eFhr1LmsDb52v5qj2iOtXbEdc7nNjwlt
 y7wywEHv/2b1dfm24ymR8SbhWvXr5Q69Xw0fkz1xCppq4vm69mZShGsTClPoa+ikA4BB
 DMhnciZWy4xkyiompC8Mf9Syo1OZ1mdHWut2tF/g/CTZhj2mCwXdZ6LQuL5ZBZWi9KAg
 m9olnHq91AbYVpStRluZOEHw38CPGb3vTBykPTyyCsx8LqZx6MOD2fG4/b2m2smGZE0y
 TGF+wVSP0cgcmIKd7Yb5IfWe3P9hjGz+GghQwiSUouIZhQICHz6/AaeQgSGG2Wdmh7v4
 nQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700618; x=1709305418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsmjM6WwTBzUeQ523EB+ChNwuteUkHGzR+sENItSXHQ=;
 b=C9YW+otWV/92RbwRi5O/ZQr9jx6vY40qjDT5OHSuRQbwOP3PkwU5u3ABiU9Vc7ar2R
 H7NKH6bOSJ4+KLWBLVbT7ebRYJEvq/u6HMBSvvPC22ujWwv950biSGSr5lrGHrLyh+kK
 pJ8w50/xXQgLqjJo7GL2iLLNw9hSZNPvtgcfTRPnIXcdVpdhPzQENvClGILyHKXBrWVH
 +ERJ0RFNFgUjz7RRT+/gfhYLQp8pvCV+Wb7DQFcpq7EJOmFv7RjAohbuo78XkKLDSM6C
 Fe/aanrek7073LTgeQ5NBSpaVMmvgdPp9tKiUbm9o2cmqk5YGNHR/I/zlwxSwcYGs+ZZ
 FWcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvJtWWLPZ7THE+sEhmAZfnlL9EaYinC8IPiAKp5+ZMg+Fy9RYibfka+uXXzvrvJzQJKKF4ij4LEo1KMZOTDw1/OCiIdijWVvDt+7uAV9PI
X-Gm-Message-State: AOJu0YwnwDrPTnzt6rBhiuHyuIRutebW2QRa12p2MbjCy5xM+N1ltC58
 XTHkOP31G7vkAX4eXGRMaQEB4v4J4svXyT4RDHociIw2kVFbkPUb
X-Google-Smtp-Source: AGHT+IExcV0O/a9N0xbqYE77VwYcfiEtYc4dhxRdq89w4QTviBrOCekRLjxlKjQUx5n0OgF07p6nPg==
X-Received: by 2002:a2e:a543:0:b0:2d2:31a8:cb12 with SMTP id
 e3-20020a2ea543000000b002d231a8cb12mr56930ljn.49.1708700617383; 
 Fri, 23 Feb 2024 07:03:37 -0800 (PST)
Received: from localhost
 (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a05600c3ac900b00410cfc34260sm2705535wms.2.2024.02.23.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 07:03:37 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2] drm/tegra: Remove existing framebuffer only if we support
 display
Date: Fri, 23 Feb 2024 16:03:33 +0100
Message-ID: <20240223150333.1401582-1-thierry.reding@gmail.com>
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

From: Thierry Reding <treding@nvidia.com>

Tegra DRM doesn't support display on Tegra234 and later, so make sure
not to remove any existing framebuffers in that case.

v2: - add comments explaining how this situation can come about
    - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b1e1a78e30c6..2e1cfe6f6d74 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1220,9 +1220,26 @@ static int host1x_drm_probe(struct host1x_device *dev)
 
 	drm_mode_config_reset(drm);
 
-	err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
-	if (err < 0)
-		goto hub;
+	/*
+	 * Only take over from a potential firmware framebuffer if any CRTCs
+	 * have been registered. This must not be a fatal error because there
+	 * are other accelerators that are exposed via this driver.
+	 *
+	 * Another case where this happens is on Tegra234 where the display
+	 * hardware is no longer part of the host1x complex, so this driver
+	 * will not expose any modesetting features.
+	 */
+	if (drm->mode_config.num_crtc > 0) {
+		err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
+		if (err < 0)
+			goto hub;
+	} else {
+		/*
+		 * Indicate to userspace that this doesn't expose any display
+		 * capabilities.
+		 */
+		drm->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+	}
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-- 
2.43.2

