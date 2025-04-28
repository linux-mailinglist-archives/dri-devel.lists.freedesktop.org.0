Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB2A9FAE5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA13B10EA1F;
	Mon, 28 Apr 2025 20:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b2NlJD6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0962110EA1E;
 Mon, 28 Apr 2025 20:56:34 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-736b0c68092so4656765b3a.0; 
 Mon, 28 Apr 2025 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873793; x=1746478593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=b2NlJD6u5MQUKfvionmuWf0d0IdcuA0oImceP73/hRyS716m7FMDCbcff1MwUWUmbh
 KBlyNkwT/AU+kju2rtYU6izjBR/McFuhG4cwfeoHyDDc/Pe3mW9zpzS6ZDvkXTuYslFO
 UYY+/X2eBOX/xMF3u7Qbfg+ik3mxYPuOuQcboDeSx/rhtA8JVz8br6IbHg5vJA61O7gk
 IPyVqlWXp4E6rDG/mbC4YLAKjEmSNQThuArD5ZaYD42FBJguDvOEi2C9Okwxj84zKOOl
 63BzRPA9lIx+JD6Dd2P6SHZHGX+6rUo/qm+ZJK8pKVHkpY4PBRY8a8TvPpz2h4C552pp
 CDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873793; x=1746478593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=QuCd5r3jzxcnNPE8yUDZvJ//B0WZs7Vec/UUVFVBS8JZSn4obBAB9OZ7BMPNXlkjnq
 sgz4Rxe6z6yS/0POp7KObIzWV1rqy/2Yfw7cV+gUic8/ejftSDUYYxkhgt2P4qBP+TAX
 B9a8jTaIdwpvMnPy8AurvvkHuS+ltIRF7wmhR2r6Ki4x6UM5lhFNNzGMDmZyGHwci+P7
 Fh6hhU+0urE3IlECUty5t6EgavlA+XX5X2xTFVPE0ypiBVU1NbcPhc1Y/Y3sldeK6x8l
 Nh66J8cMoa5hinXqYREvNSsjWVanSoKRZHueF2w60mIw6EGP0ndTxn8cXxfXUffx9Fc5
 1zqg==
X-Gm-Message-State: AOJu0Ywb7mz9WDcuPNWP86T82vYnnyVvnVjEkW8hT4Y4aPDuqSQSL9mb
 bbPRgqR7bhMkhxzvvfQzKGpbYJpHPS91g5vmb2IQGsXAZbDxoCciuknWPw==
X-Gm-Gg: ASbGncuR355twnTLAJqI7z+XbKjdYqjfKdGfEmLATZxxOXzQrO9P9E1ZwuXqGOmg839
 Cj3nTEGMtX4VfeZW9M5UBgt2mZFDbJSWglQUvUkrtMB9Lkiqn9Eox/ZdpG7mcN16KI+MalRVZKx
 uENTA1TtSDUQyHm/N+bPeZjRwOHrSkmgabXKr0QADEhpKAa/PB6P8YqcIleyG1Fkn1MKCjV8BOD
 5WSnZkHc1WwXjN9W1BO0CvbdzcOfvq7/vSYPOkHBgXC5gsUZcCkULHkN/pkELFWOam/f9P5cH1n
 BkRRj/KgntAc69aSn/MSr/daeQiMnrV98afbTqRb1/hE0TYUFNp1PWppehNscxz5kZk/Rw9Jh1p
 ewH1/ZbBOXEUoyok=
X-Google-Smtp-Source: AGHT+IHTsxWBtqpKlJz4e4YZ5NKKGKK3nF22VsYgt9iMF0elFGllIaKViVWh8VuNPuxqXdiwwn0rhQ==
X-Received: by 2002:a05:6a00:18a9:b0:736:65c9:9187 with SMTP id
 d2e1a72fcca58-74028fd9f4amr642109b3a.9.1745873792946; 
 Mon, 28 Apr 2025 13:56:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a6a655sm8733426b3a.101.2025.04.28.13.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:56:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 01/33] drm/gpuvm: Don't require obj lock in destructor path
Date: Mon, 28 Apr 2025 13:54:08 -0700
Message-ID: <20250428205619.227835-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

