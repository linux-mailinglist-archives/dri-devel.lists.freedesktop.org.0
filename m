Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49436B2EC1A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993210E86F;
	Thu, 21 Aug 2025 03:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPtQrzy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE8510E86F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFCaRL007321
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=GPtQrzy8TIOYTIc9
 Vc74+YztRre+8yF1n0QVmxru+2H6j0GHXcc6EKQv8BDktJXRJ6saZkvOgGIsuB31
 tsp9fmJB2Rlsx8TlE0L23A3wUVkAnvCDUfHMcLYx8QNPymDV0PI/vGePJ8Y1tERE
 fiVSRRVbvZYxMKmgX5jK/CoqqZ0JEBOuUPetF1KDNkJWqUROrbghNoN10UsOHyzz
 VG6kVgX3skmArO55dEouE78l/SyVmCIR8PETcGnf4CikN8EGMqLLAq5gwRBIVts8
 /a5BTcuXQ3bQtFRq1HZwQ+D3n7qL1J6fgP8K/PF1yfIzXd1PISvhFGyN84Xomyyb
 S8i0LA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt89nqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47173ae6easo974677a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747453; x=1756352253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=O5NN/EHL7Y/EbV95E67Ky2MbRKj+w/Jabi8IM6m1/hP+KsB67cREqjFQ1lW7fzwHNl
 5BgmfayieVt9RdqF9FmL/xCH5tsm7lJSA/Gx/kWfz1tAJNLXsz7cqplsEdRtnxm9G2iH
 RbT5756pvoqZ854bnauPwEC1fB/PL2hF7aST1uxpHVZHOE21+9uROgon5pyWw3EFBMGo
 Hmsm/uqiJ8lId3kYL9MMTan0U32kmAs/XXPEHucc6AlZoB+nKzx3nI11VQQ4F003K6ji
 Okj9WIl0Zjyjtpt0FtAqGHIl5ucv8asL1bi1QoexFTnCpuvC9Qj3OBwODkD/nVXP6cRx
 mnTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWV7HdgJzFICrZmPAAthq69IeBEsetiYttX4SNcbdejhC5L7ty2CV4YK11DgRsj3QtbAT6rbvbDPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+qOWrzL1CGAdyyGALooOp4Sdfi2zgqYFcfGsk/cz9z6VDhX4V
 +6JRPw6uRCa8F0DxfOc82r4UfTpBzYYIVss3hAv5Bat/jTp5llRmVjeidGN0cD8nUi8nLTP1NUU
 wkQwI6jFFJ7UIB2LxWtqUmtxRhIq432UgPiIJc1LDLjNJn3+ZIb+3GPGwvveJn2Sgd+H9tfo=
X-Gm-Gg: ASbGncvIX8Rq0b6sD/IERlrgYOKOUiFJRaDLj9G2LQ/vJ8YvqHpdjQUJU/HKfhNxoD0
 pcf1j7YxCKRirC1CEmtXhEsQ5OGracnkE405XIQuGoMD0v88Mgt4OGr72zkI1YnPJx17gejfT/e
 YyfooO479CTzFAorWl5nX3NZKu6Po022C3ivJrxk1jxPIOiMFzS+5eHzWfEvVKH7k1zE2uXOqdV
 JRUeTHhnq0/EnLfDjcpa/7tLz8LSongpFv1wCLrjN1jCUfq7MbcypJDiXxhlwNZ6YMbWKJqOyM4
 whLH8+Z+OhRpdhEQLlhMP0GPMI7uzY4m0za7Bjm9LFf6Ykgx/c0oM48LSYzQE/C6DMaowoA=
X-Received: by 2002:a05:6a20:7343:b0:240:6dc:9164 with SMTP id
 adf61e73a8af0-2433089e19dmr1159845637.15.1755747453464; 
 Wed, 20 Aug 2025 20:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi4mGJZ5wAX9bpRLqAWGzqaPdfb8se3vOWiYgqadgqnAUMN/U4mRyTaYFAwyX37dTnizeIeA==
X-Received: by 2002:a05:6a20:7343:b0:240:6dc:9164 with SMTP id
 adf61e73a8af0-2433089e19dmr1159817637.15.1755747453048; 
 Wed, 20 Aug 2025 20:37:33 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:36:01 +0800
Subject: [PATCH v8 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-6-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747404; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=9nEXtJyTvuvPoQMKa9vJn8WmfjXRNxEFGH4TAyQUtRSsAGs8a/pirBy7epfxNHUOJ6F3AyD4s
 mxQRny+F73nB+a5BUu1ybLK0EPA9/GcvDWqt7ON6vzsbdDND+MNtPmS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX+oexJar5k+0p
 13s+6yX5+C4y5eE8SWp3QDyc509Zjru1A1kM4x+E62GSSyz7gdZgH9CPW31SAE7RvrraiGA2xLR
 ng0bFTqwdYBsIhhXSbXcuTf0AXAmSZ5627py2e3lDF3nrUEtuVCa/qsOjRgsps7zgFRCTVyG0jL
 h5VrypOQyUBT3yZxSwpOk7UHPeqlKbRH4fjvK3ZnTgaKFLA/jgnvlB6wLnybIfSop8OofF1nN98
 NVla07L6L+eDMTdUAeE6lsxaMNO8ewObEfFpjqL0WqQtia7Q71DntU3cAHCTea+QOh0Y/YgQzaQ
 Vw90xcO/yXaxearoC6X7V/5izxUhXPeJXZ580/+KhbI4YbjWX3bJ68P3WbYK8LQ1fPixeNWZhs1
 c5RoeeqLhwDpOQU0iJdsHD9GGEMxlA==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6947e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sAwXT4Wy9bQuJ_5fEpWesTi1Jce6YI1W
X-Proofpoint-ORIG-GUID: sAwXT4Wy9bQuJ_5fEpWesTi1Jce6YI1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134
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

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

