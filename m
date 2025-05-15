Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965BAB8C8F
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B1C10E90F;
	Thu, 15 May 2025 16:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiROpoKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD3610E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:36:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCA7007835
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mf1yxC4j/0xqckE1bjp6hJEa7TWXoohzaf1QFVhnFec=; b=LiROpoKjmM84CxmY
 UidQ2afnAkgqV+FMbKnoXu4FFizXiPKgDgrqgzJYYhTBDWSa2J9kWEa4K0ua+8PY
 bhA2GIdI3LCaisKR23O/t7EM3ZU/WfKbVYG/zMtQmCis4H84VcWdgW6TSzJuX2d1
 TDOXnTW1dX5oiw/5tZ3ZT4BYPCXHmFsI2a1PADrQLubPMw3zlfwFTTZrNWDWSShx
 wLD8OZd+YYCAoIWapErPYpjRpsZs3jR5ZKYLPG5LCTJFOsdCPSRl2SV4CR+zHek2
 b/t4L4nnwrnRFw5sv+szt03PcJltkkalO9fDQQSwshB0se1tWbBg4HT9qdNnuyhx
 zSbnJA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxw8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:36:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f5466289bdso1230326d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747326964; x=1747931764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mf1yxC4j/0xqckE1bjp6hJEa7TWXoohzaf1QFVhnFec=;
 b=Nwr6wS2D68jggzc6JRPM9RFjApS3jShPwYctAdgKQ1pRFS6ashhmjAjfRVqNBP9sw6
 ol87wfzIi0iI5EtJXBXvqYHvwTmGZMThXST4n5RbBJKIbbn6QFbOqhkdNqb8Ur4c4pyg
 UHfRYmkYuDTOqHGCV0THn2d5FH3v6Fbpe0/pACWeJ/Soy3jjlOSVI6br2uaBOUD+hwfT
 o7nlyAjzuJ3NN+38BNJgJc6W0K1UvldmVGGZ0R2N/X/ca8iz6+pxv94WECj8iMtBkp6v
 4e4YAEJ7TAIkOFtLRzMErqcdJtIWgYNgj4qx4/6jlpG+fhhnfdYrQ3dExjrAb5ea66c/
 CE0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuM3mItR+nP5YrvpwWUhYIJL2+Vo7/i3H0jDhIdh0Cjyt2tkz79cEv4i693YG3ywywnzzVnMV16HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQDNGkfx6mnn3UVJ8XwwL7dnnprrz4bdG+GGVc03rp/7f+UVE4
 9hnTnYA3AXMVAss47tiA3vNotmAZ+TWvE0SiZG/vil2w4uu4uK0clEZRGD+GXr25HZFDVijt8Jf
 bF0Xn6KDwUt73Jjx6B5o0Mj/ZX67FXnp5tbfKqEdEjqzpIe3LSexc8GigcQ1OU1QIRyDMueQ=
X-Gm-Gg: ASbGncvnWi84muxO306xZlpNW/egTcg9jPOaMFVkPwjGtOW3+Z9Y/tMZLOqG1hyCJnC
 iXrvzCO1pFDDaK0c3NZ8M3957tXnS+gbefflvU1F9Q5fSkHJJhA5Y5wV73zjuoQEI9Y5h0HZ4WW
 urRQTvCYZjHjEuLjZ0O5BRCK4uS4onyGFHgSkp0+RzlMk9ZAxNpdSOoYK3qmbPb79TfAoKz45zE
 JJxZ1bA7KXgfrFpwqZ/CL2CctBnITYHjoDK4Uk8SKAONBd+iy+9fhy9L823yq0v86insTDOw4wI
 r701KxTrwszYmBdk2wpY9SqIVboDt4bE0kpGyzIWkEAI+KsOi7XCjnUdx5hqKiSlYQ==
X-Received: by 2002:a05:6214:2602:b0:6e4:449c:ab1d with SMTP id
 6a1803df08f44-6f8b0806253mr2293806d6.2.1747326963634; 
 Thu, 15 May 2025 09:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvNUL5j6UfTHgiyVUOwjbW+ErGEGSr6X1GGt17A/3JvM7gfGdKNGvp9n+/7pu4N7fYdG51Lg==
X-Received: by 2002:a05:6214:2602:b0:6e4:449c:ab1d with SMTP id
 6a1803df08f44-6f8b0806253mr2293666d6.2.1747326963035; 
 Thu, 15 May 2025 09:36:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e63a0sm72049a12.39.2025.05.15.09.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 09:36:01 -0700 (PDT)
Message-ID: <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
Date: Thu, 15 May 2025 18:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
 <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -t8ACdmr6Q-vnsM1pIOTbfK1T5Bs9hda
X-Proofpoint-ORIG-GUID: -t8ACdmr6Q-vnsM1pIOTbfK1T5Bs9hda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2NCBTYWx0ZWRfX6VZFc/aEtPnq
 AAczkFH9BzN9mcrOUZcv9OdcowMh9OvV9io9Qgn1BeMfWtXcdIo4k6+L/9waaXcvd6gkmr5noqw
 UOHbRFHjRgcLOM1mqDpNLa7+ZimIij3lD/IFhdRZBapDrUZBlw1uTfP/ztVJzRXpSzmlKqeoct9
 0XN1CLlIU0RXRTOG6rl9QzOSnBH2WSPA9IXViiXt8DZIiCZIL4eU3DBzdUosPwE4ozJ/6ha6/ef
 H4oLnBOKjtOQLUyahQMZ7m/W4wSPhO54kc0A3NIFEeerMTQjy5bFZVzE4hhhJFcWWVpA3lXzTY0
 XzQGzv8e55dYY9H/QdAQJYnKQ6xrx/JaEEc6J0b7swr9MwRAw2ROv/TR5kA/co2NfU6HJTphoWb
 gedsKSrmSSU49bxQGFvV+m5Jhon01UMBol2zUaCShxf+OM23tiTM4emmExgRPQWwV35rB8Eh
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682617f4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_jjhv_60NFWZV4FgBwEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150164
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

On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
> On 15/05/2025 19:18, Konrad Dybcio wrote:
>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>> 1.0 encoder).
>>>>>>
>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>> bits, as they weren't consumed on this platform).
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>>> -    .ubwc_swizzle = 1,
>>>>>> +    .ubwc_swizzle = 7,
>>>>>>        .highest_bank_bit = 14,
>>>>>>    };
>>>>>
>>>>> Add a comment and squash into the patch 1.
>>>>
>>>> I don't think that's a good idea, plus this series should be merged
>>>> together anyway
>>>
>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>
>>> - MDSS: offset HBB by 13 (patch 2)
>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>> - get a handle (patch 4)
>>> - resolve / simplify (patches 5-10, not squashed)
>>> - fix sm6125 (patch 13)
>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>
>> Does this bring any functional benefit? This series is unfun to remix
> 
> I know the pain.
> 
> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.

HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
should be good enough (tm) - I scanned through the values in the driver
and couldn't find anything wrong just by eye

I realize this sounds funny, but all in all I don't think it's worth the
effort just for that one

Konrad
