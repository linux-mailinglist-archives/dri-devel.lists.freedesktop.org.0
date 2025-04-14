Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E4A8795E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C4610E307;
	Mon, 14 Apr 2025 07:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYB3yXjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D49110E307
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:48:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNK0Zm004059
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8KREhxuaFak/oxjveI0zqqLhsiLntJShK9e09yzhhoY=; b=KYB3yXjFaHcLToGq
 qsdrkdEWzn38xTXrvVPyOJotp/zSFvebtnb07qPLfx+zSqrMLfWYkC1ZN7o5IMXp
 RXpIzhczM1LRkP+NTtXqTxWhTE9+7hr0bTaKS3r7zbwy8KVMLoOb72BtbpqqFEIG
 qSrEC+lPMjaoZVE/zfmXA+p8be1TLVLdZ3Jmy3Je3WOQDtKDyc6pKBVCBxPJrgb2
 tAgsTx7JrIfR54RvQvKTrgjpGMYchTUGe/aRBRjCmfUrd71Igtg8D0OzrEMqEWoY
 qyCWQT2UBfh5YkJQGlAvrBGi55ef6XyZtE4F1FBVngq3QT29KwQRH2a1XoTlcJlP
 Q+e1aA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjumvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:48:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c543ab40d3so618334985a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744616932; x=1745221732;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8KREhxuaFak/oxjveI0zqqLhsiLntJShK9e09yzhhoY=;
 b=Fn5GMHmJGHYMiL9AzM5/8jfYvbUiGIbOC0Z3FZtefqxfyH7OnfDYxMPkgyCV5RXDmq
 hva14y8VugS15dzfQHwGFP5UYWlfKSHHx7cxO8P2LwcmeFI/cbSsp5PorSl0skkRN39/
 wG0k7BDLsJvYXb7nVaKvApZMz/cFaFQRyW4QYlr4RrcWUrDaEpn/27WE9nGgDdwB4k6F
 5RFLHUUgAn4fr3D7fLSLyC2GRtB/hT+LnTLqrDusAFRvwpH+SXVYs8isdnWgiiq6VQWD
 wy3aPxtFBdg/TBT8b8hdrlBABsgwPZI2IDKnj3M2Lu5xlg7pLgm+iImfUENOFP0vDxa/
 LfiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIDOFGYtfnLiR6ZGjhBzQxTOa3nVQ8xDNDgZAbQGlX1Isp1jgAOUH+Puo2qi+fkNGoQ+tQf0d4xyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8kxEab0p4gjUP3sLgSFg47G7+Zu8EogESFrPS/lI3lOYVRXOd
 yaS+hNUAYrzCjHqk+5Lkoxgvdq+XUaBMsgXbpt/QV5UiZUHsSlw6UMqIwSm0JCfSBXJkZZ9ROAq
 PUy1gY1+Lk2dKZ5M/n63Rb2o2iWuq/UhlJCbyhOoNECbKxFLKEwou6uHl56iWa5HK1YQ=
X-Gm-Gg: ASbGncvNFZnm2rsiiJrgAWz16x2aIVbOtg04MhzZYwNPmw6HOn+RDgCeslS2TsRl0Sp
 z8X1NlhZfhO97op53RsGwgAuPZ1P+PQ8z0CxbGkEH++m10ppqOKncabXKwQZqCbQwecaKAvE7kN
 l5MYqaPTH4w9mqwgCMwlTLRYbsOij2mUK41XsOJv0shdn4FOjnzdnOhm5bFh0Pf7I4d5UiCkL/C
 ElM0v5q6GhX7qKuXpY/q05jOliZUZx4yf3edDUclxsyJ4b/Z35TL4ffKoqhP0eEezS3dWlNUMpe
 QzxmHSgv3C8dgDbBuO+Bs3wZxidTKmP/r3l8Eky/3era6FpFBPjZArdLqcJJWLw0sNIfnmYf5xA
 =
X-Received: by 2002:a05:620a:294f:b0:7c7:9813:4ad9 with SMTP id
 af79cd13be357-7c7af12ecabmr1855493585a.58.1744616932372; 
 Mon, 14 Apr 2025 00:48:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuwZiuGPOp2ywagbb8DlbtGjDVWS3p1pK1YfIAR7tk7an46KHKZ21m6K4NMeRUXXe8ijK9Q==
X-Received: by 2002:a05:620a:294f:b0:7c7:9813:4ad9 with SMTP id
 af79cd13be357-7c7af12ecabmr1855491385a.58.1744616931836; 
 Mon, 14 Apr 2025 00:48:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d238d5dsm1019115e87.93.2025.04.14.00.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 00:48:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:48:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepika Singh <quic_dsi@quicinc.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <pczibldk4nzu2zvyca4ub4kxiyvismuy46a4rcxkqwy7ncaf4d@ktm2vpaejdmg>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcbde6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Hs2GHKzTOm3QEpZ-OeEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6IEu9Gwk-YoyJhVMRF6TMKGxNY9wZyrN
X-Proofpoint-ORIG-GUID: 6IEu9Gwk-YoyJhVMRF6TMKGxNY9wZyrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140055
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

On Mon, Apr 14, 2025 at 12:41:47PM +0530, Deepika Singh wrote:
> 
> 
> On 4/11/2025 1:55 PM, Ekansh Gupta wrote:
> > 
> > 
> > On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
> > > On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> > > > 
> > > > 
> > > > On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> > > > > > On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> > > > > > > > On 11/18/2024 7:32 PM, Greg KH wrote:
> > > > > > > > > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> > > > > > > > > > Add changes to support debugfs. The fastrpc directory will be
> > > > > > > > > > created which will carry debugfs files for all fastrpc processes.
> > > > > > > > > > The information of fastrpc user and channel contexts are getting
> > > > > > > > > > captured as part of this change.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > > > > ---
> > > > > > > > > >   drivers/misc/fastrpc/Makefile        |   3 +-
> > > > > > > > > >   drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> > > > > > > > > >   drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> > > > > > > > > >   drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> > > > > > > > > >   4 files changed, 205 insertions(+), 3 deletions(-)
> > > > > > > > > >   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > >   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > index 020d30789a80..4ff6b64166ae 100644
> > > > > > > > > > --- a/drivers/misc/fastrpc/Makefile
> > > > > > > > > > +++ b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > @@ -1,3 +1,4 @@
> > > > > > > > > >   # SPDX-License-Identifier: GPL-2.0
> > > > > > > > > >   obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> > > > > > > > > > -fastrpc-objs    := fastrpc_main.o
> > > > > > > > > > \ No newline at end of file
> > > > > > > > > > +fastrpc-objs    := fastrpc_main.o \
> > > > > > > > > > +                fastrpc_debug.o
> > > > > > > > > Only build this file if debugfs is enabled.
> > > > > > > > > 
> > > > > > > > > And again, "debug.c"?
> > > > > > > > I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> > > > > > > > few more debug specific changes, maybe then I'll need to change the build rules again.
> > > > > > > > > > diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..cdb4fc6845a8
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > @@ -0,0 +1,156 @@
> > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > +// Copyright (c) 2024 Qualcomm Innovation Center.
> > > > > > > > > > +
> > > > > > > > > > +#include <linux/debugfs.h>
> > > > > > > > > > +#include <linux/seq_file.h>
> > > > > > > > > > +#include "fastrpc_shared.h"
> > > > > > > > > > +#include "fastrpc_debug.h"
> > > > > > > > > > +
> > > > > > > > > > +#ifdef CONFIG_DEBUG_FS
> > > > > > > > > Please put the #ifdef in the .h file, not in the .c file.
> > > > > > > > Ack
> > > > > > > > > > +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> > > > > > > > > > +{
> > > > > > > > > > +        char cur_comm[TASK_COMM_LEN];
> > > > > > > > > > +        int domain_id, size;
> > > > > > > > > > +        char *debugfs_buf;
> > > > > > > > > > +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> > > > > > > > > > +
> > > > > > > > > > +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> > > > > > > > > > +        cur_comm[TASK_COMM_LEN-1] = '\0';
> > > > > > > > > > +        if (debugfs_dir != NULL) {
> > > > > > > > > > +                domain_id = fl->cctx->domain_id;
> > > > > > > > > > +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> > > > > > > > > > +                                current->pid, fl->tgid, domain_id) + 1;
> > > > > > > > > > +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> > > > > > > > > > +                if (debugfs_buf == NULL)
> > > > > > > > > > +                        return;
> > > > > > > > > > +                /*
> > > > > > > > > > +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> > > > > > > > > > +                 * domain_id in debugfs filename to create unique file name
> > > > > > > > > > +                 */
> > > > > > > > > > +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> > > > > > > > > > +                        cur_comm, current->pid, fl->tgid, domain_id);
> > > > > > > > > > +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> > > > > > > > > > +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> > > > > > > > > Why are you saving the debugfs file?  What do you need to do with it
> > > > > > > > > that you can't just delete the whole directory, or look up the name
> > > > > > > > > again in the future when removing it?
> > > > > > > > fl structure is specific to a process using fastrpc driver. The reason to save
> > > > > > > > this debugfs file is to delete is when the process releases fastrpc device.
> > > > > > > > If the file is not deleted, it might flood multiple files in debugfs directory.
> > > > > > > > 
> > > > > > > > As part of this change, only the file that is getting created by a process is
> > > > > > > > getting removed when process is releasing device and I don't think we
> > > > > > > > can clean up the whole directory at this point.
> > > > > > > My 2c: it might be better to create a single file that conains
> > > > > > > information for all the processes instead of that. Or use fdinfo data to
> > > > > > > export process / FD information to userspace.
> > > > > > Thanks for your review. The reason of not having single file for all processes is that
> > > > > > I can run 100s of iteration for any process(say calculator) and every time the properties
> > > > > > of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> > > > > > deleting the debugfs files for every process run.
> > > > > > 
> > > > > > Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> > > > > > the information(like in debugfs) here.
> > > > > Which information is actually useful / interesting for application
> > > > > developers? If not for the fdinfo, I might still vote for a single file
> > > > > rather than a pile of per-process data.
> Let’s say I am trying to do debugfs read when 10+ or more sessions are
> active per channel, then for pushing data of nth process in a single file, I
> would have to wait for n-1 processes, by that time process data might get
> changed. How do you suggest handling this?

I'm yet to see the response to my question, what kind of information are
you outputting? What is actually relevant? Could you please provide an
example from the running system, so that we don't have to guess?

> > > > I have tried to capture all the information that could be useful.
> > > > 
> > > > I can try changes to maintain single file for all active processes. Having this file specific
> > > > to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> > > > carry information of all processes using that remoteproc.
> > > I think it's a better idea, yes.
> > 
> > Hi all,
> > 
> > I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
> > on this patch series.
> > 
> > //Ekansh
> > 
> > > > --ekansh
> > > > > > --ekansh
> > > 
> > 
> 

-- 
With best wishes
Dmitry
