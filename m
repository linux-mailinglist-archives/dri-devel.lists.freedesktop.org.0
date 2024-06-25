Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC77917271
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8978710E725;
	Tue, 25 Jun 2024 20:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CUEZQ3Bk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DF110E302;
 Tue, 25 Jun 2024 20:21:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PAoXx3026819;
 Tue, 25 Jun 2024 20:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nFty/Iodxya8EuC11oN5Dh5rXaNe8uxYIUPCUgb+ysk=; b=CUEZQ3BkoIgg8KqF
 wzOPxiICaLTz28LUgNHPfFDMNrPwYlt+EnTwLcaMBBrl0cIjjVy7p+QwpSod2SG/
 YVn8gMq/tHTl3avbLgnpBpEbRGyOIbM6emNrVRkmECIy3jDlRNWRLWxzIipaAt8f
 2oztPD5aS1jZzZ8hn9gKQJ524Doto/o5j4zh0xHr0seH2YS7vkdUHHc6T0GRmV1h
 9wJRSqV3XY8EUr0hBfcBoFnBZbGD1Hxed2Eq+Nm0wtwUa8EW5Pzrhs/+3Aw1frAU
 i8c7dSIfy8pH1jellumY0iMfKlTlXHTT75xzTcD/ax5ogwQuHc5aROFRsJ6qvj3d
 VnMMiw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu17ar4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 20:21:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45PKLAsR028185
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 20:21:10 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 13:21:10 -0700
Message-ID: <bb4dfc6e-db1f-71a7-104d-22cf76809d73@quicinc.com>
Date: Tue, 25 Jun 2024 13:21:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] drm/msm/dpu: Configure DP INTF/PHY selector
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240613-dp-phy-sel-v2-1-99af348c9bae@linaro.org>
 <bbdb8f56-4948-b0dd-55bd-ca59b78ed559@quicinc.com>
 <0ae0fddb-07f4-3eb9-5a62-0f7f15153452@quicinc.com>
 <3a5f68fb-2487-bda0-91a1-18ecd414937f@quicinc.com>
 <CAA8EJppd8Vm5uGzzVofWoTpVkfxE5atv6VOt0WMUsu4oYP1UZA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppd8Vm5uGzzVofWoTpVkfxE5atv6VOt0WMUsu4oYP1UZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r3F2q9oVZ20uuPMlhFK3W9UQ2ALN5SKA
X-Proofpoint-ORIG-GUID: r3F2q9oVZ20uuPMlhFK3W9UQ2ALN5SKA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=920 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250150
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



On 6/25/2024 1:20 PM, Dmitry Baryshkov wrote:
> On Tue, 25 Jun 2024 at 22:28, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/25/2024 12:26 PM, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/24/2024 6:39 PM, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/13/2024 4:17 AM, Dmitry Baryshkov wrote:
>>>>> From: Bjorn Andersson <andersson@kernel.org>
>>>>>
>>>>> Some platforms provides a mechanism for configuring the mapping between
>>>>> (one or two) DisplayPort intfs and their PHYs.
>>>>>
>>>>> In particular SC8180X provides this functionality, without a default
>>>>> configuration, resulting in no connection between its two external
>>>>> DisplayPort controllers and any PHYs.
>>>>>
>>>>
>>>> I have to cross-check internally about what makes it mandatory to
>>>> program this only for sc8180xp. We were not programming this so far
>>>> for any chipset and this register is present all the way from sm8150
>>>> till xe10100 and all the chipsets do not have a correct default value
>>>> which makes me think whether this is required to be programmed.
>>>>
>>>> Will update this thread once I do.
>>>>
>>>
>>> Ok, I checked more. The reason this is mandatory for sc8180xp is the
>>> number of controllers is greater than number of PHYs needing this to be
>>> programmed. On all other chipsets its a 1:1 mapping.
>>>
>>
>> Correction, number of controllers is < number of PHYs.
> 
> Thanks, I'll c&p your explanation to the commit message if you don't mind.
> 

Yes you can, pls go ahead.

>>
>>> I am fine with the change once the genmap comment is addressed.
> 
