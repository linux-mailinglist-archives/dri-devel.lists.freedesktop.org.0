Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1FA89825
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0D10E6B3;
	Tue, 15 Apr 2025 09:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kL1zVUfr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E86E10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u7dx002933
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=; b=kL1zVUfr36rU/fJ7
 gQxGIoxK1xzW6l9QfjImDxtZDsyxJ6w5NM/GwM6Icwwbw4LhjIFVSzg4tDEQxLzy
 ZInJzE86UNyLBVRJTnah6/HZuWd+ViBReweuRJZOabYyjkZFOO1xFNY+poe3vcpO
 NO2zWkoEyGSZTIIidN1E1frh9X4I4Xp2Tcspv1FpprnIH11Bx5WFIkTTHQAQ3vir
 lfNamnQhQp2WNBPiMKkVs0J8Sd1YB/hjs2Ar2sxYlyOfNnILoP1ns9ybhudgAcUE
 57Uug6jGStzbjOAxVIjuQdF4wQAt+S+SEpPy7hhwVr40zENL+3oTEYUU2VUz6uIt
 hzzNXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjycc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4768f9fea35so122653801cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709979; x=1745314779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=;
 b=LQ9qJhPGRGk9Pr0zZ2yxrYy7XOUlXFiSXtyUqBkKv07mEEpheJqqcJ5OVfMGhAiTnz
 onHpEDe4DXjN6NG48tAIRZEAeeNozoOTxnPbVE7JGzfXjM2TvJEVws4mhpUvZI0SQkL0
 XDXspexvzl2Pj7/jmsCR5q5Wjsd2IsgNATBJ6ktuIkPQuWyf1/a27bKKqvWVFu5g9Mkf
 41Ipzre+gM85gIbtLqYivxy7NvmQX28jBltPTWj/Fchbopv6YLbcoDrBmQoOUv2YkX8r
 fPBw70/ZAB1ztlpYsDKPFImwTZfLdhfo/GNrhr0+dWL8bFzQdkpzal1WC4r7JXbqKNvb
 kYOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURTkNJ1lNwf/e6SM4gTB0ILvuubb+hKjW26ubH8g+mSjGJ21OkyE7Ivk6OkWPmdCtwYF71ZA327sc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlfEw0z77wwreoroi3FWNmwtOQUiZ6QxlsEQb4nt/ErloslMG+
 J58ySQFUHoQLZuzvsxWPNSkn6cMihYFT8X6LVCU56HztT8vKQlGtbsE2huNBvFzY8sUR/lNWPeH
 E9D3d8kDWsua5VGuVuhJ86ltapktjlEd8CT/SEpaUo/+undYCP9nA6soLk/OkSj81jX0=
X-Gm-Gg: ASbGncvQ9In4UIrTOF7xDghyxr0c4eSnOYRbDWZEBYW9c6P96OlJ1iS3pZYK7zSwRIP
 LCVBS7InRZ43i8Tqi1txuvfsewLbp9vLfYF5qiKlLwKRG0bD0vHfCDNpDVCRbgE66MxPu6QpaRd
 82FOMSJLAClf/NWprNrPLCBkxWLa1kt8RmgDV8ekdnByls5mhNfoorXX7HJsrEm1pAbxRBgi0ZF
 1yvUp/SzRnegSAGC842hQx956xsnZgEMxDAR3abY8Nzm+YvguwSMJK3uVROfJUdeRfHxVLfsnOi
 Sk+RJfWrg0sm4HJCec0/nWPex8zkJmbWUbzVCYb/12vF+7jYW0cDO5XX9YjW/Xy2tHiZpkFzBJI
 OHZj3Rs6T46bCyA0KSQSYxtZy
X-Received: by 2002:a0c:aa05:0:b0:6f2:a457:197 with SMTP id
 6a1803df08f44-6f2a4570302mr17557766d6.32.1744709979226; 
 Tue, 15 Apr 2025 02:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8HQSOjLdhDHbjx7MvKXFQUeBcuAVyf9AOBVsTgsUZ5CPpSKyGS2MuHBbgjiijyBhmUGHLfg==
X-Received: by 2002:a0c:aa05:0:b0:6f2:a457:197 with SMTP id
 6a1803df08f44-6f2a4570302mr17557576d6.32.1744709978884; 
 Tue, 15 Apr 2025 02:39:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:29 +0300
Subject: [PATCH v3 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-1-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVM5htI38HvCqRt9nmZdp5w/Rq/WsUjy1Jg
 k4ECt/1uxWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1S1RCACWIt1/w4yRBzi/5jbjFt1pJ+46EIYDCwGfet0spVeQ215ieyx4/27ucKQt9TBgzz+voDd
 TWRehj8HgLrW/C+JaCj96Seq6llg726XbHB+/sMhFDhstlhVb6yhJVnnlYsJGJREMxur9gvLHS9
 dIOdBe0Ilk9x2Lbd1icTCOcOPaDGNSMSTJBi3hc+p85r7bNyeSqrrrt7cx8VH0IB6KaRxPVcEu7
 HXtJE7m1KFrefpz7YjYN0I6A7zhWcfgQzFu7znRrImeQP9HjVUogsN7B1pUkd9ezpVB5j6bA51c
 KCXl7IM4ZOJN6IiHOIJHGfckVOJledcW2qqRlPyPd4SRN/zh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe295c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9
 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rsk26LaxVlBz4Nrif0cSo5y6na5oxCcH
X-Proofpoint-ORIG-GUID: rsk26LaxVlBz4Nrif0cSo5y6na5oxCcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=998 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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

