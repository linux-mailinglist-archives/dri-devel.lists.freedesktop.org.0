Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE44AA0274
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1210E2D2;
	Tue, 29 Apr 2025 06:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtGsl3FO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0510E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqqrV015874
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=; b=ZtGsl3FOipkDgsFh
 sqDrYwvaDlCxRraUKyTkAY2kyqTLRhOpjEueW1qs4N1ci4Uq0fQk2V19q8Fd7+g/
 saIziV9O/f4wPl4M1WqF+s9jdoP8qyqhrEQr1+G3iuRixS7YIzhVaR3FLgVAMjBl
 i+YFR9AFQes6TpagJlMJwMdzCzbXNRqhb9pz5Dnr1MHZYOyOYoWYmCIzC79JnVSH
 YC00uGLspjsZpfWy3AT07Fkb4WWYbT91+puv48Rj1ryPRmOZ4O1CC4JH2Bmh7x+D
 N8pwe11pumMtETD09Y3nDZj+puX41l6+exAEGcf1+dOhqR0M2ZdPVNWDQTGrj8l2
 d5PeyQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8htc4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-736b5f9279cso4943236b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906826; x=1746511626;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=;
 b=hfdo2SVdRcvt2pMKs4MzT1dfQtQJcVKHk+K6ieild/3m6bL3qcM3BjrX27hj5oGGt1
 /fO+T3XQjxKS/6UdOBK7rkc2AT6LuefYOmJLNZ8vNCJIeCVCfzlV5OEGov7L5yjpf662
 mxM+u1HWTlQkLzNLB8p1PlykfluprVVBdxSj1mImW4GgqEfP0BTUAWXQjzgyNQ0G7gMc
 /6lo6t6oVLFTXMeCt4NVwv8dkpek3iva+p5gmEAhZ0fn4vEyf0HdvVKcOACARedxCBgr
 DkPCiMwaonznnp5kN1z8Rks0X9MJkAv/8wcXQ16TWLL1gvIbAoDsCGx3or7hlG9p7tRV
 JSZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDvYAhzqENu91SYX1AhI8yQHT3u7qV7m7z9ZZ86GBayawKorCWxyoWdLdy8DRX00L+nSc1VwqPh6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMqC+NKfS40IVlIKI1LTb5sxV0lXmOx09gTMJlcJ5ohrn0V0qU
 5Mmkg8u+uJqoqaSeegxZ1pZSSI55+EtvRIJaYvRuuG4Wq5Qx7/p47qEmvdl1EEgIJVO1HSTQlQf
 IqtdRYpZzhY+tq+qIeArZw9/DqpXbUq/5b9tA2IXXIptjg1LUqIQRYlSPlRiNpjZQXA==
X-Gm-Gg: ASbGncvpWaAJv0NMd7EuVLi3WcKd9EAwRWTEd7obdvJgEZ3C+GEpxbdF+FnmkqVINCV
 nhaA9ekdvfaLG2gx+keo5BGXhUEPHjIwBlM3A5VeihDxcT0XWtZS6/9RUQCXYrrnIcD8YAGgh78
 OCQeYHPZnW0OyerP9S0dNqRdfgyIPLoXOtGyCTcU7YUJLw9s/HQNyxiyyOL6IzKwbdBrqOFcBk/
 cPhamBko+BRchBrvPkaY188OFm3p6CFEMzcf8SQ/rd8tZ2viJyVH2KcEfJGBiV0iiKYSLLZV1Px
 W0kHoP40CiPanJ/h0kD0Dz6CyJXM/aPXGJlwu5rG0N8BcUUmJp4feZSj3TIBrnibKOIIaCE=
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id
 d2e1a72fcca58-73ff7246ffamr16790007b3a.4.1745906826428; 
 Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Iw5QWLjVAX0CA1a1Lr5eZnBvSqfuSz+6cNc/A6mOFVZZHAZTnGn+CTOmtVDh40vcM4lMOQ==
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id
 d2e1a72fcca58-73ff7246ffamr16789968b3a.4.1745906826019; 
 Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:07:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:28 -0700
Subject: [PATCH v4 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-7-6a143640a6cb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: EDtCkLDuDfzRKO2lqXa7FzrD6KMsHbQN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NSBTYWx0ZWRfX+mBzpL/pqPqL
 CCeIEhLhaaRAh/27KNPWVmwD6PJB86XwVy3pxTTuI3y40wA40ihbmitq0TDp53sjyt0r9zjTjlO
 HR/Hrom0ekXZnM/HLiN0OYNUnml4n2wRTamzF0KPCbpHTR1124sjEJaaXlTyCa3DG6hSU9ETTLi
 2AacTjKcbo0Qo8XmOI4WMOIoFVQ3Gs0kXBRvBJDpNsOBofqX0ohtFmf1c5s7WuztTgUhgT55K6U
 w4Y5bpEJTnmMDPrvdX7rnqvQV3TyakXgdeyIjKYtHz846xuSY2tQWbbl6F6K4/cemMjcsqqT9DY
 4+oB6TSX5OGOD7pPoip0LuEN0FBAUCFjyHLBM6z2dRFYMotT0K8OJeBciI4Dx7x+/hLcDXGGH3I
 W7vd19NYnpLgz/PJXofxudja9EU+a8B0VxG3YrbUiH9BeNicmIDLwaMBIKM/8KSwTXC7PX7W
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=68106c8b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=F9FMNDSCD7THEPBdllMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: EDtCkLDuDfzRKO2lqXa7FzrD6KMsHbQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
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

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 548dbd346b1b..a02913665801 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -107,25 +107,61 @@ static int qcom_tzmem_init(void)
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
-	int ret;
 
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+				       size_and_flags, QCOM_SCM_VMID_HLOS,
+				       handle))
+		return -EINVAL;
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
 
@@ -138,10 +174,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

