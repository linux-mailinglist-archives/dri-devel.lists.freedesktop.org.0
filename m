Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D558DB99
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 18:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C397A8CD6;
	Tue,  9 Aug 2022 16:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0703914AFF8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 16:05:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z12so14819730wrs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=R9GTsZP3gf4/RpK3VtRq0TZQfC/aNZxK4ovfMtKphuA=;
 b=SGfvEGRMEetx+gnKZwEk7qXRZLuhMOjKpjjliFKpt7Xy2uUOl7pVAoL9rERUa8Gr98
 P3jtdS46DUt7ltK2a9/7ef+yiKKh8DGqciqxMldWT4Q+DAkihZ5w8yto4niP4PH+sx0U
 nz2QItETRRBoOQOppHURAPzbdArsRUCEyhbVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=R9GTsZP3gf4/RpK3VtRq0TZQfC/aNZxK4ovfMtKphuA=;
 b=HF+jxgq2nPFXLXmIAJnRdAcv1p5WNY4wMPJM5dSnVAdxUEFm8cmSsrhAF0+ElE+2Nz
 nhVXN6yFfHIGw/3xOTa+sPke0jfzA9BBIWwFawcZ6R3vFiWKIoR5kJ8bSnwin/epzIv/
 XXxjlvXB9PAX7i/j/FtWJaMnZP5qTAJb/JLSmie3ANjo79g+5OjxsjbLc3S5Akf2SEe0
 RK1Y3QZynKjy4U2+JH1PotJa1IR5W3FflP8JkINyjqNcaYnRgFRL/fPkbul2pm5wv+VD
 J7hDmiMrmJqByDZ9t+G+aGXfgDDwDilN7kK/OhDHLBoeW9dhSwxd4PVolw46/2Aul3TQ
 I7ew==
X-Gm-Message-State: ACgBeo2rLH1YTtiftj4JblXzTvs6UVQ/JMxUy46Kp3mI1lhFaj/hvKog
 Kk4wc2OrmnrlmJx3bEzr73d2Pg==
X-Google-Smtp-Source: AA6agR4sZViGMmWfeljXHTF1LjkIozuvP6lk74A9t0DINg2mcNBOvl1YXtJjxbLAXvgn4OGanJd+ZQ==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id
 u10-20020a5d434a000000b0021daa7eb1bbmr15599576wrr.619.1660061098232; 
 Tue, 09 Aug 2022 09:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003a308e9a192sm25766542wmq.30.2022.08.09.09.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:04:57 -0700 (PDT)
Date: Tue, 9 Aug 2022 18:04:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v5 00/33] DYNDBG: opt-in class'd debug for modules, use
 in drm.
Message-ID: <YvKFp+9bchLjgCeG@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 seanpaul@chromium.org, robdclark@gmail.com
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Catching up on mails]

Did you see the feedback form Steven from tracing side of things? Does
this version have that taken into account already?

I think once we have that and acks from dyndbg maintainers then I think we
should just land this and polish from there? Maybe some acks from drm
drivrer folks (cros people where once interested), but otherwise I'm a bit
afraid this might be stuck in limbo too much for too long and we just need
to get going :-/
-Daniel


On Fri, Aug 05, 2022 at 03:53:22PM -0600, Jim Cromie wrote:
> Hi Jason, Greg, DRM-folk,
> 
> heres V5. Diffs vs V4:
> 
>   1st 9 have Jason's Ack
>   10 is new: simple var cleanup
>   11 new struct, to contain future addins. touches kernel/module/
> 
>   dyndbg-param callbacks moved to last (of dyndbg patches)
>   they're where the uncertainty is,
>   and the bulk of the API addition (class keyword is small)
> 
>   patches between the move are the guts of the "class foo" feature.
>   exposure of feature is only via >control, until sysfs parts added
>   
>   DRM chunk:
>   included here to see how patchwork's merge & test proceeds.
>   categories -> classes re-work is unchanged - feels pretty solid.
>   nouveau & LEVEL made some progress, still WIP.
> 
>   I left out tracefs bits for now.
> 
> UNCERTAINTIES / RFC:
> 
> 1st is my "sharing" technique, across DRM's multi modules.  Its
> literally duplicated decls, by each participating module, each adding
> static data in its own special section.  I didn't try at all to shrink
> or unify this any further.  There might be a perfect place to add a
> single decl, but that quest will require a pony.
> 
> Sharing by class-names lacks the compiler support that varnames get;
> "incomplete" enables will probably happen if one of the declarations
> miss-spells one of the classnames.
> 
> That said, see the how-to below: stringifying va-args in the macro
> would allow direct use of the enum-consts, and cc will insist that
> those consts are defined, eliminating part of the un-support.
> 
> I could split the _BITS,_NUM handling out from _NAMES (ie split
> drm.debug style patch); theres no user-demand for the _NAMES feature
> ATM, and theres probably some legit API-bikeshedding to do.
> 
> PATCHSET DESCRIPTION
> 
> This patchset adds 'typed' "class FOO" support to dynamic-debug, where
> 'typed' means either DISJOINT_BITS, like drm_dbg(DRM_UT_CORE,..), or
> LEVEL_NUM (like nouveau debug-levels).  Use it in DRM modules: core,
> helpers, and in drivers i915, amdgpu, nouveau.
> 
> If a module is using class'd prdbgs (pr_debug_class, dev_dbg_class, or
> adapted drm_dbg_<category>) or similar in its code, it can "opt in" to
> allow dyndbg to manipulate those class'd prdebugs, by declaring in a
> c-file:
> 
>  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes,
>   			DD_CLASS_TYPE_DISJOINT_BITS, 0,
>                         "DRM_UT_CORE",
>                         "DRM_UT_DRIVER",
>                         "DRM_UT_KMS",
>                         "DRM_UT_PRIME",
>                         "DRM_UT_ATOMIC",
>                         "DRM_UT_VBL",
>                         "DRM_UT_STATE",
>                         "DRM_UT_LEASE",
>                         "DRM_UT_DP",
>                         "DRM_UT_DRMRES");
> 			// how-to stringify __va_args inside the macro ?
> 
> By doing this, a module tells dyndbg that it:
> 
>    - is using class-ids [0..N] in prdbg callsites
>      ( 0..N == DRM_UT_CORE..DRM_UT_DRMRES )
>    - wants to refer to them by class-names [0..N]
>    - is mapping those names to those class-ids
>    - expects users to enable them via >control or >parameter/knob
> 
> Then, a user can enable the prdbgs by their class:
> 
>    :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> 
> And with another 3-line bitmap param decl/init, wrapping the
> drm_debug_classes var in a module-param-cb:
> 
>    :#> echo 0x1 > /sys/module/drm/parameters/debug
> 
> and optionally using classnames:
> 
>    :#> echo +DRM_UT_CORE,-DRM_UT_KMS \
> 	> /sys/module/drm/parameters/debug_cats
> 
> DYNAMIC_DEBUG gets:
> 
> struct _ddebug gets a new .class_id:5 field, big enough to represent
> drm_debug_category (after squeezing).  It defaults to 31 for all
> existing prdbgs.  class_id also supports verbose uses.
> 
> classmaps (as declared by macro above) are in their own linker
> section, are loaded by kernel/module, and handled by add_module,
> which attaches classmaps to their module's ddebug table.
>      
> ddebug_change() handles a class FOO query by validating that FOO is
> known by each module in the loop.  The query is skipped unless the
> module knows FOO, so no changes are possible w/o a good classname.
> 
> Without class FOO in a query/command, only ids=31 can be changed by
> that query.  This protects all class'd prdbgs from changes by legacy
> class-less user queries.
> 
> With this support, the module opt-in approach means that:
> 
>    - modules declare classnames they like, meaningful names: DRM_UT_*
>      these are numbered [0..N]
>    - modules call pr_debug_class(N, "fmt..",...)
>      or drm_dbg(CAT, "fmt..",...) - same form.
>    - class-id space, while limited:0-30, is private to each module
>    - "class FOO" is only way to select a class'd prdbg
>    - unrelated modules use 0..N separately, for different purposes.
>    - modules "share" classnames by separate decls (uses of macro)
>      all drm modules reuse the above declaration.
>      then they respond together to a >control
> 
> 4 CLASS_TYPES are defined; they split behavior on 2 factors:
> 
>    1. independent bits vs related:(X<Y) bits [0-N]
>    2. input form: number/hex vs CSV-list: [+-]CLASS_NAMES
>      
>    DD_CLASS_TYPE_DISJOINT_BITS	independent bits, 0x1f input is clearest
>    DD_CLASS_TYPE_LEVEL_NUM	(x<y), input is level, not bitvec
> 
>    DD_CLASS_TYPE_DISJOINT_NAMES	csv-list of independent +-CLASS_NAMEs
>    DD_CLASS_TYPE_LEVEL_NAMES	csv-list of related +-CLASS_NAMEs, only 1 term needed
> 
> Splitting up behavior this way is safe, and flexible:
> 
>  - no bitmap-vs-level > sysknob ambiguity
>    as was case when both were accepted on same knob
>  - narrower interfaces
>    uint is uint
>  - can defer DISJOINT_NAMES handling, but keep the enums.
>    it has no users ...
>  - can later add 2 more ENUMS allowing both inputs
>    in separate LEVEL_NUM & DISJOINT_BITS choices
>    then authors choice if they want to accept mixed input
>  - can enumerate "wierd" relations if needed
>    DISJOINT_BITS|LEVEL_NUM should cover everything I can forsee
>    but theres room for DD_CLASS_TYPE_STOCHASTIC (over the garage)
> 
> DISJOINT & LEVEL cover the space; 1st is independent, 2nd is related.
> The relation could differ from (x<y), but atm I can't think of another
> that makes any sensible distinction from (x<y).
> 
> Quick review of debug logging:
> 
> DRM is biggest use-case: 23 macros, issuing 10 exclusive categories of
> messages, from ~5100 callsites, across core (drm, _*helpers), and 3+
> drivers (Im working amdgpu, i915, more recently nouveau).  These mostly
> flow to drm_debug_enabled(category) for a print/no decision.
> 
> nouveau has minimum direct use of the DRM.debug macros, but does use
> pr_debug (in VMM iirc), and drm_debug_enabled() in ~50 places via
> macros, and another ~50 iirc due to NOUVEAU_DEBUG_MMU=y
> 
> What nouveau has most of is log-levels: there are ~800 uses of them;
> nvkm_(fatal|error|warn|info|debug|trace|spam), they all flow thru
> nvkm_printk_.  Even excluding some levels as "always-on" and not
> appropriate for dyndbg's extra resources and complexity, theres ~450
> callsites.
> 
> A reported smattering of raw/adhoc debug code. all but unknown to me.
> 
> Like any debug logging, they're mostly off, and should have close to
> 0-off-cost.  This is what dyndbg (with/on jump-label) was made for.
> 
> Bottom line: in order to unify more potential (drm,etc) use-cases,
> dyndbg needs to support both debug classification schemes:
> RELATED/LEVEL_NUM and INDEPENDENT/DISJOINT_BITS.
> 
> This is rev3. rev2 is here:
> https://lore.kernel.org/lkml/20220516225640.3102269-1-jim.cromie@gmail.com/
> 
> summary of diffs:
> 
>  - rebased on 5.19-rc6 to pick up kernel/module changes
>  - tracfs bits now use __vstring, __vstr_assign, from S.Rostedt
>  
>  - 4 class-map-types - as outlined above
>    now supports LEVEL_NUM semantics, WIP nouveau integration.
>    v2 became the DISJOINT_BITS use case
>    Lots of API-ish surface area here *RFC*
> 
>  - class-maps now in section("__dyndbg_classes")
>    class FOO queries are available at earlyboot / module-load
>    drop (un)?register_classes()
> 
>  - test-dynamic-debug module
>    tests the 4 CLASS-TYPES
>    good place to bikeshed / paintshop the API
> 
>  - nouveau - start poking - WIP
>    NV_PRINT -> dev_dbg (creates 632 prdbgs, but not class'd)
>    LEVEL_NUM classes declared to see how they "fit", unused yet.
> 
> Summary:
> 
>  - plenty of new stuff here.
>  - plenty of new API surface area.
>  - exposes CLASSNAMES to user, via control, >symbolic-sysknob
> 
> More on LEVEL_NUM:
> 
> dyndbg's class scheme is names-based, so even for LEVEL_NUM with
> numeric input, there must be a "V0" name; a name with which to turn
> off "V1".  And don't do 'pr_dbg_class(0,..)'.
> 
> LEVEL_NUM is an overlay on DISJOINT_BITS; the callback reads the input as a
> level, and computes and applies the bitmap to enforce it.  Yes it
> wastes "V0" bit.  That might matter if an author wanted many separate
> verbose-knobs with a few levels each, but that seems fairly unlikely.
> 
> More importantly, it means that relative verbosity is not enforced at
> the >control input; IOW this is allowed:
> 
>    :#> echo class V1 -p > /proc/dynamic_debug/control
>    :#> echo class V3 +p > /proc/dynamic_debug/control
> 
> 2nd line doesn't undo 1st, as it would if changed via sysfs-knob:
> 
>    :#> echo 3 > /sys/module/drm/parameters/debug
> 
> ISTM this is fine, the "relative" meaning is added at the interface,
> where it presents to a user.  Doing otherwise means surgery to
> ddebug_change, which seems unnecessary given an option.
> 
> CLASS NAMESPACE and DRM
> 
> The class namespace is flat and wide, so "V1" is a poor choice, other
> than for demonstration (as in test_dynamic_debug module).  If every
> module had a "V1", turning them all on would issue lots of unrelated
> noise.
> 
> Instead, class DRM_UT_CORE has a name with a specific sub-system wide
> (ie multi-module) meaning, and can (and should) be responded to by all
> cooperating modules.
> 
> For DRM, this means 4-5 duplicate uses of DEFINE_DYNDBG_CLASSMAP, from
> multiple drivers' "*_{drm,dev,main}.c" files; all of them agreeing on
> the classnames, map-type and base.  Though repetitive, and a bit
> fiddly when multiple classes share the module's id-space, it is
> simple, and consistent with the "static struct foo = {INIT_expr}"
> pattern used in the macro.  Im open to simpler ways, initializing an
> extern sounded like a maze w/o cheese.
> 
> For core, drm_print.c has an additional task; it defines and
> initializes the bitmap sysknob that converts bits to a query:
> 
>   static struct ddebug_classes_bitmap_param drm_debug_bitmap = {
>        .bits = &__drm_debug,
>        .flags = "p",
>        .map = &drm_debug_classes,
>   };
>   module_param_cb(debug, &param_ops_dyndbg_classes,
>   		  &drm_debug_bitmap, 0600);
> 
> then the callback converts bit-toggles on input into something like:
> 
>   :#> echo class DRM_UT_KMS +p > control
> 
> which enables all drm_dbg_kms() callsites in all modules that declared
> that classname as known.
> 
> NB: classmaps and classes_bitmap_params are different structs.  this
> allows the former to be shared by 2 of latter, each toggling 'p' & 'T'
> flags, to control output to syslog or tracelog independently.
> 
> NBB: while "V1" isnt a good classname, "EMERG" and and other
> KERN-LEVEL names have a legacy.  That said, dyndbg shouldnt be
> involved in EMERG actions.
> 
> NOUVEAU and multiple LEVEL_NUM knobs ?
> 
> One thing nouveau has that I havent yet grokked is 2|3 independent
> verbose levels, in {,cli,sub}->debug (see subdev.h).  But Ive coded
> them as 2 more macro invocations; using bases 10, 15 to avoid/respect
> the 0-9 mapping of DRM.debug categories to those class-ids.
> 
> With this, the drm subsystem uses 20/31 of its class-id range, perhaps
> 63 is better, despite the cumbersome 0x-64bit interface.  Note that
> the sysfs-knobs do not expose the base/offset (its an inward-facing
> .class_id offset); each sysfs-knob gets its own 0..N bitmap, the base
> maps it to the 0..30 subrange allocated (manually, via the base arg to
> macro) for this class-map.
> 
> anyway, heres how `modprobe nouveau` goes with dynamic_debug.verbose=3
> 
> [86512.693954] dyndbg: class[0]: module:nouveau base:15 len:5 ty:1
> [86512.693958] dyndbg:  15: 0 NV_SUBDEV_DBG_OFF		# aka V0
> [86512.693959] dyndbg:  16: 1 NV_SUBDEV_DBG_INFO
> [86512.693960] dyndbg:  17: 2 NV_SUBDEV_DBG_DEBUG
> [86512.693960] dyndbg:  18: 3 NV_SUBDEV_DBG_TRACE
> [86512.693960] dyndbg:  19: 4 NV_SUBDEV_DBG_SPAM
> [86512.693961] dyndbg: class[1]: module:nouveau base:10 len:5 ty:1
> [86512.693961] dyndbg:  10: 0 NV_CLI_DBG_OFF
> [86512.693962] dyndbg:  11: 1 NV_CLI_DBG_INFO
> [86512.693962] dyndbg:  12: 2 NV_CLI_DBG_DEBUG
> [86512.693963] dyndbg:  13: 3 NV_CLI_DBG_TRACE
> [86512.693963] dyndbg:  14: 4 NV_CLI_DBG_SPAM
> [86512.693963] dyndbg: class[2]: module:nouveau base:0 len:10 ty:0
> [86512.693964] dyndbg:  0: 0 DRM_UT_CORE
> [86512.693964] dyndbg:  1: 1 DRM_UT_DRIVER
> [86512.693965] dyndbg:  2: 2 DRM_UT_KMS
> [86512.693965] dyndbg:  3: 3 DRM_UT_PRIME
> [86512.693965] dyndbg:  4: 4 DRM_UT_ATOMIC
> [86512.693966] dyndbg:  5: 5 DRM_UT_VBL
> [86512.693966] dyndbg:  6: 6 DRM_UT_STATE
> [86512.693966] dyndbg:  7: 7 DRM_UT_LEASE
> [86512.693967] dyndbg:  8: 8 DRM_UT_DP
> [86512.693967] dyndbg:  9: 9 DRM_UT_DRMRES
> [86512.693968] dyndbg: module:nouveau attached 3 classes
> [86512.693968] dyndbg: 632 debug prints in module nouveau
> 
> They are not yet wired by class; the nv-printks are using dev_dbg for
> now, so they can be enabled with standard selections (module, func,
> etc).
> 
> DYNDBG API
> 
> I added __pr_debug_cls to make things testable, I wanted to keep it
> private/un-api, because drm already has drm_dbg_<cat>(cat, fmt..), and
> that seemed a pretty good model to follow: enums with strong names for
> class_id constants, and same names for classes.
> 
>    ie: __pr_debug_cls(DRM_UT_KMS, "Whats the Matter with KMS: %s\n", reason);
> 
> But now nouveau probably wants/needs it, perhaps others too.
> 
>   pr_dbg_cls / dev_dbg_cls ?  class or debug spelled out ? 
> 
> MORE TESTING with DRM & TRACEFS
> 
> Most dev & testing has been on virtme, with test-dynamic-debug module
> doing an api-validation-demonstration.  The test module proves
> multiple sysknobs, but cannot prove real multi-module sharing of the
> class-name space.  The DRM.debug adaptation must (and does) do that.
> 
> Now Im running on real gpu/drm hw; on both an amdgpu desktop, and this
> amdgpu+nouveau laptop.  Its stable enough to type on, browse, build
> more kernels, etc.
> 
> :#> uname -r
> 5.18.0-f2-00038-g61d300083196
> :#> wc /proc/dynamic_debug/control 
> 11554 95556 1442827 /proc/dynamic_debug/control
> :#> lsmod | grep drm
> drm_buddy              20480  1 i915
> drm_ttm_helper         16384  2 amdgpu,nouveau
> ttm                    86016  4 amdgpu,drm_ttm_helper,i915,nouveau
> drm_dp_helper         184320  3 amdgpu,i915,nouveau
> drm_kms_helper        208896  6 drm_dp_helper,amdgpu,i915,nouveau
> drm                   655360  16 gpu_sched,drm_dp_helper,drm_kms_helper,drm_buddy,amdgpu,drm_ttm_helper,i915,ttm,nouveau
> cec                    49152  2 drm_dp_helper,i915
> 
> I've never turned on DRM.debug in frustration (or curiousity until
> recently); I dunno what normal traffic looks like.  So I wrote a
> script to toggle each category: on/off for 1 sec, so I could 'more'
> thru the output to see the partitioned streams.
> 
> Different runs (of '10' sec of active tracing) produce between 330-3500
> lines of logging, depending upon mousing/screen activity.  Heres a bit
> of a many-window-select run: `wc trace` gives "size" of the category's stream.
> 
> :#> trc_classes 
> 12 /sys/kernel/tracing/trace
> doing class DRM_UT_CORE +/- T   1394 13941 141614 /sys/kernel/tracing/trace
> doing class DRM_UT_DRIVER +/- T   1396 13959 141816 /sys/kernel/tracing/trace
> doing class DRM_UT_KMS +/- T   1482 14521 148246 /sys/kernel/tracing/trace
> doing class DRM_UT_PRIME +/- T   1484 14539 148446 /sys/kernel/tracing/trace
> doing class DRM_UT_ATOMIC +/- T   2984 31658 396064 /sys/kernel/tracing/trace
> doing class DRM_UT_VBL +/- T   3411 37321 449848 /sys/kernel/tracing/trace
> doing class DRM_UT_STATE +/- T   3413 37339 450048 /sys/kernel/tracing/trace
> doing class DRM_UT_LEASE +/- T   3415 37357 450248 /sys/kernel/tracing/trace
> doing class DRM_UT_DP +/- T   3417 37375 450442 /sys/kernel/tracing/trace
> doing class DRM_UT_DRMRES +/- T   3419 37393 450644 /sys/kernel/tracing/trace
> 
> and some mid-run output from a quiet run, with less repetition.
> 
>             bash-96790   [006] ..... 410237.432255: tracing_mark_write: doing class DRM_UT_DRIVER +T
>             bash-96790   [006] ..... 410238.610319: tracing_mark_write: doing class DRM_UT_DRIVER -T
>             bash-96790   [006] ..... 410239.776285: tracing_mark_write: doing class DRM_UT_KMS +T
>      gnome-shell-2101    [003] ..... 410239.923029: drm_debug: [FB:98]
>   kworker/u32:10-367584  [010] ..... 410239.924627: drm_debug: Allow idle optimizations (MALL): 0
>    kworker/u32:0-364714  [008] ..... 410239.935126: drm_debug: Allow idle optimizations (MALL): 1
>      gnome-shell-2101    [003] ..... 410240.527186: drm_debug: [FB:100]
>    kworker/u32:0-364714  [008] ..... 410240.528686: drm_debug: Allow idle optimizations (MALL): 0
>   kworker/u32:10-367584  [010] ..... 410240.539378: drm_debug: Allow idle optimizations (MALL): 1
>             bash-96790   [006] ..... 410240.957921: tracing_mark_write: doing class DRM_UT_KMS -T
>             bash-96790   [006] ..... 410242.199120: tracing_mark_write: doing class DRM_UT_PRIME +T
>             bash-96790   [006] ..... 410243.301988: tracing_mark_write: doing class DRM_UT_PRIME -T
>             bash-96790   [006] ..... 410244.416400: tracing_mark_write: doing class DRM_UT_ATOMIC +T
>      gnome-shell-2101    [003] ..... 410244.653372: drm_devdbg: cat:4, (0xffff8f26c173de00:0000:06:00.0)[UNSAFE-MEMORY] Allocated atomic state 000000001f1e6cb6
>      gnome-shell-2101    [003] ..... 410244.653381: drm_devdbg: cat:4, (0xffff8f26c173de00:0000:06:00.0)[UNSAFE-MEMORY] Added [PLANE:55:plane-3] 00000000785ae904 state to 000000001f1e6cb6
>      gnome-shell-2101    [003] ..... 410244.653384: drm_devdbg: cat:4, (0xffff8f26c173de00:0000:06:00.0)[UNSAFE-MEMORY] Added [CRTC:67:crtc-0] 00000000b06ca618 state to 000000001f1e6cb6
>      gnome-shell-2101    [003] ..... 410244.653389: drm_devdbg: cat:4, (0xffff8f26c173de00:0000:06:00.0)[UNSAFE-MEMORY] Set [FB:98] for [PLANE:55:plane-3] state 00000000785ae904
>      gnome-shell-2101    [003] ..... 410244.653392: drm_devdbg: cat:4, (0xffff8f26c173de00:0000:06:00.0)[UNSAFE-MEMORY] checking 000000001f1e6cb6
>      gnome-shell-2101    [003] ..... 410244.653407: drm_devdbg: cat:4, (0xffff8f26c173de00:0000:06:00.0)[UNSAFE-MEMORY] committing 000000001f1e6cb6 nonblocking
>    kworker/u32:0-364714  [010] ..... 410244.653729: drm_debug: amdgpu_crtc id:0 crtc_state_flags: enable:1, active:1, planes_changed:1, mode_changed:0,active_changed:0,connectors_changed:0
>    kworker/u32:0-364714  [010] ..... 410244.654642: drm_debug: plane: id=3 dcc_en=0
> 
> a few things to note in the trace output:
> 
> . the event-name: drm_(debug|devdbg) is not very informative
> 
> . drm_devdbg fmt has cat:%d, it could be the classname, but that should
>   replace event-name, not supplement it. this pertains to drm_debug too.
> 
> . drm_devdbg has lots of (dev-info), that could be optional on a new flag(s)
> 
> 
> If anyone wants to repeat the above with the patchset, the .rc file follows:
> 
> events_3() {
>     local a=$1
>     local b=$2
>     local c=$3
>     echo $a > /sys/kernel/tracing/events/dyndbg/enable
>     # avoid drm_vblank*, its noisy
>     echo $b > /sys/kernel/tracing/events/drm/drm_debug/enable
>     echo $c > /sys/kernel/tracing/events/drm/drm_devdbg/enable
> }
> 
> flags_class() {
>     local flgs=$1;
>     local cls=$2;
>     echo class $cls $flgs > /proc/dynamic_debug/control
> }
> 
> # turn on each DRM_UT_* for 1 second each.
> # kinda shows relative traffic of each category
> # separated into blocks to get flavor of each
> 
> drm_classes() {
>     local flgs=$1
>     [ -z $flgs ] && flgs="p"
> 
>     #echo > /sys/kernel/tracing/trace
>     #wc /sys/kernel/tracing/trace
> 
>     for cls in DRM_UT_CORE DRM_UT_DRIVER DRM_UT_KMS DRM_UT_PRIME DRM_UT_ATOMIC \
> 			   DRM_UT_VBL DRM_UT_STATE DRM_UT_LEASE DRM_UT_DP \
> 			   DRM_UT_DRMRES;
>     do
> 	echo -n doing class $cls "  "
> 
> 	echo doing class $cls +$flgs
> 	sleep .1
> 	flags_class +$flgs $cls
> 	sleep 1
> 	
> 	echo doing class $cls -$flgs
> 	sleep .1
> 	flags_class -$flgs $cls
> 	sleep 1
> 	
> 	#wc /sys/kernel/tracing/trace
>     done
> }
> 
> # like above but with T flag, and markers, trace/enable
> trc_classes() {
>     local flgs=$1
>     [ -z $flgs ] && flgs="T"
> 
>     echo > /sys/kernel/tracing/trace
>     wc -l /sys/kernel/tracing/trace
> 
>     events_3 1 1 1
>     for cls in DRM_UT_CORE DRM_UT_DRIVER DRM_UT_KMS DRM_UT_PRIME \
> 			   DRM_UT_ATOMIC \
> 			   DRM_UT_VBL DRM_UT_STATE DRM_UT_LEASE DRM_UT_DP \
> 			   DRM_UT_DRMRES;
>     do
> 	echo -n doing class $cls +/- $flgs "  "
> 
> 	echo doing class $cls +$flgs > /sys/kernel/tracing/trace_marker
> 	sleep .1
> 	flags_class +$flgs $cls
> 	sleep 1
> 	
> 	echo doing class $cls -$flgs > /sys/kernel/tracing/trace_marker
> 	sleep .1
> 	flags_class -$flgs $cls
> 	sleep 1
> 	
> 	wc /sys/kernel/tracing/trace
> 
>     done
>     events_3 0 0 0
> }
> 
> 
> Jim Cromie (33):
> 
> 1st, a group of "cleanups"
> 
>   dyndbg: fix static_branch manipulation
>   dyndbg: fix module.dyndbg handling
>   dyndbg: show both old and new in change-info
>   dyndbg: reverse module walk in cat control
>   dyndbg: reverse module.callsite walk in cat control
>   dyndbg: use ESCAPE_SPACE for cat control
>   dyndbg: let query-modname override actual module name
>   dyndbg: add test_dynamic_debug module
>   dyndbg: drop EXPORTed dynamic_debug_exec_queries
>   dyndbg: cleanup local vars in ddebug_init
>   dyndbg: create and use struct _ddebug_info
> 
> class FOO support  
> 
>   dyndbg: add class_id to pr_debug callsites
>   dyndbg: add __pr_debug_cls for testing
>   dyndbg: add DECLARE_DYNDBG_CLASSMAP macro
>   kernel/module: add __dyndbg_classes section
>   dyndbg: add ddebug_attach_module_classes
>   dyndbg: validate class FOO by checking with module
>   doc-dyndbg: describe "class CLASS_NAME" query support
>   doc-dyndbg: edit dynamic-debug-howto for brevity, audience
> 
> add dyndbg-class-param support
> 
>   dyndbg: add drm.debug style (drm/parameters/debug) bitmap support
>   dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
> 
> drm.debug adaptation
> 
>   drm_print: condense enum drm_debug_category
>   drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
>   drm_print: interpose drm_*dbg with forwarding macros
>   drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
>   drm-print.h: include dyndbg header
>   drm-print: add drm_dbg_driver to improve namespace symmetry
>   drm_print: refine drm_debug_enabled for jump-label
>   drm_print: prefer bare printk KERN_DEBUG on generic fn
>   drm_print: add _ddebug descriptor to drm_*dbg prototypes
> 
> nouveau-LEVEL_NUM integration: WIP/exploratory.
> 
>   nouveau: change nvkm_debug/trace to use dev_dbg POC
>   nouveau: adapt NV_DEBUG, NV_ATOMIC to use DRM.debug
>   nouveau: WIP add 2 LEVEL_NUM classmaps for CLI, SUBDEV
> 
>  .../admin-guide/dynamic-debug-howto.rst       | 246 +++++-----
>  MAINTAINERS                                   |   2 +
>  drivers/gpu/drm/Kconfig                       |  12 +
>  drivers/gpu/drm/Makefile                      |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  14 +
>  drivers/gpu/drm/display/drm_dp_helper.c       |  13 +
>  drivers/gpu/drm/drm_crtc_helper.c             |  13 +
>  drivers/gpu/drm/drm_print.c                   |  48 +-
>  drivers/gpu/drm/i915/i915_params.c            |  12 +
>  .../gpu/drm/nouveau/include/nvkm/core/debug.h |  16 +
>  .../drm/nouveau/include/nvkm/core/subdev.h    |  17 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  20 +
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |  16 +-
>  drivers/gpu/drm/nouveau/nvkm/core/subdev.c    |  23 +
>  include/asm-generic/vmlinux.lds.h             |   3 +
>  include/drm/drm_print.h                       |  85 +++-
>  include/linux/dynamic_debug.h                 | 176 +++++--
>  kernel/module/internal.h                      |   4 +-
>  kernel/module/main.c                          |  20 +-
>  lib/Kconfig.debug                             |  10 +
>  lib/Makefile                                  |   1 +
>  lib/dynamic_debug.c                           | 450 +++++++++++++++---
>  lib/test_dynamic_debug.c                      | 165 +++++++
>  23 files changed, 1099 insertions(+), 269 deletions(-)
>  create mode 100644 lib/test_dynamic_debug.c
> 
> -- 
> 2.37.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
