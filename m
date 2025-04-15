Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D954A8A88F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 21:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2534710E151;
	Tue, 15 Apr 2025 19:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hTYOD5xH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340A210E151;
 Tue, 15 Apr 2025 19:54:35 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7053f85f059so53200647b3.2; 
 Tue, 15 Apr 2025 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744746874; x=1745351674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAi1HpDyCH5qHMnYK7rZqJqXCXRMxpW4p8owZruiAAY=;
 b=hTYOD5xHxBzawetIu1km1oJKLPYLme3fR2FW+8AbpyQgq7OWz4ZdjwLuba8irF4FuO
 NRFgOCsGjPZ9xVCRrfstgKAvnGDI129Kr5bc2Gx82BZpvfp1XdePVXivyWIzUped9Y63
 PT38noi/uvuH8P0zxUsoKSk2gn2UH3fFmkmi44To7tdeB6bHGcqBVCt/dauzUGmcVio1
 RIQc4ks0iYsky9ZagfGwbvwXaPZRsQQMxM9rdqXkPe0IgQMCKYk+FOug3/nM+aB6AmiX
 1kpFe/BrFyieJLZv8lpie6VbjymNiYob2qxnBTnKcUyT+SnLTYoCJrOUuCqQns9USi4I
 hcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744746874; x=1745351674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAi1HpDyCH5qHMnYK7rZqJqXCXRMxpW4p8owZruiAAY=;
 b=pBsvHBLhBEMpr1IjN679pUaDMyPlhgxUS3ZxvWTGNDJBzG3kCkjQYtQEsACzr4E/Yk
 /2XnCz0vKuQIuGkhwq8khJXtdSXwmtroa7PRN41h52z1X3Csxtkpu5DL3jCRAOAGoIoI
 Fl8e2G/syjnF0gziepTwKKfqoS8qRGB0lmEm0EB46PiYGhQqnkwYAfYYq7PJ1+Sj8R/U
 nnyjJgidxWBcYhTRsqfJmZDqS4uWUFW8zpAfOGuax7z+FWq7zP0u74N5mBJUB84qZX75
 BeSYvNDHbXcFXF97YvWGbugQTVSDJwqs70vUx9LBzOhH/uyD576birOK9k2rWNKZvOGS
 R8Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL+xoheBmmuu4x5jLDBcKSs5TZeaiGyw+nHk7BKpNqlWM99UefGPJlk3Zsc9fKFSb5CXys32qnWEoghuZWlg==@lists.freedesktop.org,
 AJvYcCVMarztENPB4IqJHDcNsZYRR9I6aNIJwbqRM/+81r6+QpnhB6DIiWtGLQMq7zCihH5Q+PC00Pow@lists.freedesktop.org,
 AJvYcCXIxZ7o87Ftg3GTYCev5I+ig1LhKWQY7adeevwB5vafsU5F00kbNwTWqZpIs7eBAwoI7tjzS1LQUTIs@lists.freedesktop.org,
 AJvYcCXYYsem3IiDGa+VYEEoAFhJ7MlhrITRCCphIzt1LVp710AZwm3IkduGxtjEjm82f6H3wtTALktLJY41@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3zCAQAB1IpowOFWXk1l7GRiuhzSDvKTfQFDyIDQJAMlLbIQEi
 MrhbNil6UsXRg3f63AmOPy5GPFmSzK/Wc6pnzHnQT1ZNrqYeZLnjxCLij7f8ghDPt0etf/qbBn/
 FZkb+fsHhqJdYf2R8CVdiIOs3QSg=
X-Gm-Gg: ASbGncuk+uvvvyrYX/lBEK5xRx0Uzsk2eT+Acp8xvkoRyLnwgNRh6O4YWYegV3UvbrZ
 lrD9AqmYadhgpw/TW+2ze5+ipAiMrFh+UkqPV1baP9jj/U3/7ST5S6NMoTTcuxOogVSt1Mk+H1x
 wmVPiQ4K6xLFsAENPGbvDI
X-Google-Smtp-Source: AGHT+IGlvmJGXcVyW5hA9lpQC3pfTq/acR7QSuaZFT2Z/sDAbRX4tOnqvIe3e5bH4LTdduM75/dvdMi1J0a8Fv71kwk=
X-Received: by 2002:a05:690c:23ca:b0:700:b389:9246 with SMTP id
 00721157ae682-706ad1c6361mr9042927b3.38.1744746874177; Tue, 15 Apr 2025
 12:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-21-jim.cromie@gmail.com>
 <428d9ffb-70bb-42f3-bf4e-416cfd90f88c@bootlin.com>
In-Reply-To: <428d9ffb-70bb-42f3-bf4e-416cfd90f88c@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 13:54:08 -0600
X-Gm-Features: ATxdqUFKxNW9JmpIZE3lLHmW8mlHITUJ88JoVc4NFn6_RoSSyM2vkFzfaonZR-I
Message-ID: <CAJfuBxx17bgvP5PyP25yKoLXGp-3q1jdaNYKvJkE+8+BL9Akaw@mail.gmail.com>
Subject: Re: [PATCH v3 20/54] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args
 at compile-time
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

On Tue, Apr 15, 2025 at 4:04=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
> > arg-checks at compile-time:
> >
> >       0 <=3D _base < 63
> >       class_names is not empty
> >       class_names[0] is a string
>
> I don't see where this is checked, did I miss something?

kinda/sorta ?   theres no explicit check for "string".
BUT
this would fail, cuz 1 doesnt fit into a char* arr[0]
> > +DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);

Im perhaps over-simplifying the description

>
> >       (class_names.length + _base) < 63
> >
> > These compile-time checks will prevent several misuses; 4 such
> > examples are added to test_dynamic_debug_submod.ko, and will fail
> > compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
> > be a useful CONFIG_ item, since it breaks the build.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > v3- $macro_name =3D~ s/DYNDBG/DYNAMIC_DEBUG/
> >
> > prev-
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
> > index 9af825c84e70..4941ef2adb46 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -99,6 +99,14 @@ struct _ddebug_class_map {
> >       enum ddebug_class_map_type map_type;
> >   };
> >
> > +#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)               =
       \
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
> >    * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a mod=
ule.
> >    * @_var:   name of the classmap, exported for other modules coordina=
ted use.
> > @@ -112,6 +120,7 @@ struct _ddebug_class_map {
> >    */
> >   #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)      =
       \
> >       static const char *_var##_classnames[] =3D { __VA_ARGS__ };      =
 \
>
> Or maybe it was already enforced by this, but in this case the commit
> message contains too much checks.
>
> > +     __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
> >       extern struct _ddebug_class_map _var;                           \
> >       struct _ddebug_class_map __aligned(8) __used                    \
> >               __section("__dyndbg_class_maps") _var =3D {              =
 \
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index e42916b08fd4..9f9e3fddd7e6 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, =
D2_CORE + 1, "D3_CORE");
> >   DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
> >   DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
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
>
