Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA6B0D2B6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C0C10E5FB;
	Tue, 22 Jul 2025 07:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="icgi/h3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7B10E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7CMcv015640
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X7rTNTg/49ZHhf8B4W0jhkieUw+2aiMDE3XH+NwjhvM=; b=icgi/h3C+GjuGd1J
 WvE5bc0YhbTS3weKVinY83yE2zIwuULFNxarVzRuWMS67JuShghgGELWPRNUHqj1
 yBwgyvMiL/onk5YAAHQZ5InCCmZOtQ5jrqK4YT0xUdRQLS9jmWs1kbfSGizXNNlX
 b3OQzNfHFfLcG+MdRuCQ+EVQQh4LXumlX7jwj6YeaqFKP+1RV+F6GzC5ej4FbvM/
 eInGX8gJWEXS/4sYUhIUzPgQf1F1AZRy+OenETcTzhkAQmsQOTl7ODaVQqtq/gt/
 AjpQTOgJZ84wClAgsrLVeckFwR9KdM2znRFEFigg8+8ldq6O31Z/A1D0Vh74cP7R
 lGX0Aw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w1kxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3142a5d03dbso1322102a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753169026; x=1753773826;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7rTNTg/49ZHhf8B4W0jhkieUw+2aiMDE3XH+NwjhvM=;
 b=BcsykSsfn8ruddN42hobnwCkeiQT/tISYT40/BrnzXDQ+S64nkSh1PwbFjmJ2yPFzu
 uqhj2Zw2ECLDxmrhiTZGkJOj2aZWLVXI1I9QIxvnDyjT3aAr4VqKLJebrLg636bYG1QR
 OABZdCxXrxZgYxfLya+8sVbzSG7lkLuXdmr57/mYeo2x0JYv7dGB+7ejYyOS+BR9+kZt
 hHsDUPUiXXwmloyyNTa6+LDeyRVIExU+pTQfIygIInHZCqShCFyh1KgxowU+2IZTaEyg
 FhlHG1WMqFxd0fO32gyY2r2IYQcWDL4zRc/QgYDu1mQOR1cETvpLg5KuUya1vraNSRkl
 g9Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOeInMmgedeefJWUed0h+Jv3wFezddWs9SVYBjThhCF7usuZaMbMWofp+qtKkkxU08Lsfp8YU9UTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvOSe5nMtoRC6vKsROv8UaYTB4dxXhLO+6qoNu2/AwtPYghJMO
 7s+SA7Bka5zecgoe7WiQnS7XTplnJDnkmb4tiBNrCzF4yeguFmxx2QQAHDoIimAMLW+dLAFLCSe
 oiXVh5p1LP9/JsX8R+xcHj0ZYe33HH9kFuunqmedvrAJ0puyHpfKHtrlAl8dxxCCjdvKR78s=
X-Gm-Gg: ASbGncvJq+CiNzMPWjF4E83BIU8FSF03lgKRv72AaYbrmXboXzBS4VT3G0OO0hO3RaI
 XKQ89gzcce7cQLqGvqD74CqNEEkk9lxps20cb3AcHda/AI3PBDjVAeEK12FouAcdB3t37qdzOUE
 zb+DwhEHpJeA8pDA29bUpsLBB8YohF3q5cLBdM3/mxLv1ZTa1JBBupyAoJmBfvq97ykYuaxMgn4
 Udy9znbWI6qu9k8KpDkiHYJk3JnfUJA9kJ3cdJlkiGsq8Gj7jAQPGv0IVxZRv79tYUVTYQsYQyv
 LYdt16TN6/IOawOwoHANOgL8TGFcAAa4bGDS5ErAd1qu0Nn/nEIagZ6TQVQWhdqpHXuJUAeEP9R
 k2sxw5Hl2+zQ9f30/td+hMarH6whr1rVozWbXsZYv2quycjVf413KahF5
X-Received: by 2002:a17:903:1a68:b0:234:d7b2:2abe with SMTP id
 d9443c01a7336-23e24ef7922mr141277115ad.7.1753169025672; 
 Tue, 22 Jul 2025 00:23:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZi2sVWjlvxIefJwnEAsJbibA0RoEFuNEkqwkL4eJL/Th6uYnt2AV1OJZwiVCrhQBLPZSpSg==
X-Received: by 2002:a17:903:1a68:b0:234:d7b2:2abe with SMTP id
 d9443c01a7336-23e24ef7922mr141277025ad.7.1753169025225; 
 Tue, 22 Jul 2025 00:23:45 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:44 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:13 +0800
Subject: [PATCH v2 12/13] drm/msm/dp: Add DisplayPort support for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-12-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=1195;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ciyqoCYFS3+/i08fo7/Fy7G1mvvHDXj3yVN7GeS3ZyA=;
 b=FFmdwXZ8slTdA0DVE9pvzO1FYYEDAJMGMU1mJ7YxSnMqTiMvS9E6ow/3xLAHL6dB1Cr+/Lm96
 yucXBPSLDRWCQ54WzwHwXgwV6uLy40ZWzhspxwW2naZqPRAuu5M8Fc3
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f3c82 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=f-sKLqVA4YZL9HvktjMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX1pts5NtyrIZl
 zLd8V+pE28qXQkVkIW8QSYkbzGZifNSiUM7EyQdYXxTQ0qEjbOuATQrfD4gWq1w3qOqziKslXqT
 CYGs1IaZUiGNDqrZ5XB9jLH+Mcbmb9esFpzq3lb2iSvUxMIrqKMw3Rb+S8yPG4HX6UYwqfoOvE9
 q0C9KIBv/eflmG7Fegz+E/1qVc+dTJd1tIEwU+Nn/VJvDFrJ4/dIH3aPWOkN4h3zYN+B0487MPr
 ypsmniOcxIbWp7JGApSopHmRvLH5Qx9rI9FttmvN1u8CPOr6rRbmeZrW22rW3Wf/f7jTcwjbsIH
 tKQs15FQuF4cK+bieHmLJcOWIArQF7jI4ZHmbeZTJKZp/ubNi2vleD2z1mr1lcS44P8uBNJRPlI
 6WumBkx7RPbOzQr3YJRGnY4VFFbSTtBLHwBr+jATCeQ+xSjTTEFqe6o7C3YmHILQZ7LSXwyu
X-Proofpoint-ORIG-GUID: z_XVvEBwe22-SMqmqgR_oJZoF4GPWbsD
X-Proofpoint-GUID: z_XVvEBwe22-SMqmqgR_oJZoF4GPWbsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

The Qualcomm QCS615 platform comes with a DisplayPort controller use the
same base offset as sc7180. add support for this in DP driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
+	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.34.1

