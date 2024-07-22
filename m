Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CCF938A72
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953CF10E3C5;
	Mon, 22 Jul 2024 07:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jXQrZ9s+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE4C10E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:54:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNeO1u022587;
 Mon, 22 Jul 2024 07:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a56rZKm8C/m55xUFMXSQgb2iVdlO+WEYhbq0R07Sjqc=; b=jXQrZ9s+NLQF9xcw
 868KAt5ojnmuHZCfuF0/p+0N4GalnzkzR9lAErldwwSdulDSxYmCNsSCQVQX/riD
 IOfR3WDG9wErUe3+flMHAxnQ2n8ydZaYVhuhboZ2lafccjw2jPG14EARA9U3Bdev
 iv0fdGrxAncmgoabt5NTFc/Rcuqzh4DgQdjriUFSbzEgQWIwG2JMa8zsTtJ2IMeU
 51kT4j555mFBzaaEcTDBgsxxQOiL3pZt5UlDqJPE/ygLvmSscXTB/WcSD8AY163b
 XDJsAVaXw9hWWpurDMhR9GoIxqQBxsyFpUmoRmUyAtjDB05P6Pg0DlcP4BFvLd1V
 pgofwg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g6h8tvxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 07:54:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46M7s2tx027808
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 07:54:02 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 00:53:59 -0700
Message-ID: <0d29ff01-9d8c-48b9-b845-3370222c4ff4@quicinc.com>
Date: Mon, 22 Jul 2024 13:23:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
 <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
 <2024072227-purposely-swinger-86ad@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024072227-purposely-swinger-86ad@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: R1w4Kxb8iSEHZcRfbH52GGldrcl6uP4Q
X-Proofpoint-GUID: R1w4Kxb8iSEHZcRfbH52GGldrcl6uP4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220060
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



On 7/22/2024 1:09 PM, Greg KH wrote:
> On Mon, Jul 22, 2024 at 11:42:52AM +0530, Ekansh Gupta wrote:
>>
>> On 7/22/2024 11:28 AM, Greg KH wrote:
>>> On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
>>>> For user PD initialization, initmem is allocated and sent to DSP for
>>>> initial memory requirements like shell loading. The size of this memory
>>>> is decided based on the shell size that is passed by the user space.
>>>> With the current implementation, a minimum of 2MB is always allocated
>>>> for initmem even if the size passed by user is less than that. For this
>>>> a MACRO is being used which is intended for shell size bound check.
>>>> This minimum size of 2MB is not recommended as the PD will have very
>>>> less memory for heap and will have to request HLOS again for memory.
>>>> Define a new macro for initmem minimum length of 3MB.
>>>>
>>>> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
>>>> Cc: stable <stable@kernel.org>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index a7a2bcedb37e..a3a5b745936e 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -39,6 +39,7 @@
>>>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
>>> Meta-comment, for a future change, why not tabs to line things up?
>> Sure, I'll add a comment.
> I didn't say anything about comments :(
Oops, sorry.
>
>> Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?
> As I said, yes, for a future change.
Noted, thanks.
>>> How was this tested?
>> This is tested with fastrpc use cases available in hexagon SDK:
>> https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps
> Do you have regression tests that attempt to check the boundry
> conditions and alignment here?
For most of the test cases, I used the fastrpc lib:
https://github.com/quic/fastrpc

This library is taking care of passing proper shell size which is within the boundary for
all the platform that I've tried.
I'll try creating and running some regression tests for this change.

--Ekansh
>
> thanks,
>
> greg k-h

