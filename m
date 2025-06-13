Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B36AD98D3
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 01:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F8810E576;
	Fri, 13 Jun 2025 23:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo+7wYcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E74410E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9g7gu029622
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yLq0/X+CD6R
 T9BCguCxV4sLsi3w1/mhgkTuVhmBkydE=; b=Fo+7wYccuOU6D4fAhl/PvOjGLIP
 dxpZ8MzY6HuCkuWEoRFn3mDyXtTNJO2gRDA7NknZSidV8idS/A3pDu51LpzcezWe
 cpvjM7BBflAReKPPZdbY8PS4psN5wD0YLFjFDNUBGqaTLwtpXL5BXKa00cFP1u5p
 ExFK1iox+1etOzdWynPZyCsOLQFFufxR91lJkmwI23sep+tfdokNVnw0U/E3c/xb
 /RUxiqte4RXIE3X9QljI5YzK123NvZ4oqZtBfqZ60u0jTXjSnhWC7p4TxctHgcxK
 r55a5AMp5TFxK9Tg1Ba/AZ9qvZ2ZpYzdOUOAqYeYRPCMZbQfeS7KrXaWFIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6mqe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso2694495a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 16:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749859033; x=1750463833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLq0/X+CD6RT9BCguCxV4sLsi3w1/mhgkTuVhmBkydE=;
 b=GJOOHTkJOgYuvjzp+fidvzKOgoRBww/H3kSbPMBNZMTS/5EDjvD/XGg09WWvCLvpdU
 ZZ+FI3F4I/FHNtR1j5H7sfI8ePNlVR0RrSzJ0S7pVDN8v4umbG9hjFxcwhXgDzrHgNyL
 NeaE35OyMi8bznLIjgjBcBguC+ofjmDC3A3jui9KKfj5qJyFH91OOkQSUkegbHWf2e8V
 Q5NU+P76SaUzuQQPCeyOfac28BKAQk5gI0ewv221QAhl8W0H3t4JYm6XhxGtMdVjfEaN
 oqqaUw6Nyc5Hb1artq8oaTIer3ubHNdh+JQtq3SFfjcWZjwbF++1Fis/epYRfjYrMK9O
 U5Pg==
X-Gm-Message-State: AOJu0YxLzx9HK4DGqj2GBSMwlGxIWyjV5Gg95f5str1MN9/wGbXzS1zT
 Ezzh4lRcnp47UDm9EmMDV8VsbbvGDIDpKyfpr/QPklq7gNXVkt+qQOsgdlpIVvN8LF0wJxjGvpn
 vAcCUUEVzfom0wG7JCRIAyAk8gsl/3Z3harqFeO+fMyIZvPTWDEcH+BNVGLXirk+Golf1I89R6L
 9y+KQ=
X-Gm-Gg: ASbGnctHr76VJyd2bQzpn3ppZ6wnCJCLgBiXiOaIAxP/Ub937wsTQEIYzk1eoMFK4Ht
 VZySMPuv3QDg8+Yt5EnrqFH1gVDYyl0DXiRXp1ZNjub5bzWUO1emkSXEecUy/ZTTkIGLOIZ417v
 P428sgimMPiXsEMvrBEQCAIMsVnn6lNvVoEUUAO326gBAWbOIi1hDTbLlWC8SkbVCymEyf6zI6S
 91oxQJ95z5Ij6hP10IB31QJgYkBSmc16QEjVA+t5VeKD1RIZYp3rzn14sFwAK/hQjRxIlF+wsVj
 TnxtC3g5/LegSWKSDucSLfE5e0GRfx+I
X-Received: by 2002:a05:6a21:9991:b0:21e:feb5:9cb8 with SMTP id
 adf61e73a8af0-21fbd5d4c35mr1592004637.38.1749859032706; 
 Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEhTcTitEJ4ZlWzhRai8zzxxCScgdvvoA2BJ4VUJEL84zgtN+jTH9QJ8KF6Xuy0gdvRZyX9g==
X-Received: by 2002:a05:6a21:9991:b0:21e:feb5:9cb8 with SMTP id
 adf61e73a8af0-21fbd5d4c35mr1591977637.38.1749859032214; 
 Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b30948eb78asm1767813a12.28.2025.06.13.16.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/gpuvm: Add locking helpers
Date: Fri, 13 Jun 2025 16:57:03 -0700
Message-ID: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NSBTYWx0ZWRfX5Q1CasjNUIqA
 GYd1Pz8XF7aOjAj5me91a76pci6SpmLt0pjbdUcyU+wK+9x3HMwFbdlGeTCcldfp3vsXthBVqkA
 ac/Bqe0P5+dzOJq2WxAh3TTc2+fyQfOPaF3ZgQ7s5m0OhIGnf4GUldf9hJsWtPDli1rsc1B2Qfq
 n2MlsutFkZe986n189B/m48eR5dxU4PPMvQGa2dIkwudtby2BRorPcR+p+UHta80d7tDxOGACei
 T01WrOcW1AAyp4bd8DhQ84xU6hHN/zJva4GSRXWOfzkxBG04Eh8WaoWy0/Sdnc8gbFeRBsApPbg
 dgtmrPB3NFoMxAHTUo+qtc1MgRaa+iVvG+/Vxord4nrWcD5ellA0QW1/Du4uluVxt8uyPp+aD65
 of0VDyZ4trJwVKtBzSpQy0y+JjFlOLMbAr7nAv3xLCn5hH9FfFpBd0Xjw0Y4DinR2yOLhgpA
X-Proofpoint-GUID: 6tELG8KTVeOEGLXqSKxia9PlOy3rNWgr
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684cbad9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 6tELG8KTVeOEGLXqSKxia9PlOy3rNWgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130175
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..197066dd390b 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
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
+ * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm_map()
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
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
+		      struct drm_exec *exec, unsigned int num_fences,
+		      u64 req_addr, u64 req_range,
+		      struct drm_gem_object *req_obj, u64 req_offset)
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
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0ef837a331d6..a769dccfb3ae 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 req_addr, u64 req_range);
 
+int drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			    u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

