Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D112E8A462D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 01:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BF510E795;
	Sun, 14 Apr 2024 23:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="fz6VLLod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19BE10F518
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 23:39:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56e346224bdso1885321a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1713137977; x=1713742777;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QT+4H6LMJlz+8DH7pQ8tCzWtRow/zNF+rdLqCVP9iDo=;
 b=fz6VLLodRvtrWGC2zn7YaIEBPFK92Ux/4ojP+dlOhmT102DUgwjixxhbzD/d+m2J7a
 mppX0Txv/UuDQ5DwisWHOXSo6HTn5bJql9e8zbzvAeRlch5hieo2Ai0aMNKnFBGH/Abb
 +edrYpPmY1R7OGzBE3tICLC2e4C6Yu+PA7XGE51rSjreOrhPSj+A8/4TJLaCKi5rzOnq
 D1ufCw12Z91IRnNQw1vN+6N0tBKJPx4ktRBoSYqGd1d+iSB8Evwc1USYtzYFgtxondDK
 U2eLe+Nt/3d/jbNA2pW5bu8IL/8ZHm2eMhesYNIhH9jQVUzBuUOhFpBWwsgAo9MaqDvN
 h0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713137977; x=1713742777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QT+4H6LMJlz+8DH7pQ8tCzWtRow/zNF+rdLqCVP9iDo=;
 b=GiecdJVFORwUVgyUtDf/3ftCK8+x0qY+3Uh/Kh44SK5iX1Pb5ziPQ0V93LVyOJLXyG
 u1yHJwlR8LW6/U0YFP8n/rzx3mG1ehi2mYEElGBtI0ejd8rdiv58JZRAfZMckKKMBVdo
 11vWY/A4RTMGdrv4iLsWCiTlI84UTUna+PeboZ7ycXkfsPG6UEDNNUiAf11ldBLH8JZJ
 pMNbOtiVvIgpDamKPTy8jOnYni1ByWU/IjY+BRTMUiLEbS3gXTDLrBzbpXEzPHaIt1dt
 gOfkGxPd1W0IOvqoRJbUDjUd9j7frlrYV+XzB00g1xfHpWATW7Uz3e1GIeRk7q1jrBav
 o4Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPi6w0QPr+FCAFqFI/+FE98bqp/YpD47+enhqff+nBgQo9HXdrmq8p2uVWqRNM1OaqoWy9Eu2OO1RV+Tauumjg6btHU8JKJIOmc7uTq3Gz
X-Gm-Message-State: AOJu0YzWLhLyyzwoSAFlAYCW1S5Qa5cE1MpifCGk0zJ7VkS/1ZfT+0kK
 H/pd01jhVrX1dKbcqUUCmul1NGZoBlYa3krZjHfJoeH79Jhvt9yAKINnLVxmvUM=
X-Google-Smtp-Source: AGHT+IFb2HPMbxbzo+Z0wMa+oIFoQ5KEgnlxWzihlJ20RFpTeq9w5TDvQeaOwMubtpEelzwV72ysew==
X-Received: by 2002:a50:d7d6:0:b0:56e:e76:6478 with SMTP id
 m22-20020a50d7d6000000b0056e0e766478mr5380764edj.31.1713137976751; 
 Sun, 14 Apr 2024 16:39:36 -0700 (PDT)
Received: from debian.fritz.box. (aftr-82-135-80-212.dynamic.mnet-online.de.
 [82.135.80.212]) by smtp.gmail.com with ESMTPSA id
 d24-20020a056402401800b0057009a23d4dsm2495701eda.95.2024.04.14.16.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 16:39:36 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/amdgpu: Add missing space to DRM_WARN() message
Date: Mon, 15 Apr 2024 01:38:39 +0200
Message-Id: <20240414233838.359190-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
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

s/,please/, please/

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7753a2e64d41..3cba0e196ca8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1455,7 +1455,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 
 	/* PCI_EXT_CAP_ID_VNDR extended capability is located at 0x100 */
 	if (!pci_find_ext_capability(adev->pdev, PCI_EXT_CAP_ID_VNDR))
-		DRM_WARN("System can't access extended configuration space,please check!!\n");
+		DRM_WARN("System can't access extended configuration space, please check!!\n");
 
 	/* skip if the bios has already enabled large BAR */
 	if (adev->gmc.real_vram_size &&
-- 
2.39.2

