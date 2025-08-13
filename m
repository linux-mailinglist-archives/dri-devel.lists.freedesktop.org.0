Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D05B23D20
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 02:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43FF10E688;
	Wed, 13 Aug 2025 00:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyRUUEtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE94210E68A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNcNom029116
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6+xxwSKNpqZLnnngK2iH6cMzG+P3jkkyP7YphG9EiKQ=; b=dyRUUEtlpPiZfYXI
 B4QwBXfkzetvoj3MJXwTKVIl3KvQHjI+fxcu/pToqwBwZ171o3NbiyXXYQSFgfhW
 tvHopc6Vzp/7xoZ/M7/sRHu4w3oI9Y5mmAQXWj7O+ib3IGs+dSBai9FucSr7MV/c
 Hb3/vLosfqt2o1J+Zhhgha8WPv0GE8Lyb4rshh18XNBwVkhYA2aStbL5AgPkAJrY
 GOLJ7mrS8miHdXNmmoO6hoyU48FTNHO/ukoqhBMJC5ltRRWtr9TqGnWauyzyU5LY
 Kr3/qvOgM0UcSQ4aOuwHLJm8IzT+XVTU7i/GmD+B2FqEt1dtXHBP8zPjx37nS91b
 o2k8rg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hm9tmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-243049e6e1dso17614515ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755045434; x=1755650234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+xxwSKNpqZLnnngK2iH6cMzG+P3jkkyP7YphG9EiKQ=;
 b=aCrPMnfrgHUh3mZoTJJuHZzr5l7IMAAFoIGuc+2y1ZFMdmZQHiTudEpUhFG9Ar4Lfc
 dI7ioAKeBCRNYzmhBq2OfU2HsAFeuhs385WKOyGlhKdV0eSSEs60IOHWMBjNSdZd7ACR
 NEvcT0q272rIDl0Vp4e8OE0N2qjZ6FPyXNwu8pxz3UXWiFPTh5oFR+wh6vLSOn/y0lq8
 M+S7tQO4Gv/s2o8kGoyAi1B5/ccKJgLwsEMEqVsu02PJy15ENwzUjn1UBr6sw3m+uuyC
 Fhi+cdDqn+kk5gaq3kQqRvF34YUg6MuBYBvrW3PsCGP6iRAIFxDQLV2+8U9FCIyAKygT
 AF0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQGl5lRBB1raxC/4kn8bdZJTMB7Pkp1ILqsia/oJ8JrmJxrobpbpD3leVtJjpb5gcjew2ZnhaGWGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywrx7FALYc1GjTu4DxBOUVh0aM4aN7lBvKHZ2725fnWcWIJEdA7
 coc/XW+EGPbp9gt9ku7WN4NiWj+pxhHvXjeDCZ2Smfc553/9jSUkwRXghvEBB8L+GRBdoSlzA66
 qcrwXalzPuPk7yMM5dLP79DUt6PSIBG4vpFtx4sgrTydRyZqlV+UEHma3OHSlEggOJLg6Lg==
X-Gm-Gg: ASbGncvZkwi0AEj75mYNJe481GFao/mToPAmQ2AiIa7hwh+BcqhNlx2TZ8RQibb7JMa
 200eeazby3hlIAKoRw3F9D6i8hvZ3IBLw6pkxPjyPMJ/eKQ6zhymXs//JfLep+C8dS6qbPB4uTl
 kId++bKMU7bx4a+XefCRLSj9O5XDm1c6AE49/OkNcMLMewSmMUG5VtXaShuq1Jec5rr4bU0WWOz
 1Bq57vrAa4Res48VQMbZix7CtscQjlaSqqDeIccXN7+aGD6oHqRA2P19VNO5C3wYOb0mtNFX94N
 D9L3svg5xZQxryuewzEaCmAhynRTOQzfJlcsm52Hj5UQwOf0c+kkEuhoFvXctK4/+TGH/HqbdWb
 CZpBSqd+LRbWsbW44dYfdN8g=
X-Received: by 2002:a17:902:d48d:b0:240:80f:228e with SMTP id
 d9443c01a7336-2430d21d507mr16719385ad.52.1755045433467; 
 Tue, 12 Aug 2025 17:37:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8i8EynRFCyIKJFpe6TlZ6plHoRJ1fRFvTsjRThmN5ggZyOGDgU+lkaJqS2YMALD+4ZNq6rQ==
X-Received: by 2002:a17:902:d48d:b0:240:80f:228e with SMTP id
 d9443c01a7336-2430d21d507mr16718925ad.52.1755045433001; 
 Tue, 12 Aug 2025 17:37:13 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 17:37:12 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:38 -0700
Subject: [PATCH v7 09/11] qcomtee: add primordial object
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-9-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX59Ek6J+nSsfl
 whrOFCOZaMDfNT7/QHGS+um6ZqAEH90Undx21ofCsevHx6QMo4D1axlBU49uYpiEiqCe2SkmXZV
 7GpEY49Y2DDHwPNn/HsuXvRe9RMXaATrOtPLcpiBsAXtsAGuyjC2glH79h1ECfNguDDtPQO2hxN
 NHWBp2Ia6GV/anAjpl9JNlyKnF5bYimJq4lz/DB0G0F8CoK8saFcXnyIqfRMww6tbSFKoLrWpuI
 z3Wij/owL9ZYFe+mhp2nQbGjBeR8m10mMKriqmkEVE+GCCEb2ZLHQk8mcll4Zi+39iQk0UZyfpm
 r56RGyp30cwidMXkBDfRoVOF9WPYW8K+W7ByiAA+W3tCqgT59FUboe/Iz1iSDKZvNYdXyg9vzop
 DpCM5+NM
X-Proofpoint-GUID: x4MC96CoM3QK_t6ylJ9LGM-ym0rehILg
X-Proofpoint-ORIG-GUID: x4MC96CoM3QK_t6ylJ9LGM-ym0rehILg
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689bde3a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

After booting, the kernel provides a static object known as the
primordial object. This object is utilized by QTEE for native
kernel services such as yield or privileged operations.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile         |  1 +
 drivers/tee/qcomtee/core.c           | 19 ++++++++---
 drivers/tee/qcomtee/primordial_obj.c | 66 ++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee.h        |  3 ++
 4 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 600af2b8f1c1..78f8e899d143 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += shm.o
 qcomtee-objs += user_obj.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 6d28138ef266..e1ea2c5eaff5 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -31,10 +31,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
 }
 
 /*
- * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
- * of the QCOMTEE_OBJECT_TYPE_CB type.
+ * QTEE expects IDs with QCOMTEE_MSG_OBJECT_NS_BIT set for objects of
+ * QCOMTEE_OBJECT_TYPE_CB type. The first ID with QCOMTEE_MSG_OBJECT_NS_BIT
+ * set is reserved for the primordial object.
  */
-#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOMTEE_OBJECT_PRIMORDIAL (QCOMTEE_MSG_OBJECT_NS_BIT)
+#define QCOMTEE_OBJECT_ID_START (QCOMTEE_OBJECT_PRIMORDIAL + 1)
 #define QCOMTEE_OBJECT_ID_END (U32_MAX)
 
 #define QCOMTEE_OBJECT_SET(p, type, ...) \
@@ -157,7 +159,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -169,7 +173,9 @@ int qcomtee_object_get(struct qcomtee_object *object)
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 
@@ -261,6 +267,9 @@ qcomtee_local_object_get(struct qcomtee_object_invoke_ctx *oic,
 	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	guard(rcu)();
 	object = xa_load(&qcomtee->xa_local_objects, object_id);
 	/* It already checks for %NULL_QCOMTEE_OBJECT. */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..df94fbf5f141
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+
+#include "qcomtee.h"
+
+/**
+ * DOC: Primordial Object
+ *
+ * After boot, the kernel provides a static object of type
+ * %QCOMTEE_OBJECT_TYPE_CB called the primordial object. This object is used
+ * for native kernel services or privileged operations.
+ *
+ * We support:
+ *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
+ *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
+ */
+
+#define QCOMTEE_OBJECT_OP_YIELD 1
+#define QCOMTEE_OBJECT_OP_SLEEP 2
+
+static int
+qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				struct qcomtee_object *primordial_object_unused,
+				u32 op, struct qcomtee_arg *args)
+{
+	int err = 0;
+
+	switch (op) {
+	case QCOMTEE_OBJECT_OP_YIELD:
+		cond_resched();
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	case QCOMTEE_OBJECT_OP_SLEEP:
+		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
+		if (qcomtee_args_len(args) != 1 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_IB ||
+		    args[0].b.size < sizeof(u32))
+			return -EINVAL;
+
+		msleep(*(u32 *)(args[0].b.addr));
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
+	.dispatch = qcomtee_primordial_obj_dispatch,
+};
+
+struct qcomtee_object qcomtee_primordial_object = {
+	.name = "primordial",
+	.object_type = QCOMTEE_OBJECT_TYPE_CB,
+	.ops = &qcomtee_primordial_obj_ops
+};
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f34be992e68b..084b3882017e 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -140,4 +140,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_H */

-- 
2.34.1

