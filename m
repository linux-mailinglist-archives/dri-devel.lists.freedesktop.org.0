Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BCDB23D1E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 02:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5C110E686;
	Wed, 13 Aug 2025 00:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoP9mL0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8493510E685
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:12 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CMLH7q017781
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b+IO/mYYyn556/HWuKEpMTj/0Tt68TcQ9XKAg4TOT0A=; b=KoP9mL0+5p9sVY5g
 DB+MjLf0Ot0KNG+qSe3KtuAJNplE80NHP1+TMqGVmsHUGck7syVisYXR8IH28s1H
 WiRuZXFRqr60rH9Npqn6JVrO/C7Hm1kl/XjrtCLkxMWZrM3jgOpxHReTp+/vKWHg
 RL8lFgwJYj/EIJ33JFiCfQaqb0n0qbErhvvhClbPcS1YoqcFqmq0pXP3mLWeHCT+
 x+UqLi0ReH3XZM8tHJolPV/d2kYu63MOPaY5rf/edyfRBNRA2VQJex+G9nY3NXvU
 pRHuj8GCoxixxiMAku5PnqQFto+IjLolHKzGQlJ4u4Juy2z6U5s6Efwac/XKHXzZ
 BmMMxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4dvm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 00:37:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b42bcfe9cf3so2996909a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 17:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755045430; x=1755650230;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+IO/mYYyn556/HWuKEpMTj/0Tt68TcQ9XKAg4TOT0A=;
 b=OnaBBb3wdq24dP3l08ZQljlCi3/oGt4nWAWcGsqFlL2m8Tm0sMp8O4pYXj3mKGFa/F
 HBFoWwCxKvi7a2q5KxvTjYlkjADjRDL6RZymRq2Ix/nMQptFxmq1EBdIdFoqkEdxhrm5
 6TCYj1kegn4hExlcffVuovbHLmj+iEEUdMBReYxHjjnYeNEFNJ4CSpxGvFKuWZ+gbHZO
 kd2a+Tr9kLu2jBqigGOwDhjNBxZnD1Rsz2lxTKGZpyX6SQgHnxGXeTcjR6JXaFFwbHdH
 gg/t5F3ImPZP27JNS6/D9nXkMUKnze9WbE5EA1fyZeUiW48kuxm7CMlCpQZkOnQaKfqu
 wN0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBLO/4U7CZmt4KE0Mxa/Pn4PxCAjomM71+h84LjuC8BoS3P/QqGJG/PoKzhbBEzIRXSh+iBXlGb4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9vMLaqLSi4Wl9qWdbPGBJgTfy9BiYARqe82l+OSn1yJz7f5tL
 UcHRWJPk1azchTPo9yFMcf0EV6pEzQjV30PW3vnaQg9fkG4soTubPUFdcw9XKuOOYEp6y/Pb6cN
 bE4KBw/RaGJArWqrlGqSGepeSOtpz4HrgyjMKFO/vz3EiUiKzAODBVu/b8OTFtBOJcaJr6Q==
X-Gm-Gg: ASbGncvVOOlQsG3wUJLpAf0zqd1W2/AMq6KFxzwCkKcTxFG82vi2Ydn0DTZ688PG2es
 /wJ/pD5XAJau7/evjenaJ9xZ2SldtC24lGPOvFnA9JqBT7yiDVjFX+BB8ns1rqb7t31CE2qMvUT
 GaM8prJRxBsjMlKl4v8e+8Ppi//tLegi36PFC08cp78B0Hfm35k2Yjv+mjSftF0gJTW6Pfuu9CX
 YbCehmMUoZDkFM37WVtocWhwjJvY9142iK/4Ijd0i6c0j1xv5yjXntczTJ7hhCd30prXqEWoQWZ
 9Bw5nH6ZKejZtzKD5PCdTQMq2ED6TkXZdGieolSZ/Km0csqvMFjAMCRJ0BtJ3ZMdYu4RQJbVE6B
 LLWW8K3a8gUa2oW3Ot+Hz1q0=
X-Received: by 2002:a17:902:db10:b0:242:86e4:3d86 with SMTP id
 d9443c01a7336-2430d10df6amr19174145ad.8.1755045430201; 
 Tue, 12 Aug 2025 17:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXqDrIPqSDRuMX+/u3XPMvQEItZdm1JDG7Hzxm2pbqkxQe9lDrS+2GxflzEd97bkgHKl+fEQ==
X-Received: by 2002:a17:902:db10:b0:242:86e4:3d86 with SMTP id
 d9443c01a7336-2430d10df6amr19173735ad.8.1755045429681; 
 Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 17:37:09 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:36 -0700
Subject: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: Z73Sppf9Aq7PZhzmbiv5_DzM4U1A6bfl
X-Proofpoint-ORIG-GUID: Z73Sppf9Aq7PZhzmbiv5_DzM4U1A6bfl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXxS2MgryjpmSJ
 Q3X6rNf9S4yXONiPj8+dZ0Ry6ivTQ7xAAXXKsXjGAPkr2kTy5j04mD5F6E6QR6Yz1r41I6cVs2O
 iPSKc8PU09c0EUGP5IpEq4j3waEBPvwAWC5cayyDB4okEQaGIy7yESANakweadC8rwvw241VwbF
 Ed09vUkipvrIjNXfeBn+KoJSKcQOJSNyZG3AuWWZKkBZUYfDO6clRLOHY91lQZusPfNqwjo/Sqf
 TuIUpTy+mbYyXqkCsuI1iP6a7c1ZPMb3B5RJFmXqNqA6toJo1t6Ol3oxZES38iC1oK80/mioZX0
 emedyRzusyq7n/77YUcIT8TFzRl8df7NcYPqe3zCNfGCm9uwZIX6wiHgQibVnK5bkpUZqoig3Bx
 dIF5Mp/5
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689bde37 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 63 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 12e448669b8b..9f232e53115e 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -110,7 +110,19 @@ static int qcom_tzmem_init(void)
 	return 0;
 }
 
-static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+/**
+ * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
+ * @paddr: Physical address of the memory to share.
+ * @size: Size of the memory to share.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function creates a SHM bridge
+ * for the given memory region with QTEE. The handle returned by this function
+ * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
 {
 	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
 	int ret;
@@ -118,17 +130,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
+	if (ret) {
+		dev_err(qcom_tzmem_dev,
+			"SHM Bridge failed: ret %d paddr 0x%pa, size %zu\n",
+			ret, &paddr, size);
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
+
+/**
+ * qcom_tzmem_shm_bridge_delete() - Delete a SHM bridge.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function deletes the SHM bridge
+ * for the given memory region. The handle must be the same as the one
+ * returned by qcom_tzmem_shm_bridge_create().
+ */
+void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+	if (qcom_tzmem_using_shm_bridge)
+		qcom_scm_shm_bridge_delete(handle);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_delete);
+
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	int ret;
 
 	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
-					 size_and_flags, QCOM_SCM_VMID_HLOS,
-					 handle);
+	ret = qcom_tzmem_shm_bridge_create(area->paddr, area->size, handle);
 	if (ret)
 		return ret;
 
@@ -141,10 +185,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 {
 	u64 *handle = area->priv;
 
-	if (!qcom_tzmem_using_shm_bridge)
-		return;
-
-	qcom_scm_shm_bridge_delete(*handle);
+	qcom_tzmem_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index b83b63a0c049..48ac0e5454c7 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -53,4 +53,19 @@ DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 
+#if IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle);
+void qcom_tzmem_shm_bridge_delete(u64 handle);
+#else
+static inline int qcom_tzmem_shm_bridge_create(phys_addr_t paddr,
+					       size_t size, u64 *handle)
+{
+	return 0;
+}
+
+static inline void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+}
+#endif
+
 #endif /* __QCOM_TZMEM */

-- 
2.34.1

