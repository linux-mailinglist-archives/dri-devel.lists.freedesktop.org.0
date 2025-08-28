Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA0B3ADB2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C3610EAF6;
	Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0dy2w/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E079E10EAF3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWfFY013591
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h4xG6gxGmUBVptNQ0Jx0EnSCowy9k6fTDk5k4/UIYcY=; b=p0dy2w/AdUiCNHf8
 3UWigGUTlIHNV0HeKwUGM09SoLtV5C11mc+2F9eEjurw63RC6FNozXI2wNylIyuP
 PA1xlK5lClKyOJ0Xkn5TCdK0z++9nr0Bs5Vdrp4O3L/VFGdcLjBvLmklws9q3RVj
 Q67ZWtiyAp0uDquksHPJspV1+zAJGKtqXY0zVaZU6EpLN1RIrnxAwZUUIkWhRC/o
 uR0qvU+60rYyVDNqwcECSCjdvTTWPtpduPB96+v6yowcUiTUS3Rj+sz6N6Yx/5G1
 QBfxguQG1ew7YGLS+Vi4mC1XXGmMC8QqcinP3F7duSYHEcVBZ6Vk1YWiFXBXmPya
 5ChdDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ssqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70dfcc58976so15122676d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421303; x=1757026103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4xG6gxGmUBVptNQ0Jx0EnSCowy9k6fTDk5k4/UIYcY=;
 b=MzalowAKZHIjeXGrqo4BTtDsUMih/jei2GQXdBLSDKbjsxyQ9TEli9LOhRlOKp0x/B
 fh4n8H8kGdhSAR7ZG7lozZHX8GFunNaOO2C3gEmIzxcWf6zP7FBRkxkLVMyjQwmhFrhk
 IG7/hlI812Y8z/6BR7R793tIeFRVDZ5Ta4wKvvWL2eIIo4uupsQZZvT8r+m+utoArmOu
 wDoviA98ioAlIrzWy6cpLGzIAlfl4zibgiBsteJ9cE4KG5pmiV8XMGTRud6yeK6l6rrI
 qnCnqQSV8dlUtKj616ng+E8EtcvsFGtPnm/zrIyGumaOhm0I3iOuIx+lH1x60Jr11r31
 EJUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBZ809h5gCe5GWuJc4nqZD8vViYxogcZMOmTkK3XOeYIgqM/ui9U9dHz13PeUbzJzBPGxqZUCinUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMbZ1Qf6+9zznzwRnDHDtoIAlw0Zf6Qf5xAa5fTP/+y5d9Dz/R
 ebsCSAjHAqtqLOeWvWJv40bairuLtje7oNcHH8vQ0HdkBkTLWZQgaTtheD8TrNfhE5N80P2y7Ba
 ypejBFBJS76SGazvgQraHSeSJwyHTtq+wc6Mhx3LcHwggYgzHJugJ/d2e9c13lPqup5gx7ps=
X-Gm-Gg: ASbGncumj1GNarHgUtifX7iGtJJ1tudMxUjwhhhNDVYa94bz4MsJ7ydEFFzYTnmNw5U
 Hh/DMI7wBCsof8hdZrx25DoH/M5xr2fufG+7/s3dnhEER6oaQNj87bdQ510iTs776EvJ7bp17gU
 9b19L6+kvbuc7qHFzLo2xXz1NkSRrTq3AmP8PC/9CuXWwzlHesGTTMx2Q881qqiMzm8ScKLGjVg
 78kWu8R2ZQCNWvVyYf+nR+Ov8AWGusMQMcwWB0DYb+6zjBH5fAzxOgfJpZvxbnDKzM4xtjDIiL8
 jvB5otrkzSN58tDd3+72PCzCtJ69eMcmhFERLN99Es77ywiO+XuK88KoXigPsVnQ1RDblJ9wUj9
 X4C8eT/B8dfryeZYjwmpT3WapOQan/YeFfU6O80nQzm95KzAJvoPI
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id
 d75a77b69052e-4b2d6071a31mr191750421cf.37.1756421303033; 
 Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7cyyzQ3Kf4dK4/z65Oa9WK91ZkCYZL6Cr2V249eIGzQpvoHtsFVnZjw8wzQhViVcb/WTnA==
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id
 d75a77b69052e-4b2d6071a31mr191750081cf.37.1756421302572; 
 Thu, 28 Aug 2025 15:48:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:15 +0300
Subject: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/sz4uD15qfpeXM2kvdoyrlAbCsNzt6KQNu1t0VjLU08=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNywp4OsQT1E4CJI1lZdVPf8echcYqGySBx5O
 omJr8Mg9UaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1TRxB/907NXfImpQV/stpw3mpwD+8toHKtrEP65UViVPZgbNaFMVOcWCWXVHtfd/38lF6hBoYeL
 +qI0rggASaXPpb+9wEmSjOc5GicpROgbZrQkHOeJ/qq1MYvUDUWV8tWLv32DXyB0SjMIXAwrznp
 ploOqrU7WPiFUvV9zd6xH7/UXx8JV1CLp7qzP5KVFDcv5Oi3fVgsf0udNb1ve37U9e1kzxI8FYl
 oqOkdADnlSv6Ldurd2msJ3zek8xyUST8a6zPGMsXCfNLCzneUl6TxseK0Zn9TIa81DB8RPhGTb7
 GCR/SxpE+Uy6qAwBeCdAfLCt1Y1c8u9NaYgdAtoPoy3hHv1G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2e+E1K2/ZNRO
 FpKqdVY3DyWQueXPL5tecVavaeP4irSDeag6z1OBQlumh6PlUnEwTnAD6qZd46t+jI7vR7EEPBZ
 1jLR2NbY9K4q/Xox+oFrxElk1unu1NW5cZqGGicpa++Ttsl9HX+JaidJIKTZubxigv4Vq1/+Z6T
 SIe6WXZjXeDPcAH3qdz5WjJWEdDviTeMf7h6NU6zrgmqKQ4vKkNYNFxWLHg0TF7aCn9LUP6UOMB
 7G6/RpDWFI5pZUlaV6UzI4ab65ArR/5ewVm2HGSnf+vZrzmDGuLk/GOUIWhauBJQeOtpV2+wwD9
 hVXcKDzX3UkQ2qzv8T6dfNLQ+UeA/X1fY7ZnH6+JQvTft8Q8NwJtlu534hyxcr9bVP3bDysW2Xz
 8jUQEZXK
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b0dcb8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MC5GR9oWvUQqojeRwHkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: hGSmBCB0nd5D_3ncOIuSg9bPNty84qTk
X-Proofpoint-ORIG-GUID: hGSmBCB0nd5D_3ncOIuSg9bPNty84qTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

The SM6350 doesn't have MST support, as such it is not compatible with
the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
(which belongs to the same generation and also doesn't have MST
support).

Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,13 +31,25 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
-              - qcom,sar2130p-dp
               - qcom,sm6350-dp
+          - const: qcom,sc7180-dp
+
+      # deprecated entry for compatibility with old DT
+      - items:
+          - enum:
+              - qcom,sm6350-dp
+          - const: qcom,sm8350-dp
+        deprecated: true
+
+      - items:
+          - enum:
+              - qcom,sar2130p-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+
       - items:
           - enum:
               - qcom,sm8750-dp

-- 
2.47.2

