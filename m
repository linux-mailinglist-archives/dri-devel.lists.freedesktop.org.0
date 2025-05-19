Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75881ABC616
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CC810E3FC;
	Mon, 19 May 2025 17:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIxIHQYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5803510E457;
 Mon, 19 May 2025 17:54:18 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-231d4679580so29457325ad.1; 
 Mon, 19 May 2025 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677257; x=1748282057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQloOIJetvzox92MWHE37UU9O29zUE3Qi3B+AAxswms=;
 b=jIxIHQYHBH4nXxvpZcfGJlJEEavJXQGhvxJO5eJZUfUR4onmEAj8y/gkktL2CSmK1T
 dUW4HD0rjgLCzl2zD1MLZQpeYOqb2S999EfkO4szBqudR9UGK5zS2yGPy7A/VVdiML8S
 wQ0lwckPo+l5W6S+d0Zt3hpSZrDy3c//1vpTQlnWGO1l8YlSPGETToXG0Uj2OOXUuzov
 TEPoKOI92xAl6AYbqEpcW0fRAQDYp5kiznj+/PKScRdfhtsqEWHA79Yr8O5fOC3zeXEx
 yldOx4lqlnOO8lmIC1oyNqkMv4+y5AUbvcMTalRTNfxzUpfTeQR4tDFgFBD/q1afoQSq
 D/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677257; x=1748282057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQloOIJetvzox92MWHE37UU9O29zUE3Qi3B+AAxswms=;
 b=dumJuueFVMcPycObC0LxeIkMcqGwCxm+Ge06boLXrsUqxdu81PQ8jVpmdofpajRXFJ
 wo48n7suplsduHCpeh2eqsEqyv6qxzNRZGLn25qp3/6wmRN5g9IAD24rCqsIMKxT7WBX
 Q2+uFFpugLInnY5t18b82VXDVK8fUeZqHJlTG+Ddr90KRHRH629yruogXAgO+z253kVd
 sg0jvSoEQBouvnOdp8hml2Vv1eiaJC7LgwQOgMxkNHkz8C8fnntuLXknPeY9goZ7ryRA
 7qOqsA4FDSfd8Xl1hxLyGMoPybLBmsBaUzzAO+wepyD6kCvdC524rSEktE3ecD7Wm9h4
 TlVQ==
X-Gm-Message-State: AOJu0YzgWU9s95TPjvzZ+UWvK2UqavtS3QWegwgdjPfYCjBHo2bWoHk0
 7gSNDp1OI7IOaHXFvQqYSxApenkYFbdiQvcV/huCxzPKJpbCF7HypmvMjyBwRg==
X-Gm-Gg: ASbGncuGl4tE2THeSLKc3E42FEhNLK3+SF1uVH6ZzGnCJu88sXpzh69T1nzhdzZIM6d
 9+UkoNt8MIV0hj9zOD40+feLmInYjlDGKTXEnJaaYJEuK6tCC5WYclK3hJpUan9+SyGtl1CaGzB
 KG+egnq3sUDVM9FDRkyQvLOZh6OKluW7anYNsQy3jzD1OmRvOnmLwAMsIg6OB1ToIam4LdCiE7S
 K+haSdb2EDVPEcogqgTh3rtbzi4S8IuGqdAoN9C84yQREk1cdg+whQtgvsK7fquvynDBT3H5xDc
 br6xeXrOwFDODDaTRuDMI7wFzPqtyzhkSj45VCVDWtmQ4EkB0a1Ye3GqjizauFP0hGF2TkGfJFy
 yIUrJFUCzi1XDZhMlWeF+W3QT9A==
X-Google-Smtp-Source: AGHT+IGSuMLkx96sFMh7b0MMRKst8qe0vdboixG/NWsaJn7w9DWV2XIZ2dB4fo5OCm/Of6Nu2djl0w==
X-Received: by 2002:a17:902:e78b:b0:223:fbc7:25f4 with SMTP id
 d9443c01a7336-231d44e641fmr203394735ad.14.1747677257237; 
 Mon, 19 May 2025 10:54:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ac9fc8sm62898755ad.27.2025.05.19.10.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:54:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor path
Date: Mon, 19 May 2025 10:51:24 -0700
Message-ID: <20250519175348.11924-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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

Cc: Danilo Krummrich <dakr@kernel.org>
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

