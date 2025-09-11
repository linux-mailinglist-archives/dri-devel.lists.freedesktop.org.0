Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7978B53027
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268A310EAA6;
	Thu, 11 Sep 2025 11:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwRPrjMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820A110EAA5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBGKUJ000568
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=; b=hwRPrjMObMo9ewQ2
 bZ2FRPfklMfCBgxcNDuAMvSOQJEL3OMOZlMu22wXiTQ/Pz0gaSk3KdaFtYdjMPjn
 BM+kYpzsBf2pGeklKaqK8OVdsf38EDkH9ghLHcrgiNadZ5msZEtjFvKhP/Y6vk/Z
 25J3im2pggNKTRSiUHvsM6VM+4tTDeLzfhoqOks0xJZNWMvoaBadFD8oDGSjXNpt
 dcBA8rPJ6whZC+LXskg3pisw/6FUnvUrP2OfcGTD+DmObqhRGbzbluS17JGj2xEt
 vGXGHkkUX0/hbwcBLd/elrGPvcW7DSu7SNfaRPtCYcpIftlluAxDOeKhdW20MWnf
 az7yxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg762t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24b4aa90c20so7153705ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589861; x=1758194661;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
 b=PJN31DzaDKVYUSEEbYHWjFsjrMQo3s3cli1ok53zN5zvVmeBf7BL8ygWF/YG3j8clp
 Rk/43ahfFTqAV6hY7GO+BhDe3Hf5HLKfegkGMOjPuvZseod+kNnUd1c965NwMcWhAkFJ
 v1V0WdtYDEc0jizQUPHTdK+CRq8c9pyCxXyNs7KUIZ2Io65JfpD4JCkhJ3mMyAOTyfUE
 JWECTKtrOEySkZFKY6JuW+E+fvi1rRDsA/CXS54/sA59kPH5EoRlUpgzknYgPD+EByJm
 t24gTXbaeXpAI6S/yb9FayinbJ/oD51bWYbGoRUM6h5io5gm5jzbeIcEiwDiLkIbD+L/
 hd9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9A6RxFhNavl5eS+vmlg3QBITtMvJbE0wnNwu/qz7zjA+7MU4fMvdECTQZIihaChJFP+tJPXrs+Zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpsYjZnvCqo3aoiuFVHMhbuKztgHW0H6FIiHqRQQKpngPpr+bT
 OIfMGnLVn52NRSmMUlYlZtW0Ovb6gL72PMJCYx30DsLrWb0SkmP3zhHyS2hzypSOFg8r2WV2vg1
 pANyXfpAuVv1JqZsc57NOpr9yVLceWfypEltYAppwmJz4OLFJG76iAswRQzfLHGCAXivlkvg=
X-Gm-Gg: ASbGncttZa6DMtFkIPHML7kJOgQ10Yv2Y/pfO79eXM8bVQ+6/5QxacF3hsQ/wxMdoUB
 AGjA51WjRLXtuoYN980pUpfDiK6TZ5k36tRpGwtiKjPSkibQR7bafu8SfE6qPoXBxEu5yg4FU+u
 6LNpp8DUMT90iQYaSEwsg1ea4P9O+NuQval2d824AG4I9UiLF37vZg7sLRztsLU2vgJpjd5bZXw
 xdPtB+1s6MAAZ1cT/ZWgqJW9SqyY57yQSYtUgfdZZuLscwld1lx/b0aE3zgIoRqt9jqs2DuQ3Tf
 rZQDG+AFaWtpAm2MMfSWfsmLFyoYGNVtPwwdFsL5XJ2VjzFcKVLEPZG8lnv/5u3NlMWHTSSLwlM
 vWNh4pLdMZJO8Q9RQtus3st5qxVvmtPz3
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id
 d9443c01a7336-25ca9a0ee09mr5664895ad.42.1757589860739; 
 Thu, 11 Sep 2025 04:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGwhy+ThWRQzuFVTo3tgTP57p2T1jMEsKjOoHNoY7Em1lQydlaLgExlKlN33CpwQLV12SmqA==
X-Received: by 2002:a17:902:e886:b0:25c:a9a0:ea60 with SMTP id
 d9443c01a7336-25ca9a0ee09mr5664645ad.42.1757589860248; 
 Thu, 11 Sep 2025 04:24:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:01 +0800
Subject: [PATCH v12 1/5] dt-bindings: display/msm: Document the DPU for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-1-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
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
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
 b=5XItcEhzZr/Ql1Cbibe/YCArxvl6ARnxlQ2S6RUK1cWoBIjKyauD+Eq+u4y6FKJtpzjf/gEjm
 RCFyyfO50tzC4Yl+qv/XfFLb8u3DpagmsLf0DbQDSM/if3MSmoeMw5X
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: LjPmXVkAkT8QWgVielbRL2k96QwibgAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX+lBVQc7IYhLp
 GYmy0yKxd5DqRscR7/4S50OzWAVQ9Zvq8TEjUKD2azlyrmSu5m8uWoRD2yqhJPA66ZAK1h2Fbj+
 4h4pct0kIWoAVn8xN65udmYlOAlOh98XA3NOLkZpiI8jjMYKDSf19bkyBm14eNR7aQ1L0Q5UWV6
 cHxXzFw5Ra6ru+zUzAigSLyoDx/lbUmRRpkpZ2GEdM7JQnzphLOqtUuvYJXLHo21T7agYQlsNbl
 PZVpbFy0mr1llZ7QtWTYvApuBimO1REfIL0rIAxiwziY3moRO3Pa5AYXnKi/PvjcFOUcKa6jSJJ
 LryV+tIErTNa5oN1P+pleeIUX9tCGuar1R3F0RKhBZXQy5YcyICqhGJahtt7snDyujVLmNBN+Dd
 JiWvKglR
X-Proofpoint-GUID: LjPmXVkAkT8QWgVielbRL2k96QwibgAQ
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2b166 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0ru3Ub4c0dYyKLRCKckA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

