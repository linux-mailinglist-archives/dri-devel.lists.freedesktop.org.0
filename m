Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBCECFDBB8
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6D10E5B6;
	Wed,  7 Jan 2026 12:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN6iTrU3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bF1xjGoq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFD710E5B6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:46:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079q6Cp218483
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=; b=RN6iTrU3VB2qgl9d
 QtU1sc0cDRuwMNnKNfHdpyHoTDp7jYFdVQ5EXB2KINELruGUuP25wuyURuUaDmQx
 pBGyGwlLTk0h0ivGy+me8zBwbnLnp+IoaO5r0W/X0sCJ0tkgNKFFIE2UKWztTg5w
 B+p16NwgDTzfKrsxNGcLnrzp1sqmImb3mcT/Cszi+TFwdWtdp590wvyeymKzlF2Y
 gO8lDdecE69ep/OOKZHYwfrlnbo/UxBZjaJDj5fIkMqNbQrH/dnoShqaF/7pcNj7
 IGI1NvU/G8Fc/P1dliMpaTk79MTrFVlE1Z+oK1saG9unX17kjHTTpsDGaL5jdrdr
 kMCvYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808fd1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 12:46:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee409f1880so5206451cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 04:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767789978; x=1768394778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=;
 b=bF1xjGoq9Ml3lcKq22hkSIBZ70nZ1ylWBE1SZrLXtnlUecA+H1e1In6TbwWM96P+Pp
 NMBcPHJ+evPtJtoE7ooEU7xxoVhS2FFLL1+YAJ/28Vn6fheLYs96buMqAULCu9FcHH/6
 +YPqGVG7xqaKPoeDq79YSiM20SLW4AvSrmuQtF8fWgQNBXRfRLLNgkW6UDnSQErwMl1f
 vq6jtpLNlwpIM34uTPIE3zOajC2mvCsk7fTuWaWBhB4/cgrrIYpBXEexv2ITqixpXEGS
 wOVjz5vCGzBv8ZGs4PhcY4OqD+1coNqH5xvbvq7l47siL+wsb6noykrXWFdEJoaovD2O
 ZLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767789978; x=1768394778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3yqvCDKqiNpbPEHOy8tGkkpTnMSnoWF3DxtL8kCAuPg=;
 b=jKh8ABTFkRlIroucQOLD8JSTuoDoqQzmLNLRLM9CkGLGKRwo3KIVd3Yq8gyQygs89X
 jyqBFdMp1BcEzChQQ16NiAQO/8t+LXIwXe40Il/Mq84/W53GNe7P4DevSYKEv0Yx/c2Z
 fCQnRnKKuI2VXpYhVaLqjkRow46Il/HyptkNuexgyfnnBLvWLeF4TF6aoGAC8XIuU6Jz
 5vE2jyxRwSG3+qNJb9G5paypb5L+Wrc4lYCGy4R0F9p7/tzjaIQq2c+2gIUv5Lbv3HUq
 WsexHqbYmQTlhipyO7RS4FXSmZg69bnxHnqGXmkujX5O+P8KkSrntFth0uusvzekBY2y
 RsWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUID1OoXwTGRMCityC2TDYfZjJQUcQvWx/jcfbywKv/SSRt6X676izkDiwK2gNMe4ryszb+4JEriJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7PD05LkrDkj8Yo2DuUYqalboFX7+tTPXEtVuc33tPGOcySeru
 Xurf0zzRd92DNGx0x9NTkNrnwuSjepT+4qY+CHkCgzJEEVsJ79KsnCJSXs2VY1UAb8SVqSuJ/K7
 mfCS0ILowm6PBFvRluJZwz1+FTZGJI1Twcmw/ENGpvZU5DJPtWmsjviR5pPvYvOFnsKo07Pk=
X-Gm-Gg: AY/fxX4Yqg4Bb/d7C5v+38iD/AQDrQSuJKsgXMMcEJdzpomBhycEWLbeHp1ZmuVOvEa
 wOCQtFM+Jx5e7hyD4eSg80dN0yft4cd0ewEJyVd3oJKMzS2JP2Txi02QxZE+cvmcp8lFeT9PaEH
 oJztWXsvJ2vKuV2L35uAikcoIzGHXs+V2k51jtFAtP1yRk2ZpnGXgy+S8so4SjS7Lukw0R/uQj4
 tG4SY8N5GQHzkgBVldea2CXPmDy4nnjNl951Efyr6qhZMyMUwQKp74b7UQ25HKRR1g/hrHTYWfL
 qfma1aVhR8JknPBFjKxGwS2eWeffvs7M9pIdR094KVIDK4BE1o9O36wISZib7uH5m9+r71vgdoX
 Tvdq3kMtK1GI0dzXUIczHMHm0ZXbuZqENnmXdZjt2oPTP6l20qXlH5fCRu1Lc4fr3pvA=
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4ffb49228d5mr22508071cf.5.1767789977827; 
 Wed, 07 Jan 2026 04:46:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuq76ypjwiPaJO4Y8VhWJy6P9lceYSJblxYJEvU7RctuGjrhMp1z5PIJTROZtJnaK85GCmQA==
X-Received: by 2002:a05:622a:110c:b0:4f4:b372:db38 with SMTP id
 d75a77b69052e-4ffb49228d5mr22507821cf.5.1767789977325; 
 Wed, 07 Jan 2026 04:46:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2bc7ffsm512039066b.26.2026.01.07.04.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 04:46:16 -0800 (PST)
Message-ID: <6b874e4b-a906-4153-aba8-b0ab7a12d5c1@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e559a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iMXfbfRCx5d9ngtYL8YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gm5WhNF7eDpjEuofb9HYH93vjvJ46IFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NyBTYWx0ZWRfX8EkakQ4vfN1C
 Ml0bSsXu0SPbL0YVaZNVUJosUOUaLkksDEOsZoOzdLpGepymKyHcizDw176ks/MOFXdZ6lgRSCH
 edLjhpBHM5UCYrAvgUyyRjsSwmYpzyGkduNtvWcLqUV3fsFWkdTHAPqj0ae0qdHbu3j8B32bxEx
 I4sfRERLjFHlPSaOcO6IeXz6WSPGA3IxImVCdeBIFkZ52iomen2Lxdl76bvUEeNvgdrjRBGsJs3
 f3BkdZdwBTuzum3mUOAttYzqDAB+uuiW0z8ItW+67IghmCVhU0QDD6jLycn88fTYxf+Y68oG892
 D2/C+DAPqOGjRx1wFN92DNvuXsOqg+G5TaCPdtaG37zYHSkPBz1heuhb8p2QuGEdEi3igKiuEsB
 nRjAaKIWidiXNBZHJo+UoWNB6UlRxOPAAyAK8/5/MUHtpBZf+Q3E5NCKtnuHwKpTd7DYA5jpLy3
 rrEYFRzODA0TgpRHFvw==
X-Proofpoint-ORIG-GUID: gm5WhNF7eDpjEuofb9HYH93vjvJ46IFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070097
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

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 102 ++++++++++++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index e44fd5c33816..052ccfa6a147 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> @@ -4858,9 +4859,18 @@ port@0 {
>  						reg = <0>;
>  
>  						dpu_intf0_out: endpoint {
> +
>  							remote-endpoint = <&mdss_dp0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {

A newline preceding a subnode definition would be neat (and matching
the existing context visible above..)

[...]

> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {
> +
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};

Also in these 2 cases

In case you're going to send a v6, please take that into
consideration.

Konrad
