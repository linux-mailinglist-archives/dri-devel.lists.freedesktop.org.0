Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7AB41DE9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02EF10E7B3;
	Wed,  3 Sep 2025 11:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyskRiBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FCD10E7B4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFDbd021401
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=; b=JyskRiBbpjmESb46
 EDPO31Z1EZ6yvegcHcH5dnSFNCxtWKQweEDJiHgII5QuNkgrqz+jiyEukqN5+ZZg
 ODBPnlNl0Q9itxQvhstV5cVyfsurT9JDf+Ql5+L2VmbrSLjCQRY9ILs3m052p5y0
 xcOe31KxSvXy9T8oQfx9f3XlR0Ikc5H8uzUqNw8gBlJllJOjRsumjxgW+AphYR0g
 3hl/KaGrvk8E9kf9WO5BCX3lRE6HRMSsYctWj7E1+FMr0IzH6sQKouRhBytHkF7c
 4SrhuCfWG3+EHxuM18Xux1+Vm2tzcymxAditpe76q7TWDLXW2giX0PYqSY/H+SZV
 mxys4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk93awd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b29cdc7417so124359781cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900707; x=1757505507;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=;
 b=P8bnTiCDV26BqzHqI7NuFJ69gL6yCTIQRXPieLuEo5Fyype6xHWwORyfkcNQdA5p6v
 7ybW4szmGc8TepEhOx+zvvdnElCRNIqmSFIIjlAIMTTgoAe5iRMiYpb55AaYcq7JfIE4
 ayWOfh6peiC9U0QQNTkROJM/siml1wWOaO1GF9O4MTC3DDHpaagL6sn1MMUsXgtxt/7t
 vmKgykiet1Tb8LffjHkBCTWs4LtWodyYVfhkAQrarvuQB6pBAzoZFcxgDagsA/COhQ0t
 70w9n06GtXijfcDayV68Ip+yxmL3Sk4jBpIRvGXBL7pbZw8Tq/JMISq3j8alB/qE2PL+
 5FcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYp1wapACq/ATVpw+NymeBKpXvIIl83QqJw4Hoz4wUKjdMzHPgp5PHdTDou+mRLiJHMPBZ4PDhAO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo2nD1bGnl+Ra9lqTojf98Rgzdua0ep4tx21u2KFIfXACeXW+0
 1wjD1isuW0PXnNyA1yLHOiHmcz+hGNl23NpLEU65+x5/LUK49TYLG0n/DxMsUdINrBJ7fTmY2QS
 DpGuJam//NibUQjC5bfkSWY8eJoguDw/XGu28uOEJ0/Rk376yVYHKTOmMUuj6IckoxAobrQc=
X-Gm-Gg: ASbGncvacYPYkfjXzhmJE3vVRAsbK2oC+KuJ0KbnOcBRpeul8WP9pmgMS8dq2uBCMDS
 LUvAJjLoqQvEBXHWFd4KEKakJ3ZM99BL4gG2LWPGGHZSjpH1+anY7eyvNXR0RONuhwpd8x7UV9l
 SHD795t3rwgkkgSHQzFkjL1LuixzCSa8g8ZVNILHEiECsN1dHdI/q1EBD8mmalEQNB8xBsRv8JS
 uWMd4E7kHe2rKubimVZXhSzfRKv00TrAio/96IgqwiAIB0jJ69mhMvvVmTyuS/BQh0+O+zA6Kuq
 PAhbVEummp/6zByQDLZEgmvj5TfGYFU13nE0YTsyw5/Z8xpRk/gepCGOVcQ8kHBhZfNDMgQ5t6O
 +r8QZ5Wy6lF3wE594Kz4gXHjY9PKQvBsDT0t8Zm+wviWCq0PLWo6z
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id
 d75a77b69052e-4b31dcddb9emr153034091cf.80.1756900707158; 
 Wed, 03 Sep 2025 04:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb+EMS2bgzjF+wonzL9M5BRn88S64ov/ovDLLFNBNiMqEsjMGSjj9Gp5N1zKTttlgvTkbhnQ==
X-Received: by 2002:ac8:7d03:0:b0:4b3:963:b3c7 with SMTP id
 d75a77b69052e-4b31dcddb9emr153033731cf.80.1756900706608; 
 Wed, 03 Sep 2025 04:58:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:14 +0300
Subject: [PATCH v8 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-3-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1XzNKs3KOvrfNw9T9A5PinobRn6+BUmHYpZ
 AbXYmzlA/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVwAKCRCLPIo+Aiko
 1fDkB/0cdD4STyN4uofga6hg4Afg4alqCVv877OF09D2pr1z2nA5rdLzvmgnUcMuCfflk0wXjHJ
 bXsEEaz14lZtPp4J7G85o7G9VjPzwXeS+sUHRbWrm9NXR+wD2RcdMefCPMdcbueKkVTkQYgbgLf
 1FJVNEdeUy3cTxX6eCsIthEtfOSBCKGU6DvSa8D3UYbrbIpb3au9HwSzcrQ136I4QrjjRc4qZlv
 0hS9T6hv06o7YlXVEKtOOtgPd/PmvrYjHbiN1jnXrHriCAdu7gl5s564TQ8jmumSQFQB4GC74Go
 dV3x6hMYJ103JuT1RIOZFoae1XywiZB+ZJLIyFcu8cy2FZ/J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AgRgQ6njxG_BCJbbFIEhSnev2K-8-UZ2
X-Proofpoint-ORIG-GUID: AgRgQ6njxG_BCJbbFIEhSnev2K-8-UZ2
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b82d64 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QYKTPsKsHukT_2dPOMMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX2VN8+cWkeK7x
 JcvGrKnGcK2ZiCcLFBFEqL357N2GkQbhC2VTRdFDKa0Llrk/g3zlXMYvK1YO985mtnxwHVRyoXq
 ITStRVGj9JQf8ZcTf9d9gPpaY4TnqbTunQFrqVm3Mv88gK4okUo4F888frBhHVWYB8+5pANWoIV
 YTfjRN9avkL4URE3Ay1g8rg4EoEzeLihucqr17Qx77cUjJOEKh6y+loKlTWz9fx3hUh/oENaoCw
 5snprwyXh33BMszETxfYstPGJJDrNGQMjQgRIkWMFheM+/9xOpXkdSCjOayUXd9NUrsZ7+KBg70
 XqXceo2ftZgmiLl3JxDXVltkUV/FDA5mGfEYs4SZBgzzobzsA4roRBMrrmfh1/QwVX9ND49NLNq
 GZiEu/SM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
controller as compatible with SM8350.

Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0f814aa6f51406fdbdd7386027f88dfbacb24392..a18183f7ec21ac0d09fecb86e8e77e3e4fffec12 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde9b0fc5af11aad1fcee860939c66f..c5d209019124da3127285f61bf5a27d346a3d8a1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -61,7 +61,8 @@ patternProperties:
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sm7150-dp
+        contains:
+          const: qcom,sm7150-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -378,7 +379,8 @@ examples:
         };
 
         displayport-controller@ae90000 {
-            compatible = "qcom,sm7150-dp";
+            compatible = "qcom,sm7150-dp",
+                         "qcom,sm8350-dp";
             reg = <0xae90000 0x200>,
                   <0xae90200 0x200>,
                   <0xae90400 0xc00>,

-- 
2.47.2

