Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA38A63766
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 21:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0244810E0B5;
	Sun, 16 Mar 2025 20:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gqwZ0PaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA2A10E09C;
 Sun, 16 Mar 2025 20:47:07 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so3540678276.1; 
 Sun, 16 Mar 2025 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742158021; x=1742762821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpQUNmwVK5jHLQezc5R4Z6K7OjXDtGHykFpm0bMm/ps=;
 b=gqwZ0PaGDCHDlhiFYAeB5s0a5iThjG8Ev9DC9pbqo6tYMhIGMx7Tn++0yFTLHUbpij
 ss21HzpkTDeaY0Apgei2qFoVIiAQJtXKQYvae9z36UqS1r41KwKtnEh+lLIbxI/AnSTw
 Dfw0HbqqD6ZBsDz8DoFKvW2Kh8IpM7aVJrmV18kpBageU6lV9rjfC8pb7MKPriR651Bn
 0OgLFVM85JhvbFeI/LYIyaSegg087iaa1NL8NpL3cHehnBrCKJqrWB01mE6HLdFwdj9M
 6t5S5pJrrNyX6H47cohGO5fGpX++pkh0HMLydI6mVsXBTZJ24PW37OyCYgRrQDJqWklk
 WTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742158021; x=1742762821;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YpQUNmwVK5jHLQezc5R4Z6K7OjXDtGHykFpm0bMm/ps=;
 b=jYZpIb1qTSWGPYaeK2jn9i92hOmF7mldV1lOn9Uu53ITef4lWl63ioXgHlPRinShFb
 YtIWMN2lxckCe7mO36xd8yhyUxcmYcY2DCTMwW5e9Os/iw3KZmohzqz0wv34RhWDkmYK
 rr9NPImZgqpvNbuxz1LUYy4gZQGyQdJW0xfKG7VqptMeDSFrXmj7TOmeZTU4B8OYsMGe
 GlXlTyKImlHHdwWulXAxPLq7lofiD61z4lNX6xXP9BqwTcKLQbmBU0zfLBnhKzqV8diD
 l+Dv7uQ6L7q9+2XWaazZoM09ENvNAazac8mCemcbMEvwlZZL5ROj0LyWarmokE10Z1dp
 3k/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6fW3znA+B1o+5hMXiY57vboCAvtusi8DrA8tt7TIVgJP2XysRQqaHQMLUS5fZldbrzr9tNWq7@lists.freedesktop.org,
 AJvYcCV9mCpN9gdXGTa63Q5/w5s3k5GUAtIZJJ3oWOQFow3YMPNoSlpkBGRdm34aBvHemaLcExlM4g3tbkqFKTEfftOO1g==@lists.freedesktop.org,
 AJvYcCVo2BdoC8MlTviRvXQiUNvXad89VRsgjvdJE0eHmxot9Y9pdyZJ6oYHXdMOZ645Ab7q+rBV37kD2yJs@lists.freedesktop.org,
 AJvYcCXfZPGd5fR82iJIpWUwGKm4dfXcOUf2OgbeKAVWSVWWtSHwGiNGn9gwodFXD53Ake+2daYgkIjcUjdA@lists.freedesktop.org,
 AJvYcCXuYPbL3V25L3eEwFTh9uDxsK3ZdoQDrTEonbKK9HaqpqUA+cc7uDyi1ef1luncWGvCQLTTGU1/TL+/pdgipQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn6Q75DnFrHNtimZdkvFqLgqvmAHeIhEJx6TarMzrskOPabUaM
 e0+9KfMk0Bta+iUwTP9oOJ/+wseQkIBQr7Vieuj7Rkmy8GNvYNGanEMZlgwalHkNpKIYIDBMDrT
 SwpBqo328IvOtDoXuilXPOdCmjr4=
X-Gm-Gg: ASbGncsHuIubRRRmxBivrLZSIiPANM6478OCTO1wvvFXBfuzSf3Y4wS9QA0wc6cGCR0
 5pTNOETF/EKGeLbl3hDiweAUMfiSrTwhFKaoUXR3tlIQ/BZUWduwAAenP+5H+20EMA+1/FpjYk7
 udC04WzAyx2vT45iPvYBwPTmRE
X-Google-Smtp-Source: AGHT+IGhYVBn7vR4Knu9i9p1S4VK8hyNoaUSgXFGJfzH1GI7bLCBQBjmUDNC8ud8qNAZI0CQlE/V8lGFiNOUrbF8nOs=
X-Received: by 2002:a05:6902:490d:b0:e5d:c30f:22ec with SMTP id
 3f1490d57ef6-e63f64dcbf3mr14511779276.9.1742158020821; Sun, 16 Mar 2025
 13:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-18-jim.cromie@gmail.com>
 <29ca1dc2-3a21-405f-a9b6-06bea7bd75ae@bootlin.com>
In-Reply-To: <29ca1dc2-3a21-405f-a9b6-06bea7bd75ae@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 14:46:35 -0600
X-Gm-Features: AQ5f1JprR-UJ_0VXd2VsB4dKW3nxrkYe1QDrUeDVJ6N3x3HhjWh_YqIyfWvWlNY
Message-ID: <CAJfuBxwJ5SgEP15nPpYJbwXi4iDJqVRS9FL8hdkHCkDct=Abrw@mail.gmail.com>
Subject: Re: [PATCH 17/63] dyndbg: check DYNDBG_CLASSMAP_DEFINE args at
 compile-time
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Jim Cromie <jim.cromie@gmail.com>, 
 linux-kernel@vger.kernel.org, jbaron@akamai.com, gregkh@linuxfoundation.org, 
 ukaszb@chromium.org, intel-gfx-trybot@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
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

On Tue, Feb 25, 2025 at 7:17=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > Add __DYNDBG_CLASSMAP_CHECK to implement these arg-checks at compile:
> >       0 <=3D _base < 63
> >       class_names is not empty
> >       class_names[0] is a string
> >       (class_names.length + _base) < 63
> >
> > These compile-time checks will prevent several misuses; 4 such
> > examples are added to test_dynamic_debug_submod.ko, and will fail
> > compilation if -DDD_MACRO_ARGCHECK is added to cflags.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > - split static-asserts to __DYNDBG_CLASSMAP_CHECK
> > - move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
> >    silences kernel-doc warnings
> > ---
> >   include/linux/dynamic_debug.h |  9 +++++++++
> >   lib/test_dynamic_debug.c      | 11 +++++++++++
> >   2 files changed, 20 insertions(+)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index dc610a12b91c..2b0c943af330 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -99,6 +99,14 @@ struct ddebug_class_map {
> >       enum ddebug_class_map_type map_type;
> >   };
> >
> > +#define __DYNDBG_CLASSMAP_CHECK(_clnames, _base)                     \
> > +     static_assert(((_base) >=3D 0 && (_base) < _DPRINTK_CLASS_DFLT), =
 \
> > +                   "_base must be in 0..62");                        \
> > +     static_assert(ARRAY_SIZE(_clnames) > 0,                         \
> > +                   "classnames array size must be > 0");             \
> > +     static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_D=
FLT, \
> > +                   "_base + classnames.length exceeds range")
> > +
> >   /**
> >    * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
> >    * @_var:   name of the classmap, exported for other modules coordina=
ted use.
> > @@ -112,6 +120,7 @@ struct ddebug_class_map {
> >    */
> >   #define DYNDBG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)            \
> >       static const char *_var##_classnames[] =3D { __VA_ARGS__ };      =
 \
> > +     __DYNDBG_CLASSMAP_CHECK(_var##_classnames, (_base));            \
> >       extern struct ddebug_class_map _var;                            \
> >       struct ddebug_class_map __aligned(8) __used                     \
> >               __section("__dyndbg_classes") _var =3D {                 =
 \
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 1838f62738c4..b1555b0a2bb1 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -123,8 +123,19 @@ DYNDBG_CLASSMAP_PARAM(level_num, p);
> >   DYNDBG_CLASSMAP_USE(map_disjoint_bits);
> >   DYNDBG_CLASSMAP_USE(map_level_num);
> >
> > +#if defined(DD_MACRO_ARGCHECK)
> > +/*
> > + * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
> > + * These will break compilation.
> > + */
> > +DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
> > +DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
> > +DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
> > +DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
>
> Hi Jim,
>
> This test is nice, but can we move it in the *_submod.c directly? They
> don't need anything from this file.
>

Hi Louis,

Given my strong preference for continued / justified ifdeffery earlier,
I will interpret this as move these corner-case tests into the
submod-only branch.

Im happy to do it, and I see the commit-msg says that specifically,
but Im not sure what it will improve by moving it.
I could fix the commit msg instead.

these compile-time tests will break the build,
so I dont think theyre much good as a CONFIG_ option for example.

So making the breakage submodule specific isnt
much of a reduction in blast radius, and it only opens the why-submod-only =
?

Any views or options ?  (both welcomed)


> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

ack!

> Thanks,
> Louis Chauvet
>
> >   #endif
> >
> > +#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
> > +
> >   /* stand-in for all pr_debug etc */
> >   #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
> >
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
