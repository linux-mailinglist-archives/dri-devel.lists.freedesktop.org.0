Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C69880EA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 10:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E6910EC86;
	Fri, 27 Sep 2024 08:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A9d2dLx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329F10EC86
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 08:58:03 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-49bdc6e2e2cso734118137.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727427483; x=1728032283; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eg8VUnCWU6xpmCG+ce1Tu7r95og6PEk5nWNUF8PLnD0=;
 b=A9d2dLx91wrnB82/wvuB0u8kXPtObMZ/puu8CJ5vB/Je7KMpyNP0YYCKbmt1h5aEvI
 8tl6nrG+KYyomMarDd7iTlzAlYhihRiFJqCp1k8NSdcgfa3guD7NZYXHWozJdUdSlaPA
 vlZ41VpRyIyO7jNeh81Or/Qqy2MARfakwJpAQlxp4HdJg8MkreIJ84iJQMGfU0KxMdLM
 UBMDs6k+U0pIrfKZTGE7wDEvYswBTA/Tmghv1WQF094AHoMUHT9d8AiDDUYTagzVU3LV
 iDJXSuxkRKanPSVVBL0TLukQQKQvyuyQAn/TYx744Cg6d33sQnhC+c9IOHJrdvRDw8ED
 +3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727427483; x=1728032283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eg8VUnCWU6xpmCG+ce1Tu7r95og6PEk5nWNUF8PLnD0=;
 b=WlLkGu+snLNedFzuFUqcXmZG2dajXTo1Do3BIQG6NL1CeLZF8MPh91PkWPwUXVsVEf
 juqTLlQYu0eRx+el41fyFjfZRJFgfxrKNVtaNfYK3lGv+8ztN6Miz3KJv0vUOJjNDla9
 rBZ6Bfi4xGXHDMJDkod9+m9K/QBgRRJ22eb63sQpyUtnWy/IeWqEtNj27hgVCQUM/tED
 Q9R5//jKFklVmzlX7rrSUvW3J7mi95ZblR9BOs73OvoS0s05osWaXBfVAqqHQ3IRY/pi
 1APGAskJM1K2F/dn6TF+L1xVEvsTvQxVUWikqC0UggXfC9spV+6b7lc6p5tC3v85ak4s
 zeJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFBEvmSx+5QGqUKkCPt+pWVYHGqqw4zs9IGyshG1eFj9WApfO5Bj92eCHQB6Ndyu6eGtU6Ke0URCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3STMYLWt8G3UB5Wm/OpsENyw2DwhJ2dhAXrUyyzkesRZoDwst
 WU23Coobg7H3CZCvLjjglw2M4fFHAUo6D0UmmcX0I3THUKZ3BcBxYPjOvGMlEL+VtTA+2gERqu6
 EL6nKZH685uf3zuwz/tRddkUGp2U=
X-Google-Smtp-Source: AGHT+IHlhccJP6o8YVDcpGsoOKh73nleQWjN6gMlntdM8azrnOLgCbN569DWouWNGBJF/Vf+8gknJS6h6du5PlKNbYc=
X-Received: by 2002:a05:6102:2ac4:b0:49b:e9fc:14d2 with SMTP id
 ada2fe7eead31-4a2d7ff9815mr2856108137.23.1727427482685; Fri, 27 Sep 2024
 01:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
 <CAHp75VdpG=yQVaJLR3J5puwj4FYWtXzaHkC1TdmiqfJu1s9PpA@mail.gmail.com>
In-Reply-To: <CAHp75VdpG=yQVaJLR3J5puwj4FYWtXzaHkC1TdmiqfJu1s9PpA@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 27 Sep 2024 16:57:26 +0800
Message-ID: <CALOAHbBHV_xB88AD8azVXZQzdowLtU6EHewFGUtPHQE9K6GQ_Q@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, alx@kernel.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com,
 rostedt@goodmis.org, catalin.marinas@arm.com, 
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, Sep 27, 2024 at 1:35=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Sep 26, 2024 at 7:44=E2=80=AFPM Yafang Shao <laoar.shao@gmail.com=
> wrote:
> >
> > In kstrdup(), it is critical to ensure that the dest string is always
> > NUL-terminated. However, potential race condidtion can occur between a
>
> condition
>
> > writer and a reader.
> >
> > Consider the following scenario involving task->comm:
> >
> >     reader                    writer
> >
> >   len =3D strlen(s) + 1;
> >                              strlcpy(tsk->comm, buf, sizeof(tsk->comm))=
;
> >   memcpy(buf, s, len);
> >
> > In this case, there is a race condition between the reader and the
> > writer. The reader calculate the length of the string `s` based on the
>
> calculates
>
> > old value of task->comm. However, during the memcpy(), the string `s`
> > might be updated by the writer to a new value of task->comm.
> >
> > If the new task->comm is larger than the old one, the `buf` might not b=
e
> > NUL-terminated. This can lead to undefined behavior and potential
> > security vulnerabilities.
> >
> > Let's fix it by explicitly adding a NUL-terminator.
>
> memcpy() is not atomic AFAIK, meaning that the new string can be also
> shorter and when memcpy() already copied past the new NUL. I would
> amend the explanation to include this as well.
>
> ...
>
> > +               /* During memcpy(), the string might be updated to a ne=
w value,
> > +                * which could be longer than the string when strlen() =
is
> > +                * called. Therefore, we need to add a null termimator.
>
> /*
>  * The wrong comment style. Besides that a typo
>  * in the word 'terminator'. Please, run codespell on your changes.
>  * Also use the same form: NUL-terminator when you are talking
>  * about '\0' and not NULL.
>  */

Thank you for pointing out these errors and for recommending the use
of codespell.
Will fix them in the next version.

--=20
Regards
Yafang
