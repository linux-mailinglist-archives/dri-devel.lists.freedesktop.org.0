Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38AD01ABF
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 09:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F179610E6A6;
	Thu,  8 Jan 2026 08:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/Bb5zSa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIaMQKvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE5610E6A6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 08:54:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6087VNoo1837904
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 08:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=; b=Y/Bb5zSaYvFdWnf9
 awnXNWIyId5BHWwCbCccY6ArNvfk2q1nmPmyJx+RNUQGOEQeXZavfE+cWYce/IC9
 omeP7S6yRGQ1dMdbZaMuq8vRsdWQZ8ZJIFXQxaJ47wdOwBWe72+/C0yZKN3ji/ch
 t14YsuAz3ofZ4U7u0kA4lrAUR/inDAV5xxx6A8HMtE2EcAXcgXA+tJ5eEfOM0dAs
 /bnveI08c+Uf1hHIHozvyzhjSNxXwwrHgK0BWe4wXFHc3J2vxhzaK1crRB5eWEo3
 aKmJJKmtKcXoFCvuMGgzBze6OXT48ibkQ5e1IcERJXEcj+lP9riFt7D0/8ukMNIi
 IUNmzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj89207kd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:54:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee05927208so9038431cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 00:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862477; x=1768467277;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=;
 b=OIaMQKvnO293Vqr+2FCClCWAl8W0MX2OvFhy9pPB25uTp19TzH3LPxKmwtgwhauG2m
 muZVIR2Xj1vff63z+QHSpD4O0ZDdROhA/xOEupMzJFtWBYzruJ3+gANL8rKFqfeFJMXm
 woYrq+gnHoqedO9Y9wfS1EqZ7Cc2dc6DGwHMFdCP9VoxShgjSPbgHUgdX9nrltukI/h3
 g9JKt2bnyGo7E4g3FWENkBT9JCueGhZXrLicGhhWiBXzhGY5SXZwO7Og24yT83xRG5rb
 EXmCCfDBZnO8rut4oZAxfPniBds+mrF/spb9zcSI/Jp3+UJbI7yYnKBg7oMj0v59za9I
 AkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862477; x=1768467277;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=;
 b=SQT0UW6ydgVEUZhc5yYJhK3nMqSpyleQ0HLv5ePi7afeUShOEKQaTKWhpEvsQssZry
 CiMIBi2LtB9SoshHNcbSJn6rKiSuGQu62QJKZQllP6ciNfrdgrB20t3SwnqZ+NAKjDZK
 5S5DwURTjZYpRrfVXXOix6QBCQb9ZoNxS7y2WV8fy5bq+XhNhR7K3s0NaNqIcZVdsUsB
 vHE2YFEO6Jm1GXjFfAvdzEJJM0inoqbrbDan6ZPBom6ENXBRsL4j5uwrECTTXlhD3T3O
 7yuJpMRWkH+08CHdQqKLUOo0sakfEwTYoQ9bUZYaGozVjNOIKlX2f5fwlr5T1Z37D73d
 xlQg==
X-Gm-Message-State: AOJu0YwTHQOXANZb28Md6A2gow7sa1M8WxVCX5zrHbeqIO6UTqgt7CtA
 t6ZRii602xiCxTMWvSQX+S1+5fOioGvxC4OIAyzJPZcJJPtKk04FdQCw+OWhWeKco76SbUHb3kF
 ESDw7pIEOdgsv8RL4A4MseHGtYvVFZAeXPoqjL1SCk618PI7dpmG+1oJ3NB24Nig3uIy+k9A=
X-Gm-Gg: AY/fxX5PALsJdfWuB3ClF6tmVMqbL56oWRbnp/51OFgmlJVGdhP1+/vnmdj4zFXrb4m
 FUQ0V7JMlUwq+6JumP796io9uS5mM0huX/bQOe7wU08Qt2CUCegaUH9Qr6Ss8K04N6/bJzXPIbA
 q28MSCGwKBCYRF9jqGldIyLpLStY8qFyvx0jIorpTvUkQ2SceDiJ6nqKdtKJoOzc33SfOvR95u+
 CTrgY0KqkY+gshiom41E5WTxkI0r0mGr8lGrgPRdo2eWj/OqQWihhFlTc91hqaE70VVvC6iTOga
 jJVqxmArOMUHuilTk0T//RneC1DOS/5w1/jSRji6BDbs4VfkUMAfvb1/rCSPLLV480+SGMyYnle
 xzqq+NY3ggV5pflJY6CmyoThPfy8f7gMee+SRrED2axSpMegiFibXO6yFxgndKImDogY=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ffb487595amr54667891cf.4.1767862477055; 
 Thu, 08 Jan 2026 00:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Zu4B4c1u8CU9ENDyOwL5KHQpxYNvhOydpv0jjl8YDszapOdfdCaPnmBYxJ0lXpbM7zjfFQ==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id
 d75a77b69052e-4ffb487595amr54667601cf.4.1767862476596; 
 Thu, 08 Jan 2026 00:54:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5absm6893952a12.33.2026.01.08.00.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 00:54:36 -0800 (PST)
Message-ID: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
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
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f70ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=RLX663m6bzWGV7rLlMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: H44LwfEy_RsBtQBM1lalTTIFI34rnr0K
X-Proofpoint-GUID: H44LwfEy_RsBtQBM1lalTTIFI34rnr0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX+h3rIWvHVa2q
 Hnqy/16mOrjk8DntdFeCHLqeNA1SWKde4rEX5qrNs0ZhZtSX944bpp5vvTfAC8KKpOhyuO8xGTM
 UBHy0kBsMrccFINarIaCauod277SVgmEx6UIUVtNBAJwZTHdVn17DOnQlwPeFXkB/LZdKZCfRge
 oqaNJw9fdiHiFVtQpeN5J6ZKAOePMdHR1o/01QRTvHfiogWm87q8jVPFY0ZylKHb4cjoKm0L96Q
 JpVJJqtqyy937F4VNawgjoiMLwHuOCXOzAK0BxhByqUxMnOjtFXpWDn3rjmKsl+bU4j5M//My94
 nxo7ELfbuPkIPIGALMyHEpQT/xLHQZfztexXsyMd7XeW/BVqwj8mS3TXQu4mX78pheBqKoI4F2O
 TswUe6rcrVS8sh365a6miPM0vkrCmjg+8TC8Ctyxg7nJKjWxisSlH2KihNgPuwm73PzuhaCioQS
 hf6SSY2HFQo/Ea9309A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8994.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I reviewed a version of this that said PMI8950, which is very much
not the same..

Let me try and get some more docs to confirm or deny what you're
saying..

Konrad

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index a8490781011d..19166186a1ff 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -98,8 +98,8 @@ properties:
>      description: |
>        Over-voltage protection limit. This property is for WLED4 only.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [ 18100, 19600, 29600, 31100 ]
> -    default: 29600
> +    minimum: 17800
> +    maximum: 31100
>  
>    qcom,num-strings:
>      description: |
> @@ -239,6 +239,24 @@ allOf:
>            minimum: 0
>            maximum: 4095
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pmi8994-wled
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
> +
>  required:
>    - compatible
>    - reg
> 
