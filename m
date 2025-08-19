Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F5B2B791
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 05:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418210E1FE;
	Tue, 19 Aug 2025 03:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGwL40L6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB2610E520
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:33:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ILfAtj024211
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ENUwjWediX0THdtA40OPB/
 h6B8YY9WYqTFCdS0y38fI=; b=CGwL40L62zj7GNu2jTStu3ytqsnU9cu1ylemt6
 1RclrS+d67M0thflp1mT9mhPu+OGqObxzyBpGSd849HSKjN16Sq/oBGE4BnSp/+J
 /9MnWUdzin2PIJw7WLhxOkre2ltKUHPfoe0g5qjzNhonJ+XaYBvJB0M2DryihfBk
 PfqqPTK825yQSf3lfYPPMg7+c2a/l/0UeABPaRcdsuGvjiCPiX2OcDhjPq05iDr6
 ot78nOdW3AfTfxtMzCpxZ1Kb1ZJAs5G9yr7w6p4Xueq0IME7LvxcqWdCLQ0LAhrn
 h0bgW0co5ktpl6uHxmHJeGrUhnfMbuyrdmzhIQNiWVix8RtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5gq7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:33:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24458264c5aso49855355ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574435; x=1756179235;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ENUwjWediX0THdtA40OPB/h6B8YY9WYqTFCdS0y38fI=;
 b=vAvBhhMJ/mz5TRQRw0UiKCcvO/3KV4Ls8vIvz8728LJ/EjvPz6WZgXzRianjy2Y7hD
 qQ4aPVSu/rzJLWPa4yASkOCSjErDZpi3z8KNwHXh2bf3eCGhV+9ZaF5lIbfC51Lqzcxu
 zuWixIyTdNsMo00S0ueCd1jsmIeOVr2im55FvvTnTcmKiyRXz+Q1/0s6HyBL82puZt+r
 HfjyrnD97l5EiNl4TjTwqhMQ3JhPlnsPn0utrbDZGm86dIe0XwNOAXDLhIrwmoTL3yLC
 Lhtx2fUtoVwx3Def+qOGtUgGYPKPuY8Sw9PQzyS+HX+Zc7nVeo4982NKMznC8uX2I7pb
 +wLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8uiKFvRoNHtnoY1K4TgtMJ84S6NJWM9bwlHaqo4/rcIQwIRkUEiaLfqvw8R8ZEOhEYrDYrHZkhto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4feJzAqznvQFehWtGPxwnT+SP18Wcw1k0Eo1JBI6QJpbRZlvv
 DBxSleuMUE+D6lAjBWbmvY2QStyRaE99gyN5u9JsrDWsXetpPPHFWYFfXAVZzMAiuoOdmWCV/Vu
 gySlp4m/87e08tbq4gSMm/wuQ1LmnmZ4Zat2ajXnUpPL7HdGUpSnAy/16CmFHzpCA7/qi3Tw=
X-Gm-Gg: ASbGncvaInELBYq6KOA9cxFCo6U5+fY3BJQjikbBrykZ2A5ObJSFANoKxGrgDdkSulh
 GWaeVSFasJ1m1sRG/1yUnSsGs2yQWOAGuFgAQ+lRPAz7kFA/SCF4gJ10t+V6szBAvm5jr6KVIta
 kXwlGeFfuERALmDKnr0G9rptp8kShryGonhg+kRepuFgDoIyIrmPXLRUjIZYRjf5zBSjgbUSzHw
 VpIxeCtuVNJQm+CpJe5uDoE3V22CeFRY5DcHuqXMRAjk5tKY303ZFLTRFcnOIRW0wYiXq/NU0Hb
 01HWiMq93J6v1vtEmOOvgmEA4ULE2zi1123jBOpjxPYk1SykXfGCNkYcRjeqVxYMES9UE+U=
X-Received: by 2002:a17:903:2446:b0:234:986c:66bf with SMTP id
 d9443c01a7336-245e02ba933mr13364435ad.11.1755574434950; 
 Mon, 18 Aug 2025 20:33:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHss6c8onEoG6c911yMQzA2sYFqZ4ZMtHctzk2SNONn9jf/tAsbViaKRwP7SeFk8XYsBbF6zQ==
X-Received: by 2002:a17:903:2446:b0:234:986c:66bf with SMTP id
 d9443c01a7336-245e02ba933mr13363975ad.11.1755574434385; 
 Mon, 18 Aug 2025 20:33:54 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:33:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Display enablement changes for Qualcomm QCS8300
 platform
Date: Tue, 19 Aug 2025 11:33:27 +0800
Message-Id: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3wo2gC/2WO3WrDMAxGXyX4eg6yncRpGKPvMUrwj5IZZqeJk
 tJS+u5z2rGb6UJwPtD5dGeES0BiXXFnC14ChSll0G8Fc18mjciDz8wkyBpa0fLZUasA+uiJuFG
 NGsCDNWBZPjkvOITrU/d5evGC85at6ytkEYnM09oV77/SmvtzH2ntbUg+pJH4peHAUYva5qlV2
 xwnonLezLebYizz+tjr/st0fk1LLetSVEqpBrjgud/1tymNcdqOO4Tk/hTWEPJdGtauAFkhHLC
 qKuulhcYgHrwY1IDaKqGcNtIPwlp2ejx+AFalP806AQAA
X-Change-ID: 20250818-qcs8300_mdss-a363f0d0ba0b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574426; l=4914;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=dVyBNXGz5ma3x0LUn2EkFXAjKM3emel65zhTYxIPsTY=;
 b=f2dkyFEWMQNkJJzFoYA+d3EhrNPohe3TcMjFLx7zGY61oOt2zLUilCNWQGrSUdIahBi/CC7yg
 zGx6q8Ie9XZAkryvRVWLqr7rnfdHLMAqpGITYishRnsUe+CC2Vnp61L
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a3f0a6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iD6vXzWbp0dc2yQZ6nwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZtdJAWOFyPQJY31WlmAxJdL9Wz3TFOsE
X-Proofpoint-GUID: ZtdJAWOFyPQJY31WlmAxJdL9Wz3TFOsE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX/AUI1qc8ZRu9
 UMSJPLWTWNuJULoEu4NNGdVwJn7KOZ280QpBo8rw31fIL1fuPrb/lhT9t0tDt0ICEuEXkXyRQgZ
 su8FawVV0upMvO/7oWziZY3iDpfd4Z5eHHF56JononFDK+wcWNSpcLn+udZe7a3Gj+eo07BRNs4
 Ly/xmwWY381h4vL7o/xCY9/2z6hETLGL7p9QgIsGkheufjgUFFvQ3diqf+lWQGuvGrGT55GX622
 T/NPbQCkxwYCRIs7AO5vvwbCUkl8sRFxCweg+F2n/mMTwI3mhiq50WFrX8lUcXXbSPi6RA5kN7r
 gTCyoqtAUPKJNtumBSIxNgs8m8Syf5MjDZ7lr/ggyVpv+v/7gyGBHKVxKHvuBwQAV7q11+AElp9
 kRoyatUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
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

This series introduces support to enable the Mobile Display Subsystem (MDSS)
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v7: Fixed review comments from Dmitry.
- Rebase to next-20250818 and 4 pixel stream series V6.
- Add more description for the dp-controller dt-bingding change.[Dmitry]
- Reorder the MDSS change and UBWC change.[Dmitry]
- Switch to the OSS email.
- Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com

Changes in v6: Fixed review comments from Konrad, Dmitry.
- Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
- Optimize the description in MDSS dt-binding.[Dmitry]
- Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
- Add the DP controller driver change.
- Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com

Changes in v5:Fixed review comments from Krzysztof, Dmitry.
- Rebase to next-20250717.
- Change DP compatible to qcs8300-dp due to add 4 streams support.
- Add QCS8300 UBWC config change due to rebase.
- Add 4 streams clk and phy in the mdss yaml.
- Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com

Changes in v4:Fixed review comments from Krzysztof, Dmitry.
- Use the common style for the dt-bindings commits.[Dmitry]
- Update the commits msg for the mdss binding patch, explain why they
  reuse different platform drivers.[Krzysztof]
- Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com

Changes in v3:Fixed review comments from Krzysztof, Dmitry.
- Fix the missing space issue in commit message.[Krzysztof]
- Separate the patch for the phy from this series.[Dmitry]
- Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
- Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com

Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
- Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
- Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
- Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
- Correct formatting errors and remove unnecessary status in MDSS
  bindings.[Krzysztof]
- Add the the necessary information in MDSS changes commit msg.[Dmitry]
- Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
  20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
- Package the DisplayPort controller and eDP PHY bindings document to
  this patch series.
- Collecting MDSS changes reviewd-by Dmitry.
- Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
- Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
---
This series depend on 4 pixel streams dt-binding series:
https://lore.kernel.org/all/20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com/

and separate eDP PHY binding:
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/

---
Yongxing Mou (6):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      soc: qcom: ubwc: Add QCS8300 UBWC cfg
      drm/msm: mdss: Add QCS8300 support
      drm/msm/dp: Add DisplayPort controller for QCS8300

 .../bindings/display/msm/dp-controller.yaml        |   5 +-
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 282 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 6 files changed, 299 insertions(+), 6 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
prerequisite-message-id: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
prerequisite-patch-id: 9cabb6be69b17e8580a2cffc7aa2709106cc1adf
prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
prerequisite-patch-id: 4f02ab9314f95984ab7dc9b852ba4d6c676746a7
prerequisite-patch-id: 62d643df7c88d8db2279def1e4b63a605e9145c0
prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

