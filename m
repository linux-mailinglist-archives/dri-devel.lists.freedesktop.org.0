Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD2B82CE3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 05:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FFA10E633;
	Thu, 18 Sep 2025 03:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqnvnRXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C7310E632
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3dUxM010750
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=; b=VqnvnRXlP6KvEO+S
 vWs5UjO9/qWSjXicrJPqWCIaTDXvc0wkf0cTG3PrHUVU8XjAb+9GYh8BSHI0QXZp
 8Tc1387V3r+kexpJvziCkqxIC3TfUwSKEgmPBYdhzvWHhdJpbffRpsJfdrm+gdFO
 6aheDDAJK4WdKZisnjsnhMe3034vxDTeGj7f0khE/cZwV5v6hGene++vu4Ikp7U/
 fSmjgm5PuJVX5Yt/kmgA7oq8u3sa07abNGfPSUv7b6bY4fj/YuXqnzUdL+V7B2n/
 hf61GQ1UxdjTyi5WqbEdZvvU2bE4+bzYkG/kKapICujal32/Wte/xT9+7n6yLYlj
 ZFG2jw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxvsw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:51:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-78ea15d3583so8496846d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 20:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758167478; x=1758772278;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=;
 b=VcDxjbi8upa4SLyqSQiFFbZEcM4kpvIgvOTgM/eYAod/VXDVAOKhQnVsp9ICpBfFXJ
 4VdmsiM1XSHmWYX/WVx/vn2MLo8dAzp7syVWXpiA6IINVL5hw9j6iZuiFcLbGvTEQF9z
 eiLAcX1tU7g+zwywu+6AoV+EK0kuro8cYTA8p58ja0HWp11lIyJrVHeCZxwalZAVfb/l
 wnIaFzjkHo0mYSAhvN9ngL9DmdveLu9wkOTFN9S55Vz8BFZaKcMTpdaHGYqdeGwyHZbs
 9D7oHBqZhAfqCtWJ5TQZuBonywJuGWqJO+AJA+hF5GM1m6bBDzdPZQntUAeTvMkBQLII
 7UBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQM0UA+Avepr+krb5CfRlHeEY7i2bQoVEaLJyZ1kqzOnLAGHwn2x1kBrokkCOLbqrGiNsVagkqc1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRi8L5Pptvx4JIcxgOxOkthNykXbHSxEfixGPHZdQcHHkzZPOT
 GGvvEebiVsP/S4JUAGm91zI3+M3YIT1UOI+apTDNkbOKS8PlMWUQ6DjdfJjNjNGx443W0rJDkbl
 0IBc54wkIwc2vZeIouKczbXQp2NVAyXR8tgvuFRoUvGaOs43XEGLGkrD53l1hAmNKYoj9rhE=
X-Gm-Gg: ASbGncvMDEiV/kLkOuNEWijy3yq9i+1xXlAIe40tPnQmk/lQfINXAlci6lOH/YcNOhN
 Bg/vNjRNiNi2nr0C6JwLS8/0oExx/5t7DtKuLEzOWq4zMrkOpvQ94nvX0wnp201azkVk9kYyIgJ
 EFh78PAb5uliA4rotZw1wdC/FJNg7mn5drRBZy3BhRGWHXkVkqgzr4ht2llEdIjcFtNBYwoj26F
 f8qZwLvvIh7lv+mUKBnNawyMILttZyV53mdCTRkKUtx/Xhk1avIopfSclkFbunRC595/uEbVO3g
 RrKFtQB+3K1oa4AWjPv4rXBNTCGEG0JL607O/TciJ3Z6lJJHAMJ6v70mqKAfRpqKgM9xNoQ0d4l
 KRgJA9ik+sp/zeBHukWi2SFGqMFa1x7eKSZ0xVfUNtlWf7oiZ2kEj
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id
 6a1803df08f44-78ecef1ae02mr47255076d6.48.1758167478173; 
 Wed, 17 Sep 2025 20:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSx6ImXWka4qzu25nsGIPKG3jxYLOXD5VmYgqTlB6n69eBvtJTy4miHF7fghHQwXJ6uEWe3g==
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id
 6a1803df08f44-78ecef1ae02mr47254786d6.48.1758167477633; 
 Wed, 17 Sep 2025 20:51:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:22 +0300
Subject: [PATCH v5 1/5] drm/msm: correct separate_gpu_kms description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-1-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n1jsPxkiDoDjeGzSxaWrdwHm2EzDZrO/DhyX5ok9ZkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4Gth5pDDKZjVIenXb81Ygke05JopoBwjyJK1
 zEuck0IZpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1WQkB/4lg9tvQI4us/U5LqqNXJTGG36WkG5XJKtFnQcWFkKRzDRqk1ZNk4h9Mb3mPueYFIhsp8V
 BbzTyeamtCaqZ04D1qJMYL5eJwlgY4uL1spsdfLVR6Gi0qlqlEMDNidNoU4Dag9RWFOKia0N/Js
 Gr9EHf6lYOvHRjIiG1Hv8bT5u51c+GuTWMq9/QvZeSdizjJTeUSf87xvUG1VXyuLJALiOctg4RO
 okIthfyiGYNZm2Zl7TuRexJqoWjBn42AfFrtxnWDa4axY7m4DH+OLxrGjfVcNH6YSRarKwHvcKd
 ulw8+OVYkJs/GR3EXnuymyTQIpbFggCf3XuZO67duHMS3ilD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzwBMGp5BRSid
 kSnUovIeFed9H8nshWTC81FwJ+10A4LSngcs8khK68w96nTFtrhGeTWx0/8Y7PI6sOAr239MY96
 5j2O1+Wjt19QfgxRcCJ2LnOYqO5ZBTsO85OdzIE1qs1oNLQBOCLYFL5NVYbDcwWZgt5YvViD2nm
 XpEF549BMI6ViDCUUgy5/IT+jIO3F5su/RwiyCU0sq9gmmednrLKbHpqhCoI14cghyrDafHp7Ot
 jSrKhqS+3xT6ekkSG5TqcAxYrX6ZiANmf2CcsTm6/crJGIdLdqDyoO7HxJ1+pXQETtA6jAgc+cw
 maggTFyVjGEFRqBL2zMKeJp7bLIrToyUPwyAd2QGRBDglLg+SDq+Z9RC6HnkeZPJJ3DQcIuzp1Q
 tiKm2+1T
X-Proofpoint-ORIG-GUID: iVy63bD52FVIawvulnW1YCflhRi1Evre
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cb81b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NR_zzOBYvoclL3rq_QoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: iVy63bD52FVIawvulnW1YCflhRi1Evre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

While applying commit 217ed15bd399 ("drm/msm: enable separate binding of
GPU and display devices") the module param was renamed from
separate_gpu_drm to separate_gpu_kms. However param name inside
MODULE_PARAM_DESC wasn't updated to reflect the new name.

Update MODULE_PARAM_DESC to use current name for the module param.

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100792394dccf59097a01c2b2556608..06ab78e1a2c583352c08a62e6cf250bacde9b75b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disab
 module_param(modeset, bool, 0600);
 
 static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);

-- 
2.47.3

