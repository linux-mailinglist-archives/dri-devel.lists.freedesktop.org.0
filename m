Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25392B54B37
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818F110EC1C;
	Fri, 12 Sep 2025 11:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNO5V6jG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514A110EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fN3G019947
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BTpiCmS+aOzJx4voYgNQ5Cttmm2gaySgd22IqIIsiDM=; b=DNO5V6jGRZFKjJ8G
 REDzWZ09eSSOriS7/JdVLBtoVn88r/WwuvHOkJA585P0y+e+z6ZEmljbP8DPV0Ot
 o/4qspZ9s3ZSKCaPymBFcLTi5LRGDM9EEKW4/yFUWPlJhbFJDMAKygzWKZNVNhwT
 0Oqgd9aEybGGihqlVvXGcaoR7UIxquPwRKIogt/SWYk28yGsDGlTo9plUkqbD647
 eLKyCp5pwaZkngbD8X9x1j/3U2PD3CmE9PRPKCgFEVIWXZfTNaOGBW5wUqj0O0WO
 m4jqiI906up6sipn5yO8wnYIXFChb4ZV1GatcVGjRCHO3j+8kMS6aP1yQMsDMzWM
 j81xow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387wpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b54b301d623so85612a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677190; x=1758281990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTpiCmS+aOzJx4voYgNQ5Cttmm2gaySgd22IqIIsiDM=;
 b=rwEBeuVA7/E4/k74vuP8sLuqYPgjQIhYz8Q+GA1teQZl9yKHclejXxPBbacc/MyZaK
 pRo2XxkDd8jTYfLJmtR7nhMnen+dFAAd/uccB0g/GGvGCxQj+dmFRdmpNgv63MxBhRmg
 XIeiMbhXYEnD5rmSivM+eooat/Vn8O0lTySk2HGwCL0jUGB2cKl7eMJKBSkpkTurhGmn
 bWSwGNFJyJVxCIoiCj3V+FsS4Gptfx13Es3rzbmymNBuF8ijKLCwdK19253pD3RW4xJA
 L6ehsNpo+Jcm1G/LeLY4VEjUbFYJ+GDaRnaw12+9giLk8Gy+t+qIyk9h39QDybq38zoC
 yyCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQX0Nw5Z4y9dbSEUUeTnrPsxoid9yyvNIPdAKBkWp8LmKeacRv+NK/T+HWMQGwF05zZkFXBWTeuXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD0O12YIXtPBpohP9VunRTXAW2jV1FiPVwq/9646c7m2iUdPqb
 nzLMydoHm8iumDCVKmxUA3Zw/ASxGEuqY+S5bDUaQkZOoJLtPP3ceUi2OOv3ISy46z61TxletpG
 o2ijKH/UG6H6lO/2dunOfzlLn4j56pd2j4trW3tJZYBE0SYflsl572iwo08WJ7FLTMLBWOfU=
X-Gm-Gg: ASbGncumSfdWjcbwg8VAcXymuWJeG7KloS1M8pkLrite0qeKSteWETUrpUM1CirwZa3
 Vf4FWEdMv2rL5FTxWIDI3FUN7IXWoMS9021ezSDXm2QgeOKyjSq4sNJPk1LYY+UZwFnCuzsI9dX
 dJm04a2fWT7hABd1D9/As+2dg+Y95ZFAt8wldckyO5F9MqyTrBiOWcoDyxagsPReE/ELOp1ZjvB
 89mjzsdZucdJqRePeE4kbx18m0mOfeSlbc5PrjlDM+ClNgs+joyYmmiehpvl6P2HrT63vyu2a2e
 IQ3R98XMfVlAjh9Fh3jOAgzAk5fL5puJoDbqn18hdJdu30/A1dZplxm408Azup1Bo+MW0ouACjm
 4kx4IDx3PUn5O3cXIwW/ycRxdwhAheRu4TUF0yCVe0Dtoh9/8z0NpM41/
X-Received: by 2002:a05:6a00:2393:b0:772:46b5:cc7d with SMTP id
 d2e1a72fcca58-77611f9a1b2mr1873620b3a.0.1757677189778; 
 Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELFvLrg5kPis7j53nKtzrsgs2TLYs/gVlDCE8CvFTY2T8sgBM9bn50GM9tw577E4AAn+xTlg==
X-Received: by 2002:a05:6a00:2393:b0:772:46b5:cc7d with SMTP id
 d2e1a72fcca58-77611f9a1b2mr1873608b3a.0.1757677189294; 
 Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:39:17 +0800
Subject: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677172; l=1260;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=zsw44VeIS8tPBhNLX2AbLAqsAEVNVFzksn5mBiXdC5s=;
 b=Wiv2VU+0hSjsT91pK/MSZfPi0gQD+MHY26Tlb8S5d2LDXH8c2j+H0K85uR4jH147bspO16+mg
 nDrmZ/85KDfD06aYmXxXgE14luXHDfN2yEFInlheFlMfGQaj7U0A/+I
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: DknujpayI8Q1c5LDnBSnWrlqxw8zZsr6
X-Proofpoint-GUID: DknujpayI8Q1c5LDnBSnWrlqxw8zZsr6
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c40686 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zkzxiq2xDrpwyWBV8T8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX1fFqQRc9Rxym
 1La3y5nLZmFGCm5bSyIXTx50vc3aRFn86d5UiBRURcVdoZVRT/ukl672RjEYQgxYPkJzZebBmWw
 abawHG2ASzbZ8xeuTkisCOZy14SEtSnsrj+P2J7Ca2xNxOuklHUWGJdCB8aRACX6OT6UDNJ5rh/
 GP4iszkphcnuAFHMTAkB3EpUUU3sQk7ai7cmLa+EggxUNkt1rdqEigGr7ngyUU0xElpC7/l40Ip
 evuB5+2IZYdpHOcsDHoc23VEBI8cMO2Dm8qiMYP+7Vwsx5t4DtR9ndtOsMstl/CLzhQjWG0pz0u
 umApjs6GXoMqqnie3ASJyUb/FsYgXM0pObNJIm8KyicxLof8XWj/iI0fvIxiV1VoD04qHHA1VTp
 qUatHFDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

Add support for SM6150 DisplayPort controller, which shares base offset
and configuration with SC7180. While SM6150 lacks some SC7180 features
(e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it
explicitly ensures future compatibility.

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

