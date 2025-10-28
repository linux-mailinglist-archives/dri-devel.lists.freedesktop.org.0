Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BDC12E84
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9AC10E351;
	Tue, 28 Oct 2025 05:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4xIB97U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7EE10E317
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:07:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59S1FNdo2961876
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MZNW1TFGtDAWcNhp/IoE4ZPcy7N00ZT6ylN3xTPhhGE=; b=n4xIB97U2mqcnhkU
 6P5VQ680nYuUHSx4WyZJFu3ysqwpt53eRQ8DrqX3jqRyrNL36EJN+/CDWef59N7X
 Y0JookWEvHRpWEuPjg5mMwYtF3fKZghUYNSmibXPyGBwl6+ByAyess6X+KhSNk8s
 gELQfjF0aR8g0RKNWqrklLqhcvKAgteY0m8Dz6ZOnY7E77yclRr/YuE8ObqddpGC
 jwaM0LYqHwbKvWPtCV7cI5gs9bLpsp+JenjXIX5D1K+8b7uZgomAmIvaFN/QJb7n
 sMS6SrsGu7ejRLHV8lgyC4AVvYSa22bhWO3qBvoRsD1cZbAF2e12v8Y+IQYkWDCA
 x8bh8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29v9tfg5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:07:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2728a359f2aso18475945ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 22:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761628021; x=1762232821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MZNW1TFGtDAWcNhp/IoE4ZPcy7N00ZT6ylN3xTPhhGE=;
 b=A7SBVs1k19eIDU6+qj3PFqcJVwjzJnK7TI1g4HBYkFa12IDIgAS91KLhdMeu/1hLNa
 TbtJ3P1PIZNR3DO+j4wXmrABMAWvTAN/IJZI3FRYXm+JZDw//SlSWnzeqrnuCDJHCS11
 e3ESvMdkyjHCwliObgFcSV+nk5btArh9NJiJSGnuJNFNmlMw+0n3SAAaAaEKkmvJgRLY
 /HxyM6bzhQH9p7ujYjQqqZx2wxt4UfyhEo9kfhxK8iNkf7KMOu616caf8Gd1Oj11+xF1
 Em6Doz0fIGCjz6crlbbDg8s0HLrj/qsIKk9evN+xPb6xhACIg9UdOwy9AqUgWX2bT2z6
 7YRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLTSh/mJML+iTf7T8cDtdP/ZU3en35wPdSI+tOg5zKtYfRm+4MUBWoZ2pinyk+hnD4J+XOzgkMBFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLByE7D6+b97Tb+XMc8h2m3Yrgkj64BlP+3HwRtgEilfSRysjq
 Py98kpc0WvaVONeVzpGDMo6blDYzOQbbZmyAubsehpWJaxL2aPnXgN05Xa17DHVpp/cr9+x6pbV
 OWQI2Q9kSdz1QPZmKfSDtLwYKmBlgvf0Zsm0Lw9RCPxylAP8+VYlaQt14UZ3Z1CI64dTJ6QQ=
X-Gm-Gg: ASbGncvBHbFnSRg6hfObC1ExKjjfxLJmpFDuuaK2BnJLSiZT6ixQPfExgNShYj4+J6H
 FP/ejoFaGUp0m9JvuaVZnrO+Hy9pmyB6oztp7fuD1ti8avysuM11zUo2Oq0iJr57N3F/WhxytLn
 5iv1ghz0Ak+VauIEc/AhYCWZdxGX2Af2GCISlduHHER/jheZ0MB/CbxcrvbSAn6Z0lH2z9v9Mwo
 pITkE8RT3G7UBz+IhK99iC2yBYcOElQFskIgFjPdH6X1VHyOTs5xiIADz9QVT80EF+AXAK0JH89
 V3acHanqr/Jqx8fzMQ1pj7biZN22GTFQzBCYhXWgCT36MJd6nQ1eJnnUwg10tYwJZmwBEhQYBP0
 hVYVkRpg2/Zi0qN10ciI8i9+VdXPwfjYTwLYh0QTMXWr7aluqmJ/bSjE7xw==
X-Received: by 2002:a17:903:1905:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-294cb37baf2mr13570685ad.3.1761628021344; 
 Mon, 27 Oct 2025 22:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIHYfyFAfOxSLKOcwg5AGIho0OEXAci87txVeGZ9/S1disJk2HryFaJBGudHTWVhJDhYB5lg==
X-Received: by 2002:a17:903:1905:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-294cb37baf2mr13570515ad.3.1761628020813; 
 Mon, 27 Oct 2025 22:07:00 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498d0ac07sm101578395ad.43.2025.10.27.22.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 22:07:00 -0700 (PDT)
Message-ID: <207641b8-c272-46d5-a459-eb720a4b94a6@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:06:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <20251027152647.GA915648-robh@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20251027152647.GA915648-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LyM4xRCv44NBeoJNUpxYYmiNjeuTVFnb
X-Authority-Analysis: v=2.4 cv=D/VK6/Rj c=1 sm=1 tr=0 ts=69004f76 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=z2EatxdDDGNeVA2bIAQA:9 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: LyM4xRCv44NBeoJNUpxYYmiNjeuTVFnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0MyBTYWx0ZWRfXyvbCA0sDoQau
 7pA+yP4yMcftjadulbaX+penz4RVig2YMWQiEt7PMLMfOai1fLklGtzmwPOcsZ8WPtSg4zSf6Hu
 T17CEWAWc5XNr4R/cN9avFTbeOm/92fmWMKubeSKVwocHHVfKsDF/SaV9YufCSW1x6wpu5NiMYq
 /mKxGKeKbjmJmXmq/vPCKUAYbozll8RmH21lPus9rjrAjX+QgV5VTVjEIUQ9TkL0QDbsMCgmuTe
 60v9ve0LZXh8gb0iSYi6DsLU8Pr2gJbFJ5BmBi63EW02ms0nVD202kSpBZu/jITuHPvcKfPnpfa
 7x5v1KZPpju3jiTvCu7bbE92oKPTLLKE9bZJju4KTbKC2O8RwSS46yS9WHKhyQJfqIMl5j4s8lw
 w9b3HzXtx8WP22okAV20qmur64YaQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280043
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


On 10/27/2025 11:26 PM, Rob Herring wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin wrote:
>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>> compatible with SM8350. Add the SM6150-specific compatible string and
>> update the binding example accordingly.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -51,6 +51,16 @@ patternProperties:
>>        compatible:
>>          const: qcom,sm6150-dpu
>>  
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sm6150-dp
>> +          - const: qcom,sm8150-dp
>> +          - const: qcom,sm8350-dp
> The actual schema will check the order. Here, just:
>
> compatible:
>   contains:
>     const: qcom,sm6150-dp


My initial plan was to use only `qcom,sm6150-dp` with `contains` as suggested.

But when I tried that, CHECK_DTBS schema check failed:
‘displayport-controller@ae90000:compatible: ['qcom,sm6150-dp', 'qcom,sm8150-dp', 'qcom,sm8350-dp'] is too long
from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm6150-mdss.yaml’‘

So, I have added all.


>
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
