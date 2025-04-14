Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52492A8798C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC4110E4C3;
	Mon, 14 Apr 2025 07:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFHl9N/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655110E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:56:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DM3DmB003299
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QTd2sEodLfoDRatqGlm0DiCDU6pIX1JURxmk0r8oWSU=; b=KFHl9N/DPU2bJDLq
 3YHl22BNRt5wBtDUZAswmsd6hWJiLNG0J09EAnGPM7Dj6aLS4gTPPkhsQKdWbRwW
 Lu9Ss0KPOmzIN/GUEqNqRRmrJvmrE4s/jOZ2axTG/8PxKb/X71HubJhBCmQ0fleC
 5jGO7yNQxwNwbVHdrTvHNr9qbaE+KdEnH7ZHNvCdOpm4dDZZEm4M4TWPaO9kyU6L
 MV2yjJhiqOjkThC7HgxKEHSAQfz09etxIhl81KEj0IuPoByipaP4/LDOHAyOf0Yu
 KRagxJo+kD6Uzi7uJ+5BQU5l4XjTndcO0iBjIkPgn0qUXgGhOrcAQsEoQZ/D4FY+
 5F9rcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs13sux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:56:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c548e16909so367202485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744617380; x=1745222180;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTd2sEodLfoDRatqGlm0DiCDU6pIX1JURxmk0r8oWSU=;
 b=QQ61DBV+OOfaNxKGtAq6iEVYNEHRtpdgUXxIYX8BnrzHYnmyBTIubnz7k7FjQhFJVb
 W3B0fWon1LkotTdxpFjSE0AAbw6eL6cOOw1MpaSy8nVGbTvB18t5RwMDPdkxKErPBONN
 qSvoz5v+6uFJhiFykNsZmVMs/OODM32O8sbNtYH16G8rhTqq453/HNDBttoz0JWPD3Oz
 308nhJSkR+lw0TVoME7EegUkY0ODEsrCXjSNDFJmVonMEnstcwwCs76EiZHpvs9neCml
 7kvU/LN4pT3fl8VSTFKZPxgJJMRyW3sZ47xR8aqLbtCGqhOdia/vamERWO4d2tI7WXXH
 5fbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLMbzjW8GRwDaGhW2kJm9Zk5BKVZihSPPvcE+PZ5P6nhUqb6JH+xt5znuI2LkpLisc/2Q8vWhSSCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV8HLXuMyq8/0TZtPbO0weND/+A4RcUjxi/han2q5Gebx1I5Rq
 xxUqQHTcDMIj33f//z5vlbMe/ahgpx9Bz77/OYcSALoQ6QJ4fLPwtuR3C8UKNPXg0HKhzyRnarG
 kpB8sYCW4Lya36PfbpiT97SZsWFCHgibFvXGRiS5u+HnaljZml8BnaYgOKkMTZO723NM=
X-Gm-Gg: ASbGnctghMqZRUz76mt0XdnwJS1k5bnppm3zVQWuckenYRvwYCpFimUOn1iy1xZtOsr
 5EYRjECE95AaVHFLTuBuhr4Tw0Oo0yOCLKJlKtecRNTy0BNzWZaI2qYD9rDZHo/v9wq6/DYAISg
 DCOlUH7Gbe7RVBtNvcc+Xoxk8q+eFKmcOQ1jHdGm4cpn7mwuwFAFSyETedk7o0l4GAqBg/iTHhN
 CtUBeAAuO8NtRB0dnZb0YHSCL6eMispc9wlKt3/UhsbWb6ptQ+zjyHu33M6yzHF0yATLCGhNZP7
 xouGNE/XFGXodJcct2TiFpYJt7aKTK2L0XZwgkoOdpJ9t6C93hw4WKKCgBGnKkRPBzQRVCvNPDA
 =
X-Received: by 2002:a05:620a:2685:b0:7c5:4b91:6a44 with SMTP id
 af79cd13be357-7c7af0ca45emr1410999885a.19.1744617380107; 
 Mon, 14 Apr 2025 00:56:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+LYZnj9A/SFmrFlXRBLAhiSmwM5Mt4wteyGh059T+i0ELNsQLBpv2I7YtAsSzFTGK+QHM6A==
X-Received: by 2002:a05:620a:2685:b0:7c5:4b91:6a44 with SMTP id
 af79cd13be357-7c7af0ca45emr1410997285a.19.1744617379513; 
 Mon, 14 Apr 2025 00:56:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cc436sm15992051fa.36.2025.04.14.00.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 00:56:18 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:56:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepika Singh <quic_dsi@quicinc.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <qvf63gpp2yrvsndeybfp2geqan5kj4dbyjno3z22cqzwzh45qi@gmywommru2k3>
References: <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
 <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
 <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
 <pczibldk4nzu2zvyca4ub4kxiyvismuy46a4rcxkqwy7ncaf4d@ktm2vpaejdmg>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pczibldk4nzu2zvyca4ub4kxiyvismuy46a4rcxkqwy7ncaf4d@ktm2vpaejdmg>
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fcbfa5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=6FQHYmspoKhg_JjAtXEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OJD3aDdTDTG1rpm_V37Lx9xaM5qlOr05
X-Proofpoint-ORIG-GUID: OJD3aDdTDTG1rpm_V37Lx9xaM5qlOr05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140056
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

On Mon, Apr 14, 2025 at 10:48:49AM +0300, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 12:41:47PM +0530, Deepika Singh wrote:
> > 
> > 
> > On 4/11/2025 1:55 PM, Ekansh Gupta wrote:
> > > 
> > > 
> > > On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
> > > > On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> > > > > > > On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> > > > > > > > > On 11/18/2024 7:32 PM, Greg KH wrote:
> > > > > > > > > > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> > > > > > > > > > > Add changes to support debugfs. The fastrpc directory will be
> > > > > > > > > > > created which will carry debugfs files for all fastrpc processes.
> > > > > > > > > > > The information of fastrpc user and channel contexts are getting
> > > > > > > > > > > captured as part of this change.
> > > > > > > > > > > 
> > > > > > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > > > > > ---
> > > > > > > > > > >   drivers/misc/fastrpc/Makefile        |   3 +-
> > > > > > > > > > >   drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> > > > > > > > > > >   drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> > > > > > > > > > >   drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> > > > > > > > > > >   4 files changed, 205 insertions(+), 3 deletions(-)
> > > > > > > > > > >   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > >   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > > index 020d30789a80..4ff6b64166ae 100644
> > > > > > > > > > > --- a/drivers/misc/fastrpc/Makefile
> > > > > > > > > > > +++ b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > > @@ -1,3 +1,4 @@
> > > > > > > > > > >   # SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > >   obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> > > > > > > > > > > -fastrpc-objs    := fastrpc_main.o
> > > > > > > > > > > \ No newline at end of file
> > > > > > > > > > > +fastrpc-objs    := fastrpc_main.o \
> > > > > > > > > > > +                fastrpc_debug.o
> > > > > > > > > > Only build this file if debugfs is enabled.
> > > > > > > > > > 
> > > > > > > > > > And again, "debug.c"?
> > > > > > > > > I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> > > > > > > > > few more debug specific changes, maybe then I'll need to change the build rules again.
> > > > > > > > > > > diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > > new file mode 100644
> > > > > > > > > > > index 000000000000..cdb4fc6845a8
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > > @@ -0,0 +1,156 @@
> > > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > > +// Copyright (c) 2024 Qualcomm Innovation Center.
> > > > > > > > > > > +
> > > > > > > > > > > +#include <linux/debugfs.h>
> > > > > > > > > > > +#include <linux/seq_file.h>
> > > > > > > > > > > +#include "fastrpc_shared.h"
> > > > > > > > > > > +#include "fastrpc_debug.h"
> > > > > > > > > > > +
> > > > > > > > > > > +#ifdef CONFIG_DEBUG_FS
> > > > > > > > > > Please put the #ifdef in the .h file, not in the .c file.
> > > > > > > > > Ack
> > > > > > > > > > > +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> > > > > > > > > > > +{
> > > > > > > > > > > +        char cur_comm[TASK_COMM_LEN];
> > > > > > > > > > > +        int domain_id, size;
> > > > > > > > > > > +        char *debugfs_buf;
> > > > > > > > > > > +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> > > > > > > > > > > +
> > > > > > > > > > > +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> > > > > > > > > > > +        cur_comm[TASK_COMM_LEN-1] = '\0';
> > > > > > > > > > > +        if (debugfs_dir != NULL) {
> > > > > > > > > > > +                domain_id = fl->cctx->domain_id;
> > > > > > > > > > > +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> > > > > > > > > > > +                                current->pid, fl->tgid, domain_id) + 1;
> > > > > > > > > > > +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> > > > > > > > > > > +                if (debugfs_buf == NULL)
> > > > > > > > > > > +                        return;
> > > > > > > > > > > +                /*
> > > > > > > > > > > +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> > > > > > > > > > > +                 * domain_id in debugfs filename to create unique file name
> > > > > > > > > > > +                 */
> > > > > > > > > > > +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> > > > > > > > > > > +                        cur_comm, current->pid, fl->tgid, domain_id);
> > > > > > > > > > > +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> > > > > > > > > > > +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> > > > > > > > > > Why are you saving the debugfs file?  What do you need to do with it
> > > > > > > > > > that you can't just delete the whole directory, or look up the name
> > > > > > > > > > again in the future when removing it?
> > > > > > > > > fl structure is specific to a process using fastrpc driver. The reason to save
> > > > > > > > > this debugfs file is to delete is when the process releases fastrpc device.
> > > > > > > > > If the file is not deleted, it might flood multiple files in debugfs directory.
> > > > > > > > > 
> > > > > > > > > As part of this change, only the file that is getting created by a process is
> > > > > > > > > getting removed when process is releasing device and I don't think we
> > > > > > > > > can clean up the whole directory at this point.
> > > > > > > > My 2c: it might be better to create a single file that conains
> > > > > > > > information for all the processes instead of that. Or use fdinfo data to
> > > > > > > > export process / FD information to userspace.
> > > > > > > Thanks for your review. The reason of not having single file for all processes is that
> > > > > > > I can run 100s of iteration for any process(say calculator) and every time the properties
> > > > > > > of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> > > > > > > deleting the debugfs files for every process run.
> > > > > > > 
> > > > > > > Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> > > > > > > the information(like in debugfs) here.
> > > > > > Which information is actually useful / interesting for application
> > > > > > developers? If not for the fdinfo, I might still vote for a single file
> > > > > > rather than a pile of per-process data.
> > Let’s say I am trying to do debugfs read when 10+ or more sessions are
> > active per channel, then for pushing data of nth process in a single file, I
> > would have to wait for n-1 processes, by that time process data might get
> > changed. How do you suggest handling this?
> 
> I'm yet to see the response to my question, what kind of information are
> you outputting? What is actually relevant? Could you please provide an
> example from the running system, so that we don't have to guess?

And meanwhile could you please take a look at existing implementations?
E.g /sys/kernel/debug/dri/*/state, /sys/kernel/debug/dri/*/gem and the
fdinfo files for the process actually using drm/msm driver (you will see
memory consumption data there).

> 
> > > > > I have tried to capture all the information that could be useful.
> > > > > 
> > > > > I can try changes to maintain single file for all active processes. Having this file specific
> > > > > to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> > > > > carry information of all processes using that remoteproc.
> > > > I think it's a better idea, yes.
> > > 
> > > Hi all,
> > > 
> > > I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
> > > on this patch series.
> > > 
> > > //Ekansh
> > > 
> > > > > --ekansh
> > > > > > > --ekansh
> > > > 
> > > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
