Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA39627F2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8766610E058;
	Wed, 28 Aug 2024 12:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="js6YW2RQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DF110E058
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:57:52 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7a1dcc7bc05so434003885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724849871; x=1725454671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75zSlLwUuo3vTsXNiB/Bg248lll9xEE0NLqRnWuoevM=;
 b=js6YW2RQuIPUvkSppEmhwCglUVVtb+EzOvVNBnJVEnwXdNiQzdHiStr+obggbHkD1k
 jOnrZjV4FONgzzCzFM8DKTideNdRr30+VWe0Q1j98KVLiN/Y2mftNXOxbU0mZUPXjBMv
 /tHg+P6RUdZWyrdycd7CEwhfBkThnf/SGQIrB7ggdsReRCjXFDJRGOMURnp6OtJ25n7Q
 GkWoOk2xAqVxVCFV1UYAo8dkyP7KHSYGQY1wMJAJbx6Ni6H2eBruLlGR7eVmyEfpdRLM
 G/wz+dTV+Cl13YJ4RO6PCSDPuKvyPSqSR1lLdVMxIOIAf2q4Z5pO3DdJowwtsCGsTqMz
 /A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849871; x=1725454671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75zSlLwUuo3vTsXNiB/Bg248lll9xEE0NLqRnWuoevM=;
 b=rrT0r4R6EKCLU7qrYddx92NPbO+lZzgZQbi1Lje5ofTF4C0rWiVYI+f0KrGtR4N83Z
 HPMx11fN8Xd1FaUUhhWKwJCgrPdDd+epwBJJyPSpa8i6820NSsKGhqWm5dWOdcUmWUaP
 rNfkef6xuvwcchAnlRmQUEvyrPm78Z52uzNN9ngPlDcoxEkM8tpagtWGkt7JY7n6rLp7
 N1X8WQHSz5dzcNQ9BnxBAqwDNvWnYE6dCWDwYCpD5+TpXyuvR38Z6oz+qPXaT6Y0Nbz+
 icaFyyPslsgj8ZVr9E80o8ti91cIb91UjxzxWat2yQ1aWDkmlT+kHJ2q0amk7HvFR65q
 yn3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrPphCu9Z+ALpd0eEbgxC3ocFqVIO/PPR8EUHCcLDXbpCKK69lrJNlHoEqhZw31khhXZgT1TFUAXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynjyIlqYzuaIOhuRsk9F6QN1GQd7YUc6FIecDs6aXWEjKI7GUb
 KFBBH7vAeSFazOLKSr51VctYi0qn78C7AOsoLl9G70Mq0V5zuVlkAWAUvXJVKrscd6wDZYDOlHK
 dqBPkJmxFVX3tucZLPnXejoQ4mc4=
X-Google-Smtp-Source: AGHT+IGVdDZRdAbiWZ5RYcs75Y+9kyklByrS1cllsDWIp6LEk4Cl8MdoT9mGOnGBew4RhB5tPSnWZccJF6guOMsDPnY=
X-Received: by 2002:a05:6214:320c:b0:6c1:5283:e67b with SMTP id
 6a1803df08f44-6c16deb306dmr178438206d6.47.1724849871190; Wed, 28 Aug 2024
 05:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-2-laoar.shao@gmail.com>
 <lql4y2nvs3ewadszhmv4m6fnqja4ff4ymuurpidlwvgf4twvru@esnh37a2jxbd>
In-Reply-To: <lql4y2nvs3ewadszhmv4m6fnqja4ff4ymuurpidlwvgf4twvru@esnh37a2jxbd>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 28 Aug 2024 20:57:13 +0800
Message-ID: <CALOAHbCR52PSzc2JMN+kwJZW-b1yPzSgqznzmcE9Ldp3nx9=XQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] Get rid of __get_task_comm()
To: Alejandro Colomar <alx@kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
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

On Wed, Aug 28, 2024 at 6:15=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> Hi Yafang,
>
> On Wed, Aug 28, 2024 at 11:03:14AM GMT, Yafang Shao wrote:
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
> >  include/linux/sched.h | 32 ++++++++++++++++++++++++++------
> >  kernel/kthread.c      |  2 +-
> >  4 files changed, 28 insertions(+), 18 deletions(-)
> >
>
> [...]
>
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index f8d150343d42..c40b95a79d80 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
>
> [...]
>
> > @@ -1914,10 +1917,27 @@ static inline void set_task_comm(struct task_st=
ruct *tsk, const char *from)
> >       __set_task_comm(tsk, from, false);
> >  }
> >
> > -extern char *__get_task_comm(char *to, size_t len, struct task_struct =
*tsk);
> > +/*
>
> [...]
>
> > + * - ARRAY_SIZE() can help ensure that @buf is indeed an array.
> > + */
> >  #define get_task_comm(buf, tsk) ({                   \
> > -     BUILD_BUG_ON(sizeof(buf) !=3D TASK_COMM_LEN);     \
> > -     __get_task_comm(buf, sizeof(buf), tsk);         \
> > +     strscpy(buf, (tsk)->comm, ARRAY_SIZE(buf));     \
>
> I see that there's a two-argument macro
>
>         #define strscpy(dst, src)       sized_strscpy(dst, src, sizeof(ds=
t))

This macro is defined in arch/um/include/shared/user.h, which is not
used outside
the arch/um/ directory.
This marco should be addressed.

>
> which is used in patch 2/8

The strscpy() function used in this series is defined in
include/linux/string.h, which already checks whether the input is an
array:

#define __strscpy0(dst, src, ...)       \
        sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst))
#define __strscpy1(dst, src, size)      sized_strscpy(dst, src, size)

#define __strscpy_pad0(dst, src, ...)   \
        sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array(dst))
#define __strscpy_pad1(dst, src, size)  sized_strscpy_pad(dst, src, size)


>
>         diff --git a/kernel/auditsc.c b/kernel/auditsc.c
>         index 6f0d6fb6523f..e4ef5e57dde9 100644
>         --- a/kernel/auditsc.c
>         +++ b/kernel/auditsc.c
>         @@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
>                 context->target_uid =3D task_uid(t);
>                 context->target_sessionid =3D audit_get_sessionid(t);
>                 security_task_getsecid_obj(t, &context->target_sid);
>         -       memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
>         +       strscpy(context->target_comm, t->comm);
>          }
>
>          /**
>
> I propose modifying that macro to use ARRAY_SIZE() instead of sizeof(),
> and then calling that macro here too.  That would not only make sure
> that this is an array, but make sure that every call to that macro is an
> array.  An if there are macros for similar string functions that reduce
> the argument with a usual sizeof(), the same thing could be done to
> those too.

I have no preference between using ARRAY_SIZE() or sizeof(dst) +
__must_be_array(dst). However, for consistency, it might be better to
use ARRAY_SIZE().


--
Regards

Yafang
