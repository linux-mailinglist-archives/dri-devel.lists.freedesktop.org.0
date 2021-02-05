Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C196331135A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 22:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6F26F4D8;
	Fri,  5 Feb 2021 21:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124B46F4D6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 21:20:36 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id z9so4530922pjl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 13:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZYhyH/UoKAZ0pUR5GxFLgA12f7+59pz9aTtQWcg/Skw=;
 b=R02SrSjetAsxFVmsYiUkEaJlwQ55nZeZL2cuCV8kSBOiUaZp+orsa3k1DkBH8r1o+O
 K8nZlJWEmJYwLWIcMeuHoNjCU7WwUO05WaeDd2OSjhi3CUfrp7ekX8vcjLmxTBoLdCm/
 F1sJLEErN2lZYfcW48Wiw43kdbDCng5x9MENg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZYhyH/UoKAZ0pUR5GxFLgA12f7+59pz9aTtQWcg/Skw=;
 b=NnXUOHCn+1nwmcnyD3otg3x9HLmTWOzriQx1RfCZgLJ/fubiFmFGzlTm+DAA5XGdGG
 6Rq0TOJLGgzr09wib+33lDEQHj8cJN/AwUsaQC9ISqZ4TGP6r7IhpHShmXQ1XqISM/ae
 Gg0/P9p1qwfk5sllurh7QY6mTTLXdkEZSaiTpdOk80bwo8zslJK21V/OglF0lZUngOrN
 BXI3m9f6Xdy6npmpHYPifMjz41EKG5AGkAAKrjcQhRZYkrGSr2etRyoYkOaYjre0g/4Z
 cfwILDtWxMHRtQWVPhyiRx4/xnPqp91QWAQaIhUOyfqOumgiL3mVyUjpcGApR57qKfTw
 p/vg==
X-Gm-Message-State: AOAM5300g6+gLzGYrbT5SRyshnu+J39KoAyhVbtTkPSjXiUCWxjBUZai
 pI2Vnp+ag4uCamRZnY+f7obQKg==
X-Google-Smtp-Source: ABdhPJwu85fzWnYg65UdufVcnja7D169FBdJJ4/E0S/U4P8nrMrT7ItVPkNRWfYlV2eGz5u6W5tkgA==
X-Received: by 2002:a17:90b:11c9:: with SMTP id
 gv9mr5843284pjb.196.1612560035614; 
 Fri, 05 Feb 2021 13:20:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 12sm9167516pjm.28.2021.02.05.13.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 13:20:34 -0800 (PST)
Date: Fri, 5 Feb 2021 13:20:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v2] kernel: Expose SYS_kcmp by default
Message-ID: <202102051319.E5D8B4528D@keescook>
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205210610.29837-1-chris@chris-wilson.co.uk>
 <161255976138.12021.9385501710085642237@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161255976138.12021.9385501710085642237@build.alporthouse.com>
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
Cc: Will Drewry <wad@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 09:16:01PM +0000, Chris Wilson wrote:
> The subject should of course be changed, as it is no longer being
> enabled by default.

"default n" is redundant. I thought Daniel said CONFIG_DRM needed to
"select" it too, though? Otherwise, yeah, this looks good. Was the
export due to the 0-day bot failure reports?

-Kees

> 
> Something like
> 
> kcmp: Support selection of SYS_kcmp without CHECKPOINT_RESTORE
> 
> Quoting Chris Wilson (2021-02-05 21:06:10)
> > Userspace has discovered the functionality offered by SYS_kcmp and has
> > started to depend upon it. In particular, Mesa uses SYS_kcmp for
> > os_same_file_description() in order to identify when two fd (e.g. device
> > or dmabuf) point to the same struct file. Since they depend on it for
> > core functionality, lift SYS_kcmp out of the non-default
> > CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.
> > 
> > Note that some distributions such as Ubuntu are already enabling
> > CHECKPOINT_RESTORE in their configs and so, by extension, SYS_kcmp.
> > 
> > References: https://gitlab.freedesktop.org/drm/intel/-/issues/3046
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andy Lutomirski <luto@amacapital.net>
> > Cc: Will Drewry <wad@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> # DRM depends on SYS_kcmp
> > 
> > ---
> > v2:
> >   - Default n.
> >   - Borrrow help message from man kcmp.
> >   - Export get_epoll_tfile_raw_ptr() for CONFIG_KCMP
> > ---
> >  fs/eventpoll.c                                |  4 ++--
> >  include/linux/eventpoll.h                     |  2 +-
> >  init/Kconfig                                  | 12 ++++++++++++
> >  kernel/Makefile                               |  2 +-
> >  tools/testing/selftests/seccomp/seccomp_bpf.c |  2 +-
> >  5 files changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> > index a829af074eb5..3196474cbe24 100644
> > --- a/fs/eventpoll.c
> > +++ b/fs/eventpoll.c
> > @@ -979,7 +979,7 @@ static struct epitem *ep_find(struct eventpoll *ep, struct file *file, int fd)
> >         return epir;
> >  }
> >  
> > -#ifdef CONFIG_CHECKPOINT_RESTORE
> > +#ifdef CONFIG_KCMP
> >  static struct epitem *ep_find_tfd(struct eventpoll *ep, int tfd, unsigned long toff)
> >  {
> >         struct rb_node *rbp;
> > @@ -1021,7 +1021,7 @@ struct file *get_epoll_tfile_raw_ptr(struct file *file, int tfd,
> >  
> >         return file_raw;
> >  }
> > -#endif /* CONFIG_CHECKPOINT_RESTORE */
> > +#endif /* CONFIG_KCMP */
> >  
> >  /**
> >   * Adds a new entry to the tail of the list in a lockless way, i.e.
> > diff --git a/include/linux/eventpoll.h b/include/linux/eventpoll.h
> > index 0350393465d4..593322c946e6 100644
> > --- a/include/linux/eventpoll.h
> > +++ b/include/linux/eventpoll.h
> > @@ -18,7 +18,7 @@ struct file;
> >  
> >  #ifdef CONFIG_EPOLL
> >  
> > -#ifdef CONFIG_CHECKPOINT_RESTORE
> > +#ifdef CONFIG_KCMP
> >  struct file *get_epoll_tfile_raw_ptr(struct file *file, int tfd, unsigned long toff);
> >  #endif
> >  
> > diff --git a/init/Kconfig b/init/Kconfig
> > index b77c60f8b963..1b75141bc18b 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1194,6 +1194,7 @@ endif # NAMESPACES
> >  config CHECKPOINT_RESTORE
> >         bool "Checkpoint/restore support"
> >         select PROC_CHILDREN
> > +       select KCMP
> >         default n
> >         help
> >           Enables additional kernel features in a sake of checkpoint/restore.
> > @@ -1737,6 +1738,17 @@ config ARCH_HAS_MEMBARRIER_CALLBACKS
> >  config ARCH_HAS_MEMBARRIER_SYNC_CORE
> >         bool
> >  
> > +config KCMP
> > +       bool "Enable kcmp() system call" if EXPERT
> > +       default n
> > +       help
> > +         Enable the kernel resource comparison system call. It provides
> > +         user-space with the ability to compare two processes to see if they
> > +         share a common resource, such as a file descriptor or even virtual
> > +         memory space.
> > +
> > +         If unsure, say N.
> > +
> >  config RSEQ
> >         bool "Enable rseq() system call" if EXPERT
> >         default y
> > diff --git a/kernel/Makefile b/kernel/Makefile
> > index aa7368c7eabf..320f1f3941b7 100644
> > --- a/kernel/Makefile
> > +++ b/kernel/Makefile
> > @@ -51,7 +51,7 @@ obj-y += livepatch/
> >  obj-y += dma/
> >  obj-y += entry/
> >  
> > -obj-$(CONFIG_CHECKPOINT_RESTORE) += kcmp.o
> > +obj-$(CONFIG_KCMP) += kcmp.o
> >  obj-$(CONFIG_FREEZER) += freezer.o
> >  obj-$(CONFIG_PROFILING) += profile.o
> >  obj-$(CONFIG_STACKTRACE) += stacktrace.o
> > diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > index 26c72f2b61b1..1b6c7d33c4ff 100644
> > --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> > +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > @@ -315,7 +315,7 @@ TEST(kcmp)
> >         ret = __filecmp(getpid(), getpid(), 1, 1);
> >         EXPECT_EQ(ret, 0);
> >         if (ret != 0 && errno == ENOSYS)
> > -               SKIP(return, "Kernel does not support kcmp() (missing CONFIG_CHECKPOINT_RESTORE?)");
> > +               SKIP(return, "Kernel does not support kcmp() (missing CONFIG_KCMP?)");
> >  }
> >  
> >  TEST(mode_strict_support)
> > -- 
> > 2.20.1
> >

-- 
Kees Cook
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
