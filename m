Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46638BFFC88
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9410E8C9;
	Thu, 23 Oct 2025 08:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkKKtOpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0310E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vZML018595
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=j1IIJSrPTfw
 ivQCAHihRszXwyf0kfSMjdUDkP6+21Yk=; b=PkKKtOpIyQLVTGsRai2jXSJzHkE
 8A0G2xLZ1PYKj4BRtH4q2geggWIOzrO0xWu2zGuWap83DvfuVBY5fZLedqNvlKUr
 RKHG5bvBTab2IwasBUJ+pt0ih5ovCCj2AP3uxEznB+rmzVZLSZl/NtrRIkr4AtPS
 x1sNWeVLLwGGshDDp+OP9WH6Nke+xFjS7AvrnqLACHbIpZXWp9Rkg/EhKRfe2s9X
 Evb5UbVFzxLsls84bApSHgfKtgX1V6AFRBbTTGMc8CV7v2i3AUG/mktp2jj92O2U
 rzmwR/gZU1fX6tGpRd06oe0s1e+6j2rmWvPFW9Tf7I7GBumY0avAC610HMw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pqsqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:07:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a277277cb7so791709b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206866; x=1761811666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1IIJSrPTfwivQCAHihRszXwyf0kfSMjdUDkP6+21Yk=;
 b=qb2s42TPCLwp14lqHxNWUGvuoGe0GADt4OxW9ey1VhjsuUkbX6N3VY6PRwmQXGTGtU
 ZdttijaUEZDeQwSGwPnwBlURuXpQPNwcnP9h20l0+X1NdSU+QKEFBSHq608n0LB7P+rT
 /PPCPB9ZWAnOigYnclIKSOhfAxlENmQntWA9/rHZ6KXEjlCS3nQEMatJS/Rmdh4NA6AR
 ZTOKfS96Gek0byCK49/cpbjhS8CcJmhMpe/qfdJYgF4tAsRVKSIhSPzDTJ5GGsM/JgCf
 7rap4aqerGSNd3grQbYYAaqjCjEjYxdFXMoL+nYyx6V4Dgx3AqTcw9DA1C3haQgV98lW
 dn1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeat5rfkrJyNqruINLtUI2FiGn2683xLL5cUSPxmOQxo2lnbnq1l0dhxWeyy2iN1L4olEvjUJvCtw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLxG5NFG6CMDdFUTQOhwwSt93+mbU6AwrwaQmYBTac3zoapIvE
 Y0/CXWoS4+rHZjqAUWBktcBmVU5/vYKUOTWuRtMUrXA5SqyyIrV+ta00/9p7u/hgOUiHrU8lN58
 qTMAdjIh2hZptpk6yIZSw2dj2lYRTL2D6N8VCox0KdbeSirUy+8GDwlPJugOJA9Zxw21gozg=
X-Gm-Gg: ASbGnctvvp7oRXjnl1A9j+qWY8vCcoA76iQlzdTZqbZUxg4YdJ0Nxz9jzL1q97XDveW
 yxGaZC0d7OMpfap/MSy5WU71lch6BlgVK7Xt+UlnNkhRJCg/E9MqCBS+M8HPU/3LqDmgj6H8SHd
 K7Sqgcwv29GxCC1gBvHOBljYXEHdE5buNTQ4bCAS8MIthvcsgGd4AIzER5k52jWKwAqQCCfpUEU
 2sC057Q9Bat6PzDy3BZ5xWaB7Ik9S1Z0FuYgRdy/+pLk4aAlY1iXXRZ9Klo7zWfeu1SpX9T/x8o
 ldInqq/NvpH6tnxG+/w5xnMX93Mm4SJDPtLdYGjdV5JiMJJcrVVRpCK7eKaXhzsKbkF9UHtjnL7
 XGm3WkxEk4slQ8kuN/D52lVKAogyc6jY1z0Gm0PrTMNPA5almLw==
X-Received: by 2002:a05:6a00:1707:b0:7a2:7792:a47e with SMTP id
 d2e1a72fcca58-7a27792cff9mr1270478b3a.8.1761206866515; 
 Thu, 23 Oct 2025 01:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm29AEfViqZ/xwI8Z4NkviSg6rNCA4U/hY4ny+YB6ujwOOvByBjS3fyeNcsd8nDzK1JHj/mQ==
X-Received: by 2002:a05:6a00:1707:b0:7a2:7792:a47e with SMTP id
 d2e1a72fcca58-7a27792cff9mr1270451b3a.8.1761206866100; 
 Thu, 23 Oct 2025 01:07:46 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274a9cec5sm1676410b3a.20.2025.10.23.01.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:07:45 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Thu, 23 Oct 2025 16:06:08 +0800
Message-Id: <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX3Xtm2gJZ0JIx
 EXEOBwRCsFPhC7dHovK+qJ21005MLpwGAjNb2sN6vXgAdMIiyd6I5tr9f7tqB49iJeuQjrnEMfB
 PdtFlc80ztdD0q4kE6Pbz5E//ku5Fet0Re0bS1hTlySd6RuokRXaI8wzrydwuGrlZpdJdPluz7l
 t3kKHfnnh9QiswDWfLB6sX7VyCYoE9LsdMBcrSwBB/OhhEjrWpjf4X0jh+4/EuM/ZHQxKjx+2ym
 KPPpfK4A25KPBwZXE5bl+YF+1FSrEhp4ugI86EboPSWr8VBOuMt4k/J9a7hZ4VIThZI0WqTo9zQ
 yPcqUSZNG5AM8Pl7M1MbycXw4Q7OiOOWIMRaX66Z1iD/9xDX8XGPWZKfI/M07s6A4iLjVzqvHo9
 V9uB1A6qpqEs/XlFa4zbxDioF9TQPA==
X-Proofpoint-GUID: pBiNWOt28LEpiTfZIyo7u_Il1KHB5sPD
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f9e253 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=NRHHWUy0EX9jfUzwrTwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: pBiNWOt28LEpiTfZIyo7u_Il1KHB5sPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

Add DSI Controller for Kaanapali.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
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
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

