Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F8E9F23B8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E9F10E087;
	Sun, 15 Dec 2024 12:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mE3QPaCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5A110E087;
 Sun, 15 Dec 2024 12:29:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so5980990a12.2; 
 Sun, 15 Dec 2024 04:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734265740; x=1734870540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bHWJV/LD4gPHZZNcXt29U0PATFI+oJ17IUeLcy4IdyI=;
 b=mE3QPaCFU6vw5wuG8j1PawAC5/h3/286hPfWvobkLggeH2zTMqmNDz2iQWf0rZJNnY
 ZAvkqLa0LhcLUXy9uSW9NG/cEIDtuW38mhfIMqEoJhH8Dexca3zWkahYvnFW7DVo5Th2
 3oe6b/YE6eNFTIdXmHBW6XBU2G6ASidfSNB+muB2Q4CfYkjH1KUSD7X8v/8UNN2uVr4o
 H+B+KgABuZAOiXxX0dfjTLgOKrwgdVyBndOPdXAnBROf4zglm860Rsql0N0ET+bO4IAQ
 GXYwtvODqJFoyStWwS1xnXAsFS9BGmK+6KacHyWBo6mL+/NR6O346Hc9qyL/dNoNNF8J
 +Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734265740; x=1734870540;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bHWJV/LD4gPHZZNcXt29U0PATFI+oJ17IUeLcy4IdyI=;
 b=TyETxFAeAJ1C66JmdV4oe3WW4PPgb8p9rjKHntyavkA8WhELAMgHDsr9jmASBegLcn
 /HdX01pziXLAdGQ3zqZIzX8jbOsTv08tTsdEc6Ner3onl2W049x+pEsu6lyKDJr+E9gr
 el2v1ApJ81oy5pthL1gWWWunxs1g782xbf5V0Jwr7Op/DHydkyro5a85bkxT1sc9wovI
 Jq1+HLCeL/IzaOrZGmdipDtxrCNh0/U3ELNKa7lyyDS4rXMFicCwxVax5KR8efNXIdA9
 O9cQMtT6BsPhtfwRGNfD4J47HHZ24W0RuKDyv+yjb3s6xUwVkPJj9pD53vUp+ztaNmL0
 w3TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp3xq75mf5r6uYPUAMJsXGhU0x8Xuk+LlYBDYgbPGXrstyr0YokWYAT/427IyzETRqRuVsqiZ0@lists.freedesktop.org,
 AJvYcCWLJ8IQ75YElxQSDxAxluSAuLjQgQ4w7pDK3HuE5QAUOL6HL6yMnE7ZDcuvFCLeUiEQvcCrarKkp9Sg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBR+zYuhHZq2P/hEzBgcKcuPp7An16oDiC1NfxvvEo9Jvmnfyv
 MLhz7aIYozyGcPp3S+4qGdqX8Fps6IjGdzbDSrUqVB5t0vOlXGrt
X-Gm-Gg: ASbGncutlcC128kCY3GT4ppAkSVojCpZ6iBznPU1T1T7RDkmEdn/j3CAO5arDhxLLZg
 90ST4WCt2wrnr2CGEZWkAKX95ihjqoxhR+bIDOxFnRBcjuE5/q2n4aTKQ0GOI8riQyQbcDr/BV9
 CipD8qFZ1uGbwHjnPhoF92ixTZzZ9bN1TAVHLJtOmnEBTSVkWnhHkwBZ7B67sqSgkWcTBz3whnj
 Vt648f3pfy7oBS/O2mTaqIoR3FxS11pA5LuBK5XXZhT+VR5ts/I4yneKktjULK6YLA=
X-Google-Smtp-Source: AGHT+IFs4h7kFQ1tBETm2pZSMvLI9Eb//palqWRPKxDQoSymF7Pdlu6jW09S5JdbUeT9M+3q91Focw==
X-Received: by 2002:a05:6402:348b:b0:5d0:8197:7ab3 with SMTP id
 4fb4d7f45d1cf-5d63c2e5275mr7998238a12.3.1734265740122; 
 Sun, 15 Dec 2024 04:29:00 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ad187dsm2055327a12.28.2024.12.15.04.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:28:59 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, srinivasan.shanmugam@amd.com,
 Hawking.Zhang@amd.com, Jack.Xiao@amd.com, lijo.lazar@amd.com,
 Jesse.zhang@amd.com, tao.zhou1@amd.com
Cc: Karol Przybylski <karprzy7@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix potential integer overflow in scheduler mask
 calculations
Date: Sun, 15 Dec 2024 13:28:57 +0100
Message-Id: <20241215122857.927606-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The use of 1 << i in scheduler mask calculations can result in an
unintentional integer overflow due to the expression being
evaluated as a 32-bit signed integer.

This patch replaces 1 << i with 1ULL << i to ensure the operation
is performed as a 64-bit unsigned integer, preventing overflow

Discovered in coverity scan, CID 1636393, 1636175, 1636007, 1635853

Fixes: c5c63d9cb5d3b drm/amdgpu: add amdgpu_gfx_sched_mask and amdgpu_compute_sched_mask debugfs
Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 69a6b6dba0a5..8fb6c5f6a060 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -2050,7 +2050,7 @@ static int amdgpu_debugfs_gfx_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << adev->gfx.num_gfx_rings) - 1;
+	mask = (1ULL << adev->gfx.num_gfx_rings) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
@@ -2078,7 +2078,7 @@ static int amdgpu_debugfs_gfx_sched_mask_get(void *data, u64 *val)
 	for (i = 0; i < adev->gfx.num_gfx_rings; ++i) {
 		ring = &adev->gfx.gfx_ring[i];
 		if (ring->sched.ready)
-			mask |= 1 << i;
+			mask |= 1ULL << i;
 	}
 
 	*val = mask;
@@ -2120,7 +2120,7 @@ static int amdgpu_debugfs_compute_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << adev->gfx.num_compute_rings) - 1;
+	mask = (1ULL << adev->gfx.num_compute_rings) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
@@ -2149,7 +2149,7 @@ static int amdgpu_debugfs_compute_sched_mask_get(void *data, u64 *val)
 	for (i = 0; i < adev->gfx.num_compute_rings; ++i) {
 		ring = &adev->gfx.compute_ring[i];
 		if (ring->sched.ready)
-			mask |= 1 << i;
+			mask |= 1ULL << i;
 	}
 
 	*val = mask;
-- 
2.34.1

