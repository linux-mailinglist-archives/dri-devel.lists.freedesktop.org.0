Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0FFB033D6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 02:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143A710E1BB;
	Mon, 14 Jul 2025 00:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNJdeMb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA5B10E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DJRk91007564
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LtCsRmh8jzrf56uQEtvaGnF/ZyolBNlXVAA72gSdinI=; b=HNJdeMb9smyVNK3d
 hqdELrLLMjefMpu5GvCEEyP5jEGz1Ad/YoSo2c+pF0CJz38Ln3Ed1rbWEXY5BrL0
 vFey9++CqUZoSXnM9SHVtvRfqp5PjjhaDIaM0HctjIZc0LQLNrDeuUjkbJ3i9Fb2
 U8HKdHQ4aCiJHWkZdOQcLv7CEFTDThX51y4PyknoMHrQV58M4pk68ErOLQtxpxno
 Q6s2ODXPMHWxxkBIgDBuCm842HflStjf5LYNTH/Ym1fRsCwH1JahJGjCIEGjrTpY
 hucKwDwk9suN2iG7tDZUDu9/6MPDFouL4mZMRxTwL27L5ChtNkrM5bU9hifoIVau
 ezrdEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmtsrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 00:50:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-235196dfc50so36901715ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 17:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752454230; x=1753059030;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtCsRmh8jzrf56uQEtvaGnF/ZyolBNlXVAA72gSdinI=;
 b=hbQCKqBwbeMqI8Nr3QeR7tS3uSKncZNswa1Y/i4YFaqWeJ33UD0kWgBLqEdkn5GjZy
 19dJs0a7ij+tJxM+s36oDEz92Bp8/0VeFKS2vbqELOeOgI8pF++aF0VZdHbvWuWTt1VF
 rZY82CAqFH8SRXISnkJQQgbmZ/wYnrZ852Ir/hDn/VlfTqs1hx7xWaTa33GqmvidHaL2
 hRwysg3iCGt31s0xOVMew83YJjD7OAtp6oxqpo7M+aAj5R2x+oNMru7lDJLsnm0BEmIs
 6MTP5K2mtOics0p0ycwahPMZGxEJs9QKEZ79uItxoXkJi/EuXAjWjR0HQwtjqIHBOyrl
 AnGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkcPFppzIYeGYTU7CCWiLRWLKjXyjxyiqpgsFYAQdEUgdOtPwKqT4OIOm6mBOq0WHdgz0S7MS51+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG0CFkTr1uKFGWDjRLlqEV773BHzQqiGREogdWB0CkEbzPU9Eb
 jE/W6XeS3gXKiT2ue0SE0Dbkpd2fsvBdER0YeIsAarDVpukp6v5JvZjs/LvGPUJpJSq1oR159XD
 /oqtkJw8z38rjZj3bGt5VhLHIV8hMf52ByISyyE+JxJPxJDQieVaov46Ue69Vdkc6x4i1HQ==
X-Gm-Gg: ASbGncvATpVrm3y89fxwvamwm97lGBSKoJTsOTueH7UMNWWr6ZaqJ1up/dbrL6pkaoz
 4OZDcgrrM6+YaJPE7jUcX2c1P3wH/1lghET5TFi2Hy0UD9/EuZAe0SANk4YTEMBnOoSZKAqAZEt
 +VccIEpK2UjzQxBpVqdY8oQfivMrNkS31HMEFZCEcZzBofh9kyVxFcO+nhN5IA3SASzGTQShenz
 TuV5cRQbCXB6ayWd6v0yfc3r1JLypRFh9MUyU/uAV+yjffQYIJN0S9Oifn7XIZ6wlpCoUAr8GTg
 qhLF+GqrC5agkZifvC3h8TaHjQhIpAQ0Nh1aRjEZPDWchZE+PiRYmCvPHW/bvugDSQjl44MWsxp
 FA+LJtcRiidc3IhdqDKDLTWA=
X-Received: by 2002:a17:902:e841:b0:237:e753:1808 with SMTP id
 d9443c01a7336-23de2feb28cmr210286195ad.20.1752454230194; 
 Sun, 13 Jul 2025 17:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwgOuMB01t9d/8iPExWoQH54161e+s537wrXhm1aY46pxdDIukSkyHhGxM1PtdRNmE8e9+NQ==
X-Received: by 2002:a17:902:e841:b0:237:e753:1808 with SMTP id
 d9443c01a7336-23de2feb28cmr210285805ad.20.1752454229772; 
 Sun, 13 Jul 2025 17:50:29 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 17:50:28 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:19 -0700
Subject: [PATCH v6 07/12] firmware: qcom: scm: remove unused arguments to
 the shm_brige
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-7-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-GUID: MNpJY30Mq5uOoXYCVW42o_3FoPDnoljX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX7WVjNlBH6vzc
 aKRDtYZpMjHzwHen08zLbvSLchd5zgq8Pr+TgQatbr9z5NcTzhva3fAn3/iLrIl3RW/3hm20EaF
 V4KPEGgn22rScfVyFBNaQnARNQ3coKnnQeH3HlShfoCCuRNsfh+vmV/IFcr4ck0FZaX1ca/Zk/c
 kTh7dHoTvIJVRMSau1TIkRS2ARgx+DyqQwXD1ZKhjQjXJUothmhmwdL0MQYoRA1t2LrZA+CrNGe
 DgIhXe9maxovYP378tkeZpCM8GrcrxReg/mc6wWfKmKRg/pXwLmAAPXwrRNTzDM05NrwAJXMDaT
 tBWhdKCxlhAWb4z1h6lPuk0g8yd1AXP76wmtGLPPzN3Ggu0OkjjjC8WRUbcYP3gDojwGuUMeqWF
 bP6vsDNzYDgFjpiiBaWVb4U69QlmsEWrU8mFWWLENiQt9TJ4p3zMtG00ywKf9ZFhNz1zYFbL
X-Proofpoint-ORIG-GUID: MNpJY30Mq5uOoXYCVW42o_3FoPDnoljX
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=68745457 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
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

shm_bridge create/delete functions always use the scm device.
There is no need to pass it as an argument.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 4 ++--
 drivers/firmware/qcom/qcom_tzmem.c     | 8 ++++----
 include/linux/firmware/qcom/qcom_scm.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e3207a9d2de6..72223d7dc33d 100644
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
index 94196ad87105..4fe333fd2f07 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -124,9 +124,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
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
 
@@ -142,7 +142,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return;
 
-	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	qcom_scm_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index b3a7cc20e617..796de61c7e9e 100644
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

