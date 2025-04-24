Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D479A9A7FF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 11:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8025B10E7B7;
	Thu, 24 Apr 2025 09:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaVLz3H9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336B210E7A8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAaN005875
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=; b=SaVLz3H9YNZvZQHP
 dxxMBesa2pjVqluPd4V2R8eEjYELRIYPftpyCOxCiBKa149pBlhdYemtu3AXr+7B
 C3YRJoMNaPYngcfXdxRwsxbfF5Az7io+LthliGnQdLfaGN6Nr/St2IYj4J+QA2yO
 wdEU3vBX5D8opv5Vsbir6clATT+3MdTj5I8WmRTxEayOSyhFhC38tmMf0bEjlrSY
 h4k6OtS+w26jNQWTa3HDilvu2iUSDtga7pupp4cn+eUQGGYr8KTjV3YfV5eGCZop
 nj3jrFgXqBM/J0HpfiNRWvGzMjyFbRuTU2mxDeDT+exVADx1vphMulwjXlZ/+xiB
 i7uapQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0507n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:31:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so77550685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487079; x=1746091879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=;
 b=HX9dwIF3ibc/oXChRnS7/aJD8HETpjG9Z1pGBVUnEOJIXDi3uDSi2ieyLsY0HoZglL
 yDH3a8JQdEs+OQIGeGyi4FmTGoPSThZUyTPD9ZZEzL/be0cG5kKXgtSS7LKXY2ho5JOW
 nLOUE+ctHRRd3clZK+4fXWwf8CpEz8uLjpbCtetxS73QAGN8rsCmX9NQp0jz9v5xewRN
 rs3TLORD90hzc7MF+qzEjMyFc6RXnKMCesptilQRKcikURpZ6oWOuk82C/bzL9AKH+t2
 Jz5na01PNVbpzmTjRf1zzN8euwg7OnhDFNGh3X899N1Qv+J+rg5tPuD8/N5nQdXnZ2pq
 kHdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjxTh/blqvjyNDvbJB8jzezlFPqS7yVixHZxq9cvhzx9bJ+bBlDQVj7rU5HssZgtTBl353ZCT2mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXJbW6VZZa05Qnt5jqtZYaKe/vy9R9d7NIFot3SxmfcMSJfpku
 2SAPIyPzInUkJeHcF2WakJ7hj19bZxWc+QNi1b1eUiaDaO7eX+2cyyKojWG7ik4KF1ze1iPZRmj
 WpOOABPmk6k5mSSpxNgbX4nRKNZxKvukype1ji3zWdZCHlq1RJPfp0dZ8oF4NnnA9r08=
X-Gm-Gg: ASbGncvclB4pWP8gfG+VgO0PsoyqVIe1OQVaPUx3Jh+l1S+b4fMPcog6+KDoJe7P2zi
 SdrR8y5VcwkhXJrSNWXWvfv5dPtt/4x/psxG1rMISBNjefEWqHuW8FuSYoiV9NY8FI01Wg1LnoB
 T5fZ40lLa6pODoCekqYtPCtMa/5NYGcACr8KojMMYtJTV086u7Y9da+kwrhAJcPbZD6P7Q5LJQx
 kyKLqiu/bsGkL8Et94N8dGPBQn4xlDsG1Ozdz7aX6tVbl2KntLSMm9hKd4RwzLo3CAF5NTOwBjJ
 5xLssn2HoxG3UV2jzdjnXfmeZ0GmXpJsW28NPg93dE10dSmUns3A8f2l7rMP2WvUzBYCUFhvlWZ
 oaZxtHO+GAkdD62xFRj/GfWt7
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id
 af79cd13be357-7c956e7db71mr265477185a.11.1745487079438; 
 Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8sHYulZcantfqMVMskWIoIphoholS9WfHpqT1Qyz8n0LX/T8AiyVMCBqc1zdHp5HweR7KQ==
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id
 af79cd13be357-7c956e7db71mr265474285a.11.1745487079073; 
 Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:33 +0300
Subject: [PATCH v3 29/33] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-29-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSw1nFfmM68OEYBTdCxJ48gqfCba+CQGJERe
 /OMrX4eE3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1QLQB/sFaBLqJ+zpLBU3UkfkDppxLIHVuMH7MRE1x9FVYciK570/QBvg+qkCHb5d8MQ5rBkvz9T
 NGEkbP/z75m75O30kd251apwYzRvSGC4lRmvstIkd7NXUueWRyoEtATP5cD4spbU2D8azGVV3sg
 YbRb1MwgW/n5tJ9gnbyl8BIYBFnzkQFnkTUmS7XnXUdWIkv7YD0tLbI8Nr2KzUl4jRLwl295K9Z
 FRd4UvPkKhmOozWy0m6ecvUa6RLApgHXBPmT+qLPcOx6/lHiNESr36Sd7tZM5/2jbB+e9EvQU3y
 S2Yvq8oTs4fl2WbD9d7gyPMXyr6Iv8sj01NBkAdHwIcPaKr4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX9yiENw0m8joc
 VmnXcmwy+GuMl3iA0EofLjuvA8CHmm7zSjIyL+CS8OJ+dDBz4stHmk5giT+2X17h+wDnkXT8KzB
 P1wEiz0+z1oT31JsfX/yL7TrbcY+tS3L8kcYl8WEOCrQolfX167/b7DwCmxP0Ag9REw9/5wysHN
 OsjLnkR4lblHEla5g79KnuqRTZi0p/Sl60ygxO0QyrnYSvcYOJbAjqdZJhpAEAXitrWFQ9eS30v
 cZCZHcxky89QoRQ66kDr03TLM7W3UTorKmBSX8+q+6KFqgQVKTq+jFH4ei+8qYCiorWTGqNSxyn
 JGQ9TyaNkFB5UBikfVek+IcFlIR1WuCPDLsap/MN2wF9LcX1tnh4uYYe7XZlFJS1X78EHB/wZ/n
 bPychFPcKzrpeD+oKzxuXyfqkb7jqRQTo7l4fE2H5M9myMoRx7TZ7sR5Xli46dnNev/1i9Ea
X-Proofpoint-GUID: lTn5c2frLq9zrvyDnAS4f9Eubx7pqR6z
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680a04e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lTn5c2frLq9zrvyDnAS4f9Eubx7pqR6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=992 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

