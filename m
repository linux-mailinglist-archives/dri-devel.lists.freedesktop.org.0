Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19917C19437
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC52310E77A;
	Wed, 29 Oct 2025 09:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cadfr7vj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmlRrqKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3437D10E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:02:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4urO93642849
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=; b=cadfr7vjOW5fuuCb
 QJGsN1KLBOvO8/dwJZc/b7Ods6U2+/E58bWPcrSemXZpLySSvufKu3yB4lWqRNad
 1EVzMgwMm9hws9mtuOKPT6A5Voz1AJa6F45Bl7Tm6Rg0KWBooTGgpJBTgfJY4is/
 +I1KUSzwSv8wPlC6Jlnz0kV6MrwCAl8DbkFLUHCHW+1aEl03ycTRXOJ/2JycECQR
 BobhRZpKTTAxxZV5dTr3fc8InOR0NJWAxz7g6caRQfY0Pptp94fxlM3eI/qK7uti
 +qnnM19hqiVqOt5K4e2eaz07YjpyGcxYek8s3hLObx16yDI8y9JkgnqqLZpcI5ht
 Vo+WBA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hwu0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:02:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-93106ab672fso14120992241.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761728557; x=1762333357;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=;
 b=DmlRrqKAzNeW0R6zVB0Pa62vKd226mM7ZIlBcXnfVsejJ5xbRdQDkNM1cBSu+Bxvjk
 FnFiqmUPWsKy21FIh7G9964XHW7uzPfxdyQfygVtPRmbsnoWlkc5Vfj2L28Z/l8Uvu1X
 BSltH9HiunYAp8mHfmvq/pgPHcaEhqJn3obhL7o+dZ+xvSO20PtOobaMIjcFFLb7Kcqn
 NKgnEBLdR9ULt3QTQZgi/Dp2w47PuvAYgTANp1zjNDbnN9PRAx7fyuqVvYFw2FSRgvIY
 GXD4S+eRwAu5IFScM/tbcDJm7toFAqKplfAj7aPgKPlnc/n0rE1J0GxHoBZj1xlOixkP
 eL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761728557; x=1762333357;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcxfMN+1bRCduHOC294NQfJcwcSMEOoD0temYuovoU4=;
 b=NzLFh9/WIu1Fs4VwJI1XWx0T3AR3+G9sjXz1M9Acz3jcXV2j969y8WZIv1cJdZ0jWj
 gDXO/kKLijyXT3orXwwGFm1RrnqlOx5mWA+oJUckQr4h2Kr5JTFUFxDFmvEGc2AUNidi
 Ofn3R73Q31rLe3dGPuJFPhbWe8NennGvM6dtMu5v5layfmTOG7zTOU9zxIQ2RkcudZlw
 /tR0Af2UQ38xMYwxm4GqbhNwUoPXvUbBdiqj/4iW8nd/DvQq6WmIQBLQpHobTtS/rkwD
 paGob/94LfGVVKhCvHQFY7KCu8ayKZSZsopwYUy6CDNkVywX0NzJcjnv9Ngomgh9Lg4i
 gDiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu7PDSk2jsDg61u4o3F+wVy0XY70YntPGfkjhHVjZfuICEsdl6Ph7Y+5BAqv0styqY00m8zZmZEI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1goZHaM44tpQxoNqaW7QM2zC/Ow7HrlSh/llDdGXrqvJcjcaT
 2YZ4U2OUzo4e3YRCLqNrJ5MgzhEHBZ+9IxW3JHOl+7zbnyFq8ZeiMAfJMaQ1R8peWZ+xxee4i4B
 O9op8tFao81Y14j8QI0AhaV0WffJMpzqOipu+jWBquxruj/zkNr/woOBMUsgDqejfZovXkDI=
X-Gm-Gg: ASbGnctJwOdFDb5PW3G2ZoFAMlLHCXkMO2Yx48fJQynBrToDQYLQjyalPIuxlau3vyk
 gzrCtvzrJIIF5ehQTPwDWFXUeI7De3RhT4NfQHwYRLg/YbiUfM1otW1zZ5w1Dj8pgqz1TQAYDPU
 joll0WW3RUiNlOarTDAVFhh+bKHa2bDeYzulML7NexwHh4aAScWZUiv4ZbgYAu2qrtWDJdUmeWl
 1BGCu3+nQLEk/J9KapyKdkBypv3H6gdNfQENcP6lSIGRMC1QzaOp8JNXHee8w5EfmkARNtHcGA5
 mHC5hiKICGyrozBVx6XhjsC9JC9pKtTiIf+y8LX1hysIk802B2OJZED3SBpyzklvagO2t6TDyPU
 9u8I18anKKB5tokitcOkCXaY=
X-Received: by 2002:a05:622a:1448:b0:4e8:b21d:88f1 with SMTP id
 d75a77b69052e-4ed15b553b6mr25060831cf.20.1761727924851; 
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIjiYnP8CmOdJwyrlYE0ezop3noeqHZDiwSCLu91+J7zUHKyBeTHNDIOJ1tYu7xGib4zKWcw==
X-Received: by 2002:a05:622a:1448:b0:4e8:b21d:88f1 with SMTP id
 d75a77b69052e-4ed15b553b6mr25060561cf.20.1761727924434; 
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:35 +0800
Subject: [PATCH v13 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-2-e8c8c4f82da2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1102;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=32UZGh8w+Y66JdiY+deLaqFEMHtghnX7C5KIbxCtz80=;
 b=xO0ks7BMbn2ygrt5SJF56XAhsW3eyB67Lj2pj7pMykuQPA4fxNHHn1Zu2WCTJQ1crpTf/5RTK
 foM4EMKKA+gCqUaHoHL5mCeXSDFo9uRug+vtNI1P+t+UM+Jqe7/t7e0
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901d82e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W7hmKyP8XuOziMQ-xZMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bz-EsH1rVQvLHfs_EIXrAqYIZj8tNHwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NyBTYWx0ZWRfX/fEXlR/jAnqn
 UWL0oeo77nHcLR560VcDDPgg/9xjJAzrhCsTQRpXfGMSJdGa0bHGk7mJs8iq5cDJZEylRetV1/T
 is82pF+okmpPV273FaOjtc9q6O+zU53CGxGg7J41+TrIRafTCNpS73p7DyUj58pEwYJxsHN8z9o
 5kd9qqVepDMoVeUoGHlQTiYDMtUlq4N96Tr2+CK7O6IBI9yDIZwj/1RUyWPhwXTBdfQYqOyoToj
 tWLjNa8eSOAQEn1a2004kxmqLb4kz29hUd9qk5errpJ0s0/TsjXIGxiLhX3LtNAR0qiguoA9C6E
 2r+7GfIXsqgIOSKAC/OZ7KkJzVfym4flBNKA06JJoGCphcDh3qUb89SU1p3RfFuqeH1WHkIR/Pk
 ZS8b1feA2T6Yo+s4ZHGnEE1EImEFLw==
X-Proofpoint-GUID: bz-EsH1rVQvLHfs_EIXrAqYIZj8tNHwT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290067
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams, similar to the one found on the SA8775P.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044..ea88e1903f26 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,11 @@ properties:
           - qcom,sm8650-dp
           - qcom,x1e80100-dp
 
+      - items:
+          - enum:
+              - qcom,qcs8300-dp
+          - const: qcom,sa8775p-dp
+
       - items:
           - enum:
               - qcom,sm6350-dp

-- 
2.43.0

