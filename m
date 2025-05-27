Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00FAC48BE
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4F810E40A;
	Tue, 27 May 2025 06:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWHmPsAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7710E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R409tc026623
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o8VjfmWoJoDXBpYwZyd2P0w0BU5tyeVntRTG/sihbWg=; b=VWHmPsASvegByRyw
 WczWGexUVZdgO11kVlRtNY3jNcZlPNDXPu2E4w2nrwXOuhJofYYCofy4N3N3/Zxn
 c4AF26N76SAmzvNrSzLwMGIG8H3Upcu0LrA//O/bOHJ/FYtKblcA9hq0czTOmLey
 7ZAwupKbEEY6OSFqJDyF8A6zdjbckwiWdtfSjCQS1WzhoTHBgS3rpsVB6048CWxA
 zL/2hYhQlxSBnX2nz0rQhAkvQzvjnas9u/LzVkPb8tFAzN39wkyG8R7iYHTP6eGQ
 NDD9+Lf53PtxB1XfsRhQzPV9wKmaEuQAjK6UdaD5VB0LMkB39JK0bG76zr4bFLv2
 lf8z8A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejwx9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 06:57:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-742c7227d7dso2073409b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748329047; x=1748933847;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8VjfmWoJoDXBpYwZyd2P0w0BU5tyeVntRTG/sihbWg=;
 b=NoYt7afY21H9obZ0+aMrjVJB4mogp5eYpZ4c0Q8M69dP5RT3omMGo/z+OCwIR4aCwp
 CCosMDAWoQ1vdqzZWF7nBQqOW3k7mlXWqflZieUVbZwJkDRElRSOCVbDPc3mAqyJe1D5
 IAQzLQahiRyX+pxD6lpmsn0rO4LbKex2hqdEnGs8pgwjkdHN6PfvFM8a2hyKBlD7Ksx3
 T0KeZluOIGju8kk2W0KWyL42MoQaEuHyWF1WOxfXZ3e1y2G0OgXLOB0fZlfsVw644OfW
 R3LrDXY/rEwN3yw08QHRcPW2DvpGnWFHzbx0u9VYXH07ztLG4KYpI59vQ+RRSYITz1S4
 L8DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRbWgwcDM6R46LdPilEeFmIMDRj7sd4Jk8/fhQWrXSC4odcsOz73zziB5VrJHwqybugZz1RNvTHTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy+lB27mQB9R1Rg5EeMc85NYeK/LgnP1fD9JsfrJ55T7d+sotK
 htLCzwAlt3WGWH70PSSqD/s4NSX08/QYyPldAeEVqK60d4bUe1Jrx+FBmXo4RVhDgmX8CDs+52o
 aBc1Y1p8dKcSOkehqFoe6BcT76RZGwzqhcxnHz0ez+p56Lp4jFPkuKijaQoVcNglU9ebgvQ==
X-Gm-Gg: ASbGncsCt/shQipBvOK5qIf0EEQH6wD2CSIl/deGm8PHqreTSbKQ9x9VZD8V1WmAAkm
 Ml+UcRRbsC5IAOWNur3V7n+koLHMwRO2yVUVWEwzoNvKVWi/ToJ4zJrgNUm6ynLz041izcDV6wA
 i041j4X/Gooj9U8sC96uszqZTrPfF0UNYqG3Zz5mB0lDkb1Pw/x9xtYvvNg8TPqSaYLwh1ArCgC
 Fr7SmQL10+XhBmmmIFl5wfvyFFL+bFE7zn2G2/eDiq1bxdjZBy48XYBE5RQdQR2s341su18skbv
 rPJJu50BNI1i/E5XT24yboAMOq4a4IqzDzJn8sj/rwDnxGknCr+GKpC4uI3vGgU5pheqkT0=
X-Received: by 2002:a05:6a00:801:b0:730:9946:5973 with SMTP id
 d2e1a72fcca58-745fde6003bmr16336343b3a.5.1748329046825; 
 Mon, 26 May 2025 23:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu3CU3ay8afRL2sXBe8+ebw8AHA7te8dS/i0NED7172wSL2eRoWnyesqmcAWty/3PYQAF30Q==
X-Received: by 2002:a05:6a00:801:b0:730:9946:5973 with SMTP id
 d2e1a72fcca58-745fde6003bmr16336323b3a.5.1748329046422; 
 Mon, 26 May 2025 23:57:26 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 23:57:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:52 -0700
Subject: [PATCH v5 07/12] firmware: qcom: scm: remove unused arguments to
 the shm_brige
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-7-024e3221b0b9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68356258 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8l5R13_vdCuNYgSjUVEZF8oxkRWX3lrY
X-Proofpoint-GUID: 8l5R13_vdCuNYgSjUVEZF8oxkRWX3lrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1MyBTYWx0ZWRfX6zFaf8byh92o
 JqVOivw8xAP9xUye+KP3Pxh5FmT464FuZmNaeJlYl4DEm2vSefbaTLivmJsbzpIwvQ0qyXd7IDf
 ThoZyxwRrvwV70C0/PvWVGDuM7QDWO9fjlQXnIKBj9y5A9cSfXAxKiuiSvNmhNwXNjCM0M2n7HM
 Fa+KOk7ZatVA0bo7/mPHWvNknXDtFJ6PCVuHH2wtS7KAa0YcQC9lYN6nKea19VQRB9p/2Y4SMeo
 0iHjwdWKgY7bNmlrKahJqNnHJn+izVIvT7f4RpsNXLkJ+GFnIE4yKgjYOBFSxIb+WWxZRc/mZ4R
 ceq6PjrCUZ/CMb8vqilbZmC0EMayMmXjbTgTBEwsarRMUN3qXkRC+RhpF4ytyC+T1G6SiQ76UCt
 dt5gaqksV1Um0Aj3VCmZmfWUtlHCGJOQB9m3VhhyQ4CdRaqyuwmpGGgb0cdpnQHMnYnDJmtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270053
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

