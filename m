Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD9A74275
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379D410E973;
	Fri, 28 Mar 2025 02:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7/A1kF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167710E96F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REUeub022562
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cywCV0UI/99cMUcGzgtZIV7OPV4G7gmWrKgmTHP4Do0=; b=h7/A1kF97af9XQ8/
 wmrIH8P0wG54WJ9w43448QTiU1jG9S8ruwPNfabSDG2vzcH/evu1WdKyh/bfi6hI
 B/+XiOwYlyeem5QKqu93P8xyWXbfBLMzRGEHmXqqq5OfIZA6+pgwjVsZe32esEi1
 EjTmuHuRS0hJ0VoZ8qUd0AoaACKBlzzakXOFhDwERVjjswAKOOAT/YlZDBaXmfar
 P05HllDJJ8w/sQpw6ZGMp0mw0he4Su840qCPOfMro/hRxSPuQi0V9eeuSs5gg116
 qA9h4IzPh4pETgRIuWQPQDbVEBtUCsq8X/tdSZ/goVnvEQXyu+fjXJMddkmOErW1
 /ZEmhQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9r90p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-225429696a9so44532965ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130113; x=1743734913;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cywCV0UI/99cMUcGzgtZIV7OPV4G7gmWrKgmTHP4Do0=;
 b=jJijA4ueR5WIFUUVI0J80olwcgfC1O8IJ29AzBbArYmeeHhOxVsWxx5wITckLDerj8
 6RszWPScwbDf/FCYP601HLoJ0HABTXmBnYJp/qFgQZ2B45sw+Cy5YWGbrVTSAag6NA0K
 yg0uKz4d1pQRKE9okSOnnnCDy6UOYHKwyZgT2440tNFckns/1+QnY8khw+clKMcmO2/u
 5TrE2q6psBg+QLcERFtX5ItGwHbSaFjBtmqc4JWHCfm/1pgmyKFlJSCrOalLEHfyNgID
 d1YcSrdsdlWgUEAwhT9FJfrQv5Kbd5gbczorJeZe/RHucB9xDueAncmfoc8+PXtUvFNm
 nQMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjHsP7Vhnill3N0pSVewBzsAQ18lkrcuYGm+Rf0obw3ARm68tyIjFkXVNzqAHzBwUSdmyo3ne5WLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwomtZdEM/vxCVzIAWbjOjHn01eGG8T94SgMouHhI0Ag4wKiKwY
 M43jtvZ+9LMxe4tcgtVipIw0ZMj5DDG3Gx2ivkBGhbBHk8A6IYpHNfZti2mDONMV2kvqLszX6Ne
 9yykPCNxHFU0CSjtr5r/UQ++B2bwjWArtyaPhZs37/JWmcNTB/Ynndlj+b6FfghWu1A==
X-Gm-Gg: ASbGncta/uq641rUTHQ2ji+bYax0lbUvg829XyEzJ7SPmIdF4nV3r6avD1viqZT8hmf
 TLJ5Jq/jqzah8gSXc23GRnO6rKG6JyZ+6watULbiWi3eUcdI+ZzwAdvvtLn/VDBdM/HvaJNNTXQ
 zjyuKT8qow1q3IzX2AlwFQ3nRW0huwsDWFplf+97UdZU/OOQKtNiO2Zs5zIvSSMqfzz3kvNlQNO
 wZLB2c4qmLecrSrpKXG3KHucDojzX3eqHX/52jOm//fGEAtSSWfoGdYo9B2XxGUmY/jbZApahhi
 lcPc4U1WhcL8mO9DJXEmu57WAJ6i+MeWxncmq9xibg+buESA9ULy+n+4wEKV+pt789z1/CAjzqY
 =
X-Received: by 2002:a17:903:22c4:b0:21f:85ee:f2df with SMTP id
 d9443c01a7336-22804851debmr92298135ad.15.1743130112526; 
 Thu, 27 Mar 2025 19:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERwvnEI1xM4UEFmvVzBOxWuyTmtVuWMhqVc0CEuOJFL1SoTg8xXZ7LidVdO3cvboLaF+3+3A==
X-Received: by 2002:a17:903:22c4:b0:21f:85ee:f2df with SMTP id
 d9443c01a7336-22804851debmr92297705ad.15.1743130111860; 
 Thu, 27 Mar 2025 19:48:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 19:48:31 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:32 -0700
Subject: [PATCH v3 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-10-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: Uizv_wGCPwNump3DuhOQzB3Vv64FKZ7g
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e60e02 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=OR1utrCcES5rRZ7Z870A:9
 a=GAZ-Hd6mDwwK4bQw:21 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Uizv_wGCPwNump3DuhOQzB3Vv64FKZ7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017
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

Enable userspace to allocate shared memory with QTEE. Since
QTEE handles shared memory as object, a wrapper is implemented
to represent tee_shm as an object. The shared memory identifier,
obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile          |   1 +
 drivers/tee/qcomtee/call.c            |   8 +-
 drivers/tee/qcomtee/mem_obj.c         | 172 ++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/primordial_obj.c  |  51 ++++++++++
 drivers/tee/qcomtee/qcomtee_private.h |  39 ++++++++
 drivers/tee/qcomtee/shm.c             |   3 -
 6 files changed, 270 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index a3a2d00e83f0..6cb9fd38dc67 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += mem_obj.o
 qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index f7f5c2c0bebb..6b0380a26419 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -136,8 +136,11 @@ int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
 	/* param is a QTEE object: */
 	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE) {
 		err = qcomtee_context_find_qtee_object(&object, param, ctx);
+
 	} else {
-		err = -EINVAL;
+		err = qcomtee_memobj_param_to_object(&object, param, ctx);
+		if (!err)
+			qcomtee_object_get(object);
 	}
 
 	arg->o = err ? NULL_QCOMTEE_OBJECT : object;
@@ -181,6 +184,9 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
 		if (is_qcomtee_user_object(object))
 			err = qcomtee_user_param_from_object(param, object,
 							     ctx);
+		else if (is_qcomtee_memobj_object(object))
+			err = qcomtee_memobj_param_from_object(param, object,
+							       ctx);
 		else
 			err = -EINVAL;
 
diff --git a/drivers/tee/qcomtee/mem_obj.c b/drivers/tee/qcomtee/mem_obj.c
new file mode 100644
index 000000000000..27af9ee946cb
--- /dev/null
+++ b/drivers/tee/qcomtee/mem_obj.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/mm.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#include "qcomtee_private.h"
+
+/**
+ * DOC: Memory and Mapping Objects
+ *
+ * QTEE uses memory objects for memory sharing with Linux.
+ * A memory object can be a standard dma_buf or a contiguous memory range,
+ * e.g., tee_shm. A memory object should support one operation: map. When
+ * invoked by QTEE, a mapping object is generated. A mapping object supports
+ * one operation: unmap.
+ *
+ *  (1) To map a memory object, QTEE invokes the primordial object with
+ *      %QCOMTEE_OBJECT_OP_MAP_REGION operation; see
+ *      qcomtee_primordial_obj_dispatch().
+ *  (2) To unmap a memory object, QTEE releases the mapping object which
+ *      calls qcomtee_mem_object_release().
+ *
+ * The map operation is implemented in the primordial object as a privileged
+ * operation instead of qcomtee_mem_object_dispatch(). Otherwise, on
+ * platforms without shm_bridge, a user can trick QTEE into writing to the
+ * kernel memory by passing a user object as a memory object and returning a
+ * random physical address as the result of the mapping request.
+ */
+
+struct qcomtee_mem_object {
+	struct qcomtee_object object;
+	struct tee_shm *shm;
+	/* QTEE requires these felids to be page aligned. */
+	phys_addr_t paddr; /* Physical address of range. */
+	size_t size; /* Size of the range. */
+};
+
+#define to_qcomtee_mem_object(o) \
+	container_of((o), struct qcomtee_mem_object, object)
+
+static struct qcomtee_object_operations qcomtee_mem_object_ops;
+
+/* Is it a memory object using tee_shm? */
+int is_qcomtee_memobj_object(struct qcomtee_object *object)
+{
+	return object != NULL_QCOMTEE_OBJECT &&
+	       typeof_qcomtee_object(object) == QCOMTEE_OBJECT_TYPE_CB &&
+	       object->ops == &qcomtee_mem_object_ops;
+}
+
+static int qcomtee_mem_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				       struct qcomtee_object *object, u32 op,
+				       struct qcomtee_arg *args)
+{
+	return -EINVAL;
+}
+
+static void qcomtee_mem_object_release(struct qcomtee_object *object)
+{
+	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
+
+	/* Matching get is in qcomtee_memobj_param_to_object(). */
+	tee_shm_put(mem_object->shm);
+	kfree(mem_object);
+}
+
+static struct qcomtee_object_operations qcomtee_mem_object_ops = {
+	.release = qcomtee_mem_object_release,
+	.dispatch = qcomtee_mem_object_dispatch,
+};
+
+/**
+ * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
+				   struct tee_param *param,
+				   struct tee_context *ctx)
+{
+	struct qcomtee_mem_object *mem_object __free(kfree) = NULL;
+	struct tee_shm *shm;
+	int err;
+
+	if (param->u.objref.flags != QCOMTEE_OBJREF_FLAG_MEM)
+		return -EINVAL;
+
+	mem_object = kzalloc(sizeof(*mem_object), GFP_KERNEL);
+	if (!mem_object)
+		return -ENOMEM;
+
+	shm = tee_shm_get_from_id(ctx, param->u.objref.id);
+	if (!shm)
+		return -EINVAL;
+
+	/* mem-object wrapping the memref. */
+	err = qcomtee_object_user_init(&mem_object->object,
+				       QCOMTEE_OBJECT_TYPE_CB,
+				       &qcomtee_mem_object_ops, "tee-shm-%d",
+				       shm->id);
+	if (err) {
+		tee_shm_put(shm);
+
+		return err;
+	}
+
+	mem_object->paddr = shm->paddr;
+	mem_object->size = shm->size;
+	mem_object->shm = shm;
+
+	*object = &no_free_ptr(mem_object)->object;
+
+	return 0;
+}
+
+/* Reverse what qcomtee_memobj_param_to_object() does. */
+int qcomtee_memobj_param_from_object(struct tee_param *param,
+				     struct qcomtee_object *object,
+				     struct tee_context *ctx)
+{
+	struct qcomtee_mem_object *mem_object;
+
+	mem_object = to_qcomtee_mem_object(object);
+	/* Sure if the memobj is in a same context it is originated from. */
+	if (mem_object->shm->ctx != ctx)
+		return -EINVAL;
+
+	param->u.objref.id = mem_object->shm->id;
+	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_MEM;
+
+	/* Passing shm->id to userspace; drop the reference. */
+	qcomtee_object_put(object);
+
+	return 0;
+}
+
+/**
+ * qcomtee_mem_object_map() - Map a memory object.
+ * @object: memory object.
+ * @map_object: created mapping object.
+ * @mem_paddr: physical address of the memory.
+ * @mem_size: size of the memory.
+ * @perms: QTEE access permissions.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_mem_object_map(struct qcomtee_object *object,
+			   struct qcomtee_object **map_object, u64 *mem_paddr,
+			   u64 *mem_size, u32 *perms)
+{
+	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
+
+	/* Reuses the memory object as a mapping object by re-sharing it. */
+	qcomtee_object_get(&mem_object->object);
+
+	*map_object = &mem_object->object;
+	*mem_paddr = mem_object->paddr;
+	*mem_size = mem_object->size;
+	*perms = QCOM_SCM_PERM_RW;
+
+	return 0;
+}
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
index a30967d89c91..cd9fe9eac08b 100644
--- a/drivers/tee/qcomtee/primordial_obj.c
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -16,18 +16,31 @@
  * for native kernel services or privileged operations.
  *
  * We support:
+ *  - %QCOMTEE_OBJECT_OP_MAP_REGION to map a memory object and return mapping
+ *    object and mapping information (see qcomtee_mem_object_map()).
  *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
  *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
  */
 
+#define QCOMTEE_OBJECT_OP_MAP_REGION 0
 #define QCOMTEE_OBJECT_OP_YIELD 1
 #define QCOMTEE_OBJECT_OP_SLEEP 2
 
+/* Mapping information format as expected by QTEE. */
+struct qcomtee_mapping_info {
+	u64 paddr;
+	u64 len;
+	u32 perms;
+} __packed;
+
 static int
 qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 				struct qcomtee_object *primordial_object_unused,
 				u32 op, struct qcomtee_arg *args)
 {
+	struct qcomtee_mapping_info *map_info;
+	struct qcomtee_object *mem_object;
+	struct qcomtee_object *map_object;
 	int err = 0;
 
 	switch (op) {
@@ -35,6 +48,7 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 		cond_resched();
 		/* No output object. */
 		oic->data = NULL;
+
 		break;
 	case QCOMTEE_OBJECT_OP_SLEEP:
 		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
@@ -46,6 +60,30 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 		msleep(*(u32 *)(args[0].b.addr));
 		/* No output object. */
 		oic->data = NULL;
+
+		break;
+	case QCOMTEE_OBJECT_OP_MAP_REGION:
+		/* Check message format matched QCOMTEE_OBJECT_OP_MAP_REGION op. */
+		if (qcomtee_args_len(args) != 3 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_OB ||
+		    args[1].type != QCOMTEE_ARG_TYPE_IO ||
+		    args[2].type != QCOMTEE_ARG_TYPE_OO ||
+		    args[0].b.size < sizeof(struct qcomtee_mapping_info))
+			return -EINVAL;
+
+		map_info = (struct qcomtee_mapping_info *)args[0].b.addr;
+		mem_object = args[1].o;
+
+		qcomtee_mem_object_map(mem_object, &map_object,
+				       &map_info->paddr, &map_info->len,
+				       &map_info->perms);
+
+		args[2].o = map_object;
+		/* One output object; pass it for cleanup to notify. */
+		oic->data = map_object;
+
+		qcomtee_object_put(mem_object);
+
 		break;
 	default:
 		err = -EINVAL;
@@ -54,8 +92,21 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 	return err;
 }
 
+/* Called after submitting the callback response. */
+static void qcomtee_primordial_obj_notify(struct qcomtee_object_invoke_ctx *oic,
+					  struct qcomtee_object *unused,
+					  int err)
+{
+	struct qcomtee_object *object = oic->data;
+
+	/* If err, QTEE did not obtain mapping object. Drop it. */
+	if (object && err)
+		qcomtee_object_put(object);
+}
+
 static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
 	.dispatch = qcomtee_primordial_obj_dispatch,
+	.notify = qcomtee_primordial_obj_notify,
 };
 
 struct qcomtee_object qcomtee_primordial_object = {
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index a5d05a72af15..cd5d45075fcd 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -15,6 +15,7 @@
 /* Flags relating to object reference. */
 #define QCOMTEE_OBJREF_FLAG_TEE BIT(0)
 #define QCOMTEE_OBJREF_FLAG_USER BIT(1)
+#define QCOMTEE_OBJREF_FLAG_MEM BIT(2)
 
 /**
  * struct qcomtee - Main service struct.
@@ -222,4 +223,42 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 /* (2) Primordial Object. */
 extern struct qcomtee_object qcomtee_primordial_object;
 
+/* (3) Memory Object API. */
+
+/* Is it a memory object using tee_shm? */
+int is_qcomtee_memobj_object(struct qcomtee_object *object);
+
+/**
+ * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
+				   struct tee_param *param,
+				   struct tee_context *ctx);
+
+/* Reverse what qcomtee_memobj_param_to_object() does. */
+int qcomtee_memobj_param_from_object(struct tee_param *param,
+				     struct qcomtee_object *object,
+				     struct tee_context *ctx);
+
+/**
+ * qcomtee_mem_object_map() - Map a memory object.
+ * @object: memory object.
+ * @map_object: created mapping object.
+ * @mem_paddr: physical address of the memory.
+ * @mem_size: size of the memory.
+ * @perms: QTEE access permissions.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_mem_object_map(struct qcomtee_object *object,
+			   struct qcomtee_object **map_object, u64 *mem_paddr,
+			   u64 *mem_size, u32 *perms);
+
 #endif /* QCOMTEE_PRIVATE_H */
diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
index 998aabe96434..9bdf9e48bfeb 100644
--- a/drivers/tee/qcomtee/shm.c
+++ b/drivers/tee/qcomtee/shm.c
@@ -113,9 +113,6 @@ static int qcomtee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
 static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
 			 size_t size, size_t align)
 {
-	if (!(shm->flags & TEE_SHM_PRIV))
-		return -ENOMEM;
-
 	return tee_dyn_shm_alloc_helper(shm, size, align, qcomtee_shm_register);
 }
 

-- 
2.34.1

