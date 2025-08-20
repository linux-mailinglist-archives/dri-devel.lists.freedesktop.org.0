Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6806DB2D858
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0510E386;
	Wed, 20 Aug 2025 09:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6ZzACJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601E310E6B2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oemM027716
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lfdbDDF0iaKbmDjAc10VCP1/rYHdufYQTCEri5cSINM=; b=c6ZzACJ9ntzGn7pd
 F4Yq/lTRlsaCdklIJw6c6npphgDFDfNqymLrq7dGBs2GWKk0poBKof8gjfnWh6TG
 ZsE0QPKZ0JcTsTkKPneiTRnaufKaOqgjMSDmrlNlSnGITiWNe4wIP7Fz/YhXPpC9
 /kGUBHVxBZieZZt4XPU3cAWhHTpGAbmurdmkt7ZKPeQKftuCRjxXhlYcKWZNHOmk
 1OcwLH+UL+0NgnPks1OiMbgRaQYpRTQVBXBrgUshD2uZUmfHnN+4IzbwUdI9xxO0
 fuEFaeuqD2+EadfBcv9f4JXOYIbGjnLB/3E4aqzgtW0sbsAnYNCOxWkwDkzrQ7Fw
 IP+yFw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52as6b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4716fc0a8fso1822079a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682539; x=1756287339;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lfdbDDF0iaKbmDjAc10VCP1/rYHdufYQTCEri5cSINM=;
 b=XmSl3/qF/eJsBdfGSZcMcoOYWQO2Oe9agUZQ2K6digouGDGx1bfUo6NARTjvvy8hBq
 42Lq4UJI7KKB+PuUia2IoMqpGwq4eT7uk3acmVW5qZ73kBOl4UtEsaT2RvYLBbV5hSKH
 9cCGKIrm5SboX/rub2oueeNFHSzuY4QQliLIoXVoVSZoUq8stM9s+utCZPsfuXRdAqst
 BajTcXGPLePvco20rh6Oeg5QaIWdpsc24M70drb/Rl/ueEmnpO1YYIIfnlKTzNXsLpH0
 flLmvTrSyw0jYSbbBgG113vXArIapr0AiuTZGsONKbvEJbDuwqNG5A5LLwR/6FM63RaQ
 h0yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa5BNkXGYRDAhkkXkqmAEXL46MJuexKAZJStlR0ajYCSZk4dm0DzPq2TnlR1I2relJ7o5jmyHWJuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvYiqkGnwSrYNCkEqUfP1akAX3o7o4Tg8c76ZcC/Yz5VBtb6NB
 68EVjyvN7iAOToNgI6+0DPpuN48my9ZZvdN5is7HZYtNY5qhgxCMWV5tG2gfkPC7sB9MR0U5X2U
 vaWBsKOBnGkv5R3CYqZYhCu6ckCyXbZMua8WwYVYxDaPhi5o1fOdrTMkN0uSJyVH3f3m0uDc=
X-Gm-Gg: ASbGncvX/QkpWHNnwBwBMqwjmAq8aX5QdpomtWXDtnaDaQ5XZJCxSxn8HthAf6pArxz
 WfHcft63eZtVGJzbyt24bzXIUAlqsBnKqfb6OWHVQMAmUZ0STm31Y2Q3PMI4+aIAxdwyQqXUXsM
 6iRd4nJFVaib5/uhczuvPHgkOMfpHnJ9umtxe9qAkh1quOBIFy1+YaEQKrUBvFEL+2v7VpLtzwo
 8c7gQj6oJCtHk1+sU87tqESM364kh1fZSjFUCzjZsE24tPmFJoDDBC0P6AwEz+/FB5+RnRTg868
 ONMNslLqqXf609fXLZYgYd7h8n/H2DMtGwXaF61Hoqs5jMMjREfOGdQ3OckaMlE9ofWdXa/HO80
 M0XxA++Xf6F8HRKoOEPLiJP3EKDbQ7Q5sCaCN55dHxgMbP3QqMp9HQowh
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id
 d9443c01a7336-245f85c8f03mr878845ad.3.1755682539166; 
 Wed, 20 Aug 2025 02:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGruFqyjDNjNZap3tlQ1QMYvoarVGmRE48uLqorBf5FfkGpP/sCgL8kWEJHeFetKvlW2BsAQw==
X-Received: by 2002:a17:903:2301:b0:245:f85c:8c6f with SMTP id
 d9443c01a7336-245f85c8f03mr878395ad.3.1755682538659; 
 Wed, 20 Aug 2025 02:35:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:35:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:43 +0800
Subject: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add sm6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682519; l=1064;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=TjE7e881JVJnbF2pC7aHvYEjeplK5Jqgj7gdtmDIJTo=;
 b=YwFU8m0AxT0KFGHqI+UMpcgWIIE1IgQqEACZ3mvVMDlXo2yCND45p9Q1LVkk1fS+g3Vf0Oj8h
 owjuMU/XXy9C5rqcHiom1RQmoTnCAwpm4ldZajHq6LLdCFeZzebhABE
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwnvyEPAbOaSw
 nLmzCT1YrsAM+2KLXwFam6momPE6I1dSQ3ELWyuuSYham7FXSp4ks/rdrMRuZC/+A4GVMN9+dmu
 ftLSJoCFf2+dW8uacaVmYHslvX/RdN0jSvMNr9B28c3qh9H2s0xwyqcw46o4chgsZZynLunE/oS
 NsrZlcAbk1g2n31zFR36KsByGV7oKrycJcCY0V+ArkG6f8Pu5WtWM+OW6JsUZaU3+5N6GUqGwLe
 dJepf9av1S+wrqf8fQeeMDIOCpJuow3wvHwDQHGc9xHjytBZ2bHVUBSieNOv90/hkcndXwGvedw
 8HIXTCmsgvDLSV2Q7Fr/WXBI2LckQvLIjm+gu0HDFQfZUxKtkp27XlKBDaO06NmexZs+4cNdCrD
 iTfzHFNmYw4kESgClx8oQdS/4aDnFw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a596ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hz27nZlvLZz7BoqxLNkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: i5BQ6li9UGA7vljhZabNuLxBuqK5ccrQ
X-Proofpoint-GUID: i5BQ6li9UGA7vljhZabNuLxBuqK5ccrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
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

Add DisplayPort controller for Qualcomm SM6150 SoC.
While SM6150 currently shares the same configuration as SC7180,
its hardware capabilities differ. Explicitly listing it ensures clarity
and avoids potential issues if SC7180 support evolves in the future.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
           - qcom,sdm845-dp
+          - qcom,sm6150-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
       - items:

-- 
2.34.1

