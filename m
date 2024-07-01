Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8533591D75D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 07:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5029E10E103;
	Mon,  1 Jul 2024 05:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IUrKrny0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F8C10E103
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 05:20:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UNLOof029716;
 Mon, 1 Jul 2024 05:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4a2O7qrkxkzyH3gCgKnG6pbSAyFQPx3Yp+k6LjeNeb0=; b=IUrKrny00hFYmWet
 IK9Drk+nEjxFI9smQP8xW4cMTOXPLW/bFe8pRgHSwXMrqLwWdkdwnbb0M2lh31SI
 h6sHpvR2k4yNeH1VfMLwRWhgnTHVP7FC1jt0lgHDWNeyS+xAHQ7F7NUIGVixP7M7
 UMiweT5GzNLLuaEkV5/BRK3w9ktCcE9Z067g8Fehwe5RapBHV9ykbkEYOiP6ySoF
 owKxVshycgwDNteiqFJQkZTcZYLHcRE6n+5yV0gbi1y93vKnuOy3BRaZZ7FYUCVf
 tjQGpC/yS70fAPOwUJ0YwT0U6vBRW3j8Ly7Dg/bymjuoEoVdGuY2XdpfWbf34jD7
 9ruIQg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402996k6j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2024 05:20:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4615Kiig013910
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 Jul 2024 05:20:44 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 30 Jun
 2024 22:20:41 -0700
Message-ID: <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
Date: Mon, 1 Jul 2024 10:50:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024062849-brunt-humvee-d338@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 90s7PK4iyRa7AhEpbkdqklb4WD1SqIcT
X-Proofpoint-ORIG-GUID: 90s7PK4iyRa7AhEpbkdqklb4WD1SqIcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=906
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407010038
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



On 6/28/2024 7:51 PM, Greg KH wrote:
> On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
>>
>> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
>>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
>>>>> For user PD initialization, initmem is allocated and sent to DSP for
>>>>> initial memory requirements like shell loading. This size is passed
>>>>> by user space and is checked against a max size. For unsigned PD
>>>>> offloading, more than 2MB size could be passed by user which would
>>>>> result in PD initialization failure. Remove the user PD initmem size
>>>>> check and allow buffer allocation for user passed size. Any additional
>>>>> memory sent to DSP during PD init is used as the PD heap.
>>>> Would it allow malicious userspace to allocate big enough buffers and
>>>> reduce the amount of memory available to the system? To other DSP
>>>> programs?
>>> The allocation here is happening from SMMU context bank which is uniquely assigned
>>> to processes going to DSP. As per my understanding process can allocate maximum
>>> 4GB of memory from the context bank and the memory availability will be taken care
>>> by kernel memory management. Please correct me if my understanding is incorrect.
>> Just wanted to add 1 question here:
>> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
>> allocated huge memory?
> No, because any userspace program that takes up too much memory will be
> killed by the kernel.
>
> You can not have userspace tell the kernel to allocate 100Gb of memory,
> as then the kernel is the one that just took it all up, and then
> userspace applications will start to be killed off.
>
> You MUST bounds check your userspace-supplied memory requests.  Remember
> the 4 words of kernel development:
>
> 	All input is evil.
Thanks for the detailed explanation, Greg. I'll remember this going forward.

For this change, I'll increase the max size limit to 5MB which is the requirement for
unsigned PD to run on DSP.

--Ekansh
> thanks,
>
> greg k-h

