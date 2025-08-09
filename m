Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E8B1F36C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 10:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACBB10E13C;
	Sat,  9 Aug 2025 08:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK8mAb7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567E10E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 08:36:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793VOQS012840
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 08:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Vbhk6QCT3EVReeZaEWJCjX
 Dtjty/QxM/QqF3JsKZ/bQ=; b=aK8mAb7wHR5CDudbNk+2qoh4ORGcuSpp7chNfB
 6++T8nTbtFwp61xD+vH4dam9eveMkdL/wdrfiu4W5YiQHRFYEpKGs4UoM+yLMSvL
 EC+Hpbiz43YJ+AqR4FJPLA5uRTECXQZsAjwPJbF0SikwJ3jXa31WqoOsZ5UztfeM
 T70FEGLOcgEOgWfh7eRTDHv/tuyq2NHiKScvNzd85nOGWNIi47eFHzUORm3qtysE
 JFyEgxqX+wXktzaKCD10gWUrzhu3CdS5MldCCYNjdak24e4JzU3/V+m/7g9vUx01
 l07HrL5srnGtmENYNAPKTJD1Vc5QHcPcboGk8jKHA17Od8qA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwngrdsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 08:36:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b0884559cdso40057411cf.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 01:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754728617; x=1755333417;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vbhk6QCT3EVReeZaEWJCjXDtjty/QxM/QqF3JsKZ/bQ=;
 b=wsIl0w/X+94l00CJ5dl1moCge8XVE6J4lPR4Oyq0M/aSsZMBHnJoul5IRtTvDXXYvV
 BZnGr53vdfqrhDXO7RbmpXjP2fJM4/D15IInBxWaqWmbra9l7iqpO/A1YvG/aLHGwi6+
 D5EuoF/NQRGse30LdmwN0fyVV5GP896ged0F8t7D8+/XyPYrIV52wQ1xRQVO2MrI4Z/+
 RZiluFUHxTlI9GQ7xv98gzp+6N9RurbSVdMgJ9JXVKg7OpoHJYRebKAzAgB+CrPe2Cqu
 RbJ3Q7YKm2bk5je/6myNIEm0fZvnQi85EYlnjg66yn4aBBPGkHopusleswkqmrV1f/Dx
 gCWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8YUN5Qngq3lrwsyUgFtcbGogEP8hd+mm2L2+fMY/jrWSeHgKmIYNpXcURzXv10yZYTtXHCoyMDEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbShBvaTyP63BFZNc+3ldgdDeIjS3Cz7t5R0f6Opn/TamaTzvm
 8UPBbh4FePzNE4J++8v0ouJZsq04KdNVmYhujVd3gbvXhjUrkbHibd5LjUJeDXn9TkVrf9Mzfri
 WlgYtJu9rVRZpl1vhv7bgLyRzPbsv1UgfxbmDQmbHlrb7OJMSPTu0+vRhoP8YgP877IVMnHM=
X-Gm-Gg: ASbGncsb9EDdkCSZ8xlhGAridBnST5nMo1RY/mkJ6yZsmM83ZQ/a6f+LZztb4rSFTQp
 2CLBATxFPEsOplqqob7s7LoSLwdRQ53xRxYfEwktQEEQgo/44oRGOTGEo2yC9TPewt6qJuLdpJ6
 RbUPWVHmPjYepW9MoKlaGQJdLVUbnCuLPc+ccndkn82his2QzRaTDfFGmgkaPCBJ+Xf3PnPSxVJ
 dC4heuAmdryJ2azjo7aHXnqYpWf/WdaCdCUjGjjYKBQdUd66jcIr/m1aUZLbssZjjOCOykp5bqE
 YlKxh15Tsk580hOcqzceaAVAGKYFvwE3xBcpSzo+cPjRNJ9PKObV/KSF3nIHjPa8+jM7jQJfNu7
 yKcUowjTDDbNw86osgpWaA2eJz7QGstzsBz/13NgQyhajE7bFuzBv
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id
 d75a77b69052e-4b0aed0bff1mr90397791cf.9.1754728616701; 
 Sat, 09 Aug 2025 01:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH37kRnw8/1Yvy8Ct0TseBki1Zc9SOjiU5tdXrLe87OhkeI9dMLexzVEv+ZZeRaP96/LWT6Gw==
X-Received: by 2002:a05:622a:2446:b0:4b0:7ecf:beda with SMTP id
 d75a77b69052e-4b0aed0bff1mr90397511cf.9.1754728616224; 
 Sat, 09 Aug 2025 01:36:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88db2214sm3239974e87.177.2025.08.09.01.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 01:36:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 11:36:54 +0300
Subject: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKUIl2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwNL3dziXAtLczPdvHzdnNISXZMkU0MDg6TktCRjUyWgpoKi1LTMCrC
 B0bG1tQBoHPxKYAAAAA==
X-Change-ID: 20250809-msm8976-no-lut-4b5100bcfb35
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
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KmUlDlykqRmfS/c3OkAxh7AJ+0CRPOU7eFP0ludcvrM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z0jmVKKiy51Y/+3+p5PqP0fs3XmjAmj0vMF8rL7+qbz
 9pwz+dNJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwt7I/lc0OcDbbM3ekOis
 iwVbqiwWv17z0pxlS2uU0aXM3CsaynEnRPmeb52nF5CvlMBhGOc+92HM1YO1LOrxojddP8zyZRP
 5zHk2sFz3352j1zasC+o/syEq5We3aOYH9cKSCU+5LnV0ae26m/r1Gp/4Djul+zKnijef6Xt56U
 BCzOwJJuueexW0nir2Csl1MQuQFDc93Nt8nmch890Sh4OmlWwWQi1Mu9cw/jBfKjb7y7H57yfPU
 sqwC7/WWmZYwnjp8IHpC+c92KXH2Tox8bggZ5zCYpZnis0HXAqSLhYf+8J2KyHWfnnvXYu/b1s6
 ZO/0Gr+xMvVSfXdl4dTAhx+mz1JO/wa0sWVamsGVsr2yAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zc6fMNPc1XSk-ANN0WWMUSgk9dLwXdi6
X-Authority-Analysis: v=2.4 cv=RunFLDmK c=1 sm=1 tr=0 ts=689708a9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-Y5st2MN6ViVPFRs--AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: zc6fMNPc1XSk-ANN0WWMUSgk9dLwXdi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxOCBTYWx0ZWRfX5HZ9vacJOcuK
 J0the6ALqftcd22MhQIpnRmMpKLEODoMqafEcvhX4Omo5ePXiw2tJxbX0qBVpd86tgUTMEAI1tU
 Dk1dpwSFWTg6jdvXC0N1m7xIrtOg0qPUCur3VJnOeDmUbfsEUN/cLA6axiVn0L6SMDMtUaqbZD1
 Mu/p3Vd80ofxyphnTztMgJfuJWkHSHuFGx/5hJnrJnovH6l0oXvfTC4QvHpEvK4VZDwpdnvu99u
 qGSMXHHQVfNx2hajySTFYxk/VD9m4NtTDqxqjRExcoxvzz25TUySQb8z/FNpWTTXdobzCgn2zcP
 ARqHL4WuT2iN7WTmqMVcsRgMfbQCA0aHp8pgn8sCH6Yl00llGQB4vxW/q0FjLWw3K6kEiNPePDg
 YLqQxHH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090018
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

None of MDP5 platforms have a LUT clock on the display-controller, it
was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
MSM8956 platforms. Technically it's an ABI break, but no other platforms
are affected.

Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -60,7 +60,6 @@ properties:
           - const: bus
           - const: core
           - const: vsync
-          - const: lut
           - const: tbu
           - const: tbu_rt
         # MSM8996 has additional iommu clock

---
base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
change-id: 20250809-msm8976-no-lut-4b5100bcfb35

Best regards,
-- 
With best wishes
Dmitry

