Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535DBB2EC0D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BBF10E864;
	Thu, 21 Aug 2025 03:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCHRZkIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863A610E865
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJWA5B005798
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=; b=HCHRZkIerCrMIhrc
 87VO+DoEZ6hB0/0EeyyvC3X4A3eGq5t6RZDk2aw6QOCt1EYvaT+EYWhiM+LE0bnu
 jGRnHpleK5IPrsILfVxEfQS/se6idJMqUK5LNd2LqAc4VEPdMBr5fIOYepvh4vFm
 IfeNnzpzz0MptC2e+sOnQXXVxQZ3UwrZnXXwR4Z5qkYQZ/cnm6eI43agHp+pX0oY
 h+tJggu38AV589419Hk2pHHVeP2lHPart0Q64cTCF/oQgXcd1bCn2ifYDBbzySZZ
 mBQueGiLaiPADakgYGThtmIIjGyAfOShcr05MHC/EmlEF9mM7NDomKZPPvZ4iLqB
 60PumQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ckuq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e364afb44so469200b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747419; x=1756352219;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Yg/2s8cwpHYy/pmAzzHeffOyyjabiwQv6sxOo7TaLA=;
 b=R4j9jWLB5Zh/FqLE/5pnqKIyPbD8+ktoWcDl7sQR5PVSZvlox8BtgZU9vitalRKTvp
 XsYeGEN8D/sr6Zb8WaEqSthsVid/ZDWxINg7wqYsBb3v2IOepLOylGYoCRdJy7HRUw1l
 DlqPmHjnCvTnNOWYjz2T2fUdniQf+iDWCMX+StTLWq03BuqGpMPxRO8B14EO0TD7h6mz
 QuA10j7Vykew7f3Go73fgnDKwPOVgJj8Kcg0FUmwVKK638H9Jxgz8/QpaTBkKIrzpqrA
 nffQjKM3/dxuSv9sIysheWHTuMXkguIva7ou/QU70T7UMTf++QNbuxy92sYU1wlB0SrG
 wfSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyJKu+NnBTfpH/QHWLjri+B8isuQ5c4572GLAHD/t/Ptq64Y2Nzl0xCpaDOV5SgIXSMud4NDNbOJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3KLAGN1An9LcYURlsMkQI5F+bFOakZKAb4olFCdtd7r5qoZCu
 gduJj+c/3fUWnKYTqMvgJDANnvO29N/wzOumpbkSfKstLkOm4qtR6IdHzU92zgfC7O+5xNTjX9I
 zpJZqyc1tuLvc9g86Mxnm5PJpA56+oFEnmCiXAjsN/7M1vSGDFyfASAOLuj6dKaGk7mlIP44=
X-Gm-Gg: ASbGncv1vWDze5wtlM/BOCPKeM10xrIznyeQXkVAqmn9/Gtq191KCNXrtU/mo1POSOm
 YjO5r4YCX5c6oJUtsXkGaDItFZU8wkv1mYUr4hx+aJ50eoSOH8Ks4f5OlmyGdGvfjLNU1iLlA5r
 HV1CvOshEWnm0haa1+W7oL+hf4Nu5LozGzugQHeQmZJUCD/a9M7P+AUot1NFELSv6oNvXYoMf4n
 iEg35QyzlqBQ/2aElAny17e93Dg3QatPQx0BhxyqhsrRu6wKTzqzR1/f4IOHQH0TE0GNwxXTybO
 tFzX53+IIzPPJbkHMTVbA20WUlTD3KNGs6IPV1XWMRnmRD3nurYh4XN9c8gzUDroUdufbQA=
X-Received: by 2002:a05:6a20:939d:b0:238:f875:6261 with SMTP id
 adf61e73a8af0-243308a4f58mr1229020637.23.1755747419172; 
 Wed, 20 Aug 2025 20:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRCZqNHbcoR5WRlRmiFsb0AFvSf5jLDkfv0v1YD2XuyCm5lD5AFBOU5mVx8s9zqhkJarHeSw==
X-Received: by 2002:a05:6a20:939d:b0:238:f875:6261 with SMTP id
 adf61e73a8af0-243308a4f58mr1228977637.23.1755747418755; 
 Wed, 20 Aug 2025 20:36:58 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:36:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:35:56 +0800
Subject: [PATCH v8 1/6] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-1-e9be853938f9@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747401; l=1231;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=Vcbndb0BitXQXBCCDy5phydPWg7MwP6Brhlf2YVSZNE=;
 b=mOoNvDKKUBqUis++AdmyjQhAhpayazMlyAI7h/rxX74lbKBENchjmD48LzidbrrwemcyCDR8E
 ikJa/jGaKlYCBVOdRSYFe87K0ezatz8sbGSHwxJljoVUp4+/RX7rYnL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: nu_g210uqG34EwpaD2B5MDy1nAuI0qtL
X-Proofpoint-ORIG-GUID: nu_g210uqG34EwpaD2B5MDy1nAuI0qtL
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a6945c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=5ixSZjX4nqodb9qzXsEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3vQybzoTokp9
 LzRbUybiygurcgJkZ8jEJx8VUcAqGNbj7PRBTl7pApNUbaB/YOgLJ+UWcYH+A5QFEbMht507nLX
 42JjoZ2nnUR5aFmg4ynWE5RJwynazYu4p4ywlsAZJwtZukgbCm1Rd8ocT9KgZbBq3iAQXonxauT
 qlMqPfWoZjmdccduDh/0ttS0q3eDTj4R5Xhlb+HBPeYhPUuaZgKgTCFrSq7cfbk4D+vvRWJFqzV
 /tbyxVrQkJN/ohJvozF9hX6lDw4Gu5Zoj3gr48mYHxW7w6Dn5xHubf8nFq4njS3YTDiesqmubU7
 Re7CnYPlikX4vRN9QfrzfLEHgYxpIenG0hDvu9Aemr9GCvG5vkkRpIMQy2TW3WUcTEUsF+JFRHT
 FPtJwyGJ+M/7wlC9gs6uoiusAL4gxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
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

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..d9b980a897229860dae76f25bd947405e3910925 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.34.1

