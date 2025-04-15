Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC835A8982C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E221C10E6BA;
	Tue, 15 Apr 2025 09:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SB6nraEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727D610E6B1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:42 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHdm002259
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=; b=SB6nraEnl5B3L6i3
 XkVG35p0i6+ofgk9E7yggVrXfq0r9Olv7vhSl6sjdYC0ZCA7B1xixp2/xcMDlUEs
 PwUnsLqpRKCNrAiqwhUtbathZVEwNg4xmRrW4XaeI5UeJZikPC+7g8UMutqOEqL+
 EnvQTtx64givPQ4YDie4CscAsv2pgVPRELlB8ZiTiBVR2Go1EKpSwMc97UJTXT+q
 SFiG0Agz+IIA9aEBoHebc3p1qK8k9GPDkWcwCkT6gEwX+5cUO71SnQ/RSoQHw695
 sEtieM/DUJmqBhQUGGpi3aTwxd68nE4l0OYbuk9VixsoQZhWp0q3X5Ym+WmsqlBp
 yLuR0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfmb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e90b13f5c3so107723446d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709980; x=1745314780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=;
 b=aZ54D8WrCzThv98wq8j3PEOnjxFhMaf88bx+ZqeAkftv+dCFNwr+oTnvG7iLm6MWNo
 wYn9ODQR2tWJBwwSIh323bSumfsupGQNE1+NsCCTuY8l3qSoBFyXyNouOYVzfuXWSLVh
 0MU609L8f6WGICwc4x5WFQF0TH+caw4aj5m4jUBeiixD4iOZiuJuT92TGlHziHbjNVhO
 xSMWcAMCWbPS58U2l/ee/e/lJkwwPrAhxpbX83DJbC1GWA4ZsO6d2xcmtAsTNKFs7ea6
 P4d/YdPK6kHnl+oQwmku/9Ba3qkYq2WV8b+tEJwDjd791dcdaTiFWjuNwYFLIY3vKW14
 L+Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2QeiNDRS7OMdVHt9371hNZj+cnNSifxOhU7wDNLAW8+nJDPLT1AU5iVav09Y0put1q+48tzAnpeU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi80FlzXDdBg37sPcEr8RraxHyl7RRh+lGjRnGPs9KJB+YmYpD
 lJOsKRm7b0hfVgjhCsyLQFfLCAgGVX5VrnJXDx0LDxoOHtxM6fCxXTKWwXQU5tBlhQniI6FzXok
 NUZAKoWq4pJ5wob+lzEdWXJJhoooMImT4MzCNm9rakve9vsTEH5wwJnKQX1QAcGU139M=
X-Gm-Gg: ASbGnctp0uwVGNIIu2YZ1SfbgE5sCjpdVQv0ESY2vwFXpUNT1gNRVKB5eMNkjg0SFo1
 KlAZ6z65j89TQjnr8p5+VMqSCuKwZQqp/wqX98q3DAYRvr9+Fa2HQNlG9nLIu6rRibsos7vbltF
 feX6+097RqCsMTOZ5bOwqUeFTnfLG7c0ek8adC1U6B2DzraRo2Ng3Uvq6b0sc4li4owXFZKjKtv
 iRQrbA6J0hjyDnVdlJROHxBS+11fAUVdsagkAhJMA059rRfQv2kTLSirbUXTTa1JGQLHyY7YiiK
 MMAZGOQEmJzYMxlTMZ8zInffW0pm/VN35CDKDWaOZSmaWOSvfXs6pW8VzQADPkiJp3gvwQoJ9j3
 1CAUsIINQikc1IBSPGO6+2RWY
X-Received: by 2002:a05:6214:19c5:b0:6ee:b77c:7dbe with SMTP id
 6a1803df08f44-6f230d27c21mr193434216d6.12.1744709980641; 
 Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQp2HjVEeO0ktbov4KZJe4bJnmpotAkHqTPZqWnlxP97B4y0MeVgdf+Bpf8V/w9ZAnpH3sOw==
X-Received: by 2002:a05:6214:19c5:b0:6ee:b77c:7dbe with SMTP id
 6a1803df08f44-6f230d27c21mr193433886d6.12.1744709980357; 
 Tue, 15 Apr 2025 02:39:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:30 +0300
Subject: [PATCH v3 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-2-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilVrA3uEJ69v1dp520K7RYb5A0BSH4RNdJGh
 6YpzIXJKguJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVQAKCRCLPIo+Aiko
 1QQNB/46R21cEA9UsOBhj4cdENgoT+GeVGYBZ6fBavXGRXxth9LvnU1MtN5c7S5xOWGd35PypCf
 Ley8En0qAy9vAmGlD67vkSlMr+Om2vHCk5Kxt70R7aWAf6Y+cgc0jId/kpzTz6NP6h+8YQgQnej
 rff3dPK369Ff76/b7EpPBxWhAamZUdKBsrp0KHxaryppLO6veyz0/plFD7zT8NVlPGrdIBkxImv
 557qYxNphcbJOfHkJnUmFlpa84lu40XmCGNAeq3zRzA/5OZf9JvwC0EGyr2TwpiuLYPPHeVBEk1
 G9/qmCs2DRVsxt7TRcvid3UlGoRcF/WHOzqCcyARtgc8WmE8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eVV5ZIDFNK6vdlgeMFxg2mcnpt-RIlRw
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe295d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9
 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eVV5ZIDFNK6vdlgeMFxg2mcnpt-RIlRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=937 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150065
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

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5

