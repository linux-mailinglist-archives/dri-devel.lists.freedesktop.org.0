Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF6D23813
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58D410E71C;
	Thu, 15 Jan 2026 09:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcldLNJb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CatpboyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFB810E720
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fgeX1581834
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=QjeuQhZUGHp
 7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=; b=QcldLNJbcA3x8cKa9SwsoFvAmIb
 DURT6NGVh0J9YV8wyLaVuXsRfbv+uB9UhvDd5Jyj2sGv2IwirIO9Ya74shLMuqOY
 vpHLGgfWmRj2AAI9o4yjk7Hi872OUy5WlgaXmagW3BdCRa3FY7O90Uf71kxUhknG
 ey9xI/HGBZOQRXpiIGOz5ni6yP8lRG84Y6EeMJeHr9FLi5CTbp33kBzOkwNr4SFp
 sSFp2yrhFFi1SgbQb40StWo/9ktDf+XUVdGKC8KEwCu+ZnsGCN+koRV2xuc5FIvB
 mChvRL+BXDoxA/gZCrYNy51TBhfDW1RbpaL7DlkSfCFE/14oEuXQNs3bu3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1psy9y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a47331c39so15884086d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469313; x=1769074113;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjeuQhZUGHp7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=;
 b=CatpboyWB/bUrAyZFHI5Q0OcCwiOFATImPSusrZ9XoVuxB52WZ2FLUY3mkjH9JQvME
 6M+9dZ/7yAuL4OV/ntj9LP1sYxXwGfug9+GjEOaPLbFmM1ONJBt2ytudfzkubcYavoXZ
 7gXXdigFqPb+5oatZbc+CQ8y/t33+dl86xjNNZxNHTWTBnquR+62iNNhYohvCMu66+UI
 vC5Qv0cN0RfTlGJ/fLRjeZEHxeGHj/YPsJV2d6uF9khB3MrGBBDd5baT2IdbFgOSuvAE
 niw+YiMOgR/1R65jWOi4WPoM4PnBowE53MxXKcd+hJkKEuXGk+C1qOBYBDfeXU+EUpxk
 BaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469313; x=1769074113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QjeuQhZUGHp7ssTy1dZfeQV909lxdktwUy+qtwp8b3M=;
 b=iRCHxjRFqIh3P+NKnx7H4se5poJbwCYHFgjQETC//SypOsNod/KjNO2ePRZDEJp88J
 Dvlj6GrO4v62QNwe9DU3wMJ8b40aRctQBHwW8OnqOheMs0gvRETvKDuYKYHCx4ex+HrG
 WOHabtBWLKihU4+ZuinZf7jtrA7r72K111OsI60a21nGGHZhf5WgnKXvsto5uNjLw+QR
 IBTZ2qCIfEmHF220c4Jri4tWOUw6ex+9UQPk+WFVz6fPpvlNZd11B2Pc/VOi3Anwht0H
 6V2orCNPiRxCmy1oEzROgGEEpDqzMOQlkF6h6bwdis6V6Wh8zb2BsLguPc+M14N6qE2F
 NLyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrpQsA52DIeBzJs0r/H8MR5ZC1w/dfyoRou97ugcuVqPTNahlQ6C+wbBQXnGv1XjjZA2STYFAM0ZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF6EYzInxxPZwUsB8TRo48/x7nEzJsP3yAg7uPkh65FM2y8SgD
 c8vA6ur0OP6jTK+kUGfQUyMpv9u9mEDWrQB6rUsjdQIpWPo29FdbLv4pyHD2631FfxGjbd8uztL
 g9vdi/86vNpB1YE8e8EtqFht1r+eztv5WpimM8+gEnqYOZFasRmLqh2txF7ilZ7/BfFUKiWY=
X-Gm-Gg: AY/fxX6RqxLhn9yzDXtsqBzazUeKkZJ2P8QlZa3lUCSeqCRlyWPIiAF7kujoYo8gDNA
 7+dVH6KWi+PLftffYsnphCsBpzKkgLb4SvlorP+ednBJLTzO9j7glbzuDXEC3iCmGWUjBv0YSh/
 o2Z03Le6fjENmDuScpCIZR5h57w/0NkfRZ5StgRILggpLvm2FgM/3ZsG7gL2S+ST5NFxHdvsEwP
 YP7FiuM4rRzQpnEr+h/BDOh/cTWAnmzMQRL9tY8XHXfRWhvQPfUfHNSBwnpJBLwzXbHdzNzjGL+
 p3aGxEqUQIW6xQVgeGkXO4C14UjvhZdmZrtnJMjAKLM9w0B4stLUd3iuJjuRJ8gT8tFOchrmAuf
 QNXnxcnAXxI9dBOmx4kFKYwKS2W0zToL61A+cDI9tCwMWzZZLnJ73m6AoQ2OajzoVwfE=
X-Received: by 2002:a05:6214:f62:b0:87d:fc3e:6d9b with SMTP id
 6a1803df08f44-8927439bc0fmr83782906d6.42.1768469313237; 
 Thu, 15 Jan 2026 01:28:33 -0800 (PST)
X-Received: by 2002:a05:6214:f62:b0:87d:fc3e:6d9b with SMTP id
 6a1803df08f44-8927439bc0fmr83782616d6.42.1768469312829; 
 Thu, 15 Jan 2026 01:28:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 03/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Thu, 15 Jan 2026 17:27:40 +0800
Message-Id: <20260115092749.533-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX/qQA5MQB3Imp
 XKt73/BGwMLm5phZCNSQlwrjKr+bekG9jSI5CmjyyRK6EHIIczrM+/HXxuiho/6xXxvRUVN/AOo
 DUmoYNrFgHN4ZL/Pk0tYvQCQZoLM/fQ/AJH09WqteOpQY1RnidmMuvZq5U8pk07tokqdx87u8Fq
 wdLWTfTHeCAhyBIVtSMarZuyeHmGGi7x2INH//PUVyQUJuar5QzQeHtGOWFYd7hCMkuxy+JGi0q
 kh5OszXHeWwJL9Y26a1PU4qtQrAB0oNp2QJXSSlQFTZzXpTQQmY1okfgsu2iA5ohPU63Bzjgm6d
 lqsxaeBcBRNjJ0yOMzFgU9yBrnO6akmvM9Vel5YdAzz3yEmDNfGxZHo05iE78gnI0WkzqNIrZk3
 CEJ4HVzxDCK8j6tUAzS1oi3LFrVrQ3JkwIDZQJOOCD27ejXrUntL8bNaCsJJX1m3T7I6bEGJR1t
 dG0Hs69S0xBetSJKWAw==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968b342 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: SzQPT1gUZ8eCIcNpdcZ-K9XJ-5oENDI0
X-Proofpoint-ORIG-GUID: SzQPT1gUZ8eCIcNpdcZ-K9XJ-5oENDI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 6276350e582f..eb6d38dabb08 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -374,6 +375,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

