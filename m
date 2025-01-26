Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1698AA1C8A6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1852610E36C;
	Sun, 26 Jan 2025 14:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K38BjYE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146AA10E053;
 Sun, 26 Jan 2025 06:45:15 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ee51f8c47dso4806714a91.1; 
 Sat, 25 Jan 2025 22:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737873914; x=1738478714; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FqNaVZFEEca3E3wz8Ju8ZljshuiNP61cQ6d6L0AnGGM=;
 b=K38BjYE2CU/MNlQibCXxWnPMj6Fxn0n0Q3vOFsznHCXPVbESyCpYuiXZ3lJcf46hI9
 4SGGK/kYbwqJSojjSSnTbmwuOqMv7t3WMROqDzwgPXagDmVtPLu5otHTtADnvEMmfyAV
 spFSEED1ncVnAwBl5Gu6AZ9A/zwlhuocZfdu1rfjtqnhh+d4OeeEYDcv+f6epPPlNNa8
 omlA5961PsRd6JSZcrLJOX+kYY4Nx7pNr6M+mnHIGOR8ujmVcLuitwUFSFTnbhqgL+Rr
 Dzs747UaBdGHqkWJsHHkE/Xw/ZHrPmF39JhbOn0c3nJ1LeSNsmVs6yg9SuUhwdUlGElr
 yZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737873914; x=1738478714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqNaVZFEEca3E3wz8Ju8ZljshuiNP61cQ6d6L0AnGGM=;
 b=AnjPOyVKPf1aHFVnNuC4wuBDPve4VuWyN4crKQbduLCYIrnDMVUv+UpNavcd2Vz02M
 Xmg0GEoSapAaHJHA7ZcCcKzwWQPeo7j8gTk+Q0GqIvMo6YIxwPKhXHV3XLZQHxfO5Ecs
 zp11gkfKaHLBiPnLlzLCk3dRXK7Q35fZc6jvMeBWTg4zVBRG0lQBMMrzwp0iFjK39XPt
 sJU+oYSgs8siG0IB07RbSeJ/OpbYlAY0DCMuhaZP3p9e1f6jqLSsdx6hFgO/1p6D2u8J
 mIKJ2O86zgG9Jz6A7rdwoHRder4DSddrCP60JEStmUHbd5iah2sTQRPxHdlPGQUnejwA
 S0yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUicCtTvhg/8aUg1HM2KusHgmAfM0eopqziwTzP4ryPUfLoBbtu764Rhp4axu/TG/0OZUjGvc5r@lists.freedesktop.org,
 AJvYcCWlGIa3k2AtVmwthWOt6X49KjhmzG1hX7IUGJJqlvLcJw00FerM0K2XL5jLKOHasUZTMrZ4a9R2aixT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbetCUDkXurIhbVf3VNoKMx45/lzCaiK9CrD8B/Kw3b+vS0O2h
 IGS+jLVw27UAnxD+asU2quzB+5cHn0YI++61HB9vxBRFN5s5Mkng
X-Gm-Gg: ASbGncthGAa4TCy6KF69fSnGkYnWXy/UwkNmLyMb//jx6kshQSDfbAPv9qk/geQWvpV
 lJRrmoo5DXRl7eEukReF68ltQYbkBjcchKCRzY7iao3EtUkyN4hdEHr3vaQRefrHmTCAIQoTz2u
 2PUOyvzE8+NwZKxys1N9lqbrcYNFz5RX4zJP9qgdePn9u0SSXTPKcI22aUeaXcx/N2HyC1qD9pb
 yRYHhiV3G6Ww+5p5fAT5koSh2Hy+xv1h2BTE+eB7em034q8yegjQYNhwEjkcsoZF7JbAH20Tv3L
 Xq7ovTOR/hPtq9r1wL3pq+I873GY
X-Google-Smtp-Source: AGHT+IFg7WVPs9aNmjLP+b1xdMjOuirhgOPLzTaNKIBZZkbsCXo6bvei5V5jnc7lQvWmvL9tsG/2Tg==
X-Received: by 2002:a05:6a00:4505:b0:728:927b:7de2 with SMTP id
 d2e1a72fcca58-72daf9eba1bmr60305593b3a.8.1737873914435; 
 Sat, 25 Jan 2025 22:45:14 -0800 (PST)
Received: from jren-d3.localdomain ([221.222.59.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a761134sm4680916b3a.115.2025.01.25.22.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 22:45:14 -0800 (PST)
From: Imkanmod Khan <imkanmodkhan@gmail.com>
To: stable@vger.kernel.org
Cc: patches@lists.linux.dev, n.zhandarovich@fintech.ru,
 alexander.deucher@amd.com, wayne.lin@amd.com, gregkh@linuxfoundation.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Jerry.Zuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sashal@kernel.org, alex.hung@amd.com, mario.limonciello@amd.com,
 chiahsuan.chung@amd.com, hersenxs.wu@amd.com, shenshih@amd.com,
 Nicholas.Kazlauskas@amd.com, hanghong.ma@amd.com,
 Imkanmod Khan <imkanmodkhan@gmail.com>
Subject: [PATCH 6.1.y] drm/amd/display: fix NULL checks for adev->dm.dc in
 amdgpu_dm_fini()
Date: Sun, 26 Jan 2025 14:44:58 +0800
Message-ID: <20250126064459.7897-1-imkanmodkhan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

[ Upstream commit 2a3cfb9a24a28da9cc13d2c525a76548865e182c ]

Since 'adev->dm.dc' in amdgpu_dm_fini() might turn out to be NULL
before the call to dc_enable_dmub_notifications(), check
beforehand to ensure there will not be a possible NULL-ptr-deref
there.

Also, since commit 1e88eb1b2c25 ("drm/amd/display: Drop
CONFIG_DRM_AMD_DC_HDCP") there are two separate checks for NULL in
'adev->dm.dc' before dc_deinit_callbacks() and dc_dmub_srv_destroy().
Clean up by combining them all under one 'if'.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 81927e2808be ("drm/amd/display: Support for DMUB AUX")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ To fix CVE-2024-27041, I fix the merge conflict by still using macro
 CONFIG_DRM_AMD_DC_HDCP in the first adev->dm.dc check. ]
Signed-off-by: Imkanmod Khan <imkanmodkhan@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8dc0f70df24f..7b4d44dcb343 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1882,14 +1882,14 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		dc_deinit_callbacks(adev->dm.dc);
 #endif
 
-	if (adev->dm.dc)
+	if (adev->dm.dc) {
 		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
-
-	if (dc_enable_dmub_notifications(adev->dm.dc)) {
-		kfree(adev->dm.dmub_notify);
-		adev->dm.dmub_notify = NULL;
-		destroy_workqueue(adev->dm.delayed_hpd_wq);
-		adev->dm.delayed_hpd_wq = NULL;
+		if (dc_enable_dmub_notifications(adev->dm.dc)) {
+			kfree(adev->dm.dmub_notify);
+			adev->dm.dmub_notify = NULL;
+			destroy_workqueue(adev->dm.delayed_hpd_wq);
+			adev->dm.delayed_hpd_wq = NULL;
+		}
 	}
 
 	if (adev->dm.dmub_bo)
-- 
2.25.1

