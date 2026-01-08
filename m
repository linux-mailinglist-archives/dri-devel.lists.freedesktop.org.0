Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE0D01AEC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6B510E6B2;
	Thu,  8 Jan 2026 08:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEBYl6Kv";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HH1WFIyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4B610E6B0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:57:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6087QY1K1259090
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=EEBYl6KvoIoXRs1gtt7AnVm2KvL
 7QB60ZZCQAY83/RkQikpbqT81WdjFOfaIi7maOlknf8JZfjxJMb2b7ksj+uE75uz
 6I8fKvDwDahSxLqemigUlAp35wQ5TVKUd7w34TrF//eFoSUlYz4G9cnXj2UaV8dL
 ZuGA3mdCM1AdozYJWEPCTMom/BAqf3+Es23IywaReZIeCOkM9gKTEbHAX2gd9SAj
 7gjsxVWaPhdw2XNlWfdABnnXSF8u4egnN1M2wZBjdNN+Q3++0nk0BtBCBc8FHZJx
 CExANVrHuHbRpr1Fjn94ATa+8Ak2WDHO2lnugqQXYC4K3up3alM3yFu35Cw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj86gr8kr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:57:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-890587d4e87so67534556d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862653; x=1768467453;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=HH1WFIyTa9U/troG51tonfVztSSFS2ifFdeOFAz6h9R17rLzDFhZHfAPmL41pVbCI3
 xaXL6YvU3bPb5XxfOaJ7P4s52Uk4nB7OBonhZIs0BrM/+UstGgZJNZhNpv0YagrfYmXw
 MmrvdLVaU/M5ZRVpuUfqvkdwyUPhyX3A+tzC1eq2LJwEqXan2dUHODUCxHPGaTMFixK7
 8Xf0FcR/ycKa5jGyQnowbMDGdQlF4V/IlfP2QG6Yf8e5gqr5YMmUsaboEAj8FfvAWZXn
 Hpoy4d4YNOICWLroKxvJ3BYgTd/Bbt1lZtnRx4Ajr/AyCT4t8fv7h3sSSYKGDbwI3yuD
 xMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862653; x=1768467453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=pGSeBwTfzE4+WnLqvqUQc+ms3AU0ok8NDXoaZ9Vf8jJoIFDSkxID2pp6qQao4BRB4w
 Ww9ObzXP8+raL3Nc23Pa6c4ZdHzk+HLDmy5UZK/hrLArw8QrWoNdoQpvZ+9TY7o5SE7e
 8G0IFWJRSMwioHUiRe9M8NDBoctP0eicwDLOcAPpayhJQaXfiy88ki35yct1urgKpeIA
 aig+kkUjasr61rKBiKBSdkhvIZL6vC8PTgMwsF+09GTNspCEuQzpBgE0XEyKt4rjlvgl
 XgtxLeFXgmqnOk1PCwdS/f+CATD6ct99JUojWpJT6fgkbsBgFt92qCElWOZHSu0EU/wM
 JzhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr4NDcB8a8GhzhQe2BS3GhPDJKH/WWhFi64mfIjD1kv+ud7ZnLiFcaqhtPrxVmehDqvfrdW+LXaYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQDBOE08+2IND8zqQtc73f3cZO+OGlUdslLtDD00/oSa4Y6eLJ
 yd1qwQfdWf5TXsY9Rukye5OfBJg/BxxCi7to/pw6k+z1afQMCtXEh3S4xmd1aAN2/za70vNuXfb
 Z5z93at+LOy9ME1VgSH9VYn5xu1zErbppLrF7ZH0fcZ8YiwsAwhBtgiQqjWLbTG4cmUOXNsc=
X-Gm-Gg: AY/fxX7r5TV/Y+9Se++jxNHyBMGnzYxxvBaN8V1K26PSw1F5ylzYH1S5d/82YNVf9I7
 nSkYGkikaBSIbWrOayR1MvTpBUGlcDB5And3X3p3g3MTMWqwXyNSaxJ2QfDX23XqDFI7YBlAnFi
 M4LbqlrZgvKJrcg+H+ZZfUdpM29e2+ZjNCwBq6SfHKr6Y33Wlsx+YE1SExBFngCD+6aT5ZHPAKn
 C71y9poAP9Ckr6oMIGvd8BH9lzlU34BjAk43AUmxar18MlHy7vqiqYpebIrOekRyB9U0zWRv8XL
 B+ZDyb0StU79GHPQq7Ks7AzVoG3K0/4rqB6S0wqaU0L+gjVGELI12Z4fdVB8IoX/51At+nNi2gE
 kwfw88KdUS0VZl/M+KcwedOH4IuTY1poSLdTrZG0LPRPRyTcH9EmGx5HB/2+l//QMpLQ=
X-Received: by 2002:a05:6214:4113:b0:890:8244:1eac with SMTP id
 6a1803df08f44-890841af6d4mr74582856d6.29.1767862653059; 
 Thu, 08 Jan 2026 00:57:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/Evr+b0nr4KGzD5p/6Wv1eoS+TOm0VkfP2EcZzyUCS11BVsI7wQRinfhjGKtU/zIVgywDBw==
X-Received: by 2002:a05:6214:4113:b0:890:8244:1eac with SMTP id
 6a1803df08f44-890841af6d4mr74582696d6.29.1767862652628; 
 Thu, 08 Jan 2026 00:57:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:57:32 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 01/12] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Thu,  8 Jan 2026 16:56:48 +0800
Message-Id: <20260108085659.790-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=695f717d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HmnE5Gf3TIDl4VrW2bPyHS3_VSiCR3su
X-Proofpoint-GUID: HmnE5Gf3TIDl4VrW2bPyHS3_VSiCR3su
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX3VJWBR67ibom
 IYqsCpILM5qXtPzkUJSC58e9pWow0GhuEAJEft9y80kPQS8zTYwN2LCJA2xmPHVPW84lRxQ/xKJ
 JmcfR5YeE9Iy73tDLsUE/3Lz59nMyRrk3xgDelitjLCPsIErYveOgecpSxTFs2dlvodqW+sggeM
 YufSuEmE4bqM7DPcwdhKzFN5xdkR78g0kpSrNLLLpXWK8gzBGcpV/rxpUkd+jcX2kIQX1/Lg7aX
 61t/hrmSaasi3t6qTbamIBxVLJOlCvDUcuqUj6IR8pxwG0bCGnMTiMbMqBHT3ihLkE40YRySwKY
 ArsDA+2cm5wOPWcIrcd9JrAKRmwCVVeV3FqnQPuyWHwdwrIVoblgX5TDiFSAsAyUkaRwCv9QQrp
 5onb22IkYxkaY3ja8zDEt/iPkBySqALltR9nYhs3d7Se8OxFvLOnAcYq382939Z4ABb0a0CXOEI
 x4zTAvgy+6DimYWtimA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1

