Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A919E1B77
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 12:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA18610E332;
	Tue,  3 Dec 2024 11:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CSvxE01g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D144B10E332
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 11:57:50 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e3984b1db09so3933663276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 03:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733227070; x=1733831870; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BbMpTWPQcQsU0HRaX/c6zM2bDkZbOjiVConTuGe+jZE=;
 b=CSvxE01gdbDsUSUuyEafB4MvH85wuVRIk5s/Gaw+zoCTbOW+1Zea0EJ340ilAtuD5J
 EwW3PzxjesC1FZSTlQ28R5WyvAq31N1ngmHi/nKAiGm9h7kV1YhVfGRmUAJKfvin38Hu
 S2kUQRNRyX+QZcNNizotmIHRjZxxwXvhosIYOMBRMxa7195Oz4K30E7wcb22edDl8pp0
 a5I1iv49FHIwpHX6oh+3dwrWHlC9cZoU2ZQ5r9iTKsXGSeApG/BZxKVR4qUNnn7j8Hzw
 B/r+iuhu1pFySPgfxhnKgQpRZklmoYaLF5lth1u8X+k4firDv1fjCeUYPzGUKR6pA8oR
 fj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733227070; x=1733831870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BbMpTWPQcQsU0HRaX/c6zM2bDkZbOjiVConTuGe+jZE=;
 b=XBD5VgO1dWnEuaEllU/WUdXGvmuKkLCF5hK7Cw0WNtj0QcQezMf8BKSp7gUqvVADsT
 SiBSJbpRWROt91OJmiKSIGduVdJxD0dAbUgMURymIBEJ96GN3D7QJj1kCJAPyrGfj2do
 LRLcGQMOS5RAn62CZCSXlcO5KGM0e9qQUJW8VKVj0v+J9RrhhpLTSglkQhfYiu1Kpb/R
 tNiS6YO5eG5wlbmz8Db1U3isXlGdWRizE0NUvSmcclwcrw/eMesqMmDUar1XncqMqPnP
 DEm4+DJcJI97pGB0Go0Z0ALbLQs9jkh01Oq3AZ1eZgpBHGoVQJgFOjvlpADkyOUfaH+b
 svhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoILiPgLfI54plT6dDufyzcuizq3aLFxp6dnUNbnAwqDa8/5Cz5qTeVNER9YusBK0A07GCERKNoj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgo1WQrALRYk/XAf3CdGcYkiaF+FWI9yCNmzgj7MI+xkdAIVHI
 kAHezVUfGJy+dgUfzIjpPbhJ/WkNQt0ouZWFCTM9j9K831Sw1XiB8b5HTERMOZTBMZkA9TSZxhq
 Af6Y22PuZmhgUvsMoAIvLDsdsIOLC0Z0TCFr1Pg==
X-Gm-Gg: ASbGncuFvwAcXGzbLFtlIjBNrC8rQKhQ4pgxsQjro0KCuEu+LNnifY9HAYWnhEd6f48
 hdRTKYar+e7eYew5GAaOfxvoiwsEXZw==
X-Google-Smtp-Source: AGHT+IGQ/9s5DEKVq56LcELRCgbbSUJDxrGME9rneM000XHdp2t+8py1fz0BjAa9e/C+4ixWTgkXDY5JwOAFrvAaJEA=
X-Received: by 2002:a05:6902:20c9:b0:e39:93ab:dbab with SMTP id
 3f1490d57ef6-e39d3e39f09mr2319862276.28.1733227069673; Tue, 03 Dec 2024
 03:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
In-Reply-To: <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 13:57:41 +0200
Message-ID: <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> >>
> >> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> >>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> >>>> On 11/18/2024 7:32 PM, Greg KH wrote:
> >>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >>>>>> Add changes to support debugfs. The fastrpc directory will be
> >>>>>> created which will carry debugfs files for all fastrpc processes.
> >>>>>> The information of fastrpc user and channel contexts are getting
> >>>>>> captured as part of this change.
> >>>>>>
> >>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/misc/fastrpc/Makefile        |   3 +-
> >>>>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> >>>>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> >>>>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> >>>>>>  4 files changed, 205 insertions(+), 3 deletions(-)
> >>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> >>>>>>
> >>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> >>>>>> index 020d30789a80..4ff6b64166ae 100644
> >>>>>> --- a/drivers/misc/fastrpc/Makefile
> >>>>>> +++ b/drivers/misc/fastrpc/Makefile
> >>>>>> @@ -1,3 +1,4 @@
> >>>>>>  # SPDX-License-Identifier: GPL-2.0
> >>>>>>  obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> >>>>>> -fastrpc-objs    := fastrpc_main.o
> >>>>>> \ No newline at end of file
> >>>>>> +fastrpc-objs    := fastrpc_main.o \
> >>>>>> +                fastrpc_debug.o
> >>>>> Only build this file if debugfs is enabled.
> >>>>>
> >>>>> And again, "debug.c"?
> >>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> >>>> few more debug specific changes, maybe then I'll need to change the build rules again.
> >>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..cdb4fc6845a8
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> >>>>>> @@ -0,0 +1,156 @@
> >>>>>> +// SPDX-License-Identifier: GPL-2.0
> >>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
> >>>>>> +
> >>>>>> +#include <linux/debugfs.h>
> >>>>>> +#include <linux/seq_file.h>
> >>>>>> +#include "fastrpc_shared.h"
> >>>>>> +#include "fastrpc_debug.h"
> >>>>>> +
> >>>>>> +#ifdef CONFIG_DEBUG_FS
> >>>>> Please put the #ifdef in the .h file, not in the .c file.
> >>>> Ack
> >>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> >>>>>> +{
> >>>>>> +        char cur_comm[TASK_COMM_LEN];
> >>>>>> +        int domain_id, size;
> >>>>>> +        char *debugfs_buf;
> >>>>>> +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> >>>>>> +
> >>>>>> +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> >>>>>> +        cur_comm[TASK_COMM_LEN-1] = '\0';
> >>>>>> +        if (debugfs_dir != NULL) {
> >>>>>> +                domain_id = fl->cctx->domain_id;
> >>>>>> +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> >>>>>> +                                current->pid, fl->tgid, domain_id) + 1;
> >>>>>> +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> >>>>>> +                if (debugfs_buf == NULL)
> >>>>>> +                        return;
> >>>>>> +                /*
> >>>>>> +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >>>>>> +                 * domain_id in debugfs filename to create unique file name
> >>>>>> +                 */
> >>>>>> +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >>>>>> +                        cur_comm, current->pid, fl->tgid, domain_id);
> >>>>>> +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >>>>>> +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> >>>>> Why are you saving the debugfs file?  What do you need to do with it
> >>>>> that you can't just delete the whole directory, or look up the name
> >>>>> again in the future when removing it?
> >>>> fl structure is specific to a process using fastrpc driver. The reason to save
> >>>> this debugfs file is to delete is when the process releases fastrpc device.
> >>>> If the file is not deleted, it might flood multiple files in debugfs directory.
> >>>>
> >>>> As part of this change, only the file that is getting created by a process is
> >>>> getting removed when process is releasing device and I don't think we
> >>>> can clean up the whole directory at this point.
> >>> My 2c: it might be better to create a single file that conains
> >>> information for all the processes instead of that. Or use fdinfo data to
> >>> export process / FD information to userspace.
> >> Thanks for your review. The reason of not having single file for all processes is that
> >> I can run 100s of iteration for any process(say calculator) and every time the properties
> >> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> >> deleting the debugfs files for every process run.
> >>
> >> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> >> the information(like in debugfs) here.
> > Which information is actually useful / interesting for application
> > developers? If not for the fdinfo, I might still vote for a single file
> > rather than a pile of per-process data.
> I have tried to capture all the information that could be useful.
>
> I can try changes to maintain single file for all active processes. Having this file specific
> to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> carry information of all processes using that remoteproc.

I think it's a better idea, yes.

>
> --ekansh
> >
> >> --ekansh
> >>>
>


-- 
With best wishes
Dmitry
