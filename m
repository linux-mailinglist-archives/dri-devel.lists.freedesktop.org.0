Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DBA311409
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 23:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5665C6F4FA;
	Fri,  5 Feb 2021 22:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF76F4F5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 21:47:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q2so10663989edi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5pnuSpNEKdmcoBjj2QdJNC7CgKySzqePnnhN0iJ74KE=;
 b=CazZD3gaSDfOEUuMFkR/IQY8QFmfUv80CHWEbco/8E0oftbEwwOIJ3fjX/atsGd7wj
 evBDAPwAJv0WyagdvYzl42paXlsjQMsJ/RGozF1eefiPC5SzIh4WIwOVjh4BY5hIiGBz
 N62/fb3kVV42RVbaHipmcM3KLdUFhQxMvqvNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5pnuSpNEKdmcoBjj2QdJNC7CgKySzqePnnhN0iJ74KE=;
 b=UHmo6SKJiW87Rb+tyyB8bXXLpvILvGVPzEaacU8NhOLbyAf7dn8isb4Yzfel9nrLCo
 e5lFEvfUpzrgj22h8vwVWOjNt+7s9ZA2wis1s7U4yI0POw6pp0Aqy7GVPKaiuKeWzuc6
 EzJSLlvR8phrC3hZ5OocRFfW7dGTbfXyJaN6JK7zCZRYLvmkwZQB2LiC57X6xOGEAZoL
 bC1+QBfH1pyuiaKl5/nLx74SU07TOwaS8yudDLaptYdMD5WYIAopK7NFJDlet+zXicZF
 z7f+YtoT0+ACQOznI+0/Cvsl+gMINcCcsuw8c1Ohi7PB25LYU/t8Uavr9uaUrY2NTARs
 Kulw==
X-Gm-Message-State: AOAM532fP2MBVxTeLG+EY/ospmXCniMpaTnC8m6FuTRb464fkJQ0mlRI
 Qtak4otHFpm+YUaERoqVkoIFmQ==
X-Google-Smtp-Source: ABdhPJzF+ubix/uZD3BGg6fAO3117ri17tLNIaKGiQba39MM+mUoaHvFRc/aLbJESW7rmz+oz9Wt1w==
X-Received: by 2002:a05:6402:10ce:: with SMTP id
 p14mr5530673edu.261.1612561672579; 
 Fri, 05 Feb 2021 13:47:52 -0800 (PST)
Received: from [192.168.1.149] (5.186.115.188.cgn.fibianet.dk. [5.186.115.188])
 by smtp.gmail.com with ESMTPSA id y11sm4515813ejd.72.2021.02.05.13.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 13:47:52 -0800 (PST)
Subject: Re: [PATCH v2] kernel: Expose SYS_kcmp by default
To: Chris Wilson <chris@chris-wilson.co.uk>, linux-kernel@vger.kernel.org
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205210610.29837-1-chris@chris-wilson.co.uk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <e929c01a-8659-170c-d95a-b1d0dee628bc@rasmusvillemoes.dk>
Date: Fri, 5 Feb 2021 22:47:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205210610.29837-1-chris@chris-wilson.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Feb 2021 22:00:18 +0000
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Cyrill Gorcunov <gorcunov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2021 22.06, Chris Wilson wrote:
> Userspace has discovered the functionality offered by SYS_kcmp and has
> started to depend upon it. In particular, Mesa uses SYS_kcmp for
> os_same_file_description() in order to identify when two fd (e.g. device
> or dmabuf) point to the same struct file. Since they depend on it for
> core functionality, lift SYS_kcmp out of the non-default
> CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.
> 
> Note that some distributions such as Ubuntu are already enabling
> CHECKPOINT_RESTORE in their configs and so, by extension, SYS_kcmp.
> 

Looks a lot like
https://lore.kernel.org/lkml/20200710075632.14661-1-linux@rasmusvillemoes.dk/.
So FWIW, ack from me.

cc += Cyrill.

> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3046
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: Will Drewry <wad@chromium.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> # DRM depends on SYS_kcmp
> 
> ---
> v2:
>   - Default n.
>   - Borrrow help message from man kcmp.
>   - Export get_epoll_tfile_raw_ptr() for CONFIG_KCMP
> ---
>  fs/eventpoll.c                                |  4 ++--
>  include/linux/eventpoll.h                     |  2 +-
>  init/Kconfig                                  | 12 ++++++++++++
>  kernel/Makefile                               |  2 +-
>  tools/testing/selftests/seccomp/seccomp_bpf.c |  2 +-
>  5 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index a829af074eb5..3196474cbe24 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -979,7 +979,7 @@ static struct epitem *ep_find(struct eventpoll *ep, struct file *file, int fd)
>  	return epir;
>  }
>  
> -#ifdef CONFIG_CHECKPOINT_RESTORE
> +#ifdef CONFIG_KCMP
>  static struct epitem *ep_find_tfd(struct eventpoll *ep, int tfd, unsigned long toff)
>  {
>  	struct rb_node *rbp;
> @@ -1021,7 +1021,7 @@ struct file *get_epoll_tfile_raw_ptr(struct file *file, int tfd,
>  
>  	return file_raw;
>  }
> -#endif /* CONFIG_CHECKPOINT_RESTORE */
> +#endif /* CONFIG_KCMP */
>  
>  /**
>   * Adds a new entry to the tail of the list in a lockless way, i.e.
> diff --git a/include/linux/eventpoll.h b/include/linux/eventpoll.h
> index 0350393465d4..593322c946e6 100644
> --- a/include/linux/eventpoll.h
> +++ b/include/linux/eventpoll.h
> @@ -18,7 +18,7 @@ struct file;
>  
>  #ifdef CONFIG_EPOLL
>  
> -#ifdef CONFIG_CHECKPOINT_RESTORE
> +#ifdef CONFIG_KCMP
>  struct file *get_epoll_tfile_raw_ptr(struct file *file, int tfd, unsigned long toff);
>  #endif
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index b77c60f8b963..1b75141bc18b 100644
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
> @@ -1737,6 +1738,17 @@ config ARCH_HAS_MEMBARRIER_CALLBACKS
>  config ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	bool
>  
> +config KCMP
> +	bool "Enable kcmp() system call" if EXPERT
> +	default n
> +	help
> +	  Enable the kernel resource comparison system call. It provides
> +	  user-space with the ability to compare two processes to see if they
> +	  share a common resource, such as a file descriptor or even virtual
> +	  memory space.
> +
> +	  If unsure, say N.
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
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
