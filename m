Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365859388DB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 08:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72010E372;
	Mon, 22 Jul 2024 06:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l65nNzRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0A10E373
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 06:25:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNrNF2009144;
 Mon, 22 Jul 2024 06:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 epzHvjGfNTuW8kWBWUpAehPis3xDQaoIaU0NM0n+f38=; b=l65nNzRLrEmyaPSC
 zlC0XogCCyj19J9HJ9R8TuN747Octzg28oBuDuHCiUeu9Djx3LD5g4i+C/9WfLm0
 pZw6mc6oFHRW6p2vf4T/cJ2TDa/Bjf7qU3+ml0nCPTHdvWTokr/DrJhNVNSDSdJQ
 e3bwsSM9mS5Qj8/WkkY7ECBE/upSJe2mIXPy9EEeNSeWDba+EOSlCgHxKUwnblIl
 I7Y6LPTSpYgb4yoTJDgAZD36S8eue1VbAoZLJFgYZ37IMCeEx3dYF6NzPfkDIahG
 5qY1INv1VI7dOcDxIK+LG1Yu10k+MFTTXnEEcH3DEat8kSpcSFcmy99odXdBZqdH
 MScrxQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487aubw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 06:25:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46M6PPWc012603
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 06:25:25 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 21 Jul
 2024 23:25:22 -0700
Message-ID: <35e52822-a81f-4b2c-adc1-903785ce1849@quicinc.com>
Date: Mon, 22 Jul 2024 11:55:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] misc: fastrpc: Increase unsigned PD initmem size
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-3-quic_ekangupt@quicinc.com>
 <2024072235-daydream-clunky-0272@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024072235-daydream-clunky-0272@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: g6mNA2sHTMUHVEl96SEUvXV5NRkW6U-8
X-Proofpoint-GUID: g6mNA2sHTMUHVEl96SEUvXV5NRkW6U-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_02,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=998
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220048
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



On 7/22/2024 11:30 AM, Greg KH wrote:
> On Mon, Jul 22, 2024 at 11:24:37AM +0530, Ekansh Gupta wrote:
>> For unsigned PD offloading requirement, additional memory is required
>> because of additional static heap initialization. Without this
>> additional memory, PD initialization would fail. Increase the initmem
>> size by 2MB for unsigned PD initmem buffer allocation. Any additional
>> memory sent to DSP during PD init is used as the PD heap.
>>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a3a5b745936e..18668b020a87 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -40,6 +40,7 @@
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>>  #define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
>> +#define FASTRPC_STATIC_HEAP_LEN (2 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>>  
>> @@ -1411,8 +1412,14 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  			goto err;
>>  	}
>>  
>> +	/* Allocate buffer in kernel for donating to remote process.
>> +	 * Unsigned PD requires additional memory because of the
> What is "PD"?
DSP PD(protection domain) is execution environment supported by DSP.
>
>> +	 * additional static heap initialized within the process.
>> +	 */
> Why are you using networking comment style for a non-networking file?
I observed similar style in this driver file. I will update this in proper style in the next patch.
>
>>  	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
>>  		       1024 * 1024);
>> +	if (unsigned_module)
>> +		memlen += FASTRPC_STATIC_HEAP_LEN;
> I don't understand, why is "static heap length" being added for
> something that is "unsigned"?  Why isn't this just "SIGNING FREE SPACE"
> or something like that?
The difference between signed PD and unsigned PD is:
Signed PD: Available on all DSPs and requires that the shared objects being loaded in the PD
are signed with a digital signature.

Unsigned PD: Sandboxed low-rights process that allows signature-free shared objects to run on
CDSP.

For unsigned PD there are some additional statically initialized heap for which additional memory
is required. I'll try to come up with a better name.

Thanks for the review.

--Ekansh
>
> thanks,
>
> greg "naming is hard" k-h
>

