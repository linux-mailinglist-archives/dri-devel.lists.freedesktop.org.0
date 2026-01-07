Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65D0CFE238
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EE310E5E2;
	Wed,  7 Jan 2026 14:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSNboE4c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyGnTkGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FEF10E5E2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:03:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079q6L8218483
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 14:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZGUEfPXYzSComK/4z89HH9yCe+htm7JQCogZL+pmhcU=; b=iSNboE4cXnSfjv6Q
 T9IeoddUr7lZJW8JimTlQkX8C++dWLYVbrQ3iI8zPng6hDQm7HKgCdwBej/yd8UP
 DdT4+bAvoTp3Jj+n+IElHDSqe2QA9boZVBngHYuDdp15iYidSpx59EPsmBOpwjmD
 L4eEBIWgi4TPqLnRfUqZyphcvWM85J/1bkwbon5pN2YoSeZvpFF3ocYNh5Clos7i
 Y/+ckUU78QqaWvGIjZSSUtWe5olAFd96RWRQZ5/tqdDRPVW2OT0nz8x0oumcz1To
 4dzl9vRKocCBRkcKmeHZxmvdS236A4GGd8wjXQElzTrQ29gcf/RDtEqWNXTzXpNI
 DMkEdQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808pnu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 14:03:43 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-64565434d7fso462902d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767794622; x=1768399422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZGUEfPXYzSComK/4z89HH9yCe+htm7JQCogZL+pmhcU=;
 b=fyGnTkGQy+S50Z7b8XXAJFUcQH2cUSntYwsjuIYgKgWyc0oMBGnHdCBYus0ET/Urrr
 0JfBd2D/ZI/w/a4Q2Q0Tbj6ZAnJcxebQ4Kt7r2YhDXfg9ReOb43EcJCK1SFPNe2OX4pc
 CWZsQYZ8ebNVjBxEEY5JgPZATSUhn0cJdxX3bkYgjhW9Yugbg2f+pXn1JfTmW0gO4c/d
 f9+2KPAvM6fz3kkU9+lRj5WEpIqOTDMgKRMziO0cKz5eYPzLGPg0vag0v4AgcAsthJem
 cREj45J2zhYcx/fiDGeibT1fkmv4X8Ax9N9ZSqfRELZPV+N8EpymbO8CPgKVEFbD2XaM
 M/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767794622; x=1768399422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZGUEfPXYzSComK/4z89HH9yCe+htm7JQCogZL+pmhcU=;
 b=QUKYz6ls3NnSz4hyuzpqLAo6+ZiHo7EzCNCOJRtJJT1BCF2PlzTA4JHn1bHnhfRG7F
 0fixglMtZzYjsF82Nltej+cexnUeKK0MTM7rlZPvubL+G9LAyslInRv3XARCEQ1Q5gR6
 2yjK9CuFCEU5i8LK5Ag5ImxErK7j6qQZSq3SkCh0SJYCHDGVlpuNHP70q7TK1wZh6zpH
 qUP2P/9HL0z15/qr7de3t6SeZvdv87Skc4jVsghLpwcWA1rxXfy3tmSCxF/DXc5JVPdY
 /97F2hs/vOpcR+m3NwSPYwaGBVie8npgwKCWalYl5FLRtZ6AQqo2xnLlHsMTowe4DVg1
 LNcw==
X-Gm-Message-State: AOJu0YzboB8OmIBsVHKOCLy1ORN/LeLxlydrprtYJpQ1ed8+uQHr64L+
 m+rKGwPu3Bv8l+7MTFsXb2We3kabKWWM4mpKSoU4xWZDIecOiaNisN4QqDIRO4y/QtAcXXMw8uH
 23UXyeHxdprrgtDSgy5LA3NLdlltwsYs3dByW63OSQqJB5D8i/fApIH6JbI6FG9JMddxaYJM=
X-Gm-Gg: AY/fxX7E1Y2cZR9H+hRJTk/EvZmkwParapj5UWpoQGtkkoIEYup9mx/2ODu90+07Tci
 Zou+MtaaIm1CtrV4f6M3a9xGsOebfxMnNg3QmtfXHkyL2hgHgsPgXskepe4+kGkP+UyoE2JwXLO
 //ZYGx472wgFoclgKo54uYEWwNQh/Bl8muuLqmdCmBCJUMutQRw7GKcJQPgMT1qQhjgMnO5mwSO
 jTzF+1GVK9DqgBdgCQ0wetdnoXpnThKCnWFEA6xFAyJYqmVic0/WILsPdqUYaET/TvtPQ9UoNzY
 0hjsvFymzjij2SrMxGrMEsKuPyn1K9Lm1CssLMceto3Sh/CLKivHEzkfs94V6u2CG1zqMafqsNn
 n4v+i4OjEQGsdexei/8f4R9iEQ4nqpk7tX29B1RYaBjDKa6swc0RP89s/dVfdqds6E+Q=
X-Received: by 2002:a05:690e:1486:b0:646:5127:ad64 with SMTP id
 956f58d0204a3-64716c9291fmr1920185d50.8.1767794622206; 
 Wed, 07 Jan 2026 06:03:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+yD6IwhCJBS0M0IdpMAihYXZ2W52QH5LWTaJGmcGDkAkN6V6xxs4QcaIu2Pf8pk26NxzbQA==
X-Received: by 2002:a05:690e:1486:b0:646:5127:ad64 with SMTP id
 956f58d0204a3-64716c9291fmr1920088d50.8.1767794620266; 
 Wed, 07 Jan 2026 06:03:40 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b9d4c89sm4571078a12.10.2026.01.07.06.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:03:39 -0800 (PST)
Message-ID: <bfa54cfd-b5cd-47c6-b941-3bb5673d19f6@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:03:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e67bf cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=WZtaUWDQifwC2z0g4SgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: aFlJ0YRJON2yxr7GxT-q1abF8jRawMNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOCBTYWx0ZWRfX642Y7583d+/F
 IyyXTqiCJoxOo6UUwG3W3a/BJKx25TMVdo6zVbPAXrA0efW1koQq0YwCPnBe7em9fMwuPVxrLra
 cuC4ayslj78v/CePsFd+MSx0H+edFlvTK9xQbmjdjfqnSbZJDG24nYwKcZWDTrW5CxpLqbpnV6X
 ifZCZSA66HGhEnC51MN44V1omIB7DynvFzVAOEvfsLnAY2SqhcF0ooB6dG5QcR+VXMsT6lvLZsy
 Kn6LUV6/SvMywi4vYtJJbk/q+BRxWPiiT78l8HKhMQ1xSynpmBR8h+WFg41GgtywUmGdtEeIA/z
 Qh86mRAm8cBtxFSW3itnVOz9dKT0MT8bOI7/Z2zJ8thslj2OtHWurkO583Ls+LfFg2YfudUNMsm
 QqFJCyDy1ZBrycPYgfqBn9dDsOrJ0Xd32YfjGlvsW1mzu+AB5oOkff0NMGPsgnAo00JFxHYBVM4
 U3olTtsVkGoHr58k0PQ==
X-Proofpoint-ORIG-GUID: aFlJ0YRJON2yxr7GxT-q1abF8jRawMNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070108
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

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8950.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml           | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index a8490781011d..306fb6642617 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -98,8 +98,6 @@ properties:
>      description: |
>        Over-voltage protection limit. This property is for WLED4 only.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [ 18100, 19600, 29600, 31100 ]
> -    default: 29600
>  
>    qcom,num-strings:
>      description: |
> @@ -239,6 +237,24 @@ allOf:
>            minimum: 0
>            maximum: 4095
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pmi8950-wled
> +
> +    then:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 17800, 19400, 29500, 31000 ]
> +          default: 29500
> +
> +    else:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 18100, 19600, 29600, 31100 ]
> +          default: 29600

Out of the supported ones:

{ .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },

I can confirm both allowed and default values for PMI8950/98/PM660L

I could not find any data for PMI8994 (or PMI8996, the essentially
PMI8994-revbump), but it's very probable that 8950 is an oddball,
so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
