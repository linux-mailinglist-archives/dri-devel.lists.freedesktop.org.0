Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B38B41DEF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE23510E7B6;
	Wed,  3 Sep 2025 11:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntQiwgTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA1210E7B6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEqHk009331
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=; b=ntQiwgTdufLpb0Zl
 mWz+4Kvk/qRELcJZblqrIFNw9oARFmbdNAN1dOvp4iHFwcNHaJJ2z9f8F+WCDXw3
 DXnn2aImGRVi9gHSqOJ+NjnxSMqaxVgIuh0yKseq0MmE6Ty5Dg4yYGE1H0S+/jCM
 CfMtnxrN34psB9slJReltftm7v9gVyYqpmFF3CToIP1ozTCxo3ALyfd5GuuIE/V9
 /gChH3SPNa45oH8BeLGvUsHBMcWZFuep9b9iL0gvZUKY7uJ58VAw5wtFBDK721lT
 fS40SjLjESLNk1AHpGvL1DT3+kqyaRj+3V4SxpetyTObR/N+Ui8Uc9/uMIlXiU6N
 oYnB5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ufqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70dd6d255c4so160286736d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900712; x=1757505512;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvS+pfSkiXK4ob+ewthYnY+XCoXOveBrZR1sStGKsLY=;
 b=EPX9CpKiMaG9jZ7+HBpHIiMHZV2zyFBrcF9sOqC9uCO/IsnSsiSJK3uMBAHtD5cGls
 uxgrA41xdm46uK/5XHd71obwsr9qQY3I4ywpkvxQfqlNUTs9p497D8qUBmU7D2elGSJT
 ehTWh9yvKaml9pVQJqo4oapLdV379NOotJ7HyAVeH7JfJkmjjdjGxdsFGCaJ/ogzYdGF
 80CAI2d4jfnW3PGCuVWuy2mlvYxaSGI7GRivRmswZu6SM8Q4oRjVlx6FoW1eaInSf8XV
 XvbjkqdKT7LFfvuB+HAVfBR7fknLI7soFyU+qZzx3ZTVOZekcIH92BI61mknDw1ikEMa
 WFIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6JiTEjnLNC/MfuMr0JeTJje8SSS9iZ7EL6UNExl4Ltf8ZKG3xdXzaWf/DHe0KP+Cqeo5THL39Fps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzmcX2pCNA6OBpJ3HVYVXuKqnThUiKDvUHqPm2fI5gsQUfCzc0
 pLcqCGxmnB9EIfxNGS+sugiwxZV7+JZw+bTusEY8wzkwmRL28uB1o+JUr7YHSj+42C17USOFJZT
 UIJl9dvy50O4kXEyyjYKUlZddHs1OFPf/qBxDFJ6UXAtVCQXEv8ytBaLncz/oMRRge1NKp28=
X-Gm-Gg: ASbGncsQKy7qiNP7oV+y9aSUH7ToueVJGbEdAHxJKCArRUi90+J5ge9k91Yi7LrZH/H
 0IulkuLCP5Qoz5AFTkd4MC7egkNMX1XfWLFAoXo4mfcM5rzrbFVz+h62WBaj0XD5PKUKd8WJA3F
 PvBfFOWnoQ42xqr5mHglI58QiYV8P1G7JfSQkUXqBBF/cZC63pR0T8K1lAsbop1UVzzpLDlwDuj
 tpVEc384Eu2JtJr1NnR9Ivmg2S+qXw2CPfZlNx6Sfy4Qczj/2mmJjoAV5atV3TJpVkxrcC/LfC5
 a6LPWNypvawOi7el0OLggNiLwFKS2QqYjP2uTbpXD88Vcj90NClQjwY9v1cvEvv7yWHGTj2t2FX
 5wLEq1U+JKcD4yYFn++GloNQmWnkqPxhotGUzHvlrFHp/O2wjORwW
X-Received: by 2002:a05:6214:519e:b0:71b:af61:1348 with SMTP id
 6a1803df08f44-71baf6114e9mr91601506d6.33.1756900712345; 
 Wed, 03 Sep 2025 04:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEi+tlLK0SmA7ZkkpLzHXvsKU3NqR3R6ubhnPBQsbOGPlcQRBLwWi+D2yJKn/0+PaaiwTqSA==
X-Received: by 2002:a05:6214:519e:b0:71b:af61:1348 with SMTP id
 6a1803df08f44-71baf6114e9mr91601056d6.33.1756900711843; 
 Wed, 03 Sep 2025 04:58:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:16 +0300
Subject: [PATCH v8 5/9] dt-bindings: display/msm: dp-controller: add X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-5-7526f0311eaa@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UnKbj8oV/I2z2dmxNHPVYZHaNtQSEhlpqnpLKeNGplU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Y9YD1JgINpCccE59Jg3NJTVxUNq7VK3C9P
 zTiqZYhZvCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWAAKCRCLPIo+Aiko
 1elkB/0S26d6iuoLR5zz4fqpDYtQbGuszfgEB0ByWRteyw2h+acALJqub1jjv5QbeCJNQ+kn3qa
 iyAQB4n7rXkeh68FuZCRJVh3NfDY0uf942HEkaWzhRqly+FiZdyS4g9JsnYLpPxiYgVhGXxUn59
 VWg6zT0Cey8UA0c2nLFTooGXgbbcvQMIWTJmCk8hilPlIZazmr+SFwREXXeGStgYLHo/wA1cp8k
 pIqt/QhC/zfyiIXxV2arNZ3BxHTkmYXpFl2+ywk4FF2cpRckJ1tilrSR0RZ1/bPob47o64is3gN
 LOGKezrr0bYlXp8b9yi+Zo6LVGTiqwHP4U67Yklt/McRGxF2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Zh8b31K7ka7jbOg_14MYKcrGYQt3eW7T
X-Proofpoint-GUID: Zh8b31K7ka7jbOg_14MYKcrGYQt3eW7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+xNvEQa8aC98
 K62I9yRPr03xD7XYfwhRRrhQoSY4zqbaHnrGIq3S1HRqCUL/7e2yXXq4mJ0UlXZWRYhKOi3uzym
 zw1THbXLmvjDmS2IrolnWVFFv9ic6ihc5QISpSnYgKQYbm6osejnLH+B+LO18Ztye0iLt/szFJT
 zND3h2Qnt0NZZkk4ZG3ZsWY4sizHNUrjx65HgqGKh3OKBe0xasMY2rg5HBXwL2+cdRUFbal4t6I
 HtL7PulZuleKECyLShmIe9CxX85yxWAogtTVdDD7+VG6N4fUpulCCEE4VvYWmv1rUdxwKKdRGwb
 9HFYwUwvXsBMTWSlTV6twyC4kT0b5ig1ovMG5OFYgf5s34XYGy9uUR7/ixsbZWFdZ0Yn7UeHXVU
 Fr3CQZCE
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b82d69 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=LXTjkAqqvG_e-hvHT3MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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
index a18183f7ec21ac0d09fecb86e8e77e3e4fffec12..6316c929fd66588b83d3abaf01d83a6b49b35e80 100644
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
               - qcom,sm6350-dp
@@ -193,6 +195,7 @@ allOf:
             contains:
               enum:
                 - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
       then:
         oneOf:
           - required:

-- 
2.47.2

