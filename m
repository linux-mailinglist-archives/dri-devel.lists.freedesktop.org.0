Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEAA6913A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9F10E51A;
	Wed, 19 Mar 2025 14:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fWtQ6IVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B87210E517;
 Wed, 19 Mar 2025 14:54:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2239c066347so152945265ad.2; 
 Wed, 19 Mar 2025 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396094; x=1743000894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZ34MCNZ44HhyvI9do4wVGRSqo0NC+oGwftYrjB8b3w=;
 b=fWtQ6IVB5riB6rzKqncnoQ5QCnB+mCs2iK0M0au5xA+T896QFwLHrhHR+oM0sfqgvr
 2mziwz15stJAS/qaVlub26JERtl3Z9kap/Sq2eTnzWhd52B81J6oS3zVLlhn+qWbRqoz
 fICvoqKNjHcxY06b5+ucOt4xtUoEFhjOPXku74OlYaBwikY9MRHsRlDrr7LsutRTQmsf
 8RQjHy65pylq50LL0CvmGBh/OODU71mULf+t5q1V5c7LnrrJvLgJOGYEHsRIx4OwiADu
 GF4Z6wHBIle8xtHcZfgFIdtrbouaKqfHU/VnCKtrwd0MoC5Jk/j2IxcprL98g/uMfDzN
 OKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396094; x=1743000894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZ34MCNZ44HhyvI9do4wVGRSqo0NC+oGwftYrjB8b3w=;
 b=wHc65+EGB+U9lL5OW0Bx+rnwPprw9oK2lC+b0MUIkvoBDBWuMIa0A1Bv5NPQOcI8vv
 /AtdzUJty2t4wX77bRRRjeVWi/peLgej6ejTo7o9BGv/u/jrH5QSVxv/qC6rRjBd1XDR
 dGVfiGW7MSuC/ryYvSEv5LIgCctDysXuiu+m/XcxF1TgUwVkZiFgTW3hS763XrbIJ9WP
 zW4oOzIUf9L0uPcRUqFV5vTAimz59my02TmgWPWbNYIvKhZaZWplXktOExmyfnONmcHa
 zzqx6XO3fN4H5rMgtsJvZkEsrXbNbuYP/GWgFhNWAqAlx8yd9S0t7c6XCO2iqxQ/XJni
 9CLQ==
X-Gm-Message-State: AOJu0YzWDyS8OqC4hvHZN8Pa9w2Vv/QK1+/oYEOeRQjZK1PPDRv/PFEm
 RN0jWHbWHjyYPyEd5jHkuhTEMpbobGMg70Fxo+3rnsv09jd1xQnSrvP8Cw==
X-Gm-Gg: ASbGncuOdtyTaatfzvOcq/CJAOW3yUu+111iNVpTW+TCakMMPUJwHn3MylW/eJg1rzd
 rKH4TusQDGVuNin3bJVl54mKVBQLrwNLK5G6NzTDPyGHNxSAy0PZnTixzYGCU1obNGkxSJXsuFl
 8BWS7Xnko/P/9K2mZbXqnASj2jdVnpQcsfZ3yElQBdDKdIDbFdmiQDJJ88qPaMGsj0Njjd4zUh2
 Z92HnU6Xx9dqZAOiUdewa3AO3FQMklShOq7oMQGfsmK/+ll5MtQjNpBVJRZgb1UkogsALEXX7ad
 1BCaQwUT5QVB2x2WqoCDLpstSW8crdf6grc6+Z32Ks2+zU56GGd62j3kirnVuJZ8xXwOZ0z713g
 lTC9dsBK55PvqOxVnZq0=
X-Google-Smtp-Source: AGHT+IE6G7DIcnAdTSdExbPC+8+93hGLx1fXkyPdgmB7cZhx/aYrLajLhcpobRKo4yKxYRpHbccXEw==
X-Received: by 2002:a17:902:d50e:b0:223:628c:199 with SMTP id
 d9443c01a7336-22649cc360amr41186675ad.52.1742396094339; 
 Wed, 19 Mar 2025 07:54:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c688da8csm115390165ad.48.2025.03.19.07.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 04/34] drm/gpuvm: Add drm_gpuvm_sm_unmap_va()
Date: Wed, 19 Mar 2025 07:52:16 -0700
Message-ID: <20250319145425.51935-5-robdclark@gmail.com>
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

Add drm_gpuvm_sm_unmap_va(), which works similarly to
drm_gpuvm_sm_unmap(), except that it operates on a single VA
at a time.

This is needed by drm/msm, where due to locking ordering we
cannot reuse drm_gpuvm_sm_unmap() as-is.  This helper lets us
reuse the logic about remaps vs unmaps cases.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 123 ++++++++++++++++++++++++------------
 include/drm/drm_gpuvm.h     |   2 +
 2 files changed, 85 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 681dc58e9160..7267fcaa8f50 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2244,6 +2244,56 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			 req_obj, req_offset);
 }
 
+static int
+__drm_gpuvm_sm_unmap_va(struct drm_gpuva *va, const struct drm_gpuvm_ops *ops,
+			void *priv, u64 req_addr, u64 req_range)
+{
+	struct drm_gpuva_op_map prev = {}, next = {};
+	bool prev_split = false, next_split = false;
+	struct drm_gem_object *obj = va->gem.obj;
+	u64 req_end = req_addr + req_range;
+	u64 offset = va->gem.offset;
+	u64 addr = va->va.addr;
+	u64 range = va->va.range;
+	u64 end = addr + range;
+	int ret;
+
+	if (addr < req_addr) {
+		prev.va.addr = addr;
+		prev.va.range = req_addr - addr;
+		prev.gem.obj = obj;
+		prev.gem.offset = offset;
+
+		prev_split = true;
+	}
+
+	if (end > req_end) {
+		next.va.addr = req_end;
+		next.va.range = end - req_end;
+		next.gem.obj = obj;
+		next.gem.offset = offset + (req_end - addr);
+
+		next_split = true;
+	}
+
+	if (prev_split || next_split) {
+		struct drm_gpuva_op_unmap unmap = { .va = va };
+
+		ret = op_remap_cb(ops, priv,
+				  prev_split ? &prev : NULL,
+				  next_split ? &next : NULL,
+				  &unmap);
+		if (ret)
+			return ret;
+	} else {
+		ret = op_unmap_cb(ops, priv, va, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int
 __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		     const struct drm_gpuvm_ops *ops, void *priv,
@@ -2257,46 +2307,9 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 		return -EINVAL;
 
 	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
-		struct drm_gpuva_op_map prev = {}, next = {};
-		bool prev_split = false, next_split = false;
-		struct drm_gem_object *obj = va->gem.obj;
-		u64 offset = va->gem.offset;
-		u64 addr = va->va.addr;
-		u64 range = va->va.range;
-		u64 end = addr + range;
-
-		if (addr < req_addr) {
-			prev.va.addr = addr;
-			prev.va.range = req_addr - addr;
-			prev.gem.obj = obj;
-			prev.gem.offset = offset;
-
-			prev_split = true;
-		}
-
-		if (end > req_end) {
-			next.va.addr = req_end;
-			next.va.range = end - req_end;
-			next.gem.obj = obj;
-			next.gem.offset = offset + (req_end - addr);
-
-			next_split = true;
-		}
-
-		if (prev_split || next_split) {
-			struct drm_gpuva_op_unmap unmap = { .va = va };
-
-			ret = op_remap_cb(ops, priv,
-					  prev_split ? &prev : NULL,
-					  next_split ? &next : NULL,
-					  &unmap);
-			if (ret)
-				return ret;
-		} else {
-			ret = op_unmap_cb(ops, priv, va, false);
-			if (ret)
-				return ret;
-		}
+		ret = __drm_gpuvm_sm_unmap_va(va, ops, priv, req_addr, req_range);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -2394,6 +2407,36 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+/**
+ * drm_gpuvm_sm_unmap_va() - like drm_gpuvm_sm_unmap() but operating on a single VA
+ * @va: the &drm_gpuva to unmap from
+ * @priv: pointer to a driver private data structure
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function iterates the range of a single VA. It utilizes the
+ * &drm_gpuvm_ops to call back into the driver providing the operations to
+ * unmap and, if required, split the existent mapping.
+ *
+ * There can be at most one unmap or remap operation, depending on whether the
+ * requested unmap range fully covers or partially covers the specified VA.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_va(struct drm_gpuva *va, void *priv,
+		      u64 req_addr, u64 req_range)
+{
+	const struct drm_gpuvm_ops *ops = va->vm->ops;
+
+	if (unlikely(!(ops && ops->sm_step_remap &&
+			ops->sm_step_unmap)))
+		return -EINVAL;
+
+	return __drm_gpuvm_sm_unmap_va(va, ops, priv, req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_va);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 13ab087a45fa..e1f488eb714e 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1213,6 +1213,8 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
+int drm_gpuvm_sm_unmap_va(struct drm_gpuva *va, void *priv,
+			  u64 req_addr, u64 req_range);
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-- 
2.48.1

