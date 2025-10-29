Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C8C19325
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C0C10E773;
	Wed, 29 Oct 2025 08:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Tw5nHp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6GK2wYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769710E76F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4v0tK3664607
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=; b=C3Tw5nHpALgj+0qW
 tXRn0MptmjOfd3RmVrEqCgzgzBoe4shjTzPAABkERvD/tBs2I7IIEBbyyO3WqWzf
 sST6p5zwrzb5H/KRn6nhZzkSLRWgyWkahBJJGzWJPBZ+z0gntxqqF8lgRZMMU1kK
 8FVa+V/nnTgyFr3H+pGrs0jJPKPWggpqOlHp/b3ITCwKbx4Tm5Ixqy2m9fXFBQWv
 hm/U8bMH/6nBNh+ytPSBVHHI0OKJNKHW4IEwctOfXIymZ0XSMW6iNsy3TLYUz1v5
 VzxiLCUSnpAvXm0rYg+tcBJArV6EBbnSeNcsfUIP0/aJ8+dU9r9DaZd4POJBH2yC
 T5sXnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3sv7k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8908a248048so1672793585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727916; x=1762332716;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
 b=H6GK2wYyifxTpe+uhBYEBASv+DghKV4XOCLM+O0N+bUkapmkh4XMm9tIZNHEpjEdI/
 pTkQwsZK0CvgcxcK1+IxuUhnAfQ+Nn1M33KKl0tBDeKsBqcEfU0fpsnYnNqoctScfkTH
 gu/nTwF9vd+jJcd2R1GWcyGrT4h3VUbJg6tEIjQGvEXfF1ZzZ3p9oBFU0+a8h4RBfHbx
 stYykLngPAdpwBzaK5imI6Qa0qDHjR18cHCW/pwi7b0PG9M+LExRQvgT7vE7fSguF/Q2
 Z/l6df1MBP5NBvs8Lyd8UDWj+pd6/DbSBylfA3dCZoxgAtekO/k6LDJOz4HYSpz+tGxh
 Wznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727916; x=1762332716;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
 b=QKVK8s9eB4u6752LURAEJi0ZNVXTjXz/k/8HD+YNglMquLr1DN4C3OSFwufKrnh9IV
 FFyjRxJib0XKU2Cj/ogPXeJWXIOfVgA68Y2UqdtIcRy8Jx4zpBfKjH9i//MsZiEgYHAN
 JVkIhS5UC/tchAgw6giR8slls7pWQZ3+teYft7hPz5hna7fLYht8YTRMAkFKytyOri3Y
 80LTol5duXoFZxVjp4YLRmRrVDSWdNm6Aj/vIfwbvgtBB5EivFfxNJBWfGgRbyFmq8DI
 VcTqf+9abbbAImX2w2QXStipVFEOOIsUFmq3RLdx8K+BSy8ZpSUV2WlqrI/dD7Qlp9s+
 SfHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhZcbY4rY8TyNmpGf048MFXmS2MjB9NySUEW9gUqRl+i4UDWev3iR74EQlUwUgKbQ0y/AXhrf62d0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGmUwrqY7dPFXeRcIyTHyqtxHqEZAnuHa1TvdAUZAx7IJQogFB
 rXMlQpWrEGCN7FbV/w1yU5jVhk6PuUKrbncwpeIvuOKVorTwrfSm+jE4WY7oM1IfM3sEwun9gAr
 mma1ESfG1/GT4GoOggN0Nhk0ken/AqClKLiyi9NylwF4W2f71TENjroxZfWnHgdZWRDcdw2k=
X-Gm-Gg: ASbGncsX0OMBiankFqUQP+Eggbz0wtqXXujQWlh/Ouj/M9yt48fk5RYYmI0M8GMeyUK
 5TJP6Tky73VmIpm3MXxngCvhL0aa99iqWi82TzDhDCNCpGXqke4A6pqLs70eMPbbpidq7bcH8Cq
 NA2BYvZ0y1GVynQPSO5L3pH9L5aG4EWZRyjx3CS6t1q5DwF4sshYpjbD5PF3340tN3SU+YY8YiJ
 P0aYfl9DxM3Gf7C9vyob2HTI2oqQC0GoXXbW/zMceVEbLLQYMhmZsbfOOx/MZuOBcAoa7l92clo
 IX2gxAt0xaYKqp/jzObXkJ/L/UElTJgo8tR7ZQRtzdEP7/U7awkd/C0s2D+ru7YuKL45+Djg/T/
 mv8L7pRXdp5tKyBsuKmG3sYY=
X-Received: by 2002:a05:620a:40d4:b0:891:a480:ee92 with SMTP id
 af79cd13be357-8a8e8f4b236mr263534585a.5.1761727916307; 
 Wed, 29 Oct 2025 01:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI2PPKXtce5YNBSyc9dJxl21ePvANeElFkhe5Zdk44ZWE7owVm6fkHwQ2Bv7PW0DPT8yoJzw==
X-Received: by 2002:a05:620a:40d4:b0:891:a480:ee92 with SMTP id
 af79cd13be357-8a8e8f4b236mr263531985a.5.1761727915839; 
 Wed, 29 Oct 2025 01:51:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:51:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:34 +0800
Subject: [PATCH v13 1/5] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-1-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
 b=/VZVTs/VCe7bEotB+iOg1SXvQxgcLXB73EUedAC6ofipNZxQMOrmecv2X3OIP4zJJRWiOZ1v/
 sgCB+hAwthmDkZ9K/e9+jc+Sq+3GbOhUuqoe+dIa3hA7sgc7TMZb42I
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 7GRHWQKTHqZd3qtWbXyiihCy38OSZqdH
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=6901d5ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0ru3Ub4c0dYyKLRCKckA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX1ItbDsMYYu2f
 N4VezmmG/GkwpxLw6Nw2U2g+b8WFAgWh6JihRUPay0FeZkNf3nAj/7SCDhaIhXu0ELScB7kkSqN
 DvpcS8DkKIETUAH1KZ1s/n9naPRCAGBMHji9nLZlPL3qOQ8hIyGEcWzFQZgDXFDMpjL4xYVQTfz
 zsjSKD4hQ156BceHHDhlsey7VhQXe9EOSES6rcR9Ts8Q9b1V7/vEYgXPmRGZh5cliwbdKgPHwPq
 13epAADPeTI4FC3LLPTHKRWZQmcC3M9x6lhj2Wd0ZYv6dyVS524YulsCbKZ6IPxiHMndn9fOB+e
 oF/XTdhwbd/tW7nz+4HbU6s+Ik9ghm0xWs/91sg2WWHlgaWaS6g3Jc68O3eByZTMeWGen5zCE4a
 fi3j4s6ePtG2Di8DkKf4C4T+cE0+XA==
X-Proofpoint-GUID: 7GRHWQKTHqZd3qtWbXyiihCy38OSZqdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..d9b980a89722 100644
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
2.43.0

