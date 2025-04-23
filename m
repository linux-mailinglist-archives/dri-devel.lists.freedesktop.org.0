Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE0A97CDF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 04:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4E10E3ED;
	Wed, 23 Apr 2025 02:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="f7mxGJfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486D310E3ED;
 Wed, 23 Apr 2025 02:40:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iRBL014200;
 Wed, 23 Apr 2025 02:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sEnWhSOcmsjXDCbo4JutcllgsrUm4ZD2PZsQO/oVLfI=; b=f7mxGJfvdNfUVeOi
 Kt+bQqMr2bGb27X6PLl+rQUCEdjuJqBEB2tiV9LQcy8KERqSh5GWtD4ldobgBP46
 QGpmILoRS0IkdxFajNEmRhe6vBmjlWQdb+VMWYMNr3VmduTsSaMeOtHzL9cof8ho
 3CZenGmXDKFjWKICHFv3EEYAwSzz923M4J3Yrm+CF3H7FSXKQWm/mI0y+iTu1cBS
 NY7TqUDs+SHccNkrc2qljVlpZMJXdmlURWJTiLkBTZiEhMsuf6TNRDFQLhob8eOT
 z/GCVHRQF4qJseCpIRa+g8XFNs7lgentAWafsDtudZfSFnT3OBAqwzIzgRI0bJr9
 rEhexQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh38mff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:40:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N2eIip015716
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 02:40:18 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 19:40:17 -0700
Message-ID: <743721c3-9015-4d3b-902d-cfa6ea4e94af@quicinc.com>
Date: Tue, 22 Apr 2025 19:40:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
 <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
 <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
 <pxi2nf4h34xtkickkkuwh4svvhbtsutuz5u3ukzgfgd5rzzcps@g4gct5zuc6kj>
 <2ef59c6d-bef2-4763-9463-06116a2e7d04@kernel.org>
 <CAA8EJpotUkPWU4VTmtaH=XkhwPZVXfdU8ZyHqROYpZRWDdYPSQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpotUkPWU4VTmtaH=XkhwPZVXfdU8ZyHqROYpZRWDdYPSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxNSBTYWx0ZWRfX0RgkRCZBz54K
 QXQwGeYVDusFGsob39/OzvGP6VYzt44Zpjyo/A7ZRiYk/bcsseDhprVkC4Uq4vbRAMMXLDpdqNp
 zsKz58x0/Payivce04r3qfUZNh0RiravHcsM1OfFUJ3F4e8n1L1M+OuwUbLtRqU3RHpJaqkhrqF
 5uVpEHV9AFz1cd9RQvrwaO6JFBefwtR0QGmoS8XtiSiZ/dB05k+mFq/jhhzRWoNuzGuaHuMJ6wW
 H5JLqpgKFc5XSDy29g81+pR+Nwmn0bIFcHy4ICx2ItGTO5acXWwptxarKLOHz52AWSmqahiuv14
 XcUVdZsOGADbJKZNytfytJnVFPIAkXG1DntGvRVMR4cvYh7w6Q0DU5CXVsXvltbZlRaLaTz4wGl
 zbZvYvqXo0BDUz9PsC7hLp9F0TXuOSZ+tgDxtulhESlsCAqpy/uwuw8VmkQe6DIbZtNneb2T
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68085313 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=gZuivp84EbNu_AB6qtIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xlAbQF5h3S4gKkjlBpZtpCfoEWMmHonf
X-Proofpoint-GUID: xlAbQF5h3S4gKkjlBpZtpCfoEWMmHonf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=984 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230015
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

Hi Krzysztof and Dmitry

Sorry for the late response.


On 12/5/2024 3:32 AM, Dmitry Baryshkov wrote:
> On Thu, 5 Dec 2024 at 09:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 04/12/2024 11:09, Dmitry Baryshkov wrote:
>>> On Wed, Dec 04, 2024 at 09:02:18AM +0100, Krzysztof Kozlowski wrote:
>>>> On Tue, Dec 03, 2024 at 03:41:48PM +0200, Dmitry Baryshkov wrote:
>>>>> On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On 03/12/2024 04:31, Abhinav Kumar wrote:
>>>>>>> Document the assigned-clock-parents better for the DP controller node
>>>>>>> to indicate its functionality better.
>>>>>>
>>>>>>
>>>>>> You change the clocks entirely, not "document". I would say that's an
>>>>>> ABI break if it really is a Linux requirement. You could avoid any
>>>>>> problems by just dropping the property from binding.
>>>>>
>>>>> But if you take a look at the existing usage, the proposed change
>>>>> matches the behaviour. So, I'd say, it's really a change that makes
>>>>> documentation follow the actual hardware.
>>>>

Yes, I was trying to document it better and that way adding/extending 
more streams becomes easier for the next patches in the series.

>>>> First, this should be in the commit msg, instead of "document better to
>>>> indicate functionality better".
>>>>
>>>> Second, what is the point of documenting it in the first place if you
>>>> can change it and changing has no impact? So maybe just drop?
>>>
>>> So, do you suggest setting both of the property descriptions to true? Or
>>> dropping them completely and using unevaluatedProperties instead of
>>> additionalProperties?
>>>
>>
>> Dropping them entirely, without any changes of additionalProperties.
>> Unless this property was added due to limitation of dtschema?
> 
> I  don't remember at this point. I think it's worth trying to drop them.
> 

I tried dropping assigned-clock-parents altogether and it seems fine, No 
schema/errors of warnings if I also fixup the examples in 
qcom,sc7180-mdss.yaml and qcom,sa8775p-mdss.yaml to drop the usage.

So I can go ahead with dropping it.

Thanks

Abhinav

