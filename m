Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD6AA77FC
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2613F10E96B;
	Fri,  2 May 2025 17:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJBkZcRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAA010E965;
 Fri,  2 May 2025 17:07:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2243803b776so40312835ad.0; 
 Fri, 02 May 2025 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205630; x=1746810430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=cJBkZcRfKbgUIW52lfU0uOzh5TGp7E7j66HI+Yj+EylRGEkJhbjomFUnCIlgzVGcx4
 StefmtYOtg3FTLBVKOdl9cGhRoavGKOj6w+azPc3oucyVz/3AV21gMmFl3SFbdpVI3DA
 gWWbcAYj4GejW7yi/GhlbNSm8zMU/mhbBJMD1qE959ikMLlJ1koxiOeRhkLGCJDUSRuo
 +WAj2kQ3bxvX09hfUfRI4HMdO/Xw9ygU7vm5SXwwNQEzwA8IV8sZajvmfU4c8vvCmSRz
 9pcGF70AEx/wu6KNHofEREtO70KbS9E4ptpdVPICfokjSqYhD+XtdtC1EzeCTN3dvoxT
 3L3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205630; x=1746810430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=QxvKpX9akOST6j9ptpjTbPqCJ35rEgHkPV0DhlsJBZzH/Z+HJwmNPCq9AHdTcyjTCQ
 H9APgLbrIPw8QoFcfIBLuChK53SBINmRjZBNRXrE5Fpf9ZrAyEBSvQKtHl/J88I2+H2V
 nMLEgTYqnUAYhf2gdVoDJ5GldCxI7EFeaOg3rdQx9KwjIkqCbDzWJ0BUZpYk+pnTR+FY
 I3xiZ5ku7AVmWhmEZeFjuI4+eqL/tfNGiNcbDwc8sccAQBVGf5uIAeGrSshvwvEbeYOi
 IYfiOgN/ifTxASQYxQqRzCjFlcqYY+OaWzu8PwJ8fiTVj5BsQk09vNaxFbhQWCsBAhw2
 l3Jg==
X-Gm-Message-State: AOJu0Yx3iiTsBtee1Fa6x58gsiNB+dtUOcPj+4DeEJ2Atl1scEq4j3rH
 3OsQA/BsFVUNVvWsq6dlyOVNhTvJc2ftTOQvnOEDqHTLr6CE2kftnNZXbw==
X-Gm-Gg: ASbGnct3HkPqDkm++L8u4eVoIeCpyZg/Tpci9gGRPDTsCBSh+818CmTLibpNfpTtAu2
 plhQ8rg94KOHNhALMr4nkUqmzCjU2uctkl4ueLBOEecP45osrDyHb/QHiro4+GHnFeJX00jqKhx
 aA0bZEYeq1Xxka2zk+DfCKgsj5h2WW6CO61KCHYrK5GUm+G0G4SuzgFFlvhvs6LS6RagxqQh4CY
 84iY/uCGzL2IFkmGTXFS6LTZ/tUbMIx2TSUu+qKB3UULKQfsjs3+W8iMagVFNxeQA7SqrFwIIs2
 NlcV5Ddq/0lpsn/Vhd4PQfL7DyqdcK6RbGHUeYC6vMxZMO/KzJt96AH83Euz6+f9P/b1xhbFiKh
 zRSHyEJOQ47Yq5to=
X-Google-Smtp-Source: AGHT+IE7TQeRZPIV/k+l3azgDI4anbEhAEiRsOacnr9mxlmxKQhOYTpWkTEtqtqMGKM3T9HH9By+vg==
X-Received: by 2002:a17:903:166e:b0:224:24d3:6103 with SMTP id
 d9443c01a7336-22e1039fb34mr63598215ad.35.1746205630457; 
 Fri, 02 May 2025 10:07:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1521fa7bsm10053795ad.141.2025.05.02.10.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:07:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/33] drm/gpuvm: Don't require obj lock in destructor path
Date: Fri,  2 May 2025 09:56:28 -0700
Message-ID: <20250502165831.44850-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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
2.49.0

