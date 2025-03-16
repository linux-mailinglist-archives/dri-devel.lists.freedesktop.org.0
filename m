Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187AA6377F
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 22:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBD810E071;
	Sun, 16 Mar 2025 21:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nmTmIqEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7A10E071;
 Sun, 16 Mar 2025 21:15:05 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so3404178276.1; 
 Sun, 16 Mar 2025 14:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742159704; x=1742764504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJ0iedY83PktwSR1mgUyCs52q1xVK/VA615tH5z8bWM=;
 b=nmTmIqEOn0gcnEft6WwUb05oySu8hbeBV1InMQd/D9vqnnYhCG/sjVth0WXAePy4te
 R2Id7r5YlkBaJRwQEtB2VPr9tYasXchej4QlzrPiuXTkD19OmYzDuUE5EZEJOpY7x/hZ
 Sls5f7h93y7evV+x/0+0aH7OCNmoCNBmf4PAdOTpc1UBcsbl99mUWiIML8PjqwFxBcAC
 ZHoAUyuF503DDD5OJoMQQ8phk1r91qhyAUKqVr8Iyva5WwlG9SrWpRq7u9x1kubVCmzZ
 22jFNzPr5oydHZzoZCryGpH5EBhq51RUGlZ48cgTfkp05JiIvmswnjdRS3iviVbljKKI
 K3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742159704; x=1742764504;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJ0iedY83PktwSR1mgUyCs52q1xVK/VA615tH5z8bWM=;
 b=ArqMll5VjOMPRI3Z7ac2DCixsVhdY+S8bGZWcd8RqsuWY8ssTyMLHsduTNX1cSWJeZ
 lZKHEutDo8wKVl3Tjh8NBGUXJwaxRFlkltzqGVaKhf5UgP1uLH6mijDyIA7BUKxmpx/z
 PMqQLVeWj18SH3sxVzrDhXM4N2pHgTx715Zc37GUfsjEFT+KLTrLAr0Yz9aWBhOMrpkz
 QWZQB+JrGHSZELQ4B33NtT+So/wwvoyvHNpwZ/5XJXKXpx09aoFluNN4gf/diGV3bpZr
 inNRNj2GTHt8mCUY5dp7nSJuh+a4gp4qX8FfuLoISiL81SyhxEDXMrPPZqDhuLotr+09
 iEHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbvmsPpO5WW4fDPqalIl4uFHU1P7E5xhUc9BXUeBj/dy7tizpTdcc4Bi89sbntOXbScZ3RYf/l@lists.freedesktop.org,
 AJvYcCWhhf/Gq4QG4yuuidILXtdP7gummAj900opwvzeLQ7K5hMQVq1hoJftNfa3FFXhizQO77nXB3TjZyuj0azEDbmi4A==@lists.freedesktop.org,
 AJvYcCWsXmlmfO0Tqg4KxtmqRfbTFZPsCLMhsn0dTrdfmRnTj4f6GIGMhxM9828+jmb/cIrpKcV8uoxqZNgv@lists.freedesktop.org,
 AJvYcCX5YYHFrxlHA3NZUtn6P6cjZSNiYTcf1qFPYCRdc4uO5NgsYZ+RxmlUnZa4GpZaH1tVpsDH8Ncdf3y9VvhuwQ==@lists.freedesktop.org,
 AJvYcCXF6oBExBURB13rwu2mHCv+FCefEZOAm9qGWxjhW8rr8Uq40MHR2tU66YtiNqoRv30Li6XtOvGV7IOi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6QC6stEbVuKlyGcQbL4Pigp0//bOCkY9QWhqgayjw4aY6sxmw
 SUzZ3hBJhxAaWW0MgTz+R9oBll9H/IwEUcTkudE1O15DMB6kjSnqOh9aJWsp6Ek9SPE0ni5+pOB
 DpzcrCEUQ4KUZSq60ElY3L9sp3Ps=
X-Gm-Gg: ASbGncuDXubnqwYX+WXXZtMJwr+HEeuyofPL3YAacWo9werDJcenFDy3YNTV+oT+haH
 CnS85V4YQc+5QzwZ8j+vD1fPx4XiGtKehLCUX7s9I/poLcSQm2dxrgKDq3VbamHCScryvWmHzm+
 Acrt6jYcC4r8xdMRSV8Gia7Boe
X-Google-Smtp-Source: AGHT+IGVZEKhbzRRB7b8iQ9JkJu9Ea4Af0T19my2L8K9f+zEimO3KVOKZS46WO9f1nD9MLfml5I9dnjZ8ZGyGNO0Boo=
X-Received: by 2002:a05:690c:670f:b0:6fd:346f:97ba with SMTP id
 00721157ae682-6ff45eb2623mr158025737b3.11.1742159704356; Sun, 16 Mar 2025
 14:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-29-jim.cromie@gmail.com>
 <160ec360-918d-414f-aef9-606cfa1749df@bootlin.com>
In-Reply-To: <160ec360-918d-414f-aef9-606cfa1749df@bootlin.com>
From: jim.cromie@gmail.com
Date: Sun, 16 Mar 2025 15:14:38 -0600
X-Gm-Features: AQ5f1Jo1CuizZwKHzkpnExetUtPcGleC7A5ti5g3B8ZX2NtRYyv2ffSYdWqvB7o
Message-ID: <CAJfuBxxzXoKummiBDGODidpRj7Fm2UDip-T0qkB7L9tscK0zCQ@mail.gmail.com>
Subject: Re: [PATCH 28/63] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

On Tue, Feb 25, 2025 at 7:29=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 25/01/2025 =C3=A0 07:45, Jim Cromie a =C3=A9crit :
> > move the DYNDBG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
> > the header, and refine it, by distinguishing the 2 use cases:
> >
> > 1.DYNDBG_CLASSMAP_PARAM_REF
> >      for DRM, to pass in extern __drm_debug by name.
> >      dyndbg keeps bits in it, so drm can still use it as before
> >
> > 2.DYNDBG_CLASSMAP_PARAM
> >      new user (test_dynamic_debug) doesn't need to share state,
> >      decls a static long unsigned int to store the bitvec.
> >
> > __DYNDBG_CLASSMAP_PARAM
> >     bottom layer - allocate,init a ddebug-class-param, module-param-cb.
> >
> > Modify ddebug_sync_classbits() argtype deref inside the fn, to give
> > access to all kp members.
> >
> > Also clean up and improve comments in test-code, and add
> > MODULE_DESCRIPTIONs.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >
> > -v9
> >   - fixup drm-print.h  add PARAM_REF forwarding macros
> >     with DYNDBG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
> > ---
> >   include/linux/dynamic_debug.h   | 38 +++++++++++++++++++++
> >   lib/dynamic_debug.c             | 60 ++++++++++++++++++++++----------=
-
> >   lib/test_dynamic_debug.c        | 59 +++++++++++++-------------------
> >   lib/test_dynamic_debug_submod.c |  9 ++++-
> >   4 files changed, 111 insertions(+), 55 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 48d76a273f68..b47d1088b7ad 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -205,6 +205,44 @@ struct ddebug_class_param {
> >       const struct ddebug_class_map *map;
> >   };
> >
> > +/**
> > + * DYNDBG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
> > + * @_name:  sysfs node name
> > + * @_var:   name of the classmap var defining the controlled classes/b=
its
> > + * @_flags: flags to be toggled, typically just 'p'
> > + *
> > + * Creates a sysfs-param to control the classes defined by the
> > + * exported classmap, with bits 0..N-1 mapped to the classes named.
> > + * This version keeps class-state in a private long int.
> > + */
> > +#define DYNDBG_CLASSMAP_PARAM(_name, _var, _flags)                   \
> > +     static unsigned long _name##_bvec;                              \
> > +     __DYNDBG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
> > +
> > +/**
> > + * DYNDBG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-=
param
> > + * @_name:  sysfs node name
> > + * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_d=
ebug
> > + * @_var:   name of the (exported) classmap var defining the classes/b=
its
> > + * @_flags: flags to be toggled, typically just 'p'
> > + *
> > + * Creates a sysfs-param to control the classes defined by the
> > + * exported clasmap, with bits 0..N-1 mapped to the classes named.
> > + * This version keeps class-state in user @_bits.  This lets drm check
> > + * __drm_debug elsewhere too.
> > + */
> > +#define DYNDBG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)         =
       \
> > +     __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
> > +
> > +#define __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)          \
> > +     static struct ddebug_class_param _name##_##_flags =3D {          =
 \
> > +             .bits =3D &(_bits),                                      =
 \
> > +             .flags =3D #_flags,                                      =
 \
> > +             .map =3D &(_var),                                        =
 \
> > +     };                                                              \
> > +     module_param_cb(_name, &param_ops_dyndbg_classes,               \
> > +                     &_name##_##_flags, 0600)
> > +
> >   /*
> >    * pr_debug() and friends are globally enabled or modules have select=
ively
> >    * enabled them.
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 781781835094..9283f2866415 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -660,6 +660,30 @@ static int ddebug_apply_class_bitmap(const struct =
ddebug_class_param *dcp,
> >
> >   #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
> >
> > +static void ddebug_class_param_clamp_input(unsigned long *inrep, const=
 struct kernel_param *kp)
> > +{
> > +     const struct ddebug_class_param *dcp =3D kp->arg;
> > +     const struct ddebug_class_map *map =3D dcp->map;
> > +
> > +     switch (map->map_type) {
> > +     case DD_CLASS_TYPE_DISJOINT_BITS:
> > +             /* expect bits. mask and warn if too many */
> > +             if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
> > +                     pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, ma=
sking\n",
> > +                             KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map=
->length));
> > +                     *inrep &=3D CLASSMAP_BITMASK(map->length);
> > +             }
> > +             break;
> > +     case DD_CLASS_TYPE_LEVEL_NUM:
> > +             /* input is bitpos, of highest verbosity to be enabled */
> > +             if (*inrep > map->length) {
> > +                     pr_warn("%s: level:%ld exceeds max:%d, clamping\n=
",
> > +                             KP_NAME(kp), *inrep, map->length);
> > +                     *inrep =3D map->length;
> > +             }
> > +             break;
> > +     }
> > +}
> >   static int param_set_dyndbg_module_classes(const char *instr,
> >                                          const struct kernel_param *kp,
> >                                          const char *modnm)
> > @@ -678,26 +702,15 @@ static int param_set_dyndbg_module_classes(const =
char *instr,
> >               pr_err("expecting numeric input, not: %s > %s\n", instr, =
KP_NAME(kp));
> >               return -EINVAL;
> >       }
> > +     ddebug_class_param_clamp_input(&inrep, kp);
> >
> >       switch (map->map_type) {
> >       case DD_CLASS_TYPE_DISJOINT_BITS:
> > -             /* expect bits. mask and warn if too many */
> > -             if (inrep & ~CLASSMAP_BITMASK(map->length)) {
> > -                     pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, ma=
sking\n",
> > -                             KP_NAME(kp), inrep, CLASSMAP_BITMASK(map-=
>length));
> > -                     inrep &=3D CLASSMAP_BITMASK(map->length);
> > -             }
> >               v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP=
_NAME(kp));
> >               totct +=3D ddebug_apply_class_bitmap(dcp, &inrep, *dcp->b=
its, modnm);
> >               *dcp->bits =3D inrep;
> >               break;
> >       case DD_CLASS_TYPE_LEVEL_NUM:
> > -             /* input is bitpos, of highest verbosity to be enabled */
> > -             if (inrep > map->length) {
> > -                     pr_warn("%s: level:%ld exceeds max:%d, clamping\n=
",
> > -                             KP_NAME(kp), inrep, map->length);
> > -                     inrep =3D map->length;
> > -             }
> >               old_bits =3D CLASSMAP_BITMASK(*dcp->lvl);
> >               new_bits =3D CLASSMAP_BITMASK(inrep);
> >               v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, K=
P_NAME(kp));
> > @@ -1163,15 +1176,24 @@ static const struct proc_ops proc_fops =3D {
> >   static void ddebug_sync_classbits(const struct kernel_param *kp, cons=
t char *modname)
> >   {
> >       const struct ddebug_class_param *dcp =3D kp->arg;
> > +     unsigned long new_bits;
> >
> > -     /* clamp initial bitvec, mask off hi-bits */
> > -     if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
> > -             *dcp->bits &=3D CLASSMAP_BITMASK(dcp->map->length);
> > -             v2pr_info("preset classbits: %lx\n", *dcp->bits);
> > +     ddebug_class_param_clamp_input(dcp->bits, kp);
> > +
> > +     switch (dcp->map->map_type) {
> > +     case DD_CLASS_TYPE_DISJOINT_BITS:
> > +             v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->=
bits);
> > +             ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
> > +             break;
> > +     case DD_CLASS_TYPE_LEVEL_NUM:
> > +             new_bits =3D CLASSMAP_BITMASK(*dcp->lvl);
> > +             v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *dcp=
->lvl, new_bits);
> > +             ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
> > +             break;
> > +     default:
> > +             pr_err("bad map type %d\n", dcp->map->map_type);
> > +             return;
> >       }
> > -     /* force class'd prdbgs (in USEr module) to match (DEFINEr module=
) class-param */
> > -     ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
> > -     ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
>
> Hi Jim,
>
> We lost the double call with ~0/0, is it normal?

Good catch,

I thought so, since it guarantees the pr_debugs' state to
comport with sysfs settings on modprobe.

I will review.

>
> Thanks a lot for your work,
> Louis Chauvet
>
> >   }
> >
> >   static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 5cfc156ca4bb..32a9d49a7a3b 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> > - * Kernel module for testing dynamic_debug
> > + * Kernel module to test/demonstrate dynamic_debug features,
> > + * particularly classmaps and their support for subsystems like DRM.
> >    *
> >    * Authors:
> >    *      Jim Cromie  <jim.cromie@gmail.com>
> > @@ -43,36 +44,21 @@ module_param_cb(do_prints, &param_ops_do_prints, NU=
LL, 0600);
> >
> >   #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (bas=
e))
> >
> > -/* sysfs param wrapper, proto-API */
> > -#define DYNDBG_CLASSMAP_PARAM_(_model, _flags, _init)                 =
       \
> > -     static unsigned long bits_##_model =3D _init;                    =
 \
> > -     static struct ddebug_class_param _flags##_##_model =3D {         =
 \
> > -             .bits =3D &bits_##_model,                                =
 \
> > -             .flags =3D #_flags,                                      =
 \
> > -             .map =3D &map_##_model,                                  =
 \
> > -     };                                                              \
> > -     module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,   \
> > -                     &_flags##_##_model, 0600)
> > -#ifdef DEBUG
> > -#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(=
_model, _flags, ~0)
> > -#else
> > -#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(=
_model, _flags, 0)
> > -#endif
> > -
> >   /*
> > - * Demonstrate/test all 4 class-typed classmaps with a sys-param.
> > + * Demonstrate/test both types of classmaps, each with a sys-param.
> >    *
> >    * Each is 3 part: client-enum decl, _DEFINE, _PARAM.
> > - * Declare them in blocks to show patterns of use (repetitions and
> > - * changes) within each.
> > + * Pair the 6 parts by type, to show the pattern of repetition and
> > + * change within each.
> >    *
> > - * 1st, dyndbg expects a client-provided enum-type as source of
> > - * category/classid truth.  DRM has DRM_UT_<CORE,DRIVER,KMS,etc>.
> > + * 1st, dyndbg classmaps follows drm.debug convention, and expects a
> > + * client-provided enum-type as source of category/classid truth.  DRM
> > + * gives DRM_UT_<CORE,DRIVER,KMS,etc>.
> >    *
> >    * Modules with multiple CLASSMAPS must have enums with distinct
> >    * value-ranges, arranged below with explicit enum_sym =3D X inits.
> >    *
> > - * Declare all 4 enums now, for different types
> > + * Declare the 2 enums now.
> >    */
> >
> >   /* numeric input, independent bits */
> > @@ -91,12 +77,15 @@ enum cat_disjoint_bits {
> >   /* numeric verbosity, V2 > V1 related */
> >   enum cat_level_num { V0 =3D 16, V1, V2, V3, V4, V5, V6, V7 };
> >
> > -/* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
> > +/*
> > + * use/demonstrate multi-module-group classmaps, as for DRM
> > + */
> >   #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
> >   /*
> > - * In single user, or parent / coordinator (drm.ko) modules, define
> > - * classmaps on the client enums above, and then declares the PARAMS
> > - * ref'g the classmaps.  Each is exported.
> > + * For module-groups of 1+, define classmaps with names (stringified
> > + * enum-symbols) copied from above. 1-to-1 mapping is recommended.
> > + * The classmap is exported, so that other modules in the group can
> > + * link to it and control their prdbgs.
> >    */
> >
> >   DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS=
,
> > @@ -116,11 +105,12 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TY=
PE_LEVEL_NUM,
> >                      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7"=
);
> >
> >   /*
> > - * now add the sysfs-params
> > + * for use-cases that want it, provide a sysfs-param to set the
> > + * classes in the classmap.  It is at this interface where the
> > + * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
> >    */
> > -
> > -DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
> > -DYNDBG_CLASSMAP_PARAM(level_num, p);
> > +DYNDBG_CLASSMAP_PARAM(p_disjoint_bits,       map_disjoint_bits, p);
> > +DYNDBG_CLASSMAP_PARAM(p_level_num,   map_level_num, p);
> >
> >   #ifdef FORCE_CLASSID_CONFLICT_MODPROBE
> >   /*
> > @@ -131,12 +121,10 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0,=
 D2_CORE + 1, "D3_CORE");
> >   #endif
> >
> >   #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
> > -
> >   /*
> > - * in submod/drm-drivers, use the classmaps defined in top/parent
> > - * module above.
> > + * the +1 members of a multi-module group refer to the classmap
> > + * DEFINEd (and exported) above.
> >    */
> > -
> >   DYNDBG_CLASSMAP_USE(map_disjoint_bits);
> >   DYNDBG_CLASSMAP_USE(map_level_num);
> >
> > @@ -211,6 +199,7 @@ static void __exit test_dynamic_debug_exit(void)
> >   module_init(test_dynamic_debug_init);
> >   module_exit(test_dynamic_debug_exit);
> >
> > +MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
> >   MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
> >   MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
> >   MODULE_LICENSE("GPL");
> > diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_s=
ubmod.c
> > index 9a893402ce1a..0d15f3ffe466 100644
> > --- a/lib/test_dynamic_debug_submod.c
> > +++ b/lib/test_dynamic_debug_submod.c
> > @@ -1,6 +1,9 @@
> >   // SPDX-License-Identifier: GPL-2.0
> >   /*
> > - * Kernel module for testing dynamic_debug
> > + * Kernel module to test/demonstrate dynamic_debug features,
> > + * particularly classmaps and their support for subsystems, like DRM,
> > + * which defines its drm_debug classmap in drm module, and uses it in
> > + * helpers & drivers.
> >    *
> >    * Authors:
> >    *      Jim Cromie  <jim.cromie@gmail.com>
> > @@ -8,3 +11,7 @@
> >
> >   #define TEST_DYNAMIC_DEBUG_SUBMOD
> >   #include "test_dynamic_debug.c"
> > +
> > +MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support")=
;
> > +MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
> > +MODULE_LICENSE("GPL");
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
