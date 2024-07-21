Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CC938428
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2024 11:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D47F10E0A4;
	Sun, 21 Jul 2024 09:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PPlJ2DMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F241510E20E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 09:06:54 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52f01ec08d6so262523e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721552813; x=1722157613;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6gYokjRSWyrNGMR3J1P9KDvWZ1pohzgfwduMDyakus=;
 b=PPlJ2DMnLjPQoNhT2RAvSSUg06wHUKvwW+wG89XXO+WLH+ydwV5zpVWdlw6L5L33Cn
 isFGyMd4Unuvt6mXpbfHzE6Af5kx2t8rb5/y3Ta/1+tNA0itWtsWgEkSeSqjpKI8LWL8
 dfqdhzn3x27CHloY67Z2IRhaAZtgcHhZp54JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721552813; x=1722157613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6gYokjRSWyrNGMR3J1P9KDvWZ1pohzgfwduMDyakus=;
 b=iMzlTZzqfqg2S6Tefcly/mFP6xTJrP6ak/o7TMRNBJ54yGX1WtGMqxyz5tvref1Gux
 Ws/UlVOAP6NrVRvX66rnEF/+nif6FV6G/rVj5egw21MJIjUCVvUaoF4bgJh+hqCE3FEo
 6IpRjJLTwq9SlxmDR6lpKv/QRdtGuCmAEf5zu4jq157MCcbgy0OUrw+et+eNayNLGbEH
 abfNweNMkFYNEEWW5b2ju2X+u7xUbd6jt02U/poLWUPwQwzoKVpliAmRzaHkLMLE1M34
 3/0n5C1/h05vwX0GkaxfFjxVbnczsP/4k/oGJi83Dnrw18kxmpp6i1crWwp2VxUzpQot
 C0eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwDLHzv9IaycDPHeYTe2FaQXN+AaqN/zJmAa9Utg0rD0yB3+/Be6U6XW8f/rc93coXhHYld9lNVt7Ncxg+rnDgFbYezv7OWAO7vfNCoCJZ
X-Gm-Message-State: AOJu0Ywgy00jAKk3rOGKQfnxrYGE1w5dMF8BvLOr5gf7NawQh3DTNKsi
 2euuL0be/UP+sGUeKSV+n+6VFYuulZr/3oEXt9WCAeOXKmGrArcOEDbygYQjK1H8z8j4ProiKhg
 f9RIuS63ZW+BOornIrr6aQam78VV/joPNebA=
X-Google-Smtp-Source: AGHT+IFqqF14ze8eJiQnLsa6jy6P5mRFw4qxCuKyOXhmyr/g7mK/5hOqfuA6Mw3zy4+1u4v/qZ7NbCSuvMtryzribRk=
X-Received: by 2002:a05:6512:3d0f:b0:52c:896f:930d with SMTP id
 2adb3069b0e04-52ee543eb1fmr8601569e87.57.1721552812560; Sun, 21 Jul 2024
 02:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Sun, 21 Jul 2024 11:06:30 +0200
Message-ID: <CALwA+NbGf80zX1-CLof7OSpA4dQELuC7Ue7Xy2zQYmGJKgJcBQ@mail.gmail.com>
Subject: Re: [PATCH v9-resend 00/54] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: Jim Cromie <jim.cromie@gmail.com>
Cc: linux-kernel@vger.kernel.org, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, linux@rasmusvillemoes.dk, joe@perches.com, 
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com, 
 groeck@google.com, yanivt@google.com, bleung@google.com, 
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org
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

On Tue, Jul 16, 2024 at 8:58=E2=80=AFPM Jim Cromie <jim.cromie@gmail.com> w=
rote:
>
> resending to fix double-copies of a dozen patches.
> added 2 squash-ins to address Ville's designated-initializer comment.
>
> This fixes dynamic-debug support for DRM.debug, added via classmaps.
> commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
>
> CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because drm.debug=3Dva=
l
> was applied when drm.ko was modprobed; too early for the yet-to-load
> drivers, which thus missed the enablement.  My testing with
> /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycmd options
> obscured this omission.
>
> The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
> DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for drivers.
> The distinction allows dyndbg to also handle the users properly.
>
> DRM is the only current classmaps user, and is not actually using it,
> so if you think DRM could benefit from zero-off-cost debugs based on
> static-keys, please test.
>
> There is also a no-DRM-involved selftest script:
>
>  [root@v6 b0-dd]# V=3D0 ./tools/testing/selftests/dynamic_debug/dyndbg_se=
lftest.sh
>  # consulting KCONFIG_CONFIG: .config
>  # BASIC_TESTS
>  : 0 matches on =3Dp
>  : 14 matches on =3Dp
>  : 0 matches on =3Dp
>  : 21 matches on =3Dmf
>  : 0 matches on =3Dml
>  : 6 matches on =3Dmfl
>  ...
>  # Done on: Sun Jun 30 10:34:24 PM MDT 2024
>
> HISTORY
>
> 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dyndbg parts
> 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm parts
>
> https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> greg k-h says:
> This should go through the drm tree now.  The rest probably should also
> go that way and not through my tree as well.
>
> https://lore.kernel.org/lkml/20221206003424.592078-1-jim.cromie@gmail.com=
/
> v1- RFC adds DYNDBG_CLASSMAP_DEFINE + test-submod to recap DRM failure
>
> https://lore.kernel.org/lkml/20230113193016.749791-1-jim.cromie@gmail.com=
/
> v2- w RFC on "tolerate toggled state"
>
> https://lore.kernel.org/lkml/Y8aNMxHpvZ8qecSc@hirez.programming.kicks-ass=
.net/
> - PeterZ - nacks tolerance of insane/uninit static-key state
>
> https://lore.kernel.org/lkml/8ca08fba-1120-ca86-6129-0b33afb4a1da@akamai.=
com/
> - JasonB diagnoses prob - set jump-label b4 init
>
> 7deabd674988 dyndbg: use the module notifier callbacks
> - JasonB lands fix for my problem
>   he moves dyndbg to use notifiers to do init, like & after jump-labels
>
> https://lore.kernel.org/lkml/20230125203743.564009-20-jim.cromie@gmail.co=
m/
> v3- probing, workaround-ish
>
> https://lore.kernel.org/lkml/20230713163626.31338-1-jim.cromie@gmail.com/
> v4 - 7/13/23
> - had extra/unused __UNIQUE_ID warnings/errs on lkp-tested arches
>   due to unmatched __used marks
> - RandyD doc fixes, thx.
>
> https://lore.kernel.org/lkml/20230801170255.163237-1-jim.cromie@gmail.com=
/
> v5 - 8/1/23
> - lkp-test reported panics-on-boot
>   https://lore.kernel.org/lkml/202308031432.fcb4197-oliver.sang@intel.com=
/
> - DRM=3Dy in apply-params
> - missing align(8) in init-macro, failed only for builtin modules
>
> https://lore.kernel.org/lkml/20230911230838.14461-1-jim.cromie@gmail.com/
> v6 - 9/11/23 - no feedback
>
> v7[a-d] - attempts to get into/thru DRM patchwork CI..
> - "jenius" struck, I preserved DECLARE_DYNDBG_CLASSMAP til later
>
> v8[a-i] - added tools/testing/selftests/dynamic_debug/*
> - now turnkey testable without DRM
>
>
> CLASSMAPS FROM THE TOP
>
> dynamic-debug classmap's primary goal was to bring zero-off-cost
> debugs, via static-keys, to DRM.
>
> drm.debug:
>
> is ~5000 invocations of debug-macros across core, drivers, helpers;
> each in 1 of 10 exclusive categories: DRM_UT_*, kept in an enum/int,
> and passed in 1st macro-arg, as a builtin-constant.
>
> The 10 categories are all controlled together, by bits 0..9 in a sysfs
> knob.
>
>   drm.debug=3D0x1ff  # bootarg
>   echo 0x4 > /sys/module/drm/parameters/debug  # run-time setting
>
> Keeping all that unchanged was a firm design requirement for classmaps.
>
> Below the sysfs interface, classmaps are exposed in the >control
> grammar with a new "class" keyword.  This is mostly like the other
> selector keywords, differing by:
>
> a- classnames are client/subsystem/domain defined, not code-name-structur=
al.
>    the classnames are global, across system
>    IOW: "class DRM_UT_CORE" selects on any module which knows the class
>
> b- classes are protected from unqualified modification.
>
>    # cannot disable any DRM (or other) classes without saying so
>    echo -p > /proc/dynamic_debug/control
>
> c- because b, modules must opt-in so dyndbg knows their classnames.
>    without names, dyndbg cannot lookup the classid & change the class.
>
> d- classes don't have wildcards - add if needed.
>    DRM uses "${SUBSYS}_${CATNAME}"
>    probably more useful with "${TOP}_${MID}_${LOW}" classnames
>    nobody's sure what _UT_ is.
>
> API in use:
>
> DYNDBG_CLASSMAP_* macros are all file-scope declarators.
>
> 1. DYNDBG_CLASSMAP_DEFINE(drm_debug_classes, ...);
> 2. DYNDBG_CLASSMAP_USE(drm_debug_classes);
>
> Classmaps get DEFINEd once (in drm.ko for core) and USEd (in drivers
> and helpers), these declarations 1. define and export a classmap (in
> core module), and 2. refer to the exported class-struct from the other
> modules.
>
> They both tell dynamic-debug that the module has some of these class'd
> pr_debugs, so dyndbg can use the classmap's names to validate >control
> inputs and change the callsites.  This is the opt-in.
>
> The distinction allows USErs to act differently than the DEFINEr; they
> have to follow the ref back to the DEFINEing module, find the kparam
> connected to the classmap, and lookup and apply its modprobed value.
> (this is the bug-fix).
>
> Dyndbg uses the classnames to validate "class FOO" >control inputs,
> and apply the changes to each module that has DEFINEd or USEd the
> classmap.
>
> This makes classmaps opt-in: modules must _DEFINE or _USE a classmap
> for their class'd pr_debug()s to be >control'd.
>
> NOTE: __pr_dbg_class(1, "const-int unreachable class 1"); is legal,
> but not controllable unless the const 1 has been mapped to a _DEFINE'd
> classname.
>
> NB: and __pr_dbg_class(i++, "undeclared class") is illegal.
>
> In drm_print.c we have: (theres room for better words...)
>
> /* classnames must match value-symbols of enum drm_debug_category */
> DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
>                     DRM_UT_CORE, // _base
>                     /* this effectively names the bits in drm.debug */
>                     "DRM_UT_CORE",
>                     "DRM_UT_DRIVER",
>                     "DRM_UT_KMS",
>                     "DRM_UT_PRIME",
>                     "DRM_UT_ATOMIC",
>                     "DRM_UT_VBL",
>                     "DRM_UT_STATE",
>                     "DRM_UT_LEASE",
>                     "DRM_UT_DP",
>                     "DRM_UT_DRMRES");
>
> This maps the sequence of "classnames" to ints starting with DRM_UT_CORE.
> other _bases allow sharing the per-module 0..62 class-id space.
> (63 is default/unclassed/common prdbg).
>
> Only complete, linear maps are recommended.  This suits DRM.
>
> DYNDBG_CLASSMAP_PARAM_REF() creates the sysfs-kparam classbits knob,
> binding the extern'd long-int/bitvec to the classmap.  The extern
> insures that old users of __drm_debug can still check its value.
>
> DRM's categories are independent of each other.  The other possible
> classmap-type/behavior is "related", ie somehow "ordered": V3>V2.  The
> relatedness of classes in a classmap is enforced at the kparam, where
> they are all set together, not at the >control interface.
>
> THE PATCHSET has 2 halves:
>
> 1- dynamic-debug fix - API change
>
> The root cause was DECLARE_DYNDBG_CLASSMAP tried to do too much, and
> its use in both core and drivers, helpers couldnt sort the difference.
>
> The fix is to replace it with DYNDBG_CLASSMAP_DEFINE in core, and
> DYNDBG_CLASSMAP_USE in drivers,helpers. The 1st differs from -v1 by
> exporting the classmap, allowing 2nd to ref it.  They respectively add
> records to 2 ELF sections in the module.
>
> Now, dyndbg's on-modprobe handler follows the _USE/refs to the owning
> module, finds the controlling kparam: drm.debug, and applies its value
> thru the classmap, to the module's pr_debugs.
>
> A selftest script is included:
>   :#> ./tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
>
> It recapitulates the DRM regression scenario using the 2 test modules.
> The test verifies that the dependent module is initialized properly
> from the parent's classmap kparam, and the classed prdbgs get enabled.
>
> This latest rev fixes the test for the various CONFIG_DYNAMIC_DEBUG*
> build combos, by skipping some subtests where the expected counts are
> wrong. Lukasz Bartosik caught this - thanks.
> CC: ukaszb@chromium.org
>
> And 2 tweaks to kdoc & howto, to steer api users away from using
> designated initializers to _DEFINE the classmap.
>
>
> 2- DRM fixes - use new api.
>
> a. update core/drivers to invoke DRM_CLASSMAP_DEFINE/_USE
> b. wrap DYNDBG_CLASSMAP_* with DRM_CLASSMAP_* - hide ifdef
>
> c. now with separate +DRM_CLASSMAP_USE patches for each driver/helper:
> d. and defer dropping DECLARE_DYNDBG_CLASSMAP til later
>
> Maybe theres a single place to invoke DRM_CLASSMAP_USE just once,
> perhaps from a client library c-file. I poked a little, didn't find it.
> It would be a bit obscured for an opt-in style declaration.
>
> Patches are against v6.10
> theyre also at:
> tree/branch: https://github.com/jimc/linux.git dd-fix-9d
> and lkp-robot told me:
> [jimc:dd-fix-9d] BUILD SUCCESS 7c38f1d94f9919fec887113b620b83d60061c035
>
>
> Finally, classmaps are in a meta-stable state right now; some governor
> might yet walk it over to the gravel pit out back.
>
> Tested-bys would help greatly, help get it off the fence it straddles.
> Please specify your test method: selftest or drm.debug=3D0x1ff boot.
>
> Next Im gonna try to haul this over to the freedesktop DRM-CI river,
> presuming I can find the way (accts,etc)
>
> Also entertaining Reviewed-bys :-}
>
> Jim Cromie (54):
>
> DYNAMIC-DEBUG parts:
>
> cleanup:
>   docs/dyndbg: update examples \012 to \n
>   test-dyndbg: fixup CLASSMAP usage error
>   dyndbg: reword "class unknown," to "class:_UNKNOWN_"
>   dyndbg: make ddebug_class_param union members same size
>   dyndbg: replace classmap list with a vector
>
> prep:
>   dyndbg: ddebug_apply_class_bitmap - add module arg, select on it
>   dyndbg: split param_set_dyndbg_classes to _module & wrapper fns
>   dyndbg: drop NUM_TYPE_ARRAY
>   dyndbg: reduce verbose/debug clutter
>   dyndbg: silence debugs with no-change updates
>   dyndbg: tighten ddebug_class_name() 1st arg type
>   dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
>   dyndbg: reduce verbose=3D3 messages in ddebug_add_module
>
> API changes & selftest:
>   dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
>   dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP
>   selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
>   dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
>   dyndbg-doc: add classmap info to howto
>   dyndbg: treat comma as a token separator
>   selftests-dyndbg: add comma_terminator_tests
>   dyndbg: split multi-query strings with %
>   selftests-dyndbg: test_percent_splitting
>   docs/dyndbg: explain new delimiters: comma, percent
>   selftests-dyndbg: add test_mod_submod
>   dyndbg-doc: explain flags parse 1st
>   dyndbg: change __dynamic_func_call_cls* macros into expressions
>   selftests-dyndbg: check KCONFIG_CONFIG to avoid silly fails
>   dyndbg-selftest: reduce default verbosity
>
> DRM-parts:
>
>   drm: use correct ccflags-y spelling
>   drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
>   drm-dyndbg: adapt DRM to invoke DYNDBG_CLASSMAP_PARAM
>   drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
>   drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
>   drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
>   drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
>   drm-dyndbg: DRM_CLASSMAP_USE in nouveau
>   drm-print: workaround unused variable compiler meh
>   drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
>   drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
>   drm-dyndbg: add DRM_CLASSMAP_USE to bochs
>   drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
>   drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to radeon
>   drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
>   drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
>   drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
>
> added in -resend (will squash back in):
>
>   dyndbg: tighten up kdoc about DYNDBG_CLASSMAP_* macros
>   docs-dyndbg: improve howto classmaps api section
>
>  .../admin-guide/dynamic-debug-howto.rst       | 113 ++++-
>  MAINTAINERS                                   |   3 +-
>  drivers/gpu/drm/Kconfig                       |   3 +-
>  drivers/gpu/drm/Makefile                      |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
>  drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
>  drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +
>  drivers/gpu/drm/drm_print.c                   |  38 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
>  drivers/gpu/drm/gma500/psb_drv.c              |   2 +
>  drivers/gpu/drm/gud/gud_drv.c                 |   2 +
>  drivers/gpu/drm/i915/i915_params.c            |  12 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
>  drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
>  drivers/gpu/drm/tiny/bochs.c                  |   2 +
>  drivers/gpu/drm/tiny/simpledrm.c              |   2 +
>  drivers/gpu/drm/udl/udl_main.c                |   2 +
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
>  drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
>  drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
>  include/asm-generic/vmlinux.lds.h             |   1 +
>  include/drm/drm_print.h                       |  10 +
>  include/linux/dynamic_debug.h                 | 145 ++++--
>  kernel/module/main.c                          |   3 +
>  lib/Kconfig.debug                             |  24 +-
>  lib/Makefile                                  |   3 +
>  lib/dynamic_debug.c                           | 436 +++++++++++-------
>  lib/test_dynamic_debug.c                      | 131 +++---
>  lib/test_dynamic_debug_submod.c               |  17 +
>  tools/testing/selftests/Makefile              |   1 +
>  .../testing/selftests/dynamic_debug/Makefile  |   9 +
>  tools/testing/selftests/dynamic_debug/config  |   2 +
>  .../dynamic_debug/dyndbg_selftest.sh          | 375 +++++++++++++++
>  37 files changed, 1042 insertions(+), 363 deletions(-)
>  create mode 100644 lib/test_dynamic_debug_submod.c
>  create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
>  create mode 100644 tools/testing/selftests/dynamic_debug/config
>  create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest=
.sh
>
> --
> 2.45.2
>

Tested-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

Here is what I tested in virtme-ng:
TEST_DYNAMIC_DEBUG=3DM and TEST_DYNAMIC_DEBUG_SUBMOD=3DM
BASIC_TESTS, COMMA_TERMINATOR_TESTS, TEST_PERCENT_SPLITTING and
TEST_MOD_SUBMOD selftests passed

TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DM
BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were skipped

TEST_DYNAMIC_DEBUG=3DY and TEST_DYNAMIC_DEBUG_SUBMOD=3DY
BASIC_TESTS and COMMA_TERMINATOR_TESTS selftests passed,
TEST_PERCENT_SPLITTING and TEST_PERCENT_SPLITTING selftests were skipped

I also did manual testing by enabling/disabling different classes from
the kernel command line with drm.debug param
and verified they are correctly reflected in cat /proc/dynamic_debug/contro=
l.

All the above LGTM.
