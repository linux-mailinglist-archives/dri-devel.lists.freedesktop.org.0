Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC28B53034
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6475E10EAA4;
	Thu, 11 Sep 2025 11:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="etRA6v05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68EF10E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:41 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB6Z7r015051
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sPoNsm7+PfZj4+jNLDfDUvmKCs26wErm+BDKGeJyvf4=; b=etRA6v05WeY0gSV1
 AAGw3riumuoDZwva/V+yCG332jRGagJmA4AgeLpwLY563RooGGZ1XuNz8HUmeJeI
 0UoVxqnGG69PnFQgn7yXxrzpO44azNFFeMW3uMAED5FvVX0hi/mV5yy6o3cNkpcN
 w4pnvyC4eEYc4FQnw0QxHaCNVMOXIVnPlujc455XJL2o912sWcBBAHmJGOVvs42J
 nNa6J7t0cf6JYtYwyDURzqfuOz6xhKvrdCUeLh6qeb1kaJxGrDBZI6fBpVesv27Y
 PSHe0daUdZ8584T3TA+P1PEQVtpbPCtjmZk9k4OihnU7usNSXzUhVH69bJ/rLI7B
 IyZTgQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m78wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24ced7cfa07so7710565ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589880; x=1758194680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPoNsm7+PfZj4+jNLDfDUvmKCs26wErm+BDKGeJyvf4=;
 b=UQKPIcxj338q+8AQeOpjfexHF/J6msILkCN9JeAQBrvoo6p27RZ0gi21PyznjHNaYQ
 cJE/8Kvkdpd7svs4mf6WEF7ZOSsiOpG3ztYIDDkGjfFYovLsyUaQIhe5lOPcbqo8dzqs
 FRT3XfVzF1unV0gT44OYHDMT1P26MSZs2zKdyFLebbCbu98o74uYnZzUgt5pEec6iYq1
 x0TwkC4hr50uJ7zvD+RRqVsGUq1tfu7twVHXIWi+vy1VXhslLLHKKxISWfyh3wROqc16
 Duco1hfnYqzxgFwytbo48ATfjHBmKPPS1gQYgp0+Mfh1xuSIe7u+6tnPbHcMe5tjbAbc
 TjSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWchqCgAp5UOJM1oxNCeDpIAKZXJNeslSbbC1sQAZjzQ3MtLn/ZeshJMKhPRr7TJVQmWmxaLTYLZSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdvPReDri+tKvPNDktXtQMTijs+ez0l4q+CeBDWgyiJ0DIHfMn
 vtsFbyb2r34RR0D7b6Indh7LtXRe51urKzG/ozb7sKZNwgG9+ggxWv+LFYakSAhgUcRyrciywKK
 Acw0DMl2E0aaUJsv9ihd0PUNE+LKR5PWfT6o9EpfqEdw+hNZPnVJE9TKZluvta/ovz/KK8lc=
X-Gm-Gg: ASbGncs/Ih6BbNJ2SyQqnyrMmAHT5dN4t6bg5RyI5kmdZKhEfP5hCbKWuuiFKR2QSKm
 G4ngCzDJDiiuf0mwyG5sblb+G4Oo8uAMF517etqG9Q6D3D7yYPgOhSZ34lLH2P3tLpC64sj3IPt
 uwXDjgbelp320anWb6jPR+kauh+f6ayEOVnvsnLBfMQI+pkEN4P549gvEHLBhNnTNjPQbCqsudZ
 slg/ldGuxg0sTLfrg8SqX7QiEkdwajG/OjgM9Wef7db1vpRhVz3cIT5YgANkOEKVwr4cgH6SLMx
 pt3cDvqicZpo8LF4XtcJMuTFkP2zuddp/BlkPwU9DacLKI2/3IqXusqqJqZRx+PLTXTuQE8cTnn
 DTxlBmckOfW/2gSMm3UEQlK9BRcTYIMCj
X-Received: by 2002:a17:902:ec8f:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-251737d3ae0mr251493805ad.49.1757589880216; 
 Thu, 11 Sep 2025 04:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVej9XvECHnfJ2giLr8gHJUx8kOwiI628UxF466o3mzUJFirfad/bnLhSvmHcgicqE/EARkQ==
X-Received: by 2002:a17:902:ec8f:b0:240:9dd8:219b with SMTP id
 d9443c01a7336-251737d3ae0mr251493285ad.49.1757589879637; 
 Thu, 11 Sep 2025 04:24:39 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:04 +0800
Subject: [PATCH v12 4/5] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-4-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1133;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=FEUevD/Bir/UEqCMgp3K3Th3lwTSdx1DDp6SRzW1JOU=;
 b=lwy7m2h+u6LYki4ZBIiHe1vbQcfyvBfzCTgg7t+cwNsq18RqfOCaBQmsaMuuol5n/cguidvXZ
 XJ/cgV2mfRAAaS/OKzigEqVCv9kz/eEdFiKFaNFufM/k6rR1v1W/tSL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX0K8DJaPUhD3T
 yNgFJ111iQYqKZ3xXSxYVf50ZzZe9XelwYbkNFp5O5Je+xTnJ/iiOB+ynYgK7vGU74M5n2t17DH
 +drj+TduS8TZazWRTZ46D0C2HPFyueY1jBLL/V+WHzqbcdmopc2mnFO4DdLB2jdBpeB3PZzg8RB
 INInCqsbHqEKhYg+viBHv9MpzL5SwibHf2QIuGMczZZOBi0UKbWwZtAfKGbQGIMxdm4y1O9v2cX
 5hWVQ5PIIq5MK43tWJImywiNStVlbroJNT7gAXJSuy339a9721nvJcE0En7A2HpGexp8zlC06mb
 hA17aOBNU/DeFN6JKabOOiDaUPwwZrr848+82Epaoy59KuZxKgksjD4OFbfM9M+EzKYumX2X9IK
 gvdhp7lG
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c2b179 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: r8P-FH3ml1WMmkvCIvR1UWexmYMm1ssL
X-Proofpoint-ORIG-GUID: r8P-FH3ml1WMmkvCIvR1UWexmYMm1ssL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

The QCS8300 supports UBWC 4.0 and 4 channels LP5 memory interface. Use
the SC8280XP data structure for QCS8300 according to the specification.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1490a7f63767..b70627d40dc4 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -236,6 +236,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290", .data = &qcm2290_data, },
 	{ .compatible = "qcom,qcm6490", .data = &sc7280_data, },
+	{ .compatible = "qcom,qcs8300", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8155p", .data = &sm8150_data, },
 	{ .compatible = "qcom,sa8540p", .data = &sc8280xp_data, },
 	{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },

-- 
2.43.0

