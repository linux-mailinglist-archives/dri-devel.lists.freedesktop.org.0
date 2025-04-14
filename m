Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F755A87945
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A481510E30B;
	Mon, 14 Apr 2025 07:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyGMOaWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2110E30B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:44:44 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DHa1pb001993
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=amtLfqS20UyGP3/aF+w9heer
 yr5MJX9hjD6jnXN4jyI=; b=QyGMOaWJS0QuOba9/Ox0odoavdtIGqiQnQzU+/Ou
 6JFl8vqHLq5gYTooiSEivK1BAWESV5UiFJhjiYdQHZMgKjZu59IqT/0WzM9tqCtO
 KpbQFbg6KUXDarunl8gSB8Cyg1frKO5ueGIfSbxb2h3i2KdGeAXLTu7BCoBJYa3j
 lcfpUx1SK78i8P/LL6GwqsN/cQ3ftJ0NS8Mzfv57yF8QJOLVF7dZKcvQo7x132Hw
 IjS9a3WDi1o/LoRkou83WUfFb+16AnzBFeXsrTx2iytxlup8gaqUwRxU2Gj33v+7
 Tz55BP72adc//GmVUw8ZBiD2haUBZr5Cgeky5LqaZaoimA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj93pj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:44:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f0c089909aso73578356d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744616681; x=1745221481;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amtLfqS20UyGP3/aF+w9heeryr5MJX9hjD6jnXN4jyI=;
 b=DUPuAyMv7zGYJFM49Dysj0+mtDiU8cPecq4MOjxs3AFtaX9VE0HJUNbK9cOGGj3IPY
 7gJkqch/SxvLfz7u2Z8hneYK9SLi/9hSbu6Y9rhbb4WR4Ax6rqrVJnERWt439TQHA3b4
 m7XM6yAkRWUyb4Q/cqgjuzrKr4TKio8IF352dEy+ozPIMwhDszasjCsu3NLM+rEceqh6
 dZDNXzFYp4YJrXv0He5HF8EU7wn2/Oo1Yg0Seu7fnWgcRQX5cT/xWLpfhMPUnPrzXSm/
 onb1B0drmEvk3LsFsNxeIhrBWcDICIiHdpDWs55cbJTnUTk+6mAyZcJtiz4ULTRudvxm
 Wgfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6VNfMcfGzyOwqrAuh1JcYSYrwalDJynubGSpqgFHVqpwWCxn+GdcnqKlo38DyVJxPwz2M4/YzH+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr4ZfA1a84MZJGHjj8MAqhHyIC6bytJ8CKqA+E+rXKe9L0JjZj
 j6RnhdD8ROaDCylOZ32v9SHLC1YoBrSGK0KvSTzt7fn/HQDW0nLl6bXLkt93WuC3h+9b11UbHhK
 vw1Hp0+F5IRBYpFXPU4y1w8UT9eygoNxmoAheRaVY1j2RTiLFKk3QwEBjCM4CuIJsEfw=
X-Gm-Gg: ASbGncuUfJjjf90sU85UfDrTfS3ITALo/MjNr3V+BSu2kbcFo5eLN2EiP4bhqAPhlUi
 aUezgMLkLI/Q+LGZ0XDKDEHjFOWhhzfIpxlsxCgno2vYBI7EHUVnJrFG4Zt/brKFdktIvR0H7Jh
 qUL0jJfqJSUbJd3Cw5PyG03LLx8b1/mc3bKVdkbeUD+5xas50icOo6rAEFrwSOH989Z0BONkVdk
 pFCQllpqps+mjQtvNXfnCODiX8/r589j5INRl6B7eoQjQ+tPN75WUxgJqYs58uy+AwISNHfLREv
 xct5qT0xfncJUejG8uuVfVDenBmK3rew/iRnzKwY9k+HIGMEmzL6XxIzUksM63e6tSB0y50E9tw
 =
X-Received: by 2002:a05:6214:23c5:b0:6e4:2872:45f5 with SMTP id
 6a1803df08f44-6f230d92f8cmr176297246d6.25.1744616680751; 
 Mon, 14 Apr 2025 00:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4wGQzwGXF9t5mERNA8FQ+RoATEaIeTO5j1fILGHo04LQxp4vPBDrtkY6+CrcYd6j3fXQGAA==
X-Received: by 2002:a05:6214:23c5:b0:6e4:2872:45f5 with SMTP id
 6a1803df08f44-6f230d92f8cmr176296976d6.25.1744616680191; 
 Mon, 14 Apr 2025 00:44:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d81dsm16322471fa.2.2025.04.14.00.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 00:44:39 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:44:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_dsi@quicinc.com,
 Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <wnsfo3oh2drieswureetgqw4kd3u7vth7lql2crttiu5znq7q7@uaing33r7efq>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
 <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Tp_vGgxCRoul6X9euqHk3m1iWt-YFcR9
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcbce9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=05C-0vp_eMJKYO2ljG8A:9
 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Tp_vGgxCRoul6X9euqHk3m1iWt-YFcR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140054
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

On Fri, Apr 11, 2025 at 01:55:12PM +0530, Ekansh Gupta wrote:
> 
> 
> On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
> > On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> >>
> >>
> >> On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> >>>> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> >>>>>> On 11/18/2024 7:32 PM, Greg KH wrote:
> >>>>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >>>>>>>> Add changes to support debugfs. The fastrpc directory will be
> >>>>>>>> created which will carry debugfs files for all fastrpc processes.
> >>>>>>>> The information of fastrpc user and channel contexts are getting
> >>>>>>>> captured as part of this change.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/misc/fastrpc/Makefile        |   3 +-
> >>>>>>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> >>>>>>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> >>>>>>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> >>>>>>>>  4 files changed, 205 insertions(+), 3 deletions(-)
> >>>>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> >>>>>>>> index 020d30789a80..4ff6b64166ae 100644
> >>>>>>>> --- a/drivers/misc/fastrpc/Makefile
> >>>>>>>> +++ b/drivers/misc/fastrpc/Makefile
> >>>>>>>> @@ -1,3 +1,4 @@
> >>>>>>>>  # SPDX-License-Identifier: GPL-2.0
> >>>>>>>>  obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> >>>>>>>> -fastrpc-objs    := fastrpc_main.o
> >>>>>>>> \ No newline at end of file
> >>>>>>>> +fastrpc-objs    := fastrpc_main.o \
> >>>>>>>> +                fastrpc_debug.o
> >>>>>>> Only build this file if debugfs is enabled.
> >>>>>>>
> >>>>>>> And again, "debug.c"?
> >>>>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> >>>>>> few more debug specific changes, maybe then I'll need to change the build rules again.
> >>>>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>>>> new file mode 100644
> >>>>>>>> index 000000000000..cdb4fc6845a8
> >>>>>>>> --- /dev/null
> >>>>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>>>> @@ -0,0 +1,156 @@
> >>>>>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
> >>>>>>>> +
> >>>>>>>> +#include <linux/debugfs.h>
> >>>>>>>> +#include <linux/seq_file.h>
> >>>>>>>> +#include "fastrpc_shared.h"
> >>>>>>>> +#include "fastrpc_debug.h"
> >>>>>>>> +
> >>>>>>>> +#ifdef CONFIG_DEBUG_FS
> >>>>>>> Please put the #ifdef in the .h file, not in the .c file.
> >>>>>> Ack
> >>>>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> >>>>>>>> +{
> >>>>>>>> +        char cur_comm[TASK_COMM_LEN];
> >>>>>>>> +        int domain_id, size;
> >>>>>>>> +        char *debugfs_buf;
> >>>>>>>> +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> >>>>>>>> +
> >>>>>>>> +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> >>>>>>>> +        cur_comm[TASK_COMM_LEN-1] = '\0';
> >>>>>>>> +        if (debugfs_dir != NULL) {
> >>>>>>>> +                domain_id = fl->cctx->domain_id;
> >>>>>>>> +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> >>>>>>>> +                                current->pid, fl->tgid, domain_id) + 1;
> >>>>>>>> +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> >>>>>>>> +                if (debugfs_buf == NULL)
> >>>>>>>> +                        return;
> >>>>>>>> +                /*
> >>>>>>>> +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >>>>>>>> +                 * domain_id in debugfs filename to create unique file name
> >>>>>>>> +                 */
> >>>>>>>> +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >>>>>>>> +                        cur_comm, current->pid, fl->tgid, domain_id);
> >>>>>>>> +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >>>>>>>> +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> >>>>>>> Why are you saving the debugfs file?  What do you need to do with it
> >>>>>>> that you can't just delete the whole directory, or look up the name
> >>>>>>> again in the future when removing it?
> >>>>>> fl structure is specific to a process using fastrpc driver. The reason to save
> >>>>>> this debugfs file is to delete is when the process releases fastrpc device.
> >>>>>> If the file is not deleted, it might flood multiple files in debugfs directory.
> >>>>>>
> >>>>>> As part of this change, only the file that is getting created by a process is
> >>>>>> getting removed when process is releasing device and I don't think we
> >>>>>> can clean up the whole directory at this point.
> >>>>> My 2c: it might be better to create a single file that conains
> >>>>> information for all the processes instead of that. Or use fdinfo data to
> >>>>> export process / FD information to userspace.
> >>>> Thanks for your review. The reason of not having single file for all processes is that
> >>>> I can run 100s of iteration for any process(say calculator) and every time the properties
> >>>> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> >>>> deleting the debugfs files for every process run.
> >>>>
> >>>> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> >>>> the information(like in debugfs) here.
> >>> Which information is actually useful / interesting for application
> >>> developers? If not for the fdinfo, I might still vote for a single file
> >>> rather than a pile of per-process data.
> >> I have tried to capture all the information that could be useful.
> >>
> >> I can try changes to maintain single file for all active processes. Having this file specific
> >> to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> >> carry information of all processes using that remoteproc.
> > I think it's a better idea, yes.
> 
> Hi all,
> 
> I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
> on this patch series.

Please don't do this in future. Corresponding engineer can download the
mbox of the thread from lore.kernel.org, import it into the email client
and respond directly, without extra emails.

-- 
With best wishes
Dmitry
