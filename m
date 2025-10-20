Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B815BF0DE0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7428B10E41C;
	Mon, 20 Oct 2025 11:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUQLio5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB810E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:36:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KB7E1U027936
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GK+5rKa1ckv1Q0xDSQsg2JrLR6JcjvANAgY1SmDdptQ=; b=bUQLio5nYqY+yhTW
 sugPBh3IxjvFCDE77A33/Vy0zmWuKxMSSrIIvPjuQKOi0UW3SHP+EBqOMfvlxPTy
 QeTD8cmED3H+gE3hLrx5mkL8vhQhr0p9THQMRdGrpPfqvjlY1FjjfXoGNugMKZr9
 NWizG9S2D8TyPnFCAESEestSOSVCz5o0GqU8V1a7uCpn8GBnjrLk5SD5tckqhLyC
 KAfSN3YXpkrfIaYwxFa9NXdu1kpcsHwCneXV3ggLKZ9Ju10m1+xFu/yRNak/28Nl
 5Hc0DTaiGmJu8GYnwtgFHvAItVzbiEXUG7ByAoBmiwfi4U4cuJmAL3/lzhbzffda
 IazMWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pcu7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:36:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-26b3e727467so15678605ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 04:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760960176; x=1761564976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GK+5rKa1ckv1Q0xDSQsg2JrLR6JcjvANAgY1SmDdptQ=;
 b=GJNlgFkHW6/32GjqiXq94mmY0ifcDOmntYKnYf0LM8t6ulQQFbjDAwg65CNM35sTBO
 inl/e0kfEYesaHkW6YlMlCw5XADF+89vLhPAEQ+irv/jGelq55kHhKdqANOPmSkm3sWR
 CkUIT/mp7n9Del/2nqsx7u/WaFAQp93RhcbTWCxYd6+soPgEQTCgPRPGcxgd11Feqf9o
 8dT2nbsHeLdh+WyeT2boofQBoAoFIU5ExfUGm4+OFZjnQsDVMgf1k9muFVa3Qa8zPxk9
 uKt0rxOGhA9TVmU3VjVszjUaihPuNeKWzQSIhkN7bIbp8GjqOw6XcB4Z03n+kPgYtbuA
 ZLlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEXxGjepZ91n/RW4KkPJzv0JS2jbDhMPWhDjd2QpSH0+aV3EstINynU3LpnFKiTgq6nlk7Hdo8jQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwysZWswYiaL8q/Rau/56u462J6D3jh74MUbMuWPvIoqv86wxbI
 1uQHlSVDAaTUv0t9bKxGagBtl8Vwmv+/TquAPAeQrHXPbgGrvT6Z82T9kYbBiaXswpxPwAcq02Q
 Yr1PEU05n584VNHTQKf9G49oMJ2paXPBvE0HzsMiGSjOveWprHZXMcuj/8021Uiuw3Rrx9ew=
X-Gm-Gg: ASbGncvAwkXt4bcxQ67CmL3DCyp7ZmdmaqGz3UbI9iOl10DUjbhHO10eQtzS9xMtivD
 oOX5ft6ZYcEj3fHVXTVKP9RjWzKoe8BIgluR66bhMjZQnMfebZ2Q72X1q6Q5QbsR0wGy89nGQ2G
 UuQETJduoU/9ReDKUzS7xeLNzwXLWPh3scneAvzX8yKWE7qF5X0H5r29hoJxku40qUpCUyjsoEi
 OJMqUa2rapkv4s75hbggRIg9Z3d3A8i48lH1UkCW6s6Bqtqe6eonQDANYyFz63VtUN4/UWgRAQm
 iJXKIdj4AMDrSphRQmOWIgQnKgvO4osXBHJuhubNWVVeS/j29gC3uJzv4FJIkzQBIxWroRSLt/5
 ILCbE/iG6Tuz9NHMqp5otxOB/UhfNF5+coB7+S/hRJPW84UXOz/IUIbtHdTM5fY6CpG31vg==
X-Received: by 2002:a17:902:f550:b0:290:aaff:344e with SMTP id
 d9443c01a7336-290c9d07528mr93219795ad.2.1760960175708; 
 Mon, 20 Oct 2025 04:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYXTamiz1sZaI2FXDLVVOOe09rjZU54qmwtT0sYAF4DGpiXYK7IZbq29yBk4Y3Y1cW0n/IQ==
X-Received: by 2002:a17:902:f550:b0:290:aaff:344e with SMTP id
 d9443c01a7336-290c9d07528mr93219385ad.2.1760960175155; 
 Mon, 20 Oct 2025 04:36:15 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471fe4d8sm77471275ad.96.2025.10.20.04.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:36:14 -0700 (PDT)
Message-ID: <e6c481cd-e084-4f5f-a75a-d1e0a254efc1@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 19:36:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-1-aa2cb8470e9d@oss.qualcomm.com>
 <58446b2d-560f-4a7e-890a-78ae0bb92908@kernel.org>
 <f4dihh4z2nnkjcpsrmopycm6opellvv4mkpee72xjbn26nw544@sfc4oy6c2xci>
 <a3994a92-0a36-411e-97a3-b01fd406ddd1@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <a3994a92-0a36-411e-97a3-b01fd406ddd1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXzQJ/InFAumYf
 NUyE1LETfB2O2LcQoySAisXGVA7iGvTwtu+Zw6AoAWvZ72HJU6ca5npRHKd6rUEubXlOfqgew8i
 f5cCkNwpIoDYm4vn8osanaV5CEHGSkiUUa9DRz01ruIcG5VGzoSJpJWrGO+fkFFCueQ/rLd/4TE
 i+lbDGbR2RTLkzTHM5NCnAA8sifaI4Zzfnp9z4dZoOucEci0NGjxN902/aTL5g2zrVt5GAYuBcP
 8UplgSKa6DyXwGBXZ4gjMqJA5X+O3QjtjKPQHn9CKjYuyfr8wNFLxMFLJN1exJ9W5QixpDIrzYA
 LPpu1aUaZXqH22oaqxzFIBySH1QOguqJMp+8/scsvVRi8G7OWKY6z9KzYadQA63sOUau/RG3Xyq
 bn+FK5sQAd8Opuo2l2BUPBPbmWVQxA==
X-Proofpoint-GUID: OvfeifnXVRmskiiLkKWEPsa9hWOYDzL5
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f61eb1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=csQNx8weYdTNeSVC_AYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: OvfeifnXVRmskiiLkKWEPsa9hWOYDzL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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


On 10/20/2025 7:18 PM, Krzysztof Kozlowski wrote:
> On 20/10/2025 13:07, Dmitry Baryshkov wrote:
>> On Sun, Oct 19, 2025 at 07:13:32PM +0200, Krzysztof Kozlowski wrote:
>>> On 15/10/2025 03:53, Xiangxu Yin via B4 Relay wrote:
>>>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>
>>>> Describe the DisplayPort controller for Qualcomm SM6150 SoC.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml     | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..935eca23ce6b30b81b3ad778e5fcacc817a230c3 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> @@ -51,6 +51,16 @@ patternProperties:
>>>>        compatible:
>>>>          const: qcom,sm6150-dpu
>>>>  
>>>> +  "^displayport-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,sm6150-dp
>>>> +          - const: qcom,sm8150-dp
>>> 6150 is compatible with 8150 or 8350? I have doubts.
>> SM6150 has the same DP controller as SM8150. SM8150 is compatible with
>> SM8350.
>
> So if SM6150 is EXACTLY the same as SM8150, then describe it in commit
> msg. If NOT EXACTLY the same, then probably this should be just
> compatible with 8350. Anyway, proper justification is missing.
>
> Existing commit msg is pretty useless, repeat the diff. I can read the
> diff. Commit msg should explain all the background which is not obvious.


Yes, SM6150 uses the same DP controller as SM8150. We already discussed this in
'20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com'.
I will update the commit message to clarify the compatible information and fix
the indentation in the binding example.


>
> Best regards,
> Krzysztof
