Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C85B141FB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 20:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696210E56A;
	Mon, 28 Jul 2025 18:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxRRx4bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C5310E0CE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlNTq005104
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=; b=RxRRx4bW+XfnjtNx
 cXxPfHvYE3kKcnxdM9/MlmG8oFS37+PQ89XZIIdeXMmN9m4UyeGOIbVxbWEfKlvS
 zXbdCe+sxd7uvON5kJ5bGT5M1SfXV6Nh4gzvfEBbKHpLJwV2XUIHDEXCTdCLaTSf
 fdQU5TEs2rlvD0xvSabZilWSFqE5tszYf7KDUH92dHYXOiFYSFylsv26+GVCvruN
 oLRKd4vdPayCzglgYIxJAfQwt4ECUsESUbzoaOoEprCJjLSFPKfcxOx5cBl/kFyp
 LodkABTEXVQz+ErtotXVSkrcRoUxOYsoMI6/Op+BMlhuE7BcbMVIhZ59POVc5JPe
 jH82uw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytwqer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:29:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-240607653f4so1679585ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753727395; x=1754332195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oT3tXcSx8+6IFxvzSzWBOGBoJkG+N20NCBDeHWmRh9g=;
 b=EO9ZnvV3dSPYjUp5aa6xpgX0+XXzg2Zg5k5/OS9rWYnx9VWpFU7kFLJFixOoTaUW07
 pMkwhbS7NpRFC1OtQsotmyg6HB+QwBWBmN5zvnSOGJx8mtZdb+ikAW0m+o7HGmZ2fCA8
 nU0cZV89tI6KYJRjhq7K3gv0xatRFo694X216GV+Ns0Cuhp4+IDHPN1KaZ7Ch4zu4L0A
 MK9SxR8T7UotwDqhGhZk08gjy/3jaXsljWrJ3BIhYk0uaXzxjoxM9rD9ADhNTyixcSoq
 QtjR2blZ58Dj3iyTP4KTXcJHAeHwzyGPzd0iE83Osyo6sFZhQMnTs/EmkW1lRS+XZe3H
 KxnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzEGs/rWIq4qkXvRqgkHPcDw4r+wZj9wLtJubaBPyOVUIj0E8+mAwlAoyngzIw3drks2xQ02so3rU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCtplT63j0lLLzkgu48TQ/h8qW/c+BVBWn3JWnpcmfOixPCqTj
 T4KiOh5LbG8JoaPXrns7dIut/WvNoxW+lQGrtgOkhOFidYNObB0ArcilIw86wUt4VjjITVD1lGh
 MRhojIwkWvc0ZFDIHDQ1TM744CWpKd6zg9Pnp5DrFDMc8PZ8iP8VtrdLQiwl81etCKCJvTxM=
X-Gm-Gg: ASbGncu99uOEwe+e6K5RNdKA+Y5ct1NwZEHP/24KpqTjvUOBpXnh3QLV17YKllvUc3S
 1+edrkaWQ2hAJeLwpbL/AEy18huzv3u75nrtFcyDmZgzpp+fr3RGN3+Skwecs8wSRTUEQDoH5nn
 f0u/ODOxrdSDkXBK+9WHXKZDCGUPOsSWHIl9hLdrnkR5i+sb4ZvhnOi9WAJ+QlO3EtnziF6QS7W
 9QPh2/MM/pjsorTjlFc4yrbpLv81Cf9s7yV2Yka55CliJH78Lk/q1WdKRi5BQPvjrrYfuLd1qpt
 3PGqpZGUr99txKi7DxSPhfEcGIECGOGgbU5x6cfp5C7IRF2epfWwP2G/ffgkJI7LZ6WfWo2mFhJ
 5fwwtK6S3TkfmOiU/RK4+RQ==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id
 d9443c01a7336-23ff9835e51mr72280465ad.12.1753727395421; 
 Mon, 28 Jul 2025 11:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAAEQKwWNVIHaeiLUK+6MPkWiAUDHenXFMWUMIoSJAH/g0px54Std4EA5mF2F39xEpbfaLQQ==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id
 d9443c01a7336-23ff9835e51mr72280055ad.12.1753727394829; 
 Mon, 28 Jul 2025 11:29:54 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fc5a9d219sm55658715ad.98.2025.07.28.11.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 11:29:52 -0700 (PDT)
Message-ID: <8399dc75-6363-4ae1-98cc-59b5b62dc8b5@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 11:29:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for
 X1E8 and SA8775P
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov
 <danila@jiaxyga.com>,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wFpO27UFhWPs8owqSFPZwF6bbwfNu8-K
X-Proofpoint-ORIG-GUID: wFpO27UFhWPs8owqSFPZwF6bbwfNu8-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfXy98/MsRWkmDI
 SZbSbE0Ik3w1ubxM+ygmFp/weH/V9t4ecuDKb4jx0lbCHnApCZOH3A7d5W+CBcAYDprALA09UwM
 pjk3m+f5QryoJoahspgaMZHg/w7nLB+DZCieaSHWdzu2+JhYQjBMIttlVZ8dxy8mWGxw704scjg
 U5s8Zjzi+rsWWy26dSUMtyKFbg9tpHg+3k3Wf/bifiRALXxUr7s/wqlZX7QwoSTINBdDKWeAECD
 A+2emsXDN9QV66b7HpXCEmsnkgBUGvuhlHhEKsctxOflYpxF3F3Wq+NC8EfHTe2Zpa8QVt0mrqN
 wURyWaALayet1ciNNDusd8V7N91WjZYZHf6LxPm2i8XshTKGiZMs1yhGHJd41A5SKCTBtoUFyv/
 YB5f6YvCwVDw36AooyzgtF9dRBXZJM7utjvGXpZjLqxuMOg2qqmBW0boa4ClZ9RiQv0PpFdP
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887c1a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=wmqSsp3ovfGiw9AtJwoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280135
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



On 7/19/2025 2:14 AM, Dmitry Baryshkov wrote:
> 
> On Qualcomm SA8775P and X1E80100 the DP controller might be driving
> either a DisplayPort or a eDP sink (depending on the PHY that is tied to
> the controller). Reflect that in the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> 
> Jessica, your X1E8 patch also triggers warnings for several X1E8-based
> laptops. Please include this patch into the series (either separately
> or, better, by squashing into your first patch).

Hey Dmitry,

Thanks for providing this patch -- I'll squash this with patch 1 and add 
your signed-off-by w/note.

Thanks,

Jessica Zhang

> 
> ---
>   .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 4676aa8db2f4..55e37ec74591 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -176,12 +176,26 @@ allOf:
>         properties:
>           "#sound-dai-cells": false
>       else:
> -      properties:
> -        aux-bus: false
> -        reg:
> -          minItems: 5
> -      required:
> -        - "#sound-dai-cells"
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,sa8775p-dp
> +                - qcom,x1e80100-dp
> +      then:
> +        oneOf:
> +          - required:
> +              - aux-bus
> +          - required:
> +              - "#sound-dai-cells"
> +      else:
> +        properties:
> +          aux-bus: false
> +          reg:
> +            minItems: 5
> +        required:
> +          - "#sound-dai-cells"
>   
>   additionalProperties: false
>   

