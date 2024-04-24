Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F28B0F6F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A7510F15D;
	Wed, 24 Apr 2024 16:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WnRxaVXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672DC10F15D;
 Wed, 24 Apr 2024 16:12:00 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-346359c8785so5866440f8f.0; 
 Wed, 24 Apr 2024 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713975119; x=1714579919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l7fwhYCByqsyxtduNgA8zx5Qp4wn8aktE/VYg2R/KyU=;
 b=WnRxaVXRwzTL2vzx2trbBtOaSY8zPIGsBCgGYtevakZKntlaMTN9AnqWFiWE5kD19g
 mQMZRRkjWdjJbJZL6mlfrcpnIZrKXzc1h/0z47J1AA0W03X+N+tTKa6N+hn0TAfCLF7k
 LTgTyhfmAG4RxYT+vzVE4jSqsmq1CoZQ3QBZcVo+JbcGe+zLSzNKvlqtT++CuXH1LteP
 nsNgs+ouE8WeXP19f2gdCAtP1RILf8iiTxqYvAWadfDxc5rpjPgEfyKDp0D2MFtVR8Wu
 xZmDb4q0lA08iJM4826m8RBuxNsn7wJo9dUCkL8pft/zQu/QM8zOIde4PnEbNe0Gav91
 SvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713975119; x=1714579919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7fwhYCByqsyxtduNgA8zx5Qp4wn8aktE/VYg2R/KyU=;
 b=sI4QlHOQFI4uTdD43Fcz/gpRwWQAUvt7eqyxc8d9zTfoKuyg2zkBtsG612ZNCqdrDV
 Dvd1Z/lEZlTi/KckSy0jovXEmjoeSp3JSz8ZZuDGQ+GrVbDdNnnMKbd6yKGz/KGALejd
 K8NatnWBgOa2Xn0BCoXLCRkVKs5Qh64SolAh0nR21d9qGzH22oL4TNTaNjh+jMACLZfw
 AAfrG40wQznoDcH4D8FhH9JnCnDnMl7CZUdAHDo7p1SJ4sz9QJ7hYrmFI4pf3g+c/aZn
 fWDr6ar0sS9QTFUKrpzFidZLT71/MvdDfjcsnSH2fJ7FXiSf+x70nxqhWKmT6seDZtb+
 226Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt3h91/4tSiqjp0q6PleX2qG3XcYu+T131QPErFdnOlEGFBH6WPnJ4b8EK1du6YGeIhY26vHsAEPzBzs5IC4b8hKOQVxxRUXr+HtxzpKgW82DE65EDzof6z9b/oNKqd4EyF8iIItwYf7sGQ85v/g==
X-Gm-Message-State: AOJu0Yxk4mpB2PIs0RU4wtxP5wZ9bcHeNro6BDGstOFdjeQXEY4I+ZaX
 Y4eOzC9CDKHihMhyzUFDBsq/br3IUUI3E7GusicTfQbRXFLA+TAI
X-Google-Smtp-Source: AGHT+IH3jYf42AlOaYiK+FEIyw3LbLPxAlyd2I+vNCGrces4wHDtdBSa9HS2eMuzoJpicBrPQ5yBVw==
X-Received: by 2002:a05:6000:4e6:b0:34b:3f27:89cd with SMTP id
 cr6-20020a05600004e600b0034b3f2789cdmr1584655wrb.71.1713975118431; 
 Wed, 24 Apr 2024 09:11:58 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b0034ae73a8b25sm9639884wrt.37.2024.04.24.09.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 09:11:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: Fix spelling mistake "PRORITY" -> "PRIORITY"
Date: Wed, 24 Apr 2024 17:11:55 +0100
Message-Id: <20240424161155.3946451-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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

There are spelling mistakes in a literal string and enums, fix these.
Currently there are no uses of the enums that got renamed in this fix.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 2 +-
 drivers/gpu/drm/amd/include/mes_api_def.h     | 2 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index fbe31afad1d4..44f1af6da21e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -111,7 +111,7 @@ static const char *mes_v11_0_opcodes[] = {
 	"RESUME",
 	"RESET",
 	"SET_LOG_BUFFER",
-	"CHANGE_GANG_PRORITY",
+	"CHANGE_GANG_PRIORITY",
 	"QUERY_SCHEDULER_STATUS",
 	"PROGRAM_GDS",
 	"SET_DEBUG_VMID",
diff --git a/drivers/gpu/drm/amd/include/mes_api_def.h b/drivers/gpu/drm/amd/include/mes_api_def.h
index bf3d6ad263f9..ed479575df18 100644
--- a/drivers/gpu/drm/amd/include/mes_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_api_def.h
@@ -54,7 +54,7 @@ enum MES_SCH_API_OPCODE {
 	MES_SCH_API_RESUME			= 7,
 	MES_SCH_API_RESET			= 8,
 	MES_SCH_API_SET_LOG_BUFFER		= 9,
-	MES_SCH_API_CHANGE_GANG_PRORITY		= 10,
+	MES_SCH_API_CHANGE_GANG_PRIORITY	= 10,
 	MES_SCH_API_QUERY_SCHEDULER_STATUS	= 11,
 	MES_SCH_API_PROGRAM_GDS			= 12,
 	MES_SCH_API_SET_DEBUG_VMID		= 13,
diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
index 410c8d664336..5b8fd9465cf3 100644
--- a/drivers/gpu/drm/amd/include/mes_v11_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
@@ -54,7 +54,7 @@ enum MES_SCH_API_OPCODE {
 	MES_SCH_API_RESUME			= 7,
 	MES_SCH_API_RESET			= 8,
 	MES_SCH_API_SET_LOG_BUFFER		= 9,
-	MES_SCH_API_CHANGE_GANG_PRORITY		= 10,
+	MES_SCH_API_CHANGE_GANG_PRIORITY	= 10,
 	MES_SCH_API_QUERY_SCHEDULER_STATUS	= 11,
 	MES_SCH_API_PROGRAM_GDS			= 12,
 	MES_SCH_API_SET_DEBUG_VMID		= 13,
-- 
2.39.2

