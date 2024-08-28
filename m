Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0F9628E7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37F910E523;
	Wed, 28 Aug 2024 13:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmMbkMVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9B410E523
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:41:15 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4567dd6f77fso486351cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724852474; x=1725457274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZM22fWGyfP7pTHMrkwvXyYB2yArAZ5REiY88yMWxV58=;
 b=fmMbkMVEDfVrNyyznKt1NOKadwTRai1IsIUV5EPQwTQ0NYZqcKjC6ytaGViDU7t1t1
 bK+3Lq9qM1G8p+honYpIHLUGm4ChjWTmzNyiHh8CloFhJO/crmKQP7V0RoWFC8JyQmDq
 1/96tyc5dgjCx28Cav60FADhlFo/DZ2z5wYdPUPsKqT90j2LU01RWI7qRpQqxbKjZkqu
 ffg8a0f1fuhl5CuhzYPWAXmoTOLtPPhK9aw/sOD2+cqRuNlvCiJFT+KD5c9AXbUvCdOT
 rrMV7mlRNK7fooS8DbzpT5IIZC5gRmm5K7Do6zKh+LO0AXPz7KvpG1E+uVfXE7xlKNUk
 09gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724852474; x=1725457274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZM22fWGyfP7pTHMrkwvXyYB2yArAZ5REiY88yMWxV58=;
 b=ISnxSrsXQvqRTVu0RWGTOMVCSXLeK4saXL32FNsaKr3Hx1DyqGP+EO6B2vh1vtj/np
 KASkgOYGTda0DA61bSw+A27im9LNOroRinWkxxBuY0OnrWZBc8paVme6j9HLQDXny4LD
 Xzv8Oaojumwpw6kW6/XPgLg6T1NA5sIQU/r1Y98OkBPYGpO5aQMNtlNz/DxRt66VYPAO
 mtiCXhZ6udEZZdhZf+ntXqqrTDphDkZkjSaz8D7EFb5dsIAF5H9hbzLuH22+RNrfcivW
 jKZ4YNqOGDfVppCgZFXtg/E9CkTs4Gmy6k1p4hnUBzEqJgxi8LvWTzynutnn+iqKFjCw
 k60g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjwcFya9zpu8+tj+fUt6jQ0V+kX/U70V6LBizu62obQZv4hianLjqTTOWGebg3RLO77ESmBLdhUy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXZoQSAZiUzrTBinDtGyAhkG+GIJsVl1ehrEZleXL2EL7LqUIX
 k5dvTEbhNrrtfWM4rKONBEJ91R5fP5AcvLuxLDV61SGErrMVz3XZHxRMxVgMwkDlB+MPomnzEyZ
 TUXjFR2oN8g56OgQ11jcttj/1jaE=
X-Google-Smtp-Source: AGHT+IEyHFAeIj+i9dwO5uOiV3XCouo/U0KX68AiGeUIHgmLKbuZ6ld4KcpgR5tcN/ds4tOwYEpli4MYtWggh3QrvFs=
X-Received: by 2002:a05:6214:448e:b0:6c1:84ce:8f31 with SMTP id
 6a1803df08f44-6c335c60e6emr43501846d6.0.1724852473892; Wed, 28 Aug 2024
 06:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-2-laoar.shao@gmail.com>
 <lql4y2nvs3ewadszhmv4m6fnqja4ff4ymuurpidlwvgf4twvru@esnh37a2jxbd>
 <n2fxqs3tekvljezaqpfnwhsmjymch4vb47y744zwmy7urf3flv@zvjtepkem4l7>
In-Reply-To: <n2fxqs3tekvljezaqpfnwhsmjymch4vb47y744zwmy7urf3flv@zvjtepkem4l7>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 28 Aug 2024 21:40:35 +0800
Message-ID: <CALOAHbBAYHjDnKBVw63B8JBFc6U-2RNUX9L=ryA2Gbz7nnJfsQ@mail.gmail.com>
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

On Wed, Aug 28, 2024 at 8:58=E2=80=AFPM Alejandro Colomar <alx@kernel.org> =
wrote:
>
> On Wed, Aug 28, 2024 at 12:15:40PM GMT, Alejandro Colomar wrote:
> > Hi Yafang,
> >
> > On Wed, Aug 28, 2024 at 11:03:14AM GMT, Yafang Shao wrote:
> > > We want to eliminate the use of __get_task_comm() for the following
> > > reasons:
> > >
> > > - The task_lock() is unnecessary
> > >   Quoted from Linus [0]:
> > >   : Since user space can randomly change their names anyway, using lo=
cking
> > >   : was always wrong for readers (for writers it probably does make s=
ense
> > >   : to have some lock - although practically speaking nobody cares th=
ere
> > >   : either, but at least for a writer some kind of race could have
> > >   : long-term mixed results
> > >
> > > - The BUILD_BUG_ON() doesn't add any value
> > >   The only requirement is to ensure that the destination buffer is a =
valid
> > >   array.
> > >
> > > - Zeroing is not necessary in current use cases
> > >   To avoid confusion, we should remove it. Moreover, not zeroing coul=
d
> > >   potentially make it easier to uncover bugs. If the caller needs a
> > >   zero-padded task name, it should be explicitly handled at the call =
site.
> > >
> > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > Link: https://lore.kernel.org/all/CAHk-=3DwivfrF0_zvf+oj6=3D=3DSh=3D-=
npJooP8chLPEfaFV0oNYTTBA@mail.gmail.com [0]
> > > Link: https://lore.kernel.org/all/CAHk-=3DwhWtUC-AjmGJveAETKOMeMFSTwK=
wu99v7+b6AyHMmaDFA@mail.gmail.com/
> > > Suggested-by: Alejandro Colomar <alx@kernel.org>
> > > Link: https://lore.kernel.org/all/2jxak5v6dfxlpbxhpm3ey7oup4g2lnr3ueu=
rfbosf5wdo65dk4@srb3hsk72zwq
> > > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > > Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> > > Cc: Christian Brauner <brauner@kernel.org>
> > > Cc: Jan Kara <jack@suse.cz>
> > > Cc: Eric Biederman <ebiederm@xmission.com>
> > > Cc: Kees Cook <keescook@chromium.org>
> > > Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> > > Cc: Matus Jokay <matus.jokay@stuba.sk>
> > > Cc: Alejandro Colomar <alx@kernel.org>
> > > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > > ---
> > >  fs/exec.c             | 10 ----------
> > >  fs/proc/array.c       |  2 +-
> > >  include/linux/sched.h | 32 ++++++++++++++++++++++++++------
> > >  kernel/kthread.c      |  2 +-
> > >  4 files changed, 28 insertions(+), 18 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > index f8d150343d42..c40b95a79d80 100644
> > > --- a/include/linux/sched.h
> > > +++ b/include/linux/sched.h
> >
> > [...]
> >
> > > @@ -1914,10 +1917,27 @@ static inline void set_task_comm(struct task_=
struct *tsk, const char *from)
> > >     __set_task_comm(tsk, from, false);
> > >  }
> > >
> > > -extern char *__get_task_comm(char *to, size_t len, struct task_struc=
t *tsk);
> > > +/*
> >
> > [...]
> >
> > > + * - ARRAY_SIZE() can help ensure that @buf is indeed an array.
> > > + */
> > >  #define get_task_comm(buf, tsk) ({                 \
> > > -   BUILD_BUG_ON(sizeof(buf) !=3D TASK_COMM_LEN);     \
> > > -   __get_task_comm(buf, sizeof(buf), tsk);         \
> > > +   strscpy(buf, (tsk)->comm, ARRAY_SIZE(buf));     \
> >
> > I see that there's a two-argument macro
> >
> >       #define strscpy(dst, src)       sized_strscpy(dst, src, sizeof(ds=
t))
> >
> > which is used in patch 2/8
> >
> >       diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> >       index 6f0d6fb6523f..e4ef5e57dde9 100644
> >       --- a/kernel/auditsc.c
> >       +++ b/kernel/auditsc.c
> >       @@ -2730,7 +2730,7 @@ void __audit_ptrace(struct task_struct *t)
> >               context->target_uid =3D task_uid(t);
> >               context->target_sessionid =3D audit_get_sessionid(t);
> >               security_task_getsecid_obj(t, &context->target_sid);
> >       -       memcpy(context->target_comm, t->comm, TASK_COMM_LEN);
> >       +       strscpy(context->target_comm, t->comm);
> >        }
> >
> >        /**
>
> Ahh, the actual generic definition is in <include/linux/string.h>.
> You could do
>
>         diff --git i/include/linux/string.h w/include/linux/string.h
>         index 9edace076ddb..060504719904 100644
>         --- i/include/linux/string.h
>         +++ w/include/linux/string.h
>         @@ -76,11 +76,11 @@ ssize_t sized_strscpy(char *, const char *, s=
ize_t);
>           * known size.
>           */
>          #define __strscpy0(dst, src, ...)      \
>         -       sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst=
))
>         +       sized_strscpy(dst, src, ARRAY_SIZE(dst))
>          #define __strscpy1(dst, src, size)     sized_strscpy(dst, src, s=
ize)
>
>          #define __strscpy_pad0(dst, src, ...)  \
>         -       sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array=
(dst))
>         +       sized_strscpy_pad(dst, src, ARRAY_SIZE(dst))
>          #define __strscpy_pad1(dst, src, size) sized_strscpy_pad(dst, sr=
c, size)
>
>          /**

Thank you for your suggestion. How does the following commit log look
to you? Does it meet your expectations?

    string: Use ARRAY_SIZE() in strscpy()

    We can use ARRAY_SIZE() instead to clarify that they are regular charac=
ters.

    Co-developed-by: Alejandro Colomar <alx@kernel.org>
    Signed-off-by: Alejandro Colomar <alx@kernel.org>
    Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

diff --git a/arch/um/include/shared/user.h b/arch/um/include/shared/user.h
index bbab79c0c074..07216996e3a9 100644
--- a/arch/um/include/shared/user.h
+++ b/arch/um/include/shared/user.h
@@ -14,7 +14,7 @@
  * copying too much infrastructure for my taste, so userspace files
  * get less checking than kernel files.
  */
-#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]) + __must_be_array(x))

 /* This is to get size_t and NULL */
 #ifndef __UM_HOST__
@@ -60,7 +60,7 @@ static inline void print_hex_dump(const char *level,
const char *prefix_str,
 extern int in_aton(char *str);
 extern size_t strlcat(char *, const char *, size_t);
 extern size_t sized_strscpy(char *, const char *, size_t);
-#define strscpy(dst, src)      sized_strscpy(dst, src, sizeof(dst))
+#define strscpy(dst, src)      sized_strscpy(dst, src, ARRAY_SIZE(dst))

 /* Copied from linux/compiler-gcc.h since we can't include it directly */
 #define barrier() __asm__ __volatile__("": : :"memory")
diff --git a/include/linux/string.h b/include/linux/string.h
index 9edace076ddb..060504719904 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h

@@ -76,11 +76,11 @@ ssize_t sized_strscpy(char *, const char *, size_t);
  * known size.
  */
 #define __strscpy0(dst, src, ...)      \
-       sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst))
+       sized_strscpy(dst, src, ARRAY_SIZE(dst))
 #define __strscpy1(dst, src, size)     sized_strscpy(dst, src, size)

 #define __strscpy_pad0(dst, src, ...)  \
-       sized_strscpy_pad(dst, src, sizeof(dst) + __must_be_array(dst))
+       sized_strscpy_pad(dst, src, ARRAY_SIZE(dst))
 #define __strscpy_pad1(dst, src, size) sized_strscpy_pad(dst, src, size)

 /**

--
Regards

Yafang
