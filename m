Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD8AA90F43
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 01:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E298710E9F0;
	Wed, 16 Apr 2025 23:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypmt7D8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC0110E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMFCW7020644
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=Ypmt7D8HkfGahof3
 uLHNUAbjnYGzyfK9/AP5egc4Ntryyv4nlUMLwZtyigudYw1x6Zdd2kxp/l37TNUS
 cwmKftw5nfrpm4qTs3LK+JTz6DgfZVwRQlkDLNOG6H1mz/AGBs0arbLvfTTebJrp
 SsGI6LlKzUmZOTrW4dlxUfMfD+oMobw5UEKhmkgcXZ+3EDHwTLCBXiBujVfmKhbu
 K+lGBO7Ir5bjF025AydkFLtm1d192V5fHdHsOgpT3jQAeYT2UxGaM4GE4f5GxRwy
 no7sXaeNErQxjSBycevi0oNqEjpSDttSK4YPsxe8l95pURHF8ek8uzsbUysjDQ8J
 iJDtkQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wn1dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 23:16:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8ed78717eso3425436d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845401; x=1745450201;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
 b=UwBP/bJV9eAtotyFeYosbb23DKjxOGlNrY0doGXF+OLlBRMPvoCOfGgPqkaOMWXDu2
 9/aowd0wvwfn/yk1GLb8E9/8yODrf7L6TB7zzLDlx7CeaPYJoxS2la07oJSjYV8Y6usP
 4nTWHlG7cBcKk06FRAgoz0BUYvqX/y1T1Jrk6YthqNJaJPp9MEMKC5534WkyaXJByODG
 cdHBpKNQfMrS3wCakESkP2SbGIYqd/5OI4GIDI+6cYHS4515vgdU7k+MZ0xGIaEwDMdi
 I3EzHY2J1toW+Xb+ukpaDwTTey+oIdGY8Zx8gPyFutR75zHTIiyGbAkEDw88e9+UsEuM
 eBPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7buV5CnKl0Kq+xPUaJQL6AfONwBJ03QhNjjMaQvFDdltji6hR5w3dJgXpBL9IGWoLq6vTnEkTZck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0XrLDa0DEACGBGXXz3hhL98E4CHYkU56AtLbjs2q7i32WAQiH
 y9ja3mjsNvNrOJj1E67GR1Z3JAdU+XBp4H1K/RZqUUNjk+leizm5O+EQBHMWbprGAA1yGGMAjLT
 gBaEDbK1lwkWVl/cUN5dJifWZ0MRNq5GmBQCpmYMNeIIt00f+7W6dnTcbmSjrarwF/K4=
X-Gm-Gg: ASbGncvWPLtleT1TnqDBNG+/vrDGlEqthimS3Pv6cA+W5P0q7lYpEFIn4yKo3XbzRHu
 b7T1B9HAhkOBYgt1A+Qf4Bn1REJNnqjR5NuVq7xLm7n+tL1L1rKtTXrGh0fH2ZHKw7TvDTHOONl
 nFOtqEeZpWesYgfOup4iwWX+rISbmZDU6ZYW/8NZKhiwW9uWQ35QSqCSrrgztzDaU0lbiim7ozg
 KwDpS3i6CtEUfjoMRjsfZIXn5moMlu9w6OHZFsVz8sIqs6HHINA8kalbLKvJFhrUjNuOb1673O8
 EWDIChlFV6tI0DcjrDfNtmYr3xH7B+zFDNn/XZ+1Xopy8OCpMSjhREvcHaBo4G4XdGVdI2FKvLN
 qm2JM7cSZaSm16lYcmHEY+5B/
X-Received: by 2002:a05:6214:21eb:b0:6e8:fe16:4d44 with SMTP id
 6a1803df08f44-6f2b304b384mr65723916d6.31.1744845401553; 
 Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFodq3zesjzB5AD8ZHwYudSr6HtnwZ1FwskPTmT7ERKcUtRooBLKijOcL1qw2PrbhGDKECqzw==
X-Received: by 2002:a05:6214:21eb:b0:6e8:fe16:4d44 with SMTP id
 6a1803df08f44-6f2b304b384mr65723356d6.31.1744845401109; 
 Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:33 +0300
Subject: [PATCH v4 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-3-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpRqFeCbsoSliYom6fgv+FNrJxUdOL9SE2pO
 L35U8RUUXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1aCzB/90xZfYQtLjQ4Gcp/7a+/k3O6aBnT1+SEVNnkCFB7B2SpWZzM4FKoNNzTmPAdlxNAQ6pV7
 uwyyP6e5IW24Rz0J0GVCzdPCyhdxL3OHl9yko0VdElC4+W2RkCUXDKL94GyolrRmU0GG8WtTNGX
 Zp0jcL+mKLfRDmJk7u3kTpsVYiaWr0iSYhZLOQa0e/yoTMlXZ24HgA4NpbP9k5si6mJeXpxQV5B
 gwkNc8wbu8flZkg93wMvWjvX0kYwPbTZfY/Q2jXkJGFWsk5e9E013W65zVfCRoa2McSCsXmVSL5
 /W1ToGzJRdarfdz17vfvONGPGWfUMZZ92wPwjQkStZYyWLU9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68003a5a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: s424fvJDzmn2AxfEMaB1GucamyIy78Ov
X-Proofpoint-GUID: s424fvJDzmn2AxfEMaB1GucamyIy78Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
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

