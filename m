Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3DB334A8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 05:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068C310E2C2;
	Mon, 25 Aug 2025 03:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVJCpEGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E385B10E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMt3WG004082
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=KVJCpEGymbGybPM9
 Rkz9IMMik636mbIVWADF4ygtfKUH6nNdiZa4JvUqfBDOVkx9uqExDoyHAxFCRsHG
 ENuOH+2FYorhI9svghNSW/aV1MgRyhCdfKzsE4tXdNv535s31/u7/PcNy9RiTGl0
 bRI15QM/JGXBLP5KGv9cZcSbv+/uOdsfYIB6irFqeHYxtvey6ja8KNVau2cXY5tT
 3RuOMATqXWOAaZazPCsu0U+FDtKS+odvd0SJCyLtMc/sllQARZS/1KSaZtCWhLUX
 fcZLRO8QY66cGG5YrrGJ/V3QKRwjoVNPL7BsHVMYx2nmvRHVIB61Gp3tLJoTZisL
 SX3X1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpkm0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2468b307df7so12601045ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 20:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092970; x=1756697770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
 b=HLZ31NVuACUxK5qNbCLgOYq5masR+4YRtyrlxLbpJdTCyFh3feKqkTDB5JO0HhHsWC
 K3HpSwnls58UiNpnBNazIdmXgks2T8G+K6edHJPBW5bQT/BBywiQXmuNenz++xL9+cBd
 3z7dW+F2EE0zTynmFP2+bpmzimhDkv54p5vGhQKkbK4MbjgVrWthX25aAdtwXia2h79O
 4pb0iPadCLYqK2w+tsQUpbkYJqFmX+AgNfK9GzqZWSuUEZJ79FFx9j2jeXlWQKTVAJDO
 24uNKASUYDi4e7bfRi998vwjw1S85rsDILTUioQSeaMcx4yWr0b9yxxuzbaMOjYwvjZd
 SJ+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ1c13zubzpJZnmNLUvDogc1wuB1sYGJLEcnNxeGXDBgSFdSg5/xsAiwY0NFP8WnO+GT9K+BbACes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNwSY2E7C4DZvZTXfSYUq05/bCWv0JLcfEMwNJgGfdCo9ksYmM
 iro7TdxKK0Y2yri9SX7cEUz2Hfqtn4GsdAjgjAsi8BWE/U2Irr7hX7MJHV1hiLYoSJn4vKWqZxK
 cpfYyu/1UqgHp68E79u/MawkFQ91FbaCrd69gLfPaaD54mUqLmmDIv6yRS3D0/bwwJPJINbs=
X-Gm-Gg: ASbGncuyBYmlh43eFsdLy9cDEVp26W28dxHOTfUo2QUBoKNGgYIk3ahr7RERlJxIpAG
 nFYLqHDbk39fQCT7DUef7e/f9WpuY1pqluPobnLuMsiM6cpoKANUHDCPhmZVcEcapgcgELf/JdM
 CffQDebCGjQTN04DSMQB3Kuva3ockCFRKufxqCxIDXrS4cRkZ90mqWW7YFCgpK18wuiKioMser3
 laOAP5QwWmmr6ZreaCpPGvILcSFwZUaarZNUdjAaTTae8YdvGgLMCP7aZ095etn61vdzsHrHND+
 NI10nv7On2TRzi2Aa/pIjLA7gGVXTTJGrsuljKFK5i4E61x61KFR423EbNMxGlWe1IXOJCI=
X-Received: by 2002:a17:902:ce90:b0:246:5214:e166 with SMTP id
 d9443c01a7336-2465214e452mr98782865ad.60.1756092970423; 
 Sun, 24 Aug 2025 20:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzTqSR67U+tpNmDgf/how6hjhQZdfWFRotg9qOkMwQOBCL1NTrcmhM6hc2DsV3b0TbsOsshA==
X-Received: by 2002:a17:902:ce90:b0:246:5214:e166 with SMTP id
 d9443c01a7336-2465214e452mr98782415ad.60.1756092969812; 
 Sun, 24 Aug 2025 20:36:09 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:36:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:24 +0800
Subject: [PATCH v9 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-5-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=1044;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
 b=FDyvGFXblAvBxHfRLhBNE2iuwsCHg20XL9cYb6uaNzOfq+jOhcjID6Tdrjb1NsPhIGdVdhyxf
 M4kmoCsJlbOCNbuFyrTSCeFqfFRefX4qhhz0HoHJUoA3h8CbL447X5M
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68abda2b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: R7ULOXBiVzoBoyEP-i3irqj-_ZTj0Hk8
X-Proofpoint-ORIG-GUID: R7ULOXBiVzoBoyEP-i3irqj-_ZTj0Hk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6nexRTpyM2bH
 OJf8ZeZyKX2BK+MeQm09JOgJ5IqzQOc2iPa2e+iVtMXu5KLLz7bffx0OHWeax8PonxbRhkwYaHL
 DZlpVpYKSBxEVdbZUXIJTG4AtE/MnjcFmuKHMlmjOr3Zq0lV05a0PtUqw0/idnFbeKuvbufVD/2
 U+BQhR0eFhZr8WrD6QvGcVhcsGrcFAnZMS/WOWUZmxIzuYpRSA5CK+78fjgoyKWhCUf6sczXsMa
 jN65NZGPGdnf4qLmJQn+MCAo4hypZ0mBhRLVTqy92+kXiqRvtqDubp6Qj/D1rT2l1fItuPXZ7k1
 VSWHc9OSFlZyuQzPFQefa1X7GV1yX06KfFTTkAXv/363CzdMhdA3zDL6xcqXBIVVycwS0qvKY57
 EShYLwyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

