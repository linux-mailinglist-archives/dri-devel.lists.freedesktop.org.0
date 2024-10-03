Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541C098EA71
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E073010E7B9;
	Thu,  3 Oct 2024 07:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgUhfv4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7429D10E0C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 02:58:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4932nMkU005182
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Oct 2024 02:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uB3ZxPTHnAWMaOklWPn7Q1NGeCixNFs2bRfPkU5N7Mc=; b=LgUhfv4LVewn+8bo
 dx8BfyMbjC81Otuq7Q8YxyCl7xKISjwzBH5oEBxc5oY7opOWy70qUIqaZdWY19g0
 y9ttpAWqzKa6BrHXTQAOuNBHJ+69Fmfjvq3jyxu3o0UDwhNnPqzrTt/iz4Kk/EAg
 49rbUuFCoCPeuPiHmyAAI52uR4ZNIE9UR0v8Ko69F9R56zWATMOEHVRUThKX8Kib
 mASfJUYdYFzk7+Rimj1bm24jF0ofeMpE8jpKijCMPZRp2IwXtzPXgOSMHtnwr+sj
 iNxMscIjXOnORIT41K3XsP0KBg9q/KQfEQzaKygrBC1082niU5G6vXChgQKejGEJ
 d8hR+w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xaymn60u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 02:58:42 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-5e1d2056d62so380670eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 19:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727924322; x=1728529122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uB3ZxPTHnAWMaOklWPn7Q1NGeCixNFs2bRfPkU5N7Mc=;
 b=Te3GL2gQeW4b5LvXXNr34sG7KiagmcRrbQjKS7i0gClr3nZ3ImkrWy8yG3CI9So/PC
 uELc4dyzE1abYNgJ1HlBjJEOqzeCXi2Bwe8qZtVNtQTMvaS6wb/266kgIJmxvNkn4sv+
 D77XlEID0uBmZWAWoAGcyC2+U2SKX2QQei2pHHbw3111KG7NMhTEUfpkfPxgw6Fowf9k
 SYuYvFywvynMjKh6eMv9oU8h2oc2/U+K5PsXLxuqvysZwcx5s3oiXPQwj6j6EsWy0/e6
 pSOgaieUgNkfT12duCI+wuChuwTrt6qnqkyS4Cxk7XtLjdCarPullmtfBIdFgVYi/rmY
 eZYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzwMzAUuNMS0QTihbLOtvRoIV/BFeO2AHscfepvq0UgxOb35qeR/4FnkodWezeYf5BaPE3LTKL4vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwICocRluJnFyDit6iLzdTEdyzUESBCuxh0wHAdIeA4/AVY1vw1
 mRqrPd9376J0/GGw20KZTLzLuSiuL/msNIW8qR08jqqJQA0g7+Q8V1xmwRSZNm38N+KAHhuZ8WJ
 n5vJnhvpAiORadCz3HjdFL+DjbotY42GtX4W8Q8w0W32fh99NDR0OSznjUBk33ZfeDe0OndO9bc
 wK05M37iQs0Kiw2dw=
X-Received: by 2002:a05:6871:8a6:b0:254:affe:5a05 with SMTP id
 586e51a60fabf-28788c46d29mr3849536fac.21.1727924321823; 
 Wed, 02 Oct 2024 19:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoRavS3UfpeB3yFBG10czruBQKvndSIjPg0YTRGNfVBE8+yBK/nh/+1v+zCglyQ9P7PQ7tmQ==
X-Received: by 2002:a05:6871:8a6:b0:254:affe:5a05 with SMTP id
 586e51a60fabf-28788c46d29mr3849531fac.21.1727924321543; 
 Wed, 02 Oct 2024 19:58:41 -0700 (PDT)
Received: from [192.168.86.60]
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-287ab9b5ba5sm188924fac.21.2024.10.02.19.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 19:58:39 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 02 Oct 2024 20:01:32 -0700
Subject: [PATCH RFT 1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-adreno-smmu-aparture-v1-1-e9a63c9ccef5@oss.qualcomm.com>
References: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
In-Reply-To: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=ECeOnqwkL9oJWvy2IoxkgjFotjTcF/KXI8WgJ2j6Ppk=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBm/gkcWIcpdn2/xdWuhuQYvPCj6vFgI+ERHLL5B
 uxSWZReAIaJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZv4JHBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUMmA//eVBu9B7Ev3OMWmjXNH9MrFelo5hICM0seNCG3VO
 +xJ2dGbDsRl0spsDLFrzU1Zc685JBF2nRUf49/4zzfxNRmatKgP6dl1sLrI7eop/q401e5JyXlI
 ia82MIwlc9RIXwXJ5qRIK7rWHcSo2jx6LebTAnz6DZibrfxKO4w/F8OI6t7N5Mml0gCncndzk3/
 D5C4PHwDkPA82gmRS0RxaC/KU8snVqQVN2PeJ9o6LmqA6jGrYJtAQeqY8c1gBVHitOakiWcSctr
 X4MmOK0eZ/i1XmuSuX3L8c871yghyY6wIW8pxHKzcwOYC49YeKcSSNwZ4KOmMkYBbgBxInZc8Va
 WOBSsObLppy1VnZnWjSaVCOI2E10xJRzwfw/D1lmcHcMWiEsCJ/S0O+HB0Aj6/ZAnfNxZ9GLE/n
 3b5cKMjF5aedpllWqJIPXL4CC6EdZP9iU+Ap9sR62bmmC0FsL62n0W/eslwZetwPWere3fsUSwm
 jf9eVvc013pwtmg4mnkos3G3GNd6EwhjImSmCbFRaMpLH36WFtbszc2LvCnMQ+NTuIusthd8JTn
 wUwgZ/tLBEQxZ8S47AHE4GdJmTBh7N+A7lSuBhSeeVaJbHyWkgaOGIexogqcthZLWqvtKGlf02S
 IR2aCKp0+2A9BHC7dLood5uZVGjvCyQRUwlpn2IuX+V4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: EGE3yI5Oj0xk2AdkDlpQZK8W1OV9fO3T
X-Proofpoint-GUID: EGE3yI5Oj0xk2AdkDlpQZK8W1OV9fO3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030019
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

The QCOM_SCM_SVC_MP service provides QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
which is used to trigger the mapping of register banks into the SMMU
context for per-processes page tables to function (in case this isn't
statically setup by firmware).

This is necessary on e.g. QCS6490 Rb3Gen2, in order to avoid "CP | AHB
bus error"-errors from the GPU.

Introduce a function to allow the msm driver to invoke this call.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 19 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 3 files changed, 21 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..bd633c57b6e8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -903,6 +903,25 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
+#define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+
+int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | FIELD_PREP(QCOM_SCM_CP_APERTURE_CONTEXT_MASK, context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 685b8f59e7a6..e36b2f67607f 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -116,6 +116,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE	0x05
 #define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
+#define QCOM_SCM_MP_CP_SMMU_APERTURE_ID		0x1b
 #define QCOM_SCM_MP_SHM_BRIDGE_ENABLE		0x1c
 #define QCOM_SCM_MP_SHM_BRIDGE_DELETE		0x1d
 #define QCOM_SCM_MP_SHM_BRIDGE_CREATE		0x1e
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9f14976399ab..23ec8ee5e49f 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -85,6 +85,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
+int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
 int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size);

-- 
2.45.2

