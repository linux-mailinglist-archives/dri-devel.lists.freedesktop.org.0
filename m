Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514CEB0D294
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DE610E5F1;
	Tue, 22 Jul 2025 07:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVzq1frN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C9A10E398
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7LEjc015188
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z6ZwzV2fRLwP2rYYHbwT2Ikl/JBdsp6+MNb9lNC0zc4=; b=TVzq1frNL/SlSxtN
 WI+DdaVgz6Hgu1dXskmqVouqvahpmof/0OcnvL5kL65WYFsihlhnXTMxd5b7PDpS
 hRONCm69aDPDhuB34dNDT4mgIrOkPtc9h+UN+pqPnt14S1WUNzT5JaEmiR/55vK1
 Cfqa0LfPtFoxvqj3jZ2W1mIEMuUWsI+POp5dUBJqFhp+5tc0cE2Um8qxBCD+XoEI
 9J6i3JkXoR7bqPkdr3XnKIFt8S+n13rMwfomdNVnE7T/fkNftGYKJdkXMUCewhZA
 PdHJeUNUbaDwsulrdYQ4trXIV4URkJg3+94H30MxIXQMSmQvmLyw86MJJPT1p8ns
 3aPo/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w1ks5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-234c56afe28so1455785ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168952; x=1753773752;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6ZwzV2fRLwP2rYYHbwT2Ikl/JBdsp6+MNb9lNC0zc4=;
 b=ksaMHCluaKoOlwBOGYJJ2vwc9P/2SPU1WtdMxdokIiobSsQGAVramQtiSU5qZEVB1x
 +SvD5lc2mG25qHWhzW/gi9kthZegFYj24KXP1MwmgkSMeQ9YmVzNJcTnwanGtQY3GOP0
 10maUTW/08KVBwLLJ0teA7wWkr16H0EuC6OWbR4H+SpyvmnvEyTPP1X19MqJSGol4oOS
 g3CNIbJ2Cqnh+CO/AajR32eJ4rFEeyMRWqyvOZL8+vtnEuLyxXHRfqnd5lLzP3OZHxSA
 bAsOWle+RSuAIUC36+Ygo3pgShRKNDtmv5U1sCPCTg0Ws7t9tapKhXqM6W+pb4G3gZWV
 +0rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWJjjtq2UjyfZz//0jaZ33rTZxxRiJHiLl9eUD3ABBu9XD7pUvy3O5H8BWcEpQl4Rzmv9iHGUPE/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx16mHPlhr16WoRoCoE80+xUaKARQ5J+hiHb7f3eclviBAWyVL+
 e1M2ZB14ZbtSQEx8Th3E6qjBUdkQpbpHeoNMXS6QnjqBuEEHr04RPHZydkIlCDUK8PDbjZ6KI2m
 lTR9xOurj9aj54ozCm2IPeZFHZTgLMjhl5i7px+TbN7LzpxoUaOrdIIWfyjPVMIQwkHhbykM=
X-Gm-Gg: ASbGncs/b/UqphMszt9Yh9jZPR5Yw7oZbM96pNwDmeQmncuWSFlWTHCMy4FgXGUq2UD
 OgrMM0EhKLw9dO6HHpUxh/vjrMuXYLsU3iKV9MVGA8j3VCrpZx47EnjnTk4MiBX0zongoBS1qIn
 ifLYiTf0IxfAaB24VSg1bCsDngiCOuLVl9U2LonZD5HPSruoOSUbHPjFXfIJ3QhkCb0OJKNlCKG
 k4M+t72KJCWnYwuDWgmjLYYuuXrX7qmvLL/Lnsx36qrpWVOmsaQm0hT1KfcG/t6+7S5laIQcjrP
 NU39porJkqZz9/Ha8gmwm7K4+m+G8rVnpCQfFrD/gjtDAQQgQVyZSQe7OPcEq2kWW+JeHYn7Xfn
 xUb126N8kFo+KaGDmkQRSgUpWPZcPB3yCDQDBQtPTUlUTKmi4EF+NvSbe
X-Received: by 2002:a17:903:1cd:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-23e24edf70bmr137444785ad.4.1753168951886; 
 Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPbIpYG8v2ydgpk9/Rt6e8nvbsQWG0NcHT8nsJPhxyTxGZd676+Q8C/tNJcrl9ABEm52u2QA==
X-Received: by 2002:a17:903:1cd:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-23e24edf70bmr137444575ad.4.1753168951408; 
 Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:31 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:02 +0800
Subject: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-1-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=986;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=flVURwsSNZtWM0+fUgJqZKMxwfIi346lSujUoU8vBq4=;
 b=lFF3TC9IzWFZbCphEU+PcIbJicZ2nH4+jooaIfp3H+fpT8Ugr8/Lcb6A7g1w4zevBtfnOQzlG
 sTyaMHC/WnDCxaIyrA03rD90NFGzdqeY660ykfSFBWrYsobnqaFRMrc
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f3c38 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CFpH1fyJroaNsTO7nwQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXw6j8p66WLso9
 sitjwbSIOtiWhqCnPDhh7W+WGg4IO46fgtHZh/nmnpZ0RM5wyAXUVJ7azcSkGESqh/eayDxhyxf
 Tq+CIaiUgDHa4fytfogmOZ+anD7OeKs/4RfXtCvQMV08pck9AJle9b7HPRFW1E8ewcsChgYwooH
 ZUwBFBdys5z1OWjOOMG0gonavsVw3FbK8Y27d0Qy8Ltf+ZLRQWAg7IpB4OP9KAowp48vnBFHW8G
 3DWgYqCBAsV36W5MswVYCFvr/I9bNtiSWn/z5DBGXxSoBfae0nvkChl2QW535kBrPQzMyn4016s
 Ph4FjGOtGP5p0wFZXRvDlk/jHHZxVoHVfePLyd8mBwU6c1qugKK7jLtK9sxfYqPt6ulaHRHCpYb
 eegWz1CKymj6W+fDGXAUw99M5uj0TZx9JqK3nN+Ea64NIhxfXCLE88uGVy03Nvn53D8M3Avx
X-Proofpoint-ORIG-GUID: PvuX3ky_snK0sLL-EvH-VwHv4LgCtSHK
X-Proofpoint-GUID: PvuX3ky_snK0sLL-EvH-VwHv4LgCtSHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
shared with SM6150, the compatible string qcom,sm6150-dp is used to
represent the DP controller on QCS615.

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

