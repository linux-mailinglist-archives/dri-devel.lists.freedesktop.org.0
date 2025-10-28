Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642DC12EBD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E58B10E301;
	Tue, 28 Oct 2025 05:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHBDugC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DDE10E301
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:16:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RMIwdX2752121
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XUAeRsK1Hv6t+HbR9mvGhvvq8azAUXrlOwY/BXZoNu4=; b=bHBDugC6Rva9VlmR
 xzli3lJpPCJSQDGTeqKtQnGhT5tEvR/cj0JfRqkyYNHIBM00oAQSCb6FuoKwdcgs
 wXU9kkoTrMVLFPWqOTpRpX7N+Brl5gMlC2zX4POaZblmKN1Dc2bhJvg+eIu2wF80
 G9XAquv8hUo7Dzlkn0aVJgYQ9/sGpscQqhn62U2WqLsd05Kjne7YUqSmBv1Mow09
 M3cCkCncwHViHqSs6aBhlxu+XbXUHCDPqAhoykIAE8LJPx5pa0akk/szC/uIk8XD
 7uNzHc73AY0Ks6kYSb8jo66++na15q5E9JUPBjUgkqRRgoGdkrv3nq8eoL8vAipy
 rTLm9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nstqnc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-290cda2bebcso17788595ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 22:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761628605; x=1762233405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XUAeRsK1Hv6t+HbR9mvGhvvq8azAUXrlOwY/BXZoNu4=;
 b=H4Foen6VXnG7AwMTG7P3VrEv1YS63SZgwOJvUkPcU1FldT9jVD4BhEFa7EMcJlKv6O
 Qmp6myG7F7UJtQVwrT0GC8gcrpRXeFsi5TLMj9XkAQ2YK+toJ4hcMlimySd5Q2sCPFkg
 HaiQ6RQKHftlC57imG3i6J2SUlWa0GjzhBxt4Xxp983v04kwZZu7327SpWLqrwOnAyx9
 wbdrOOHbF6AvHBbDYvhTGGytzcRfjtp6YMAAYoQfEUkl73FrB4PZyKgkMqH7b+KtJ+ac
 zq3s3eBME54JYHRUscQAb/mfIWeVIjKnr0x+iWE3d4YLaHlKhAETXdGdPV5XjH9aUZVp
 MdLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjN5m7rZC6y0nWXK8nNNA1RUnDdxmRNamlzavj6j8sxuQm8tIFc9u37cWZI4yqtAcf9EuDpnR138=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrT9vrWQ6DPJZYCtR/aPETlNcUbXvv0giQjCXYGzt6PYHS95WO
 MQhokh0y+zKZrlQ+6f5m14m+BDYDZ5h08enZCnUcH666vZtuwqYyGno5bdxgAij6ntM9YkJZzOs
 Qpx26YWKLFTdOG26bQBJ2i5jFzsTJTB2knOrndGBPiY0jlr3LdzsqJPBB1/Ms51z8Jl95jEE=
X-Gm-Gg: ASbGncs09166wBpykCBEf9XsDPqHUNYqppB+qGTdsd1PFo3PZbj0HrxxSzREDYvFrFD
 yKJ7qk0xk4/u5COHCPO2Qm+hz3y5ucc5X+3mMvcbnbnaZ6YN1I1N25FRmT3KZChusCRXenta81N
 0GsO/P8zrMZayrTB1Dsgfn0lG+AIFm10TbNnWOtOpUavY30yD97ijhe3SbEtIE1OvCPJLMwsfsW
 Tf7C2nMUXTT2YVkQcnCZamsmnilo2PQJSqoM+5n9UZaNd885zVqWON99QNuCwhm+TIfVxGwL9Aa
 WCXQaj5n9OEKX3pVqDpZFLLAjHu+azAUMlvhARyqut2JgQVJc7TeQ0A1gj5UY4B1vxLuJ5QJ4wy
 vc38prTAVysV+wCFXAHamGHgTn/bPDQOodp7Wq236kclX3OhPZw2W310Puw==
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-294cb38dad8mr15162165ad.4.1761628604357; 
 Mon, 27 Oct 2025 22:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGCtI/e0xCUDzsunj5pLCq95XvGzaYTPPAgqnYqvKPP49ZjdTjLzgLXq4j89VNN8OjcYuAPA==
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-294cb38dad8mr15161945ad.4.1761628603887; 
 Mon, 27 Oct 2025 22:16:43 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498e429d9sm100614015ad.100.2025.10.27.22.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 22:16:43 -0700 (PDT)
Message-ID: <f34c6aaa-f3c6-4171-89e4-9f44da9a6a94@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:16:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NCBTYWx0ZWRfX4b+MpDCa16q1
 AQypBx95aqtE6A2yisvrEmMMQHKy3QGgGmtCYMOdlTnjVBvnPO/xWOXC/WbebaxF54twANv2yiK
 K5j9aDR6aeoLoq3XouHUqbc7Rx5AaIIUQrLWtqQVhSukJKMCul3Axnv6uxCi/5Ui4Q5fOmwmICA
 NwpiuWxjUI6Cw6FHLkcsEx5UmXK+v04xMt1A7H20luo2n9l2OMtYKAGLWbgxFxZsDEuUD8cq2l8
 6kpQrjSbGYRRkEPXhJwThX23Ph0B2rn91m4b105ZOEkjembmtw+yI54bWECxBFoGDslb518ypcI
 3aeedEOrdSV4fuJqMMXlMk4i33z8wmLDtbx51rM/d5w7hGwCb6f7oyWn69mLulM7Tgmg+yCnHfU
 o78YJcz+lOw5tdZG4b4vBfxWrYMIkw==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=690051bd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qjA4-Y8jdfHfWDHiyvAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7IaBJYMnNBgbNOT9nbPX0VyaCIGrXARG
X-Proofpoint-GUID: 7IaBJYMnNBgbNOT9nbPX0VyaCIGrXARG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280044
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


On 10/28/2025 2:54 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
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
> Perhaps I'm missing something, but if sm6150-dp is the same controller
> as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
> imply that sm6150-dp is the same as sm8350-dp and we could not mention
> the sm8150-dp here?
>
> Regards,
> Bjorn


I have discussed this with Dmitry in message-id 
<20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
SM6150 uses the same controller IP as SM8150 and should fall back to sm8350 for
consistency.

And when running CHECK_DTBS, I encountered DTS compatible warnings, which is
why all three compatibles are listed.


>> +          - const: qcom,sm8350-dp
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
>>
