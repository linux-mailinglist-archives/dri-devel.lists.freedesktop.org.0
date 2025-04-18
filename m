Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC697A933CE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 09:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22EC10EB83;
	Fri, 18 Apr 2025 07:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDDR8yN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35EE10EB25
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2T6TY008117
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=; b=WDDR8yN6Peu0rUGT
 C8gHwyauFw5GAqefI4hipAekd8SAMgvqgi2OLAgNEuHU4zfuvBJ1PVPGIfLyQ5Vk
 y05elYKL03WXvM3+z4dCkHUc/TffYeUs1TuvtS9Rq96qxkw1CFeFna0vs8e2a5Xd
 cks4zzUN+gfP8/rS+QAq5aKkb2r4T25drw89ojBqNzk887pX/kIYDfn7lQawvTc7
 AKDsKaVV0g+y5lFqPt539dKXzhDcJ9G77sVD8V/ESPD0U1Rre/lnqn1pkAbavoy5
 ugOm2C/tv6pzhvtSBTEzxaD7PFMTgacZ+pMApTAmVmJfJl6RDk3Duf+eBZGxXeSs
 Av99xA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk97kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f2b3e4c176so33920246d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962606; x=1745567406;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e+7zJBm63Lgp886dxKyB6dmrzG0t1u6zSCJPTB4/5Dw=;
 b=M+oy3FgOiCMZibOUQC/ixw1HVnObniebA892Mkh3QLRI9b5aME9DVBBlMSoHD32+0n
 mkNnceibL0Y5jHump2Sifonb7ZlHGYKV6ttuqArYQQ7PvKCLXDylwYUjDm7IachWEs8A
 140YfNd3drcw3BmahjxTDYyvXImC6Lg6zi8ZTsngGCIqPpnFFF5Q5o/cPbct9ciMehlJ
 MdKK5q2SstcISBxqeUwgcW3RvCpYTSeFMgYTN4mFhUoLFXLnrxSdBtOq9oa9IZBf+0MH
 k9WulLLcvXJgWMr0jBV68x9wXlrJnsDD3l9tP6dtiPoYivFttVFvXPpPLMQpFMANE2Yc
 eT6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpIiCD+3h3W9uw16FRTlAOOv/VJAF2lBEIeHhTeKvbO20/UI6tAxEMcSafDCbraZ0SGXrRKxXV110=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx84fW9SQdcAua2cuyVA1Ufs1Qe0feQxfBUrS2wedPFpc/yCLUW
 vmlC1x7x8UqQ5MZjNUPY0Jv4YVXJIl0xl8FZrQ7x2PK8i5OPwqQsqJXABdQonUaq7h2SaPa7T6P
 QMIsIcF1x65QUWrOIKc3tiFKut2Z8q5IvEFmYf9yFmE2UVyaG3EY3zWxvyD0mOLZN+bI=
X-Gm-Gg: ASbGncvNAsJoY7GSuloAfQwqRgYbVV/lBsRLMttK0Gux0zZGlmnMMsyW+a0l9aslrRz
 THEC0GetZExuSWecHAeOnWn9BApSBO4VYtS0oqsS2jNvVwGWmA/4aL31kaQiDTl5Y8LxmVR1oDk
 ILdIa2RFUPEiX+LjFnlEg5MSrCWzQGhatUFqC1axbpS2t5XdatFiVv7daZhYK9DwO6IIa6YU/9y
 L2kUGSqoPO4b18hAO9oavgR4gCSY4n5vGGAVz/SbCX+I6yIPbhC9MrJQWquJZmQ5/z+bKoB+j8D
 O/uEXUFbiQCd69iziKY9dousgKzOhG8BfL3YnAdvFuenAM9kQnWCfqVZLNjc6JZp/T3ImDTOVzh
 UwunQ6LLquynvcRjyl1+CrHdZ
X-Received: by 2002:a05:6214:2349:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6f2c456c668mr26534636d6.22.1744962605923; 
 Fri, 18 Apr 2025 00:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmdqbp1uisYZt9+CQb8AviILd0JfMaSMgZGRgsUVuNr4Q8za1X0NlrSkYGGp8cQsS875MEng==
X-Received: by 2002:a05:6214:2349:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6f2c456c668mr26534236d6.22.1744962605598; 
 Fri, 18 Apr 2025 00:50:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:56 +0300
Subject: [PATCH v5 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-1-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQonsp75XK20kcf2pu5n0LjwPVYXkdyYuxQf
 a85/76z7hiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKAAKCRCLPIo+Aiko
 1cq8B/kB+M00kXMMuhUmVSsKacPCdyAy3OMaCOCs8MJ5vQI6oROm0o7QZosSTt9M/TAPovpvLKQ
 YCocSsQ5JV4E8l8sAALjIOjHHNMpl3RvlOyPigbaKaN52tPNdrweOuFmzhDWnav3Vaxe04xIpYR
 HU8j/0sOj3j4ALvvsUXLXATE746j6PyP/7Z653sBsEr0UpmSkU/b2hHDIS1wclGa3coJqUqGh2G
 Kvk6NEnYnLOkex9SduAZJfoWdzCN5dyYrHvRLaJdiLzc4CoQFj3e9+oltrhHEOyT6LapegH4tb6
 3sGJLOoj5qOi3zj1xM1+geoLFaCWpdOq2Fp6Eb1OVPqkL712
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6802042f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eXCmTRBeC4IPbSrE871AJWSFwuhteUyi
X-Proofpoint-ORIG-GUID: eXCmTRBeC4IPbSrE871AJWSFwuhteUyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
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

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5

