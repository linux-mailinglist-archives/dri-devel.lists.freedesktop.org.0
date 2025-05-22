Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1131AC10A5
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 18:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6BD10E25E;
	Thu, 22 May 2025 16:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIoV1Re9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CEC10E169
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:03:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M95mvH019394
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W/vcwc9zHxnC8lxAII31VESCFwSbumzwlKQ3H+NmCM4=; b=ZIoV1Re9InFoPkGn
 unWZkXEHp+cAsdCU/yRNZ4KUbU9IPVBmf+OY55pplR/B24jbzqzsiyGLidaex1JU
 unmr5sdSGUNYlNQuTzLNmRUEu6mHLX0gWoOYyYYyUNGmUC/fGomSTnCTv0tF0QK/
 7MG2IO0mR1pU/d6ex5kkHW4+CHFGFdTRZ9GNdqSGnHZODwUZo/sFU7QITbUw61l6
 bcMacCt6UUUOBKCADoY9qyEe9NPkSzcgDLAxtu2ha+UDkWBpzAeIDddD+d5NS+eU
 2d09f5xpfM+pXAfCWC7IA5y2DyLnjuFIDNLixB1YxcT1QlAEoGL+W9Dc7v9+ToMH
 TQ+BDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb6sn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:03:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so167835385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747929783; x=1748534583;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W/vcwc9zHxnC8lxAII31VESCFwSbumzwlKQ3H+NmCM4=;
 b=QSiPp2dU64Um3pvSeob1uE7IwJCPsfolKYx82jTrfzhHK2ScB8NMk8TPChitqLDTLl
 SkS4ucyQKz9KYlx6su+uyBbyQMrUvyVXswqhkw3KfuUCbSm0eSmnJ//w2ZgB0J5+/27Z
 8S7IHKqMa4qrFGJIlRr4hOn0waZSpLROWJp7qmeygi9lCsKY2WODL0l8+yWuHNsN/RGw
 xrMTrrDBl7WDfszg0q1v/bc1583P7BGzyPgUT+bE5hA8y8Z5FY8opjX+x5z6wvQfz4Mq
 ld1gk1SqJYk5yoGkVx1OMoMmZedGqgu7X3zWGbbsZ+LN82J35uIWukEVwnJmbGbK32f0
 eOkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJVLqdUIhjs3tZyaWqUU9Mz+P70YMTZq5Pwkjhhl9MFBArTPouF6RV6lDQprAS5xdYCwtUCUD8Qbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFwPfb6qlDNwUrke6EXttCbpAva2S2HTQ8Rak1MitvUeko7m8v
 guFheAaQu0+B54Pvq+BYDjKB0gd7pMGmxDcEGvoK0C2QGUN9qd4+WNo/xCW1rJTkaj4lvl/Qasm
 TX5Rhht+rVCYA3ecQlD3laFr2LOCbvkmAfUtxC7OPn2ecieuhYm3s13c2NtydUrb1abkPRaU=
X-Gm-Gg: ASbGncujs8nmU8NNk1dgIT9hoOlJ4ta2l0nPVD/YLDtkKi4ki4LXl2PKjfAavmrFfv6
 tJul3b9g7hxv97aPrDQZPr8tCt7plEuylqvL8BcXwl6Ow++TPq9Gerh/XePOAtVk3zw+NwfOVq4
 LkNu37sGaF3OWBc+gjdGKjVognMUlsqUdqZXuL765wNQjsWSu5L22V/+j/EOZwe8Pwu6KUAB/gv
 qj1Y00vExBGDFCxDFE4aUtseJaFkc1PlpSgk/cU9bAVjtH+5hDuH2BoaqEV7dlNXwjb4CwbUX6w
 aqSU/VNnAao6Iei0Z8aA2NPXpkXjMjWxd/Fy8ADr3h5BPM6HFtoJadfLftFzOTCRxA==
X-Received: by 2002:a05:620a:2608:b0:7cb:69f:1b8f with SMTP id
 af79cd13be357-7cd4672d9c0mr1640477685a.1.1747929783562; 
 Thu, 22 May 2025 09:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF74ucAG9qupScVCcKfwIh6+iKHIXeCAupa1Hr2xyI61Rn4StPKHE/HIp9RIHOkgPlYgCGvLA==
X-Received: by 2002:a05:620a:2608:b0:7cb:69f:1b8f with SMTP id
 af79cd13be357-7cd4672d9c0mr1640475085a.1.1747929783187; 
 Thu, 22 May 2025 09:03:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4d2323sm1104226066b.175.2025.05.22.09.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 09:03:02 -0700 (PDT)
Message-ID: <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
Date: Thu, 22 May 2025 18:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, neil.armstrong@linaro.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
 <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org>
 <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
 <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com>
 <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s7DQ5Qn98Xr-yMfmKg38ptKP1adWgqmd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MyBTYWx0ZWRfX/UEPP9GLLgeg
 tn5bczvqPVlNWDw6jzUYyvFWiCpI6kJSc4ycNA/njrfD57/6PhmPAvWbiC32bKkUwTmWijOCV5v
 FTJv8otq/h3kN9OCzXWajMFWSPtx/IsbH679R9NnUbTITZ1JzPjeQoANRvtLurv3R+ZqbcXhJoN
 h8UW8d3tGLnNV1GNdTexLXNISnGQA2k9OjdtXtGWvYux2TOVnWuQYiokexCaBXFSZJKf5EPsklt
 4Siz4OdyV+6A4ZKeMwVsrag9TUorS/W4147jPTxVEOsGzhKArfKDc+4K9uswO5qSH79pgg0bMUC
 yfN40li5sz26KdlwpFTzjY0cCO0uBJhE71wfY2zRnT2leyiAGjc+kM8hrbvaTBxmnVrvSXsGLBy
 qjMacXu8pVikFqchuCVDHGtbhWxHg5gcrwAhIZQnpFrhfvUlggQqG8gwTOFgYiS8jAfSFzED
X-Proofpoint-GUID: s7DQ5Qn98Xr-yMfmKg38ptKP1adWgqmd
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f4ab8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=nGS3afnEe7IiRhMdywQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=947 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220163
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

On 5/11/25 11:51 AM, Akhil P Oommen wrote:
> On 5/1/2025 9:23 PM, Konrad Dybcio wrote:
>> On 5/1/25 11:29 AM, Akhil P Oommen wrote:
>>> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
>>>> On 30/04/2025 18:39, Konrad Dybcio wrote:
>>>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
>>>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
>>>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>
>> [...]
>>
>>>> This behaves exactly as I said, so please fix it.
>>
>> Eh, I was so sure I tested things correctly..
>>
>>>
>>> Konrad,
>>>
>>> iirc, we discussed this in one of the earlier revision. There is a
>>> circular dependency between the driver change for SKU support and the dt
>>> change that adds supported_hw bitmask in opp-table. Only scenario it
>>> works is when you add these to the initial patches series of a new GPU.
>>>
>>> It will be very useful if we can break this circular dependency.
>>
>> Right. Let's start with getting that in order
> 
> Another complication with the socinfo is that the value is unique for a
> chipset, not for a GPU. So, it won't work if we keep this data in GPU
> list in the driver.
> 
> Downstream solved this problem by keeping the PCODE/FCODE mappings in
> the devicetree.

Hmm.. that actually does not sound very bad.. it would allow for e.g.
new bins to appear without having to replace the kernel.. great for
backwards/forwards compat

Rob, WDYT?

Konrad
