Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775CBAC48C6
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B9C10E420;
	Tue, 27 May 2025 06:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqqw/CxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B36B10E424
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R45tVZ031141
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r7p5wIcucyhHrQxwAItjNvN0FjGJcDbXXW5crNDRZCE=; b=gqqw/CxBBoqY5ULM
 fhcwR2ESp+lUhMttOnb6nQUvjxqQbxsjrr+MgvEYDEZOzFFqdqhVRCcr9XCA3d8D
 1dJmXS2w2BEJswAvb/fF64dW6c8lxAUNLcwPgyGUM0jKknOq/lfBYoAsNtTG79ei
 /timmgLU6ND9wxd1rSg6PC6NcKobi5/7jKSEMeERXmZ117DvyM7wN0pEmeFjJhyT
 PhlbVzAJLncHtJySvLPpezCG89r68mdEbBPmhjOm15NZjYvqve0klavWogw6WU3y
 Lqlmr7ywNB+Eip+HMH4LsMcfHaOBIjSykk1mS1X5yKIjenZcM3DQRtDsxiapt9Qx
 DLGt/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66we4ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b26e33ae9d5so3459570a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748329048; x=1748933848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r7p5wIcucyhHrQxwAItjNvN0FjGJcDbXXW5crNDRZCE=;
 b=F9gjYeGpwIMaj1Iu8rVlxPQTIbBO4c7hHvFFDMxinlarbe1aXIJlXGZLqL35q3s3vk
 2xhs1OjMtbip9JlfvX0CP2EfKXARS7iuhSTboeLDcUUGHESQizDhQgeD0R6uukHANavR
 S1Pue+C+FXySAxJn39jBb91EWT9hYPaExZAi6hp+tSh50yOj6FhDYVnly6eZYcHLeUbI
 YJkQR0Zj155FaNPozXF9WYoVjdVM7SIbQwtcDfK6OkNAGygnLM3z4+wi++97GHDBhrFJ
 h0D9xIVYzSRtwfWWp2jBA65YE7TYSNpcsIPW8iTncYu+F7vpGLpq5wLDNu7kRmd9Xmtu
 RJ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDUuzeMmBnhGVy5g4/ax24I1cjdtGCpda4PM8CeneBkwl8r7TX0ZnrbH/3UXw6TYBOpQW8nAC3Oyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywoAhKTQZAaT9oi+F48Txk3CKDV9HwIkb4mYqnJCpoE9ulxCpQ
 nTro8VvktBIS2nwspPF6b9kuVtIHiQHSe8wUaz4jomR3q9/Clmdi16PPyIhR+ch4JgErUE8pQMc
 zQjCySNEmsYhQ6qoYuRihsi07w/BskTTFTJ035ixcNm8Z2DGrcJlq8PwnVGFBQm/z/Yuvfg==
X-Gm-Gg: ASbGncs+Nc1LxBofqb7gH++S+cv56xlWavtugBzCVjkSCv91nmpaLLrmRY9ZGZJ/lKI
 gOWO2oImACLCFeP/7l9CecBHrlNMj2ihbs5MkWaim3WQgGYg7lkLkGmRoCNjvWbvUtNIZo9cj5E
 f12GbEUjXgk+Eqwro25nBlsWRd3x5vt6DsSTnW4gLrW8rKPfw58Bm+aumFEzXLpo+09O5u/fkUa
 Gd+DWMTQQD4PWErdhovHsSrmWuBbPFOIxx0F93mc3F3VMUrTwjU9badIdWzlEhA2nkqKRFC8H7j
 3Pkl8njaOlilOmIwGYcCx+nFdfD3Ud0CImHMgYi1f5GMDzNuuOQHPRjFVizR8vsB1h0JnVc=
X-Received: by 2002:a05:6a20:d486:b0:201:b65:81ab with SMTP id
 adf61e73a8af0-2188c28d896mr19833053637.23.1748329048496; 
 Mon, 26 May 2025 23:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFexkA4NHo5Y8HvWG8uKoYr+LSlplsErj4F0+4oeGi5eDPlEZ9aK+pCe05GQcMii+vdIgVS7g==
X-Received: by 2002:a05:6a20:d486:b0:201:b65:81ab with SMTP id
 adf61e73a8af0-2188c28d896mr19833015637.23.1748329048099; 
 Mon, 26 May 2025 23:57:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 23:57:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:53 -0700
Subject: [PATCH v5 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-8-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68356259 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Nb9D5b8lFpFJL_IULgelnsem5RvfCp5Z
X-Proofpoint-GUID: Nb9D5b8lFpFJL_IULgelnsem5RvfCp5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1MyBTYWx0ZWRfXz7pJMNv8UbXU
 mX/qzY/OwDaWoBUH4p7CCfB1IQITTmpQdIYY0HdpnBlpR0/xydds50jRYbGaoto582B4vLcxgte
 Cl9IQD8Y7bsFMaEuUaj2fRnJZWMdbBvEyx+8KNqN7d5C5gcljA31P8224mzNiK9oNKG/z41/8hm
 0m9NnSpDLdD/jK7JDI2m4un/PBeksLA9sTRpt6AvkuXeqUHyY32Op/jxmUwdFOY7Nr9QV9khy8A
 LAONoDUG6NlbEIh44V5DcHTzguZMvKxMRLHG3Z/UQTZrjw9lzsJvWVDlJ2cjblgHdtI9D2nWcSr
 WsW/wIrZF5xR72ArnbOEq1M+rO5wY5un3JF1sma0a52SRgv/Oyi2eko5G3r04yUI9DrW9X5RTNy
 EM5wdhEg/E/az1WMA4NyDqvrj261Ix4GzZB2IyvAq6Leef8qUDIGJkjJmqEvCedCYTLNmhWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270053
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
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 4fe333fd2f07..e9e4f06924ae 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -108,25 +108,61 @@ static int qcom_tzmem_init(void)
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
 
@@ -139,10 +175,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

