Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0E3112D4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0996D6E1A7;
	Fri,  5 Feb 2021 20:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377976E1A7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 20:53:52 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id 100so1506138otg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5PRi5FG8/+JWu+jWzUkXoHnN4JWoS4p+oSPjz4dHX4E=;
 b=OASnDCXTrffqrxPZSX+X2BoOBJSJeWYxtAIhsNCtVNhz5gMXxmVx/jYGnsUN9nnJuN
 vhfjMJNVrRb2wgVEK4+xSY1vgWYsPum4Jw0tHUrjZI6XNfx7htArAF/NC/hE/qfZg0zE
 Q6EogytHRY9X2yLHj2BIhrsaED0mM8FE6XIoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5PRi5FG8/+JWu+jWzUkXoHnN4JWoS4p+oSPjz4dHX4E=;
 b=CYp3CNopLfUiVKqZHU9ap4UP4bFfI/E+EnKpipKKXkRVm6l4Z/+qPuipnYNGYXt4hM
 ctW3dVnLY51/AoflR9xBq1WAMh3PZ2zxL7MDAIzXNldjWoLuYQFcByTOiNFD7XZVoFC2
 0sA7sIez2DdwhIXrP1K0oTGrwa35AOHrnCKwijBqfC2zM0LCww3R4aiap7kgK+o4Humg
 K4eK8rc7VH7pNDO/2NnTQs6cjKyUpcUFsOOYoEQ4lINMuAHqx8dizDEqCE9lARjBSr4p
 YFrrsOcTX2oaYrJj+dprSudZaNv7h+vxkI1nPHFCjVKIuyZCxcrfRnnrNF8T7jGqXJpx
 hAIQ==
X-Gm-Message-State: AOAM5333UhjPFeBJ5qlGYY935OeYKtAp94UldXY9A9n/b+lR2Q3dTZUX
 C3CxV/dta3RbaLS+CRha2LE0NXLA4L9y8NypBrl4ww==
X-Google-Smtp-Source: ABdhPJzg/0sRpmAYdxePGbdJtZika7yemD79/03eRrmz2fmH3+4sjo2UBY/XCbjTjR0SqL2Ey0KOyRS9uFFIs7Vpmkg=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr4848871oth.281.1612558431545;
 Fri, 05 Feb 2021 12:53:51 -0800 (PST)
MIME-Version: 1.0
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <202102051030.1AF01772D@keescook>
In-Reply-To: <202102051030.1AF01772D@keescook>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 5 Feb 2021 21:53:40 +0100
Message-ID: <CAKMK7uHnOA9CuRxcKkcqG8duOw_3dZobkThcV7Q_swMXVoLCkQ@mail.gmail.com>
Subject: Re: [PATCH] kernel: Expose SYS_kcmp by default
To: Kees Cook <keescook@chromium.org>, "airlied@gmail.com" <airlied@gmail.com>
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
Cc: Will Drewry <wad@chromium.org>, Jann Horn <jannh@google.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andy Lutomirski <luto@amacapital.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 7:37 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Feb 05, 2021 at 04:37:52PM +0000, Chris Wilson wrote:
> > Userspace has discovered the functionality offered by SYS_kcmp and has
> > started to depend upon it. In particular, Mesa uses SYS_kcmp for
> > os_same_file_description() in order to identify when two fd (e.g. device
> > or dmabuf) point to the same struct file. Since they depend on it for
> > core functionality, lift SYS_kcmp out of the non-default
> > CONFIG_CHECKPOINT_RESTORE into the selectable syscall category.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andy Lutomirski <luto@amacapital.net>
> > Cc: Will Drewry <wad@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  init/Kconfig                                  | 11 +++++++++++
> >  kernel/Makefile                               |  2 +-
> >  tools/testing/selftests/seccomp/seccomp_bpf.c |  2 +-
> >  3 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index b77c60f8b963..f62fca13ac5b 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1194,6 +1194,7 @@ endif # NAMESPACES
> >  config CHECKPOINT_RESTORE
> >       bool "Checkpoint/restore support"
> >       select PROC_CHILDREN
> > +     select KCMP
> >       default n
> >       help
> >         Enables additional kernel features in a sake of checkpoint/restore.
> > @@ -1737,6 +1738,16 @@ config ARCH_HAS_MEMBARRIER_CALLBACKS
> >  config ARCH_HAS_MEMBARRIER_SYNC_CORE
> >       bool
> >
> > +config KCMP
> > +     bool "Enable kcmp() system call" if EXPERT
> > +     default y
>
> I would expect this to be not default-y, especially if
> CHECKPOINT_RESTORE does a "select" on it.
>
> This is a really powerful syscall, but it is bounded by ptrace access
> controls, and uses pointer address obfuscation, so it may be okay to
> expose this. As it is, at least Ubuntu already has
> CONFIG_CHECKPOINT_RESTORE, so really, there's probably not much
> difference on exposure.
>
> So, if you drop the "default y", I'm fine with this.

It was maybe stupid, but our userspace started relying on fd
comaprison through sys_kcomp. So for better or worse, if you want to
run the mesa3d gl/vk stacks, you need this. Was maybe not the brighest
ideas, but since enough distros had this enabled by defaults, it
wasn't really discovered, and now we're shipping this everywhere.

Ofc we can leave the default n, but the select if CONFIG_DRM is
unfortunately needed I think. For that part:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also adding Dave Airlie for his take.
-Daniel

>
> -Kees
>
> > +     help
> > +       Enable the file descriptor comparison system call. It provides
> > +       user-space with the ability to compare two fd to see if they
> > +       point to the same file, and check other attributes.
> > +
> > +       If unsure, say Y.
> > +
> >  config RSEQ
> >       bool "Enable rseq() system call" if EXPERT
> >       default y
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
> >       ret = __filecmp(getpid(), getpid(), 1, 1);
> >       EXPECT_EQ(ret, 0);
> >       if (ret != 0 && errno == ENOSYS)
> > -             SKIP(return, "Kernel does not support kcmp() (missing CONFIG_CHECKPOINT_RESTORE?)");
> > +             SKIP(return, "Kernel does not support kcmp() (missing CONFIG_KCMP?)");
> >  }
> >
> >  TEST(mode_strict_support)
> > --
> > 2.20.1
> >
>
> --
> Kees Cook



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
