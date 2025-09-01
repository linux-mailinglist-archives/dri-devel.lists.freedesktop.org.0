Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8232B3DF3D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91ED10E3FA;
	Mon,  1 Sep 2025 09:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJjSUUcw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3348410E321
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eP34010960
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=cJjSUUcw7rcCaAs9
 3ece+tFyKmFvLsxDYnjr0bmulVlDEjpqyScfF1zpBz9X/si+oa/G6vGyOlFteiNl
 cIlGpxJAxbNKtQBvcanLte4fWozqrvFrFWrOnzCl0UCU0oTDeHlqw4srZK/CrnVI
 u1EomFOYJYfvDf6vQxew/+vcI9vp2DxDV69EMeeCWeGwgEwjCLqhF9si8tXOkDVN
 3Tq+ZlMApckfndD4XkvAlZkacIWNHGB3UOblJ2rpc+k+zEgApFWGYKK6LuRLpaiU
 HNq0oWpodbTtoPoCQHwhMFnCfT5GNS3Sj8kjh8ZaY2oTwhsR581j2J5NrBcx/sPK
 Ll9N5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8v75q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-329cb4c3f78so72782a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720716; x=1757325516;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
 b=HQ/yhd2vWWH+qb8DemiYLCfEbDohYuxA7xqfDDqJIeA8Ows1Iy7ZcFppdk6oh2GBQf
 cmSDMxT+i1iEY9dWel7BSyDJNyPk2VLmqiiFab0kgb5nNALj91jWwlr4tj+xHb1l2rOf
 WMGm7ouMCmFTH9m378tsfDt4cfpTKixo5p+HIpQ9YqqxrLCuUvokLvGwcTVW9nPS8jBE
 CJAC5tqGCmZaA6wJlizKrymymKKqJeXjY1PiZ+iV2siA47Rg8yCIp1+eKqCaXg8R0spW
 ld5PC3YTeVp4Alauo69eADKVBQaTZzhi7+BjREh6zjt++YI8rHxFhNboQnTUZbQGuDyw
 4k/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmIjTUeot6lGJiAmCB17eLf7DV25hROuFJ6Mf81PRbQvK6OuO4WGsht6ZUAyOPT+oXnd6e7jQb5Ws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRK88rPhxgf3fGfymaPBlHTbFVpqip3lR4vglQwlC8frHzNNdM
 oochnqPHfOrAInBWThjnc45OdE7WR04WJKopXJqdGIt/XrOM9AXtgtPB0V4bQXsEUOxBWQAuRO6
 cDcrthm5lNE5aTh24/+7I78IftvVyDoqYNSLbJJnvm/uOKY63Icev3LyJqLlxD8tJTSQGGxE=
X-Gm-Gg: ASbGncuMgoiyRKDY5rcPOdlHSMeO93f8IaBdaoTxiCkpcgHOXhFBqdqK28vFjCpzM6L
 f+AVeA8EFl0Tub+ydBoSHOoJA2+tRG7LunYABIlZqwa/nj2jPwTZii6OWNzjDmi8tULwcL84t6n
 25I0yN+Yvx5B5Cu0mFVRUK1VdwewJVJ3rBuyFS9SEmhP6bcmoyTY6LpTdrvQ4/GT3miJL9ay36M
 /Dcz5tBX3hM91XB+eEt7xodI9P6hJNQO1WMm3ai/rzM4+MLMyqnAXemYM9SC4j1Rvi+lNHa8oUj
 c5SrdAV387bcICIDRKnUN9NT4Rk2avNJvXZr2DdSSdx/K+2A1sbjQMAZBWoFaVUEe44WrSk=
X-Received: by 2002:a17:90a:d403:b0:327:e0f4:93c8 with SMTP id
 98e67ed59e1d1-328156e3403mr10453279a91.35.1756720715737; 
 Mon, 01 Sep 2025 02:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELPKocoeFWcHuBmJ0qmsn5YbGQOyvdDQm/Bwbw5KgIEgQX/1K8sTClC0rbHAhXOKucBgdKgQ==
X-Received: by 2002:a17:90a:d403:b0:327:e0f4:93c8 with SMTP id
 98e67ed59e1d1-328156e3403mr10453218a91.35.1756720714887; 
 Mon, 01 Sep 2025 02:58:34 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:33 +0800
Subject: [PATCH v10 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-5-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720668; l=1044;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
 b=GeirIYyOUXVPOWPSskOREOmICTSCKpJng0kNFerFH5dqKzpm3oLQ35QPAuWOKEVhpy+YF9gM5
 KLrQ5nU7/SQDePMf//NeenzMFWPPPZfEe3rrbvP2Dup5ClT8diq6E0b
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: 95mPJ2UND-TdS4GQaBEdJl_omjJ4nvNg
X-Proofpoint-ORIG-GUID: 95mPJ2UND-TdS4GQaBEdJl_omjJ4nvNg
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b56e4c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2i+LB/3W3gPs
 o3z4g3K9GVF7cbHC54URegApRc0QVLmfvC9/nL7RvvU1h/yjRzkxqAhFzzrdGbwFGcKnQWPRbJm
 JeXiawtuQgmjDht6MBByrnGrNrjo5dDaey4aaC9tKiYflTcQtXTvHEsScYtSIIo/IxyfoMATtx0
 LilRvAU4emWzUMhxh9XqwMCk34OzJcsfikiSZhOSr48c+FEfk6c+tNFvdmjFjSOhWy3rUaZCm9C
 51M5InSIMHH76CJO6VTArOdUHb8Yx9Wlri7y1QWOLWm4I2hHs1skj+iNgGO8wbe74PeZcuGFeS1
 9aNDJmE2OfBTaYoDxFv4QAu4aRfKjXEaXAvCK3fl9mqE93qVpnkLf0MpeqdOFhFlWxPAtLcQieD
 cFeoDRBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

