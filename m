Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C146A8982F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6FD10E6B7;
	Tue, 15 Apr 2025 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/IqUdzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACF210E6B3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tJJm013165
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=k/IqUdzRBucNQj92
 R2oMofXUSvg68XqSvUpoLzeKhEkncj37fRhj7sxxT//9KzNeIettuvkUxeJbWAhp
 fdJjNj2HXxpls9vmuDQkZy2t6pBID1MAMU3GPI+sdTNiLGXnK3Bv01zlRd9uy6yR
 4YZWkhKD5Y/7HxcIA5Bs2wddIVY5vA8gCr2nLxUDQyYEv6WcpM19N/W1MAE2OzLE
 kP3LvobnWGmInRCNGAwZVuwvEXT0KDAN7KStXKnT3/irwgp00WQDh7d93J2knVTQ
 KXKNbhFJslrB1yBKTxM7Dd6sGnRj48GgY5phhPhURKtEstJDk3TXGjfIY1iIvTnP
 pygfig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fgwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ecfbdaaee3so88254656d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709982; x=1745314782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
 b=JwCswR+9GKjQpfer3pDJwtshFkEUFaLPnu7Ul/NiTzrgMPoirj5jM9/nD1KE6abIR/
 uLA/JcDVTmRXegSZZAMwJjRvg4djks1kWyQU3NbIIdLoKLeiPG6t7BMo20BH9e1zbMQ3
 p/m7NXJVw0VVZx3nq+f522dzHegiwip+ZAJEGzLIQP55EuiEjtnjIw+EvLIyWmOI0lnQ
 vgf98zonIWeFNQyWGfzwFYH3tygsAwLNy7eZzVvByER8bVM7mA9Ba71C3Sivw1jhrvmg
 jbAdIcQF3VUkNvY3qKb3bjMIdEXXqubH8K5GKdcmIyqtpF2R25FdCxCGpdkg5oZtPs2V
 ku6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+L+1Cw+KE/4N/+Lyn0PMrBFyFHTFZr0tPCLQRGaXoLuPA16AKvuyHpr0RmO4vi0MxEgFVbp1QRBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBv83DEOienCFSWXBdd208ajXKHB04JfpItSWUfzPotSj/b2lS
 OLvyx5duCAf9LvdGgIyAzlb/XRON2SC4oFmwSD6u2WpthlM1aErOct6RHs86TfA5POwUJfSa3ik
 +TmDTbnsKu8PoEInFiEar0uNIfhQTxBBwl1cUMgQjpUCvWRkGDe+b7UFehjtA9AXWAOs=
X-Gm-Gg: ASbGncvl6n0abLcL+nDu/6cUQtQXI2JtRTRlQhXXf+9TVYg1B8pDi4FvODffI1If5oc
 42BpFK7Z4RKVhhCPpLVSzWyhi6/d8+w4jS6hs2x0/ERN6S76ZCmkG3SIHh5PieJiWtRfE7r7/g6
 sGcPsGgg1nKs6KVRWuE49rgRF8CrnOrwCSZVEdyG47E3+13SKo89Phf1h8zBfFKRG92zQP5Qp73
 oUsoMLZOgsdaglmgP1bKLm9hBualJxSztT9eOZnc/COVVcj5RWdsNbtGuoBpECZ3tNiqXTHuYec
 yKquu38ojngau/CuNtGRrKSG0vch8m+O9SZ+69CoDsVeJMmRikcKWqoWppI6v9E9gqGDzh1qTjl
 BEpB+JlIRY/7Y6hMRpfkkzA1N
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f230d950dfmr209919716d6.26.1744709982017; 
 Tue, 15 Apr 2025 02:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD83JrRkLeYEAhElysIxFYiO/qrqAOuHzc5Obfv6TO5nQKTCzkIT8H0zCFaFZ205TMR64XhQ==
X-Received: by 2002:ad4:5ca4:0:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f230d950dfmr209919446d6.26.1744709981708; 
 Tue, 15 Apr 2025 02:39:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:31 +0300
Subject: [PATCH v3 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-3-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/o/zTCVhoZqo+Bz7P3TL5bcP8LWqHb9WPmSzRN/6Mx8t
 JRtt11JJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmEq3B/t+n82fyAwOWZ0dv
 PQi/YfRnoaUis4BRVXovq1edzsmEqUVHTrdOvs16+XxRjd2kRFfpKnYrr3s/Sg5n8zE+vRt19kr
 emb2N7Hczpm7uPHs5a8Ozdt+nsWZnpopssj7n9ztevHnXqT+KM7bJHD9U4ZDceeCz3UZJxqhcY2
 bfKZJHtx0J+unkeXSPm4/mvxRFo6DpBWrLlG7E39CzPrSUUffJtip2YckvRx9dFTl68ax/rjRj/
 rITUXJcKVqJTgevc69s124x8WP8UtfY35m3NJmb+5v1HSOB9Wulv7/psJ691q+2W5pRoniGdIzb
 oQd2T3rNquoO2tobl3n9+WZ2iC+twMVggef195KsnoXcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VsexiQ09ulrFlmr6PVBO1A62U9kW7j-O
X-Proofpoint-GUID: VsexiQ09ulrFlmr6PVBO1A62U9kW7j-O
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe295f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9
 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5

