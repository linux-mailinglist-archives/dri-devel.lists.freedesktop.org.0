Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D2B81D6E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 22:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F246A10E597;
	Wed, 17 Sep 2025 20:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h6CCTSeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1D110E021
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 18:46:26 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-32e2794c97eso63191a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758134786; x=1758739586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4CUH1cxrzGbtKg/vcM5DH0s3j2Zg6HTRa2VG9pGeCYA=;
 b=h6CCTSeA+ktEgkBIdeCEOaYKtfMRnXG4tYDVvrwsdTXnffZSjdpByhCr+UJ9E7O69V
 UI3OXqx2Meuri9s+wuZoaDl8/CdGATgBXADc9L6Kj0bmj5VAYbIoGFju6wg647QB27wP
 nkbZi3whJ9ovkusiZYPG06/GC05WyEktgeMymK+0SdHVCCm7Jckw1yl5OCehCh86g/Xp
 Cn5PnjjKfjEDdf2Uh2Yhwn0LgYB51s02fS1V/wAaPCV3zXN1lP3G0Xh0rIUTvmZbMKf+
 cW3qV1UDGCofRF31L/amj40a82ojyoIsRlCjcIjzymaYth/2dnQVDctArIlrEyqmEU2H
 b1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758134786; x=1758739586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CUH1cxrzGbtKg/vcM5DH0s3j2Zg6HTRa2VG9pGeCYA=;
 b=UpZOo9Gf/gte5DioVkt34Axj09NoEsDBcD/iCSkzYhSD6P3/oFyxXd+fegNKEeYf18
 JVk+GJ3MelhIEzcJibnLB2WntSnSu33XwZhibXhvzslzszq24fV34BEonbqebOmulZpH
 hsnnFPZQAKOzbx+V5r7+mQQykY7bwRTskP5IYn1wwSFPK942vsfLwfOBUyqz8zTcWRsY
 2yC9oxmij68dg0WaS7KzoemCveoYjyZ4itsleQWpu3UjIq+00bXhbgU2z/cpcn52CDDu
 YL6vXXJ6wsvBomNhdpmfWr8a8GWz3lTUZs3sThdaNJfzIB5eVCswKckglrVzMhRcSjTA
 E9tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRocr5RLmfnjlPpa/qpmznM1AY9ZvI8c5QYprqN6SlGwwic4jFM1iO1jUabkgSpgijwD26GmQi8hg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxztGF/ioOMCSc9JuOw2S8ktWSCYGy4Cvcc8v5V851mNlnCV2iL
 oz6scXwuGGXKBbEbAj3FwAPp1V3ysVAp2/x9hTlJuSuCuIjcNNAXBaF9OFElrEASQXk=
X-Gm-Gg: ASbGnctlFOnjn5QavxPX5goXIPF7BjcQLIp7txYPQ7XWG5ImDe24b122b047Uj3Bqj4
 9HZ7IMMSICnjtedUr9nvwg4ROn5AQU6p9G6DxskbYE/wqFeX9aeJJO1n3GaOXSjsyP5KR0WfeY5
 4KypV0b9ejzudE2SKb0tfC9KcJwZSze+fhEOsrAecwInDS8YfIwu6jpCAnSffuKcdozujqnsI3Q
 ZL7PVQnbgHf/e8Lea+ls4wq+L64CuZamQypRFxx0lZNlftoliMYykcZf1fahRF1GE4QczMC4O2u
 qU2mccrmnl/UWopc0jqIrq/3/8GHVcJNO0K0STNb6H3IPMmE7xvHc82zktG3S1Xk2lShdcTKMmS
 29T7qY3Yn44SAQ18YSk4jBmaeKirjCPxdIxbI1Q21JA==
X-Google-Smtp-Source: AGHT+IEATHK4oZBUQ2XFmupV9qFdWwS+bGbZy20FnYjT9stAUVExIl1DxfPhf6kzlDTzmLMxk2zr3A==
X-Received: by 2002:a17:90b:4986:b0:32b:4c71:f423 with SMTP id
 98e67ed59e1d1-32ee3f75457mr3359863a91.32.1758134786351; 
 Wed, 17 Sep 2025 11:46:26 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306082eff4sm187852a91.25.2025.09.17.11.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 11:46:25 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/msm: Add NULL check in vm_op_enqueue
Date: Thu, 18 Sep 2025 00:16:14 +0530
Message-ID: <20250917184616.85797-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Sep 2025 20:53:03 +0000
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

vm_op_enqueue allocates an msm_vm_op struct with kmalloc,
but the return value is not checked for NULL value which
can be returned by kmalloc under low-memory conditions.
This can result in NULL pointer dereference when the pointer
is dereferenced.

Add NULL check after the allocation and propagate -ENOMEM back
to the caller in case of a failure.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..639425849d86 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -455,15 +455,20 @@ struct op_arg {
 	bool kept;
 };
 
-static void
+static int
 vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 {
 	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
 	*op = _op;
 	list_add_tail(&op->node, &arg->job->vm_ops);
 
 	if (op->obj)
 		drm_gem_object_get(op->obj);
+
+	return 0;
 }
 
 static struct drm_gpuva *
@@ -482,6 +487,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
+	int ret;
 
 	if (arg->kept)
 		return 0;
@@ -493,8 +499,6 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
-	vma->flags = ((struct op_arg *)arg)->flags;
-
 	if (obj) {
 		sgt = to_msm_bo(obj)->sgt;
 		prot = msm_gem_prot(obj);
@@ -503,7 +507,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		prot = IOMMU_READ | IOMMU_WRITE;
 	}
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_MAP,
 		.map = {
 			.sgt = sgt,
@@ -516,6 +520,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
+	vma->flags = ((struct op_arg *)arg)->flags;
 	to_msm_vma(vma)->mapped = true;
 
 	return 0;
@@ -531,6 +539,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
+	int ret;
 
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
@@ -540,7 +549,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 
 		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
 
-		vm_op_enqueue(arg, (struct msm_vm_op){
+		ret = vm_op_enqueue(arg, (struct msm_vm_op){
 			.op = MSM_VM_OP_UNMAP,
 			.unmap = {
 				.iova = unmap_start,
@@ -550,6 +559,9 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 			.obj = orig_vma->gem.obj,
 		});
 
+		if (ret)
+			return ret;
+
 		/*
 		 * Part of this GEM obj is still mapped, but we're going to kill the
 		 * existing VMA and replace it with one or two new ones (ie. two if
@@ -611,6 +623,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	int ret;
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
@@ -643,7 +656,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	if (!msm_vma->mapped)
 		goto out_close;
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_UNMAP,
 		.unmap = {
 			.iova = vma->va.addr,
@@ -653,6 +666,9 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
 	msm_vma->mapped = false;
 
 out_close:
-- 
2.43.0

