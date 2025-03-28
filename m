Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8651A7426F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 03:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1F310E96D;
	Fri, 28 Mar 2025 02:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmm9uEWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6408510E968
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REfBTF013778
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=; b=cmm9uEWV1oeL8jPl
 MZVPPVx/4ZLP/0uZyhNkOysZJYIlURsbiOcbhp9287dAHOSzVN0owQEWzpoX/U8M
 u8oYodI8dXj+TQxf3nKFcTYpAi4L9fGBEUROs7Js74yaAxRGvgOO7Rbpep+2tcOe
 xwqrtdBlTdc/5NQH+ntXoKRX+LR8MR046dAHHNV/t1RfGB9EuzQJtSZ9B/VM5Kqv
 bQkOQ+jHKDRYEvqfKXAlZnCaTB6YHWYadkg0U8MCQmNmBeRvg0Bnq8RGE90NCqcG
 DGrU37NkA8q4LlNmN2Ig/EOany7qaIVdGR3LwCdLHEeeyGcJXWdoYVbQDZAE1Kk4
 e9q2qA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcnuye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 02:48:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-22410b910b0so25351405ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743130108; x=1743734908;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=;
 b=JLTrFI8kzXijYceXXmL2N5LX66gLCPNX/VPUuX8P4H7fCuT7aru1N1LF9OCuEsrcyH
 t1y5OJ7rdLI8HB+dU3/TStok8TL1Cvi6ZG1FQIdzzOlofvBP7gGqZQ1x2GshQLx3nDKu
 HnXnBcNl0mxmbK859RJtIXc3VSaOudvLbYE2v2djobGxUJO03TJoVg6WVHdGDGxOySBL
 5ktQQHefpU2Mh8OCZ6gc1ld/kfc1k8fRRTwPh328S6yWGkeeOlCWb3BmXOMjI0spZzrf
 SHXXuMwVEvV5czkgecmGLpC0XE1jxJ5cgLWFMyPrug2AgynwiJ4t1n37Tq2ktHleD01h
 r8aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWylkOlyEYr6du3YtnDBXkrxD79k3pLPGhFY22rd60lRThDgkoIsyH8Wx6sjGlRIDOwIjhmmTi1hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOHatCW0vDw78amjX9vx6uzM8eS1+ds2JrPyq0kH2fUc8WL5FG
 G4PkK6a1Su6P33j3pkaNPDwuki1lZpNUMp1lP3NqbSE/5LAbbsKnBT+6yP2ZERIyIThivU/MxHV
 41Ie/AJ27J02F7+gxwAjsvQCJiiJX1+CxTUNBIZtVN89aqm3B7OyA1YuQK91RSPrlIQ==
X-Gm-Gg: ASbGnct76xGZfgMJ3jpHtTzKZRG7weK16LzN4FRZZ7FkfXStZ2WZQXWwGutPgD9fFEq
 oVunUm9J+/wYN6wnF9WBEXB9sqXbYpe++dpnJiTyi0YyBRPydng2lmoX89tF4DXxXIW4N2LgXjT
 QUkAWnQjtpB4Xpys+LP/3Aceay3DW9fQN3gTrcZYXe+39KYQKiyirp2Yu/lSagQA/941kU+UYys
 hN+legwonkMzvpBtly3jytl4e2QjJAp3ZL8iPFPI/mYQn9VU+ofG1GIVDmE1X6gLe9Dd6hCkOND
 3tWmrex2ZzuWEBXQqUGPereDOFc6cYQCyqHKZ2z1nr1cALQMvo0QX1j5EhvCEFB3zM4NiJ4QU1Y
 =
X-Received: by 2002:a17:902:cccc:b0:224:584:6eef with SMTP id
 d9443c01a7336-22804931682mr102374195ad.41.1743130107691; 
 Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG376plMAvRztvVxrFSFDPsbw7FDsAlz+S1si6EBOZRDE9gW0Z4qYLof7JAVDpMRLsJ8rwJEA==
X-Received: by 2002:a17:902:cccc:b0:224:584:6eef with SMTP id
 d9443c01a7336-22804931682mr102373515ad.41.1743130107044; 
 Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 19:48:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:29 -0700
Subject: [PATCH v3 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-7-7f457073282d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e60dfd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=F9FMNDSCD7THEPBdllMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: NP0c72fitU4mpgfvUiSQuFOGspKK7nGl
X-Proofpoint-ORIG-GUID: NP0c72fitU4mpgfvUiSQuFOGspKK7nGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
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

