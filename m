Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA2917A53
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CECE10E14B;
	Wed, 26 Jun 2024 08:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="UdHbLUbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895C810E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:00:48 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so39324351fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1719388846; x=1719993646; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=whiJiQULxxjVU5JYMGY4dR9TuAgnrWcS7amyjh3Lhhk=;
 b=UdHbLUbJ5ktcTyry3OD/9QI8vpEF5QrH7tbAQgFTkygHvK3k5TUALvApreNdfMNzEn
 XLbQHD16a/IoLrzsruadN1X0aopJ2TzQY38LaGI9IvZuPYbuWTOYvsgD5mBaettvi3QD
 Nf+iPtDBs+HHUxp+brEumtszenJpf76PlatJkJP3UdaTCtju5Y4ITYa1+sYTshieAOHB
 HQxMnDHzLHQMAYt1n/RdWEcnwqKV//Vg4Qpw0f8pvfsQFsHj/Y7t/Xv6E/9StMcH8G/w
 m0budqiFJRKMWC4sCKeriHc7aOHtP2BH1rpoI3tyUKEmHBBm0a09YScHu7FfaQXtSds6
 FNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719388846; x=1719993646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whiJiQULxxjVU5JYMGY4dR9TuAgnrWcS7amyjh3Lhhk=;
 b=Nm1q1S+3T5Itu5zKgu9J9uEjfiT4a+pYSFpd8AUJpqeHDeuFbq86YuAIzr2abt9cAk
 UaYUh3crkNAczLYZwyPjbzKPxd3sHVoeceXha3UZnCwZXiB9CHvc7smAVPSHvXFS0QJp
 jlMrs4X56HPCvq8IPECwTcXd6+k1mqQnozuS5mGiSG15qZ0eo8kk32R4IoBTJjbSjWil
 3XA80pJCfO4ipC0uTGYtPcL33CHHdoNgXjykang6CPSJr6dR2MdN3zBnMwSsqj6ApxZq
 NGkNiPRbuxM4Qvq7SIU7fdpCyVLXy5H2yEEigETUN+eSzDy7FsbAfEeu9oVxPIhXd8kP
 qIRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsCA/9XWXtXZbtcIsNVGHEteFJAupXGKdiwl9lKbqgqiCpXloSt6/ON+i5ZQYzmYKdQXpbwCk+Zvge4C6TuO8xV5xh35SgsOFG+sH9dN8p
X-Gm-Message-State: AOJu0YyeScksRfYPbupTmQHb6GYrqFtbOa30unk3gXLQRdAxEcVTgHsA
 5PgJFvddRT1pd6Xphorp+G1DcaOxBzOCEBdmA4ArPuPDghsV7vmRhkv62IsO4nw=
X-Google-Smtp-Source: AGHT+IFNePKBHG9JpceEuNMrhp5ms+q4nwziDYVudYAAE2EIYWBHCuZo7vzBBRTi5aESxDL6rd8szA==
X-Received: by 2002:a2e:3a13:0:b0:2ec:5019:bec3 with SMTP id
 38308e7fff4ca-2ec593e0cd9mr61741411fa.21.1719388846249; 
 Wed, 26 Jun 2024 01:00:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70676a2113csm6032019b3a.214.2024.06.26.01.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 01:00:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 10:00:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
Message-ID: <ZnvKcnC9ruaIHYij@pathway.suse.cz>
References: <20240625123954.211184-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625123954.211184-1-jfalempe@redhat.com>
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

On Tue 2024-06-25 14:39:29, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new parameter "const char *desc" to the kmsg_dumper
> dump() callback, and update all drivers that are using it.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  arch/powerpc/kernel/nvram_64.c             |  3 ++-
>  arch/powerpc/platforms/powernv/opal-kmsg.c |  3 ++-
>  drivers/gpu/drm/drm_panic.c                |  3 ++-
>  drivers/hv/hv_common.c                     |  3 ++-
>  drivers/mtd/mtdoops.c                      |  3 ++-
>  fs/pstore/platform.c                       |  3 ++-
>  include/linux/kmsg_dump.h                  | 13 ++++++++++---
>  kernel/panic.c                             |  2 +-
>  kernel/printk/printk.c                     |  8 +++++---
>  9 files changed, 28 insertions(+), 13 deletions(-)

The parameter is added into all dumpers. I guess that it would be
used only drm_panic() because it is graphics and might be "fancy".
The others simply dump the log buffer and the reason is in
the dumped log as well.

Anyway, the passed buffer is static. Alternative solution would
be to make it global and export it like, for example, panic_cpu.

Best Regards,
Petr
