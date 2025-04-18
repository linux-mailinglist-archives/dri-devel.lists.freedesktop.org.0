Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6CAA933BD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 09:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915BE10E42B;
	Fri, 18 Apr 2025 07:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCUqwk7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919F410EB75
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2627d023405
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=eCUqwk7WrldP/479
 +zM4v0Fh1pXTuc4GsMAqJyIuMvJ3xzsCQIPfNxFk/N8AA/sT2xGygz9P6Wsq/gYA
 VweymT92btExAPH+x+7NnRxNsvnUwxKozHbTosZFAIaoWOJResR1+dUlxkORzc5Q
 MDP5xX4ghYInwmeR4Jrn2BKymw7lLqQ6IEbV1mJ4AK8YNgQBbdHFijBav3DeLq3r
 PzIm8n6HV3qshsBXP7KWN+2tlcifrRbtnYWIHn6e8ioDW4MW6xzI0a5Qyq0hZ5FR
 J+/Z3Q4MdZnibrh+Czvn/V0NfyIbb8A1AttQYbmg5l2G+bSt7/xT12xpQPBCbSAb
 08exMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq148q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 07:50:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6eeb5e86c5fso18332446d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 00:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744962609; x=1745567409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
 b=Qt3GI8iQ2dM+khsAQxWlTV6qLM8BxIcAtRdaGeglBvCq5j/schFM5xIFBjRz33Jrq4
 PRfWsD5BmaMFK4kwmfrqFEz97RehSCZ7b89hir7sGZosyyobL1e+pGk/s89vCYRdZd7Y
 eIYoqs6yPHoetnP3IzIxOFH35XwgL5bKgZ3Boe3rrgldfEGQo4wmFWAknzK0X/TuOhJP
 FpL8bjglEi6XgXRKK1VxSWM0kIYLcqOGkGG5FUEVMvs4Gn4F43fGVP8t/Ppor2u8gxvb
 SwpwM2iL5JXLrTFupIMhP71RSuu5k8S5FW1ao0CkChs23PPeud9aNDLzkPsqLOHuE6Pd
 /kkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdP8vXHPnqAa55QF6AZoSoYrQbqamAnBW6SmIYUegiH4IlFCv+55pK/6izKYeKRc7uQS+9iJ0XQlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDd8a2ay6HbNEbiOSlnS4hznmMAzJxQ2gSKugeg1ifsRVNNVfF
 a3rkOwV6xszHkfh8ER4L9xGwBWRY8r+U/CZMrKl4tzbQgXjAX+r9RAMrnFbYRg/UhXWUx6yV3t3
 +/aeHfjJGwCiIKXEIXIp10lUv3qW+UmRYivV3ieofgXQkUBxdT8EgomsMnlBHWUfNs9I=
X-Gm-Gg: ASbGncuSvnX3zxiaz5u346YaQwG8QlsE5IntPP5/2W2fq//zL2/9+Tlg7hsoPDfWZwq
 jDklv531ecWbJ6Vprtnnt/ThyzYJthefSOqlWR02XQh7exUfWJIIpYzGSWeNWHqT/wqD5dJuKlC
 6KNO+mVRUXj05YfR0gs2g/9rDsCSDr8NqbWNztDgIH/Ke3eZX5JGbIJLVlRgF6fJDGNzKpzvCmS
 o8wVr+CMryTcWiKzeb81asJ6iaNZ905Q/Tf1Y8pViDV2eedwsLffOTeVMGANEs2aDEZewpRi3Dy
 QeTWI20W5gpqBgjvtV8Qo8zTB4qxK2k4Xou/czUOk1hVAGi6ZtKSD2lc1w4R81TNEnWcipZKk36
 aCf+HGR8x+d0XrsHV5LIoz3em
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id
 6a1803df08f44-6f2c450c0d2mr29779356d6.3.1744962608809; 
 Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz8iXx7BArXCfbFF5WR9Y11877tVEpzeAsMIuGaYxGT6K7Hu2YW/N+89qedFyXXOUKUoeC4w==
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id
 6a1803df08f44-6f2c450c0d2mr29779196d6.3.1744962608446; 
 Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:58 +0300
Subject: [PATCH v5 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-3-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQDO1q+LuOofVd8cYcNAfql+KVE/DX3iMR
 xSQGoRbh6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1XWaB/4yaWBeX7aw7qlpH3wBLgGazBiDKFtr28dA3vc/SLFaX8gcTWTpYVyZrf9HiwpmRuZjUz6
 9tikLOxqpdjAQaivugxlIoXLdi+NC+AcR2wm6L0vq0XstGEATNdMQnxylDte98WCQJgGOBpIcHo
 KAEnZaZmOUVZUdma+8tysEIbTKDjLWnwMY6A/qPHWNUTuw364cWDf+Fd6/vUp5xO24zufNTD6V5
 3cBvpJcTuWpl/BytPFqQIZKciWjeM/Y1fGT1eKluWIfx4RQ46ZP2ODPJsHCjjOOHBBOfIf6StI1
 c0Beh2gfpnDBwnCsXMAf6WwcSsR5/U/bUSuYGsZP6hqaEaLu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: g94xDlfFsn4jVPyQLUkR78NAe0DNE5f-
X-Proofpoint-GUID: g94xDlfFsn4jVPyQLUkR78NAe0DNE5f-
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68020432 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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

