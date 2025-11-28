Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03EC923CB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 15:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195E110E90D;
	Fri, 28 Nov 2025 14:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XZ07AiEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA3610E905
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:33 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4779b3749a8so17925665e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 06:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764339272; x=1764944072;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=lHrITmuzWJXdDupbiDV048x4k5m6cyc9L7Gnz7XV3lw=;
 b=XZ07AiEnKE7lKkkij3TFngaCG+oHFFf1evp7Efnq3mhwQ0hEkAFDuKo/anp7eXo/BK
 DlNuUNbBeJfB+Y5T/EVXG077wwWa2M1oIf1+AVndZBwt3dfBnfciTQnqaERuskTpZ2fn
 qaNUlSo3n2ZeuXgiBn2/bZ0zW7AuHZmUcb1fykrCh7uWy2kZUgdlHPbG1wLH2+R7iFTQ
 46U28t02XrUN9G4wMrwcKXSkY/XWOtw8OfYrrMsU0fkxFMBDrUjgDztz3yhr3We0ze/d
 prAyMkmY3E1TOIMq1PuI02RY47mc2RZzDkvl09I+Dw86CjMhW643XjKHFr9c6YsXnRCd
 WACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764339272; x=1764944072;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lHrITmuzWJXdDupbiDV048x4k5m6cyc9L7Gnz7XV3lw=;
 b=lbcGImJNop6Mgtm/faXti7DYnEJvZ/uYt1zu+9YW9RRQWpBY/HDpG+oOrexh57zpq0
 eor2cF6tqozKfGGd70cFBuF7u3EIgN/dEprnHW/Lwqv72eObLrU0sjo9GbdTkdy9iqb9
 ZIy2CHnpUjBx+fZhjhe1+BGQ/FrrlJoji2cM/TNYVEMjE9IyPB33rnRePEiTBL5EdrqL
 d75TYZN+GUPPHWZ0EfE0m8Qmlis9AV9hXBe+T2TMSkRNIoJx8lRngZYrGeZZz1wQtuHh
 qgcJNEIxtQQsuvatLrzPGY0d45stmtDJYpAxPNM6n7uZ+tE9oy+7q70yQOXbucG0zA4O
 p6ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy/QWoOpQFN9FfvsoDk9Fa9A2hnwCFFaO28F6MeoPRhdbwvRZFRI6EqSv4cXJzbi+rqdS5n+Uj1UY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB8IYq4MKUVuIgZnMjZZIv+cWRQEKpObjzQqBV/R9s+etIbQTk
 OcS8YoCRk07+BPFxwVuS9no+2J5NvvCT8e9F0X8So4EGCIj4r01pzEZZzLGIngxmE7dk+GQ2laM
 DrZlobwlHKrcsT+n50Q==
X-Google-Smtp-Source: AGHT+IECdIY/9qERVbVkHVqKEZYtL5qsUp1NRe18CXbO6AbEkFwz27YZTq95W0cUq+5TnNigDeIpYGUpIZBNCto=
X-Received: from wmfv21.prod.google.com ([2002:a05:600c:15d5:b0:477:93dd:bbb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1994:b0:477:5aaa:57a6 with SMTP id
 5b1f17b1804b1-477c016e402mr252259955e9.10.1764339272424; 
 Fri, 28 Nov 2025 06:14:32 -0800 (PST)
Date: Fri, 28 Nov 2025 14:14:17 +0000
In-Reply-To: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2726; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=lZr2m+mQ4TpwozXWPOtl3qOpvh0GxfNQ2/kgcwntGLw=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpKa5CqER6z4BX6lmNpQE1dtbBv6O4gMLCZQRm2
 WIxSJ5CygqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSmuQgAKCRAEWL7uWMY5
 RoGHEACKyrVlHckRCicF0bWCsQj6fIzJXXP4G9d2IdRlfrGJTT9IHHZefQtZHYrRj4CuKEHPn78
 vq/7/57MFjLU9h01oEVnydbK1d4b2Q61FBF2O1QHxZXg+jQ5Lpda/paKmnAE6lEW5D0TD6xiknJ
 3pibIUf3+qLTJLpUBj63kogyRSrhLlKoIj9hnPt/Bv0onkMIdS5ci5JVncTYEY5gayTCb8Tilq+
 DOeStdEObylbdRE9O35R/Ieif6/cs6he7iB2RxcU1TOdlUR7S7AOTpeUN5uQtEQKkAFE560gkEO
 0I70691h8RJ+/z04Su3AU6JfvIi/aJRNT8vJnANVSczkAMg0qY/qK3owkrZzwEe+OkNs1TXqhMn
 93h/68baGdXCW0p4qGl2nlOYbe7Pk2/r4PgOPTtl1JGuyoaGbrmyVNmTQtCaOgr2StrDFDmLqdY
 MKBVUVQk8BOid6B4nYOens1zzK/WfMOTtAPO4IFmS2cE76XkieTzgLSgdUcLCGZF2iG1RSqG6IQ
 jHN9uSXjLHA/tlhHvxmP4AQhYvAJthXJmdu6oBwXIosPV3odLP+8Y0QlMSw2kG0Xtxd7sOfZvBV
 +pOUdZ60pmFJKPnT8SU8Sfo1BjxArZnN7evYc7mDEU+AXJOMKjtx8wvu7I5+iw3DzxIpcAt9V2R
 DmXD6m+pLHlNvtA==
X-Mailer: b4 0.14.2
Message-ID: <20251128-gpuvm-rust-v1-3-ebf66bf234e0@google.com>
Subject: [PATCH 3/4] drm/gpuvm: use const for drm_gpuva_op_* ptrs
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 "=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
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

These methods just read the values stored in the op pointers without
modifying them, so it is appropriate to use const ptrs here.

This allows us to avoid const -> mut pointer casts in Rust.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 include/drm/drm_gpuvm.h     | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 9cd06c7600dc32ceee0f0beb5e3daf31698a66b3..e06b58aabb8ea6ebd92c625583ae2852c9d2caf1 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2283,7 +2283,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_interval_empty);
 void
 drm_gpuva_map(struct drm_gpuvm *gpuvm,
 	      struct drm_gpuva *va,
-	      struct drm_gpuva_op_map *op)
+	      const struct drm_gpuva_op_map *op)
 {
 	drm_gpuva_init_from_op(va, op);
 	drm_gpuva_insert(gpuvm, va);
@@ -2303,7 +2303,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_map);
 void
 drm_gpuva_remap(struct drm_gpuva *prev,
 		struct drm_gpuva *next,
-		struct drm_gpuva_op_remap *op)
+		const struct drm_gpuva_op_remap *op)
 {
 	struct drm_gpuva *va = op->unmap->va;
 	struct drm_gpuvm *gpuvm = va->vm;
@@ -2330,7 +2330,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remap);
  * Removes the &drm_gpuva associated with the &drm_gpuva_op_unmap.
  */
 void
-drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
+drm_gpuva_unmap(const struct drm_gpuva_op_unmap *op)
 {
 	drm_gpuva_remove(op->va);
 }
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96..655bd9104ffb24170fca14dfa034ee79f5400930 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1121,7 +1121,7 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 			struct drm_gpuva_ops *ops);
 
 static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
-					  struct drm_gpuva_op_map *op)
+					  const struct drm_gpuva_op_map *op)
 {
 	va->va.addr = op->va.addr;
 	va->va.range = op->va.range;
@@ -1265,13 +1265,13 @@ int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
 
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
-		   struct drm_gpuva_op_map *op);
+		   const struct drm_gpuva_op_map *op);
 
 void drm_gpuva_remap(struct drm_gpuva *prev,
 		     struct drm_gpuva *next,
-		     struct drm_gpuva_op_remap *op);
+		     const struct drm_gpuva_op_remap *op);
 
-void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
+void drm_gpuva_unmap(const struct drm_gpuva_op_unmap *op);
 
 /**
  * drm_gpuva_op_remap_to_unmap_range() - Helper to get the start and range of

-- 
2.52.0.487.g5c8c507ade-goog

