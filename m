Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E1BAE8D35
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB3110E7CC;
	Wed, 25 Jun 2025 18:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="da29qsGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB9C10E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBVRhA013850
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IBNhqEhlbdF
 Pkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=; b=da29qsGvT4OtnT+b9gErUpruuBe
 MbPkvR/17J5GQSA0qkKEu59iIjJos0c6bbk6pvDnpS+Z5vgIHrJFUMdhpdbGb3NO
 d51/W1KvSnG1x7rltqLI1dhyr0iGKiUbGOeIDvrir2Tb9up9D/k+Pbxf0e/+plDQ
 yFcve5coFZzFE/tUPwUCZkfAtzyRTU2DhCPl9yrJQa6EmU803aME6t2pecmX7+4u
 8vL8MMpDRi7ecRqy0GK1NIGKpcI9v67iJuVvwmaKqP78U+ozmIjArTSLaRrmRCDv
 JYdLnbeMljGPI0P7jsx+ikSuuXNl3eWM26rHeJFTlcCz8BOU5I6+2Xp9TbA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso248931a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877886; x=1751482686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBNhqEhlbdFPkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=;
 b=pRkexGfJ35SXLTTysOQVLQ0bhzyxR/A7vT/84EPEEJf2RR8+24nKD2pTcsqL8A/vkN
 TZOOBrtgya+7s84RQwM/ak9flNfQrXK3ISYO4e02C/6bN37jnvT6VjwlJvo8r2zTvQ/L
 FesvnT6k+0Po3jQHstxRt6vJxFhZKrgzcnzXQaf1Ty0HagTZkhh08krZd5c/nm1pfL4+
 npXoCAJWIe1NkDpxIpBz69mrRz/PVjTZp/yQF4LWjGyyTpILf0PlnRzC7ZKqzCCvaxLC
 z9x6OVQs9ykWSoiGat9ES2lxadrSAQGMKMDu2wu63tJ0F4Xed+07N31NLt5CzrVrwzKM
 f+hQ==
X-Gm-Message-State: AOJu0YwhYOAL01U6gYDg3ku2kfXqme302h43Rf91xUzJKKP+nwfbjjUI
 FRXu6+3iCgBujuajE66r5BSUE9Z1s++uhm8ADBuubCzq0OXiVE76ca0ajPZvHJBmXyyvH2o1U4n
 tV3cR0ou8zE+hc3E6mfsB/GP5xQ9IgBr/u0+PEiRorcZvl8M4d7Tf25GcWrk9cfVQGvOLs7usH3
 Yxxtw=
X-Gm-Gg: ASbGncswuerDNMMB3RdCskMQT0r4feR+TBINAxNsj5xlkW7GKHmjXdk0k7NvH6nseQO
 AxoB/ZjJce3LM7XL3TPETPDdPCE3WJsQW99GgOg4hjz6GhnPEypG3FksYpT/bHR84BWHfVhDucA
 PtGJYIedUwhayLLeWk+kTPzJ/++z7/MlgDqWnpA4/NNJkvUURLpL2L09TgTM0P8Ymjms+v6ErNt
 iHhjzsTmH96M5Cz/8QclTZPrGxekJFkELVRRloeoI3SUmc1aawrBhmqM6cz00i+N8lu9FKYoQuP
 1gI67elrqOxRafTSPmgzLqRsTpLKIT17
X-Received: by 2002:a17:90b:5706:b0:312:1c83:58f7 with SMTP id
 98e67ed59e1d1-315f2525a76mr6759976a91.0.1750877885923; 
 Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzUt3jRFX6LjL8FjMPCTktnh55EsI2oRHpomnsO0iMIJLz/9ZiWHSBy9AyDL9vaYvsYsSP7A==
X-Received: by 2002:a17:90b:5706:b0:312:1c83:58f7 with SMTP id
 98e67ed59e1d1-315f2525a76mr6759948a91.0.1750877885476; 
 Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5437befsm2531993a91.39.2025.06.25.11.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 02/42] drm/gpuvm: Add locking helpers
Date: Wed, 25 Jun 2025 11:46:55 -0700
Message-ID: <20250625184918.124608-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gXmLzIc8hE4PcKHQkQgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: iAF2FBKeMhckjpO8NGiV-Iyx2ov0o5K4
X-Proofpoint-ORIG-GUID: iAF2FBKeMhckjpO8NGiV-Iyx2ov0o5K4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX7P2K6D3nHwqr
 h1IsN259RKll7QesPmm8nu5H+0TBjsL49oQPr7bq0dOLy7ZvsLFzRVpeUkeZY9hNFw1IoqRBmTz
 ItUk9Gon+7J/ut23dUAg/qGIX0cBLiYCTXuGha1YHJLFzsNsTrsOd+IMRvR4/AIdda8LAx3TIAI
 gv2l/XqqFVBtQrZPPVwTzjRAhYA4xSnor1cugipdiR2m4R8Z+kFA3cgB8JisHXc93SDbC9azHOE
 ZmxyvHP9oF7j8kJUm5y+f+ZMFtiGDQG9wTuM42bRQuN9wfwOL2IVIZFgMVZTJ4NcSJKmwIPo4Cb
 1G1p4QZ2ZUuoC+qN7gubolBrB4Jb0yLHiwzsRNnyEC9uRaQCc/6eBbpqyLWcFIR5ORFYEEhbt83
 jVhdjj39O76lg1e2x238i48s6xvZq6ORK862r6WCavs9UiDy4+Sh5pBaDUViCNvHAcJlr/SO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
v3: Expand comments to show expected usage, and explain how the usage
    is safe in the case of overlapping driver VM_BIND ops.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 126 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..a811471b888e 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,132 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+static int
+drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_exec *exec = priv;
+
+	switch (op->op) {
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.unmap->va->gem.obj)
+			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
+		return 0;
+	case DRM_GPUVA_OP_UNMAP:
+		if (op->unmap.va->gem.obj)
+			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct drm_gpuvm_ops lock_ops = {
+	.sm_step_map = drm_gpuva_sm_step_lock,
+	.sm_step_remap = drm_gpuva_sm_step_lock,
+	.sm_step_unmap = drm_gpuva_sm_step_lock,
+};
+
+/**
+ * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpuvm_sm_map()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @num_fences: for newly mapped objects, the # of fences to reserve
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * will be newly mapped.
+ *
+ * The expected usage is:
+ *
+ *    vm_bind {
+ *        struct drm_exec exec;
+ *
+ *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
+ *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
+ *
+ *        drm_exec_until_all_locked (&exec) {
+ *            for_each_vm_bind_operation {
+ *                switch (op->op) {
+ *                case DRIVER_OP_UNMAP:
+ *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                    break;
+ *                case DRIVER_OP_MAP:
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
+ *                                                     op->addr, op->range,
+ *                                                     obj, op->obj_offset);
+ *                    break;
+ *                }
+ *
+ *                drm_exec_retry_on_contention(&exec);
+ *                if (ret)
+ *                    return ret;
+ *            }
+ *        }
+ *    }
+ *
+ * This enables all locking to be performed before the driver begins modifying
+ * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
+ * where an earlier op can alter the sequence of steps generated for a later
+ * op, because the later altered step will involve the same GEM object(s)
+ * already seen in the earlier locking step.  For example:
+ *
+ * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
+ *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
+ *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
+ *
+ * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
+ *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
+ *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
+ *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
+ *
+ * Returns: 0 on success or a negative error codec
+ */
+int
+drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			   struct drm_exec *exec, unsigned int num_fences,
+			   u64 req_addr, u64 req_range,
+			   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (req_obj) {
+		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * See drm_gpuvm_sm_map_exec_lock() for expected usage.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			     u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..274532facfd6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
+int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+				 u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

