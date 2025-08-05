Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F0B1B8B4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 18:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9B310E031;
	Tue,  5 Aug 2025 16:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRIvf3C3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A0B10E031
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 16:44:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5758bZfa003913
 for <dri-devel@lists.freedesktop.org>; Tue, 5 Aug 2025 16:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xFZ6cFO6wa52HtJqwYOKHtqGz7UHtTevLTj
 q7d3NNvg=; b=SRIvf3C3XrZjewO4zKbPO7X3F9IOLoIBzYRNbchpfa32QM2YoPm
 QDimi+wg7WVw8qrS879CcnYVAcm8jHG6N6dWEdwt99xiHvzAVB+iORPxpDVOfFFo
 kD09DUHvoJliAYG9UpyP2DO88sE8JyiEz+Y9IfrwFmp1ZBfFeP05ouGz2E3wjVl+
 AftroD2NAc1/SFIw1tMTYLVqQxWVkzO+EBjXRW49LtsY2CYwZeuKHerhJ4dTojZr
 tprPQiWbeWQ2mjabwiq/RIb0h2V8LSuokn/zaY9ogqq8WrNW/KqdQMbx20Bg8waT
 7cxFz2i7j3hJUfHIiLwcsE73JGBfMRUgUaQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a5w8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 16:44:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76c19d1e510so1148619b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 09:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754412275; x=1755017075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFZ6cFO6wa52HtJqwYOKHtqGz7UHtTevLTjq7d3NNvg=;
 b=KWLWmrI0yU8Gm4pnOOCyuotweDU1lHQ1d7PXh0gaQWWkO97d12kXdxtbi7u6mIMTCU
 Quc/v2lW8YFUyNxPEeJoqa89iuMpl+4LyNBUZoGjewdVq/clpmY8VhgImUWaf5QIKKkr
 y5M5LrCGz8GEXv3g2/GuHxbgXLVQC0BoMteq4pTiDmcmGTgdsKB9Y4gHUahYadcP4tnG
 OVDOXMwhLlacJ5RYRhIm1CUOLp0BlrRhwGyM+kUlp+TIqoQalEjT9T9xB3u9ds0HYtqE
 7ntVLadA/gIfgtp11o8O4bnuc5tXbNu+wQktcbr5jngfA6km1HX/muxY+2aFjXocPwIx
 yQMQ==
X-Gm-Message-State: AOJu0Yxxhw14KUDDDhSsV+HgLKxsFbplCaY2EIO7Q2hD/k0OZku8mT0I
 YEG5nInzKug/wCsgHsLqtdDfL9neo1ncUCBU4vWUq3HaxpSwG/8mBP1OZ7f6fjaijKJkEdr83/K
 HKW+FRFhT7xa+TPAWt1GIwJ6lmSG7kd1+CyA7gkK1Tj/EHq4FPd3f5yF7g9r+oG4QJLlAtRKSx8
 klik4=
X-Gm-Gg: ASbGncug1Mnr4juium5VDnymE4EfWjHbcOiFA0O7Do6j2iz+lLKAXJBKqF2AwbqowML
 2R4Wf6J8hx4jVPtZJPv8SHYf5BNmNjX7Oh0zxPW4guFekqhvfE8gAWUAOHWtpC6qUsO28NAhV4V
 3oGJBE2S2+g5+6/0xsDabqtaJDMxdv4d4n5/GSSA11te2d+uCKG8LeHLwSsNPfN4HpOCTc99od5
 ea84ioFssxx8bwv5hN1M6s6UZpH/x+HjAYg4iHcMsSaurNqIwWTrQtZUCF50zr7sAuQkVjWDVDr
 npD0NacEfZ4DBgmm/UHWpusO+0ekeXD0IOj+vFKeAm9GqNamdCo=
X-Received: by 2002:a05:6a20:914b:b0:240:21e1:cbbd with SMTP id
 adf61e73a8af0-24021e1cda9mr4886593637.26.1754412275130; 
 Tue, 05 Aug 2025 09:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm/6uN6G/KVi2o9cN+/U0oUl1Y1E1Sdo+Y+NbmDyrpK8rXomnmGpne1qkC2tg1XzKix+vaGQ==
X-Received: by 2002:a05:6a20:914b:b0:240:21e1:cbbd with SMTP id
 adf61e73a8af0-24021e1cda9mr4886558637.26.1754412274703; 
 Tue, 05 Aug 2025 09:44:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422b7841besm11489904a12.3.2025.08.05.09.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:44:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: Handle in-place remaps
Date: Tue,  5 Aug 2025 09:44:31 -0700
Message-ID: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfXzIWSpIo53Mld
 hXuQg4XM6MEuawih0jZVX2KZjM3SHZHZphoKsWbGfb6BqNZYEy+Ylzc/c9dUzwNmeB15O01oWdG
 SxF3QplAzRbG4WkRwZimmKY7W67w53q8VDpTesNuxSI0oqecAHVh7bWegypk7IMnoj1TAzrgYhO
 ZGLYHWzpr+ueZWZuBmgMRyXXLlw+XeTNHHp3TGvuat7Vfc/7v20LUI1aYS5tCfS+y6PUUJNdlWZ
 rPIbXxbepfqHqt9K5fUsGdsHlaw/UwV76L00YxpTku1E/S1fDLRwwClGHCGE9tmFls8E/fTL3o6
 p1DbrRLLKr4+ICe6w9vyK2a2RhseooNKb4xV8e9ZdSDFpVp6hpIz+GhSBu+PO7uUhR8Cak+hlcn
 vEaY3S0B+pbsARiiSGx0XPP2YLUWysyMYTr2vC5hu7EA4LcSqBW6i/pXjE8RCt71dzw1f84J
X-Proofpoint-GUID: 4rJy4FbyE1WkWW-SnrBAnp_DyZVHhFm9
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=689234f4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=54pnWYnEFG7XCx_V-2kA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 4rJy4FbyE1WkWW-SnrBAnp_DyZVHhFm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050116
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

Detect and handle the special case of a MAP op simply updating the vma
flags of an existing vma, and skip the pgtable updates.  This allows
turnip to set the MSM_VMA_DUMP flag on an existing mapping without
requiring additional synchronization against commands running on the
GPU.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 41 ++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d1f5bb2e0a16..00d0f3b7ba32 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -451,6 +451,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 struct op_arg {
 	unsigned flags;
 	struct msm_vm_bind_job *job;
+	const struct msm_vm_bind_op *op;
+	bool kept;
 };
 
 static void
@@ -472,14 +474,18 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
 }
 
 static int
-msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gem_object *obj = op->map.gem.obj;
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
 
+	if (arg->kept)
+		return 0;
+
 	vma = vma_from_op(arg, &op->map);
 	if (WARN_ON(IS_ERR(vma)))
 		return PTR_ERR(vma);
@@ -599,15 +605,41 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 }
 
 static int
-msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
+	/*
+	 * Detect in-place remap.  Turnip does this to change the vma flags,
+	 * in particular MSM_VMA_DUMP.  In this case we want to avoid actually
+	 * touching the page tables, as that would require synchronization
+	 * against SUBMIT jobs running on the GPU.
+	 */
+	if (op->unmap.keep &&
+	    (arg->op->op == MSM_VM_BIND_OP_MAP) &&
+	    (vma->gem.obj == arg->op->obj) &&
+	    (vma->gem.offset == arg->op->obj_offset) &&
+	    (vma->va.addr == arg->op->iova) &&
+	    (vma->va.range == arg->op->range)) {
+		/* We are only expecting a single in-place unmap+map cb pair: */
+		WARN_ON(arg->kept);
+
+		/* Leave the existing VMA in place, but signal that to the map cb: */
+		arg->kept = true;
+
+		/* Only flags are changing, so update that in-place: */
+		unsigned orig_flags = vma->flags & (DRM_GPUVA_USERBITS - 1);
+		vma->flags = orig_flags | arg->flags;
+
+		return 0;
+	}
+
 	if (!msm_vma->mapped)
 		goto out_close;
 
@@ -1268,6 +1300,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 		const struct msm_vm_bind_op *op = &job->ops[i];
 		struct op_arg arg = {
 			.job = job,
+			.op = op,
 		};
 
 		switch (op->op) {
-- 
2.50.1

