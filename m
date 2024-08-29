Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A10963BAB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD3C10E19B;
	Thu, 29 Aug 2024 06:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LGtiQiLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108210E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:30:54 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6bf6721aae5so1799436d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 23:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724913053; x=1725517853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVHRuwAUcEYymH+J/b0R0e+3iNvUH3y6v7Jow7lKvQY=;
 b=LGtiQiLdYbwe7k7VO5yEnKt8vzJoPkRjj624uYc7vLu2NbTSnIpq6ADKxDF3nWrtA3
 fPmbpDjWW68GLBkxKpLfyvA5MCLnuFj3Y34lIrHYjXMv+Wt5V8tP/13rcmQrcLefClLi
 6LREltL6+83zGQcNIgNo211M1/GV+tL6QxyXcYp90KG8aSveqXaTjLqJ3+1yTdJWeq6S
 GKA+YizmN6CkI82k47Kh/vbolE0AuAGyfVzPBFyoX5bHk6DpK1eS0DCG11VRDmHXnufH
 NN2fTLLZEJ82skE/JTeRJ+8pLCVKcBBZw53cyygWDsE1qnr3PyITlwGiHYXEHB9zlUu5
 rRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724913053; x=1725517853;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVHRuwAUcEYymH+J/b0R0e+3iNvUH3y6v7Jow7lKvQY=;
 b=voP7j0ih+rykAR5nPkPPbiTIkVrepl0GP0bWpQX5i+iEsNQLLn0pUAwDpjVUKVEtnJ
 WIEeAXf/lFjssBqIjtSqJt4hDx9qd1bzP2hRpgRboP/PIbbuz8aD14R6s6Yonk5KkAi5
 /z3i1++5Vwdz2y8higkVRo+jLuo6xnPe3dtSiAYA4ab241BgpNO66vKuFhPPRimOH+r4
 rkHmGzd9y7VnM7nhEgHHo6wfReNTI7nDRDKKXUD56AU+H0DVl6Ru7/zFpG1aTtLqV742
 E3ZLLhbsg0Elof/NdLxYyBkD0Xg4Qw7FLGpJAKV/Q7MTKqOkJli+0XJ6t+mcfAUm18M2
 Lrxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPcumzQ0zjzY5349gLqEuXacV2BVw1fjDsVRcZAmA65SE0tmHvvaUYPOEaE61KxK7aojPp4Hd5Igo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy3MkvNN/v5B8gi1QHvGZtFWJ0SvLy0pne3RshOWOHeVD9r8Ff
 xSDy9R72Iv97h5RsGfBstzSihh8afAlHXpE/cALsp+VT/+2w7UsKoNqIl5SnuitCYuTeIUh3of+
 Sr5uhoJMowSJIPGpuyCDk0ie2X3M=
X-Google-Smtp-Source: AGHT+IHAaYj3VKJPFC+rsCIttyDdBV4rNcUvYcw6ZzQZduvgmQVvDq94rvCCqajdqQxNsCbTeYDYWfFYA4N5Ml43Gtc=
X-Received: by 2002:a05:6214:2d4a:b0:6bb:ab4a:dbdb with SMTP id
 6a1803df08f44-6c33e5e7de8mr21034396d6.1.1724913053063; Wed, 28 Aug 2024
 23:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-2-laoar.shao@gmail.com>
 <8A36564D-56E3-469B-B201-0BD7C11D6EFC@kernel.org>
In-Reply-To: <8A36564D-56E3-469B-B201-0BD7C11D6EFC@kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 29 Aug 2024 14:30:14 +0800
Message-ID: <CALOAHbBHkS=J8Bv+XsoWvwdfG7fGFg0eVw9PhOVWVbJ1ebrr1w@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] Get rid of __get_task_comm()
To: Kees Cook <kees@kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, alx@kernel.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com,
 rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, 
 Matus Jokay <matus.jokay@stuba.sk>, "Serge E. Hallyn" <serge@hallyn.com>
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

On Wed, Aug 28, 2024 at 10:04=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On August 27, 2024 8:03:14 PM PDT, Yafang Shao <laoar.shao@gmail.com> wro=
te:
> >We want to eliminate the use of __get_task_comm() for the following
> >reasons:
> >
> >- The task_lock() is unnecessary
> >  Quoted from Linus [0]:
> >  : Since user space can randomly change their names anyway, using locki=
ng
> >  : was always wrong for readers (for writers it probably does make sens=
e
> >  : to have some lock - although practically speaking nobody cares there
> >  : either, but at least for a writer some kind of race could have
> >  : long-term mixed results
> >
> >- The BUILD_BUG_ON() doesn't add any value
> >  The only requirement is to ensure that the destination buffer is a val=
id
> >  array.
>
> Sorry, that's not a correct evaluation. See below.
>
> >
> >- Zeroing is not necessary in current use cases
> >  To avoid confusion, we should remove it. Moreover, not zeroing could
> >  potentially make it easier to uncover bugs. If the caller needs a
> >  zero-padded task name, it should be explicitly handled at the call sit=
e.
>
> This is also not an appropriate rationale. We don't make the kernel "more=
 buggy" not purpose. ;) See below.
>
> >
> >Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> >Link: https://lore.kernel.org/all/CAHk-=3DwivfrF0_zvf+oj6=3D=3DSh=3D-npJ=
ooP8chLPEfaFV0oNYTTBA@mail.gmail.com [0]
> >Link: https://lore.kernel.org/all/CAHk-=3DwhWtUC-AjmGJveAETKOMeMFSTwKwu9=
9v7+b6AyHMmaDFA@mail.gmail.com/
> >Suggested-by: Alejandro Colomar <alx@kernel.org>
> >Link: https://lore.kernel.org/all/2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueurfb=
osf5wdo65dk4@srb3hsk72zwq
> >Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> >Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> >Cc: Christian Brauner <brauner@kernel.org>
> >Cc: Jan Kara <jack@suse.cz>
> >Cc: Eric Biederman <ebiederm@xmission.com>
> >Cc: Kees Cook <keescook@chromium.org>
> >Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> >Cc: Matus Jokay <matus.jokay@stuba.sk>
> >Cc: Alejandro Colomar <alx@kernel.org>
> >Cc: "Serge E. Hallyn" <serge@hallyn.com>
> >---
> > fs/exec.c             | 10 ----------
> > fs/proc/array.c       |  2 +-
> > include/linux/sched.h | 32 ++++++++++++++++++++++++++------
> > kernel/kthread.c      |  2 +-
> > 4 files changed, 28 insertions(+), 18 deletions(-)
> >
> >diff --git a/fs/exec.c b/fs/exec.c
> >index 50e76cc633c4..8a23171bc3c3 100644
> >--- a/fs/exec.c
> >+++ b/fs/exec.c
> >@@ -1264,16 +1264,6 @@ static int unshare_sighand(struct task_struct *me=
)
> >       return 0;
> > }
> >
> >-char *__get_task_comm(char *buf, size_t buf_size, struct task_struct *t=
sk)
> >-{
> >-      task_lock(tsk);
> >-      /* Always NUL terminated and zero-padded */
> >-      strscpy_pad(buf, tsk->comm, buf_size);
> >-      task_unlock(tsk);
> >-      return buf;
> >-}
> >-EXPORT_SYMBOL_GPL(__get_task_comm);
> >-
> > /*
> >  * These functions flushes out all traces of the currently running exec=
utable
> >  * so that a new one can be started
> >diff --git a/fs/proc/array.c b/fs/proc/array.c
> >index 34a47fb0c57f..55ed3510d2bb 100644
> >--- a/fs/proc/array.c
> >+++ b/fs/proc/array.c
> >@@ -109,7 +109,7 @@ void proc_task_name(struct seq_file *m, struct task_=
struct *p, bool escape)
> >       else if (p->flags & PF_KTHREAD)
> >               get_kthread_comm(tcomm, sizeof(tcomm), p);
> >       else
> >-              __get_task_comm(tcomm, sizeof(tcomm), p);
> >+              get_task_comm(tcomm, p);
> >
> >       if (escape)
> >               seq_escape_str(m, tcomm, ESCAPE_SPACE | ESCAPE_SPECIAL, "=
\n\\");
> >diff --git a/include/linux/sched.h b/include/linux/sched.h
> >index f8d150343d42..c40b95a79d80 100644
> >--- a/include/linux/sched.h
> >+++ b/include/linux/sched.h
> >@@ -1096,9 +1096,12 @@ struct task_struct {
> >       /*
> >        * executable name, excluding path.
> >        *
> >-       * - normally initialized setup_new_exec()
> >-       * - access it with [gs]et_task_comm()
> >-       * - lock it with task_lock()
> >+       * - normally initialized begin_new_exec()
> >+       * - set it with set_task_comm()
> >+       *   - strscpy_pad() to ensure it is always NUL-terminated and
> >+       *     zero-padded
> >+       *   - task_lock() to ensure the operation is atomic and the name=
 is
> >+       *     fully updated.
> >        */
> >       char                            comm[TASK_COMM_LEN];
> >
> >@@ -1914,10 +1917,27 @@ static inline void set_task_comm(struct task_str=
uct *tsk, const char *from)
> >       __set_task_comm(tsk, from, false);
> > }
> >
> >-extern char *__get_task_comm(char *to, size_t len, struct task_struct *=
tsk);
> >+/*
> >+ * - Why not use task_lock()?
> >+ *   User space can randomly change their names anyway, so locking for =
readers
> >+ *   doesn't make sense. For writers, locking is probably necessary, as=
 a race
> >+ *   condition could lead to long-term mixed results.
> >+ *   The strscpy_pad() in __set_task_comm() can ensure that the task co=
mm is
> >+ *   always NUL-terminated and zero-padded. Therefore the race conditio=
n between
> >+ *   reader and writer is not an issue.
> >+ *
> >+ * - Why not use strscpy_pad()?
> >+ *   While strscpy_pad() prevents writing garbage past the NUL terminat=
or, which
> >+ *   is useful when using the task name as a key in a hash map, most us=
e cases
> >+ *   don't require this. Zero-padding might confuse users if it=E2=80=
=99s unnecessary,
> >+ *   and not zeroing might even make it easier to expose bugs. If you n=
eed a
> >+ *   zero-padded task name, please handle that explicitly at the call s=
ite.
>
> I really don't like this part of the change. You don't know that existing=
 callers don't depend on the padding. Please invert this logic: get_task_co=
mm() must use strscpy_pad(). Calls NOT wanting padding can call strscpy() t=
hemselves.
>
> >+ *
> >+ * - ARRAY_SIZE() can help ensure that @buf is indeed an array.
>
> This doesn't need checking here; strscpy() will already do that.
>
> >+ */
> > #define get_task_comm(buf, tsk) ({                    \
> >-      BUILD_BUG_ON(sizeof(buf) !=3D TASK_COMM_LEN);     \
>
> Also, please leave the TASK_COMM_LEN test so that destination buffers con=
tinue to be the correct size: current callers do not perform any return val=
ue analysis, so they cannot accidentally start having situations where the =
destination string might be truncated. Again, anyone wanting to avoid that =
restriction can use strscpy() directly and check the return value.

Hello Kees,

Thanks for your input.

Alejandro has addressed all the other changes except for the removal
of BUILD_BUG_ON(). I have a question regarding this: if we're using it
to avoid truncation, why not write it like this?

    BUILD_BUG_ON(sizeof(buf) < TASK_COMM_LEN);

This way, it ensures that the size is at least as large as TASK_COMM_LEN.

--
Regards
Yafang
