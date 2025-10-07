Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28348BC2E4B
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 00:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEEC10E0F3;
	Tue,  7 Oct 2025 22:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WvyH8B/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF5B10E716
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 22:46:03 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4256866958bso3003933f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 15:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759877161; x=1760481961; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3pQQY2keBFswywTklmwxwyGGVpvzk59ZMACKy3TjyoA=;
 b=WvyH8B/eMRguMiSUiNHuTOhuiMctOqFVPJKQEbOs/YxXGZMaXLSn3OIHtUYiBBQ5G+
 jff4k9jAK1N/MBWGwGPSyHuOaxagXRgoAs/HIaQN3qW7tL+DU6fVyHjRX/ArTXMarFbc
 6iyTfOmobTdoQitqgDbjcNafZxhFYkWuWiOWF8G6TJn65T4x7SnbbFhoLM7RAgZR64rs
 dlGFePP/tmn7de4PrBOQ4MqbeBSm1tobbfQukcuDFzyPsKxES8u7IQswKGvOkrs0acxT
 8OVxv6eXUGGqW2oBE4Mt7PnJihm9V32kbXjuRUnyPYFfujfzBWipQuhGK3bVqE0iPhDd
 iMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759877161; x=1760481961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3pQQY2keBFswywTklmwxwyGGVpvzk59ZMACKy3TjyoA=;
 b=sJlOpdP8U7P8Ljvhp9WPLybuP6IZ+vJn/mhiKZ31bagljCGNhfrn62Sc1KhGV79RVf
 W9dxIyf5DwFEq3zwpRaDRUOJC5WlKJGrtvE8R/n9TVBqFgCuRjSPOtVE1+Gmut5910i7
 SesszkzaipFoVFRNrug/ud3bg8erVvyDXoyFeGlI4srVW5PAuO48vu/SBkpmJtaIMoEb
 VsaRGcVh4cI8lzf0qSRHhT7amT+scyU6rXIkCvHTUExpqvQViUMq0Zlc1ckaOFetsWVT
 mq6SOk7KPASlRgsKn+QSZ715q7NMSCDllV3aqyRPGKD5HuRDNYBuxRmLFMhBt7txLEk7
 aDlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9EwVtCsiu36yjbl2ws/U5KUhJ9iuYDVG/Ej54W6Q9jocpBNjqSZv2HYEbq1GrDj+8+HVfrUMEcn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze2KJSspVI10rJyM73i9Sk7/Ozq2dq8FHGLjMnPy8RHHc9c6Fe
 rqYPih1iKAN6RlUmlba3q1uPDdY6h9bhAaw2NddfI86DytMq8MKUiriJ
X-Gm-Gg: ASbGncs2Em4l4G6Jt9HaKHLpTThRM1oE8zAaZntxiseoetdGYM7DGmnFFzAxWb3zhKa
 UvyMe6oz9y/CypCb0LSpEY0FWB3SxQn48kYZlExgwWHCQTopyfnyn1PstvmbyAMwsU7zOaDDXNa
 fisUl6lgKb5ozuOrNoj/HHnPOu8hGWRJ+TyOG22PPq1Ect4OhgoMEq4EqEmW2iq+gTXY7RR0gsa
 +qjeWidrbQWlowZiBzBNq1oGqBUaMMBxHPhBB3mnPZJow5N62Ar7zLfAEnYFdJJopUbgh3lzm2/
 LkbYp7zBbf7dxM3GruaKXHOcyjSH8zPAjnP6NVqd7Jp6AcK2FZSIyyOT0U7jCBY0LqxYq8av6sU
 +EjbvzVHVlVADp2KAivzJRf62ZZvuG6TXVndHsSSg6NGhSWtvgQabA0Hs0M1ta3c=
X-Google-Smtp-Source: AGHT+IGpUoeWYYfKgtD3wk2UP4YLDCFnN42FiNw3j98CkNvoabTKCMcEKd8fM1WEcK58BkjWgmbiLQ==
X-Received: by 2002:a05:6000:1a8e:b0:3ff:17ac:a34c with SMTP id
 ffacd0b85a97d-4266e8e46b1mr536653f8f.59.1759877161371; 
 Tue, 07 Oct 2025 15:46:01 -0700 (PDT)
Received: from ekhafagy-ROG-Strix.. ([41.37.1.171])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f01a0sm26925335f8f.48.2025.10.07.15.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 15:46:01 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Yilin Chen <Yilin.Chen@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: eslam.medhat1993@gmail.com
Subject: [PATCH RESEND] drm/amd/display: Initialize return value in
 dm_cache_state()
Date: Wed,  8 Oct 2025 01:45:44 +0300
Message-ID: <20251007224549.87548-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Initialize the return variable "r" to 0 in dm_cache_state() to fix
a potential use of uninitialized variable warning.

The return value for this function might not be a PTR_ERR, in casse if
condition fails. In that case we ensure predictable reutrn.

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8e1622bf7a42..6b4f3eb9ce48 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3115,7 +3115,7 @@ static void hpd_rx_irq_work_suspend(struct amdgpu_display_manager *dm)
 
 static int dm_cache_state(struct amdgpu_device *adev)
 {
-	int r;
+	int r = 0;
 
 	adev->dm.cached_state = drm_atomic_helper_suspend(adev_to_drm(adev));
 	if (IS_ERR(adev->dm.cached_state)) {
-- 
2.43.0

