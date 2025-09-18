Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E683B82CE7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 05:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B0610E632;
	Thu, 18 Sep 2025 03:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lr0qGkGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F0810E632
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HM3cOe028314
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 epLu5R6CcICO0JDsjPteSVEFh0+ik0rCpTgLC84kQpQ=; b=lr0qGkGLDtyx5gYa
 daYckLgCvBwJ7UAu/U072usbootVzMQwJK2+AHfVj7XWJ4VwnRPZNkJE30A6A+ek
 68pG9g8IHPbtuOFLfmXO+eah6FifF18rbialkySHgSp8gP2N4ld5oOT9XEdjZzyu
 nEuAfseanJuMXCeBBEd/yDfv6vAYS1eo1h/exp0gQ1diuX++4I0J8zmLPyQzkoY/
 1x0AxXAhO877WRylrjYYqne0bcMbPkhNF/qlLUx9V61EUJL7THqu5jLxnLFenUUl
 SUgLQxeKPBJBzD25iO7kJAhun4kW1S4aSI7wFlYf4TDEHpVdeEkyecCOU/cGeXYv
 xLre9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497v1jarfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b793b04fe0so10196691cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167484; x=1758772284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epLu5R6CcICO0JDsjPteSVEFh0+ik0rCpTgLC84kQpQ=;
 b=QwJwNGNoLcOyATUJRFT/5tj7GYsXoqIgmRRWosKJSR2a0F4/kHqZkAbYb0yB3dmkuk
 up3ZzZq0+XRXIjAwg07tuz2gvS1D/CAp5Jo2oZomZIbzxSxPg9zEsfWa2+TKAZoJRB3W
 mckZIpsxaCrEFbqNV8rG97WpWUMCy0bvxlsp+2awPc7PKpuk0AqsFasNR5ne47g6H1JA
 Gc3I8G2ipjDSs19qhpwukSy0MtVa4ST8mbmLGUNLKYcHLShEgbYiFSeSc0PGPX3h8avH
 gI5wIHdl+S1rEP3ncgcTOEG6ZrYSjq9jyuxsvFk6bxyrGrnMn3hBX/7PsZ7s+NFxlCEe
 iklg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBM+GTpd1apwC9tyGfAqr8LNhGHJzeNMC8q4rj00NMrKs6NlET8XVBIbmQNmC5e8MMwDfpYrPpmu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe0UpO6rXz6cBhaPwH64foIjoEIsh8l0w09G/5W1rblxV3QzxO
 wXUvdfu09iRZl6bpjX9CgA85wa4Rzv4mRG0cWKzvD489WOA1Ggzn4B480zHzVEZpmmcbTH2OdU5
 t746Mv0gPPlYb9F06ThB4gequ3OdC5FddDIQuiZJP1wQaOzjcvdK/BQjK/RDQtomvsYJVV0M=
X-Gm-Gg: ASbGncvKhgq7x7/rGooVe/tgY2UDKNM5oPN/smU7usg40uPuXovZmGr7BKVLMTyAle1
 gGi5c0heUyE8lAa/YOlVrHuR3CTh+HQ+xFedV29gOdgXyODncPz4uozLdyDQQx8sEkjdUR+Oglj
 TZX/3LG0QAE0oIVzmraHHazhg6cfTPFUCqJvtq8/eF9cE+gs7k0TOGTZdmQ6HRvUsiYE8G4iSHt
 kOfrLyti/DG9uaNkzGCbQSMTghL1QOFjWglBRkdG4PAcY3Ts2DwnuaAjMfpZNUliPbR2Y66IxWk
 UgJd6wpGtO2C2Sz45SCobhgMJ1ldydMgcaieNcocS6ekjE6VELUfRYqS4XO+/jdZeAdwwIUnt86
 I3V7IbCX2eqa3a2cqgVwDnwPW3FOkCLodlzavH1ntP/xrK93KGq9l
X-Received: by 2002:ac8:7dcc:0:b0:4b5:d932:15d2 with SMTP id
 d75a77b69052e-4ba68716584mr47309861cf.23.1758167482523; 
 Wed, 17 Sep 2025 20:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/R+tFUo2Sw3ZWevl+31QwEbfpOJbUUZqsApN4QRR4cZbdwL3nDMvYr5zEYwBOsZL6Dw9syA==
X-Received: by 2002:ac8:7dcc:0:b0:4b5:d932:15d2 with SMTP id
 d75a77b69052e-4ba68716584mr47309531cf.23.1758167481589; 
 Wed, 17 Sep 2025 20:51:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:23 +0300
Subject: [PATCH v5 2/5] drm/msm: split VM_BIND from the rest of GEM VMA
 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-2-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=66862;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WLIFbUDXYPNgrJ9+lsaVYZc3zz8rOqXHti2zHO7Ew7g=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8bpxrW///LWlDXr/lv07W7ZwZIlfxnWc3Ze/dPaME/Yz
 nzi228CnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYiIEHB0P3cq1q8Ty+rLac
 nu3hHi3dGoq+79Y92/vCvF8hLFKMq9N/Ufmrx0FHtj1qa1acvt5XPXOG38dX3t8Vzn32CrXblFv
 mau0V8NH5fp+9TNqewpxJvMZnty70yviYwh/L+IKhfufM2jmB/f9PCK96sfDpVTGGw8E5K3K0PO
 zz5ySI2cr7zWmsvt3lu9R3wy8vzxr/ig5GWXaVPOvy0u7M2b8jjv3K9rqu8ULy8pmyeUxrf1Z8/
 OUirepyiOeE6pyAm9uMvk1WMZ9iJu4Zfefweq2zf/jl9t1r2XtEzfv3xVQ7N/bFMia7WL/yCqkc
 Wzxn57TyW2xPlutfX6n152NcZNDBsmCmr4KfcgPEqjR1AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JadDUYlhJIjauBeL-4B8wxxJa40DS2BA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDExMCBTYWx0ZWRfXyojTBviv0buf
 FyCpJzLROxVR+VdGqPcJMrioHAt9HZgY4w0E+4i+gwpepqerCk5nWIXPvcjPK+BYr5DhReeGVGq
 cAl3vKHRualwg95TO1vAv3E3Hw6MVuHMXczcr7rC8rih+Z9bjaQEuTiHaNo3x0wVwsQZQI4hvLM
 UkI4DuEVzVIGvE0EBOny+TWpYZ4ZLfZDsEfOQXjsDDs5Vt6jjCzreakiBLjA+jHBVZbaR1MDGqb
 /8SQrW19uHLICO9fe2DrmHb5BGq9S2bNWKCM9923NswsQV6XrpxlX6dlY9rWuOqpAvfwjW25C1q
 9glMvORH0W5/S4pdlUmbb+0gb5BOvxT43LyGjOfwsiejXxVKD5Go3BIOtY/F89jZWWavJAz5+QY
 U8ccjJF5
X-Authority-Analysis: v=2.4 cv=AeqxH2XG c=1 sm=1 tr=0 ts=68cb81bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Qwn5WkwXvA7cP8aYHMUA:9
 a=3Xm2iyL4JTYXtahU:21 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JadDUYlhJIjauBeL-4B8wxxJa40DS2BA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170110
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

In preparation to disabling GPU functionality split VM_BIND-related
functions (which are used only for the GPU) from the rest of the GEM VMA
implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |    1 +
 drivers/gpu/drm/msm/msm_gem_vm_bind.c | 1116 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c     | 1177 +--------------------------------
 drivers/gpu/drm/msm/msm_gem_vma.h     |  105 +++
 4 files changed, 1225 insertions(+), 1174 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 0c0dfb25f01b193b10946fae20138caf32cf0ed2..d7876c154b0aa2cb0164c4b1fb7900b1a42db46b 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -115,6 +115,7 @@ msm-y += \
 	msm_gem_shrinker.o \
 	msm_gem_submit.o \
 	msm_gem_vma.o \
+	msm_gem_vm_bind.o \
 	msm_gpu.o \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
diff --git a/drivers/gpu/drm/msm/msm_gem_vm_bind.c b/drivers/gpu/drm/msm/msm_gem_vm_bind.c
new file mode 100644
index 0000000000000000000000000000000000000000..683a5307a609ae7f5c366b4e0ddcdd98039ddea1
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_gem_vm_bind.c
@@ -0,0 +1,1116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2016 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#include <drm/drm_file.h>
+#include <drm/msm_drm.h>
+
+#include <linux/file.h>
+#include <linux/sync_file.h>
+
+#include "msm_drv.h"
+#include "msm_gem.h"
+#include "msm_gem_vma.h"
+#include "msm_gpu.h"
+#include "msm_mmu.h"
+#include "msm_syncobj.h"
+
+/**
+ * struct msm_vma_op - A MAP or UNMAP operation
+ */
+struct msm_vm_op {
+	/** @op: The operation type */
+	enum {
+		MSM_VM_OP_MAP = 1,
+		MSM_VM_OP_UNMAP,
+	} op;
+	union {
+		/** @map: Parameters used if op == MSM_VMA_OP_MAP */
+		struct msm_vm_map_op map;
+		/** @unmap: Parameters used if op == MSM_VMA_OP_UNMAP */
+		struct msm_vm_unmap_op unmap;
+	};
+	/** @node: list head in msm_vm_bind_job::vm_ops */
+	struct list_head node;
+
+	/**
+	 * @obj: backing object for pages to be mapped/unmapped
+	 *
+	 * Async unmap ops, in particular, must hold a reference to the
+	 * original GEM object backing the mapping that will be unmapped.
+	 * But the same can be required in the map path, for example if
+	 * there is not a corresponding unmap op, such as process exit.
+	 *
+	 * This ensures that the pages backing the mapping are not freed
+	 * before the mapping is torn down.
+	 */
+	struct drm_gem_object *obj;
+};
+
+/**
+ * struct msm_vm_bind_job - Tracking for a VM_BIND ioctl
+ *
+ * A table of userspace requested VM updates (MSM_VM_BIND_OP_UNMAP/MAP/MAP_NULL)
+ * gets applied to the vm, generating a list of VM ops (MSM_VM_OP_MAP/UNMAP)
+ * which are applied to the pgtables asynchronously.  For example a userspace
+ * requested MSM_VM_BIND_OP_MAP could end up generating both an MSM_VM_OP_UNMAP
+ * to unmap an existing mapping, and a MSM_VM_OP_MAP to apply the new mapping.
+ */
+struct msm_vm_bind_job {
+	/** @base: base class for drm_sched jobs */
+	struct drm_sched_job base;
+	/** @fence: The fence that is signaled when job completes */
+	struct dma_fence *fence;
+	/** @vm: The VM being operated on */
+	struct drm_gpuvm *vm;
+	/** @queue: The queue that the job runs on */
+	struct msm_gpu_submitqueue *queue;
+	/** @prealloc: Tracking for pre-allocated MMU pgtable pages */
+	struct msm_mmu_prealloc prealloc;
+	/** @vm_ops: a list of struct msm_vm_op */
+	struct list_head vm_ops;
+	/** @bos_pinned: are the GEM objects being bound pinned? */
+	bool bos_pinned;
+	/** @nr_ops: the number of userspace requested ops */
+	unsigned int nr_ops;
+	/**
+	 * @ops: the userspace requested ops
+	 *
+	 * The userspace requested ops are copied/parsed and validated
+	 * before we start applying the updates to try to do as much up-
+	 * front error checking as possible, to avoid the VM being in an
+	 * undefined state due to partially executed VM_BIND.
+	 *
+	 * This table also serves to hold a reference to the backing GEM
+	 * objects.
+	 */
+	struct msm_vm_bind_op {
+		uint32_t op;
+		uint32_t flags;
+		union {
+			struct drm_gem_object *obj;
+			uint32_t handle;
+		};
+		uint64_t obj_offset;
+		uint64_t iova;
+		uint64_t range;
+	} ops[];
+};
+
+#define job_foreach_bo(_obj, _job) \
+	for (unsigned int i = 0; i < (_job)->nr_ops; i++) \
+		if (((_obj) = (_job)->ops[i].obj))
+
+static inline struct msm_vm_bind_job *to_msm_vm_bind_job(struct drm_sched_job *job)
+{
+	return container_of(job, struct msm_vm_bind_job, base);
+}
+
+struct op_arg {
+	unsigned int flags;
+	struct msm_vm_bind_job *job;
+	const struct msm_vm_bind_op *op;
+	bool kept;
+};
+
+static void
+vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
+{
+	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
+	*op = _op;
+	list_add_tail(&op->node, &arg->job->vm_ops);
+
+	if (op->obj)
+		drm_gem_object_get(op->obj);
+}
+
+static struct drm_gpuva *
+vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
+{
+	return msm_gem_vma_new(arg->job->vm, op->gem.obj, op->gem.offset,
+			       op->va.addr, op->va.addr + op->va.range);
+}
+
+int msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
+{
+	struct op_arg *arg = _arg;
+	struct drm_gem_object *obj = op->map.gem.obj;
+	struct drm_gpuva *vma;
+	struct sg_table *sgt;
+	unsigned int prot;
+
+	if (arg->kept)
+		return 0;
+
+	vma = vma_from_op(arg, &op->map);
+	if (WARN_ON(IS_ERR(vma)))
+		return PTR_ERR(vma);
+
+	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
+	       vma->va.addr, vma->va.range);
+
+	vma->flags = ((struct op_arg *)arg)->flags;
+
+	if (obj) {
+		sgt = to_msm_bo(obj)->sgt;
+		prot = msm_gem_prot(obj);
+	} else {
+		sgt = NULL;
+		prot = IOMMU_READ | IOMMU_WRITE;
+	}
+
+	vm_op_enqueue(arg, (struct msm_vm_op){
+		.op = MSM_VM_OP_MAP,
+		.map = {
+			.sgt = sgt,
+			.iova = vma->va.addr,
+			.range = vma->va.range,
+			.offset = vma->gem.offset,
+			.prot = prot,
+			.queue_id = arg->job->queue->id,
+		},
+		.obj = vma->gem.obj,
+	});
+
+	to_msm_vma(vma)->mapped = true;
+
+	return 0;
+}
+
+int msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+{
+	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct drm_gpuvm *vm = job->vm;
+	struct drm_gpuva *orig_vma = op->remap.unmap->va;
+	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
+	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
+	bool mapped = to_msm_vma(orig_vma)->mapped;
+	unsigned int flags;
+
+	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
+	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
+
+	if (mapped) {
+		uint64_t unmap_start, unmap_range;
+
+		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+		vm_op_enqueue(arg, (struct msm_vm_op){
+			.op = MSM_VM_OP_UNMAP,
+			.unmap = {
+				.iova = unmap_start,
+				.range = unmap_range,
+				.queue_id = job->queue->id,
+			},
+			.obj = orig_vma->gem.obj,
+		});
+
+		/*
+		 * Part of this GEM obj is still mapped, but we're going to kill the
+		 * existing VMA and replace it with one or two new ones (ie. two if
+		 * the unmapped range is in the middle of the existing (unmap) VMA).
+		 * So just set the state to unmapped:
+		 */
+		to_msm_vma(orig_vma)->mapped = false;
+	}
+
+	/*
+	 * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
+	 * creation of the new prev/next vma's, in case the vm_bo is tracked
+	 * in the VM's evict list:
+	 */
+	if (vm_bo)
+		drm_gpuvm_bo_get(vm_bo);
+
+	/*
+	 * The prev_vma and/or next_vma are replacing the unmapped vma, and
+	 * therefore should preserve it's flags:
+	 */
+	flags = orig_vma->flags;
+
+	msm_gem_vma_close(orig_vma);
+
+	if (op->remap.prev) {
+		prev_vma = vma_from_op(arg, op->remap.prev);
+		if (WARN_ON(IS_ERR(prev_vma)))
+			return PTR_ERR(prev_vma);
+
+		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma,
+		       prev_vma->va.addr, prev_vma->va.range);
+		to_msm_vma(prev_vma)->mapped = mapped;
+		prev_vma->flags = flags;
+	}
+
+	if (op->remap.next) {
+		next_vma = vma_from_op(arg, op->remap.next);
+		if (WARN_ON(IS_ERR(next_vma)))
+			return PTR_ERR(next_vma);
+
+		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma,
+		       next_vma->va.addr, next_vma->va.range);
+		to_msm_vma(next_vma)->mapped = mapped;
+		next_vma->flags = flags;
+	}
+
+	if (!mapped)
+		drm_gpuvm_bo_evict(vm_bo, true);
+
+	/* Drop the previous ref: */
+	drm_gpuvm_bo_put(vm_bo);
+
+	return 0;
+}
+
+int msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
+{
+	struct op_arg *arg = _arg;
+	struct drm_gpuva *vma = op->unmap.va;
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+
+	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
+	       vma->va.addr, vma->va.range);
+
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
+		unsigned int orig_flags = vma->flags & (DRM_GPUVA_USERBITS - 1);
+
+		vma->flags = orig_flags | arg->flags;
+
+		return 0;
+	}
+
+	if (!msm_vma->mapped)
+		goto out_close;
+
+	vm_op_enqueue(arg, (struct msm_vm_op){
+		.op = MSM_VM_OP_UNMAP,
+		.unmap = {
+			.iova = vma->va.addr,
+			.range = vma->va.range,
+			.queue_id = arg->job->queue->id,
+		},
+		.obj = vma->gem.obj,
+	});
+
+	msm_vma->mapped = false;
+
+out_close:
+	msm_gem_vma_close(vma);
+
+	return 0;
+}
+
+static struct dma_fence *
+msm_vma_job_run(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct drm_gem_object *obj;
+	int ret = vm->unusable ? -EINVAL : 0;
+
+	vm_dbg("");
+
+	mutex_lock(&vm->mmu_lock);
+	vm->mmu->prealloc = &job->prealloc;
+
+	while (!list_empty(&job->vm_ops)) {
+		struct msm_vm_op *op =
+			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
+
+		switch (op->op) {
+		case MSM_VM_OP_MAP:
+			/*
+			 * On error, stop trying to map new things.. but we
+			 * still want to process the unmaps (or in particular,
+			 * the drm_gem_object_put()s)
+			 */
+			if (!ret)
+				ret = vm_map_op(vm, &op->map);
+			break;
+		case MSM_VM_OP_UNMAP:
+			vm_unmap_op(vm, &op->unmap);
+			break;
+		}
+		drm_gem_object_put(op->obj);
+		list_del(&op->node);
+		kfree(op);
+	}
+
+	vm->mmu->prealloc = NULL;
+	mutex_unlock(&vm->mmu_lock);
+
+	/*
+	 * We failed to perform at least _some_ of the pgtable updates, so
+	 * now the VM is in an undefined state.  Game over!
+	 */
+	if (ret)
+		msm_gem_vm_unusable(job->vm);
+
+	job_foreach_bo(obj, job) {
+		msm_gem_lock(obj);
+		msm_gem_unpin_locked(obj);
+		msm_gem_unlock(obj);
+	}
+
+	/* VM_BIND ops are synchronous, so no fence to wait on: */
+	return NULL;
+}
+
+static void
+msm_vma_job_free(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct drm_gem_object *obj;
+
+	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
+
+	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
+	drm_sched_job_cleanup(_job);
+
+	job_foreach_bo(obj, job)
+		drm_gem_object_put(obj);
+
+	msm_submitqueue_put(job->queue);
+	dma_fence_put(job->fence);
+
+	/* In error paths, we could have unexecuted ops: */
+	while (!list_empty(&job->vm_ops)) {
+		struct msm_vm_op *op =
+			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
+		list_del(&op->node);
+		kfree(op);
+	}
+
+	wake_up(&vm->prealloc_throttle.wait);
+
+	kfree(job);
+}
+
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+	.run_job = msm_vma_job_run,
+	.free_job = msm_vma_job_free
+};
+
+int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm)
+{
+	struct drm_sched_init_args args = {
+		.ops = &msm_vm_bind_ops,
+		.num_rqs = 1,
+		.credit_limit = 1,
+		.timeout = MAX_SCHEDULE_TIMEOUT,
+		.name = "msm-vm-bind",
+		.dev = drm->dev,
+	};
+	int ret;
+
+	ret = drm_sched_init(&vm->sched, &args);
+	if (ret)
+		return ret;
+
+	init_waitqueue_head(&vm->prealloc_throttle.wait);
+
+	return 0;
+}
+
+void msm_gem_vm_sched_fini(struct msm_gem_vm *vm)
+{
+	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
+	drm_sched_stop(&vm->sched, NULL);
+	drm_sched_fini(&vm->sched);
+}
+
+static struct msm_vm_bind_job *
+vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
+		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
+{
+	struct msm_vm_bind_job *job;
+	uint64_t sz;
+	int ret;
+
+	sz = struct_size(job, ops, nr_ops);
+
+	if (sz > SIZE_MAX)
+		return ERR_PTR(-ENOMEM);
+
+	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
+	if (!job)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_sched_job_init(&job->base, queue->entity, 1, queue,
+				 file->client_id);
+	if (ret) {
+		kfree(job);
+		return ERR_PTR(ret);
+	}
+
+	job->vm = msm_context_vm(dev, queue->ctx);
+	job->queue = queue;
+	INIT_LIST_HEAD(&job->vm_ops);
+
+	return job;
+}
+
+static bool invalid_alignment(uint64_t addr)
+{
+	/*
+	 * Technically this is about GPU alignment, not CPU alignment.  But
+	 * I've not seen any qcom SoC where the SMMU does not support the
+	 * CPU's smallest page size.
+	 */
+	return !PAGE_ALIGNED(addr);
+}
+
+static int
+lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
+{
+	struct drm_device *dev = job->vm->drm;
+	int i = job->nr_ops++;
+	int ret = 0;
+
+	job->ops[i].op = op->op;
+	job->ops[i].handle = op->handle;
+	job->ops[i].obj_offset = op->obj_offset;
+	job->ops[i].iova = op->iova;
+	job->ops[i].range = op->range;
+	job->ops[i].flags = op->flags;
+
+	if (op->flags & ~MSM_VM_BIND_OP_FLAGS)
+		ret = UERR(EINVAL, dev, "invalid flags: %x\n", op->flags);
+
+	if (invalid_alignment(op->iova))
+		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
+
+	if (invalid_alignment(op->obj_offset))
+		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
+
+	if (invalid_alignment(op->range))
+		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
+
+	if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
+		ret = UERR(EINVAL, dev, "invalid range: %016llx, %016llx\n", op->iova, op->range);
+
+	/*
+	 * MAP must specify a valid handle.  But the handle MBZ for
+	 * UNMAP or MAP_NULL.
+	 */
+	if (op->op == MSM_VM_BIND_OP_MAP) {
+		if (!op->handle)
+			ret = UERR(EINVAL, dev, "invalid handle\n");
+	} else if (op->handle) {
+		ret = UERR(EINVAL, dev, "handle must be zero\n");
+	}
+
+	switch (op->op) {
+	case MSM_VM_BIND_OP_MAP:
+	case MSM_VM_BIND_OP_MAP_NULL:
+	case MSM_VM_BIND_OP_UNMAP:
+		break;
+	default:
+		ret = UERR(EINVAL, dev, "invalid op: %u\n", op->op);
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * ioctl parsing, parameter validation, and GEM handle lookup
+ */
+static int
+vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args,
+		       struct drm_file *file, int *nr_bos)
+{
+	struct drm_device *dev = job->vm->drm;
+	int ret = 0;
+	int cnt = 0;
+	int i = -1;
+
+	if (args->nr_ops == 1) {
+		/* Single op case, the op is inlined: */
+		ret = lookup_op(job, &args->op);
+	} else {
+		for (unsigned int i = 0; i < args->nr_ops; i++) {
+			struct drm_msm_vm_bind_op op;
+			void __user *userptr =
+				u64_to_user_ptr(args->ops + (i * sizeof(op)));
+
+			/* make sure we don't have garbage flags, in case we hit
+			 * error path before flags is initialized:
+			 */
+			job->ops[i].flags = 0;
+
+			if (copy_from_user(&op, userptr, sizeof(op))) {
+				ret = -EFAULT;
+				break;
+			}
+
+			ret = lookup_op(job, &op);
+			if (ret)
+				break;
+		}
+	}
+
+	if (ret) {
+		job->nr_ops = 0;
+		goto out;
+	}
+
+	spin_lock(&file->table_lock);
+
+	for (i = 0; i < args->nr_ops; i++) {
+		struct msm_vm_bind_op *op = &job->ops[i];
+		struct drm_gem_object *obj;
+
+		if (!op->handle) {
+			op->obj = NULL;
+			continue;
+		}
+
+		/*
+		 * normally use drm_gem_object_lookup(), but for bulk lookup
+		 * all under single table_lock just hit object_idr directly:
+		 */
+		obj = idr_find(&file->object_idr, op->handle);
+		if (!obj) {
+			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
+			goto out_unlock;
+		}
+
+		drm_gem_object_get(obj);
+
+		op->obj = obj;
+		cnt++;
+
+		if ((op->range + op->obj_offset) > obj->size) {
+			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
+				   op->range, op->obj_offset, obj->size);
+			goto out_unlock;
+		}
+	}
+
+	*nr_bos = cnt;
+
+out_unlock:
+	spin_unlock(&file->table_lock);
+
+	if (ret) {
+		for (; i >= 0; i--) {
+			struct msm_vm_bind_op *op = &job->ops[i];
+
+			if (!op->obj)
+				continue;
+
+			drm_gem_object_put(op->obj);
+			op->obj = NULL;
+		}
+	}
+out:
+	return ret;
+}
+
+static void
+prealloc_count(struct msm_vm_bind_job *job,
+	       struct msm_vm_bind_op *first,
+	       struct msm_vm_bind_op *last)
+{
+	struct msm_mmu *mmu = to_msm_vm(job->vm)->mmu;
+
+	if (!first)
+		return;
+
+	uint64_t start_iova = first->iova;
+	uint64_t end_iova = last->iova + last->range;
+
+	mmu->funcs->prealloc_count(mmu, &job->prealloc, start_iova, end_iova - start_iova);
+}
+
+static bool
+ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
+{
+	/*
+	 * Last level pte covers 2MB.. so we should merge two ops, from
+	 * the PoV of figuring out how much pgtable pages to pre-allocate
+	 * if they land in the same 2MB range:
+	 */
+	uint64_t pte_mask = ~(SZ_2M - 1);
+
+	return ((first->iova + first->range) & pte_mask) == (next->iova & pte_mask);
+}
+
+/*
+ * Determine the amount of memory to prealloc for pgtables.  For sparse images,
+ * in particular, userspace plays some tricks with the order of page mappings
+ * to get the desired swizzle pattern, resulting in a large # of tiny MAP ops.
+ * So detect when multiple MAP operations are physically contiguous, and count
+ * them as a single mapping.  Otherwise the prealloc_count() will not realize
+ * they can share pagetable pages and vastly overcount.
+ */
+static int
+vm_bind_prealloc_count(struct msm_vm_bind_job *job)
+{
+	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	int ret;
+
+	for (int i = 0; i < job->nr_ops; i++) {
+		struct msm_vm_bind_op *op = &job->ops[i];
+
+		/* We only care about MAP/MAP_NULL: */
+		if (op->op == MSM_VM_BIND_OP_UNMAP)
+			continue;
+
+		/*
+		 * If op is contiguous with last in the current range, then
+		 * it becomes the new last in the range and we continue
+		 * looping:
+		 */
+		if (last && ops_are_same_pte(last, op)) {
+			last = op;
+			continue;
+		}
+
+		/*
+		 * If op is not contiguous with the current range, flush
+		 * the current range and start anew:
+		 */
+		prealloc_count(job, first, last);
+		first = last = op;
+	}
+
+	/* Flush the remaining range: */
+	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			vm->prealloc_throttle.wait,
+			atomic_read(&vm->prealloc_throttle.in_flight) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
+	return 0;
+}
+
+/*
+ * Lock VM and GEM objects
+ */
+static int
+vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
+{
+	int ret;
+
+	/* Lock VM and objects: */
+	drm_exec_until_all_locked(exec) {
+		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(job->vm));
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			return ret;
+
+		for (unsigned int i = 0; i < job->nr_ops; i++) {
+			const struct msm_vm_bind_op *op = &job->ops[i];
+
+			switch (op->op) {
+			case MSM_VM_BIND_OP_UNMAP:
+				ret = drm_gpuvm_sm_unmap_exec_lock(job->vm, exec,
+							      op->iova,
+							      op->obj_offset);
+				break;
+			case MSM_VM_BIND_OP_MAP:
+			case MSM_VM_BIND_OP_MAP_NULL: {
+				struct drm_gpuvm_map_req map_req = {
+					.map.va.addr = op->iova,
+					.map.va.range = op->range,
+					.map.gem.obj = op->obj,
+					.map.gem.offset = op->obj_offset,
+				};
+
+				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
+				break;
+			}
+			default:
+				/*
+				 * lookup_op() should have already thrown an error for
+				 * invalid ops
+				 */
+				WARN_ON("unreachable");
+			}
+
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Pin GEM objects, ensuring that we have backing pages.  Pinning will move
+ * the object to the pinned LRU so that the shrinker knows to first consider
+ * other objects for evicting.
+ */
+static int
+vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
+{
+	struct drm_gem_object *obj;
+
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	job_foreach_bo(obj, job) {
+		struct page **pages;
+
+		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
+		if (IS_ERR(pages))
+			return PTR_ERR(pages);
+	}
+
+	struct msm_drm_private *priv = job->vm->drm->dev_private;
+
+	/*
+	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
+	 * the LRU lock for each individual bo, while (b) avoiding holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked() (which could trigger
+	 * get_pages() which could trigger reclaim.. and if we held the LRU lock
+	 * could trigger deadlock with the shrinker).
+	 */
+	mutex_lock(&priv->lru.lock);
+	job_foreach_bo(obj, job)
+		msm_gem_pin_obj_locked(obj);
+	mutex_unlock(&priv->lru.lock);
+
+	job->bos_pinned = true;
+
+	return 0;
+}
+
+/*
+ * Unpin GEM objects.  Normally this is done after the bind job is run.
+ */
+static void
+vm_bind_job_unpin_objects(struct msm_vm_bind_job *job)
+{
+	struct drm_gem_object *obj;
+
+	if (!job->bos_pinned)
+		return;
+
+	job_foreach_bo(obj, job)
+		msm_gem_unpin_locked(obj);
+
+	job->bos_pinned = false;
+}
+
+/*
+ * Pre-allocate pgtable memory, and translate the VM bind requests into a
+ * sequence of pgtable updates to be applied asynchronously.
+ */
+static int
+vm_bind_job_prepare(struct msm_vm_bind_job *job)
+{
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct msm_mmu *mmu = vm->mmu;
+	int ret;
+
+	ret = mmu->funcs->prealloc_allocate(mmu, &job->prealloc);
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < job->nr_ops; i++) {
+		const struct msm_vm_bind_op *op = &job->ops[i];
+		struct op_arg arg = {
+			.job = job,
+			.op = op,
+		};
+
+		switch (op->op) {
+		case MSM_VM_BIND_OP_UNMAP:
+			ret = drm_gpuvm_sm_unmap(job->vm, &arg, op->iova,
+						 op->range);
+			break;
+		case MSM_VM_BIND_OP_MAP:
+			if (op->flags & MSM_VM_BIND_OP_DUMP)
+				arg.flags |= MSM_VMA_DUMP;
+			fallthrough;
+		case MSM_VM_BIND_OP_MAP_NULL: {
+			struct drm_gpuvm_map_req map_req = {
+				.map.va.addr = op->iova,
+				.map.va.range = op->range,
+				.map.gem.obj = op->obj,
+				.map.gem.offset = op->obj_offset,
+			};
+
+			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
+			break;
+		}
+		default:
+			/*
+			 * lookup_op() should have already thrown an error for
+			 * invalid ops
+			 */
+			BUG_ON("unreachable");
+		}
+
+		if (ret) {
+			/*
+			 * If we've already started modifying the vm, we can't
+			 * adequetly describe to userspace the intermediate
+			 * state the vm is in.  So throw up our hands!
+			 */
+			if (i > 0)
+				msm_gem_vm_unusable(job->vm);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Attach fences to the GEM objects being bound.  This will signify to
+ * the shrinker that they are busy even after dropping the locks (ie.
+ * drm_exec_fini())
+ */
+static void
+vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
+{
+	for (unsigned int i = 0; i < job->nr_ops; i++) {
+		struct drm_gem_object *obj = job->ops[i].obj;
+
+		if (!obj)
+			continue;
+
+		dma_resv_add_fence(obj->resv, job->fence,
+				   DMA_RESV_USAGE_KERNEL);
+	}
+}
+
+int
+msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_vm_bind *args = data;
+	struct msm_context *ctx = file->driver_priv;
+	struct msm_vm_bind_job *job = NULL;
+	struct msm_gpu *gpu = priv->gpu;
+	struct msm_gpu_submitqueue *queue;
+	struct msm_syncobj_post_dep *post_deps = NULL;
+	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
+	struct dma_fence *fence;
+	int out_fence_fd = -1;
+	int ret, nr_bos = 0;
+	unsigned int i;
+
+	if (!gpu)
+		return -ENXIO;
+
+	/*
+	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
+	 * immediately close the device file and all will be torn down.
+	 */
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
+	/*
+	 * Technically, you cannot create a VM_BIND submitqueue in the first
+	 * place, if you haven't opted in to VM_BIND context.  But it is
+	 * cleaner / less confusing, to check this case directly.
+	 */
+	if (!msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "context does not support vmbind");
+
+	if (args->flags & ~MSM_VM_BIND_FLAGS)
+		return UERR(EINVAL, dev, "invalid flags");
+
+	queue = msm_submitqueue_get(ctx, args->queue_id);
+	if (!queue)
+		return -ENOENT;
+
+	if (!(queue->flags & MSM_SUBMITQUEUE_VM_BIND)) {
+		ret = UERR(EINVAL, dev, "Invalid queue type");
+		goto out_post_unlock;
+	}
+
+	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
+		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		if (out_fence_fd < 0) {
+			ret = out_fence_fd;
+			goto out_post_unlock;
+		}
+	}
+
+	job = vm_bind_job_create(dev, file, queue, args->nr_ops);
+	if (IS_ERR(job)) {
+		ret = PTR_ERR(job);
+		goto out_post_unlock;
+	}
+
+	ret = mutex_lock_interruptible(&queue->lock);
+	if (ret)
+		goto out_post_unlock;
+
+	if (args->flags & MSM_VM_BIND_FENCE_FD_IN) {
+		struct dma_fence *in_fence;
+
+		in_fence = sync_file_get_fence(args->fence_fd);
+
+		if (!in_fence) {
+			ret = UERR(EINVAL, dev, "invalid in-fence");
+			goto out_unlock;
+		}
+
+		ret = drm_sched_job_add_dependency(&job->base, in_fence);
+		if (ret)
+			goto out_unlock;
+	}
+
+	if (args->in_syncobjs > 0) {
+		syncobjs_to_reset = msm_syncobj_parse_deps(dev, &job->base,
+							   file, args->in_syncobjs,
+							   args->nr_in_syncobjs,
+							   args->syncobj_stride);
+		if (IS_ERR(syncobjs_to_reset)) {
+			ret = PTR_ERR(syncobjs_to_reset);
+			goto out_unlock;
+		}
+	}
+
+	if (args->out_syncobjs > 0) {
+		post_deps = msm_syncobj_parse_post_deps(dev, file,
+							args->out_syncobjs,
+							args->nr_out_syncobjs,
+							args->syncobj_stride);
+		if (IS_ERR(post_deps)) {
+			ret = PTR_ERR(post_deps);
+			goto out_unlock;
+		}
+	}
+
+	ret = vm_bind_job_lookup_ops(job, args, file, &nr_bos);
+	if (ret)
+		goto out_unlock;
+
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
+
+	struct drm_exec exec;
+	unsigned int flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
+
+	drm_exec_init(&exec, flags, nr_bos + 1);
+
+	ret = vm_bind_job_lock_objects(job, &exec);
+	if (ret)
+		goto out;
+
+	ret = vm_bind_job_pin_objects(job);
+	if (ret)
+		goto out;
+
+	ret = vm_bind_job_prepare(job);
+	if (ret)
+		goto out;
+
+	drm_sched_job_arm(&job->base);
+
+	job->fence = dma_fence_get(&job->base.s_fence->finished);
+
+	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
+		sync_file = sync_file_create(job->fence);
+		if (!sync_file)
+			ret = -ENOMEM;
+	}
+
+	if (ret)
+		goto out;
+
+	vm_bind_job_attach_fences(job);
+
+	/*
+	 * The job can be free'd (and fence unref'd) at any point after
+	 * drm_sched_entity_push_job(), so we need to hold our own ref
+	 */
+	fence = dma_fence_get(job->fence);
+
+	drm_sched_entity_push_job(&job->base);
+
+	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
+	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, fence);
+
+	dma_fence_put(fence);
+
+out:
+	if (ret)
+		vm_bind_job_unpin_objects(job);
+
+	drm_exec_fini(&exec);
+out_unlock:
+	mutex_unlock(&queue->lock);
+out_post_unlock:
+	if (ret) {
+		if (out_fence_fd >= 0)
+			put_unused_fd(out_fence_fd);
+		if (sync_file)
+			fput(sync_file->file);
+	} else if (sync_file) {
+		fd_install(out_fence_fd, sync_file->file);
+		args->fence_fd = out_fence_fd;
+	}
+
+	if (!IS_ERR_OR_NULL(job)) {
+		if (ret)
+			msm_vma_job_free(&job->base);
+	} else {
+		/*
+		 * If the submit hasn't yet taken ownership of the queue
+		 * then we need to drop the reference ourself:
+		 */
+		msm_submitqueue_put(queue);
+	}
+
+	if (!IS_ERR_OR_NULL(post_deps)) {
+		for (i = 0; i < args->nr_out_syncobjs; ++i) {
+			kfree(post_deps[i].chain);
+			drm_syncobj_put(post_deps[i].syncobj);
+		}
+		kfree(post_deps);
+	}
+
+	if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
+		for (i = 0; i < args->nr_in_syncobjs; ++i) {
+			if (syncobjs_to_reset[i])
+				drm_syncobj_put(syncobjs_to_reset[i]);
+		}
+		kfree(syncobjs_to_reset);
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8316af1723c227f919594446c3721e1a948cbc9e..3f44d1d973137d99aa1a3d9e26739c34e1acc534 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -11,150 +11,15 @@
 
 #include "msm_drv.h"
 #include "msm_gem.h"
+#include "msm_gem_vma.h"
 #include "msm_gpu.h"
 #include "msm_mmu.h"
 #include "msm_syncobj.h"
 
-#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
-
 static uint vm_log_shift = 0;
 MODULE_PARM_DESC(vm_log_shift, "Length of VM op log");
 module_param_named(vm_log_shift, vm_log_shift, uint, 0600);
 
-/**
- * struct msm_vm_map_op - create new pgtable mapping
- */
-struct msm_vm_map_op {
-	/** @iova: start address for mapping */
-	uint64_t iova;
-	/** @range: size of the region to map */
-	uint64_t range;
-	/** @offset: offset into @sgt to map */
-	uint64_t offset;
-	/** @sgt: pages to map, or NULL for a PRR mapping */
-	struct sg_table *sgt;
-	/** @prot: the mapping protection flags */
-	int prot;
-
-	/**
-	 * @queue_id: The id of the submitqueue the operation is performed
-	 * on, or zero for (in particular) UNMAP ops triggered outside of
-	 * a submitqueue (ie. process cleanup)
-	 */
-	int queue_id;
-};
-
-/**
- * struct msm_vm_unmap_op - unmap a range of pages from pgtable
- */
-struct msm_vm_unmap_op {
-	/** @iova: start address for unmap */
-	uint64_t iova;
-	/** @range: size of region to unmap */
-	uint64_t range;
-
-	/** @reason: The reason for the unmap */
-	const char *reason;
-
-	/**
-	 * @queue_id: The id of the submitqueue the operation is performed
-	 * on, or zero for (in particular) UNMAP ops triggered outside of
-	 * a submitqueue (ie. process cleanup)
-	 */
-	int queue_id;
-};
-
-/**
- * struct msm_vma_op - A MAP or UNMAP operation
- */
-struct msm_vm_op {
-	/** @op: The operation type */
-	enum {
-		MSM_VM_OP_MAP = 1,
-		MSM_VM_OP_UNMAP,
-	} op;
-	union {
-		/** @map: Parameters used if op == MSM_VMA_OP_MAP */
-		struct msm_vm_map_op map;
-		/** @unmap: Parameters used if op == MSM_VMA_OP_UNMAP */
-		struct msm_vm_unmap_op unmap;
-	};
-	/** @node: list head in msm_vm_bind_job::vm_ops */
-	struct list_head node;
-
-	/**
-	 * @obj: backing object for pages to be mapped/unmapped
-	 *
-	 * Async unmap ops, in particular, must hold a reference to the
-	 * original GEM object backing the mapping that will be unmapped.
-	 * But the same can be required in the map path, for example if
-	 * there is not a corresponding unmap op, such as process exit.
-	 *
-	 * This ensures that the pages backing the mapping are not freed
-	 * before the mapping is torn down.
-	 */
-	struct drm_gem_object *obj;
-};
-
-/**
- * struct msm_vm_bind_job - Tracking for a VM_BIND ioctl
- *
- * A table of userspace requested VM updates (MSM_VM_BIND_OP_UNMAP/MAP/MAP_NULL)
- * gets applied to the vm, generating a list of VM ops (MSM_VM_OP_MAP/UNMAP)
- * which are applied to the pgtables asynchronously.  For example a userspace
- * requested MSM_VM_BIND_OP_MAP could end up generating both an MSM_VM_OP_UNMAP
- * to unmap an existing mapping, and a MSM_VM_OP_MAP to apply the new mapping.
- */
-struct msm_vm_bind_job {
-	/** @base: base class for drm_sched jobs */
-	struct drm_sched_job base;
-	/** @vm: The VM being operated on */
-	struct drm_gpuvm *vm;
-	/** @fence: The fence that is signaled when job completes */
-	struct dma_fence *fence;
-	/** @queue: The queue that the job runs on */
-	struct msm_gpu_submitqueue *queue;
-	/** @prealloc: Tracking for pre-allocated MMU pgtable pages */
-	struct msm_mmu_prealloc prealloc;
-	/** @vm_ops: a list of struct msm_vm_op */
-	struct list_head vm_ops;
-	/** @bos_pinned: are the GEM objects being bound pinned? */
-	bool bos_pinned;
-	/** @nr_ops: the number of userspace requested ops */
-	unsigned int nr_ops;
-	/**
-	 * @ops: the userspace requested ops
-	 *
-	 * The userspace requested ops are copied/parsed and validated
-	 * before we start applying the updates to try to do as much up-
-	 * front error checking as possible, to avoid the VM being in an
-	 * undefined state due to partially executed VM_BIND.
-	 *
-	 * This table also serves to hold a reference to the backing GEM
-	 * objects.
-	 */
-	struct msm_vm_bind_op {
-		uint32_t op;
-		uint32_t flags;
-		union {
-			struct drm_gem_object *obj;
-			uint32_t handle;
-		};
-		uint64_t obj_offset;
-		uint64_t iova;
-		uint64_t range;
-	} ops[];
-};
-
-#define job_foreach_bo(obj, _job) \
-	for (unsigned i = 0; i < (_job)->nr_ops; i++) \
-		if ((obj = (_job)->ops[i].obj))
-
-static inline struct msm_vm_bind_job *to_msm_vm_bind_job(struct drm_sched_job *job)
-{
-	return container_of(job, struct msm_vm_bind_job, base);
-}
-
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -221,49 +86,6 @@ msm_gem_vm_unusable(struct drm_gpuvm *gpuvm)
 	mutex_unlock(&vm->mmu_lock);
 }
 
-static void
-vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int queue_id)
-{
-	int idx;
-
-	if (!vm->managed)
-		lockdep_assert_held(&vm->mmu_lock);
-
-	vm_dbg("%s:%p:%d: %016llx %016llx", op, vm, queue_id, iova, iova + range);
-
-	if (!vm->log)
-		return;
-
-	idx = vm->log_idx;
-	vm->log[idx].op = op;
-	vm->log[idx].iova = iova;
-	vm->log[idx].range = range;
-	vm->log[idx].queue_id = queue_id;
-	vm->log_idx = (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
-}
-
-static void
-vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
-{
-	const char *reason = op->reason;
-
-	if (!reason)
-		reason = "unmap";
-
-	vm_log(vm, reason, op->iova, op->range, op->queue_id);
-
-	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
-}
-
-static int
-vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
-{
-	vm_log(vm, "map", op->iova, op->range, op->queue_id);
-
-	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
-				   op->range, op->prot);
-}
-
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason)
 {
@@ -455,219 +277,6 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 	return 0;
 }
 
-struct op_arg {
-	unsigned flags;
-	struct msm_vm_bind_job *job;
-	const struct msm_vm_bind_op *op;
-	bool kept;
-};
-
-static void
-vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
-{
-	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
-	*op = _op;
-	list_add_tail(&op->node, &arg->job->vm_ops);
-
-	if (op->obj)
-		drm_gem_object_get(op->obj);
-}
-
-static struct drm_gpuva *
-vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
-{
-	return msm_gem_vma_new(arg->job->vm, op->gem.obj, op->gem.offset,
-			       op->va.addr, op->va.addr + op->va.range);
-}
-
-static int
-msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
-{
-	struct op_arg *arg = _arg;
-	struct msm_vm_bind_job *job = arg->job;
-	struct drm_gem_object *obj = op->map.gem.obj;
-	struct drm_gpuva *vma;
-	struct sg_table *sgt;
-	unsigned prot;
-
-	if (arg->kept)
-		return 0;
-
-	vma = vma_from_op(arg, &op->map);
-	if (WARN_ON(IS_ERR(vma)))
-		return PTR_ERR(vma);
-
-	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
-	       vma->va.addr, vma->va.range);
-
-	vma->flags = ((struct op_arg *)arg)->flags;
-
-	if (obj) {
-		sgt = to_msm_bo(obj)->sgt;
-		prot = msm_gem_prot(obj);
-	} else {
-		sgt = NULL;
-		prot = IOMMU_READ | IOMMU_WRITE;
-	}
-
-	vm_op_enqueue(arg, (struct msm_vm_op){
-		.op = MSM_VM_OP_MAP,
-		.map = {
-			.sgt = sgt,
-			.iova = vma->va.addr,
-			.range = vma->va.range,
-			.offset = vma->gem.offset,
-			.prot = prot,
-			.queue_id = job->queue->id,
-		},
-		.obj = vma->gem.obj,
-	});
-
-	to_msm_vma(vma)->mapped = true;
-
-	return 0;
-}
-
-static int
-msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
-{
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
-	struct drm_gpuvm *vm = job->vm;
-	struct drm_gpuva *orig_vma = op->remap.unmap->va;
-	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
-	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
-	bool mapped = to_msm_vma(orig_vma)->mapped;
-	unsigned flags;
-
-	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
-	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
-
-	if (mapped) {
-		uint64_t unmap_start, unmap_range;
-
-		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
-
-		vm_op_enqueue(arg, (struct msm_vm_op){
-			.op = MSM_VM_OP_UNMAP,
-			.unmap = {
-				.iova = unmap_start,
-				.range = unmap_range,
-				.queue_id = job->queue->id,
-			},
-			.obj = orig_vma->gem.obj,
-		});
-
-		/*
-		 * Part of this GEM obj is still mapped, but we're going to kill the
-		 * existing VMA and replace it with one or two new ones (ie. two if
-		 * the unmapped range is in the middle of the existing (unmap) VMA).
-		 * So just set the state to unmapped:
-		 */
-		to_msm_vma(orig_vma)->mapped = false;
-	}
-
-	/*
-	 * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
-	 * creation of the new prev/next vma's, in case the vm_bo is tracked
-	 * in the VM's evict list:
-	 */
-	if (vm_bo)
-		drm_gpuvm_bo_get(vm_bo);
-
-	/*
-	 * The prev_vma and/or next_vma are replacing the unmapped vma, and
-	 * therefore should preserve it's flags:
-	 */
-	flags = orig_vma->flags;
-
-	msm_gem_vma_close(orig_vma);
-
-	if (op->remap.prev) {
-		prev_vma = vma_from_op(arg, op->remap.prev);
-		if (WARN_ON(IS_ERR(prev_vma)))
-			return PTR_ERR(prev_vma);
-
-		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
-		to_msm_vma(prev_vma)->mapped = mapped;
-		prev_vma->flags = flags;
-	}
-
-	if (op->remap.next) {
-		next_vma = vma_from_op(arg, op->remap.next);
-		if (WARN_ON(IS_ERR(next_vma)))
-			return PTR_ERR(next_vma);
-
-		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
-		to_msm_vma(next_vma)->mapped = mapped;
-		next_vma->flags = flags;
-	}
-
-	if (!mapped)
-		drm_gpuvm_bo_evict(vm_bo, true);
-
-	/* Drop the previous ref: */
-	drm_gpuvm_bo_put(vm_bo);
-
-	return 0;
-}
-
-static int
-msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
-{
-	struct op_arg *arg = _arg;
-	struct msm_vm_bind_job *job = arg->job;
-	struct drm_gpuva *vma = op->unmap.va;
-	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-
-	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
-	       vma->va.addr, vma->va.range);
-
-	/*
-	 * Detect in-place remap.  Turnip does this to change the vma flags,
-	 * in particular MSM_VMA_DUMP.  In this case we want to avoid actually
-	 * touching the page tables, as that would require synchronization
-	 * against SUBMIT jobs running on the GPU.
-	 */
-	if (op->unmap.keep &&
-	    (arg->op->op == MSM_VM_BIND_OP_MAP) &&
-	    (vma->gem.obj == arg->op->obj) &&
-	    (vma->gem.offset == arg->op->obj_offset) &&
-	    (vma->va.addr == arg->op->iova) &&
-	    (vma->va.range == arg->op->range)) {
-		/* We are only expecting a single in-place unmap+map cb pair: */
-		WARN_ON(arg->kept);
-
-		/* Leave the existing VMA in place, but signal that to the map cb: */
-		arg->kept = true;
-
-		/* Only flags are changing, so update that in-place: */
-		unsigned orig_flags = vma->flags & (DRM_GPUVA_USERBITS - 1);
-		vma->flags = orig_flags | arg->flags;
-
-		return 0;
-	}
-
-	if (!msm_vma->mapped)
-		goto out_close;
-
-	vm_op_enqueue(arg, (struct msm_vm_op){
-		.op = MSM_VM_OP_UNMAP,
-		.unmap = {
-			.iova = vma->va.addr,
-			.range = vma->va.range,
-			.queue_id = job->queue->id,
-		},
-		.obj = vma->gem.obj,
-	});
-
-	msm_vma->mapped = false;
-
-out_close:
-	msm_gem_vma_close(vma);
-
-	return 0;
-}
-
 static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 	.vm_bo_validate = msm_gem_vm_bo_validate,
@@ -676,99 +285,6 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
-static struct dma_fence *
-msm_vma_job_run(struct drm_sched_job *_job)
-{
-	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
-	struct msm_gem_vm *vm = to_msm_vm(job->vm);
-	struct drm_gem_object *obj;
-	int ret = vm->unusable ? -EINVAL : 0;
-
-	vm_dbg("");
-
-	mutex_lock(&vm->mmu_lock);
-	vm->mmu->prealloc = &job->prealloc;
-
-	while (!list_empty(&job->vm_ops)) {
-		struct msm_vm_op *op =
-			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
-
-		switch (op->op) {
-		case MSM_VM_OP_MAP:
-			/*
-			 * On error, stop trying to map new things.. but we
-			 * still want to process the unmaps (or in particular,
-			 * the drm_gem_object_put()s)
-			 */
-			if (!ret)
-				ret = vm_map_op(vm, &op->map);
-			break;
-		case MSM_VM_OP_UNMAP:
-			vm_unmap_op(vm, &op->unmap);
-			break;
-		}
-		drm_gem_object_put(op->obj);
-		list_del(&op->node);
-		kfree(op);
-	}
-
-	vm->mmu->prealloc = NULL;
-	mutex_unlock(&vm->mmu_lock);
-
-	/*
-	 * We failed to perform at least _some_ of the pgtable updates, so
-	 * now the VM is in an undefined state.  Game over!
-	 */
-	if (ret)
-		msm_gem_vm_unusable(job->vm);
-
-	job_foreach_bo (obj, job) {
-		msm_gem_lock(obj);
-		msm_gem_unpin_locked(obj);
-		msm_gem_unlock(obj);
-	}
-
-	/* VM_BIND ops are synchronous, so no fence to wait on: */
-	return NULL;
-}
-
-static void
-msm_vma_job_free(struct drm_sched_job *_job)
-{
-	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
-	struct msm_gem_vm *vm = to_msm_vm(job->vm);
-	struct drm_gem_object *obj;
-
-	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
-
-	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
-
-	drm_sched_job_cleanup(_job);
-
-	job_foreach_bo (obj, job)
-		drm_gem_object_put(obj);
-
-	msm_submitqueue_put(job->queue);
-	dma_fence_put(job->fence);
-
-	/* In error paths, we could have unexecuted ops: */
-	while (!list_empty(&job->vm_ops)) {
-		struct msm_vm_op *op =
-			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
-		list_del(&op->node);
-		kfree(op);
-	}
-
-	wake_up(&vm->prealloc_throttle.wait);
-
-	kfree(job);
-}
-
-static const struct drm_sched_backend_ops msm_vm_bind_ops = {
-	.run_job = msm_vma_job_run,
-	.free_job = msm_vma_job_free
-};
-
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -811,20 +327,9 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 	}
 
 	if (!managed) {
-		struct drm_sched_init_args args = {
-			.ops = &msm_vm_bind_ops,
-			.num_rqs = 1,
-			.credit_limit = 1,
-			.timeout = MAX_SCHEDULE_TIMEOUT,
-			.name = "msm-vm-bind",
-			.dev = drm->dev,
-		};
-
-		ret = drm_sched_init(&vm->sched, &args);
+		ret = msm_gem_vm_sched_init(vm, drm);
 		if (ret)
 			goto err_free_dummy;
-
-		init_waitqueue_head(&vm->prealloc_throttle.wait);
 	}
 
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
@@ -889,9 +394,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 	if (vm->last_fence)
 		dma_fence_wait(vm->last_fence, false);
 
-	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
-	drm_sched_stop(&vm->sched, NULL);
-	drm_sched_fini(&vm->sched);
+	msm_gem_vm_sched_fini(vm);
 
 	/* Tear down any remaining mappings: */
 	drm_exec_init(&exec, 0, 2);
@@ -924,677 +427,3 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 	}
 	drm_exec_fini(&exec);
 }
-
-
-static struct msm_vm_bind_job *
-vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
-		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
-{
-	struct msm_vm_bind_job *job;
-	uint64_t sz;
-	int ret;
-
-	sz = struct_size(job, ops, nr_ops);
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
-	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
-	if (!job)
-		return ERR_PTR(-ENOMEM);
-
-	ret = drm_sched_job_init(&job->base, queue->entity, 1, queue,
-				 file->client_id);
-	if (ret) {
-		kfree(job);
-		return ERR_PTR(ret);
-	}
-
-	job->vm = msm_context_vm(dev, queue->ctx);
-	job->queue = queue;
-	INIT_LIST_HEAD(&job->vm_ops);
-
-	return job;
-}
-
-static bool invalid_alignment(uint64_t addr)
-{
-	/*
-	 * Technically this is about GPU alignment, not CPU alignment.  But
-	 * I've not seen any qcom SoC where the SMMU does not support the
-	 * CPU's smallest page size.
-	 */
-	return !PAGE_ALIGNED(addr);
-}
-
-static int
-lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
-{
-	struct drm_device *dev = job->vm->drm;
-	int i = job->nr_ops++;
-	int ret = 0;
-
-	job->ops[i].op = op->op;
-	job->ops[i].handle = op->handle;
-	job->ops[i].obj_offset = op->obj_offset;
-	job->ops[i].iova = op->iova;
-	job->ops[i].range = op->range;
-	job->ops[i].flags = op->flags;
-
-	if (op->flags & ~MSM_VM_BIND_OP_FLAGS)
-		ret = UERR(EINVAL, dev, "invalid flags: %x\n", op->flags);
-
-	if (invalid_alignment(op->iova))
-		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
-
-	if (invalid_alignment(op->obj_offset))
-		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
-
-	if (invalid_alignment(op->range))
-		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
-
-	if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
-		ret = UERR(EINVAL, dev, "invalid range: %016llx, %016llx\n", op->iova, op->range);
-
-	/*
-	 * MAP must specify a valid handle.  But the handle MBZ for
-	 * UNMAP or MAP_NULL.
-	 */
-	if (op->op == MSM_VM_BIND_OP_MAP) {
-		if (!op->handle)
-			ret = UERR(EINVAL, dev, "invalid handle\n");
-	} else if (op->handle) {
-		ret = UERR(EINVAL, dev, "handle must be zero\n");
-	}
-
-	switch (op->op) {
-	case MSM_VM_BIND_OP_MAP:
-	case MSM_VM_BIND_OP_MAP_NULL:
-	case MSM_VM_BIND_OP_UNMAP:
-		break;
-	default:
-		ret = UERR(EINVAL, dev, "invalid op: %u\n", op->op);
-		break;
-	}
-
-	return ret;
-}
-
-/*
- * ioctl parsing, parameter validation, and GEM handle lookup
- */
-static int
-vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args,
-		       struct drm_file *file, int *nr_bos)
-{
-	struct drm_device *dev = job->vm->drm;
-	int ret = 0;
-	int cnt = 0;
-	int i = -1;
-
-	if (args->nr_ops == 1) {
-		/* Single op case, the op is inlined: */
-		ret = lookup_op(job, &args->op);
-	} else {
-		for (unsigned i = 0; i < args->nr_ops; i++) {
-			struct drm_msm_vm_bind_op op;
-			void __user *userptr =
-				u64_to_user_ptr(args->ops + (i * sizeof(op)));
-
-			/* make sure we don't have garbage flags, in case we hit
-			 * error path before flags is initialized:
-			 */
-			job->ops[i].flags = 0;
-
-			if (copy_from_user(&op, userptr, sizeof(op))) {
-				ret = -EFAULT;
-				break;
-			}
-
-			ret = lookup_op(job, &op);
-			if (ret)
-				break;
-		}
-	}
-
-	if (ret) {
-		job->nr_ops = 0;
-		goto out;
-	}
-
-	spin_lock(&file->table_lock);
-
-	for (i = 0; i < args->nr_ops; i++) {
-		struct msm_vm_bind_op *op = &job->ops[i];
-		struct drm_gem_object *obj;
-
-		if (!op->handle) {
-			op->obj = NULL;
-			continue;
-		}
-
-		/*
-		 * normally use drm_gem_object_lookup(), but for bulk lookup
-		 * all under single table_lock just hit object_idr directly:
-		 */
-		obj = idr_find(&file->object_idr, op->handle);
-		if (!obj) {
-			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
-			goto out_unlock;
-		}
-
-		drm_gem_object_get(obj);
-
-		op->obj = obj;
-		cnt++;
-
-		if ((op->range + op->obj_offset) > obj->size) {
-			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
-				   op->range, op->obj_offset, obj->size);
-			goto out_unlock;
-		}
-	}
-
-	*nr_bos = cnt;
-
-out_unlock:
-	spin_unlock(&file->table_lock);
-
-	if (ret) {
-		for (; i >= 0; i--) {
-			struct msm_vm_bind_op *op = &job->ops[i];
-
-			if (!op->obj)
-				continue;
-
-			drm_gem_object_put(op->obj);
-			op->obj = NULL;
-		}
-	}
-out:
-	return ret;
-}
-
-static void
-prealloc_count(struct msm_vm_bind_job *job,
-	       struct msm_vm_bind_op *first,
-	       struct msm_vm_bind_op *last)
-{
-	struct msm_mmu *mmu = to_msm_vm(job->vm)->mmu;
-
-	if (!first)
-		return;
-
-	uint64_t start_iova = first->iova;
-	uint64_t end_iova = last->iova + last->range;
-
-	mmu->funcs->prealloc_count(mmu, &job->prealloc, start_iova, end_iova - start_iova);
-}
-
-static bool
-ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
-{
-	/*
-	 * Last level pte covers 2MB.. so we should merge two ops, from
-	 * the PoV of figuring out how much pgtable pages to pre-allocate
-	 * if they land in the same 2MB range:
-	 */
-	uint64_t pte_mask = ~(SZ_2M - 1);
-	return ((first->iova + first->range) & pte_mask) == (next->iova & pte_mask);
-}
-
-/*
- * Determine the amount of memory to prealloc for pgtables.  For sparse images,
- * in particular, userspace plays some tricks with the order of page mappings
- * to get the desired swizzle pattern, resulting in a large # of tiny MAP ops.
- * So detect when multiple MAP operations are physically contiguous, and count
- * them as a single mapping.  Otherwise the prealloc_count() will not realize
- * they can share pagetable pages and vastly overcount.
- */
-static int
-vm_bind_prealloc_count(struct msm_vm_bind_job *job)
-{
-	struct msm_vm_bind_op *first = NULL, *last = NULL;
-	struct msm_gem_vm *vm = to_msm_vm(job->vm);
-	int ret;
-
-	for (int i = 0; i < job->nr_ops; i++) {
-		struct msm_vm_bind_op *op = &job->ops[i];
-
-		/* We only care about MAP/MAP_NULL: */
-		if (op->op == MSM_VM_BIND_OP_UNMAP)
-			continue;
-
-		/*
-		 * If op is contiguous with last in the current range, then
-		 * it becomes the new last in the range and we continue
-		 * looping:
-		 */
-		if (last && ops_are_same_pte(last, op)) {
-			last = op;
-			continue;
-		}
-
-		/*
-		 * If op is not contiguous with the current range, flush
-		 * the current range and start anew:
-		 */
-		prealloc_count(job, first, last);
-		first = last = op;
-	}
-
-	/* Flush the remaining range: */
-	prealloc_count(job, first, last);
-
-	/*
-	 * Now that we know the needed amount to pre-alloc, throttle on pending
-	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
-	 */
-	ret = wait_event_interruptible(
-			vm->prealloc_throttle.wait,
-			atomic_read(&vm->prealloc_throttle.in_flight) <= 1024);
-	if (ret)
-		return ret;
-
-	atomic_add(job->prealloc.count, &vm->prealloc_throttle.in_flight);
-
-	return 0;
-}
-
-/*
- * Lock VM and GEM objects
- */
-static int
-vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
-{
-	int ret;
-
-	/* Lock VM and objects: */
-	drm_exec_until_all_locked (exec) {
-		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(job->vm));
-		drm_exec_retry_on_contention(exec);
-		if (ret)
-			return ret;
-
-		for (unsigned i = 0; i < job->nr_ops; i++) {
-			const struct msm_vm_bind_op *op = &job->ops[i];
-
-			switch (op->op) {
-			case MSM_VM_BIND_OP_UNMAP:
-				ret = drm_gpuvm_sm_unmap_exec_lock(job->vm, exec,
-							      op->iova,
-							      op->obj_offset);
-				break;
-			case MSM_VM_BIND_OP_MAP:
-			case MSM_VM_BIND_OP_MAP_NULL: {
-				struct drm_gpuvm_map_req map_req = {
-					.map.va.addr = op->iova,
-					.map.va.range = op->range,
-					.map.gem.obj = op->obj,
-					.map.gem.offset = op->obj_offset,
-				};
-
-				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
-				break;
-			}
-			default:
-				/*
-				 * lookup_op() should have already thrown an error for
-				 * invalid ops
-				 */
-				WARN_ON("unreachable");
-			}
-
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				return ret;
-		}
-	}
-
-	return 0;
-}
-
-/*
- * Pin GEM objects, ensuring that we have backing pages.  Pinning will move
- * the object to the pinned LRU so that the shrinker knows to first consider
- * other objects for evicting.
- */
-static int
-vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
-{
-	struct drm_gem_object *obj;
-
-	/*
-	 * First loop, before holding the LRU lock, avoids holding the
-	 * LRU lock while calling msm_gem_pin_vma_locked (which could
-	 * trigger get_pages())
-	 */
-	job_foreach_bo (obj, job) {
-		struct page **pages;
-
-		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-		if (IS_ERR(pages))
-			return PTR_ERR(pages);
-	}
-
-	struct msm_drm_private *priv = job->vm->drm->dev_private;
-
-	/*
-	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
-	 * the LRU lock for each individual bo, while (b) avoiding holding the
-	 * LRU lock while calling msm_gem_pin_vma_locked() (which could trigger
-	 * get_pages() which could trigger reclaim.. and if we held the LRU lock
-	 * could trigger deadlock with the shrinker).
-	 */
-	mutex_lock(&priv->lru.lock);
-	job_foreach_bo (obj, job)
-		msm_gem_pin_obj_locked(obj);
-	mutex_unlock(&priv->lru.lock);
-
-	job->bos_pinned = true;
-
-	return 0;
-}
-
-/*
- * Unpin GEM objects.  Normally this is done after the bind job is run.
- */
-static void
-vm_bind_job_unpin_objects(struct msm_vm_bind_job *job)
-{
-	struct drm_gem_object *obj;
-
-	if (!job->bos_pinned)
-		return;
-
-	job_foreach_bo (obj, job)
-		msm_gem_unpin_locked(obj);
-
-	job->bos_pinned = false;
-}
-
-/*
- * Pre-allocate pgtable memory, and translate the VM bind requests into a
- * sequence of pgtable updates to be applied asynchronously.
- */
-static int
-vm_bind_job_prepare(struct msm_vm_bind_job *job)
-{
-	struct msm_gem_vm *vm = to_msm_vm(job->vm);
-	struct msm_mmu *mmu = vm->mmu;
-	int ret;
-
-	ret = mmu->funcs->prealloc_allocate(mmu, &job->prealloc);
-	if (ret)
-		return ret;
-
-	for (unsigned i = 0; i < job->nr_ops; i++) {
-		const struct msm_vm_bind_op *op = &job->ops[i];
-		struct op_arg arg = {
-			.job = job,
-			.op = op,
-		};
-
-		switch (op->op) {
-		case MSM_VM_BIND_OP_UNMAP:
-			ret = drm_gpuvm_sm_unmap(job->vm, &arg, op->iova,
-						 op->range);
-			break;
-		case MSM_VM_BIND_OP_MAP:
-			if (op->flags & MSM_VM_BIND_OP_DUMP)
-				arg.flags |= MSM_VMA_DUMP;
-			fallthrough;
-		case MSM_VM_BIND_OP_MAP_NULL: {
-			struct drm_gpuvm_map_req map_req = {
-				.map.va.addr = op->iova,
-				.map.va.range = op->range,
-				.map.gem.obj = op->obj,
-				.map.gem.offset = op->obj_offset,
-			};
-
-			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
-			break;
-		}
-		default:
-			/*
-			 * lookup_op() should have already thrown an error for
-			 * invalid ops
-			 */
-			BUG_ON("unreachable");
-		}
-
-		if (ret) {
-			/*
-			 * If we've already started modifying the vm, we can't
-			 * adequetly describe to userspace the intermediate
-			 * state the vm is in.  So throw up our hands!
-			 */
-			if (i > 0)
-				msm_gem_vm_unusable(job->vm);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-/*
- * Attach fences to the GEM objects being bound.  This will signify to
- * the shrinker that they are busy even after dropping the locks (ie.
- * drm_exec_fini())
- */
-static void
-vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
-{
-	for (unsigned i = 0; i < job->nr_ops; i++) {
-		struct drm_gem_object *obj = job->ops[i].obj;
-
-		if (!obj)
-			continue;
-
-		dma_resv_add_fence(obj->resv, job->fence,
-				   DMA_RESV_USAGE_KERNEL);
-	}
-}
-
-int
-msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_msm_vm_bind *args = data;
-	struct msm_context *ctx = file->driver_priv;
-	struct msm_vm_bind_job *job = NULL;
-	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_submitqueue *queue;
-	struct msm_syncobj_post_dep *post_deps = NULL;
-	struct drm_syncobj **syncobjs_to_reset = NULL;
-	struct sync_file *sync_file = NULL;
-	struct dma_fence *fence;
-	int out_fence_fd = -1;
-	int ret, nr_bos = 0;
-	unsigned i;
-
-	if (!gpu)
-		return -ENXIO;
-
-	/*
-	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
-	 * immediately close the device file and all will be torn down.
-	 */
-	if (to_msm_vm(ctx->vm)->unusable)
-		return UERR(EPIPE, dev, "context is unusable");
-
-	/*
-	 * Technically, you cannot create a VM_BIND submitqueue in the first
-	 * place, if you haven't opted in to VM_BIND context.  But it is
-	 * cleaner / less confusing, to check this case directly.
-	 */
-	if (!msm_context_is_vmbind(ctx))
-		return UERR(EINVAL, dev, "context does not support vmbind");
-
-	if (args->flags & ~MSM_VM_BIND_FLAGS)
-		return UERR(EINVAL, dev, "invalid flags");
-
-	queue = msm_submitqueue_get(ctx, args->queue_id);
-	if (!queue)
-		return -ENOENT;
-
-	if (!(queue->flags & MSM_SUBMITQUEUE_VM_BIND)) {
-		ret = UERR(EINVAL, dev, "Invalid queue type");
-		goto out_post_unlock;
-	}
-
-	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
-		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
-		if (out_fence_fd < 0) {
-			ret = out_fence_fd;
-			goto out_post_unlock;
-		}
-	}
-
-	job = vm_bind_job_create(dev, file, queue, args->nr_ops);
-	if (IS_ERR(job)) {
-		ret = PTR_ERR(job);
-		goto out_post_unlock;
-	}
-
-	ret = mutex_lock_interruptible(&queue->lock);
-	if (ret)
-		goto out_post_unlock;
-
-	if (args->flags & MSM_VM_BIND_FENCE_FD_IN) {
-		struct dma_fence *in_fence;
-
-		in_fence = sync_file_get_fence(args->fence_fd);
-
-		if (!in_fence) {
-			ret = UERR(EINVAL, dev, "invalid in-fence");
-			goto out_unlock;
-		}
-
-		ret = drm_sched_job_add_dependency(&job->base, in_fence);
-		if (ret)
-			goto out_unlock;
-	}
-
-	if (args->in_syncobjs > 0) {
-		syncobjs_to_reset = msm_syncobj_parse_deps(dev, &job->base,
-							   file, args->in_syncobjs,
-							   args->nr_in_syncobjs,
-							   args->syncobj_stride);
-		if (IS_ERR(syncobjs_to_reset)) {
-			ret = PTR_ERR(syncobjs_to_reset);
-			goto out_unlock;
-		}
-	}
-
-	if (args->out_syncobjs > 0) {
-		post_deps = msm_syncobj_parse_post_deps(dev, file,
-							args->out_syncobjs,
-							args->nr_out_syncobjs,
-							args->syncobj_stride);
-		if (IS_ERR(post_deps)) {
-			ret = PTR_ERR(post_deps);
-			goto out_unlock;
-		}
-	}
-
-	ret = vm_bind_job_lookup_ops(job, args, file, &nr_bos);
-	if (ret)
-		goto out_unlock;
-
-	ret = vm_bind_prealloc_count(job);
-	if (ret)
-		goto out_unlock;
-
-	struct drm_exec exec;
-	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
-	drm_exec_init(&exec, flags, nr_bos + 1);
-
-	ret = vm_bind_job_lock_objects(job, &exec);
-	if (ret)
-		goto out;
-
-	ret = vm_bind_job_pin_objects(job);
-	if (ret)
-		goto out;
-
-	ret = vm_bind_job_prepare(job);
-	if (ret)
-		goto out;
-
-	drm_sched_job_arm(&job->base);
-
-	job->fence = dma_fence_get(&job->base.s_fence->finished);
-
-	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
-		sync_file = sync_file_create(job->fence);
-		if (!sync_file)
-			ret = -ENOMEM;
-	}
-
-	if (ret)
-		goto out;
-
-	vm_bind_job_attach_fences(job);
-
-	/*
-	 * The job can be free'd (and fence unref'd) at any point after
-	 * drm_sched_entity_push_job(), so we need to hold our own ref
-	 */
-	fence = dma_fence_get(job->fence);
-
-	drm_sched_entity_push_job(&job->base);
-
-	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
-	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, fence);
-
-	dma_fence_put(fence);
-
-out:
-	if (ret)
-		vm_bind_job_unpin_objects(job);
-
-	drm_exec_fini(&exec);
-out_unlock:
-	mutex_unlock(&queue->lock);
-out_post_unlock:
-	if (ret) {
-		if (out_fence_fd >= 0)
-			put_unused_fd(out_fence_fd);
-		if (sync_file)
-			fput(sync_file->file);
-	} else if (sync_file) {
-		fd_install(out_fence_fd, sync_file->file);
-		args->fence_fd = out_fence_fd;
-	}
-
-	if (!IS_ERR_OR_NULL(job)) {
-		if (ret)
-			msm_vma_job_free(&job->base);
-	} else {
-		/*
-		 * If the submit hasn't yet taken ownership of the queue
-		 * then we need to drop the reference ourself:
-		 */
-		msm_submitqueue_put(queue);
-	}
-
-	if (!IS_ERR_OR_NULL(post_deps)) {
-		for (i = 0; i < args->nr_out_syncobjs; ++i) {
-			kfree(post_deps[i].chain);
-			drm_syncobj_put(post_deps[i].syncobj);
-		}
-		kfree(post_deps);
-	}
-
-	if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
-		for (i = 0; i < args->nr_in_syncobjs; ++i) {
-			if (syncobjs_to_reset[i])
-				drm_syncobj_put(syncobjs_to_reset[i]);
-		}
-		kfree(syncobjs_to_reset);
-	}
-
-	return ret;
-}
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.h b/drivers/gpu/drm/msm/msm_gem_vma.h
new file mode 100644
index 0000000000000000000000000000000000000000..f702f81529e72b86bffb4960408f1912bc65851a
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_gem_vma.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2016 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ */
+
+#ifndef _MSM_GEM_VMA_H_
+#define _MSM_GEM_VMA_H_
+
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+
+	/**
+	 * @queue_id: The id of the submitqueue the operation is performed
+	 * on, or zero for (in particular) UNMAP ops triggered outside of
+	 * a submitqueue (ie. process cleanup)
+	 */
+	int queue_id;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+
+	/** @reason: The reason for the unmap */
+	const char *reason;
+
+	/**
+	 * @queue_id: The id of the submitqueue the operation is performed
+	 * on, or zero for (in particular) UNMAP ops triggered outside of
+	 * a submitqueue (ie. process cleanup)
+	 */
+	int queue_id;
+};
+
+static void
+vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int queue_id)
+{
+	int idx;
+
+	if (!vm->managed)
+		lockdep_assert_held(&vm->mmu_lock);
+
+	vm_dbg("%s:%p:%d: %016llx %016llx", op, vm, queue_id, iova, iova + range);
+
+	if (!vm->log)
+		return;
+
+	idx = vm->log_idx;
+	vm->log[idx].op = op;
+	vm->log[idx].iova = iova;
+	vm->log[idx].range = range;
+	vm->log[idx].queue_id = queue_id;
+	vm->log_idx = (vm->log_idx + 1) & ((1 << vm->log_shift) - 1);
+}
+
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	const char *reason = op->reason;
+
+	if (!reason)
+		reason = "unmap";
+
+	vm_log(vm, reason, op->iova, op->range, op->queue_id);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_log(vm, "map", op->iova, op->range, op->queue_id);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
+int msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg);
+int msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg);
+int msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg);
+
+int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm);
+void msm_gem_vm_sched_fini(struct msm_gem_vm *vm);
+
+#endif

-- 
2.47.3

