Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDADC1932B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48FF10E781;
	Wed, 29 Oct 2025 08:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TiL73PMh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZEBI3+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9260C10E785
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T8TXXA4135498
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 av3l7CgY2QNZB00klVJ5AYC93NCt1x2urffNIO++BXg=; b=TiL73PMhOsIwXPoC
 tHfhxg1xKUhDKFUANgnj7PFK+1hc9FfRAlPBu/orrl47t8MCZRwYUGMI4GyiDN9z
 mo7anCDBWHu4Z/Ycmc3+7icxkDlZAvd0CxYzQJ8XO1C58IYHAzi13klIKSrJ3PXM
 jUy1hugiHMVilb3U1SZnQ2NaaNttFUdOIN3OQo/pq/ejlsxh3hcUUWzrBb1NEeL2
 5zSFwFzAQNST0OwaJEV2GGGIt02xZVBd4Zcjv0L8sRXUZgIWrYm3BRO/j/IIFHY9
 kqCpU8VE2bhOVy/vJQ4dRZBZZfO7lGEiDhhu6VV41jUGUyNuDSJsyDrqdEIKOEBy
 05JQPw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9r29w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7a27ba1732eso1418717b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727925; x=1762332725;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=av3l7CgY2QNZB00klVJ5AYC93NCt1x2urffNIO++BXg=;
 b=TZEBI3+102QP1p34so95dfrkNfjWL6sELxxoLmFrV5UA+jDDXURDjaYphSPkwUDAB0
 YB0A6Ng5XpTAaAAo/uoIHcgM0Vk9kuSfRoZFt1sCf+BUm7Kt+qLjkGmTnv4WeVh6cDyV
 7gA0oSsIQlNZTpkyAa4tComBRDoqsaNBYkz2hKWA08Kj6cYpIalNcq5bsUt5M1r36lf+
 kl2B8DbeptMnrxfJAaH0RoJ4k+UmL8+FPMYnjwmYA3SJPVa6m6TsWIKGQW621TXaHmfM
 7fPFHXJ6mKVvxHuB6dnOaC85b++PhommU1mctUJ0eI5jDwX0+ol/OvTqHrSUTwuzZZ0s
 cAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727925; x=1762332725;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=av3l7CgY2QNZB00klVJ5AYC93NCt1x2urffNIO++BXg=;
 b=pjjogGdF1zaF2SazRV7EfD2cyPG/UUrn0OiNvw94vKTLFvN/HZSj6ADmTIpz0tx1TG
 Q/9a9RrkMlsas5ocJp4Ym1Ug3yqVqnRomfVhc90l8FhNEhHsHaDiAfPZyTq0fWVfLH/P
 THVameVh5xaw6XM8vCFQhtvGLb94rAp+493fOhu3Z0mYNS0lynJCRLWrx7iUQRyl3XaZ
 YH35q+VsIN/UlDpUJX/0oHY7gmYSQ6xm1zfHtAK5Us4AD8pvmRw5lw8uGJEbVCEeNRjm
 svo7NJhQSZdYKM3PiEkK7XJpnqet8aQLnP8gLqsJzq2iDaugKjNFbPT1Ayc3NWOSCc/R
 i1YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTSmHxJaiy4Aujf71+p4Th6Zn/+yk+GmvOHf7kK3y1NTu63ZlkXSxJXvGHWvy14wc6mVyaAH8LWSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsaAyxWS6BYeqWee1EDEsJ26MmhV+rc09aKSaXKE3wWN6Rxdlc
 NcxKkgr8L0qhy3c/4lksXSyVBJL8JJVBXCWD/p8WJ5EDAoqqoLQXfZDhS2BuRqbfhyqFwx7Fme7
 JOnH7MrI0KYPxvVEqT1emOz58jB+I5yF384VIymPnuoGGdn4i4088RX6nhQ1VITmYzvwiIEo=
X-Gm-Gg: ASbGncu+REYGm3+1vtOR3wVSw2/rXWrB7Ux788Osyki8uvWZ4HVTFFHFgEJow25YdM3
 GQMN5OGMspY3U888ZoFFcFRlwcAJj/T7cGh6kbpdHpdVzi2flmC79Lo3a5JzbLSlghfghfgmmRg
 TY/4vPAQEBdQfauj/GJtfeydikN154q6Jkwa9B+pdXDDFmGeZ8vTI52D+aeVKgWxr0e5Y0442uz
 eb9CKKdptYJTaia1K95yQBha3A9embSNsjE5caqSajxkje37UFSuA6izQslOjyiGkn6vxgF5V9Q
 S+u+Wfl4D1V5iXogiqg7pi7g6ZzoKuhU/zPRmoVmrxudJnxQq15ilQ5BwvWyWJFJgbs90qzUWzE
 NZKs5B9A1pj4CbB7RlhIGvhsAadsNt2zQyE2412I3XabTN2FKIs1ajXlDl23cnkVzcJcKGQ==
X-Received: by 2002:a05:6a00:1ad0:b0:77e:ec80:b3d0 with SMTP id
 d2e1a72fcca58-7a4e4c1cf59mr1483010b3a.3.1761727925443; 
 Wed, 29 Oct 2025 01:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErF2e2GenJryHvPr/6RHFg5TGcrt4MMCyAHRCvS2P23eAMSyzqRgz3/EI9LDiuXTVNF8h7rA==
X-Received: by 2002:a05:6a00:1ad0:b0:77e:ec80:b3d0 with SMTP id
 d2e1a72fcca58-7a4e4c1cf59mr1482997b3a.3.1761727925015; 
 Wed, 29 Oct 2025 01:52:05 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012bf4sm14636390b3a.1.2025.10.29.01.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 01:52:04 -0700 (PDT)
Message-ID: <91b0be4d-9e09-49a2-8794-2ec1f191d03e@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
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
 <207641b8-c272-46d5-a459-eb720a4b94a6@oss.qualcomm.com>
 <2rvypo4rvvjrtnjow37vfqifbkr7gfra5n6rnrshubtk4nxt2w@uan44zq44iem>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <2rvypo4rvvjrtnjow37vfqifbkr7gfra5n6rnrshubtk4nxt2w@uan44zq44iem>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oVLynErQQYUCp294DNNOS8cH3aNPwGmq
X-Proofpoint-GUID: oVLynErQQYUCp294DNNOS8cH3aNPwGmq
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901d5b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=RJh-vHJcJB1ee0c-uTEA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX5gc5iZArVVn+
 CdCyO+3+3SyIWLc7uTyxMhqaybUf/mmHKifB6JrUN1rxzwTFAoyaVPfBVatutmSgMZI+Sh8mUui
 RQOjux/93V0cPBHH/WW5K/chKR89FcFl89jZEgfHkrWPsRB8OTq12ybVUb+xHmcWta7/ZArpSnv
 knohPMl5m2LTDrBd+E83JeabDD2faJvcw4UPGtjTqKohYmgwKSeSIS/Yvbb0qRO4tOCv2XXrfNz
 v9QZUk6CBaJyYKcPTeO6wMPh0oSsD4ndI8vrCEFE10+ngAjIwP28p1jBqHm2n81RRMiprWQjfuI
 OJB8BiOFZYp5CVjIuAjbwtNJta1Dp0x02dOD80XP97Hz26gn0FHkk4/zzfBqC6CO9qWBrBldI6G
 Kfo+jo3fgSTQs/OfVmgxW3Bwqodf/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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


On 10/29/2025 3:57 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 01:06:52PM +0800, Xiangxu Yin wrote:
>> On 10/27/2025 11:26 PM, Rob Herring wrote:
>>> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin wrote:
>>>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>>>> compatible with SM8350. Add the SM6150-specific compatible string and
>>>> update the binding example accordingly.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
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
>>>> +          - const: qcom,sm8350-dp
>>> The actual schema will check the order. Here, just:
>>>
>>> compatible:
>>>   contains:
>>>     const: qcom,sm6150-dp
>>
>> My initial plan was to use only `qcom,sm6150-dp` with `contains` as suggested.
>>
>> But when I tried that, CHECK_DTBS schema check failed:
>> ‘displayport-controller@ae90000:compatible: ['qcom,sm6150-dp', 'qcom,sm8150-dp', 'qcom,sm8350-dp'] is too long
>> from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm6150-mdss.yaml’‘
>>
>> So, I have added all.
> Please use properties: compatible: contains: 


Ok, I missed the focus on the 'contains' syntax earlier. will update it in the next version.


>>
>>>> +
>>>>    "^dsi@[0-9a-f]+$":
>>>>      type: object
>>>>      additionalProperties: true
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
