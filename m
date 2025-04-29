Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C31AA0271
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C8F10E2CC;
	Tue, 29 Apr 2025 06:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NxkJKZPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C649310E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqDWk004051
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Do1ywL2aPWTcX1TQtpVzcVjGBq9aILCb5vCCA7xohNA=; b=NxkJKZPGJwcm8SdG
 DOtY9IFdfS1/xRc257+yHF6FsqpLUsbX1FJnWEgpV7Ob4bN11jSB8EP6LYP8otrl
 rwb8w7UZLnxSKJ3f74F6Mh8OVltlEN+jOBWU1KNxwDBh+DEppYmrzbektOdhm9v8
 rfYauelfA66RsM3j+ultj0PrdvHSdWts4Y6Ba/1FZCYu6bV+tADspUS8UNC0SnnL
 7K79LlIMIpNTW50yKWh8agm9EA8FzIJjUZGykwZKn9ByteuNJ0zJtXpHdTrAto27
 NJAHbXPXhkccBUaS4DlGISWc/qqWM1NnjLqn4XTwK3sEqt4ECURxLBQHQNBaNfwr
 Et3P/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbaddp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-736cb72efd5so4208962b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906830; x=1746511630;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Do1ywL2aPWTcX1TQtpVzcVjGBq9aILCb5vCCA7xohNA=;
 b=HfJ/YO4x/bqfDy+O+SbgbAB9s90mEbK9QtoRZA99Y6H9U2ioslShDUpqt9QsvuyVQY
 JvqdgkogB4u7P0Mu0Jj15m3H7VvIIy9k1gygWwxcZYGtMk+6G9gg2b70HpBQxydZESxO
 dzf0dczMAAku2hUsoyDkqAp6LLlw0Uv2EcWZcHhnZ+3K7JvIl02wSBEr1B+y1XmUoGK7
 Re3JpBHN3sWVXT/mQr9kzos343bx6TSDdwlcaJ3lYUMsmWCAfa1k5Vt+RfItGbFHgemF
 tRmjPaiZ0B0Ok9RPzbS+05VVj1CWBrJ6SL3b3NTMAX8aTmjOyW/M1xwwZLo3XI637OKY
 hpvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj1lBic3loTPgy6sNkxkrmvl799DYoJzm/2leV+DuOPSwNbPIivlJngSyvBoa0OFBU9CM166mrTaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yypcycx/MEm0w89T3Sc3c+ksR9JbRXGIXft03guFD+W8ddCFUlL
 z/MkYV6yp0AG8R0T9ZJUmCWZYB+xpquDHkLo5paOsTA817B8KZZUq4a//KJuUXq+qiIFj1J18dg
 bJVgcJveT4rMcbozSEFjTrPlZcZoxTCk6jbZVUH61Ld/uItVsJWWR3FLhzSEED9Q/GQ==
X-Gm-Gg: ASbGncsK8fAL8Hz62uKq9w8MFBBT84QMOQYvkznX+5gQ+wkaWBlV0hCVGcWiPNrk3vl
 s0RsUNuw6BJ7P5fNE1Q6aRsiileB2svoeVcLCqGYDmJZVg0BNJV7jW2x4mD/3oTgDRZf3a/oONG
 +83jul6QIAtOkqwYi87hPd4YmVGVAFyYMjwbdSqv6qm93JFlpKyUWPyG9FvklWKoRasLGUaZ2MD
 kxGtOcPVprB2h/AzS6FZNejvO2szXfBlwMZyOcsvAZRrf+DNdWO3ggh2R0JwwrdRzk/JotDRknC
 pwPZLSKAw1RQWgsPSYkf3h82cqqfcAK5aDRkI4SYnmwk8m2MSI83b+cLGIG3AZkmLvUlCWA=
X-Received: by 2002:a05:6a00:1942:b0:736:ab49:d56 with SMTP id
 d2e1a72fcca58-7402710d0afmr3239292b3a.1.1745906829933; 
 Mon, 28 Apr 2025 23:07:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJCLBOCrwppDN55T67L8JyaCUrnYNo1UO1BS0g+YB8+xMmPNXJ21ihJHILegBGscF2pG70MQ==
X-Received: by 2002:a05:6a00:1942:b0:736:ab49:d56 with SMTP id
 d2e1a72fcca58-7402710d0afmr3239250b3a.1.1745906829502; 
 Mon, 28 Apr 2025 23:07:09 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:07:08 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:30 -0700
Subject: [PATCH v4 09/11] qcomtee: add primordial object
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-9-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NSBTYWx0ZWRfXwwg4RAWcrd4H
 j/lr/Cz3iZAPCPJCrsUuXxeOGhH4jE3qLGPZ9pprg/KYIdINIhco4kPI5Pga2mwXmtZ//mKACGm
 U49G0LHUUGo0SYwOz34IA20Ca8CBvf3Zye3OoDDQZTliKcs2iy7mPD3g58d/KtWtauZbAq8oN+k
 DNd/ENy4TRp06YkvpGQYsw6ZlqJFWXRjfKF3DMWa1B9mHgj+L2IglsZXcLCQp8o8BjYmO8BSrV7
 qOYm9L6XFG6za74a+0Q8A3Oj7HMO+PuBhMsS5m9gE0jw2Je0vdSfcsZdVgI3TKqhBzNNWCwQe5l
 VlJBdtv2UIGrEIZikRSut/qLYFW3pbol2h/DmLf0IP4vbMEIt6sVgpABK6XpJlf1YviyxE3IFcS
 pSJDEOVK2fZ9ekrnFJplkDDyG74FfHei1GAiJgPy5gmtfq+Raquw/6qeB+8ZuMX+XD7TNpU4
X-Proofpoint-GUID: _EbOwvc6L48o-FxIQpHTjbLBA_I3F6N8
X-Proofpoint-ORIG-GUID: _EbOwvc6L48o-FxIQpHTjbLBA_I3F6N8
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=68106c8e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290045
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

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile          |  1 +
 drivers/tee/qcomtee/core.c            | 19 +++++++---
 drivers/tee/qcomtee/primordial_obj.c  | 65 +++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee_private.h |  3 ++
 4 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 1b14b943e5f5..a3a2d00e83f0 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
 qcomtee-objs += shm.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index ad3b28f32529..a1ac492fd21a 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -39,10 +39,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
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
@@ -127,7 +129,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -140,7 +144,9 @@ EXPORT_SYMBOL_GPL(qcomtee_object_get);
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 EXPORT_SYMBOL_GPL(qcomtee_object_put);
@@ -222,6 +228,9 @@ static struct qcomtee_object *qcomtee_local_object_get(unsigned int object_id)
 {
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	guard(rcu)();
 	object = xa_load(&xa_qcom_local_objects, object_id);
 	/* It already checks for %NULL_QCOMTEE_OBJECT. */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..a30967d89c91
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include "qcomtee_private.h"
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
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index a6f2c0591580..e59cfb3b79dd 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -219,4 +219,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_PRIVATE_H */

-- 
2.34.1

