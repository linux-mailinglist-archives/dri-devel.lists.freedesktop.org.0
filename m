Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4394EDFC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 15:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243BA890BE;
	Mon, 12 Aug 2024 13:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ftQalE41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38BD890BE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 13:21:35 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-70940c9657dso2179621a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723468895; x=1724073695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntaXkWZopfKg+6j7rnXEQlGZAwKedjmgSjz6FEutgS8=;
 b=ftQalE41zDIl4mivBd1NTZTWCemgSvxWP7WYLOIFPs8tbU8UFL4BmdBfZZNrbN1o0N
 x2vbOob+Jnsmy+9paeIefVtt8C++cWtYUz093AcOU1qSk0rTxpTiHbPZo3hckoS9lkRv
 JxUzhtxpTMBiaNrsLVz4OD1BkFkScUxyBVa652C01c0LleOE4qJ1TcbPhlfquOg91ly3
 ZghFQ1FLfoeG0f+EwkOC+HVwXcF9gv5GOZQcfZT6hZP8WB77E+wvDqS4Gb8X29m5e6lz
 zOEY7O2AeZrDCdj8XsTQIEuBJpnVUE1AEU39vSuBX3C1b29SaCzoNFS5iRRxOsAbD7el
 IMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723468895; x=1724073695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ntaXkWZopfKg+6j7rnXEQlGZAwKedjmgSjz6FEutgS8=;
 b=UKhRlTsXVEuEQfZN4PF93kUFntrVMbN33Laq58CkdloyhGgbU0J6VyaaPWn19qm3Lj
 x9E7Ak2fqhATB6hIOXjvRD9J52FeA93rD0k+/gl0Z7xMqwb0X5qVHZTANrlyfYDLFNT8
 9ZHIbLWqfbuEMuK2CgN6B3v+Riq7bmRHcRFzlSRiMJC3iucQZzGQOnHeqoZkIoGzLRPb
 lPePpX46Ady81afpUF2n5bz+Pt1W4G9E/0BpVpF4o7Hk1V7S88CclR9bmtBCR+ZZ3+fZ
 OGg4Y3H9eawvkaiZkZrM7ky9oRXcHvYa4oavVRfhcmbLmrjCsbe+DW+cXhN2EZIDEcTJ
 bYsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBIQFHzFg27ApJyl4JKWk2hmVxVpYFZfkpjGI7dde8gs3YcH8UJQfFfKkbYmLUD6YQlseE/+RFSN1FpZu5SSdYpziHmjdWwKWTWEXH0B1M
X-Gm-Message-State: AOJu0Ywd/sWEcGSkryBknAOCir0ljsccraTOQ3eu3ra2r6k2SkZabQ5I
 G/gIYgP5MzQkK8yy5u2F4MbrE8D2zj30/F5aWNXg7GNFiwn1sUXd5iRMlcQi0a/hS8N2qciqd0h
 i7pVjA2McuPKgU/PeFs2Y/uUMFWA=
X-Google-Smtp-Source: AGHT+IGVQve+llYsp0AugSRGeMMoIczqwy8oRpZMYGNh2sJDxIw1ZBHkds1sjMf3hXZlB+uLcjMVRoLPG20nTXUm0IM=
X-Received: by 2002:a05:6830:34a6:b0:703:651b:382f with SMTP id
 46e09a7af769-70c9387ae3fmr240831a34.3.1723468894738; Mon, 12 Aug 2024
 06:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240812022933.69850-1-laoar.shao@gmail.com>
 <20240812022933.69850-2-laoar.shao@gmail.com>
 <qztvfvesnxkaol6n3ucf5ovp2ssq4hzxceaedgfexieggzj6zh@pyd5f43pccyh>
In-Reply-To: <qztvfvesnxkaol6n3ucf5ovp2ssq4hzxceaedgfexieggzj6zh@pyd5f43pccyh>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 12 Aug 2024 21:20:57 +0800
Message-ID: <CALOAHbA5MVVhSAm-atWxigaceWBDo4h5ucRv09onnMYFVWsOzQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] Get rid of __get_task_comm()
To: Alejandro Colomar <alx@kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Kees Cook <keescook@chromium.org>, Matus Jokay <matus.jokay@stuba.sk>, 
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 12, 2024 at 4:05=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> Hi Yafang,
>
> On Mon, Aug 12, 2024 at 10:29:25AM GMT, Yafang Shao wrote:
> > We want to eliminate the use of __get_task_comm() for the following
> > reasons:
> >
> > - The task_lock() is unnecessary
> >   Quoted from Linus [0]:
> >   : Since user space can randomly change their names anyway, using lock=
ing
> >   : was always wrong for readers (for writers it probably does make sen=
se
> >   : to have some lock - although practically speaking nobody cares ther=
e
> >   : either, but at least for a writer some kind of race could have
> >   : long-term mixed results
> >
> > - The BUILD_BUG_ON() doesn't add any value
> >   The only requirement is to ensure that the destination buffer is a va=
lid
> >   array.
> >
> > - Zeroing is not necessary in current use cases
> >   To avoid confusion, we should remove it. Moreover, not zeroing could
> >   potentially make it easier to uncover bugs. If the caller needs a
> >   zero-padded task name, it should be explicitly handled at the call si=
te.
> >
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Link: https://lore.kernel.org/all/CAHk-=3DwivfrF0_zvf+oj6=3D=3DSh=3D-np=
JooP8chLPEfaFV0oNYTTBA@mail.gmail.com [0]
> > Link: https://lore.kernel.org/all/CAHk-=3DwhWtUC-AjmGJveAETKOMeMFSTwKwu=
99v7+b6AyHMmaDFA@mail.gmail.com/
> > Suggested-by: Alejandro Colomar <alx@kernel.org>
> > Link: https://lore.kernel.org/all/2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurf=
bosf5wdo65dk4@srb3hsk72zwq
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Eric Biederman <ebiederm@xmission.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> > Cc: Matus Jokay <matus.jokay@stuba.sk>
> > Cc: Alejandro Colomar <alx@kernel.org>
> > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > ---
> >  fs/exec.c             | 10 ----------
> >  fs/proc/array.c       |  2 +-
> >  include/linux/sched.h | 31 +++++++++++++++++++++++++------
> >  kernel/kthread.c      |  2 +-
> >  4 files changed, 27 insertions(+), 18 deletions(-)
> >
> > diff --git a/fs/exec.c b/fs/exec.c
> > index a47d0e4c54f6..2e468ddd203a 100644
> > --- a/fs/exec.c
> > +++ b/fs/exec.c
> > @@ -1264,16 +1264,6 @@ static int unshare_sighand(struct task_struct *m=
e)
> >       return 0;
> >  }
> >
> > -char *__get_task_comm(char *buf, size_t buf_size, struct task_struct *=
tsk)
> > -{
> > -     task_lock(tsk);
> > -     /* Always NUL terminated and zero-padded */
> > -     strscpy_pad(buf, tsk->comm, buf_size);
>
> This comment is correct (see other comments below).
>
> (Except that pedantically, I'd write it as NUL-terminated with a hyphen,
>  just like zero-padded.)
>
> > -     task_unlock(tsk);
> > -     return buf;
> > -}
> > -EXPORT_SYMBOL_GPL(__get_task_comm);
> > -
> >  /*
> >   * These functions flushes out all traces of the currently running exe=
cutable
> >   * so that a new one can be started
> > diff --git a/fs/proc/array.c b/fs/proc/array.c
> > index 34a47fb0c57f..55ed3510d2bb 100644
> > --- a/fs/proc/array.c
> > +++ b/fs/proc/array.c
> > @@ -109,7 +109,7 @@ void proc_task_name(struct seq_file *m, struct task=
_struct *p, bool escape)
> >       else if (p->flags & PF_KTHREAD)
> >               get_kthread_comm(tcomm, sizeof(tcomm), p);
> >       else
> > -             __get_task_comm(tcomm, sizeof(tcomm), p);
> > +             get_task_comm(tcomm, p);
>
> LGTM.  (This would have been good even if not removing the helper.)
>
> >
> >       if (escape)
> >               seq_escape_str(m, tcomm, ESCAPE_SPACE | ESCAPE_SPECIAL, "=
\n\\");
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 33dd8d9d2b85..e0e26edbda61 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -1096,9 +1096,11 @@ struct task_struct {
> >       /*
> >        * executable name, excluding path.
> >        *
> > -      * - normally initialized setup_new_exec()
> > -      * - access it with [gs]et_task_comm()
> > -      * - lock it with task_lock()
> > +      * - normally initialized begin_new_exec()
> > +      * - set it with set_task_comm()
> > +      *   - strscpy_pad() to ensure it is always NUL-terminated
>
> The comment above is inmprecise.
> It should say either
> "strscpy() to ensure it is always NUL-terminated", or
> "strscpy_pad() to ensure it is NUL-terminated and zero-padded".

will change it.

>
> > +      *   - task_lock() to ensure the operation is atomic and the name=
 is
> > +      *     fully updated.
> >        */
> >       char                            comm[TASK_COMM_LEN];
> >
> > @@ -1912,10 +1914,27 @@ static inline void set_task_comm(struct task_st=
ruct *tsk, const char *from)
> >       __set_task_comm(tsk, from, false);
> >  }
> >
> > -extern char *__get_task_comm(char *to, size_t len, struct task_struct =
*tsk);
> > +/*
> > + * - Why not use task_lock()?
> > + *   User space can randomly change their names anyway, so locking for=
 readers
> > + *   doesn't make sense. For writers, locking is probably necessary, a=
s a race
> > + *   condition could lead to long-term mixed results.
> > + *   The strscpy_pad() in __set_task_comm() can ensure that the task c=
omm is
> > + *   always NUL-terminated.
>
> This comment has the same imprecission that I noted above.

will change it.

>
> > Therefore the race condition between reader and
> > + *   writer is not an issue.
> > + *
> > + * - Why not use strscpy_pad()?
> > + *   While strscpy_pad() prevents writing garbage past the NUL termina=
tor, which
> > + *   is useful when using the task name as a key in a hash map, most u=
se cases
> > + *   don't require this. Zero-padding might confuse users if it=E2=80=
=99s unnecessary,
> > + *   and not zeroing might even make it easier to expose bugs. If you =
need a
> > + *   zero-padded task name, please handle that explicitly at the call =
site.
> > + *
> > + * - ARRAY_SIZE() can help ensure that @buf is indeed an array.
> > + */
> >  #define get_task_comm(buf, tsk) ({                   \
> > -     BUILD_BUG_ON(sizeof(buf) !=3D TASK_COMM_LEN);     \
> > -     __get_task_comm(buf, sizeof(buf), tsk);         \
> > +     strscpy(buf, (tsk)->comm, ARRAY_SIZE(buf));     \
> > +     buf;                                            \
> >  })
> >
> >  #ifdef CONFIG_SMP
> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> > index f7be976ff88a..7d001d033cf9 100644
> > --- a/kernel/kthread.c
> > +++ b/kernel/kthread.c
> > @@ -101,7 +101,7 @@ void get_kthread_comm(char *buf, size_t buf_size, s=
truct task_struct *tsk)
> >       struct kthread *kthread =3D to_kthread(tsk);
> >
> >       if (!kthread || !kthread->full_name) {
> > -             __get_task_comm(buf, buf_size, tsk);
> > +             strscpy(buf, tsk->comm, buf_size);
> >               return;
> >       }
>
> Other than that, LGTM.

Thanks for your review.

--=20
Regards
Yafang
