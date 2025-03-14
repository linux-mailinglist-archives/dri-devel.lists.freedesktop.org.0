Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66639A608D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 07:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECD710E965;
	Fri, 14 Mar 2025 06:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W188Kt0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49F10E965
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DLw9cT003733
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=; b=W188Kt0AvYyBcZa9
 gWlU69bJyXRBplBjSsD8aty3xl5ccNH12sTsyhdE0ybKtqYg+wPWsOrWwW1M89/K
 kw4Oni/Icewiq8uOcRUdXc5iPytOnC+xO3ZSFlZsJPV9C1S7/ybU+eg3JLu35rm7
 ohiA7j3HErL4d6QI3roXT6tD6KsZImNiHI6rAV+sdz4RZHGgMtK2lfsosLlM3AYv
 7V7/mBwxUa9l6T2Ob2sLcqCtplwUJYo68VSdIgVIeKodlOCh1WXYzz+KFTGEK8Fu
 XxwL1+01tTszdlfsDKKoxQHsEMHd01iDixl5fHNp0ml0iXyHV7taW0egiww3Tw+C
 d4Wqqw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45b96ye4mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 06:09:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8feea216aso53958066d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 23:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932578; x=1742537378;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qVY1mYqI07xxwOPaaEJN9uMuf5jLViwP+ENDWkNYnk=;
 b=LN+awt0NpopGy9cG10BC46S4K29qddLyJmtPKnTUsMlBQiTI0GZPvHWyD354KQuRTe
 VYJPRwk9ZZcPzhcNdZU8JI5e9Le5Gc+RRMUD11ZY770E9o4/rphVaeMoUzWhLwYnY5UG
 S6HTwcI0ebS9pspgBVcBBhWqpWAJE3jvBSHHAx38LlUPln7YnHsZVXTllk0SDVBMnUcK
 +bFcZysZxOkhWqhulFpTXwP9I/kj2WrHqCpsr/z7rsLrAOOJ9AT+vRZep+I9igu35hDi
 1ts8GYQrUyvXXRrlBG3mFtVWW6f8ta0WWQ4ZMuhwPAGtTzdB3EsSr14xkKQwdJSQf1am
 WXsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpfHtW2sf0cbRdwDjsG2PoYaSH94pd2hF46tsa+5Bjad+euO+0ETj3JAfkTaFGwD9eY0j+9u4lnAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz612cmjpdpf6ez82Zighb3/iP2KwzSwZaqv26wE7UftSc9myTP
 F0yMUGS9apzm5+7y6STsiN9ZrmfRkRO0wFX/qsNTnkw82XVoRQXstfZyOvES0FWKVch5MqEZrdu
 oQ03xlNsKXvw0YXEgA//xuG/ymLPMBCsZtOyGY7I53SHFn5OeFentu0IWsikqB2SjF1I=
X-Gm-Gg: ASbGnctOHPKdOhBQ5cyXPGcFbtX7GXxewrD2N3Co0BwTq3CqxlxcXxSBCytq2AwwlQ6
 tuOHiRtoSnaxECmE/YFNOsLV3OjElD6QIOEFy7fX3ShLVUJlQmcyVhnyn5fzGCq6gscdFoGWqlD
 aBFPQBQBB1zJcoOzD4o/6BcRsIw2aI5t+jfDxy8hxgbMraIlDOCYs9wFU9eW9DG/jNuQqKT4MOB
 aRZJwgaob1DFSQjyyiKXguMJiSLWoTHE2fP1fJw+EFinivFhjmIeI6Q+6nhl/eBVqgHe5xwJpu8
 3fv+FX4hD5IiNYNLjnc6ztytcIVeCEO2YPNkMJwIi/gXVHaotZnMomrdOzV6T3PZUzVzGlBt+sZ
 WNUG2A9tEWnSD0P8coo9J6hsudz5m
X-Received: by 2002:a05:6214:3210:b0:6e2:49eb:fb7 with SMTP id
 6a1803df08f44-6eadded98damr91700046d6.3.1741932578353; 
 Thu, 13 Mar 2025 23:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmphsJmME9Pc/U3siitGJHcFAyJ4/pnqiucdsVoPe9o6GwSZXaaKymgveDgh0acioXgdvsfQ==
X-Received: by 2002:a05:6214:3210:b0:6e2:49eb:fb7 with SMTP id
 6a1803df08f44-6eadded98damr91699676d6.3.1741932578051; 
 Thu, 13 Mar 2025 23:09:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:09:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:10 +0200
Subject: [PATCH v2 06/10] drm/msm/mdss: add SAR2130P device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-6-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rlE+wNfpe5nlUHPDnN0xiTeW+ivm3u5pjFqcJvp10L5
 5mQdaqok9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATid3L/lcwP03zSfOz9Sz1
 ayfUBkuuKlN+H/X8m82pMtMbDMWvMiOshfoNNe/ZaL6szb8efm1fzmF5z7RdV/lvcL1I7Lhqkn8
 2+fjdzgb2l+0sVz0CtDbEuCqbr5or3l71Y+WJ1nvVLqyHJm+zd1DrOHDil2nqY2YD8Tf8j85u0l
 yuIR3sZLpxqrQt56HvrUcyonpOKHu/4Og25fqq3PZhornSjzNVMxv9uYTC/lj9Dec0Krf7WOyoe
 OXXx4kffl/ldNyVniGk7r360MMgbob9MiYvqrn5ll8u+pTXtF6MXd5hc3hKQKwDY02AxObGZPsp
 9Scv7LaWEzzufc0wUUv0weREzc6lnVOvt9g/etd31/8MAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HPnL3IP9ManoRZNCawmO2p-R2zsBCfGa
X-Authority-Analysis: v=2.4 cv=I+llRMgg c=1 sm=1 tr=0 ts=67d3c823 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=PM8Rf7rFGDq3tjJTke0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HPnL3IP9ManoRZNCawmO2p-R2zsBCfGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
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

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5

