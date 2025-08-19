Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D05B2B79C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 05:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A1310E52A;
	Tue, 19 Aug 2025 03:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVz1uf3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88B10E529
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2waAL011921
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R5/ed+iMJVza84RA4CmOOZSSACg+IzN4IYjyPBClVDw=; b=oVz1uf3CRu6f4Gjh
 JnK6KXd5EzzWQnGXvUqANguG8cz5HxvpU9o0TcUTmQukj57RbmJcGW18xVKUJJnC
 9+Yq2fhB4ju3JvGICCHrZWP2EDcyxFuYCuzxIbawxELhzSCvkOpO1hFz7oAhLCmk
 TSxP8rFGcOQ7vyEb4TTa8qh08HVXJW2o+kB0DDPFBCh80ApYOTeuiQk+JTGnhnvx
 Km6US/rQb6xl/1cqBATmZ5y0Njf1Og/iLuL0wSz6AtXp+ua2cb3m+K7yeHhsZ+QJ
 WaNKDp+vkH72H5uwaW5v0ek4tF/W6bqAq5WnDM4a5fbas0SDQMrDBr7/ItjTh9rV
 +Ha6mw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyf1th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458264c5aso49862305ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574476; x=1756179276;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5/ed+iMJVza84RA4CmOOZSSACg+IzN4IYjyPBClVDw=;
 b=v0CaGECE3obvvOYJ/7kI4p864XfYNsjJ7wH7L2cQlav3v4WeXAN2EOs7/8ZjAW2Tko
 NI+pccBsAeeu2HO7J5aL8rtbhMzp4sIzeDNQxuRcGaV2JyQlNX0kCfj3JDxVxy5Xit7W
 2phwPdKnGhVVzlJd71rVCRx0gIZTAVyO3RjKAAyGmKJOTg0YxDkP4se9Qe38Ez6kd5W1
 Tyd66KBjB1EAq3sm4hGgImaVtHdlEy0lTfSUBitkGH3JvNKDEJKfgU2EwhF7gjc4rn20
 TF3MfAC3pJDVSOZmYrzbbrutwNUHuA5NacrMTYEvez/ckiVNG45l09ltpSyLzPlqeERW
 s5Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV//tmqRze2lwDJACbAT+3SYqO9BYi7gbdulmB9BUqRpGngeLeQPLYaxvrA5MCFod/tnUFela9nD0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDKVylsUbDrNBZXYtkjXGNT6MtnC7RYduCYaI1ELT0+lEVq05T
 lVhT940pAI1UK2wYS4y2nLU14LiUODnVkMu6DX90zn727zTkc/V5608YI6GmMBQ6UYnaabzTyy/
 lnaUlYMVDkyWoECBUDOzuzPXVWWD4Oqo1flzhy3QLox+Sqyc6BRqqsmvTN3/tAr/RReNtrWs=
X-Gm-Gg: ASbGncuiL+cbm5gRS9z0r9ikAQdBLMlgGt7dZuhCUyWUqHsVCSrNUcuFv2M4o7rAAXj
 R3NlRI4n6Zq6DUGLsn/tIwR7XombiQr45/wkQYhkulL4vGjBfigdiYEIyZc4dCRyucr+5fT4ibB
 6H1IQwNFY4BxynEOqVgkmBFvg3UMpez2a4koieMMzeHUlh7ANEMKzs8zIc/34pDT/Gqmsmmy0sr
 VPvk8SjJOISLQC625KOROABhn147RNlW3XJrlCabu0932M+KZX+ajaXUISIjVJznHBaXDkK7SAP
 jGwX0hR2vY58GMUqjv1nGbKrogYLw4VppBB1BVeeH+qUfOE8/Lej64L2PRFEjuG8NT4GFvI=
X-Received: by 2002:a17:903:1249:b0:240:6fd0:25b7 with SMTP id
 d9443c01a7336-245e04ac757mr15321375ad.38.1755574475927; 
 Mon, 18 Aug 2025 20:34:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeF3q0NRFaqzmeniqpQaJM8C07r12p9EeneZ0E+iAYto/zETVgcNSjCv0p2TC+5I/zykn6ig==
X-Received: by 2002:a17:903:1249:b0:240:6fd0:25b7 with SMTP id
 d9443c01a7336-245e04ac757mr15320805ad.38.1755574475483; 
 Mon, 18 Aug 2025 20:34:35 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:35 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:33 +0800
Subject: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574427; l=1239;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=PkZh52tFVW68m2fUUsOwG1KUdbGeXKurw+4OaZvkX8I=;
 b=dQ6aru+yQ61EPbqt3DsNB3TZCLkB+30rVHlgf5Qp0xqAZ4vNfPSKD+2OoesGCp3xqCbOVmBvY
 qnw3cp0Vl/PBskaHMLYtoqm56M0lLnVkiKAh8YdMn+BnF6esphosG4P
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: JdyND0DaAbId7lDKvJDM_AnXYg06-YQi
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a3f0cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JdyND0DaAbId7lDKvJDM_AnXYg06-YQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX2qeMXMUB7PGU
 QWklyXKF4VYRpbB5buZ7L7JTOPXQisShTSpmicKZQHxUukUK8n2+ZPfVVvuNQkn8gqQ2C19Apik
 HdRBCcrJB+8pDHbV2HbaGd8ianQmRd0lf1234OWbUet5Dv53LPJemyxXNUNImjI5lo+iE4Y8IZ9
 +PBi6MClMvowlTkLG3nsbys3GYpJYw3PW+c/E4jzbMqqN1TCYIqeyRgxmfmSimh72UonzVT1sI5
 QkuyFJyUeuTUeWgROOQDJaLlSwbXQNUawo5z36unEvLjFaF0GQ3wKPKGzx6oJt8mWx/LY9PCXoh
 0S/Zz8hKhW3Gxty6HAuuOU0nfm8SEyQfR85hrYXB954Qd/l2bJplqfNbsUcfCU4m2shmN1aEsTF
 Qiqih3M7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
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
be enabled as part of MST feature support. Currently, using SM8650 as
fallback to enable SST on QCS8300.

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

