Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FEB033D7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 02:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FBA10E1C6;
	Mon, 14 Jul 2025 00:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABKvJtLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A435410E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:33 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMxWnF031462
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K5ZMFVD63Ff3BL9GgM0LUadXZ5oipT6BmREzK1uu+zI=; b=ABKvJtLDl5/6w8cX
 ZfFcm+Eb23kIrjVXIhXiZpVDHxkbYKOC+9aoYxWS3yAxjEykcB/bFqEOlmOlWdxJ
 eOGFu6Fa8sJjTmC5v4Ckqlshfsgf1XCToY3/03ohWJCz+DZh8nABuLwIMvxTTsPv
 RC0gFv1S5V8PjP/WxmNZG27rGGNHdz7+JQ/gCpdHbSVx/nD5I0G9IDxmf9NBns7g
 +nngRz7SN5F64kiokwpIsihh4qHPLXx3OVMQFNzEmEbRfWh7Exs/LRQH73os8x4V
 XaJmQRKH1YqucJgsVS1PreDPPP2a5ASWyTyO/mx6D4nBgc80CEefrTwS4ImFEw0o
 d7nl7g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uh0aaskt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so5027287a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 17:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752454232; x=1753059032;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K5ZMFVD63Ff3BL9GgM0LUadXZ5oipT6BmREzK1uu+zI=;
 b=dKRgnyN8oEfHKYMnanZlCyaFtVX2Zmh+OQc850ZlSY5EpXrY0IuYtPuX5vEHRyE9rz
 HBbYfsumC8aPNji39yjSKynhi1Yk7FeN53Zw9yB3tSo69PYF3jHFVnrSda4/77NNx4JA
 oJ82m2sRSyFgqix/caPydD3eD9+ifZAKwVXjIquT6AC0P/HOKcK5jNdGAiAwK935Gw7t
 NRu9mVtZexC55HGTLIqgUiLmE1kLLxEvM8Y6HUpdq+4NJXW6kg3gwTg6uXydE/HnFmNt
 Ga4i3/D4yQhj7usCTjQU1my0Be4N/AoG8tlLXWRcsH5Tt49XqHaVTl1mrqoDIKd8HfT8
 UP9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVflXNjSJqgAWnkRpTKu398bQ05R18P7j37JbgrNi5zcLS04HVdkg7zHSgbTn3gvMr5XMrmbbV8qRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdOaFhy5xEzhzdyu8AR3HarS8hvHaWxcgj6Xw4/WxIzjr955gW
 W24VKS0PAgFRL4h7RIDP/Xpz2KDPP3Q/kNO2yIvd6zBgODHOwY9LFACeFk0XR5FG11OtWqLSk6P
 Er20dPunqdscJ0LbxvVU2315zeLJnYez9H8q958L66qVIPAaA8ngmXctLntnS14D/6zzqKQ==
X-Gm-Gg: ASbGnctejTKa9j6tYO7Xjj+vt86Z3nGdD+8dBOlPC8IWEpwwbb9A742rhlexnZAwbWP
 66MNhkGD4f3ze1E716XC3lhotSoJkMRid93HZ5VOjJhz91S1G0GwDqeVPstUBNGiXDw4ADNx9K6
 CRnUU2Cles/Ph5KprOq+ztH8L7OvGy2tnnbhtRiCT9q9K+L6cLSCNvOqsR28Xdh59luLlkgsP6c
 e3GlQ/PJ+K+sr7W5g/hld0VpIH6yOIXORjK8SPYYvOR+1LsW+VIKAae3NYslAnm47hFEe4hcBzm
 rCujeUelabuhQmyTro0WYGLFc9x4nUWohM6hORMQAr0oLpC0I0vfRnhI0VdELr+tgtFzWSv5pHd
 L5Pdw1khaBX8GqyC9j6ehUdU=
X-Received: by 2002:a17:902:db0c:b0:234:bca7:2921 with SMTP id
 d9443c01a7336-23dee236124mr154227155ad.33.1752454231965; 
 Sun, 13 Jul 2025 17:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnypaVo17t4xCHlw6JEOmfm/XfLJ6d6mcw7BNhB61avFNU3lRTWBaNVX54usp3AIPAx45Lg==
X-Received: by 2002:a17:902:db0c:b0:234:bca7:2921 with SMTP id
 d9443c01a7336-23dee236124mr154226815ad.33.1752454231502; 
 Sun, 13 Jul 2025 17:50:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 17:50:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:20 -0700
Subject: [PATCH v6 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-8-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX1nQoAkfRRmN9
 zdswOIkiXlBNzmQ9kYXjdojK3bpEujkSM3I5/Y1LpXMSLHbfiqbZCpHnz1CihJSAAzXDQGGxvCy
 PKTLvi2VxH1luNjGFGUTK7mU4cNsoxQPYzGd31I3S/9N/W/mqYeHE9L95Cg4B6I5PWSCobyCT66
 NnRSx6qNH3tnn5r3E//2ZMLdMauD8s3DR/V1mxS07DH2sNU9m7vOfjY76pOR3Oebvv42iYr6Fl/
 xTWXY3Lafka+Bwxb4LS+Te9FrCkVU4hujzioqMDCLrj/quQ5aapIo6fBLmmgvpwnqtLqwp+pkoI
 m5jL0mWmy3q9JAkVKBWC9WxUN5yM3ftqJRHok75Wz3bJbpqKe2qoA17TR3zYW/ReQBfffB5IPfj
 0UaYNodFIuKAqrXZIn+vNxRbhQIidjOvlAgOTYkY5xen4TkKHPZSOruhVexBkNSy2kt5sxSp
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68745459 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EPvdQSmEPGA8UAjO9YBX4EZHEQXtmgeA
X-Proofpoint-GUID: EPvdQSmEPGA8UAjO9YBX4EZHEQXtmgeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002
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
 drivers/firmware/qcom/qcom_tzmem.c       | 62 ++++++++++++++++++++++++++------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 ++++++++
 2 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 4fe333fd2f07..f78404a8d9fe 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -108,7 +108,19 @@ static int qcom_tzmem_init(void)
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
@@ -116,17 +128,48 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
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
+		dev_err(qcom_tzmem_dev, "SHM Bridge failed: ret %d paddr 0x%llx, size%zu\n",
+			ret, paddr, size);
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
 
@@ -139,10 +182,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

