Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE45CB1F392
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8BF10E2BA;
	Sat,  9 Aug 2025 09:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G990jUwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E81F10E2BA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Z3fQ012611
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=; b=G990jUwYOiDDudtd
 r4gVI6oxixWCOPueRj9wNaanyiif96w1GQVDBJBcxUpWflyftokVllhR/fSpSL9U
 L2NT3QeuDkBUCqCXOq5UhDBreKVb9tmRWEIrdHi1ko+tQg2Vs6/3+bkp3cG8oTD4
 lPRdJD32jVh9bJkosxFgH68ypEfUoC3czpa6d8AXExYLhXxCNAU19PvL0lPq9IwM
 8i7Hjtjds/vd1Rtn1sfabhHK70OqF0jPkOblcanEnqPoJkO3YmmF0YlsduzYoxmO
 yKdhqe8p1MbeXEH47d/ZHR/rw4rPqhBjBr5ONsFIshlrCRX6/5rqqE+KgCoulA7i
 mWyDUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj40cr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b092c12825so80061351cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730995; x=1755335795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0noH+yy2UERIjrtWf5Izm7M0t2Ukl6cXD864r/H8zL0=;
 b=rZJkG+VaeWJSSN/P0NsiaIVcCrPOVR4pQmjT7xiol4P1rTtvy245j3uQvNHDn2oyJ7
 UuwSjfj4fKAhiNUYL6JGOVkYWhqM6b4zNd/i+MGdQGRotnfBYh+tY8TAksq2YDEI6onE
 bdJXFuIdkciH2G6XfRvyFFTzlakZl2yNZ35OAaqOCvl3hqbt+VfoZ8dDz4qV1MJDe+wD
 MZgJ2nVLt5ULwm5vJlVGIxivEc3ZaE+duSskDu61I9gaKJXTVMYdhWHAaJxdXLEf/5zC
 opkE7V1b0zjKU5JTBTPjuMy27MJukjB2ZFvY2vLpJKEgA3wlpKI4Lw4xlnezHTWHHU8/
 7z4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLJ2/aVTB+3ZWbDA5igtnft6NsKP7wD/+FBr/nEjzk/MaBeozdoUAmqYKp0QDm6dL/cLN6jIETC6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLoZb5PBr1txCTW0XAPQoDI5eyRBWaaljDpPWjd8mXFHzUwduD
 Ei/WgjBghqntQ3Q4e68npPK8SR/7KpD0yc10yMftV+58NBApAjjzLfWKKdL+hrx9g1gi7qPDO2r
 EvrFRiG1jRGXOGGKkoU0YpDag+XuzNmLUJAWMnJTZoLuv/YnyR5obVxTSUo3LtnmvlWNk0FI=
X-Gm-Gg: ASbGnctth4evu9yTzJctyBVL6eDNqV7L/h9jndUaQitSqci11k4GgTe9xcHRNuphImt
 k/2IOCtClk3Q3IRR2OdemJcNT5Pi65I2eNBCzSBFSUObI9TPm8NQBDSzzc9ukHDMxtu75mUvQ2H
 hiZFF95Eo6e8nxNx9L+Ri56+Y7LdistzyKrqx9zNTH56KPLy246f6YcXWiQ67MnhQ+LFqOXsRHL
 bVfIK/4J2zfaJhRP2B6k91GW/IJBaE9R0ZOzNhB3lHKWGtnDW7sc8ZEFPJ55NK5mii51hqDsbjF
 uxwCtuKLnOznrnN9O+QtZsYcXH78IBRjZhQDVqfrZkIke4ZtvhdiZpD9d5PfhsdUg88ZoY8zr/Q
 1dgbcMTwaCTEgueC1K6Y0lr3ellgpx0Kue5OXi96Q961bhLdce/9U
X-Received: by 2002:a05:622a:20c:b0:4ab:ab85:e54e with SMTP id
 d75a77b69052e-4b0af4deb29mr64422351cf.8.1754730994464; 
 Sat, 09 Aug 2025 02:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTuAHWg77g8yKCNLQrHsumlaHWKglPw97e39HIagDR9lBOoXatyWgxOgrJqJcA5Il5SmF1ug==
X-Received: by 2002:a05:622a:20c:b0:4ab:ab85:e54e with SMTP id
 d75a77b69052e-4b0af4deb29mr64422021cf.8.1754730993965; 
 Sat, 09 Aug 2025 02:16:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:18 +0300
Subject: [PATCH v5 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-4-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rRhj4oU1JzHT8f9jk9qa6uf5IjtK4GGvxWKFr60GaGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHiEFvgBRJsk5KkiJQFXppAIto/VIfQ5SOXt
 VqN5ZRglSiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1XK2CACzD+zQ/EjzbEYN+rBU1Lom3FBDCKw4M1WqHgNidxsjZ0bOO/tSxCS7Dbk7eTDE0GWCKyl
 ExL0VmK7YCMitPwaEU48kku+VqeBbb3EvuxyWT4Zq+IVEgQvAHqyL3QXc8kyTEeSFt2jldWTOKw
 tQ9C2zXxJAreFrios+humWBuV1bmlq/apeHsAczJHXLIkwGH/MRB4puqxGEmPraqDbtixbn8DRh
 8phpf0+fJ38MV9PQkC/qqGXY1w1mMPF/+3M1uN+gk4MY5F5PSUknf297kvbBiBUoRTWt2bSn0f8
 DsfvC7AuvwSYlDGT8yFg4HCPowud/5eSx/7xG9UKuULxOWPQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX53cGnRAO7633
 ltvEzvADZaI8xJ69EXjXD/u1nRwpF+1J94ZN6xCJxOpwGzywgdQC4nbDwUEDmp0TogfFWtFG1hL
 qj0D2Yg/DPOj66w2h+AlLmITAT+mamBEKadPaSKHaC4T1gSWnrMc740PCBF0arOiJTCjR8+SBfE
 jgLkVgi9/94nIZjHx4gPXaBHu1G8InvHFGsDyx+NcQN0O5fjS0HiUagV9UoDFfezK1z2iIZgphJ
 9nb1brx62JS/wquUWiOYE8h/4/vh9JMauP/7FCFTIWI1fhg13fUBF5Jhe8jPlx3rCKYzSjECBdi
 DrxzZrGwgAZiKFwmUgJRhaEyXktNGZVo/yjrujrd/3aFtQy7g794J2xS45IPcwT7l61ebkCx2Bp
 779Ls+R2
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689711f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cpcn9uM0tG0Z7HxwxXYVKFvVyJHmpBbL
X-Proofpoint-GUID: cpcn9uM0tG0Z7HxwxXYVKFvVyJHmpBbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 55e37ec74591af0a1329598f6059475926fdd64e..352824c245224d7b5e096770684795625fc9f146 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.39.5

