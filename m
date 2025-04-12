Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57BA86B73
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 09:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6310E18A;
	Sat, 12 Apr 2025 07:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nb0hhM+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264FF10E18A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 07:00:57 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so21202855e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744441255; x=1745046055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QUhRGZgWSR7a5HDQ/6iMHlL/ln4asDDzoYvwsKfR2to=;
 b=Nb0hhM+kjpCCkfORC6PNonx/Nz+OVTdBCY2hFM0drOXGypxdOxl4NNuhFucABPzcTT
 LL9Wl2pFw4GVpWKoVSqxPFA/vT5t+MorlxX7fHv1Guf8BqRXpkxJ12GPQBgScEbQNjNR
 j13jWLqE+yBP4YzoxbrZSqYFE6Opd49k3qouGi6dZPSeObHd6j2pEf6EkkNVEJ7YuOgh
 GoclJqg2KkhgUsl1N8moNze9HEkrnQ4U++uOgWycYTf9FRWl/L9CDmynFmZHbxdPQ3HH
 UZRotbeFbBc5e2qhimkxIcLolOfsxLSPcK7BUlOHJ4NTQdsY7WE4uuH6q+8Ae45+zSTk
 vdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744441255; x=1745046055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QUhRGZgWSR7a5HDQ/6iMHlL/ln4asDDzoYvwsKfR2to=;
 b=wNR1r6oja7p8JiCgJFKl2pSmxCg+9KnwG+Q2ehRyD/oQ7EhSzmGpcpnaGjMkJDroIA
 72fgLzxfdKTumHNweGlpo8NNWcc9fucbxh3VPfHs+twewOMy52DomaTUUBOmm2aF4eAb
 voU9bx2PpFTgchxtVo4gdlzmKRUZRotCn/CMnin/HZ638GaXhRoiflubg2joAZUOCE16
 tUTeTLz7m44kFGOkhPZmZ2DEplEtghEToF2OX5o6bG6TrAWmNhxQRzXxKT6R7ihJXg01
 v6QVBrChzCxK2ofCdEI2r7kYEzngqm6F+IHx36z1UXpw7givN7dWMziYRe9LqVPtxf/L
 uiMg==
X-Gm-Message-State: AOJu0Yx4Ylf0iVj4+N4xDeRZaiT8edeE81qn34cedSMes0C7GHcbCk90
 4cmuVS0WDhjTiz/qx7g3CCiE0c9eQE7DePR8pG/XzVkDGEfABJjj
X-Gm-Gg: ASbGncsTJMbHSN2BfatxYJbr9FepO+76OP4ql8CiLQxENYqkbvLDmkLMyFFS31S+8uE
 ze6NwwavrHvhFzcbJDPW8fRMpePlyjf2CEfBZt703Pyox7VMz1Dgvhqi0bNcTrEP70vJ05R5IjL
 gt5x0cG3sGGamX3Umt1lKjsGhkPt9Z9tMBTI1lt3G6UZdGVwj/u1anrLdI50/yowx4yATvqXHd5
 SftrUzK27l5lqARGpYQ+MFqadyOMLRekE8BR9TVaRBDH81E53eu76NhT7y6tOT2cfOdj6Fq7GLF
 BvKPTE6NcZOEMzdRXBWx24JFKoNl1dvnMnM8VqLrUTXWHwu1PX23G/yIEvhUT55vMuEiNyTCht+
 exppziQu8MD56wZC/eYrMMzCuXRKIq3enSneUCyG+rjE=
X-Google-Smtp-Source: AGHT+IErTOfdmVU3EKuPUo3Ppbpde7QYvJavdfbvObKt8eiHhHZBg2K6Hm/AdPV1iYx6YJippo3mBw==
X-Received: by 2002:a5d:584a:0:b0:39c:30d8:a80 with SMTP id
 ffacd0b85a97d-39ea51f52fbmr4245757f8f.19.1744441255310; 
 Sat, 12 Apr 2025 00:00:55 -0700 (PDT)
Received: from localhost
 (p200300e41f1b5e00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:5e00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae96c02esm4170184f8f.23.2025.04.12.00.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 00:00:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
Date: Sat, 12 Apr 2025 09:00:47 +0200
Message-ID: <20250412070047.6725-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Recent generations of Tegra have moved the display components outside of
host1x, leading to a device that has no CRTCs attached and hence doesn't
support any of the modesetting functionality. When this is detected, the
driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.

Unfortunately, this causes the following errors during boot:

    [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to register client: -95
    [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM client; error -95

These originate from the fbdev client checking for the presence of the
DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
not support DRIVER_MODESET this is entirely expected and the error isn't
helpful.

One solution would have been to conditionally call drm_client_setup()
only if modesetting is supported. This seems a bit redundant, however,
and could further complicate things if ever any DRM clients are added
that do not rely on modesetting.

Instead, simply add an extra check to ignore this expected error and
skip the fbdev client registration.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index f894ba52bdb5..8c8552ed912e 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev, const struct drm_format_info
 
 	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
 	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
+		if (ret != -EOPNOTSUPP)
+			drm_err(dev, "Failed to register client: %d\n", ret);
+		else
+			ret = 0;
+
 		goto err_drm_client_init;
 	}
 
-- 
2.49.0

