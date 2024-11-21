Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7849D52D7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF56010EA2C;
	Thu, 21 Nov 2024 18:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OqEUqkE9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E294710EA2C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:53:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53da4fd084dso2451736e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732215208; x=1732820008; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3zCRGuGZv2890xlpdNfg21Swlbdi3hgEZQI8IQp1Kpk=;
 b=OqEUqkE9wqlFEF2zUXRsuMfmtYuQmURRu++znhdYcjfiLd09xsHzi7wEJoy6mah7+1
 HZj0TXaFjons6iMXkalq/q9gNMb2zBdIGMc7/ZWFZYhqWKPwGz4muA3fQZaiLGOBJ1/E
 aoDI7xdaSMhAXhf2t/VAkgB0T2P5lgTSi96S9m0RbKkAZ6tnKxDJ3Q7tsSD5aZ0e+eyA
 Vq+8a6YTisvHdB2Rbks5Zq1NXPaxRiYOn9a8M/UuDvOXcBO67deoQCpQR7nHKOXds2cU
 abGn6BJ8D+19xMoQHpT/h8NBkRVshivYbBy/bh+UzijoBywpPo3JJ9qjcgKFEjL+c88w
 B9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732215208; x=1732820008;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3zCRGuGZv2890xlpdNfg21Swlbdi3hgEZQI8IQp1Kpk=;
 b=MqmO47Xv6C3vrLF/S2i0Pb2MNkVnHadd/Uv3ixtLWukWeS9bYc29YpskFpHFYsUYoX
 yWgUPWoZUF/vqEym9TgNoYZK+vlcqVBNKw9x/k5lyIcWuPbceAO1sA/j2MLPgNMtMq88
 IaPon6c2gcQtWUYkpAEVlsVPRaN7IkW1aXTdu/c/PIT7O5Ogvq/+znC1hhwsSHTzTzNW
 kQ8JeptxUUFqapeT/A7kL+Wt5zHFTORqEfn8eoGnO78OlzND7z0UQSQiK/bpbMHiAI8x
 OAepCusPjzmCVS8S1wcK4Ia5us8hB0oehBKhXgKNwH9diFXcWHz6VUZq2uTCaOU/YrMW
 jicA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmPW+77IFXZnNw+Ma4w3cN0b0Fzv5omWWNtoIWcHWAnos5cOS75ymqCmuNMFovJLqadpMq2v/g+l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV78dObOA+DXo6SZpEDzPv00XwG/oyBxs3cLlIa8OdDMwuJ8j/
 2+nf9M8lEr8hPsn5siKH/j3gawZt7cVVV5V7DCD90G117Kq+KkZik+jUOtQxGas=
X-Gm-Gg: ASbGncuu/+WRPDB0JNCCMGwPm61qQcFGoVHGsmkYHXAtLqyfOJPH5vP35bqVhM9C9w/
 H2TMP57KpLPxhS1SWfomjE47sKuiguOE3U0lpurcIKBlZ4kUYnImA3zhDToHenzFYZI2K6S7WPX
 ULw09/+4xO21E8XstnhzBTXKKU9G01ypyNqL06a4EnTCdTBnkDvHRZry/0XqyqfQ94v4J16k3Sk
 u3KvS+xq6zMc2tkDtJ6ee6IA18iGqjfqic055dO89cti7JjmE2ywyXDq9VGR4X6hZQ0Y2DGG/m4
 14ho6kUGWTPOQ0/qfg461LmMZvHEpQ==
X-Google-Smtp-Source: AGHT+IEUh6/Eu8AqzBMD3b9KkeOtieIJEmsmTP9LQnKAK7x7PGeGdXj1GDsp9PgUDFkqb/NEkA6Ypg==
X-Received: by 2002:a05:6512:b23:b0:53d:c6f6:70b7 with SMTP id
 2adb3069b0e04-53dd2acbc2bmr79294e87.13.1732215207879; 
 Thu, 21 Nov 2024 10:53:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd244561dsm49540e87.44.2024.11.21.10.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 10:53:26 -0800 (PST)
Date: Thu, 21 Nov 2024 20:53:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
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

On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> 
> 
> On 11/18/2024 7:32 PM, Greg KH wrote:
> > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> >> Add changes to support debugfs. The fastrpc directory will be
> >> created which will carry debugfs files for all fastrpc processes.
> >> The information of fastrpc user and channel contexts are getting
> >> captured as part of this change.
> >>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc/Makefile        |   3 +-
> >>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> >>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> >>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> >>  4 files changed, 205 insertions(+), 3 deletions(-)
> >>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> >>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> >>
> >> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> >> index 020d30789a80..4ff6b64166ae 100644
> >> --- a/drivers/misc/fastrpc/Makefile
> >> +++ b/drivers/misc/fastrpc/Makefile
> >> @@ -1,3 +1,4 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> >> -fastrpc-objs	:= fastrpc_main.o
> >> \ No newline at end of file
> >> +fastrpc-objs	:= fastrpc_main.o \
> >> +		fastrpc_debug.o
> > Only build this file if debugfs is enabled.
> >
> > And again, "debug.c"?
> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> few more debug specific changes, maybe then I'll need to change the build rules again.
> >
> >> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> >> new file mode 100644
> >> index 000000000000..cdb4fc6845a8
> >> --- /dev/null
> >> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> >> @@ -0,0 +1,156 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +// Copyright (c) 2024 Qualcomm Innovation Center.
> >> +
> >> +#include <linux/debugfs.h>
> >> +#include <linux/seq_file.h>
> >> +#include "fastrpc_shared.h"
> >> +#include "fastrpc_debug.h"
> >> +
> >> +#ifdef CONFIG_DEBUG_FS
> > Please put the #ifdef in the .h file, not in the .c file.
> Ack
> >
> >> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> >> +{
> >> +	char cur_comm[TASK_COMM_LEN];
> >> +	int domain_id, size;
> >> +	char *debugfs_buf;
> >> +	struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> >> +
> >> +	memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> >> +	cur_comm[TASK_COMM_LEN-1] = '\0';
> >> +	if (debugfs_dir != NULL) {
> >> +		domain_id = fl->cctx->domain_id;
> >> +		size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> >> +				current->pid, fl->tgid, domain_id) + 1;
> >> +		debugfs_buf = kzalloc(size, GFP_KERNEL);
> >> +		if (debugfs_buf == NULL)
> >> +			return;
> >> +		/*
> >> +		 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> >> +		 * domain_id in debugfs filename to create unique file name
> >> +		 */
> >> +		snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> >> +			cur_comm, current->pid, fl->tgid, domain_id);
> >> +		fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> >> +				debugfs_dir, fl, &fastrpc_debugfs_fops);
> > Why are you saving the debugfs file?  What do you need to do with it
> > that you can't just delete the whole directory, or look up the name
> > again in the future when removing it?
> fl structure is specific to a process using fastrpc driver. The reason to save
> this debugfs file is to delete is when the process releases fastrpc device.
> If the file is not deleted, it might flood multiple files in debugfs directory.
> 
> As part of this change, only the file that is getting created by a process is
> getting removed when process is releasing device and I don't think we
> can clean up the whole directory at this point.

My 2c: it might be better to create a single file that conains
information for all the processes instead of that. Or use fdinfo data to
export process / FD information to userspace.


-- 
With best wishes
Dmitry
