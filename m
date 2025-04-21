Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990FA94DFE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 10:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160010E229;
	Mon, 21 Apr 2025 08:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fF5ZcrPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845D510E34D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 08:21:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMZ2SV027279;
 Mon, 21 Apr 2025 08:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qNs/J9m39Uidu+QdUO3qS4CL1UPeG+3VJtONZ2Yk+GQ=; b=fF5ZcrPeWXUm238u
 Kbf1EtVVIPafrIauPBder/XX3QiOwDS1ijMV/z/aneGsJVyCjkPnWcvNgD09thCc
 7qqzuvt1YUhHGiRJ44hJDTp2h0N82eoaVipmz83p7BvwuyVhiLC2HsY2qpLQwXDB
 aZKgchnqwxASlo+HyDoFetV5TXcnbyo+XhKcKvjw3vkRf/UT/kslubOamY9lJ3FU
 kNja+JK8JqQMVMM28Go17vZ+VnctJ1bEieHolKRWSg1VANDnwPUH8/+d4iVAcwca
 H7x7G6zwnoLWSbO/QnG5PuxxcumcHXo1bwJ0UcOj7p9WWUjY3dQf+4EBa54bVTNj
 7YJ2ug==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426ke0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Apr 2025 08:21:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53L8LEga004237
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Apr 2025 08:21:14 GMT
Received: from [10.213.62.209] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 01:21:11 -0700
Message-ID: <20e60deb-f1f3-4f96-a454-9cb9d8cc7c1d@quicinc.com>
Date: Mon, 21 Apr 2025 13:51:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Greg KH <gregkh@linuxfoundation.org>
CC: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,
 <dmitry.baryshkov@oss.qualcomm.com>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
References: <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
 <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
 <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
 <2025041534-subdivide-upward-1eca@gregkh>
Content-Language: en-US
From: Deepika Singh <quic_dsi@quicinc.com>
In-Reply-To: <2025041534-subdivide-upward-1eca@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qe_ycINY0Qlh5SGUHoh1MmdsZAoWxXCA
X-Proofpoint-GUID: qe_ycINY0Qlh5SGUHoh1MmdsZAoWxXCA
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6805fffb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=spRR_jhHhYAkHvlMeisA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210064
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



On 4/15/2025 6:47 PM, Greg KH wrote:
> On Mon, Apr 14, 2025 at 12:41:47PM +0530, Deepika Singh wrote:
>>
>>
>> On 4/11/2025 1:55 PM, Ekansh Gupta wrote:
>>>
>>>
>>> On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
>>>> On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>>>>
>>>>>
>>>>> On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
>>>>>>> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
>>>>>>>>> On 11/18/2024 7:32 PM, Greg KH wrote:
>>>>>>>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
>>>>>>>>>>> Add changes to support debugfs. The fastrpc directory will be
>>>>>>>>>>> created which will carry debugfs files for all fastrpc processes.
>>>>>>>>>>> The information of fastrpc user and channel contexts are getting
>>>>>>>>>>> captured as part of this change.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>>>>>> ---
>>>>>>>>>>>    drivers/misc/fastrpc/Makefile        |   3 +-
>>>>>>>>>>>    drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>>>>>>>>>>>    drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>>>>>>>>>>>    drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>>>>>>>>>>>    4 files changed, 205 insertions(+), 3 deletions(-)
>>>>>>>>>>>    create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>>>>    create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>>>>>>>>>>> index 020d30789a80..4ff6b64166ae 100644
>>>>>>>>>>> --- a/drivers/misc/fastrpc/Makefile
>>>>>>>>>>> +++ b/drivers/misc/fastrpc/Makefile
>>>>>>>>>>> @@ -1,3 +1,4 @@
>>>>>>>>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>>>>>>>>    obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
>>>>>>>>>>> -fastrpc-objs    := fastrpc_main.o
>>>>>>>>>>> \ No newline at end of file
>>>>>>>>>>> +fastrpc-objs    := fastrpc_main.o \
>>>>>>>>>>> +                fastrpc_debug.o
>>>>>>>>>> Only build this file if debugfs is enabled.
>>>>>>>>>>
>>>>>>>>>> And again, "debug.c"?
>>>>>>>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
>>>>>>>>> few more debug specific changes, maybe then I'll need to change the build rules again.
>>>>>>>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>>>> new file mode 100644
>>>>>>>>>>> index 000000000000..cdb4fc6845a8
>>>>>>>>>>> --- /dev/null
>>>>>>>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>>>> @@ -0,0 +1,156 @@
>>>>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
>>>>>>>>>>> +
>>>>>>>>>>> +#include <linux/debugfs.h>
>>>>>>>>>>> +#include <linux/seq_file.h>
>>>>>>>>>>> +#include "fastrpc_shared.h"
>>>>>>>>>>> +#include "fastrpc_debug.h"
>>>>>>>>>>> +
>>>>>>>>>>> +#ifdef CONFIG_DEBUG_FS
>>>>>>>>>> Please put the #ifdef in the .h file, not in the .c file.
>>>>>>>>> Ack
>>>>>>>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
>>>>>>>>>>> +{
>>>>>>>>>>> +        char cur_comm[TASK_COMM_LEN];
>>>>>>>>>>> +        int domain_id, size;
>>>>>>>>>>> +        char *debugfs_buf;
>>>>>>>>>>> +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
>>>>>>>>>>> +
>>>>>>>>>>> +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
>>>>>>>>>>> +        cur_comm[TASK_COMM_LEN-1] = '\0';
>>>>>>>>>>> +        if (debugfs_dir != NULL) {
>>>>>>>>>>> +                domain_id = fl->cctx->domain_id;
>>>>>>>>>>> +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
>>>>>>>>>>> +                                current->pid, fl->tgid, domain_id) + 1;
>>>>>>>>>>> +                debugfs_buf = kzalloc(size, GFP_KERNEL);
>>>>>>>>>>> +                if (debugfs_buf == NULL)
>>>>>>>>>>> +                        return;
>>>>>>>>>>> +                /*
>>>>>>>>>>> +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
>>>>>>>>>>> +                 * domain_id in debugfs filename to create unique file name
>>>>>>>>>>> +                 */
>>>>>>>>>>> +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
>>>>>>>>>>> +                        cur_comm, current->pid, fl->tgid, domain_id);
>>>>>>>>>>> +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
>>>>>>>>>>> +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
>>>>>>>>>> Why are you saving the debugfs file?  What do you need to do with it
>>>>>>>>>> that you can't just delete the whole directory, or look up the name
>>>>>>>>>> again in the future when removing it?
>>>>>>>>> fl structure is specific to a process using fastrpc driver. The reason to save
>>>>>>>>> this debugfs file is to delete is when the process releases fastrpc device.
>>>>>>>>> If the file is not deleted, it might flood multiple files in debugfs directory.
>>>>>>>>>
>>>>>>>>> As part of this change, only the file that is getting created by a process is
>>>>>>>>> getting removed when process is releasing device and I don't think we
>>>>>>>>> can clean up the whole directory at this point.
>>>>>>>> My 2c: it might be better to create a single file that conains
>>>>>>>> information for all the processes instead of that. Or use fdinfo data to
>>>>>>>> export process / FD information to userspace.
>>>>>>> Thanks for your review. The reason of not having single file for all processes is that
>>>>>>> I can run 100s of iteration for any process(say calculator) and every time the properties
>>>>>>> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
>>>>>>> deleting the debugfs files for every process run.
>>>>>>>
>>>>>>> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
>>>>>>> the information(like in debugfs) here.
>>>>>> Which information is actually useful / interesting for application
>>>>>> developers? If not for the fdinfo, I might still vote for a single file
>>>>>> rather than a pile of per-process data.
>> Let’s say I am trying to do debugfs read when 10+ or more sessions are
>> active per channel, then for pushing data of nth process in a single file, I
>> would have to wait for n-1 processes, by that time process data might get
>> changed. How do you suggest handling this?
> 
> I suggest you NEVER use debugfs for anything that you care about this
> type of thing for.
> 
> debugfs is for debugging.  Don't expect to rely on it for anything
> relating to performance, and many/most systems don't even have it
> enabled.  It also can NOT be used for anything that actually is a real
> functionality of the system, and MUST work properly if it is not enabled
> or a failure happens with the creation of a debugfs file.
> 
> So why would this even be an issue, as surely you aren't expecting that
> debugfs be the main api for your driver, right?  :)
> 
> thanks,
> 
> greg k-h
I am not going to rely on debugfs for anything related to performance or 
real functionality. It would be used for debugging alone. Concern here 
is if i push all processes data to one file, then data might get updated 
by the time nth process's data is pushed and I might not get get correct 
data for nth process.

