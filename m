Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174B9E026F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D968910E255;
	Mon,  2 Dec 2024 12:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sn8rdpTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A09B10E255
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 12:48:15 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso49472041fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 04:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733143694; x=1733748494; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fie7JF114hIAOnlVTghL7ISjHHMtgNMPufk2CdTyvzg=;
 b=sn8rdpTviD/P1YbRU90H1LMuvrOoDRhWSrBk+et/wzdmkS8/iVx7udlEhKvkgkVCfM
 wnG/ziAc/3i/HOG2E6mwhbJ0p/bhlzObeVqhoPt+eReqGcQAMlMjDvaZyFFh0tkiukob
 myUPOVIhov0zmtJNbNApaMrlE7o5r5Jnl8GMwUTxuqYIWPpqmFWd8ILtMekpBRCDOq6U
 YXxcasAQvLlo3VwtenPi3nNwdk4ln8tZ+EGInI9TnE/EwwSSLCOpVLxzpDvvD8V36BYn
 Z8mtd4aGNCVVrr8vdaHyb7EHVth9Eq+aRdDaKIKXxf85mOcmHobeys/iFrirNGjjQPDJ
 2FRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733143694; x=1733748494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fie7JF114hIAOnlVTghL7ISjHHMtgNMPufk2CdTyvzg=;
 b=XNgA5NQyQ9ICyv0USHON+C/zLoE3gL6VOR4ZvN8G5sTiIBB1N0CFiTQ2e0BkuLdIAa
 gdpsdNlqfMZA1pdJjWlqaEO7nj+Soz7/TXzgs+kOcLAbWmU1x/lobt3J+q13UABGYYGH
 IGSCTJSJQVtVUNzOYYfSdw3nlhiec7LoD4kduP7VjO1K93WgOLeDom6rJcr8ovZUFyR7
 XCgfZ7ezFUJ/nOF4tONliVwVsRffAYDidWQU561gKKu9Oa/YAlGcMccYLFlSYQ25OaZy
 VeibaEs/sLpjAI5HEt6uNUGcJYzkzp42ooMaqNgsGDI5SIAgQLhOOCBK2ihEIj0neSWa
 +mmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzsiWIvB0d5ip+qVKxC3mRVqSBLBAwpwg19gmXI7MJZpt5QLPcK/AtLu6nwKE0xYR8lfoMMgjNmTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuD7YYfebNXYAlxqPc92AVHnJtdzUFtDyNabLt7WSShE6vmIeN
 rdPpBBFokvo2eYiDp6Cel8grg2gO0liFq04Efy3LViJ3gwm741DnUSg6rCDf/5Y=
X-Gm-Gg: ASbGncvvxIxZjYwEM9iIqSRw68anxskQkHBuqHJCWQL4Y0Mb3Oc6OWQghl4uMcXVhuH
 BX+enSVyVAcXN7FIdNXFckl7kiI4t9VY9V45n/6hlBXZxl2nvjf6Jun0xk4thN7pqT4viQHAgC3
 OOuQidFayMGpuVWpOEsbJpY8gGQkm9mxbYU/fY4Z9PUgCRnYGEI/ylKev+akIa7FaBx3v8poZ6t
 zdryk3pKie6ZQNuVwbvAs2f9fc8PG1oygWsp5ocll2C8qNxcft/euZw1W1kPQEFkEBQZN2ahgMO
 JrzDPM/ML1iXN+4DpNQW2+1+J47+zg==
X-Google-Smtp-Source: AGHT+IFwjlsNqlDKOJ2KJydHznaSKvB/vcfjJMFz80/Xir4D/PJioG03rVbSHX2IxiqPAUjyxM00qw==
X-Received: by 2002:a2e:a54b:0:b0:2fb:8777:7359 with SMTP id
 38308e7fff4ca-2ffd611bf55mr113551871fa.39.1733143693651; 
 Mon, 02 Dec 2024 04:48:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfbeb95bsm12841481fa.36.2024.12.02.04.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 04:48:12 -0800 (PST)
Date: Mon, 2 Dec 2024 14:48:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
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

On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> 
> 
> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> >>
> >> On 11/18/2024 7:32 PM, Greg KH wrote:
> >>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >>>> Add changes to support debugfs. The fastrpc directory will be
> >>>> created which will carry debugfs files for all fastrpc processes.
> >>>> The information of fastrpc user and channel contexts are getting
> >>>> captured as part of this change.
> >>>>
> >>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc/Makefile        |   3 +-
> >>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> >>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> >>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> >>>>  4 files changed, 205 insertions(+), 3 deletions(-)
> >>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> >>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> >>>> index 020d30789a80..4ff6b64166ae 100644
> >>>> --- a/drivers/misc/fastrpc/Makefile
> >>>> +++ b/drivers/misc/fastrpc/Makefile
> >>>> @@ -1,3 +1,4 @@
> >>>>  # SPDX-License-Identifier: GPL-2.0
> >>>>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> >>>> -fastrpc-objs	:= fastrpc_main.o
> >>>> \ No newline at end of file
> >>>> +fastrpc-objs	:= fastrpc_main.o \
> >>>> +		fastrpc_debug.o
> >>> Only build this file if debugfs is enabled.
> >>>
> >>> And again, "debug.c"?
> >> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> >> few more debug specific changes, maybe then I'll need to change the build rules again.
> >>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>> new file mode 100644
> >>>> index 000000000000..cdb4fc6845a8
> >>>> --- /dev/null
> >>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>> @@ -0,0 +1,156 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0
> >>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
> >>>> +
> >>>> +#include <linux/debugfs.h>
> >>>> +#include <linux/seq_file.h>
> >>>> +#include "fastrpc_shared.h"
> >>>> +#include "fastrpc_debug.h"
> >>>> +
> >>>> +#ifdef CONFIG_DEBUG_FS
> >>> Please put the #ifdef in the .h file, not in the .c file.
> >> Ack
> >>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> >>>> +{
> >>>> +	char cur_comm[TASK_COMM_LEN];
> >>>> +	int domain_id, size;
> >>>> +	char *debugfs_buf;
> >>>> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> >>>> +
> >>>> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> >>>> +	cur_comm[TASK_COMM_LEN-1] = '\0';
> >>>> +	if (debugfs_dir != NULL) {
> >>>> +		domain_id = fl->cctx->domain_id;
> >>>> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> >>>> +				current->pid, fl->tgid, domain_id) + 1;
> >>>> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
> >>>> +		if (debugfs_buf == NULL)
> >>>> +			return;
> >>>> +		/*
> >>>> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >>>> +		 * domain_id in debugfs filename to create unique file name
> >>>> +		 */
> >>>> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >>>> +			cur_comm, current->pid, fl->tgid, domain_id);
> >>>> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >>>> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
> >>> Why are you saving the debugfs file?  What do you need to do with it
> >>> that you can't just delete the whole directory, or look up the name
> >>> again in the future when removing it?
> >> fl structure is specific to a process using fastrpc driver. The reason to save
> >> this debugfs file is to delete is when the process releases fastrpc device.
> >> If the file is not deleted, it might flood multiple files in debugfs directory.
> >>
> >> As part of this change, only the file that is getting created by a process is
> >> getting removed when process is releasing device and I don't think we
> >> can clean up the whole directory at this point.
> > My 2c: it might be better to create a single file that conains
> > information for all the processes instead of that. Or use fdinfo data to
> > export process / FD information to userspace.
> Thanks for your review. The reason of not having single file for all processes is that
> I can run 100s of iteration for any process(say calculator) and every time the properties
> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> deleting the debugfs files for every process run.
> 
> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> the information(like in debugfs) here.

Which information is actually useful / interesting for application
developers? If not for the fdinfo, I might still vote for a single file
rather than a pile of per-process data.

> 
> --ekansh
> >
> >
> 

-- 
With best wishes
Dmitry
