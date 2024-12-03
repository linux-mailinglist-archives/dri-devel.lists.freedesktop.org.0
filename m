Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523629E12D7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 06:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2151810E219;
	Tue,  3 Dec 2024 05:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dNWypeZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA20010E219
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 05:22:09 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2I1wk3021119;
 Tue, 3 Dec 2024 05:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 itMmfIsQVZdPM3Aw1B8M7FOP0dxnomtjsrcBYVfOGPc=; b=dNWypeZUuNTT6AA4
 Kk5QE3A1yz4TdBu1/OHj3YXxVMmzjUkSn2jYk3iqA2L6BjOwpEUIVoxTa4C1WvME
 IpRIMPOGAzE+J1/6cN1li+ZmvyBx8ZESkWwCKV5i30wj7e3JqRhz0BMWZzQtvmMn
 htvyTz7vsIHeQ77cmmqFWHCJjRVDronLgpTUzrfgJ/XuSgC7uOMQUKsXtGBXagD8
 ey6ayPyuvrDr5+6v6sSwxKWPUTsaDTzPMsDUh/mWgN3Db3W7dBF+RwX3Lep5Ivkn
 cVLxdcGFnhG3AvXy6enTVUhIBNTqotLdr1cFEWld/VrXC2oxCWuyNuYk/1NummwV
 ge58VA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36ey26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 05:22:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B35M42M029176
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 05:22:04 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 21:22:01 -0800
Message-ID: <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
Date: Tue, 3 Dec 2024 10:51:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: l5HzmH8p12SZWCIL6rZZonynQyelXQR9
X-Proofpoint-ORIG-GUID: l5HzmH8p12SZWCIL6rZZonynQyelXQR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030043
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



On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
>>
>> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
>>>> On 11/18/2024 7:32 PM, Greg KH wrote:
>>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
>>>>>> Add changes to support debugfs. The fastrpc directory will be
>>>>>> created which will carry debugfs files for all fastrpc processes.
>>>>>> The information of fastrpc user and channel contexts are getting
>>>>>> captured as part of this change.
>>>>>>
>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>> ---
>>>>>>  drivers/misc/fastrpc/Makefile        |   3 +-
>>>>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>>>>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>>>>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>>>>>>  4 files changed, 205 insertions(+), 3 deletions(-)
>>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
>>>>>>
>>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>>>>>> index 020d30789a80..4ff6b64166ae 100644
>>>>>> --- a/drivers/misc/fastrpc/Makefile
>>>>>> +++ b/drivers/misc/fastrpc/Makefile
>>>>>> @@ -1,3 +1,4 @@
>>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
>>>>>> -fastrpc-objs	:= fastrpc_main.o
>>>>>> \ No newline at end of file
>>>>>> +fastrpc-objs	:= fastrpc_main.o \
>>>>>> +		fastrpc_debug.o
>>>>> Only build this file if debugfs is enabled.
>>>>>
>>>>> And again, "debug.c"?
>>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
>>>> few more debug specific changes, maybe then I'll need to change the build rules again.
>>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..cdb4fc6845a8
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>> @@ -0,0 +1,156 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
>>>>>> +
>>>>>> +#include <linux/debugfs.h>
>>>>>> +#include <linux/seq_file.h>
>>>>>> +#include "fastrpc_shared.h"
>>>>>> +#include "fastrpc_debug.h"
>>>>>> +
>>>>>> +#ifdef CONFIG_DEBUG_FS
>>>>> Please put the #ifdef in the .h file, not in the .c file.
>>>> Ack
>>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
>>>>>> +{
>>>>>> +	char cur_comm[TASK_COMM_LEN];
>>>>>> +	int domain_id, size;
>>>>>> +	char *debugfs_buf;
>>>>>> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
>>>>>> +
>>>>>> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
>>>>>> +	cur_comm[TASK_COMM_LEN-1] = '\0';
>>>>>> +	if (debugfs_dir != NULL) {
>>>>>> +		domain_id = fl->cctx->domain_id;
>>>>>> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
>>>>>> +				current->pid, fl->tgid, domain_id) + 1;
>>>>>> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
>>>>>> +		if (debugfs_buf == NULL)
>>>>>> +			return;
>>>>>> +		/*
>>>>>> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
>>>>>> +		 * domain_id in debugfs filename to create unique file name
>>>>>> +		 */
>>>>>> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
>>>>>> +			cur_comm, current->pid, fl->tgid, domain_id);
>>>>>> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
>>>>>> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
>>>>> Why are you saving the debugfs file?  What do you need to do with it
>>>>> that you can't just delete the whole directory, or look up the name
>>>>> again in the future when removing it?
>>>> fl structure is specific to a process using fastrpc driver. The reason to save
>>>> this debugfs file is to delete is when the process releases fastrpc device.
>>>> If the file is not deleted, it might flood multiple files in debugfs directory.
>>>>
>>>> As part of this change, only the file that is getting created by a process is
>>>> getting removed when process is releasing device and I don't think we
>>>> can clean up the whole directory at this point.
>>> My 2c: it might be better to create a single file that conains
>>> information for all the processes instead of that. Or use fdinfo data to
>>> export process / FD information to userspace.
>> Thanks for your review. The reason of not having single file for all processes is that
>> I can run 100s of iteration for any process(say calculator) and every time the properties
>> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
>> deleting the debugfs files for every process run.
>>
>> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
>> the information(like in debugfs) here.
> Which information is actually useful / interesting for application
> developers? If not for the fdinfo, I might still vote for a single file
> rather than a pile of per-process data.
I have tried to capture all the information that could be useful.

I can try changes to maintain single file for all active processes. Having this file specific
to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
carry information of all processes using that remoteproc.

--ekansh
>
>> --ekansh
>>>

