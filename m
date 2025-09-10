Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98AB5099B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 02:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923D10E286;
	Wed, 10 Sep 2025 00:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeYwalUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321210E286
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589I4cQh000914
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=; b=QeYwalUE9RS+dIeq
 zVZqu+TYV+H2TDSg3eaaY817tAMoGXTM8pWJPQh0KTeaw/Kzg7widV4Y7aU0XwVB
 CKW/vng6q9gPW8bs0i5wqWJv4iapO5uT0LfQD48HNx6h/uNc5ltYy6LmvKSMVkp3
 m+ePDUjnZvq/DFgXFJ/6QVUNF1dwrc/D5EDV3gfjcu768fEr2pYzyrzXmUx1RYjM
 RXOQSd1grQ9qGWpg+xrWgWYzPgNA19s829QodY20JXARHOoA0B4ftzYW8ucZ6Pc7
 3bo6rpD84O/FUglj4Y3Fzj0li04QKjYkGkBWfVkeVOcYUYG9c2i20IoQK0Nsxe2L
 PZjjBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m1w9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 00:11:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-329e0a8337bso10099318a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 17:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757463078; x=1758067878;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vF0nyR92c18PkYaLWTQ1li9PHbNqzQgJEZPcJkVcA+o=;
 b=Lt6lejzisll11mn8XDdVWbahuB4A/FIHTxVtINqlpN/r0kuTPEIJvtEFb/QPGgwxQh
 BSXB7komdKmBva+COpY34fg+V6pa8g+K3yL/hGhs777/D6LBOEabw08yO3qlNkf+GBjD
 0Cu//e6DAZnn507PSUrcRxP/pvlEqJgrjHU69A9k0Yrvt9dXnnOCgRbczxSl1ALjun7I
 MMvbXKhL2lL4I320cUH6zs0gzQemRsDpzVp7LAF6x+TrTjfXXE85eyEVYEv8LO0zUT4y
 MDmirhQjarzFOHc3UVEGpdRzwtFj+rPIxgG5BwC6h8Ybulh9CEtP2+PWYdYJnRVVl9Tj
 VzCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdROGF2Lf7ny24rN5wfDeuEwQIHc54Fnqn7xllAnor1jyMRcaVZlwIKz6t+qOJG7FzPaUdlrkfqU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytDZEPJ+JqrvbFJhYJrSOxiInVkjncgM7zvGqRUbA4992Htuir
 EPGDaSWg5hy2RUky3M8+iApiMCsHaAo0KxIRcShjXQxC6jHmI3MlwgZevVDF0c77Qf1un9wHHSX
 bDiA66Lq0MKP3Ce7dub8ssrWrC3stjiM6o7hf5aPUbbPdJkr2Qk3QuDotcNPVeHWeD9SQbyVP/x
 4K5d0b
X-Gm-Gg: ASbGncsXeyDpe8/Ln7cVL6U08M9JLEhPqyMxwMqEfPz/IfrcvSwPw2HXw9pTypSZTaL
 A1U9+9mHniX6XnQRLlSrxu7n2oaUaN+Q2ipLTqb3YjGpulfNpCLgYKJZbOqq7e5lmJPgB7ikPKC
 h9L/6YnS1gGHmivlSHgg+t42GKZYAn6UNie4pGOepDw2jViaJBwZw4oqEIKuAuL3U+j3qEnU0uF
 mZdAGD3xmScEGQ2I3vLwkT3C7EfvhOacr5DGLY1yh43w+eOSk0gFG8dvRkj4oIa3cwYMaWY70bj
 YHHkngSV6MrF8Lpmd9ougx8wxG7Bj4F6LvA1aZ12olfuIqLuVPip4MVvhUEgQENjKe/QIWLlZ8P
 t5inFxRHEJLD2L9D0nVG3mo8=
X-Received: by 2002:a17:90b:278d:b0:328:acc:da37 with SMTP id
 98e67ed59e1d1-32d43f04ffamr16696075a91.5.1757463077940; 
 Tue, 09 Sep 2025 17:11:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIXpd0nyV+5W6CDzwhd16gTLrOkaPXC+72FYq1kyJ0evnvLYFejafDZfWoW96NTJmQ+vsCsQ==
X-Received: by 2002:a17:90b:278d:b0:328:acc:da37 with SMTP id
 98e67ed59e1d1-32d43f04ffamr16696027a91.5.1757463077356; 
 Tue, 09 Sep 2025 17:11:17 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 17:11:16 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:03 -0700
Subject: [PATCH v10 01/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-1-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXyNIizhqIMa3M
 VEpdT/MB3UoVEaDYhfY6VfKIpifdu3dkJLaSBpPLcxJy2WXC4k3NWtqMGF4glzH5EYc3gCvbIc2
 hEvXYUQcGHfNRyIME7n7OAQdtH3N2DqfQJCESbHln5ie+cUbW4iAy03I7pfpiRD3/Ulcgf5u6i1
 bgP3CZ5pfZsbrPFO+IsOcpEzhSXGW6pa6bfyg/fZl39puqwhVo9+8h/LEx2WVBeOWselShP4ns0
 dVuOXtwuT4yY1UEllW6O8jce4l7/ZmZ4uOQomNYarUBYeQBn6EktcPyr8NWVae0HBySnLxBq/Mw
 QAjthKZKWOV2+Uv/E/aXxxoO/34iClmzbIBQudz1+woremRtAzhrtM/wXg1leEcs1ZRw2aAneU/
 hkrNtvqd
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c0c227 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pOLgJYb0tn3-94uHo418sFJzslxutwCR
X-Proofpoint-ORIG-GUID: pOLgJYb0tn3-94uHo418sFJzslxutwCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

