Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2198EA73
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5510E7BB;
	Thu,  3 Oct 2024 07:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="chqIecEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEF210E0C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 02:58:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4932nkCa020343
 for <dri-devel@lists.freedesktop.org>; Thu, 3 Oct 2024 02:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lbSF7jHlkaR5xovzGmMq56CCaUsco0zxxJXKbsOr+IA=; b=chqIecEmoTfYtV0m
 QD2D7AQld6dNmElt92FjUtUicC4xVeyuLxdSvc5Qa0o04ya0z6IHj72I1D6BnDta
 uPeO8Mvr8v/kTAsbHxnsJvKuL2K82XtKfJStXa2ubMracmbqDvNQybxdE2mYv+0o
 2Tb5SdWcy4Oy3nBu56FFcbjy00qlWl7uDDZZcBTt++6QAxW5LmBIHeb/yHYfU87j
 9eltgaVKlZ3MjbUdkYmb9VIby3jEyP8bWXI7yI4idPd1IVaR4u4OrDc/WuDB9bnq
 gOHjPykszITyMWvjI4+lx6QPHrJzegQniPDNqbsOZb+3JZsuxfuo0R+sJ+c9+PPM
 l1DsdQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x8t6wbd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 02:58:46 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-287433009bcso397846fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 19:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727924325; x=1728529125;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbSF7jHlkaR5xovzGmMq56CCaUsco0zxxJXKbsOr+IA=;
 b=a+1Lg+tJsDfH/bJqsM8qj5p66IwPEe7geMdJT0ocAii44GUcE1TEw+ONRlLhCK6d2d
 t6u1/i3tBEmE1eed3VQwW+VGnsjq/7aMHEWntQ4HiW43twdBRfljsa8ccNg/lFUaFbZQ
 Oou1GEQTMgognEdIi0ccgXxcxRfgqe8/SHc3pEGzE0/LAZSzGHiphEH8CRHkN0f8fnsY
 n+ouONNrnjqDiOabpoChPxzwRrr/dD4mmOwnbWyw/onRJHiF3wFmFqrbXoMe62b7J1yr
 WPSdXysVbOxH2MOCECiWxr5QrPk4UYpKp+vMQ58d++N9tUwrkUuXA64WyE7t/aHWZMnz
 BZrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn9+7sngOVdxyCPQTXkXkDIjiK3LB0Kri0UcTxO33hdcsve/nXx5NAkppAiGoBtdIlv0im4gZqrrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPUzy+DhWtDl9+EnKEl54I92X1ZIf46mcwGq2FjnSxcQCiojQU
 SG0yfjUdtwQAUtXxXrmpUpJshU8svMaIJHLc+P/VeR4V8FOKeRfQPnx6YwMDgE+zDfZ3YAzT5r4
 9pml3R/FhCaHXZvbk+t2EoG/zEqlC0Ya22k2h3zjvjBKkbu3viPTGu8o68w6Lo4VAK4jklaNZ++
 bKpeI/oSrGk1SY3wY=
X-Received: by 2002:a05:687c:2c5b:b0:277:e457:6057 with SMTP id
 586e51a60fabf-28788f4bf55mr3371455fac.44.1727924325205; 
 Wed, 02 Oct 2024 19:58:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEslbkkscbIupCM6YFAHuYU1JfX4Afm5uZdwnidaEUekyOLhEtI1qq/CLEky2lu9R/N3g9GLw==
X-Received: by 2002:a05:687c:2c5b:b0:277:e457:6057 with SMTP id
 586e51a60fabf-28788f4bf55mr3371438fac.44.1727924324832; 
 Wed, 02 Oct 2024 19:58:44 -0700 (PDT)
Received: from [192.168.86.60]
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-287ab9b5ba5sm188924fac.21.2024.10.02.19.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 19:58:42 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 02 Oct 2024 20:01:33 -0700
Subject: [PATCH RFT 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=RbbsTxcQGy55FkTg6CEEGqhEsl4ZzuLrgtjdk4G2IrI=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBm/gkcRg/Y5KGivcfdeSGJkvp8pEtdIW6yxbLxG
 8GyBcQb6reJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZv4JHBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcU03xAAqZOMzqIPiya3Ppbf4OVcDQbOrlD+YmTj9ARqMJl
 fYzVwMmwWNYPOAL7IzqyLt8+Ax+FTDtwopgfXtmY87dN/6NsEpuC7sG1XVkRdtxbvrvsWqWEPCr
 nokcf7lY5sVDWtQxdcMhl8TOUIe6at+MnDcbj9uSZ3qK9JiSWXYFzn5syFwz7QiABmjbNmkuZgN
 PNRzH+OLh/yeHP5AkDyDJqbVvTNAipzqXk6yAOV8yIY1WYPmH9MzEuXoJh3p05b4qbTADTJ3zWO
 G1ONmA2aHwvyRkP6YmkaAPCTFH/Uh1oEqEw7/4ftfOfisQazJBKDkWNEQ/Q3s6q+smhuVfLk+gd
 Cdy/38noYbMPzaf16k2OQ6i7mzYtCpFXEhtrjRjohB5XQyr0DzcSGMU4mygHExtHlAviGZb9dyV
 4ybtfVIs+WVWveOTj4jFtGHrwp5rVJucX+kJcTJjb+kHeAVgsIHXbx4AcXibmaOiwo1gAtV6h+Z
 2LZoM56C4i+TduAvtGXMiL9pH0xb7fA/EiudQa71FHLgEtxsGMZhL2Wz9mau/hUk2aA4c44UwAR
 DiFA7c5r3qzTUm8N15/BjRKy6bKkippQs+yNh19CRolZP7MBnRAHSGPl0uOLaRmdgtKJaBB7nJT
 uMqxT+jhPd/UfBEjL0Q3Z1Xudz9zz4pq/I3kQ5CLwXb0=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: yzNp2OxrHXHaZ7ClfHv_BG9P5vC6ro8M
X-Proofpoint-ORIG-GUID: yzNp2OxrHXHaZ7ClfHv_BG9P5vC6ro8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030018
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

Support for per-process page tables requires the SMMU aparture to be
setup such that the GPU can make updates with the SMMU. On some targets
this is done statically in firmware, on others it's expected to be
requested in runtime by the driver, through a SCM call.

One place where configuration is expected to be done dynamically is the
QCS6490 rb3gen2.

The downstream driver does this unconditioanlly on any A6xx and newer,
so follow suite and make the call.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 465a4cd14a43..5b06f7a04fe6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -572,8 +572,18 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 
 int adreno_hw_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	int ret;
+
 	VERB("%s", gpu->name);
 
+	if (adreno_gpu->info->family >= ADRENO_6XX_GEN1) {
+		/* We currently always use context bank 0, so hard code this */
+		ret = qcom_scm_set_gpu_smmu_aperture(0);
+		if (ret)
+			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+	}
+
 	for (int i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 

-- 
2.45.2

