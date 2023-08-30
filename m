Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B440B78D68B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 16:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D92210E0BE;
	Wed, 30 Aug 2023 14:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C9610E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:29:47 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5717f7b932aso3385573eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693405786; x=1694010586; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlttlEDqW9alqjgAxWGl4jxgD1Wge7MwJD361d8FLtw=;
 b=a3WRscO9Ebo0rmXbEr6juKXfuVqocHUExBpqmR11QwmgY/0x/r0lXOcz6A0EEsuFVE
 nwDRaNFSK6NOIo31z7ly+vlSZORZr15nrecAgN5Gb2ZN5zoUg9qBMd9AqAwRJvn2Wj7O
 AOeHxpfC7lG71kunQQwvlJq4X+qRwLPxRoBLXls2Fwkxk3mQcnnJU9QuB1x5HgpJK7KI
 Dj6ru1k8FHcH78kuelUmQov06FDNneIcZPIww4Fgp4RcQhll+UFCFofgKO3U6O7Fmugy
 BTL8jU8Lf6eqZaT7EfGMCQqnaUqeP+qjt1FoTpIXipV8ZLqliX+zID/m2AYGm9gAhfRW
 csKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693405786; x=1694010586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlttlEDqW9alqjgAxWGl4jxgD1Wge7MwJD361d8FLtw=;
 b=Su6rRJbRKNLR2m2qBO3fZW935m1UKxZKEg7bZ0z0tPACtIzVwVOlUxQiIpe3dg8oiF
 SGUJISz9MxHdrX480Ah9iZ9sxDQkmoQLTJcIHHJMAhUPjU1kbcpsoaVGS0ut7mnpqCOk
 RWujVq4AMkcqfIzNW3a1x00t6aoPmn9NE6F+cce8+/V84J9SsKqAu9I1n1A+XhObIsUg
 9cmoUUEaOqhfyBu/BN5EyGRq6/Nwsy1FrCIoB0YFMEQJJ7rs49KA9Z/ilPep3DOtUsPz
 WtIdSspGocwT/+zlfc2wL23Cd0ODBLXGnzqTwjeENl6yPHefBE1MMXFQvrXiy5Vu08iQ
 jwKQ==
X-Gm-Message-State: AOJu0YwEGrLW8Tiin4xBRBbUlIk2PkfCWkzScO1lNszk1Fl0bgVUbXyC
 p6aC9gC3smNBnEwUZ1/Xyzmv7UT2VN0ZUKfoI9Q=
X-Google-Smtp-Source: AGHT+IHJoeozkJNRqDb9wU0X9eZUS4CXC4PL8HeApeKCunqAEMeImyi5O69r6+qX4aHDquXPNOTkCV+WuexgXtraVp4=
X-Received: by 2002:a4a:3906:0:b0:56d:2229:5f94 with SMTP id
 m6-20020a4a3906000000b0056d22295f94mr2120964ooa.6.1693405786336; Wed, 30 Aug
 2023 07:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
 <721a70c347d82931d12e5b75b19d132f82ee5ed2.camel@redhat.com>
In-Reply-To: <721a70c347d82931d12e5b75b19d132f82ee5ed2.camel@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 17:29:09 +0300
Message-ID: <CAHp75VdS=kSWnz8FzHcdrZPaeZKsQNbzjE9mNN7BDvZA_nQpaA@mail.gmail.com>
Subject: Re: [PATCH 1/5] string.h: add array-wrappers for (v)memdup_user()
To: pstanner@redhat.com
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 5:19=E2=80=AFPM <pstanner@redhat.com> wrote:
> On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> > On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner <pstanner@redha=
t.com>
> > wrote:

> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> >
> > I'm wondering if this has no side-effects as string.h/string.c IIRC
> > is
> > used also for early stages where some of the APIs are not available.
> >
> > > @@ -6,6 +6,8 @@
> > >  #include <linux/types.h>       /* for size_t */
> > >  #include <linux/stddef.h>      /* for NULL */
> > >  #include <linux/errno.h>       /* for E2BIG */
> > > +#include <linux/overflow.h>    /* for check_mul_overflow() */
> > > +#include <linux/err.h>         /* for ERR_PTR() */
> >
> > Can we preserve order (to some extent)?
>
> Sure. I just put it there so the comments build a congruent block.
> Which order would you prefer?

Alphabetical.

compiler.h
err.h
overflow.h
...the rest that is a bit unordered...

> > >  #include <linux/stdarg.h>
> > >  #include <uapi/linux/string.h>

...

> > > +/**
> > > + * memdup_array_user - duplicate array from user space
> >
> > > + *
> >
> > Do we need this blank line?
>
> I more or less directly copied the docstring format from the original
> functions (v)memdup_user() in mm/util.c
> I guess this is common style?

I think it's not. But you may grep kernel source tree and tell which
one occurs more often with or without this (unneeded) blank line.

> > > + * @src: source address in user space
> > > + * @n: number of array members to copy
> > > + * @size: size of one array member
> > > + *
> > > + * Return: an ERR_PTR() on failure.  Result is physically
> > > + * contiguous, to be freed by kfree().
> > > + */

...

> > > +/**
> > > + * vmemdup_array_user - duplicate array from user space
> >
> > > + *
> >
> > Redundant?
>
> No, there are two functions:
>  * memdup_array_user()
>  * vmemdup_array_user()
>
> On the deeper layers they utilize kmalloc() or kvmalloc(),
> respectively.

I guess you misunderstood my comment. I was talking about kernel doc
(as in the previous function).

> > > + * @src: source address in user space
> > > + * @n: number of array members to copy
> > > + * @size: size of one array member
> > > + *
> > > + * Return: an ERR_PTR() on failure.  Result may be not
> > > + * physically contiguous.  Use kvfree() to free.
> > > + */


--=20
With Best Regards,
Andy Shevchenko
