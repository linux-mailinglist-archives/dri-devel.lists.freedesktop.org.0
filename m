Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE85AB7219
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C25010E6A3;
	Wed, 14 May 2025 17:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTLPQrFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBF110E6A4;
 Wed, 14 May 2025 17:03:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-74251cb4a05so133029b3a.3; 
 Wed, 14 May 2025 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747242192; x=1747846992; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=VTLPQrFtgLbuR9rgUW8O7qvN9pew9cWILsIYXeqtlvnRRq3FVEntstJ0w2AACOLdaR
 fUkPXxkL04netQ67fnB/PAFehM/xSJYHvjVEXILn1GOB66CaruojJ4xrewjNtv119PK/
 jkK0HFrUDitywOO0eW+VdtvTAq5SWSJDe0AeL4opUeb8I73W18y4Arq57Nf56vMJsQMj
 eElk4uvkmMDbUARo8HaMAilDm0eBwHUXP7KfNiPfzEkivyqeaD5ESlWRT3Au11xGeimR
 Nf/9cQyBk3/gqYVBqU0a8tnZXu5vRddIRvQpUJGmo3EBgR2LmVIQBzjBQEPHpQGbmdzd
 KoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747242192; x=1747846992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
 b=wdyxL7CmZIC1vfotKqpdulmEkd+b7pTkUqtVryjB9TcunH5cVdBW5tIcZnJaIMQO9h
 aqEMLjZRGtAdGA72zd1hegK5QUoF4DGgd5zA8qiuNp4Bab0Lq5mu84yNJZ8iWETCS/qI
 lj4KW95jzMt8Dmtrb8n80rJh+M4F2d6nwWfoDURB2vgI6xUDmZyTjNPKbGFVFLjTQr6U
 ACeNGJISeS3kHsW+yylE5RnzSGwQ0YWFq3Fwue6OpIRN8H7lwBefWLagwPiuVO/YEKLF
 4g7v7oQT/OZMA/6/CfNWWxf6LEAL3yUhWQOITD6j5oTrYNhyFkVptC0DV2NpBPd5WlPU
 ZNfg==
X-Gm-Message-State: AOJu0Yzp/lXpTFi2ZbotfsjSateId4wavD2ffMycR4RHSMuyxfJyFNNk
 s9OxcXTzLrcx0czqo5yZxOXN9paTDnBJsN7royE2HVCEHLqj2MFXJwgAkA==
X-Gm-Gg: ASbGnct1/UgU0DCikJUGURlopQzY4sZ3KGhp+DhqIhb36wNqdEiTOrAKZjhgH2MQytc
 HU4ErwKubJfFANJDPZMcYFLyCUGdWRul3S518623hMx0z9AbStZaye7pxoyRSMqb/fn6tg6MQNh
 uUIqVrBu4sTccXSFbFFlZ8abGPl3Ud26Y+KNCEyw28Sm9XevPGnPvSWLFrMNWRgxhkBky9P+jrx
 tKotP0TNL4QZaSprHjxIYdn2Mt9bUb9AY1zpG9NJxLj0hERRQttpFoc0cWtsqj6B9j5m9cHB6qN
 iQ9Yd97KzUbcif9B0/LSWg9udhDZYvWlk5WW0QkUevG2w/7Givw2aXNkDnftJ82Ch1GlWZ+7b45
 b3M0C+Bmcb2AlHrcDDfwmgbkoLTBsIt1Umgdg
X-Google-Smtp-Source: AGHT+IEenEE0TDJYGjpoad0MaXzpg4coPrwhIFddIk4z7RGaH0tq5EifEZh9tMcraEV0o9p+MEDF5g==
X-Received: by 2002:a05:6a00:91d6:b0:742:95a3:b000 with SMTP id
 d2e1a72fcca58-74295a3b144mr559866b3a.17.1747242191636; 
 Wed, 14 May 2025 10:03:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a10608sm10022046b3a.101.2025.05.14.10.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:03:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
Date: Wed, 14 May 2025 09:59:00 -0700
Message-ID: <20250514170118.40555-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
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

