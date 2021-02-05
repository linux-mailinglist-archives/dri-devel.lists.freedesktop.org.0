Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050B31100B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 19:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8920A6E342;
	Fri,  5 Feb 2021 18:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C432F6E342
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 18:37:11 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id u15so4036092plf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OFwHGZmM8wqHN2mLtpKT/FoZS4DuP474ucBXNcxTZVA=;
 b=GLeIyrcnqQ4/LFNG6+Afvlafscx8C1O0gOHaXxsKan7L74NiEwk4WspSkwax8j2c0Z
 GNc/abUAOOIDjyt4g1biPXNH+3wBCCE+I+dRQ02xNGxfiTNDp0/YCmfC6eKmCyqaEDLQ
 7wmxgWATXFhXmHIbm7ZMs0lTj8EbwgrL+rcAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OFwHGZmM8wqHN2mLtpKT/FoZS4DuP474ucBXNcxTZVA=;
 b=cd5KSRPZ37QtcScMhreUWa5BRpvQ1B2bHRg6ENv36oyt6GDzCSBD+7txLWypBIWRxv
 w10NwtqMXq/jc5GNG2Q331wO8H7FK0kqsS8XJKdPBmHDZRq+j6BxRDCLRsD/uLg/waG+
 4Ac2/v/o9/6ln4DACRVwuUcfq+B8D//sjXh/mTBVn/uc/B/LG2Of8V5GvCOmK3+A+DWS
 SZ00b+YV+oIVp8GeFlTej3lC7OLCfYE1CI49lRiQY63hzDZIGlb77U5/ePQw9bcVyvXY
 9axdJTJX7R9Ndgut53FVV/4M91JtpheBSdzr1v9wp6GRxwVJM/yYpbDU354e5n6buhRp
 9kqQ==
X-Gm-Message-State: AOAM533BIW4zZ93o1TmFWg1152Ux0rSIQi+RofARG7KNceqT0FXYc9Ll
 mt8uH/W1+JZ0d218f5bND1B5yw==
X-Google-Smtp-Source: ABdhPJzron7Uw0ANgFuv3nlVXe+SFekWhPglquTB3GJVXUFuMXmBgZp20nzR2OqsYV350RyuicQFTA==
X-Received: by 2002:a17:902:82cb:b029:e1:2b0f:da57 with SMTP id
 u11-20020a17090282cbb02900e12b0fda57mr5302564plz.33.1612550231379; 
 Fri, 05 Feb 2021 10:37:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o1sm10799989pgq.1.2021.02.05.10.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 10:37:10 -0800 (PST)
Date: Fri, 5 Feb 2021 10:37:09 -0800
From: Kees Cook <keescook@chromium.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] kernel: Expose SYS_kcmp by default
Message-ID: <202102051030.1AF01772D@keescook>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205163752.11932-1-chris@chris-wilson.co.uk>
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
Cc: Will Drewry <wad@chromium.org>, jannh@google.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 04:37:52PM +0000, Chris Wilson wrote:
> Userspace has discovered the functionality offered by SYS_kcmp and has
> started to depend upon it. In particular, Mesa uses SYS_kcmp for
> os_same_file_description() in order to identify when two fd (e.g. device
> or dmabuf) point to the same struct file. Since they depend on it for
> core functionality, lift SYS_kcmp out of the non-default
> CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> ---
>  init/Kconfig                                  | 11 +++++++++++
>  kernel/Makefile                               |  2 +-
>  tools/testing/selftests/seccomp/seccomp_bpf.c |  2 +-
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index b77c60f8b963..f62fca13ac5b 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1194,6 +1194,7 @@ endif # NAMESPACES
>  config CHECKPOINT_RESTORE
>  	bool "Checkpoint/restore support"
>  	select PROC_CHILDREN
> +	select KCMP
>  	default n
>  	help
>  	  Enables additional kernel features in a sake of checkpoint/restore.
> @@ -1737,6 +1738,16 @@ config ARCH_HAS_MEMBARRIER_CALLBACKS
>  config ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	bool
>  
> +config KCMP
> +	bool "Enable kcmp() system call" if EXPERT
> +	default y

I would expect this to be not default-y, especially if
CHECKPOINT_RESTORE does a "select" on it.

This is a really powerful syscall, but it is bounded by ptrace access
controls, and uses pointer address obfuscation, so it may be okay to
expose this. As it is, at least Ubuntu already has
CONFIG_CHECKPOINT_RESTORE, so really, there's probably not much
difference on exposure.

So, if you drop the "default y", I'm fine with this.

-Kees

> +	help
> +	  Enable the file descriptor comparison system call. It provides
> +	  user-space with the ability to compare two fd to see if they
> +	  point to the same file, and check other attributes.
> +
> +	  If unsure, say Y.
> +
>  config RSEQ
>  	bool "Enable rseq() system call" if EXPERT
>  	default y
> diff --git a/kernel/Makefile b/kernel/Makefile
> index aa7368c7eabf..320f1f3941b7 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -51,7 +51,7 @@ obj-y += livepatch/
>  obj-y += dma/
>  obj-y += entry/
>  
> -obj-$(CONFIG_CHECKPOINT_RESTORE) += kcmp.o
> +obj-$(CONFIG_KCMP) += kcmp.o
>  obj-$(CONFIG_FREEZER) += freezer.o
>  obj-$(CONFIG_PROFILING) += profile.o
>  obj-$(CONFIG_STACKTRACE) += stacktrace.o
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 26c72f2b61b1..1b6c7d33c4ff 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -315,7 +315,7 @@ TEST(kcmp)
>  	ret = __filecmp(getpid(), getpid(), 1, 1);
>  	EXPECT_EQ(ret, 0);
>  	if (ret != 0 && errno == ENOSYS)
> -		SKIP(return, "Kernel does not support kcmp() (missing CONFIG_CHECKPOINT_RESTORE?)");
> +		SKIP(return, "Kernel does not support kcmp() (missing CONFIG_KCMP?)");
>  }
>  
>  TEST(mode_strict_support)
> -- 
> 2.20.1
> 

-- 
Kees Cook
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
