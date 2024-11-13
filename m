Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8999C6C0C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 10:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F5410E6BE;
	Wed, 13 Nov 2024 09:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="As+9LKiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B01C10E6BE;
 Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso59598065e9.0; 
 Wed, 13 Nov 2024 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731491630; x=1732096430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=elTTjq7EKHhc/rmuU/TuzD2ilhBd6L7N4XdE1BEkYcw=;
 b=As+9LKiW0VwWd11UUBD25rLnoffZyn20/N1u+yJbXDHIuw78Y/WbslXeAjZyMVFNZD
 eh4DLEks7RCObjZiVSHviI4gl/NgmRKk8C9Bst/BxECJlQMEJfp0gjiQOG/A/H4YRo6+
 2sQoHaaf5Mc1NUyhDM5uv6p/xCuSLFrKYohivO7ZuZHwi9y5pVKAB4Y5CA3a9B4Sa6nu
 gwcG6/O/3SOp0yJV1fJ5BDzj01C2M0ks2iCJRRVCPaE/hjFtab/KYossrLuk8csfOkGj
 ItvK75rdiyWtM2jhAkVP0ZfduYq+2MhX9JGwwq1InNXmal/2pMNH6lSSawij4pEcydJ1
 igAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731491630; x=1732096430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=elTTjq7EKHhc/rmuU/TuzD2ilhBd6L7N4XdE1BEkYcw=;
 b=j1OvS2tjya9N/bxJ9rt2mhDqWqr0+sznts/5KZqor+D4G3cPA8zEalpKs+CPRIV2Sm
 A6lYlnMJD9mvAeb+P3YMM+tvt31C7M43V244Qn8M9lIbz6qj0fC89avQ+bg1tk+RI54J
 FvhqWuGU5T2HfNus8Ch/J2uVG5YRUwiebASuuKbmm4K5kHCAcks97CcUiGUEnASPH3mE
 7ZH84KTklWDVKFGxm+M1WbzgyatFkgSsjWK9HrKaY8NWBv2zM8yV3VCX+lkVB/yjtx+d
 bD68GcLsQvI46NBOIb1s5ztX3CdjYdSo0MnTRdsGKeTcvNNzaliDeW0VsugrjNmHIYoR
 TT0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU18xFBhc+faxwTM8OB+0uEpmqhhvqpeNHtdm7XL4NaPBkOBfhGHpq0WTzxArmb++/YiwI9+Ka4@lists.freedesktop.org,
 AJvYcCVDXR+onekogd7INdhQKL/9EbNIdPRaqjhJH7AfoaXPqoovp9DsPHxMflkbs7KVIdrYEWUOogsxI6If@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc3dEtOsK85WjlyAkJZ4m5rZGAW/xZjeAgovVY7nOM3YxhXsUb
 eMxgekJoFbgfjh93omfprLmBIo/WeySjuLbXaSXD9XpdTJVTnhra
X-Google-Smtp-Source: AGHT+IHJsGszYhCG9sKul2LVAcQekuyWfmALrzVcIaIonAHypoPW2E58zCZu/ukNnLmrCe/epmN0Lg==
X-Received: by 2002:a05:600c:3ca8:b0:426:616e:db8d with SMTP id
 5b1f17b1804b1-432b7509717mr151967305e9.15.1731491630125; 
 Wed, 13 Nov 2024 01:53:50 -0800 (PST)
Received: from localhost ([194.120.133.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d552c89bsm18201955e9.38.2024.11.13.01.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 01:53:49 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/amdgpu: Fix spelling mistake "versoin" ->
 "version"
Date: Wed, 13 Nov 2024 09:53:49 +0000
Message-Id: <20241113095349.1161044-1-colin.i.king@gmail.com>
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 9c905b9e9376..feecd099cf86 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -646,7 +646,7 @@ static int mes_v11_0_misc_op(struct amdgpu_mes *mes,
 		break;
 	case MES_MISC_OP_CHANGE_CONFIG:
 		if ((mes->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) < 0x63) {
-			dev_err(mes->adev->dev, "MES FW versoin must be larger than 0x63 to support limit single process feature.\n");
+			dev_err(mes->adev->dev, "MES FW version must be larger than 0x63 to support limit single process feature.\n");
 			return -EINVAL;
 		}
 		misc_pkt.opcode = MESAPI_MISC__CHANGE_CONFIG;
-- 
2.39.5

