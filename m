Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C8A089D9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1973910F00B;
	Fri, 10 Jan 2025 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="3YK8ds2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A7F10EEC3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 15:45:36 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-721d213e2aeso270500a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736437536; x=1737042336;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
 b=3YK8ds2H9Nd+Y+98VlUVvTplicy5vrI0vhUEfHZZkjlL8BCUO5rWp57akp5jAohdmr
 M56uC9FuI7IxMdez94uzVaTyDMy2BthmHXRNiQ36JN/PBZ9oJYV6bz8qXTdDQBMUF70y
 zvkYQ4i1JrN+C1Gc4dRqEk2Wvt+ezshU1qN0Lw7Lv6XYhhymkHquPVZRcTXaMFewK9Wh
 NwLt/pnksnYFEXuRcMoP6q+qAGzMM516UfGVzGvmUFff6FOjnteBtU9e0YZpiPGUCjXS
 jajwG1swVZWBjZdn9knxY+kScl5haz5S0v73tx5oiXDXPKToovzB0+bjTwEhBt21J47Q
 k7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736437536; x=1737042336;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
 b=aLv7RMsVkyEkMlv6r9S6E7QNuXC3Fy5sjJX9dtvFNiYf2dUlFAOKBtWbKQFONbsuZZ
 /p1WeoseRaO7OSdHRtxxEFC0ni781ELZ6cVOj9Mpu4EI52PqELbTLlpgml0gjUrJP6BF
 +jOt9aAa7tuwfK9weO4/M/9z5hME5tzwqwmkt9Ps5flyNW8Z/6d8VPvblROjdWCAe13G
 zRCY5Hl/BnG+IE6Hq33UaveMot5alwDXxrU2CMcofgSpxe8WpcVpfJAoXJWcPHnGOSM3
 prKZYBG0s/USEobvmwp9RJlF9+RBBRvMQ/mmFC5k43AxVgdboj+ML8Hdc7ZJYgCwx+8h
 bQMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBpO+5wSwAPNzFHtUY6fphjG1EampZO0Fh67jUBJayZ+EChfg6Zi/eaNVE4CajthLqtmMXGdWOb+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHpGZ/cR9hpbZ8fg5nRwCgm8cif0ArwIMzrS1sJOJb5A8dUyFF
 1aRzxJ4PWUZNiYCz2bA4XjzzgCDm6tuZ4+tEqOwL7X1YJabP1lBKHIAiqz3z1Us=
X-Gm-Gg: ASbGnctTd317XIjwKrIDX3NpZlElpD06nRy/jZd6k1AA40/OqIt5WW99pcPW/2j5D1g
 sfZL7P8+0fgf9/j4PVQ4BKhEdqkExrsfYxBGarInTT9w95Obu28iL41G81NA813I/3OWl9YynPJ
 Ch+fJnJNc+oyU+0bERn+9l3EIpI2/hvNmABbiw62V08+mPM3VKJEERhfopeIQjGIWrFsgz1N4vf
 mYSPqYJKnNhLcCIK6P17LBHpBwY+aOESgkZCjUJ09rE2NphG0iFpUXkRwQU
X-Google-Smtp-Source: AGHT+IHELUnxP9ZvL+e2Ztemz39I9ORoPYZLTVwEa+XG73J5uz7w7yM0cuXu9KZqTaUsGk+1/+jmGA==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id
 46e09a7af769-721e2e000d6mr4949630a34.2.1736437534534; 
 Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9076:47eb:1e0a:16fb])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f882625f0esm386258eaf.9.2025.01.09.07.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 09:45:27 -0600
From: Corey Minyard <corey@minyard.net>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <Z3_vF3I453flXoZv@mail.minyard.net>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-Mailman-Approved-At: Fri, 10 Jan 2025 08:22:58 +0000
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
Reply-To: corey@minyard.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
...
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 941d2dcc8c9d..de84f59468a9 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -650,7 +650,7 @@ static struct ipmi_smi_watcher smi_watcher = {
>  #ifdef CONFIG_PROC_FS
>  #include <linux/sysctl.h>
>  
> -static struct ctl_table ipmi_table[] = {
> +static const struct ctl_table ipmi_table[] = {
>  	{ .procname	= "poweroff_powercycle",
>  	  .data		= &poweroff_powercycle,
>  	  .maxlen	= sizeof(poweroff_powercycle),

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>

