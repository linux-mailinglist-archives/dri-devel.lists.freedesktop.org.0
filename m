Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C4A8AB7E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 00:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444810E186;
	Tue, 15 Apr 2025 22:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nczuRMFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86F310E162;
 Tue, 15 Apr 2025 22:49:29 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso4882283276.1; 
 Tue, 15 Apr 2025 15:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744757368; x=1745362168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBy/k/5Nk+oz59QuiwTpYbqHNj2ov+/FVca+4VwHPcw=;
 b=nczuRMFjqzglA4pEN9AlOibu/eUq5Y+1iJvK1roWAFAYAex7T11wTb0rOyiR3TYw7i
 uGmzt1GjJBDhh3VlINzIylIc7RU33hwC9JmFqK5oYYWJZzvcxAwcTNsIGpW/0S+LouB/
 +NmefXrnvxxxB0Jtawq5c++k7h4I3RUNtNXrAE5qHPk6v0ueyudx8H6h6cWgcRj3eo4C
 THbka2N7btbJdisAAcjFEwu1l8BjSanCiupXSKGYIT2drWJ2Q/nGcqQcBVNaAOK/VTt6
 GZqgSYSenpwbdAqu8BmbhfX/49mdFfScIGecR2BaME+Lt77x8lu4xSb1+5/0/YFio56P
 GHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744757368; x=1745362168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBy/k/5Nk+oz59QuiwTpYbqHNj2ov+/FVca+4VwHPcw=;
 b=hXvHNdp044vv0JMQtHJk0YbTQFr8jmmj55iGwGX2mSsX6B37VmN1eWi7JHZWQ4Ol3J
 4cfeWvqWrXGpxj+kj8jbYmUo7HjUDfafNlD7N52e92KmWoM8F2I7F3LzD1O55w1thd6z
 EHc/LmjJhbDY3Y/2d4pZ9UdgVRceua5ckcHLxsIhAB3PJH2H8VIOuEeMkg9i4zZjOEq2
 2oXzHUPiaUMc5gtNxOhSQArtaVmS/1PqO2z2FWL9tsCPR+h6n98NDaWDz80S81bqZNRQ
 EUwywgZq2VTPX8tSMHfN9ktJ6/se/m903qt0uuCCNokMhHEyrRq+tBZoB2ta8S53oyYx
 GgNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUazlzvwYHy+qjhJsXmXY2WtQJ/pkQKXiz7/lliPo86jG4ALCukwwj3pjvdgaDHtLP/btxI8/RttjvsknHd/w==@lists.freedesktop.org,
 AJvYcCWQc+mY5egFjE/uuM9iPAtgUEYiVa13L54FJO1cZa8HqxcRI9Le77koXpVRu6+Ldqy03BiNvuZEq24s@lists.freedesktop.org,
 AJvYcCWwkJc3/e4EEQuqihF7MkeK5YlWb5wJ1iQlihEVz3C/NphxJ5WtKJkb4pNW0Xzy0P1wQZLDm+La@lists.freedesktop.org,
 AJvYcCXK5Pg9jXFBHHt4Bs3RJGjmm9hDtjHCNhC82e7vFPOvFNB1fvvvfKF4GVOa3gxk5aE28LHmF1o6GLtW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk9qrg/dSqTYrqXkcYgWKPVfo3BxeFXQ2nIPpvuoDW9zoP5ZYK
 Ie1gCIqRvM2y1ZiSJGKDvjm9TE+pAsfzmpbwZcJVPpR7poOaWfZW1th8ct3sxqGwkSCP7CmTQ4T
 6GjwtD10qm3PBjMv+mC4hLsCAPPs=
X-Gm-Gg: ASbGncvmvZzKYuef/lZAa0a3C/i1i5O48Y3+fxzs+5JhkqwPBtptmJok2jnLVlC8OLC
 AhlIjxNWBt+hjD2+b2fgWj9S+lwRFHvsBSAoxmWUqytNygsrgXKLvKvgqwJP9UYU7xjb5BY0G2f
 f3ybmA66BO9JSZCaRudA4o
X-Google-Smtp-Source: AGHT+IHKwNRtebTsCB1ynvwlleGqOBo6vd1fadMzVDtULsLDAE2yNxumOT7/yZv12UgE0QLbAucJrcqv9ZjoW7UMOwc=
X-Received: by 2002:a05:690c:3707:b0:702:195b:7ebe with SMTP id
 00721157ae682-706acee3f2bmr16326777b3.22.1744757368597; Tue, 15 Apr 2025
 15:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-27-jim.cromie@gmail.com>
 <cb9fc7d1-9533-495b-83e1-6950bdd45e85@bootlin.com>
In-Reply-To: <cb9fc7d1-9533-495b-83e1-6950bdd45e85@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 16:49:02 -0600
X-Gm-Features: ATxdqUEynsfg7YuXOle9oKp2N721l58a4kxxw0vTAgdjbpOnM2FgU5Sva6pebu0
Message-ID: <CAJfuBxxGRujd01b=Ou3MDL8XxX0kOHS9LHWQZMC8xGy+uESqOg@mail.gmail.com>
Subject: Re: [PATCH v3 26/54] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
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

On Tue, Apr 15, 2025 at 4:06=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
> > (expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy becaus=
e
> > the invoked macro has a do-while-0 wrapper.
> >
> >     if (cond && (drm_dbg("expr-form"),1)) {
> >        ... do some more stuff
> >     }
> >
> > Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
> > macros into expressions, by replacing the do-while-0s with a ({ })
> > wrapper.  In the common usage, the trailing ';' converts the
> > expression into a statement.
> >
> >     drm_dbg("statement form");
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > ---
> >   include/linux/dynamic_debug.h | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index ce221a702f84..2d87cca27544 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -337,20 +337,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descript=
or,
> >    * (|_cls): adds in _DPRINT_CLASS_DFLT as needed
> >    * (|_no_desc):     former gets callsite descriptor as 1st arg (for p=
rdbgs)
> >    */
> > -#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {        \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);      \
> > +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({  \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
>
> You remove the protection around id here.
>
> >       if (DYNAMIC_DEBUG_BRANCH(id))                           \
> > -             func(&id, ##__VA_ARGS__);                       \
> > -} while (0)
> > +             func(&(id), ##__VA_ARGS__);                     \
>
> But you add the protection here.
>
> I think in macro it is better to be defensive, so I expect to have ()
> everywhere (except places where it breaks the compilation).
>

yeah, Im a bit inconsistent.
defensive parens are almost never a compilation err.
I'll go thru the macros again


> > +})
> >   #define __dynamic_func_call(id, fmt, func, ...)                      =
       \
> >       __dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,           \
> >                               func, ##__VA_ARGS__)
> >
> > -#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do { =
       \
> > +#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({  \
> >       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);                \
> >       if (DYNAMIC_DEBUG_BRANCH(id))                                   \
> >               func(__VA_ARGS__);                                      \
> > -} while (0)
> > +})
> >   #define __dynamic_func_call_no_desc(id, fmt, func, ...)              =
       \
> >       __dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,        \
> >                                       fmt, func, ##__VA_ARGS__)
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
