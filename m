Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA9B281C0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5076A10E96F;
	Fri, 15 Aug 2025 14:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkuVGHKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046EE10E979
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEKDTF024029
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p0Dga2ququ/iz0C7Gew/O16VrwuI8lG9clwmw5naUV8=; b=CkuVGHKijQzWfx5R
 OhtRYg8n8j7M+YBvnJkBGk/dA9m1ZY8m0wTtl3B4Y2uWCdo5QE8uhwLa4y6sZ5ZS
 B6Idoi7x0KRLt0FNqhKPsyozkAbv2qmkF1XWXUH1Eg3y8hTe7wzvJt9Uo/zpBfNd
 OmWE3tnewWd5nvxZREv1OPM9MPggCxCaG8kr+i9n2C/6ki9Y6hLa0j5297GTsVlz
 jDZSXCQPb4v9nCAtwiCT4FB9MeS7PEFFRzFKr1LMFeLnkU4uDVe52J9z2zNsuByV
 KM4vjkoMxtS/UrzPOP685W0Yf4qQOeB1gGFDn1KGnsiGvXkH/n4rDbQuRHSI2jDU
 rUQO1Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmk75g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a88de16c0so41430726d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268242; x=1755873042;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0Dga2ququ/iz0C7Gew/O16VrwuI8lG9clwmw5naUV8=;
 b=ZmWNz9zSiKWtpuha2kw7EQT8TvvbPjDnYRxe+MukkBn2uhLx37xVXDygO+y8GgZ5NB
 oRVpwSdf0WxLQR/CXyV4auMg4Dkv/Xs4q3t4AJMHDE97FHNnaDKzEvFvBgoAJVr9mBjP
 qoNAdHlX3OvYtLsO9GffCf9NjH/S+yRH6xvp0wIykfQAcJpvUeK+iSq6xkgMmf43YTMk
 Ec3GYjYs+W6qTonncuHkagZaZ95REn/HiLqhK4p2RAwms1MJcf1cwjrvDuxrNEM+XFTE
 EcDoNOS5i8iQ/aUNsZCh9RzLY8OJriuqqZrTrR1O9TeJQ6TVh1vRbZTdPgkKcrerShto
 ZTtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXadYw8+gtlCzDa5zZdNivT+NCmtF4yFaVRUe+2bOYPqCo8nhMUy/fyeD0f0w3PZV+u6GiQFFtOcis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLERJr7mGBPXUp0Xm8sSEcWX5Jf3KCCqb2KJ7hndjPeiU8T1HD
 n6SKOt4DTIv7cBZ0c5ANI/+GU4v00iGHR7+ih8lLDbq/egA3MJdN6c05+Ugvf2mfCy9ir6zisw9
 Jqr7zWltoSbas0EOZu1h6tW5CjS2wWll+od2S5/qpJzlyIySyZo/RUIGEH4AYNEkvco8ygp0=
X-Gm-Gg: ASbGnctfSGTe8uIkpzln7iWPTF7JhwS+LpO30Ozay1RsU35QrVaPJS/1brwtFmsuiRi
 SWpxo8eQHGExTq3RAsu8HpOTgbPJcnhNldDctrIuv4g658ETkM1IA1HIyi17vUU49/5yI86/rXu
 usHy4e6F7eeQz7NQwVlG0nG1zigRH9Hnc0/TEYi3L0oC8ciAnWQoOZ47cnxpXvWIHz5Y20IqK3p
 degNI/5jg8RnO/KvaxrwrzWOOtsZmL9NnxjYpJ3R1TY0dD+VL4pSU4g8HoSDN1VM71eq6NXrADf
 pzmMkzUU7nqOmBevlwaqkzL26OhRvBi9+L0NEc08cRRkZSFILfbaIBRkGrLM9NDKpY/sBVl2jyl
 S+ifvA6UpNtk2VyAox7AYFjdPEamANQF7zauZiH97ghsXEfs/axIT
X-Received: by 2002:ad4:596b:0:b0:70b:9a85:2cad with SMTP id
 6a1803df08f44-70ba7c18289mr25048746d6.24.1755268241379; 
 Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbsP3wUZjJKRwWIURXbOZAQ20XVRCrWirWqOKB0kfzOToUE9mXBEuKx41mGrXm/2dIDmhmNQ==
X-Received: by 2002:ad4:596b:0:b0:70b:9a85:2cad with SMTP id
 6a1803df08f44-70ba7c18289mr25047686d6.24.1755268240622; 
 Fri, 15 Aug 2025 07:30:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:30 +0300
Subject: [PATCH v6 3/6] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-3-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kzfz4h3GQy4csg0TV4VQd6f6s6q0jIGQMAOr/+KricQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHNIR9djh0MjZ1tAnVRLTcBlTqr7v2pS+fV
 i55+ZtmNFiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1Yz2B/90KDCp05bcxoSE/R5Ptv0P1HM2cMyhnRTNSqf61aZa+Zg0T41QAwIA/s2ruhs1y/91atp
 SSJdoRo4oKpt0xbspUUvsUhu/Bi5d9Y2GtFcY01iOda3UGCVagrzaTyrl9qgw+KMqQYmAX6/QyY
 FWzB2oEllczxtuqa7SF96SqhD7MRUZ4IHXgZpMJsHql5d67w4idjtto0Q/x74OFAu/SaF+EZhiN
 1D/Pma4X/LHFqFde2Aubk7T00ovQH4hbOlwyNa1XQA2SQ/aFlUWtax6F6Wa4R9X1gO5kFOaWuU/
 e4Hm496V3GKBtyX6Ha6kelAiIIfycSCxXblTDJ/gVwLixQGZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX0f4EtD+lNz6b
 fXnb9LgNBgdCVmgtG+LPMYHynsA97HoEPa+/QYBZcwM2mEhQE3I9+xsXoYH90XY8Gj7Tz7SdVh1
 nBMgDTTHtaMcnLmppXPDhdsaCtjqhZwKt1Nz92nSVEDMoj0V7Q8tU8Mgd2ook0nNlZzBEeM8VxH
 SEpCKqxYYlHnwlsbDxMAlQRKU9T7JXLjShqXjVidtbTnXE2q2ZCr6T+2Z2kLv0lZt+F7Jgpbz1i
 dOyzAjm8l0z2cZ3qIrv4vsvogVKkJtjbs4FiCHuc8NR/2seXzg4AnC1FOYMP/HlBW3D1TpE9b1g
 OEp1gM1l9uAiadER8C3mbPYYJG6AuBE+PphLuvQlD7qsZ9YPMKk8umTl5AA+8is3mm4IOWR04Wl
 9uMS+hNd
X-Proofpoint-GUID: WIx3p6JV-JgOBwNIHOmJYL4T9sH8iEG3
X-Proofpoint-ORIG-GUID: WIx3p6JV-JgOBwNIHOmJYL4T9sH8iEG3
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f4494 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add X1E80100 to the dp-controller bindings, it has DisplayPort
controller similar to other platforms, but it uses its own compatible
string.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aed3bafa67e3c24d2a876acd29660378b367603a..55e37ec74591af0a1329598f6059475926fdd64e 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,6 +29,8 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
+
       - items:
           - enum:
               - qcom,sar2130p-dp
@@ -180,6 +182,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2

