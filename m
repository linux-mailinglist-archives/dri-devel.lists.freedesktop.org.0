Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5239084B1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192FD10EC56;
	Fri, 14 Jun 2024 07:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B2tBSWJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EC310EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:10:54 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-63186c222eeso3659637b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 05:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718280653; x=1718885453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jilhcaruJb2IBiLjemWE46i5/PUFqJsWXVunml9StIM=;
 b=B2tBSWJl0GzCr6OjOoBhvJV6kRZzYssVuCSgAepLsBagjJBcNZVzoWK1VVA/V5YusK
 WlJcEdAEpUyFh3S6783EGxL93ztCAmUoy2dxa6Fik/l8gQXEEQD+g32OewuHBTVV4FNS
 8cb2SEmqVvbCr2nXvguLfufAN90VVZh6mePy34dfknuqO7+ZhcI7m2IEpxIXL6UMjiTN
 jDkYWQlA3Q9WZfuVgcyks4kyB5QwJPMiwn7XUNYdTppKPf6Qhs8tRLMALEiZAZyI+7ly
 47PEiWA12knTRbi7v4diAQ/FfVYPeTsaF/W1TxS1UMF3vRWcQ/hNproB6VKU3H3fLKrV
 GSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718280653; x=1718885453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jilhcaruJb2IBiLjemWE46i5/PUFqJsWXVunml9StIM=;
 b=oW6rHbgDuKDPBO4JgnsGGyODQWXATScez3c79ybXlOY2g8x2jrmBvc5n0cKGhvRIhO
 IaxkimiV2Q5+AZzoZN1iA7CcLN1WnMyaOXROBU4yx9szKnMHij5rR+RgwwYsJeaUdMoY
 dEmBDLsfSH3QUzVR8/wxN/DTqoFp7tFsp9b4cn2tBFBmNdpz/XPOrp4rgEOCFt62MGeC
 zUlrIioAQ+Df7FIDwSoaYVZJMftI3138LcEoFxgtMoKwQtILhL/6BA/2K+ktN1WJWOKa
 W1i2zK6U7dkyTrnGnhvicI9IyLhTtXKwkUyFwxl7mzclvRF6I0r73HdxfJox9/5OU6vl
 Tb3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZAsi1Ja0pVBh/SNSlYOYeDjy9FRod0GyyDG8cCRLlK7sz5NFySjUJetuN5N9sFcw0hzIL0Ud9YYCz0+N542XfX2fa5900Zr6r3WTqnKQr
X-Gm-Message-State: AOJu0YwbABJ/1vTYk3534IjFbHY3qWlUpPXNQOzhzmyXGiTfufIpnYDC
 eIg3IkuOkaTukk0UqeHon+hm0k/APyu97gwB5PXEpJgi31ha/5PKVe00QTWrhJ6l3wqJDqlXEhC
 nvzKeGVhbWajwPUg0q+iV8nQGoUg=
X-Google-Smtp-Source: AGHT+IECeNpAbuMBJduU/4vfo0TDc0y586W3/bKZ6gp1RqZAixArBbb8xY+5b1a7GzKTFusgDcdldUI00nJxS7Gmy8k=
X-Received: by 2002:a05:690c:6683:b0:61a:c316:9953 with SMTP id
 00721157ae682-62fb857416emr57999367b3.11.1718280653503; Thu, 13 Jun 2024
 05:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240613023044.45873-1-laoar.shao@gmail.com>
 <20240613023044.45873-7-laoar.shao@gmail.com>
 <Zmqvu-1eUpdZ39PD@arm.com>
In-Reply-To: <Zmqvu-1eUpdZ39PD@arm.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 13 Jun 2024 20:10:17 +0800
Message-ID: <CALOAHbB3Uiwsp2ieiPZ-_CKyZPgW6_gF_y-HEGHN3KWhGh0LDg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mm/kmemleak: Replace strncpy() with
 __get_task_comm()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com, 
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:53 +0000
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

On Thu, Jun 13, 2024 at 4:37=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Thu, Jun 13, 2024 at 10:30:40AM +0800, Yafang Shao wrote:
> > Using __get_task_comm() to read the task comm ensures that the name is
> > always NUL-terminated, regardless of the source string. This approach a=
lso
> > facilitates future extensions to the task comm.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> >  mm/kmemleak.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> > index d5b6fba44fc9..ef29aaab88a0 100644
> > --- a/mm/kmemleak.c
> > +++ b/mm/kmemleak.c
> > @@ -663,13 +663,7 @@ static struct kmemleak_object *__alloc_object(gfp_=
t gfp)
> >               strncpy(object->comm, "softirq", sizeof(object->comm));
> >       } else {
> >               object->pid =3D current->pid;
> > -             /*
> > -              * There is a small chance of a race with set_task_comm()=
,
> > -              * however using get_task_comm() here may cause locking
> > -              * dependency issues with current->alloc_lock. In the wor=
st
> > -              * case, the command line is not correct.
> > -              */
> > -             strncpy(object->comm, current->comm, sizeof(object->comm)=
);
> > +             __get_task_comm(object->comm, sizeof(object->comm), curre=
nt);
> >       }
>
> You deleted the comment stating why it does not use get_task_comm()
> without explaining why it would be safe now. I don't recall the details
> but most likely lockdep warned of some potential deadlocks with this
> function being called with the task_lock held.
>
> So, you either show why this is safe or just use strscpy() directly here
> (not sure we'd need strscpy_pad(); I think strscpy() would do, we just
> need the NUL-termination).

The task_lock was dropped in patch #1 [0]. My apologies for not
including you in the CC for that change. After this modification, it
is now safe to use __get_task_comm().

[0] https://lore.kernel.org/all/20240613023044.45873-2-laoar.shao@gmail.com=
/

--=20
Regards
Yafang
