Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0037EA69134
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3510E511;
	Wed, 19 Mar 2025 14:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+WWE26t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF0410E306;
 Wed, 19 Mar 2025 14:54:49 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-22409077c06so175542505ad.1; 
 Wed, 19 Mar 2025 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396089; x=1743000889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dZtNKeQwhga7C/NdCHWATB5ZEqb/G6D875fLgA0Gp4=;
 b=J+WWE26t6ihCaJy0Aff130gW0hl87+13PvlniCsxO79LGj+pWqwDOg0z89BYJZ7z/8
 VAZa7qdvrPUX3a4T6uwCqpETybsOSX2josYI5yh7j5fAiUJwfUCTh/wG/EdSu7Y0kU1L
 EIn4V68M9mXrlBKGvK7ODw2bfZK1yJGXY7/xFrF8ld0rnoX2W81SfjLaaNhoEQD8wBtc
 6bXXcL3+ZmSkwLXQEAYGVl8vG7usJGwTOJHU2V8VrwC8F3F2pWeZqUh1gInthgsyi2EY
 jmQU0rHrybNFZJUuQovCD6FkLkxFiqpFDZJLTDKrsOVCBbou5hHs8KxxKfOhNo7ynFmL
 xJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396089; x=1743000889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5dZtNKeQwhga7C/NdCHWATB5ZEqb/G6D875fLgA0Gp4=;
 b=gGzpSlJC2wCW4B7VLSz8NcdSIhQU+qO9gzTcUEZQ7dRCIBK/0WLvWHeAjwE0ku45vo
 ygY1OFqy2lUb/VLzRrCI5+heGvC/YPinanRY/GdOwuqpM2B4+n67VDdUc6nxkTXtuXkE
 DZKX4kcpdOATM0lgdwuu0FVvA94uT45zitAWJ5bLj8+HSKgf+5w7TfIMeWSgs9sDEsGX
 nDKeMkU/3bb0JBU2eR3XEiVjUsC1AkK2UGf9LP3Sfc9QuK81Hpwi0bYUSxD0Uc3Nsiox
 NtaHUT4I1qZR5kgp6tvOws1RG9rga0WGRVDxXaqCa874wjDLdArKce/ytQmRkJgV/aEn
 x5kg==
X-Gm-Message-State: AOJu0YxTvZyVl99nBEo5GtjVBhirchvPUel3y13sMPzI72l7TRvWcRAX
 +1E2xGdql5mISJk5lxe1TTSiCs6npu7ezw/OkmONCUk9a1vjMmz24YDDfQ==
X-Gm-Gg: ASbGncvOSsvIurtYHMCk3fn4NvtIN4vg2DR+w/dx0QG1k/xJBT4lfJaAcjLgKvbNRjx
 5LwPEKCQykHJ7fT5bllw0yz1j2z9/mHC7AAunqy2ok2R0NTQhRJV40XPtDQABTFm4ZjZHTggMDS
 lpuPLMlT7aS3HcCWMn+Z9Qb2RltPXZ+TFNbFim9WKZMarY6LGfM12t9ckrV0Jcb5bMNINJran+q
 FSnXv5xuHIYSqsasg25aVSEpe2Wfmkw0kpQducJqkeYEVSMvFkNuNQT13RdqR4fsQaH8MC5m05v
 j6UvIcKE6/SG2C6JIGrikBF0IEUoS1bCZNQMmUFkXRqJKbJKBF89zo3Kj8cFCwP81bwLyyssSWz
 Diy7M1hyUYuQR8fiFsPg=
X-Google-Smtp-Source: AGHT+IFOMy8+oTohkcWuHiW4WgtVgQ/iqyS7y8TuEZyHPSXdEIIYmiy16h8Qp/B345NHcEo1TSCqRg==
X-Received: by 2002:a05:6a00:e09:b0:737:6e1f:29da with SMTP id
 d2e1a72fcca58-7376e1f2ae7mr4929307b3a.21.1742396088919; 
 Wed, 19 Mar 2025 07:54:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371167df97sm11699520b3a.114.2025.03.19.07.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 01/34] drm/gpuvm: Don't require obj lock in destructor path
Date: Wed, 19 Mar 2025 07:52:13 -0700
Message-ID: <20250319145425.51935-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
msm_gem_free_object()") for justification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..1e89a98caad4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
+
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
 	list_del_init(&va->gem.entry);
 
 	va->vm_bo = NULL;
-- 
2.48.1

