Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A023B923774
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8810E57E;
	Tue,  2 Jul 2024 08:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iAzpE2rL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0135F10E572
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 08:40:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4628eZII011448;
 Tue, 2 Jul 2024 08:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ai4mMkxG7K2zhtMaV60b0R6R2hGk3c6gNObnKdp7cck=; b=iAzpE2rLBMfbirZA
 xYkjaP2BrBkTm10pKM3/Bn5ngsOOTSzCidKIpDrwlikX6HjC/nYDzrkwsKIr/xqT
 Ibg8Z7wE2nB0GFwsT1CjhbzbodYGryGZSDlMSYJiJ5t5M2TH+kLxH+jjIcY1oWWS
 knBVvnaPgr+K59Kwa8CAfjM7q16XYm0Rzejjn5erAOMl3H4tW9+mBgELDDeeFz+T
 XwS2vnzbjjNYsv9qv9BBcl66fBT2dIth/aMCB66kPYEd6F8pTtCHXHhzL9Xcz/cW
 6dZfluIuAL4tx6i4hS4WX9UvXSHYFVNzzZWaThiXNGkW0rGqb6OyB2tn9R6virn8
 IgcXAw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402an769bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2024 08:40:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4628eX7f008915
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Jul 2024 08:40:33 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 01:40:29 -0700
Message-ID: <46aa3914-7ac9-4605-911f-5120e8a33720@quicinc.com>
Date: Tue, 2 Jul 2024 14:10:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Increase max user PD initmem size
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
References: <20240701115237.371020-1-quic_ekangupt@quicinc.com>
 <ZoMcM+F8r58tmE7g@hu-bjorande-lv.qualcomm.com>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <ZoMcM+F8r58tmE7g@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OUYXYds6jrjvyUvX1jaQQfxaPyVkCN5k
X-Proofpoint-ORIG-GUID: OUYXYds6jrjvyUvX1jaQQfxaPyVkCN5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_04,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020065
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



On 7/2/2024 2:44 AM, Bjorn Andersson wrote:
> On Mon, Jul 01, 2024 at 05:22:37PM +0530, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. This size is passed
>> by user space and is checked against a max size.
> Why does fastrpc_init_create_process() allocate 4x the passed value and
> why is the value rounded up to INIT_FILELEN_MAX?
The passed value is actually the size of fastrpc shell. This size is not sufficient for the user
PD initialization and the PD also needs some additional memory for it's other requirements
like heap. The value is aligned to 1 MB and there is a possibility that the user passed value
is zero(user can only pass the size if it can open the shell). For this, there is at least some
memory allocated and sent to DSP for PD initialization(2MB as of today).
>> For unsigned PD
>> offloading requirement, more than 2MB size could be passed by user
>> which would result in PD initialization failure. Increase the maximum
>> size that can be passed py user for user PD initmem allocation.
> Sounds good, but why not 2.1MB or a rounder arbitrary value of 8 or 16?
>
> What is actually expected to fit in this initial memory? Is it the shell
> that has grown beyond 2MB?
I checked this again with the size of shell and I see that the shell size is not going beyond
2 MB, it's the unsigned PD requirement which is asking for more memory. This is because
there are some static heap initialization specifically for unsigned PD. Do you suggest having
a different definition for minimum initmem? Or have it as a local variable which changes
based on PD type(2MB for signed PD and 5MB for unsigned PD)?
>
> Also, s/py/by
>
>> Any
>> additional memory sent to DSP during PD init is used as the PD heap.
>>
> Does this mean that the initmem is used for shell loading and initial
> heap, and if more heap is needed after that the DSP can request more
> memory? Related to the question in v2, how is this memory accounted for?
Yes this is for the initial heap requirement of PD(described above also). In case any more
memory is required by DSP PD, it will make a reverse call to borrow more memory from
HLOS using ADD_PAGES request which is supported by fastrpc_req_mmap. However,
for unsigned PD the heaps are statically initialized which brings the requirement of some
additional memory.
>
> What would it mean that init.filefd != 0 in
> fastrpc_init_create_process(), will that pre-allocated memory (which was
> allocated without any size checks afaict) then be used for the same
> purpose? Why is a buffer of 4x the size of initfd then also allocated
> and mapped to the DSP?
The init.filefd is the FD of fastrpc shell that is opened and read by the process user space.
I believe the pre-allocated memory you mentioned is the memory pointed by init.file. If
the shell file is opened by user process DSP will load the shell and add the initmem to the
DSP PD pool. If the user space has not opened and read the shell, DSP root PD daemon
will open and read the shell for loading for PD spawning. Please let me know if there are
any more questions here. Basically the usage of initmem is for shell loading and remaining
memory is added to PD pool of heap and other usage.
>
>
> Could you please send a patch adding some comments documenting these
> things, the steps taken to create a new process, and what the 6
> arguments built in fastrpc_init_create_process() actually means?
Sure, I'll add this information in the next spin.
>
> Perhaps I'm just failing to read the answers already in the
> implementation, if so I'm sorry.
Thanks for reviewing the patch. I'll add most of the information in commit text and as
comments in the next patch.

--Ekansh
>
> Regards,
> Bjorn
>
>> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>> Changes in v2:
>>   - Modified commit text.
>>   - Removed size check instead of updating max file size.
>> Changes in v3:
>>   - Added bound check again with a higher max size definition.
>>   - Modified commit text accordingly.
>>
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 5204fda51da3..11a230af0b10 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -38,7 +38,7 @@
>>  #define FASTRPC_INIT_HANDLE	1
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>> -#define INIT_FILELEN_MAX (2 * 1024 * 1024)
>> +#define INIT_FILELEN_MAX (5 * 1024 * 1024)
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>>  
>> -- 
>> 2.34.1
>>
>>
>>

