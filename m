Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25030A74272
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B53A10E970;
	Fri, 28 Mar 2025 02:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KS0qkpGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0895C10E968
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RNUNBY022621
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=; b=KS0qkpGedDkfnD9q
 iHhjTBtFeLbu+FUieXhj31uqFKPJ7vkXBDmjq4JDe7T+hFCGZ/+FKhvmCOO7oQh4
 v0CNWhfScup9nlXiQhiO5wwebZGPbWPE7eH8Q5/fMx4tRn+YSz17Yocl6slscUnN
 xgXAl7pIg84GImek1Yo+VDpkUkljF0e5IxjkLgdkwjek8lXNwGs2wVVBF81A+Y8J
 /Nr/exn4FOXWKcRcRAHuXgI07nf3PQsf6k2DE+7L2II8qIB4o/lH2Ceo3eG7KEGv
 bCqAGQj7xWdbHWGRp0I488sbvgXDK7+/7+yg4z4KHxX1Wn3ukI13eGOCulTTC+6T
 77APkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9r8yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2240c997059so36936885ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130106; x=1743734906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=;
 b=AV/8IqYgbKNiFuAlVHootKnwrwOeoa7DA4yQ7ccdu+CJhLQY2zVHCdhkMUT5d0i7hB
 /YPorHjKR31PScO490YO6oAljozAsN8t/Obj73nVom/IqsKzaMUezQJ44UpL615bfP8w
 2vlhFvbaFARMyMzlblAM3eH07DVI1YP2mGhxdtUgQ4K1vJSlifNF9KKiYNsPitJUgRGu
 vFXNh7fLA4KrGczq2wlMpxRR6QM3zDanBJjBtfKq2Mrx6VYKmuDWXi8yTXS1hG6i7HS0
 PW0EauDcjJ3vJXebgNyoziV9qny0o1VwQRq5yfChtoK/QrtRw210/ruQwBqoPsil/I93
 MgZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqP4OayIMYxJvJjiYPX9LH6+APwzwdxWSDJHE5cWJAd6mwn9GC6JShPNHVcmu3LgCQ5CFwxlNEE4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHb1vsW/Za1o4QjcjlznZXnFp4dH32IkXVHGJ1GG4XYHhSjfcR
 +Aa7hRiUaZSOFfRiAKAT4YFS35Jsrm8Wcqu1oky4ug567W66TXHUXpeqH8KJm0lH28NwoS4qglD
 mXPSf51ddUxV2t2msG1ZychoVk92f0VjTlLSB8YttwLik2eodIw8SKpjKv2KjRwubxQ==
X-Gm-Gg: ASbGncuZlg+isbuREfzujO8zN96r5taH1dd3H3jDQ9vTdXwc+nzVeN2nH3AICNPEavw
 8DDhLRaAvpwuqf/n+BfHnwvaWNEysxImi0umUbZL+mXEGTARBGX9FBqiaM9ZuduvO/Y+/xvzio3
 P9+iiqVsijuDatpFN2HnW5azgSUbNnRM/m/M7eARXqqlANodZW29LvP1cUzAmKqxyoFJW7lzqMe
 V0Dq7rSMlqBe3i1zY/f8/47UmRZI6yjkM1YXBSJordfBeQ7t+hj9AeDZOeujHFQYdBVp30i96jB
 0fo4um8KKy1MbFnFObh2NHov7T+4b9iRNuI2wy38vVdrvt/5z3rdeOU2C9GjgsphJrgEL6DVeI8
 =
X-Received: by 2002:a17:902:e550:b0:223:6180:1bea with SMTP id
 d9443c01a7336-2280495ab8amr85453145ad.37.1743130106356; 
 Thu, 27 Mar 2025 19:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFShwsFTfsJxmTJGL4N8BJKEZBwXtBMU0nJp4MUGaWH7L96V2az8sO9lR6b8vk3uaylU1opKQ==
X-Received: by 2002:a17:902:e550:b0:223:6180:1bea with SMTP id
 d9443c01a7336-2280495ab8amr85452815ad.37.1743130105801; 
 Thu, 27 Mar 2025 19:48:25 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 19:48:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:28 -0700
Subject: [PATCH v3 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-6-7f457073282d@oss.qualcomm.com>
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
X-Proofpoint-GUID: IsKYoZo6F22LvpCuAzGsELJzMt_KzlI3
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e60dfb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: IsKYoZo6F22LvpCuAzGsELJzMt_KzlI3
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

shm_bridge create/delete functions always use the scm device.
There is no need to pass it as an argument.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 4 ++--
 drivers/firmware/qcom/qcom_tzmem.c     | 8 ++++----
 include/linux/firmware/qcom/qcom_scm.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bff1b0d3306e..9fd5f900d327 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1631,7 +1631,7 @@ int qcom_scm_shm_bridge_enable(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle)
 {
@@ -1659,7 +1659,7 @@ int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
 
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+int qcom_scm_shm_bridge_delete(u64 handle)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 92b365178235..548dbd346b1b 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -123,9 +123,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
-					 ipfn_and_s_perm, size_and_flags,
-					 QCOM_SCM_VMID_HLOS, handle);
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
 	if (ret)
 		return ret;
 
@@ -141,7 +141,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return;
 
-	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	qcom_scm_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index bf5e64f6deba..33fde08dce70 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -149,10 +149,10 @@ bool qcom_scm_lmh_dcvsh_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_enable(void);
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle);
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+int qcom_scm_shm_bridge_delete(u64 handle);
 
 #ifdef CONFIG_QCOM_QSEECOM
 

-- 
2.34.1

