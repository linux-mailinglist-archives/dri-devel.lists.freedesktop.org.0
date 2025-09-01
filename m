Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04939B3DF40
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717410E3FD;
	Mon,  1 Sep 2025 09:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQS/xVmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419C510E3FB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:58:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eN2H019276
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 09:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=lQS/xVmvG6A+GYPB
 iOPwO35lO+3st8M1q3ObbX8yFPXMvvWu6Y6KJChPWmEC/1ICyfJDxbhY2K3CibQE
 zng83HD8CZrgwQdt80DM3VHNjtR6m/rBjPJWgJsBujrmqn/Zj6kPbjIONIj1AuSQ
 5kM0tpCuaDyqqabWyBIhvoN69ca0yDwfN+/T9SWkjOMuKSYRXErMpuU4OsHgr4K3
 4PtCpBg2kadVsc5Sn0iyyb4lW/M/hwWMRw48cJIzvbO6jJZu1bdQF4t3aIRFjXzB
 Nu0eTON0Kyg2KkLQ5kHUmrAWI11a7Ut97G2S8/FizAe7l3Sepy3Ogr2WtZgmA3uw
 CP143w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy0369-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 09:58:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b4f736195daso810119a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720723; x=1757325523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=gD5qP7QNK7BWLJsgobaM6YnO4rlSVg2GjwBA2c9k1mbM6znR8j6Xy3GjBAK2wYD2XE
 nRhoZbt21aBjnjyaLad/Ayo5XKnh1RGiAxia4ckmLilcvZ2EK54DrCXkO9uqAVXIzJoA
 5iJ6NyozVrN9PTPbZkLjIN1QYyfzXlcOTdiwQrybR2kWn0MSF01LadZdkMr2pqAIoDf/
 uZrPy7KBUTRezWnywHHBcEhFtxBdpWw5OOYAlJxOHojq/5Ss6na4iKvRQIIj0SOan/HP
 /QVlMl6EV32Lu8wkLs7Div3ovrHg1isW5yPFc7LEbysKMfpbJuqYNOmvq72wR893pYD1
 HmuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAwRT1JtWtAAhU65Mu5EWmVXoriOOZXAUcyJScyuObUQfTmAkhfvdKO7nAgHeNLK/pWAl02mQp880=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP0JAG0CqiEmqvSwX2/lsQNxnc0ydu+gMwbjGiesoNJi+ZdE9J
 jdmGGHMEALpN5wbPuJCAtlbihHR2vRz8Gqmwu8+qMbJiBBVABySwR3m6995A31R1DMeMYF1rym1
 vAu+v3FQgZyKZRSov2CgtwEfMMUPyX4pPFGAu/nNYgaze6dH1YZs1zNjxx8anPxPABqUELDY=
X-Gm-Gg: ASbGncvYA4BCtdhoV9JYbndRdbvBo3E2AuX2wO7j2ppCnHGJ1UbjbxOTUX+zqm5vewi
 cUaY3sSSjoBMtd6opCH4blDaPzxNBOed9pydxW7REOmyyRG/LlbPhqnH2uG3otm0HSX0+l3IJ6l
 Gq228xO/VnhjKKuCdLJm8aHaMJ3vR4+9amw3jiHLhqpTUxf6ETPk3CJBtfRGY9BLPJHFDLCD9zq
 aDrLf/fmpPdMFpIh0GuZZ7jhlFovjpy7AqSTWq2sQ9UOyGp4kKpX9f+Zz3iqS1RtQGFW2o3NyDW
 hLZeVBeewgbLKgiMmQe9tj6cd9ApkeFOOE62lpvgAOIb13ndDeFgeuwo0HSHrIYvQrWqLqw=
X-Received: by 2002:a05:6a20:72a8:b0:243:755:58b5 with SMTP id
 adf61e73a8af0-243d6f7e021mr10260520637.54.1756720723175; 
 Mon, 01 Sep 2025 02:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcT6Sy3B9OTw9HVUyb8xsdhYrAB9UJyNu8eiRPjBXTTgcVrCt/D/vmbND6zyw2UIQqSmNAag==
X-Received: by 2002:a05:6a20:72a8:b0:243:755:58b5 with SMTP id
 adf61e73a8af0-243d6f7e021mr10260470637.54.1756720722682; 
 Mon, 01 Sep 2025 02:58:42 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:58:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:34 +0800
Subject: [PATCH v10 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-6-87cab7e48479@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720668; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=f9d+cJvkz4X1o3ygAyE4yDQLdFavOoV2A1iTB2IP2/9bGSNAus9L+k4CJMzrFYJlYnWv5JD2C
 6XtJKflv/acCfCPt93e5e8IU+9EdYW6yJHxMMWdV5lAkSkxssNGg5TB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b56e54 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: HUHHkiONXMrqqcPU7h_KdXTVQWbwPBb8
X-Proofpoint-ORIG-GUID: HUHHkiONXMrqqcPU7h_KdXTVQWbwPBb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX/aklUGcCZv0d
 f5hvqsepEiKlPigHfsxUhOLLgpJsifkypx+Ino+W/d3XPzlfCfUd/J9lAi3+IhZpTuK9RHX4IWC
 le/isv6iTUzRgTH17bZJ8kS3/UWneMMDiYLDW3z+GcXpK5H6pwogoxgTBlZ4MK46cEtjKt+5VcJ
 jFh4DHj1ia0Oj1nZgbpWZ2ScAwsdmK+vkcBtbM6dRdUGOBGMyHHepHMone6FXv92Hj8bvPK6DYI
 oz74MA55Xm1Chgw9JXO3LnbAGcasd3cAnBVC9VMkkB+SOrdyOUTrSpj4t9ETlz2Ws+m067ofnZU
 CRfn2ukL7JiNhre/5wWfJAqnlLJ3uXNl0Vg7ELcZ4syKBGMzJReiiYMrhBVeNJjUzkVSEYaia7p
 g+L0wULf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

