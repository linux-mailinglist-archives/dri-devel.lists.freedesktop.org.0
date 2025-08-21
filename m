Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F3B2EC1D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1798910E86A;
	Thu, 21 Aug 2025 03:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNhEtQwz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6D910E86A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:21 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJjL2v005347
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=; b=WNhEtQwzj9cmkG9C
 gKNtR9kKQRmkFRkYW3g5clgGxOYtVJ6MlNpwsM4lCNOtY+s9HUZvCNiC8YXe+LQw
 hulL1XttHEsXP/TEU3oZYBKyXnMNo0eUpikA3Bw47iHS1f0TByHPVjQihfKOXUyy
 7fv+ELIt+zI7eTW870Pfhp5G1ah5l7s7i9G5ekOwahBD7hcGZf4nsKsxHgNMkh4g
 kAs63c7LAD8tT4EvcWvesZc3GXEQzZfJzvIxGHF6j+XoReS9Ix06y/GTVk/knFrn
 hzM0F2XYN8E8YohUPDI3QaB2q/oLYq2FY883gPq9s9Oyb5qzncu1DrTiu/Y+792h
 Hu8R0w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52aurh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2e8e28e1so1759552b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747440; x=1756352240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIK2qr3/NE94iQwkqEL7J6K1o6tIhuvxaoMJhpu+NbY=;
 b=YrLGAqzpJsbTDT57FyayBj66ngw/QtC287cERnNv4XqrmLn/cmBUs2oYVoZa7/tpZH
 Nq5YawZnsE4/j25hm+oWzlppQz75Y2KyfZFjAENlCeYQpdTSZzCu0f963xnRen0W0Vt5
 oZWgIDmmsdfM4IVklPXjGKj28ixMchODlHLENUJ7BkVwDi+xTQymJsWpEOZthFjF/xrr
 WUVXBKOlGFtUG2mpGzYChZeaG9b1/+PaevCLmzWJBwJycr/wM78Vqb40wQbFNT5qhcG1
 7bLxaEOXSo1jYfDaSkYh7m2RZVj7wkp9AE+Zyct/QI2f5XL5d37P175zE3YsPg9QsmJU
 IM+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz3kuKXszxt/bfifFwCBBIWX3ZyHA9wDhmPEI1utkQsXxQh83GOi2jn7L4pFEsppxosvKM/Y1MeLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+jeYljMj625A8NgIRG5c7ne+/0X/C5ew4fShI8obULg7+/mmR
 nPz1QQIDCUtN6FL5Uj8zMGtu11yt7Y+zjXJj+xXjuHB45EaXZwNboe6D+SD8wIn5YFWUfrYFai1
 k4LQ/ZcOfnRbvtyiyGtEm5krvHW+vfJRnvIAeddI2y6ipCTKMfpFPjqHh0DfniBEvS9DTHDc=
X-Gm-Gg: ASbGncu5WqQrZtNhEorjb5uKBxR/Gde1PowjDQm3phcDIn/OdTcKBT0X2KEzHl/lTil
 aM9HMWV5HwGMasnxuvlecOH9eavQpYMYuRm79R0QxvVO4gGzJt0Baj9fQ86E4YI7PRY8966J6VA
 dBAOpSXDHlGd4j9NrUzOkvKtRSCIbhes3xwLssvUyn/Rkqtl1WMEAckfR+Z/T5/Dkq/svgZn+cM
 7/hxy0SKMkY4Ch6YB8eBoeZh6CgTwD9Nz6C37luk0loTUe09S4LElzYmVf6J208j8+kbePLwhiM
 h37y0ZWpRpgHhaT4OJrp1JtZ53t9TOM9FSNMKUfuYsZhNjptrad5laOGkeEx4G8UxhyTOM4=
X-Received: by 2002:a05:6a20:430b:b0:23d:d5c3:c92f with SMTP id
 adf61e73a8af0-2433084ab09mr1143121637.7.1755747439737; 
 Wed, 20 Aug 2025 20:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tAEO6RQ7A4Yif9M5PGwG6tBqJ9xmZEWW8ipYZf3ykfyR3Cl22ZimZ2XbB0j+wgWpjjPh8g==
X-Received: by 2002:a05:6a20:430b:b0:23d:d5c3:c92f with SMTP id
 adf61e73a8af0-2433084ab09mr1143101637.7.1755747439294; 
 Wed, 20 Aug 2025 20:37:19 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:18 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:59 +0800
Subject: [PATCH v8 4/6] soc: qcom: ubwc: Add QCS8300 UBWC cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-4-e9be853938f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747402; l=1189;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=/6uXAHc8u+Q/a1DjNDEMhzB6keYn2be9cZkXxsbUEe4=;
 b=PAchjJlEg6YULryzF2qUBVRmkx6B5muCm7v1gdEvjkVwjtgrvuc9yDJpeJiZirjS7AjHchmY/
 XBkDPxjkAr+CIuWlqlw0wdqfS7TFHq6xnd2Ix6GRqyFNzToACWb0cCX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzO14tY3sIthI
 f2R+TF8/9F4GaCNX8UODQltMgDoUP/E1fPZHBXYaW+KoW2/cWEpHvsfvaZmn7Qa3qr5VREVrwDY
 rx8M1aeW7s84eQKPDu52RUahLv5KuOx2QKxzDTIv4ZHnwJvlwP4xllFKygUyrlSRi/BWg6+AAK5
 9BjtlvLjNCbv4+6WKEiObUAGPtFqJMG4o7CNf4tZG24wVoNtn12m5Dfa82O8L7B+FehN1vcY2qB
 kj8MyS8bojY3bmgoZ3QDxFnpr5tEdhg7UgjpNmoRF7kbDE2wf9eMuunjasC4rMU8Sg8GkGVgBsb
 tXK1jc45tWZk4HYfBJdCvHsQ89pVsY1gpbnxGX9HCH+Wl/IdJu3T/40j/JAFLEBiMs2Vha+Xtj1
 eb4vLdN9KxklJyxsB2gC1YjRPmt7QQ==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a69470 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yyC0Gtz2zuuxwh5CSaYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Nq9Vk3TJGrWPsCAr7jx2cnqQVQXsnyeJ
X-Proofpoint-GUID: Nq9Vk3TJGrWPsCAr7jx2cnqQVQXsnyeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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
index 1490a7f63767bba176e8e2e76891d7d2c424bb7f..b70627d40dc4c671b8a855a17d4b8ca2dd9952d5 100644
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
2.34.1

