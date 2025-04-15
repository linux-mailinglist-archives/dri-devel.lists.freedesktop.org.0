Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536ECA8A834
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 21:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCD710E16D;
	Tue, 15 Apr 2025 19:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AUjxltzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB6810E16D;
 Tue, 15 Apr 2025 19:38:48 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-700b17551cdso57794967b3.0; 
 Tue, 15 Apr 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744745927; x=1745350727; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svrYZeuyn4631PIffIKvMIv1gqvUWFIvn4NzvjSdWKI=;
 b=AUjxltzGsavJECQIQ7QA3PQgifylsvFOgNU+fw3FWhWo6MRrabNM/9f7myNmt8DOcs
 jn7wJlJgtcKhQz8jl/HV9DnVAdlvzzGKgulzx/cqjGBj9vjFjgXb+800zQxO10aVtEK3
 TEpD2d+eQu3Q+jeIgOfCN+w+E3Dtl2JnDHd794WrQJLFt/edM6BZVUkX0j0/PazPRPER
 0STMKcZuQwbSHz8OZu5I7I5p7V4KwRQD2YZ2etbMYq+nsoUaIOAYNqH2BNXqST6YjYLc
 hSgmEKr4kRLM9LTmAIF8mzTVVxZ3gweDHEMhgVA/dbnGf+IYnTBcwy/uJCxQmfPTg22K
 tI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744745927; x=1745350727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svrYZeuyn4631PIffIKvMIv1gqvUWFIvn4NzvjSdWKI=;
 b=s1PJ9yGlRLQBmU/Nm1rlfAErWuGEkOM8ZZIUnbf4EZRZCg5C/Kx8iwpMpSyx2HTymS
 ggNbKnb8VTdLusz8o8YtmFBvdd6T7T0zlk7l7Ysm+bjD3UcwSZBr63NqUuE+2HzA0+Xj
 OFSepO0SiRteqYbBJ1yJmRtahYkxGs5x82T1OUVZFHbdWf5fxgEVFqhXjmsfHBXLM2iV
 18Uej4z1dtoKzsBeT6dS9EW1it8J3IIWS92uj1KCQB/iu1nSy7aq6VWw0mrluVoEjLcv
 CW7Sc93Bu/Icde2NIp9IpNEVDGyfZz/NBui0knmK1PyaWa0snQ90468FbmP1NN1Hpa59
 UB/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8udipwadOIcYUBzWBDd5Qp0aJPOzrBeDtT1mrEPukClIQHtP+DQOHgihGbfjrDO3VUb3E/CIublUzxWGtCA==@lists.freedesktop.org,
 AJvYcCUaMsRTLvQtDeadVJElC5qXMSHfKNaOtzt3M+7jK6tYh86c2EyaEyl4AKsnUGtebbNe+OpA+tGfdhUS@lists.freedesktop.org,
 AJvYcCWBChDsO44vajpxdFgZOvUKBAu43i9faDe9IBBMIrU4A6mV4ts140keht0hPo26N0PUco/p+IsCWLMa@lists.freedesktop.org,
 AJvYcCXWaPqEbgtpXsbpCZUuSZ1hVsd6o5oxD+aaK5SKf/HqaY6nmtbLCAx2FLrT7n4D9ub7b8chMz8s@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz61OP2tFDfyIRuojTEWsPkBnjT0D84MX1XuaFV8axkawpsn7/d
 ITk4OYPERQ4geO9Vl1xVVOXGvKtC4H5ed4OicZkQb/cDLWdSDL0047+S8sZ0oCy+/ALJKwgTH7P
 8FNzu2Z5jTq6RPAD060onkRVHW4k=
X-Gm-Gg: ASbGnctmS4uRg0UYruqmwCNf3B1G+PoguZGtD/Uxn0OALPX7qCMT96G6ZyGm7ytXBuW
 5Ru27v8Z1kXkfatKpqBRdNk19tLMdK3/1CQKZGXrGXoQ8TP+5sbY5+vuwEA2kMG55HQ33qJ+qLA
 cZcz5MukuTcPQtRxkO6ezxnGXXbedg8PA=
X-Google-Smtp-Source: AGHT+IHl/fXoXLga4bHdZiJsm8GrG0iU9pgAsb6hJsBgh3CYdTnehgVgJBtEdsYpCgkykzwkyoqQSNOw47qO2efxO0M=
X-Received: by 2002:a05:690c:6f08:b0:6ff:1d6f:38af with SMTP id
 00721157ae682-706acd9b415mr10336237b3.4.1744745926732; Tue, 15 Apr 2025
 12:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-18-jim.cromie@gmail.com>
 <753c3f7d-fca7-4a10-b73c-70d12fe3ed96@bootlin.com>
In-Reply-To: <753c3f7d-fca7-4a10-b73c-70d12fe3ed96@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 13:38:20 -0600
X-Gm-Features: ATxdqUGzLAOBE_F9JRLnH_BhfiQcxCldl-5a28PrCWrdk3sT2WX_lEI8f8ESZek
Message-ID: <CAJfuBxzkDvABq=gBxwKOYO7Y=k-wwyTLH274pKLkpL1KZr3Bew@mail.gmail.com>
Subject: Re: [PATCH v3 17/54] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, linux-doc@vger.kernel.org
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

On Tue, Apr 15, 2025 at 4:01=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > DECLARE_DYNDBG_CLASSMAP() has a design error; its usage fails a basic
> > K&R rule: "define once, refer many times".
> >
> > When DRM_USE_DYNAMIC_DEBUG=3Dy, it is used across DRM core & drivers;
> > each invocation allocates/inits the classmap understood by that
> > module.  All must match for the modules to respond together when
> > DRM.debug categories are enabled.  This is brittle; a maintenance
> > foot-gun.
> >
> > Further, its culpable in the CONFIG_DRM_USE_DYNAMIC_DEBUG=3DY
> > regression; its use in both core & drivers obfuscates the 2 roles, that
> > caused incomplete initialization when modprobing drivers:
> >
> > 1st drm.ko loads, and dyndbg initializes its DRM.debug callsites, then
> > a drm-driver loads, but too late for the DRM.debug enablement.
> >
> > So retire it, replace with 2 macros:
> >    DYNAMIC_DEBUG_CLASSMAP_DEFINE - invoked once from core - drm.ko
> >    DYNAMIC_DEBUG_CLASSMAP_USE    - from all drm drivers and helpers.
> >
> > DYNAMIC_DEBUG_CLASSMAP_DEFINE: this reworks DECLARE_DYNDBG_CLASSMAP,
> > by dropping the static qualifier on the classmap, and exporting it
> > instead.
> >
> > DYNAMIC_DEBUG_CLASSMAP_USE: then refers to the exported var by name:
> >    used from drivers, helper-mods
> >    lets us drop the repetitive "classname" declarations
> >    fixes 2nd-defn problem
> >    creates a ddebug_class_user record in new __dyndbg_class_users secti=
on
> >    new section is scanned "differently"
> >
> > DECLARE_DYNDBG_CLASSMAP is preserved temporarily, to decouple DRM
> > adaptation work and avoid compile-errs before its done.  IOW, DRM gets
> > these fixes when they commit the adopt-new-api patches.
> >
> > The DEFINE,USE distinction, and the separate classmap-use record,
> > allows dyndbg to initialize the driver's & helper's DRM.debug
> > callsites separately after each is modprobed.
> >
> > Basically, the classmap init-scan is repeated for classmap-users.
> >
> > To review, dyndbg's existing __dyndbg_classes[] section does:
> >
> > . catalogs the module's classmaps
> > . tells dyndbg about them, allowing >control
> > . DYNAMIC_DEBUG_CLASSMAP_DEFINE creates section records.
> > . we rename it to: __dyndbg_class_maps[]
> >
> > Then this patch adds __dyndbg_class_users[] section:
> >
> > . catalogs users of classmap definitions elsewhere
> > . authorizes dyndbg to >control user's class'd prdbgs
> > . DYNAMIC_DEBUG_CLASSMAP_USE() creates section records.
> >
> > Now ddebug_add_module(etal) can handle classmap-uses similar to (and
> > after) classmaps; when a dependent module is loaded, if it has
> > classmap-uses (to a classmap-def in another module), that module's
> > kernel params are scanned to find if it has a kparam that is wired to
> > dyndbg's param-ops, and whose classmap is the one being ref'd.
> >
> > To support this, theres a few data/header changes:
> >
> > new struct ddebug_class_user
> >    contains: user-module-name, &classmap-defn
> >    it records drm-driver's use of a classmap in the section, allowing l=
ookup
> >
> > struct ddebug_info gets 2 new fields for the new sections:
> >    class_users, num_class_users.
> >    set by dynamic_debug_init() for builtins.
> >    or by kernel/module/main:load_info() for loadable modules.
> >
> > vmlinux.lds.h: new BOUNDED_SECTION for __dyndbg_class_users
> >
> > dynamic_debug.c has 2 changes in ddebug_add_module(), ddebug_change():
> >
> > ddebug_add_module()
> >      called   ddebug_attach_module_classes()
> >      now calls        ddebug_apply_class_maps() & ddebug_apply_class_us=
ers()
> >               these both call ddebug_apply_params().
> >
> > ddebug_apply_params(new fn):
> >
> > It scans module's/builtin kernel-params, calls ddebug_match_apply_kpara=
m
> > for each to find any params/sysfs-nodes which may be wired to a classma=
p.
> >
> > ddebug_match_apply_kparam(new fn):
> >
> > 1st, it tests the kernel-param.ops is dyndbg's; this guarantees that
> > the attached arg is a struct ddebug_class_param, which has a ref to
> > the param's state, and to the classmap defining the param's handling.
> >
> > 2nd, it requires that the classmap ref'd by the kparam is the one
> > we're called for; modules can use many separate classmaps (as
> > test_dynamic_debug does).
> >
> > Then apply the "parent" kparam's setting to the dependent module,
> > using ddebug_apply_class_bitmap().
> >
> > ddebug_change(and callees) also gets adjustments:
> >
> > ddebug_find_valid_class(): This does a search over the module's
> > classmaps, looking for the class FOO echo'd to >control.  So now it
> > searches over __dyndbg_class_users[] after __dyndbg_classes[].
> >
> > ddebug_class_name(): return class-names for defined AND used classes.
> >
> > test_dynamic_debug.c, test_dynamic_debug_submod.c:
> >
> > This demonstrates the 2 types of classmaps & sysfs-params, following
> > the 4-part recipe:
> >
> > 1. define an enum for the classmap: DRM.debug has DRM_UT_{CORE,KMS,...}
> >     multiple classes must share 0-62 classid space.
> > 2. DYNAMIC_DEBUG_CLASSMAP_DEFINE(.. DRM_UT_{CORE,KMS,...})
> > 3. DYNAMIC_DEBUG_CLASSMAP_PARAM* (classmap)
> > 4. DYNAMIC_DEBUG_CLASSMAP_USE()
> >     by _submod only, skipping 2,3
> >
> > Move all the enum declarations together, to better explain how they
> > share the 0..62 class-id space available to a module (non-overlapping
> > subranges).
> >
> > reorg macros 2,3 by name.  This gives a tabular format, making it easy
> > to see the pattern of repetition, and the points of change.
> >
> > And extend the test to replicate the 2-module (parent & dependent)
> > scenario which caused the CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy regression
> > seen in drm & drivers.
> >
> > The _submod.c is a 2-line file: #define _SUBMOD, #include parent.
> >
> > This gives identical complements of prdbgs in parent & _submod, and
> > thus identical print behavior when all of: >control, >params, and
> > parent->_submod propagation are working correctly.
> >
> > It also puts all the parent/_submod declarations together in the same
> > source, with the new ifdef _SUBMOD block invoking DYNAMIC_DEBUG_CLASSMA=
P_USE
> > for the 2 test-interfaces.  I think this is clearer.
> >
> > These 2 modules are both tristate, allowing 3 super/sub combos: Y/Y,
> > Y/M, M/M (not N/Y, since this is disallowed by dependence).
> >
> > Y/Y testing exposed a missing __align(8) in the _METADATA macro, which
> > M/M didn't see because the module-loader memory placement constrains
> > it instead.
> >
> > Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
> > cc: linux-doc@vger.kernel.org
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > v3-
> >     undo 1.9 simplification of ddebug_find_valid_class()
> >     ddebug_change needs map to see its controlling param
> >     change internal callchains to pass di, not dt
> >
> > v2 a. building 2 .ko's from 1 source file is weird; add a clear
> >        comment at the top to justify it (basically cloning)
> >        ln 138+ in commit-msg is insufficient.
> >
> >     b. retire "DYNDBG_" name shortening b4 adding _CLASSMAP_* macros.
> >     c. s/dd_class/_ddebug_class/
> >     d. s/\bddebug\b/_$1/g in header: chgs 1 struct and UNIQUE_ID bases
> >
> > v1.9 - commit-msg tweaks
> >       DRM:CHECK warnings on macros: add parens
> >       extern DEFINEd _var, static classnames
> >       change ddebug_class_user.user_mod_name to .mod_name
> >       simplify ddebug_find_valid_class return val
> >       improve vpr_cm_info msg format
> >       wrap (base) in macro body
> >       move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFIN=
E
> >
> > v1.8 - split drm parts to separate commits.
> >       preserve DECLARE_DYNDBG_CLASSMAP to decouple DRM, no flag day.
> >       fixup block comment
> >
> > v1.7 - previous submission-blocking bug:
> >
> > missing __align(8) in DYNAMIC_DEBUG_DECLARE_METADATA on
> > ddebug_class_user caused corrupt records, but only for builtin
> > modules; module loader code probably pinned allocations to the right
> > alignment naturally, hiding the bug for typical builds.
> >
> > v6- get rid of WARN_ON_ONCE
> > v?- fix _var expanded 2x in macro
> >
> > dyndbg:
> >
> > This fn formerly returned the map which contained the class (thus
> > validating it), and as a side-effect set the class-id in an outvar.
> >
> > But the caller didn't use the map (after checking its not null), only
> > the valid class-id.  So simplify the fn to return the class-id of the
> > validated classname, or -ENOENT when the queried classname is not
> > found.
> >
> > Convey more useful info in the debug-msg: print class-names[0,last],
> > and [base,+len] instead of the class-type printout, which is almost
> > always "type:DISJOINT_BITS".  And drop ddebug_classmap_typenames,
> > which is now unused.
> >
> > [root@v6 b0-dd]# modprobe test_dynamic_debug_submod
> > [   18.864962] dyndbg: loaded classmap: test_dynamic_debug [16..24] V0.=
.V7
> > [   18.865046] dyndbg:  found kp:p_level_num =3D0x0
> > [   18.865048] dyndbg:   mapped to: test_dynamic_debug [16..24] V0..V7
> > [   18.865164] dyndbg:   p_level_num: lvl:0 bits:0x0
> > [   18.865217] dyndbg: loaded classmap: test_dynamic_debug [0..10] D2_C=
ORE..D2_DRMRES
> > [   18.865297] dyndbg:  found kp:p_disjoint_bits =3D0x0
> > [   18.865298] dyndbg:   mapped to: test_dynamic_debug [0..10] D2_CORE.=
.D2_DRMRES
> > [   18.865424] dyndbg:   p_disjoint_bits: classbits: 0x0
> > [   18.865472] dyndbg: module:test_dynamic_debug attached 2 classmaps
> > [   18.865533] dyndbg:  23 debug prints in module test_dynamic_debug
> > [   18.866558] dyndbg: loaded classmap: test_dynamic_debug_submod [16..=
24] V0..V7
> > [   18.866698] dyndbg:  found kp:p_level_num =3D0x0
> > [   18.866699] dyndbg:   mapped to: test_dynamic_debug_submod [16..24] =
V0..V7
> > [   18.866865] dyndbg:   p_level_num: lvl:0 bits:0x0
> > [   18.866926] dyndbg: loaded classmap: test_dynamic_debug_submod [0..1=
0] D2_CORE..D2_DRMRES
> > [   18.867026] dyndbg:  found kp:p_disjoint_bits =3D0x0
> > [   18.867027] dyndbg:   mapped to: test_dynamic_debug_submod [0..10] D=
2_CORE..D2_DRMRES
> > [   18.867193] dyndbg:   p_disjoint_bits: classbits: 0x0
> > [   18.867255] dyndbg: module:test_dynamic_debug_submod attached 2 clas=
smap uses
> > [   18.867351] dyndbg:  23 debug prints in module test_dynamic_debug_su=
bmod
> >
> > fixup-test-submod
> >
> > fixup-test
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >   MAINTAINERS                       |   2 +-
> >   include/asm-generic/vmlinux.lds.h |   1 +
> >   include/linux/dynamic_debug.h     |  93 +++++++++++++++++---
> >   kernel/module/main.c              |   3 +
> >   lib/Kconfig.debug                 |  24 ++++--
> >   lib/Makefile                      |   3 +
> >   lib/dynamic_debug.c               | 137 +++++++++++++++++++++++++++--=
-
> >   lib/test_dynamic_debug.c          | 132 ++++++++++++++++++++--------
> >   lib/test_dynamic_debug_submod.c   |  14 +++
> >   9 files changed, 343 insertions(+), 66 deletions(-)
> >   create mode 100644 lib/test_dynamic_debug_submod.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 00e94bec401e..1c5fcbd9e408 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8139,7 +8139,7 @@ M:      Jim Cromie <jim.cromie@gmail.com>
> >   S:  Maintained
> >   F:  include/linux/dynamic_debug.h
> >   F:  lib/dynamic_debug.c
> > -F:   lib/test_dynamic_debug.c
> > +F:   lib/test_dynamic_debug*.c
> >
> >   DYNAMIC INTERRUPT MODERATION
> >   M:  Tal Gilboa <talgi@nvidia.com>
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
> > index f834ad1fb8c4..fa382caf2ae2 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -367,6 +367,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PRO=
PELLER_CLANG)
> >       /* implement dynamic printk debug */                            \
> >       . =3D ALIGN(8);                                                  =
 \
> >       BOUNDED_SECTION_BY(__dyndbg_class_maps, ___dyndbg_class_maps)   \
> > +     BOUNDED_SECTION_BY(__dyndbg_class_users, ___dyndbg_class_users) \
> >       BOUNDED_SECTION_BY(__dyndbg_descriptors, ___dyndbg_descs)       \
> >       CODETAG_SECTIONS()                                              \
> >       LIKELY_PROFILE()                                                \
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 769f02456c8e..9af825c84e70 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -71,9 +71,28 @@ enum ddebug_class_map_type {
> >        */
> >   };
> >
> > +/*
> > + * dyndbg-classmaps are devised to support DRM.debug directly:
> > + *    10 enum-vals: DRM_UT_* define the categories
> > + *   ~23 categorized *_dbg() macros, each passing a DRM_UT_* val as 1s=
t arg
> > + *     2 macros below them: drm_dev_dbg, __drm_dbg
> > + * ~5000 calls to the categorized macros, across all of drivers/gpu/dr=
m/
> > + *
> > + * When CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy, the 2 low macros are redefin=
ed
> > + * to invoke _dynamic_func_call_cls().  This compiles the category
> > + * into each callsite's class_id field, where dyndbg can select on it
> > + * and alter a callsite's patch-state, avoiding repeated __drm_debug
> > + * checks.
> > + *
> > + * To make the callsites manageable from the >control file, authors
> > + * provide a "classmap" of names to class_ids in use by the module(s),
> > + * usually by stringifying the enum-vals.  Modules with multiple
> > + * classmaps must arrange to share the 0..62 class_id space.
> > + */
> > +
> >   struct _ddebug_class_map {
> > -     struct module *mod;
> > -     const char *mod_name;   /* needed for builtins */
> > +     const struct module *mod;               /* NULL for builtins */
> > +     const char *mod_name;
> >       const char **class_names;
> >       const int length;
> >       const int base;         /* index of 1st .class_id, allows split/s=
hared space */
> > @@ -81,11 +100,34 @@ struct _ddebug_class_map {
> >   };
> >
> >   /**
> > - * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
> > - * @_var:   a struct _ddebug_class_map, passed to module_param_cb
> > - * @_type:  enum class_map_type, chooses bits/verbose, numeric/symboli=
c
> > - * @_base:  offset of 1st class-name. splits .class_id space
> > - * @classes: class-names used to control class'd prdbgs
> > + * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a modu=
le.
> > + * @_var:   name of the classmap, exported for other modules coordinat=
ed use.
> > + * @_mapty: enum ddebug_class_map_type: 0:DISJOINT - independent, 1:LE=
VEL - v2>v1
> > + * @_base:  reserve N classids starting at _base, to split 0..62 class=
id space
> > + * @classes: names of the N classes.
> > + *
> > + * This tells dyndbg what class_ids the module is using: _base..+N, by
> > + * mapping names onto them.  This qualifies "class NAME" >controls on
> > + * the defining module, ignoring unknown names.
> > + */
> > +#define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)       =
       \
> > +     static const char *_var##_classnames[] =3D { __VA_ARGS__ };      =
 \
> > +     extern struct _ddebug_class_map _var;                           \
> > +     struct _ddebug_class_map __aligned(8) __used                    \
> > +             __section("__dyndbg_class_maps") _var =3D {              =
 \
> > +             .mod =3D THIS_MODULE,                                    =
 \
> > +             .mod_name =3D KBUILD_MODNAME,                            =
 \
> > +             .base =3D (_base),                                       =
 \
> > +             .map_type =3D (_mapty),                                  =
 \
> > +             .length =3D ARRAY_SIZE(_var##_classnames),               =
 \
> > +             .class_names =3D _var##_classnames,                      =
 \
> > +     };                                                              \
> > +     EXPORT_SYMBOL(_var)
> > +
> > +/*
> > + * XXX: keep this until DRM adapts to use the DEFINE/USE api, it
> > + * differs from DYNAMIC_DEBUG_CLASSMAP_DEFINE by the lack of the
> > + * extern/EXPORT on the struct init, and cascading thinkos.
> >    */
> >   #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)         \
> >       static const char *_var##_classnames[] =3D { __VA_ARGS__ };      =
 \
> > @@ -99,10 +141,35 @@ struct _ddebug_class_map {
> >               .class_names =3D _var##_classnames,                      =
 \
> >       }
> >
> > +struct _ddebug_class_user {
> > +     char *mod_name;
> > +     struct _ddebug_class_map *map;
> > +};
> > +
> > +/**
> > + * DYNAMIC_DEBUG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere=
.
> > + * @_var: name of the exported classmap var
> > + *
> > + * This tells dyndbg that the module has prdbgs with classids defined
> > + * in the named classmap.  This qualifies "class NAME" >controls on
> > + * the user module, ignoring unknown names.
> > + */
> > +#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)                             \
> > +     DYNAMIC_DEBUG_CLASSMAP_USE_(_var, __UNIQUE_ID(_ddebug_class_user)=
)
> > +#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _uname)                    \
> > +     extern struct _ddebug_class_map _var;                           \
> > +     static struct _ddebug_class_user __aligned(8) __used            \
> > +     __section("__dyndbg_class_users") _uname =3D {                   =
 \
> > +             .mod_name =3D KBUILD_MODNAME,                            =
 \
> > +             .map =3D &(_var),                                        =
 \
> > +     }
> > +
> >   /*
> > - * @_ddebug_info: gathers module/builtin dyndbg_* __sections together.
> > + * @_ddebug_info: gathers module/builtin __dyndbg_<T> __sections
> > + * together, each is a vector: a struct { <T> *addr, int len }.
> > + *
> >    * For builtins, it is used as a cursor, with the inner structs
> > - * marking sub-vectors of the builtin __sections in DATA.
> > + * marking sub-vectors of the builtin __sections in DATA_DATA
>
> DATA_DATA? Is it a typo?
>

No, its the actual name of the macro in vmlinux.lds.h

include/asm-generic/vmlinux.lds.h
355:#define DATA_DATA \
1155: DATA_DATA \


I chose it thinking it was much more specific than just DATA
but it is also used repeatedly elsewhere (as part of symbol-names)

drivers/accel/habanalabs/include/gaudi2/asic_reg/dcore0_sync_mngr_objs_mask=
s.h
42:#define DCORE0_SYNC_MNGR_OBJS_MON_PAY_DATA_DATA_SHIFT 0
43:#define DCORE0_SYNC_MNGR_OBJS_MON_PAY_DATA_DATA_MASK 0xFFFFFFFF

drivers/accel/habanalabs/include/goya/asic_reg/tpc0_eml_cfg_masks.h
245:#define TPC0_EML_CFG_DBG_SPDATA_DATA_SHIFT                           0
246:#define TPC0_EML_CFG_DBG_SPDATA_DATA_MASK
  0xFFFFFFFF
267:#define TPC0_EML_CFG_DBG_AXIHBWDATA_DATA_SHIFT                       0
268:#define TPC0_EML_CFG_DBG_AXIHBWDATA_DATA_MASK
  0xFFFFFFFF
285:#define TPC0_EML_CFG_DBG_AXILBWDATA_DATA_SHIFT                       0
286:#define TPC0_EML_CFG_DBG_AXILBWDATA_DATA_MASK
  0xFFFFFFFF


> With this confirmed:
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> >    */
> >   struct _ddebug_descs {
> >       struct _ddebug *start;
> > @@ -114,10 +181,16 @@ struct _ddebug_class_maps {
> >       int len;
> >   } __packed;
> >
> > +struct _ddebug_class_users {
> > +     struct _ddebug_class_user *start;
> > +     int len;
> > +} __packed;
> > +
> >   struct _ddebug_info {
> >       const char *mod_name;
> >       struct _ddebug_descs descs;
> >       struct _ddebug_class_maps maps;
> > +     struct _ddebug_class_users users;
> >   } __packed;
> >
> >   struct _ddebug_class_param {
> > @@ -218,7 +291,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor=
,
> >    * (|_no_desc):     former gets callsite descriptor as 1st arg (for p=
rdbgs)
> >    */
> >   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {       \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);      \
> >       if (DYNAMIC_DEBUG_BRANCH(id))                           \
> >               func(&id, ##__VA_ARGS__);                       \
> >   } while (0)
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index b60f728e36ac..c203b0694f7e 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -2627,6 +2627,9 @@ static int find_module_sections(struct module *mo=
d, struct load_info *info)
> >       mod->dyndbg_info.maps.start =3D section_objs(info, "__dyndbg_clas=
s_maps",
> >                                                  sizeof(*mod->dyndbg_in=
fo.maps.start),
> >                                                  &mod->dyndbg_info.maps=
.len);
> > +     mod->dyndbg_info.users.start =3D section_objs(info, "__dyndbg_cla=
ss_users",
> > +                                                sizeof(*mod->dyndbg_in=
fo.users.start),
> > +                                                &mod->dyndbg_info.user=
s.len);
> >   #endif
> >
> >       return 0;
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 35796c290ca3..91a75f724c1a 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2905,12 +2905,26 @@ config TEST_STATIC_KEYS
> >         If unsure, say N.
> >
> >   config TEST_DYNAMIC_DEBUG
> > -     tristate "Test DYNAMIC_DEBUG"
> > -     depends on DYNAMIC_DEBUG
> > +     tristate "Build test-dynamic-debug module"
> > +     depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> >       help
> > -       This module registers a tracer callback to count enabled
> > -       pr_debugs in a 'do_debugging' function, then alters their
> > -       enablements, calls the function, and compares counts.
> > +       This module exercises/demonstrates dyndbg's classmap API, by
> > +       creating 2 classes: a DISJOINT classmap (supporting DRM.debug)
> > +       and a LEVELS/VERBOSE classmap (like verbose2 > verbose1).
> > +
> > +       If unsure, say N.
> > +
> > +config TEST_DYNAMIC_DEBUG_SUBMOD
> > +     tristate "Build test-dynamic-debug submodule"
> > +     default m
> > +     depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> > +     depends on TEST_DYNAMIC_DEBUG
> > +     help
> > +       This sub-module uses a classmap defined and exported by the
> > +       parent module, recapitulating drm & driver's shared use of
> > +       drm.debug to control enabled debug-categories.
> > +       It is tristate, independent of parent, to allow testing all
> > +       proper combinations of parent=3Dy/m submod=3Dy/m.
> >
> >         If unsure, say N.
> >
> > diff --git a/lib/Makefile b/lib/Makefile
> > index d5cfc7afbbb8..2c344138d990 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -84,6 +84,7 @@ obj-$(CONFIG_TEST_SORT) +=3D test_sort.o
> >   obj-$(CONFIG_TEST_STATIC_KEYS) +=3D test_static_keys.o
> >   obj-$(CONFIG_TEST_STATIC_KEYS) +=3D test_static_key_base.o
> >   obj-$(CONFIG_TEST_DYNAMIC_DEBUG) +=3D test_dynamic_debug.o
> > +obj-$(CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD) +=3D test_dynamic_debug_submod=
.o
> >   obj-$(CONFIG_TEST_PRINTF) +=3D test_printf.o
> >   obj-$(CONFIG_TEST_SCANF) +=3D test_scanf.o
> >
> > @@ -226,6 +227,8 @@ obj-$(CONFIG_ARCH_NEED_CMPXCHG_1_EMU) +=3D cmpxchg-=
emu.o
> >   obj-$(CONFIG_DYNAMIC_DEBUG_CORE) +=3D dynamic_debug.o
> >   #ensure exported functions have prototypes
> >   CFLAGS_dynamic_debug.o :=3D -DDYNAMIC_DEBUG_MODULE
> > +CFLAGS_test_dynamic_debug.o :=3D -DDYNAMIC_DEBUG_MODULE
> > +CFLAGS_test_dynamic_debug_submod.o :=3D -DDYNAMIC_DEBUG_MODULE
> >
> >   obj-$(CONFIG_SYMBOLIC_ERRNAME) +=3D errname.o
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index a7e1dbb6ead0..53e261dbf81e 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -29,6 +29,7 @@
> >   #include <linux/string_helpers.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/dynamic_debug.h>
> > +
> >   #include <linux/debugfs.h>
> >   #include <linux/slab.h>
> >   #include <linux/jump_label.h>
> > @@ -43,6 +44,8 @@ extern struct _ddebug __start___dyndbg_descs[];
> >   extern struct _ddebug __stop___dyndbg_descs[];
> >   extern struct _ddebug_class_map __start___dyndbg_class_maps[];
> >   extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
> > +extern struct _ddebug_class_user __start___dyndbg_class_users[];
> > +extern struct _ddebug_class_user __stop___dyndbg_class_users[];
> >
> >   struct ddebug_table {
> >       struct list_head link;
> > @@ -159,20 +162,37 @@ static void vpr_info_dq(const struct ddebug_query=
 *query, const char *msg)
> >                 query->first_lineno, query->last_lineno, query->class_s=
tring);
> >   }
> >
> > -static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug=
_table const *dt,
> > -                                                      const char *clas=
s_string,
> > -                                                      int *class_id)
> > +#define vpr_di_info(di_p, msg_p, ...) ({                             \
> > +     struct _ddebug_info const *_di =3D di_p;                         =
 \
> > +     v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, =
\
> > +               _di->mod_name, _di->descs.len, _di->maps.len,         \
> > +               _di->users.len);                                      \
> > +     })
> > +
> > +static struct _ddebug_class_map *
> > +ddebug_find_valid_class(struct _ddebug_info const *di, const char *que=
ry_class, int *class_id)
> >   {
> >       struct _ddebug_class_map *map;
> > +     struct _ddebug_class_user *cli;
> >       int i, idx;
> >
> > -     for_subvec(i, map, &dt->info, maps) {
> > -             idx =3D match_string(map->class_names, map->length, class=
_string);
> > +     for_subvec(i, map, di, maps) {
> > +             idx =3D match_string(map->class_names, map->length, query=
_class);
> >               if (idx >=3D 0) {
> > +                     vpr_di_info(di, "good-class: %s.%s ", map->mod_na=
me, query_class);
> >                       *class_id =3D idx + map->base;
> >                       return map;
> >               }
> >       }
> > +     for_subvec(i, cli, di, users) {
> > +             idx =3D match_string(cli->map->class_names, cli->map->len=
gth, query_class);
> > +             if (idx >=3D 0) {
> > +                     vpr_di_info(di, "class-ref: %s -> %s.%s ",
> > +                                 cli->mod_name, cli->map->mod_name, qu=
ery_class);
> > +                     *class_id =3D idx + cli->map->base;
> > +                     return cli->map;
> > +             }
> > +     }
> >       *class_id =3D -ENOENT;
> >       return NULL;
> >   }
> > @@ -183,8 +203,7 @@ static struct _ddebug_class_map *ddebug_find_valid_=
class(struct ddebug_table con
> >    * callsites, normally the same as number of changes.  If verbose,
> >    * logs the changes.  Takes ddebug_lock.
> >    */
> > -static int ddebug_change(const struct ddebug_query *query,
> > -                      struct flag_settings *modifiers)
> > +static int ddebug_change(const struct ddebug_query *query, struct flag=
_settings *modifiers)
> >   {
> >       int i;
> >       struct ddebug_table *dt;
> > @@ -204,7 +223,8 @@ static int ddebug_change(const struct ddebug_query =
*query,
> >                       continue;
> >
> >               if (query->class_string) {
> > -                     map =3D ddebug_find_valid_class(dt, query->class_=
string, &valid_class);
> > +                     map =3D ddebug_find_valid_class(&dt->info, query-=
>class_string,
> > +                                                   &valid_class);
> >                       if (!map)
> >                               continue;
> >               } else {
> > @@ -569,7 +589,7 @@ static int ddebug_exec_query(char *query_string, co=
nst char *modname)
> >
> >   /* handle multiple queries in query string, continue on error, return
> >      last error or number of matching callsites.  Module name is either
> > -   in param (for boot arg) or perhaps in query string.
> > +   in the modname arg (for boot args) or perhaps in query string.
> >   */
> >   static int ddebug_exec_queries(char *query, const char *modname)
> >   {
> > @@ -700,7 +720,7 @@ static int param_set_dyndbg_module_classes(const ch=
ar *instr,
> >   /**
> >    * param_set_dyndbg_classes - classmap kparam setter
> >    * @instr: string echo>d to sysfs, input depends on map_type
> > - * @kp:    kp->arg has state: bits/lvl, map, map_type
> > + * @kp:    kp->arg has state: bits/lvl, classmap, map_type
> >    *
> >    * enable/disable all class'd pr_debugs in the classmap. For LEVEL
> >    * map-types, enforce * relative levels by bitpos.
> > @@ -737,6 +757,7 @@ int param_get_dyndbg_classes(char *buffer, const st=
ruct kernel_param *kp)
> >       default:
> >               return -1;
> >       }
> > +     return 0;
> >   }
> >   EXPORT_SYMBOL(param_get_dyndbg_classes);
> >
> > @@ -1049,12 +1070,17 @@ static void *ddebug_proc_next(struct seq_file *=
m, void *p, loff_t *pos)
> >   static const char *ddebug_class_name(struct _ddebug_info *di, struct =
_ddebug *dp)
> >   {
> >       struct _ddebug_class_map *map;
> > +     struct _ddebug_class_user *cli;
> >       int i;
> >
> >       for_subvec(i, map, di, maps)
> >               if (class_in_range(dp->class_id, map))
> >                       return map->class_names[dp->class_id - map->base]=
;
> >
> > +     for_subvec(i, cli, di, users)
> > +             if (class_in_range(dp->class_id, cli->map))
> > +                     return cli->map->class_names[dp->class_id - cli->=
map->base];
> > +
> >       return NULL;
> >   }
> >
> > @@ -1135,9 +1161,85 @@ static const struct proc_ops proc_fops =3D {
> >       .proc_write =3D ddebug_proc_write
> >   };
> >
> > -static void ddebug_attach_module_classes(struct ddebug_table *dt, stru=
ct _ddebug_info *di)
> > +#define vpr_cm_info(cm_p, msg_fmt, ...) ({                           \
> > +     struct _ddebug_class_map const *_cm =3D cm_p;                    =
 \
> > +     v2pr_info(msg_fmt " %s [%d..%d] %s..%s\n", ##__VA_ARGS__,       \
> > +               _cm->mod_name, _cm->base, _cm->base + _cm->length,    \
> > +               _cm->class_names[0], _cm->class_names[_cm->length - 1])=
; \
> > +     })
> > +
> > +static void ddebug_sync_classbits(const struct kernel_param *kp, const=
 char *modname)
> > +{
> > +     const struct _ddebug_class_param *dcp =3D kp->arg;
> > +
> > +     /* clamp initial bitvec, mask off hi-bits */
> > +     if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
> > +             *dcp->bits &=3D CLASSMAP_BITMASK(dcp->map->length);
> > +             v2pr_info("preset classbits: %lx\n", *dcp->bits);
> > +     }
> > +     /* force class'd prdbgs (in USEr module) to match (DEFINEr module=
) class-param */
> > +     ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
> > +     ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
> > +}
> > +
> > +static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> > +                                   const struct _ddebug_class_map *map=
,
> > +                                   const char *mod_name)
> > +{
> > +     struct _ddebug_class_param *dcp;
> > +
> > +     if (kp->ops !=3D &param_ops_dyndbg_classes)
> > +             return;
> > +
> > +     dcp =3D (struct _ddebug_class_param *)kp->arg;
> > +
> > +     if (map =3D=3D dcp->map) {
> > +             v2pr_info(" kp:%s.%s =3D0x%lx", mod_name, kp->name, *dcp-=
>bits);
> > +             vpr_cm_info(map, " %s mapped to: ", mod_name);
> > +             ddebug_sync_classbits(kp, mod_name);
> > +     }
> > +}
> > +
> > +static void ddebug_apply_params(const struct _ddebug_class_map *cm, co=
nst char *mod_name)
> > +{
> > +     const struct kernel_param *kp;
> > +#if IS_ENABLED(CONFIG_MODULES)
> > +     int i;
> > +
> > +     if (cm->mod) {
> > +             vpr_cm_info(cm, "loaded classmap: %s", mod_name);
> > +             /* ifdef protects the cm->mod->kp deref */
> > +             for (i =3D 0, kp =3D cm->mod->kp; i < cm->mod->num_kp; i+=
+, kp++)
> > +                     ddebug_match_apply_kparam(kp, cm, mod_name);
> > +     }
> > +#endif
> > +     if (!cm->mod) {
> > +             vpr_cm_info(cm, "builtin classmap: %s", mod_name);
> > +             for (kp =3D __start___param; kp < __stop___param; kp++)
> > +                     ddebug_match_apply_kparam(kp, cm, mod_name);
> > +     }
> > +}
> > +
> > +static void ddebug_apply_class_maps(const struct _ddebug_info *di)
> > +{
> > +     struct _ddebug_class_map *cm;
> > +     int i;
> > +
> > +     for_subvec(i, cm, di, maps)
> > +             ddebug_apply_params(cm, cm->mod_name);
> > +
> > +     vpr_di_info(di, "attached %d classmaps to module: %s ", i, cm->mo=
d_name);
> > +}
> > +
> > +static void ddebug_apply_class_users(const struct _ddebug_info *di)
> >   {
> > -     vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt=
->info.maps.len);
> > +     struct _ddebug_class_user *cli;
> > +     int i;
> > +
> > +     for_subvec(i, cli, di, users)
> > +             ddebug_apply_params(cli->map, cli->mod_name);
> > +
> > +     vpr_di_info(di, "attached %d class-users to module: %s ", i, cli-=
>mod_name);
> >   }
> >
> >   /*
> > @@ -1173,6 +1275,7 @@ static int ddebug_add_module(struct _ddebug_info =
*di)
> >   {
> >       struct ddebug_table *dt;
> >       struct _ddebug_class_map *cm;
> > +     struct _ddebug_class_user *cli;
> >       int i;
> >
> >       if (!di->descs.len)
> > @@ -1196,14 +1299,18 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di)
> >       INIT_LIST_HEAD(&dt->link);
> >
> >       dd_mark_vector_subrange(i, dt, cm, di, maps);
> > +     dd_mark_vector_subrange(i, dt, cli, di, users);
> >
> > -     if (di->maps.len)
> > -             ddebug_attach_module_classes(dt, di);
> > +     if (dt->info.maps.len)
> > +             ddebug_apply_class_maps(&dt->info);
> >
> >       mutex_lock(&ddebug_lock);
> >       list_add_tail(&dt->link, &ddebug_tables);
> >       mutex_unlock(&ddebug_lock);
> >
> > +     if (dt->info.users.len)
> > +             ddebug_apply_class_users(&dt->info);
> > +
> >       vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mo=
d_name);
> >       return 0;
> >   }
> > @@ -1354,8 +1461,10 @@ static int __init dynamic_debug_init(void)
> >       struct _ddebug_info di =3D {
> >               .descs.start =3D __start___dyndbg_descs,
> >               .maps.start  =3D __start___dyndbg_class_maps,
> > +             .users.start =3D __start___dyndbg_class_users,
> >               .descs.len =3D __stop___dyndbg_descs - __start___dyndbg_d=
escs,
> >               .maps.len  =3D __stop___dyndbg_class_maps - __start___dyn=
dbg_class_maps,
> > +             .users.len =3D __stop___dyndbg_class_users - __start___dy=
ndbg_class_users,
> >       };
> >
> >   #ifdef CONFIG_MODULES
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 9c3e53cd26bd..1070107f74f1 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -6,11 +6,30 @@
> >    *      Jim Cromie  <jim.cromie@gmail.com>
> >    */
> >
> > -#define pr_fmt(fmt) "test_dd: " fmt
> > +/*
> > + * This file is built 2x, also making test_dynamic_debug_submod.ko,
> > + * whose 2-line src file #includes this file.  This gives us a _submod
> > + * clone with identical pr_debugs, without further maintenance.
> > + *
> > + * If things are working properly, they should operate identically
> > + * when printed or adjusted by >control.  This eases visual perusal of
> > + * the logs, and simplifies testing, by easing the proper accounting
> > + * of expectations.
> > + *
> > + * It also puts both halves of the subsystem _DEFINE & _USE use case
> > + * together, and integrates the common ENUM providing both class_ids
> > + * and class-names to both _DEFINErs and _USERs.  I think this makes
> > + * the usage clearer.
> > + */
> > +#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
> > +  #define pr_fmt(fmt) "test_dd_submod: " fmt
> > +#else
> > +  #define pr_fmt(fmt) "test_dd: " fmt
> > +#endif
> >
> >   #include <linux/module.h>
> >
> > -/* run tests by reading or writing sysfs node: do_prints */
> > +/* re-gen output by reading or writing sysfs node: do_prints */
> >
> >   static void do_prints(void); /* device under test */
> >   static int param_set_do_prints(const char *instr, const struct kernel=
_param *kp)
> > @@ -29,24 +48,39 @@ static const struct kernel_param_ops param_ops_do_p=
rints =3D {
> >   };
> >   module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
> >
> > -/*
> > - * Using the CLASSMAP api:
> > - * - classmaps must have corresponding enum
> > - * - enum symbols must match/correlate with class-name strings in the =
map.
> > - * - base must equal enum's 1st value
> > - * - multiple maps must set their base to share the 0-30 class_id spac=
e !!
> > - *   (build-bug-on tips welcome)
> > - * Additionally, here:
> > - * - tie together sysname, mapname, bitsname, flagsname
> > - */
> > -#define DD_SYS_WRAP(_model, _flags)                                  \
> > -     static unsigned long bits_##_model;                             \
> > -     static struct _ddebug_class_param _flags##_model =3D {           =
 \
> > +#define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base=
))
> > +
> > +/* sysfs param wrapper, proto-API */
> > +#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)         \
> > +     static unsigned long bits_##_model =3D _init;                    =
 \
> > +     static struct _ddebug_class_param _flags##_##_model =3D {        =
 \
> >               .bits =3D &bits_##_model,                                =
 \
> >               .flags =3D #_flags,                                      =
 \
> >               .map =3D &map_##_model,                                  =
 \
> >       };                                                              \
> > -     module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_f=
lags##_model, 0600)
> > +     module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,   \
> > +                     &_flags##_##_model, 0600)
> > +#ifdef DEBUG
> > +#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)         \
> > +     DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
> > +#else
> > +#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)         \
> > +     DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
> > +#endif
> > +
> > +/*
> > + * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
> > + *
> > + * To comport with DRM debug-category (an int), classmaps map names to
> > + * ids (also an int).  So a classmap starts with an enum; DRM has enum
> > + * debug_category: with DRM_UT_<CORE,DRIVER,KMS,etc>.  We use the enum
> > + * values as class-ids, and stringified enum-symbols as classnames.
> > + *
> > + * Modules with multiple CLASSMAPS must have enums with distinct
> > + * value-ranges, as arranged below with explicit enum_sym =3D X inits.
> > + * To clarify this sharing, declare the 2 enums now, for the 2
> > + * different classmap types
> > + */
> >
> >   /* numeric input, independent bits */
> >   enum cat_disjoint_bits {
> > @@ -60,26 +94,51 @@ enum cat_disjoint_bits {
> >       D2_LEASE,
> >       D2_DP,
> >       D2_DRMRES };
> > -DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS=
, 0,
> > -                     "D2_CORE",
> > -                     "D2_DRIVER",
> > -                     "D2_KMS",
> > -                     "D2_PRIME",
> > -                     "D2_ATOMIC",
> > -                     "D2_VBL",
> > -                     "D2_STATE",
> > -                     "D2_LEASE",
> > -                     "D2_DP",
> > -                     "D2_DRMRES");
> > -DD_SYS_WRAP(disjoint_bits, p);
> > -DD_SYS_WRAP(disjoint_bits, T);
> > -
> > -/* numeric verbosity, V2 > V1 related */
> > -enum cat_level_num { V0 =3D 14, V1, V2, V3, V4, V5, V6, V7 };
> > -DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
> > -                    "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
> > -DD_SYS_WRAP(level_num, p);
> > -DD_SYS_WRAP(level_num, T);
> > +
> > +/* numeric verbosity, V2 > V1 related.  V0 is > D2_DRM_RES */
> > +enum cat_level_num { V0 =3D 16, V1, V2, V3, V4, V5, V6, V7 };
> > +
> > +/* recapitulate DRM's multi-classmap setup */
> > +#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
> > +/*
> > + * In single user, or parent / coordinator (drm.ko) modules, define
> > + * classmaps on the client enums above, and then declares the PARAMS
> > + * ref'g the classmaps.  Each is exported.
> > + */
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOIN=
T_BITS,
> > +                           D2_CORE,
> > +                           "D2_CORE",
> > +                           "D2_DRIVER",
> > +                           "D2_KMS",
> > +                           "D2_PRIME",
> > +                           "D2_ATOMIC",
> > +                           "D2_VBL",
> > +                           "D2_STATE",
> > +                           "D2_LEASE",
> > +                           "D2_DP",
> > +                           "D2_DRMRES");
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
> > +                           V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6=
", "V7");
> > +
> > +/*
> > + * now add the sysfs-params
> > + */
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
> > +DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
> > +
> > +#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
> > +
> > +/*
> > + * in submod/drm-drivers, use the classmaps defined in top/parent
> > + * module above.
> > + */
> > +
> > +DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
> > +DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
> > +
> > +#endif
> >
> >   /* stand-in for all pr_debug etc */
> >   #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
> > @@ -115,6 +174,7 @@ static void do_levels(void)
> >
> >   static void do_prints(void)
> >   {
> > +     pr_debug("do_prints:\n");
> >       do_cats();
> >       do_levels();
> >   }
> > diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_s=
ubmod.c
> > new file mode 100644
> > index 000000000000..672aabf40160
> > --- /dev/null
> > +++ b/lib/test_dynamic_debug_submod.c
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Kernel module for testing dynamic_debug
> > + *
> > + * Authors:
> > + *      Jim Cromie   <jim.cromie@gmail.com>
> > + */
> > +
> > +/*
> > + * clone the parent, inherit all the properties, for consistency and
> > + * simpler accounting in test expectations.
> > + */
> > +#define TEST_DYNAMIC_DEBUG_SUBMOD
> > +#include "test_dynamic_debug.c"
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
