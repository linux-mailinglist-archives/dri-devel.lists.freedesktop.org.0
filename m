Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9135C78E8F1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E1710E19B;
	Thu, 31 Aug 2023 08:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B683F10E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:59:51 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56d8bc0d909so372352eaf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693472391; x=1694077191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WCBkbdNR2D/dn3x6jAE+/xbR9io7eSmxn1U8tK6k34=;
 b=HJWFARmVoH9E27BQGtkL3bO8oTmoPx++XeSDxA2grn9DmGUPte+KbMWpqI9rmgeCKk
 I5alnA8BBUs8PY9amTo/R27Mp1bLxwyKJ/hgk0X3KCOy0d40f4khQOZ4GJlS8Sr4JjgP
 tuYrWXSlMLvc+Fuz6C/oQ0fqFEBGqcayqZwW5w5VQyKEITGP9cRAMdHHMe6h8Hq61I+4
 uWB4Rtu2MgmDd2a+i0JdvFDkS7ySqkZ60B9j0bZTS4yltmAvGEpFc4oJbN+DSt2WGpd2
 jsRywrizeW8ta6qJRMMv0FYK/xEyj4vbI3+LK2xJUohCGYeHGnfNiPIEx9bLnYAsRvzD
 qzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693472391; x=1694077191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+WCBkbdNR2D/dn3x6jAE+/xbR9io7eSmxn1U8tK6k34=;
 b=ln1amMAqlo4/1ztAX3MrvgEhY6AihBz6whKw+k/4u/ElDnfRpduR5GFePiizfO2lej
 CAyTBsufo/TfHkuNy865RHJij1kpO98wP/wuPbFHulc2yovgyUfAW2W3eeE9PgvL9WF3
 sPMRwwJFOp32AnhPiy9xDlQaEAKSZZWa+jbxFqzhjeL7AFQQZjcVBIwh9LS8HeKpPc6o
 Df0Q78wZL4s/33ttGJd/naVidlTXs/diOAohqd0MdVCwQkA4ivynr5cCkx4xJT91QzRD
 wEXEWXTAMxBC4EpfmgaFB4/rpXKkCU8uq+ec9CBl1m4LNZo8KimePH6mm4TWnnPdYpQ0
 ZoOg==
X-Gm-Message-State: AOJu0YxcGHtF+ZXtEzBav/E0+3gaEvvrVHEZCqxBefZPm7pHwzbhxnZn
 NijSjbJzJf6TuJzIICdIXAaQypMGp7n3H3PPQnM=
X-Google-Smtp-Source: AGHT+IHD40W+0VPJ3vNndBJ9GxsD1cpYZQwMg37odmvA2L5FhdqLghEG+N8XXu1zSL+1GhjtspeZlpQR10ud8jErSAU=
X-Received: by 2002:a4a:2a52:0:b0:573:3711:51c4 with SMTP id
 x18-20020a4a2a52000000b00573371151c4mr4288732oox.8.1693472390851; Thu, 31 Aug
 2023 01:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693386602.git.pstanner@redhat.com>
 <46f667e154393a930a97d2218d8e90286d93a062.1693386602.git.pstanner@redhat.com>
 <CAHp75VfkzV-=XuEZwipYzfHNu4EXuwzbu6vfEKh1Uueseo2=wA@mail.gmail.com>
 <721a70c347d82931d12e5b75b19d132f82ee5ed2.camel@redhat.com>
 <CAHp75VdS=kSWnz8FzHcdrZPaeZKsQNbzjE9mNN7BDvZA_nQpaA@mail.gmail.com>
 <a4ba0493965ad32fcf95cd6e2439096668a9ed46.camel@redhat.com>
In-Reply-To: <a4ba0493965ad32fcf95cd6e2439096668a9ed46.camel@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 31 Aug 2023 11:59:14 +0300
Message-ID: <CAHp75VdqFPJAnCm9A-S+TCChr9v9_s=Wfnb5wO2=vuwp1v+JvA@mail.gmail.com>
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

On Wed, Aug 30, 2023 at 10:15=E2=80=AFPM <pstanner@redhat.com> wrote:
> On Wed, 2023-08-30 at 17:29 +0300, Andy Shevchenko wrote:
> > On Wed, Aug 30, 2023 at 5:19=E2=80=AFPM <pstanner@redhat.com> wrote:
> > > On Wed, 2023-08-30 at 17:11 +0300, Andy Shevchenko wrote:
> > > > On Wed, Aug 30, 2023 at 4:46=E2=80=AFPM Philipp Stanner
> > > > <pstanner@redhat.com>
> > > > wrote:

...

> > > > >  #include <linux/types.h>       /* for size_t */
> > > > >  #include <linux/stddef.h>      /* for NULL */
> > > > >  #include <linux/errno.h>       /* for E2BIG */
> > > > > +#include <linux/overflow.h>    /* for check_mul_overflow() */
> > > > > +#include <linux/err.h>         /* for ERR_PTR() */
> > > >
> > > > Can we preserve order (to some extent)?
> > >
> > > Sure. I just put it there so the comments build a congruent block.
> > > Which order would you prefer?
> >
> > Alphabetical.
> >
> > compiler.h
> > err.h
> > overflow.h
> > ...the rest that is a bit unordered...
> >
> > > > >  #include <linux/stdarg.h>
> > > > >  #include <uapi/linux/string.h>
>
> I mean I could include my own in a sorted manner =E2=80=93 but the existi=
ng
> ones are not sorted:

I know, that's why I put "(to some extent)" in my initial comment.

> We could sort them all, but I'd prefer to do that in a separate patch
> so that this commit does not make the impression of doing anything else
> than including the two new headers

But you can do your stuff first with better ordering than you proposed
initially, so there will be less churn for any additional change
(either that simply unifies the thing or something else).

> Such a separate patch could also unify the docstring style, see below

Sure, patches are welcome!

> > > > > +/**
> > > > > + * memdup_array_user - duplicate array from user space
> > > >
> > > > > + *
> > > >
> > > > Do we need this blank line?
> > >
> > > I more or less directly copied the docstring format from the
> > > original
> > > functions (v)memdup_user() in mm/util.c
> > > I guess this is common style?
> >
> > I think it's not. But you may grep kernel source tree and tell which
> > one occurs more often with or without this (unneeded) blank line.
>
>
> It seems to be very much mixed. string.h itself is mixed.
> When you look at the bottom of string.h, you'll find functions such as
> kbasename() that have the extra line.
>
> That's not really a super decisive point for me, though. We can remove
> the line I guess

I think the less LoCs the better generally speaking. So, if we don't
need that line and it doesn't make the readability worse, why to keep
it?

> > > > > + * @src: source address in user space
> > > > > + * @n: number of array members to copy
> > > > > + * @size: size of one array member
> > > > > + *
> > > > > + * Return: an ERR_PTR() on failure.  Result is physically
> > > > > + * contiguous, to be freed by kfree().
> > > > > + */

--
With Best Regards,
Andy Shevchenko
