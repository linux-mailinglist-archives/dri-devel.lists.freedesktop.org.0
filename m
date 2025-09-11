Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07CB52720
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 05:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB63210EA00;
	Thu, 11 Sep 2025 03:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIs45YAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C55310EA00
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ik97005569
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=; b=EIs45YAro3qEwEC3
 a49S8A5D3EncjdPj4pIvqAWDdUSLOmHG2HDZGjZuHSARbL6L6rSQhLJ91KRJLPg0
 vVLgDbfsziahyewB62mUcRNrkrKWFPciihRSbL10ktDRqQlC1mnzL+gPOwHVtB12
 dAiGsS/ItG3P2pXKFK2oRk1R6Qm2uA2ERieOcO3a0Nr4HvyWnDb9ba5XhHm6oNM3
 bfgpkEOMoOK0nuYdpgPdOUSvSCmq/pdWgRjWz7ZU+FxpFXomJEQZQBjObtHys6AR
 uignD4nLgz5sXiwtNIAnyVDI+7DP3Goxu/MCFYLDCAPt64nDzzU2C7LkOgdIONfO
 zCfOww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2a62t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:41:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32db3d5f205so423383a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757562086; x=1758166886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30MVqau9h2AN1WxS7vqJoVCbxWXWCZTilNucOIr42c8=;
 b=c4Ew0bEPxTnRz7d4BwjZomF9u3KI5NcVYndoc6IZ+4CSHHJ72HHBU+CrcNJSh/TXzK
 lkeK22pimidwwIvoU0JF6LNBT+X0ikNByZoA1Z0t7uLFsWsQQZcTL/GJoytKWntID9MW
 sB9fTE3bDQ6fRvjA7WnLf5YhKz8u0yftoyhbbTffCYbLy7UlpP6KHnJQNvvbnZXWCmk+
 XvzeyV42CTY7IdD3XItsdnp3E+Nb+vHWcmg6LMDo1+n8UOsHkJdb1C3Tk8y4APZixghC
 ujdrZTvXlJQhRu+tt4bXAGfLYH1ctEeQpy6k/cTQRGUYPO4r+3c5J/ga6ZPnK0g/WKv5
 WHpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVikiSssSiU8QhHcyhBS+BO8ySDfASpxPijwsRjEV0e1wlEURI+8p6gTrlKwhTiMXUzOrfzpqugvo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNnn7nCY9H9z9lixWZpEj8g5myrjJDFhPUtgkraUbXEy6zMt2J
 tw1I0frljUMm776QMWz0PBR/WmxxHQHEYZ+j5WlJp9mDNqcelmVvrzS0qX8N80gdyoZLbwvAOAU
 VL5BGnEayJHgGuMWyxKcXLQUukYqkaz8/YjxQdaqwXmdjeT/JcfGvNQIgltbJZ1EoV5GfCQ==
X-Gm-Gg: ASbGncsewlBK5QNcB96Cil2x7vDOlo6flwy7C0P2FdWBvdI99oERZL+QRmFVJhidnI2
 JX0bwXB3GVhYvbPCpzVmPzStFcjE5LflqO0tr8C39OlNY66hchDoqoVZE1PwEy6ZpsvFkcn+Rt3
 BdKEtEBnSIge8f/cXZt8MfTtZzpCzKtC5Hmn5qDlbSh+OEd0eNFG7JJUUINHp4v5QubY/HqYCDX
 9euCnauPed+n/Bg0Okdp31lz1DBLtRTXTv4H3i/TWQLpTDvIeypq2PtsfDQ4+URFck9KmRkAirN
 0Y3d1Gpr6CW1dJOe+djVvm5xI5mIZuQuLjErE/NILY6lxjWwYHTfYlnn4olQkvAmEyDV0rY/kyh
 XDeZz3tGcA9u9DBq8tUdhJco=
X-Received: by 2002:a17:902:d2d1:b0:250:411d:fa83 with SMTP id
 d9443c01a7336-2516dfcccbemr289529655ad.15.1757562085879; 
 Wed, 10 Sep 2025 20:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNK+dvhXEwjPbidgExO5vSVEoN4mnn7hiDWFYTbts3RbLRlhWqysKV/H87BRXyKuni3VCG8w==
X-Received: by 2002:a17:902:d2d1:b0:250:411d:fa83 with SMTP id
 d9443c01a7336-2516dfcccbemr289529355ad.15.1757562085362; 
 Wed, 10 Sep 2025 20:41:25 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 20:41:24 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:14 -0700
Subject: [PATCH v11 01/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-1-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuldeep Singh <quic_kuldsing@quicinc.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c244e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gzmNU4paHkamu19Sm8AapgcVL1kxe7S1
X-Proofpoint-GUID: gzmNU4paHkamu19Sm8AapgcVL1kxe7S1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX2oR9yFPiN2c6
 8+wqzR9gg6r2J4pR5y2w/kPlNvNjzsFtKJlzhDYDf8zzOLqn5R4p06+XPSPau31d4vPrj2JFgOB
 /mwpP/Tr83beETptEpSaPSV7n1OWQb9cGfneSD+cz7b6jtClXNmVV44Z9rHlVD+H8s7o6ZvVHTS
 nx7Z4jtTIz/ZuPBB/s6Qq74ViisLjjcL1e1UTRr33ZKgR2vktv3EoclgMjXX/Q76rvYnWpbWJQA
 xJ691zbES69TRO1KdJMF41pCV/Qy1/qPDyHhAwHRTSQLQbN8sHN+v7S3CE0cOHkYPDJhrnOBQ6f
 RadMBEKlrpwrSB7hScXkfLf05Xlwwt1tSNVJj992ITNN/IcjOGBlnb+WIsNP5Jdq2iBYjQYhmcr
 4H+MmtyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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
Reviewed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 63 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index ea0a35355657..186511ced924 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -109,7 +109,19 @@ static int qcom_tzmem_init(void)
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
@@ -117,17 +129,49 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
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
 
@@ -140,10 +184,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

