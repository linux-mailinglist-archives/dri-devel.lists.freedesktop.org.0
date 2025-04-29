Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF740AA026D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF63810E2C5;
	Tue, 29 Apr 2025 06:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEX7SZIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164B10E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq4fH024687
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=; b=JEX7SZIHI969GEMr
 JsOaxoBPsOlCLrnFs9nGvRYTDD/3Ov7nOylb7CX3dcX84YCpEBgCyWFf6eTtpLyy
 D5dkvH++tyM3lRlqaCAo6qgsoaB/XoSH6PR/P0bOuDOTQgCz/YvZIOTSXIdjbCye
 KytCGXY89XS/icWX1DvXuNEeBW/0PtE5z/uV19NCbECqllaELKWkGkTcAIBx9ena
 c8+98nusZlRV9SnEV+Na/fQ83EkjAxrwYSDVHrSDS2C/I7doaH+2OvBABtnLsi5E
 bYagRXcYW40cgeOW3nprEM27gk1JykKr8XU5xhzVnbui+gyu7sRpb3HaDet/LBop
 gOmTyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqkm31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-736c7df9b6cso7636893b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745906825; x=1746511625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=;
 b=RF0seStnNHOM5Qh0jAdUSLdC/tZeDOH8GyBKtzzVMDXQidzS2t/iiG1paW5EzwDQ7X
 M+ySI3XNxZ2QSva3mTfqb/yjfi4QFpmO7Owcw6OGYB5WQTH6SQjgXXIR4j+1nXRxsSiK
 qfDOCs71MZsNJplDamvdQim14dLu93BuzJC+5xCagKRTkfNvtLFAwNxKrc6Ohxxrrg6P
 JBl0f9CeE7Nb0w9zv+8xsHRNGRoqMEv2Gqbxv4zJi/Bs+nAUTAFDyjL2tVMXwyqihy4r
 08VOB55nfrIQNt6C0nb8y00eJyEutJJQyZuAOYUfY1ZMWxSSbBhKgim2JDtz4pnl2N3+
 wPYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWuLxx9MLJSfqdyPgG6D/5aPvsxBQd4+jBubToz8/8JlLlu9PCkAYdW46cf9Ak56+L+XChTNSyozI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx68Nbsb9YT35TRdLrdGn5SIrafyoUYBwvjpseBhVo/70A3zgx9
 qxQoR8u83BPLw0YBSfPwMoo+sIQdkJ12bUXPVMCcPrO92BTIFS0xizG/5TB7XMH0lXa3XDtclDD
 THL3IuRqX/agRzEMqG6lGQ4DRhj+cmTlUlpCyS7X7AvMYVY6g9NL13J20hbP2pTEz2g==
X-Gm-Gg: ASbGncstUz5Od0M64rMnTmiTCu4mnsJpAonBQoEtOucXBetdfT9q+bn0ZeCFG93gGk2
 tzoV4TpaYxorN9cDoohY4QUrDl4Efqhms/Q8biJDtSxl7B6vr3vedxVlO9NVmtXUlhq9G5NbXTI
 CWmYZlT6KsTKNj4l5zU16YGlXAFZFxYO8ZoqC0QfQil7UeLyiPCJGb+OLTZZcHYgt/byJPpdY4C
 IW3ddNNXuQVBgIZUouAH/bmRSCWBsFxHPijhFupyQtxDavnY8+4A5RT2NUbVVg4K4kGy9Ji2FzK
 UND3+SEva6hTKrG+EdRS/akTF+B52GFrfREB8o0jQTQQT2V7/v3vA/RgnPYjUXayMrFL+hU=
X-Received: by 2002:a05:6a20:6f02:b0:1f5:9175:2596 with SMTP id
 adf61e73a8af0-2046a4660f7mr17453252637.13.1745906824830; 
 Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGglvLAHgrOV7iGI0hyH1ZbjgDlYIBAPRGE9nqhg3e33A4GqQ2E/mk1KOyhJNYbdwEI3f1mQ==
X-Received: by 2002:a05:6a20:6f02:b0:1f5:9175:2596 with SMTP id
 adf61e73a8af0-2046a4660f7mr17453225637.13.1745906824454; 
 Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:07:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:27 -0700
Subject: [PATCH v4 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX+5LDZM06RBRl
 J0MmucxxiGIv4WXivmNnAsZTcP3W14IWlTR0Egw9LWameAVqAKLpKAmWL0QE3KD/CWNNltvtPWt
 ZP2z9Kte7NMgl1GAhc/KX6RVAo61xDzged9SDbCf/CWiHyb0g3S7BBPyrdy63fFBUxGPUIfbbZ1
 lRYJovydVByQO+qZYM5zYBvCClTdC8YncEpcuj3f30I34NaryuPGsHVRnxmnPZcdHTd7Slpc2ci
 NJe3su2jUwniXD3AoBXGUWDYQ0RhdxESok/qALRa/03yA9iZo1UbZ5qGWn9RYKOmaTOL1bo8Cky
 yhUrwVzWaNiCYSx+XjJEdjoH/Ae89nu9Y7HJr7c1rLTihPF9n4m5uLUYv+z+v473sWHd04CVBs1
 npJhcmBR6ccrkEa9ShVPSxUO5DRoJz3nKXr5rzypXY1LU6Ym53NVzWfaM32YT63FFVmGfx7Y
X-Proofpoint-GUID: xJPkO4V5CAGYAT1d3iHglc7sHvmRe5jB
X-Proofpoint-ORIG-GUID: xJPkO4V5CAGYAT1d3iHglc7sHvmRe5jB
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68106c8a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044
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

