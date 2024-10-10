Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF009984D4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 13:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E5710E8D4;
	Thu, 10 Oct 2024 11:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNqlaOUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47D110E8D4;
 Thu, 10 Oct 2024 11:22:07 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c915308486so1044006a12.0; 
 Thu, 10 Oct 2024 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728559326; x=1729164126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JckSSufIviovUZkUcMEHSF3a41RUVzp568xffw5Iahs=;
 b=lNqlaOUspKJhYo47bjmk/cg8/unM7sJOtkDEhd/1HsARIV7hscIvKJMTUpAkfSzFeE
 dqLPO4UsYjSfaA4H0p6W9VElRSJSaeI7+AtEmxcT9rhvLp7SexAiaFkKLddwu0weH27G
 aei25UXzj7hoWaZmHDceDbdN8zc0L3j1z9QvHu/eXMF2smsqMZbdNEjdS5wsJ3/pOoQr
 c/wRg6EsustSXKnE3EG45sLY4rvwyK29ipWx94lRCI38g1hppeCReMY+4MK6UlZQEdqz
 pyc0EuWUuvxSOI+PYyMUpe8+Ljc99dmbNhgDjc8ki6CaI/2TsqwKWr/hryNRMY0/AbUw
 9wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728559326; x=1729164126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JckSSufIviovUZkUcMEHSF3a41RUVzp568xffw5Iahs=;
 b=VRisfb3He6gNf/R+bvG85Ikji0/OYgCiYEG+B86QVJ2uG7A2dRTZajOtCXktXS/jM4
 RjOMVjvQ0SC/zp5arHbvyXYkY58TCZ/M8RWW+tM0uU+oJCX1ewY5yaRkF/VcT5IMX8Nc
 b55Fq169SI+eXw2c8QEs2IKg77PEAahJlPlypZkSJAylpJJIRsCZ7boSAGDDXKJkXjyD
 axsE+lUj7/Xhlp+/9QZ6IEdVee/3LOPjhigMyFBcCz+D5pBhnIcnsBRoBXUHxpPBX7lK
 qCksQ4G6z+I3m1N8UD7xo9iE2cFTudry/b6k0XXdkCnahJHE+HBGAMUGANS4z54W5Luw
 l9hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGJbiT1uyjI4bbfdeJ5TIZHTxQytrdrQeff6xf2fewcdNX3T4QY/Ic3avogRRiOBRPxxnneIh/ug6F@lists.freedesktop.org,
 AJvYcCX2j5AoHOtOTrk+OT89fXr9WNub3GDs38IcY8r86QKKXtXtdfMbXqXZIXyEj7IsQubOoK/nz4MY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFFrcQl0/JT4SdczpvP9+L0Ou6xAlKPI+r+ORhq7Xus29St4cD
 IFV2EI34Qx2QSBDUb+KZYk6xTDDtAGOtsQnkvS/rP7qBu7GOCv4R
X-Google-Smtp-Source: AGHT+IE9jQYtbc132fpV9cXJCTAdP6bxnOpxNEz+fnN/RwAvvgCjaaXajnFV2/oUWVMdVi2FqZHy0g==
X-Received: by 2002:a05:6402:548a:b0:5c8:9f3d:d906 with SMTP id
 4fb4d7f45d1cf-5c91d5bd0b8mr3492737a12.18.1728559325850; 
 Thu, 10 Oct 2024 04:22:05 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9370d22fesm640154a12.19.2024.10.10.04.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 04:22:05 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Leo Liu <leo.liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: Fix potential integer overflow on shift of
 a int
Date: Thu, 10 Oct 2024 12:22:04 +0100
Message-Id: <20241010112204.636188-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
arithmetic and then assigned to and operated upon using a 64 bit unsigned
integer. In the case where the shift is 32 or more this can lead to an
overflow. Avoid this by shifting using the BIT_ULL macro instead.

Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..136a0c8d8c7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -357,14 +357,14 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
+	mask = (BIT_ULL(adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
-			if (val & (1 << ((i * adev->jpeg.num_jpeg_rings) + j)))
+			if (val & BIT_ULL((i * adev->jpeg.num_jpeg_rings) + j))
 				ring->sched.ready = true;
 			else
 				ring->sched.ready = false;
@@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
 		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
 			ring = &adev->jpeg.inst[i].ring_dec[j];
 			if (ring->sched.ready)
-				mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
+				mask |= BIT_ULL((i * adev->jpeg.num_jpeg_rings) + j);
 		}
 	}
 	*val = mask;
-- 
2.39.5

