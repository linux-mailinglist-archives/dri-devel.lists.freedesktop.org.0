Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3010DA6DDCA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EA210E3EC;
	Mon, 24 Mar 2025 15:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KbN/jq7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D804010E3D7;
 Mon, 24 Mar 2025 15:07:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD43D442A7;
 Mon, 24 Mar 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742828859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dpiZAF4FJD4CIK+ngcfFSqiNbBlkXEDahsbd8DTB28I=;
 b=KbN/jq7tZzZk0rciFcOOp3vqi8UgNK82rWLBgvkcJgxe+5UoPnkBbGt5sGeYjPX2wU63Pa
 OYUv7xvs0MHTE8Yop+18njMxTLZlxopFGHKSiQQBgfb2VaR/657np9Wvm9q/DjVHgc71w0
 sXW2K1JFqZe942PVLcNIgbkJPBTdKaz4z3BX2M8TxccvSEea9WHLMcUJMHxinZZ6isUTQU
 SOFsejgF6mK9Q5DldYNS/ZHoR/0dZydjt1gnLn5iCv42KgLg/qLHpLiBiBPNnGBph894d4
 02hylPF+qyW4RhLY9tXTyblrB4wemJ/ALXLJSV0W6W60x+TOnne/JNMwdmhm6g==
Message-ID: <a6824252-87be-458f-ba4a-b34bf86d67f4@bootlin.com>
Date: Mon, 24 Mar 2025 16:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 16/63] dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
To: jim.cromie@gmail.com, linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-17-jim.cromie@gmail.com>
 <b2d9acea-c2ad-45c7-9853-8fac0957c56f@bootlin.com>
 <CAJfuBxwBZ0a630YH2gbwz971ehZWASH6yXfRrdVCWBNGqA=mMw@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <CAJfuBxwBZ0a630YH2gbwz971ehZWASH6yXfRrdVCWBNGqA=mMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedttdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfhffuvfhfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffhiefgueekleetieehjeefffeiudfgtdehteekvdetjeetvdfhffetteevueenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiu
 hhmrdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhfgidqthhrhigsohhtsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 16/03/2025 à 20:46, jim.cromie@gmail.com a écrit :
> hi Louis,
> 
> On Tue, Feb 25, 2025 at 7:16 AM Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>
>>
>>
>> Le 25/01/2025 à 07:45, Jim Cromie a écrit :
>>> DECLARE_DYNDBG_CLASSMAP() has a design error; its usage fails a basic
>>> K&R rule: "define once, refer many times".
>>>
>>> It is used across DRM core & drivers, each use re-defines the classmap
>>> understood by that module; and all must match for the modules to
>>> respond together when DRM.debug categories are enabled.  This is
>>> brittle; a maintenance foot-gun.
>>>
>>> Further, its culpable in the CONFIG_DRM_USE_DYNAMIC_DEBUG=Y
>>> regression; its use in both core & drivers obfuscates the 2 roles.
>>> So 1st drm.ko loads, and dyndbg initializes its DRM.debug callsites,
>>> then a drm-driver loads, but too late - it missed the DRM.debug
>>> enablement.
>>>
>>> So replace it with 2 macros:
>>>     DYNDBG_CLASSMAP_DEFINE - invoked once from core - drm.ko
>>>     DYNDBG_CLASSMAP_USE    - from all drm drivers and helpers.
>>>
>>> DYNDBG_CLASSMAP_DEFINE: it just modifies DECLARE_DYNDBG_CLASSMAP,
>>> dropping drop the static qualifier, and exports it instead.
>>>
>>> DYNDBG_CLASSMAP_USE: then refers to the exported var by name:
>>>     used from drivers, helper-mods
>>>     lets us drop the repetitive "classname" declarations
>>>     fixes 2nd-defn problem
>>>     creates a ddebug_class_user record in new __dyndbg_class_users section
>>>     this allows ddebug_add_module(etal) to handle users differently.
>>>
>>> DECLARE_DYNDBG_CLASSMAP is preserved temporarily, to decouple DRM
>>> adaptation work and avoid compile-errs before its done.  IOW, DRM gets
>>> fixed when they commit the adopt-new-api patches, and remove the
>>> BROKEN marking.
>>>
>>> The DEFINE,USE distinction, and the separate classmap-use record,
>>> allows dyndbg to initialize the driver's & helper's DRM.debug
>>> callsites separately after each is modprobed.
>>>
>>> Basically, the classmap init-scan is repeated for classmap-users.
>>>
>>> To review, dyndbg's existing __dyndbg_classes[] section does:
>>>
>>> . catalogs the classmaps defined by a module (or builtin modules)
>>> . tells dyndbg the module has class'd prdbgs, allowing >control
>>> . DYNDBG_CLASSMAP_DEFINE creates classmaps in this section.
>>>
>>> This patch adds __dyndbg_class_users[] section:
>>>
>>> . catalogs uses/references to the classmap definitions.
>>> . authorizes dyndbg to >control those class'd prdbgs in ref'g module.
>>> . DYNDBG_CLASSMAP_USE() creates classmap-user records in this new section.
>>>
>>> Now ddebug_add_module(etal) can handle classmap-uses similar to (and
>>> after) classmaps; when a dependent module is loaded, if it has
>>> classmap-uses (to a classmap-def in another module), that module's
>>> kernel params are scanned to find if it has a kparam that is wired to
>>> dyndbg's param-ops, and whose classmap is the one being ref'd.
>>>
>>> To support this, theres a few data/header changes:
>>>
>>> new struct ddebug_class_user
>>>     contains: user-module-name, &classmap-defn
>>>     it records drm-driver's use of a classmap in the section, allowing lookup
>>>
>>> struct ddebug_info gets 2 new fields for the new sections:
>>>     class_users, num_class_users.
>>>     set by dynamic_debug_init() for builtins.
>>>     or by kernel/module/main:load_info() for loadable modules.
>>>
>>> vmlinux.lds.h: new BOUNDED_SECTION for __dyndbg_class_users
>>>
>>> dynamic_debug.c has 2 changes in ddebug_add_module(), ddebug_change():
>>>
>>> ddebug_add_module() already calls ddebug_attach_module_classes()
>>> to handle classmaps DEFINEd by a module, now it also calls
>>> ddebug_attach_user_module_classes() to handle USEd classmaps.  To
>>> avoid this work when possible, 1st scan the module's descriptors and
>>> count the number of class'd pr_debugs.
>>>
>>> ddebug_attach_user_module_classes() scans the module's class_users
>>> section, follows the refs to the parent's classmap, and calls
>>> ddebug_apply_params() on each.  It also avoids work by checking the
>>> module's class-ct.
>>>
>>> ddebug_apply_params(new fn):
>>>
>>> It scans module's/builtin kernel-params, calls ddebug_match_apply_kparam
>>> for each to find any params/sysfs-nodes which may be wired to a classmap.
>>>
>>> ddebug_match_apply_kparam(new fn):
>>>
>>> 1st, it tests the kernel-param.ops is dyndbg's; this guarantees that
>>> the attached arg is a struct ddebug_class_param, which has a ref to
>>> the param's state, and to the classmap defining the param's handling.
>>>
>>> 2nd, it requires that the classmap ref'd by the kparam is the one
>>> we're called for; modules can use many separate classmaps (as
>>> test_dynamic_debug does).
>>>
>>> Then apply the "parent" kparam's setting to the dependent module,
>>> using ddebug_apply_class_bitmap().
>>>
>>> ddebug_change(and callees) also gets adjustments:
>>>
>>> ddebug_find_valid_class(): This does a search over the module's
>>> classmaps, looking for the class FOO echo'd to >control.  So now it
>>> searches over __dyndbg_class_users[] after __dyndbg_classes[].
>>>
>>> ddebug_class_name(): return class-names for defined AND used classes.
>>>
>>> test_dynamic_debug.c, test_dynamic_debug_submod.c:
>>>
>>> This demonstrates the 2 types of classmaps & sysfs-params, following
>>> the 4-part recipe:
>>>
>>> 1. define an enum for the classmap: DRM.debug has DRM_UT_{CORE,KMS,...}
>>>      multiple classes must share 0-62 classid space.
>>> 2. DYNDBG_CLASSMAP_DEFINE(.. DRM_UT_{CORE,KMS,...})
>>> 3. DYNDBG_CLASSMAP_PARAM* (classmap)
>>> 4. DYNDBG_CLASSMAP_USE()
>>>      by _submod only, skipping 2,3
>>>
>>> Move all the enum declarations together, to better explain how they
>>> share the 0..62 class-id space available to a module (non-overlapping
>>> subranges).
>>>
>>> reorg macros 2,3 by name.  This gives a tabular format, making it easy
>>> to see the pattern of repetition, and the points of change.
>>>
>>> And extend the test to replicate the 2-module (parent & dependent)
>>> scenario which caused the CONFIG_DRM_USE_DYNAMIC_DEBUG=y regression
>>> seen in drm & drivers.
>>>
>>> The _submod.c is a 2-line file: #define _SUBMOD, #include parent.
>>>
>>> This gives identical complements of prdbgs in parent & _submod, and
>>> thus identical print behavior when all of: >control, >params, and
>>> parent->_submod propagation are working correctly.
>>>
>>> It also puts all the parent/_submod declarations together in the same
>>> source, with the new ifdef _SUBMOD block invoking DYNDBG_CLASSMAP_USE
>>> for the 2 test-interfaces.  I think this is clearer.
>>>
>>> These 2 modules are both tristate, allowing 3 super/sub combos: Y/Y,
>>> Y/M, M/M (not N/N).  Y/Y testing exposed a missing __align(8) in the
>>> _METADATA macro, which M/M didn't see because the module-loader memory
>>> placement constrains it instead.
>>>
>>> NB: this patch ignores a checkpatch do-while warning which is fixed by
>>> a preceding commit, which would be wrong for declarative macros like
>>> module_param_named() etc.
>>>
>>> Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
>>> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>>> ---
>>> v9 - commit-msg tweaks
>>>        DRM:CHECK warnings on macros: add parens
>>>        extern DEFINEd _var, static classnames
>>>        change ddebug_class_user.user_mod_name to .mod_name
>>>        simplify ddebug_find_valid_class
>>>        improve vpr_cm_info msg format
>>>        wrap (base) in macro body
>>>        move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
>>>
>>> v8 - split drm parts to separate commits.
>>>        preserve DECLARE_DYNDBG_CLASSMAP to decouple DRM, no flag day.
>>>        fixup block comment
>>>
>>> v7 - previous submission-blocking bug:
>>>
>>> missing __align(8) in DYNAMIC_DEBUG_DECLARE_METADATA on
>>> ddebug_class_user caused corrupt records, but only for builtin
>>> modules; module loader code probably pinned allocations to the right
>>> alignment naturally, hiding the bug for typical builds.
>>>
>>> v6- get rid of WARN_ON_ONCE
>>> v?- fix _var expanded 2x in macro
>>>
>>> dyndbg:
>>>
>>> This fn formerly returned the map which contained the class (thus
>>> validating it), and as a side-effect set the class-id in an outvar.
>>>
>>> But the caller didn't use the map (after checking its not null), only
>>> the valid class-id.  So simplify the fn to return the class-id of the
>>> validated classname, or -ENOENT when the queried classname is not
>>> found.
>>>
>>> Convey more useful info in the debug-msg: print class-names[0,last],
>>> and [base,+len] instead of the class-type printout, which is currently
>>> always "type:DISJOINT_BITS".  And drop ddebug_classmap_typenames,
>>> which is now unused.
>>>
>>> [root@v6 b0-dd]# modprobe test_dynamic_debug_submod
>>> [   18.864962] dyndbg: loaded classmap: test_dynamic_debug [16..24] V0..V7
>>> [   18.865046] dyndbg:  found kp:p_level_num =0x0
>>> [   18.865048] dyndbg:   mapped to: test_dynamic_debug [16..24] V0..V7
>>> [   18.865164] dyndbg:   p_level_num: lvl:0 bits:0x0
>>> [   18.865217] dyndbg: loaded classmap: test_dynamic_debug [0..10] D2_CORE..D2_DRMRES
>>> [   18.865297] dyndbg:  found kp:p_disjoint_bits =0x0
>>> [   18.865298] dyndbg:   mapped to: test_dynamic_debug [0..10] D2_CORE..D2_DRMRES
>>> [   18.865424] dyndbg:   p_disjoint_bits: classbits: 0x0
>>> [   18.865472] dyndbg: module:test_dynamic_debug attached 2 classmaps
>>> [   18.865533] dyndbg:  23 debug prints in module test_dynamic_debug
>>> [   18.866558] dyndbg: loaded classmap: test_dynamic_debug_submod [16..24] V0..V7
>>> [   18.866698] dyndbg:  found kp:p_level_num =0x0
>>> [   18.866699] dyndbg:   mapped to: test_dynamic_debug_submod [16..24] V0..V7
>>> [   18.866865] dyndbg:   p_level_num: lvl:0 bits:0x0
>>> [   18.866926] dyndbg: loaded classmap: test_dynamic_debug_submod [0..10] D2_CORE..D2_DRMRES
>>> [   18.867026] dyndbg:  found kp:p_disjoint_bits =0x0
>>> [   18.867027] dyndbg:   mapped to: test_dynamic_debug_submod [0..10] D2_CORE..D2_DRMRES
>>> [   18.867193] dyndbg:   p_disjoint_bits: classbits: 0x0
>>> [   18.867255] dyndbg: module:test_dynamic_debug_submod attached 2 classmap uses
>>> [   18.867351] dyndbg:  23 debug prints in module test_dynamic_debug_submod
>>> ---
>>>    MAINTAINERS                       |   2 +-
>>>    include/asm-generic/vmlinux.lds.h |   1 +
>>>    include/linux/dynamic_debug.h     |  83 ++++++++++--
>>>    kernel/module/main.c              |   3 +
>>>    lib/Kconfig.debug                 |  24 +++-
>>>    lib/Makefile                      |   3 +
>>>    lib/dynamic_debug.c               | 203 ++++++++++++++++++++++++------
>>>    lib/test_dynamic_debug.c          | 111 +++++++++++-----
>>>    lib/test_dynamic_debug_submod.c   |  10 ++
>>
>> Hi Jim,
>>
>> While reading the files test_dynamic_debug*, I was wondering, they are
>> more samples than tests. Does it make sense to move them in samples/?
>> There is no need to do it in this series.
>>
>>>    9 files changed, 355 insertions(+), 85 deletions(-)
>>>    create mode 100644 lib/test_dynamic_debug_submod.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 0fa7c5728f1e..38afccb3b71e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -8041,7 +8041,7 @@ M:      Jim Cromie <jim.cromie@gmail.com>
>>>    S:  Maintained
>>>    F:  include/linux/dynamic_debug.h
>>>    F:  lib/dynamic_debug.c
>>> -F:   lib/test_dynamic_debug.c
>>> +F:   lib/test_dynamic_debug*.c
>>>
>>>    DYNAMIC INTERRUPT MODERATION
>>>    M:  Tal Gilboa <talgi@nvidia.com>
>>> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
>>> index 54504013c749..eb93fd09832b 100644
>>> --- a/include/asm-generic/vmlinux.lds.h
>>> +++ b/include/asm-generic/vmlinux.lds.h
>>> @@ -366,6 +366,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>>>        /* implement dynamic printk debug */                            \
>>>        . = ALIGN(8);                                                   \
>>>        BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)         \
>>> +     BOUNDED_SECTION_BY(__dyndbg_class_users, ___dyndbg_class_users) \
>>>        BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)                         \
>>>        CODETAG_SECTIONS()                                              \
>>>        LIKELY_PROFILE()                                                \
>>> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
>>> index c8102e89beb2..dc610a12b91c 100644
>>> --- a/include/linux/dynamic_debug.h
>>> +++ b/include/linux/dynamic_debug.h
>>> @@ -71,9 +71,28 @@ enum ddebug_class_map_type {
>>>         */
>>>    };
>>>
>>> +/*
> 
> BTW, Im gonna refine this ...
> 
>>> + * dyndbg-classmaps are devised to support DRM.debug directly:
>>> + *    10 enum-vals: DRM_UT_* define the categories
>>> + *   ~23 categorized *_dbg() macros, each passing a DRM_UT_* val as 1st arg
>>> + *     2 macros below them: drm_dev_dbg, __drm_dbg
>>> + * ~5000 calls to the categorized macros, across all of drivers/gpu/drm/
>>> + *
>>> + * When CONFIG_DRM_USE_DYNAMIC_DEBUG=y, the 2 low macros are redefined
>>> + * to invoke _dynamic_func_call_cls().  This compiles the category
>>> + * into each callsite's class_id field, where dyndbg can select on it
>>> + * and alter a callsite's patch-state, avoiding repeated __drm_debug
>>> + * checks.
>>> + *
>>> + * To make the callsites manageable from the >control file, authors
>>> + * provide a "classmap" of names to class_ids in use by the module(s),
>>> + * usually by stringifying the enum-vals.  Modules with multiple
>>> + * classmaps must arrange to share the 0..62 class_id space.
>>> + */
>>> +
>>>    struct ddebug_class_map {
>>> -     struct module *mod;
>>> -     const char *mod_name;   /* needed for builtins */
>>> +     const struct module *mod;               /* NULL for builtins */
>>> +     const char *mod_name;
>>
>> Is this change belongs to this patch? If not can you move this in a
>> "cleanup" patch?
> 
> It belongs, insofar as the mod field is actually NULL checked to determine
> builtin vs modular, mod_name is backup.
> Also its more specific than "needed for builtins"
> 
> But, grumble, ya, the above was an existing test, not a new one.
> OTOH - I guess Ive just written the cleanup commit msg :-)
> 
>>
>>>        const char **class_names;
>>>        const int length;
>>>        const int base;         /* index of 1st .class_id, allows split/shared space */
>>> @@ -81,11 +100,34 @@ struct ddebug_class_map {
>>>    };
>>>
>>>    /**
>>> - * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
>>> - * @_var:   a struct ddebug_class_map, passed to module_param_cb
>>> - * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
>>> - * @_base:  offset of 1st class-name. splits .class_id space
>>> - * @classes: class-names used to control class'd prdbgs
>>> + * DYNDBG_CLASSMAP_DEFINE - define debug classes used by a module.
>>> + * @_var:   name of the classmap, exported for other modules coordinated use.
>>> + * @_mapty: enum ddebug_class_map_type: 0:DISJOINT - independent, 1:LEVEL - v2>v1> + * @_base:  reserve N classids starting at _base, to split 0..62
>> classid space
>>> + * @classes: names of the N classes.
>>> + *
>>> + * This tells dyndbg what class_ids the module is using: _base..+N, by
>>> + * mapping names onto them.  This qualifies "class NAME" >controls on
>>> + * the defining module, ignoring unknown names.
>>> + */
>>> +#define DYNDBG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)             \
>>> +     static const char *_var##_classnames[] = { __VA_ARGS__ };       \
>>> +     extern struct ddebug_class_map _var;                            \
>>> +     struct ddebug_class_map __aligned(8) __used                     \
>>> +             __section("__dyndbg_classes") _var = {                  \
>>> +             .mod = THIS_MODULE,                                     \
>>> +             .mod_name = KBUILD_MODNAME,                             \
>>> +             .base = (_base),                                        \
>>> +             .map_type = (_mapty),                                   \
>>> +             .length = ARRAY_SIZE(_var##_classnames),                \
>>> +             .class_names = _var##_classnames,                       \
>>> +     };                                                              \
>>> +     EXPORT_SYMBOL(_var)
>>> +
>>> +/*
>>> + * XXX: keep this until DRM adapts to use the DEFINE/USE api, it
>>> + * differs from DYNDBG_CLASSMAP_DEFINE by the static replacing the
>>> + * extern/EXPORT on the struct init.
>>>     */
>>>    #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)         \
>>>        static const char *_var##_classnames[] = { __VA_ARGS__ };       \
>>> @@ -99,12 +141,37 @@ struct ddebug_class_map {
>>>                .class_names = _var##_classnames,                       \
>>>        }
>>>
>>> +struct ddebug_class_user {
>>> +     char *mod_name;
>>> +     struct ddebug_class_map *map;
>>> +};
>>> +
>>> +/**
>>> + * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
>>> + * @_var: name of the exported classmap var
>>> + *
>>> + * This tells dyndbg that the module has prdbgs with classids defined
>>> + * in the named classmap.  This qualifies "class NAME" >controls on
>>> + * the user module, ignoring unknown names.
>>> + */
>>> +#define DYNDBG_CLASSMAP_USE(_var)                                    \
>>> +     DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
>>> +#define DYNDBG_CLASSMAP_USE_(_var, _uname)                           \
>>> +     extern struct ddebug_class_map _var;                            \
>>> +     static struct ddebug_class_user __aligned(8) __used             \
>>> +     __section("__dyndbg_class_users") _uname = {                    \
>>> +             .mod_name = KBUILD_MODNAME,                             \
>>> +             .map = &(_var),                                         \
>>> +     }
>>> +
>>
>> I'm not sure I understand properly how __section works, but can we use
>> multiple DYNDBG_CLASSMAP_USE in one module? Can we also use
>> DYNDBG_CLASSMAP_DEFINE while also importing an other classmap
>> DYNDBG_CLASSMAP_USE?
>>
> 
> Yes, its supposed to work that way.
> 
> I havent tested that specific scenario (yet), but
> a _USEr module, like test-dynamic-debug-submod,
> could also _DEFINE its own, as long as it honors
> the class-id mapping it is using and therefore sharing.
> The on-modprobe conflict check should catch this condition.
> 
> And __section (ISTM) accumulates entries, typically static struct var
> initializations.
> AFAICT, scanning the sections is how these { scoped statics } are
> often reachable.
> 
> For example, dd's _METADATA_ builds a { static _ddebug } for every pr_debug.
> They all go into the __dyndbg section (renamed with _descriptors suffix soon),
> in the order their respective definer objects are linked.
> 
> include/asm-generic/vmlinux.lds.h  then places the __dyndbg_* sections
> into DATA, along with lots of other freight, for the various
> mechanisms they serve.
> 
> 
> 
> 
>> If not, does it make sense to allow it (for example MFD devices can
>> touch multiple subsystems)?
> 
> We have another use case !
> Do you know your way around that case ?
>

No, I don't have other use cases, I was just thinking about possible 
scenarios of the "include multiple classmap".

So, happy to konw it is not an issue with the section, but do I 
understand properly the code (completly hypotetical example): if drm.ko 
defines classes 0..10 and spi.ko defines classes 0..4, it means 
driver.ko can't use both classmap? (I don't have such use-case, and 
maybe this use-case does not exists!)

The only solution I see is to add more stuff in the _ddebug structure 
(for example a "classmap identifier"). But for now, the current user 
will be DRM, so we don't really need to fix this issue right now.

I just found a possible user for dyndbg classes [1], it seems to 
implement something similar.

[1]:https://elixir.bootlin.com/linux/v6.13.7/source/drivers/block/drbd/drbd_polymorph_printk.h

> Note that DEFINEr  & USEr calls set up linkage dependencies,
> As long as these are consistent with other module deps,
> it should work.
> 
> 
>>
>>>    /* encapsulate linker provided built-in (or module) dyndbg data */
>>>    struct _ddebug_info {
>>>        struct _ddebug *descs;
>>>        struct ddebug_class_map *classes;
>>> +     struct ddebug_class_user *class_users;
>>>        unsigned int num_descs;
>>>        unsigned int num_classes;
>>> +     unsigned int num_class_users;
>>>    };
>>>
>>>    struct ddebug_class_param {
>>> @@ -205,7 +272,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>>>     * (|_no_desc):     former gets callsite descriptor as 1st arg (for prdbgs)
>>>     */
>>>    #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {       \
>>> -     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
>>> +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);      \
>>
>> Can you move this in a "cleanup" patch?
>>
>>>        if (DYNAMIC_DEBUG_BRANCH(id))                           \
>>>                func(&id, ##__VA_ARGS__);                       \
>>>    } while (0)
>>> diff --git a/kernel/module/main.c b/kernel/module/main.c
>>> index 5399c182b3cb..c394a0c6e8c6 100644
>>> --- a/kernel/module/main.c
>>> +++ b/kernel/module/main.c
>>> @@ -2546,6 +2546,9 @@ static int find_module_sections(struct module *mod, struct load_info *info)
>>>        mod->dyndbg_info.classes = section_objs(info, "__dyndbg_classes",
>>>                                                sizeof(*mod->dyndbg_info.classes),
>>>                                                &mod->dyndbg_info.num_classes);
>>> +     mod->dyndbg_info.class_users = section_objs(info, "__dyndbg_class_users",
>>> +                                                 sizeof(*mod->dyndbg_info.class_users),
>>> +                                                &mod->dyndbg_info.num_class_users);
>>>    #endif
>>>
>>>        return 0;
>>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>>> index f3d723705879..933f69ef87f8 100644
>>> --- a/lib/Kconfig.debug
>>> +++ b/lib/Kconfig.debug
>>> @@ -2884,12 +2884,26 @@ config TEST_STATIC_KEYS
>>>          If unsure, say N.
>>>
>>>    config TEST_DYNAMIC_DEBUG
>>> -     tristate "Test DYNAMIC_DEBUG"
>>> -     depends on DYNAMIC_DEBUG
>>> +     tristate "Build test-dynamic-debug module"
>>> +     depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>>>        help
>>> -       This module registers a tracer callback to count enabled
>>> -       pr_debugs in a 'do_debugging' function, then alters their
>>> -       enablements, calls the function, and compares counts.
>>> +       This module exercises/demonstrates dyndbg's classmap API, by
>>> +       creating 2 classes: a DISJOINT classmap (supporting DRM.debug)
>>> +       and a LEVELS/VERBOSE classmap (like verbose2 > verbose1).
>>> +
>>> +       If unsure, say N.
>>> +
>>> +config TEST_DYNAMIC_DEBUG_SUBMOD
>>> +     tristate "Build test-dynamic-debug submodule"
>>> +     default m
>>> +     depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
>>> +     depends on TEST_DYNAMIC_DEBUG
>>> +     help
>>> +       This sub-module uses a classmap defined and exported by the
>>> +       parent module, recapitulating drm & driver's shared use of
>>> +       drm.debug to control enabled debug-categories.
>>> +       It is tristate, independent of parent, to allow testing all
>>> +       proper combinations of parent=y/m submod=y/m.
>>>
>>>          If unsure, say N.
>>>
>>> diff --git a/lib/Makefile b/lib/Makefile
>>> index a8155c972f02..7f66fc1c163d 100644
>>> --- a/lib/Makefile
>>> +++ b/lib/Makefile
>>> @@ -84,6 +84,7 @@ obj-$(CONFIG_TEST_SORT) += test_sort.o
>>>    obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
>>>    obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
>>>    obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
>>> +obj-$(CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD) += test_dynamic_debug_submod.o
>>>    obj-$(CONFIG_TEST_PRINTF) += test_printf.o
>>>    obj-$(CONFIG_TEST_SCANF) += test_scanf.o
>>>
>>> @@ -228,6 +229,8 @@ obj-$(CONFIG_ARCH_NEED_CMPXCHG_1_EMU) += cmpxchg-emu.o
>>>    obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
>>>    #ensure exported functions have prototypes
>>>    CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
>>> +CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
>>> +CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
>>>
>>>    obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
>>>
>>> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
>>> index 094d6e62a9d1..6bca0c6727d4 100644
>>> --- a/lib/dynamic_debug.c
>>> +++ b/lib/dynamic_debug.c
>>> @@ -43,13 +43,16 @@ extern struct _ddebug __start___dyndbg[];
>>>    extern struct _ddebug __stop___dyndbg[];
>>>    extern struct ddebug_class_map __start___dyndbg_classes[];
>>>    extern struct ddebug_class_map __stop___dyndbg_classes[];
>>> +extern struct ddebug_class_user __start___dyndbg_class_users[];
>>> +extern struct ddebug_class_user __stop___dyndbg_class_users[];
>>>
>>>    struct ddebug_table {
>>>        struct list_head link;
>>>        const char *mod_name;
>>>        struct _ddebug *ddebugs;
>>>        struct ddebug_class_map *classes;
>>> -     unsigned int num_ddebugs, num_classes;
>>> +     struct ddebug_class_user *class_users;
>>> +     unsigned int num_ddebugs, num_classes, num_class_users;
>>>    };
>>>
>>>    struct ddebug_query {
>>> @@ -148,23 +151,35 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>>>                  query->first_lineno, query->last_lineno, query->class_string);
>>>    }
>>>
>>> -#define __outvar /* filled by callee */
>>> -static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
>>> -                                                     const char *class_string,
>>> -                                                     __outvar int *class_id)
>>> +#define vpr_dt_info(dt_p, msg_p, ...) ({                             \
>>> +     struct ddebug_table const *_dt = dt_p;                          \
>>> +     v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
>>> +               _dt->mod_name, _dt->num_ddebugs, _dt->num_classes,    \
>>> +               _dt->num_class_users);                                \
>>> +     })
>>> +
>>> +static int ddebug_find_valid_class(struct ddebug_table const *dt, const char *class_string)
>>>    {
>>>        struct ddebug_class_map *map;
>>> +     struct ddebug_class_user *cli;
>>>        int i, idx;
>>>
>>> -     for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
>>> +     for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
>>>                idx = match_string(map->class_names, map->length, class_string);
>>>                if (idx >= 0) {
>>> -                     *class_id = idx + map->base;
>>> -                     return map;
>>> +                     vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
>>> +                     return idx + map->base;
>>>                }
>>>        }
>>> -     *class_id = -ENOENT;
>>> -     return NULL;
>>> +     for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
>>> +             idx = match_string(cli->map->class_names, cli->map->length, class_string);
>>> +             if (idx >= 0) {
>>> +                     vpr_dt_info(dt, "class-ref: %s -> %s.%s ",
>>> +                                 cli->mod_name, cli->map->mod_name, class_string);
>>> +                     return idx + cli->map->base;
>>> +             }
>>> +     }
>>> +     return -ENOENT;
>>>    }
>>>
>>>    /*
>>> @@ -173,16 +188,14 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
>>>     * callsites, normally the same as number of changes.  If verbose,
>>>     * logs the changes.  Takes ddebug_lock.
>>>     */
>>> -static int ddebug_change(const struct ddebug_query *query,
>>> -                      struct flag_settings *modifiers)
>>> +static int ddebug_change(const struct ddebug_query *query, struct flag_settings *modifiers)
>>>    {
>>>        int i;
>>>        struct ddebug_table *dt;
>>>        unsigned int newflags;
>>>        unsigned int nfound = 0;
>>>        struct flagsbuf fbuf, nbuf;
>>> -     struct ddebug_class_map *map = NULL;
>>> -     int __outvar valid_class;
>>> +     int valid_class;
>>>
>>>        /* search for matching ddebugs */
>>>        mutex_lock(&ddebug_lock);
>>> @@ -194,8 +207,8 @@ static int ddebug_change(const struct ddebug_query *query,
>>>                        continue;
>>>
>>>                if (query->class_string) {
>>> -                     map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
>>> -                     if (!map)
>>> +                     valid_class = ddebug_find_valid_class(dt, query->class_string);
>>> +                     if (valid_class < 0)
>>>                                continue;
>>>                } else {
>>>                        /* constrain query, do not touch class'd callsites */
>>> @@ -559,7 +572,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
>>>
>>>    /* handle multiple queries in query string, continue on error, return
>>>       last error or number of matching callsites.  Module name is either
>>> -   in param (for boot arg) or perhaps in query string.
>>> +   in the modname arg (for boot args) or perhaps in query string.
>>>    */
>>>    static int ddebug_exec_queries(char *query, const char *modname)
>>>    {
>>> @@ -688,12 +701,12 @@ static int param_set_dyndbg_module_classes(const char *instr,
>>>    }
>>>
>>>    /**
>>> - * param_set_dyndbg_classes - class FOO >control
>>> + * param_set_dyndbg_classes - set all classes in a classmap
>>>     * @instr: string echo>d to sysfs, input depends on map_type
>>> - * @kp:    kp->arg has state: bits/lvl, map, map_type
>>> + * @kp:    kp->arg has state: bits/lvl, classmap, map_type
>>>     *
>>> - * Enable/disable prdbgs by their class, as given in the arguments to
>>> - * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
>>> + * For all classes in the classmap, enable/disable them per the input
>>> + * (depending on map_type).  For LEVEL map-types, enforce relative
>>>     * levels by bitpos.
>>>     *
>>>     * Returns: 0 or <0 if error.
>>> @@ -1038,12 +1051,17 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>>>    static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
>>>    {
>>>        struct ddebug_class_map *map = dt->classes;
>>> +     struct ddebug_class_user *cli = dt->class_users;
>>>        int i;
>>>
>>>        for (i = 0; i < dt->num_classes; i++, map++)
>>>                if (class_in_range(dp->class_id, map))
>>>                        return map->class_names[dp->class_id - map->base];
>>>
>>> +     for (i = 0; i < dt->num_class_users; i++, cli++)
>>> +             if (class_in_range(dp->class_id, cli->map))
>>> +                     return cli->map->class_names[dp->class_id - cli->map->base];
>>> +
>>>        return NULL;
>>>    }
>>>
>>> @@ -1124,31 +1142,129 @@ static const struct proc_ops proc_fops = {
>>>        .proc_write = ddebug_proc_write
>>>    };
>>>
>>> -static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
>>> +#define vpr_cm_info(cm_p, msg_fmt, ...) ({                           \
>>> +     struct ddebug_class_map const *_cm = cm_p;                      \
>>> +     v2pr_info(msg_fmt " %s [%d..%d] %s..%s\n", ##__VA_ARGS__,       \
>>> +               _cm->mod_name, _cm->base, _cm->base + _cm->length,    \
>>> +               _cm->class_names[0], _cm->class_names[_cm->length - 1]); \
>>> +     })
>>> +
>>> +static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
>>> +{
>>> +     const struct ddebug_class_param *dcp = kp->arg;
>>> +
>>> +     /* clamp initial bitvec, mask off hi-bits */
>>> +     if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
>>> +             *dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
>>> +             v2pr_info("preset classbits: %lx\n", *dcp->bits);
>>> +     }
>>> +     /* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
>>> +     ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
>>> +     ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
>>> +}
>>> +
>>> +static void ddebug_match_apply_kparam(const struct kernel_param *kp,
>>> +                                   const struct ddebug_class_map *map,
>>> +                                   const char *modnm)
>>> +{
>>> +     struct ddebug_class_param *dcp;
>>> +
>>> +     if (kp->ops != &param_ops_dyndbg_classes)
>>> +             return;
>>> +
>>> +     dcp = (struct ddebug_class_param *)kp->arg;
>>> +
>>> +     if (map == dcp->map) {
>>> +             v2pr_info(" kp:%s.%s =0x%lx", modnm, kp->name, *dcp->bits);
>>> +             vpr_cm_info(map, " %s mapped to: ", modnm);
>>> +             ddebug_sync_classbits(kp, modnm);
>>> +     }
>>> +}
>>> +
>>> +static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
>>> +{
>>> +     const struct kernel_param *kp;
>>> +#if IS_ENABLED(CONFIG_MODULES)
>>> +     int i;
>>> +
>>> +     if (cm->mod) {
>>> +             vpr_cm_info(cm, "loaded classmap: %s", modnm);
>>> +             /* ifdef protects the cm->mod->kp deref */
>>> +             for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
>>> +                     ddebug_match_apply_kparam(kp, cm, modnm);
>>> +     }
>>> +#endif
>>> +     if (!cm->mod) {
>>> +             vpr_cm_info(cm, "builtin classmap: %s", modnm);
>>> +             for (kp = __start___param; kp < __stop___param; kp++)
>>> +                     ddebug_match_apply_kparam(kp, cm, modnm);
>>> +     }
>>> +}
>>> +
>>> +/*
>>> + * Find this module's classmaps in a sub/whole-range of the builtin/
>>> + * modular classmap vector/section.  Save the start and length of the
>>> + * subrange at its edges.
>>> + */
>>> +static void ddebug_attach_module_classes(struct ddebug_table *dt,
>>> +                                      const struct _ddebug_info *di)
>>>    {
>>>        struct ddebug_class_map *cm;
>>>        int i, nc = 0;
>>>
>>> -     /*
>>> -      * Find this module's classmaps in a subrange/wholerange of
>>> -      * the builtin/modular classmap vector/section.  Save the start
>>> -      * and length of the subrange at its edges.
>>> -      */
>>> -     for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
>>> -
>>> +     for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
>>>                if (!strcmp(cm->mod_name, dt->mod_name)) {
>>> -                     if (!nc) {
>>> -                             v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
>>> -                                       i, cm->mod_name, cm->base, cm->length, cm->map_type);
>>> +                     vpr_cm_info(cm, "classes[%d]:", i);
>>> +                     if (!nc++)
>>>                                dt->classes = cm;
>>> -                     }
>>> -                     nc++;
>>>                }
>>>        }
>>> -     if (nc) {
>>> -             dt->num_classes = nc;
>>> -             vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
>>> +     if (!nc)
>>> +             return;
>>> +
>>> +     vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
>>> +     dt->num_classes = nc;
>>> +
>>> +     for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
>>> +             ddebug_apply_params(cm, cm->mod_name);
>>> +}
>>> +
>>> +/*
>>> + * propagates class-params thru their classmaps to class-users.  this
>>> + * means a query against the dt/module, which means it must be on the
>>> + * list to be seen by ddebug_change.
>>> + */
>>> +static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
>>> +                                           const struct _ddebug_info *di)
>>> +{
>>> +     struct ddebug_class_user *cli;
>>> +     int i, nc = 0;
>>> +
>>> +     /*
>>> +      * For builtins: scan the array, find start/length of this
>>> +      * module's refs, save to dt.  For loadables, this is the
>>> +      * whole array.
>>> +      */
>>> +     for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
>>> +             if (WARN_ON_ONCE(!cli || !cli->map || !cli->mod_name))
>>> +                     continue;
>>> +             if (!strcmp(cli->mod_name, dt->mod_name)) {
>>> +                     vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i,
>>> +                                 cli->mod_name, cli->map->mod_name);
>>> +                     if (!nc++)
>>> +                             dt->class_users = cli;
>>> +             }
>>>        }
>>> +     if (!nc)
>>> +             return;
>>> +
>>> +     dt->num_class_users = nc;
>>> +
>>> +     /* now iterate dt */
>>> +     for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
>>> +             ddebug_apply_params(cli->map, cli->mod_name);
>>> +
>>> +     vpr_dt_info(dt, "attach-client-module: ");
>>>    }
>>>
>>>    /*
>>> @@ -1158,6 +1274,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
>>>    static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>>>    {
>>>        struct ddebug_table *dt;
>>> +     struct _ddebug *iter;
>>> +     int i, class_ct = 0;
>>>
>>>        if (!di->num_descs)
>>>                return 0;
>>> @@ -1181,13 +1299,20 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>>>
>>>        INIT_LIST_HEAD(&dt->link);
>>>
>>> -     if (di->classes && di->num_classes)
>>> +     for (i = 0, iter = di->descs; i < di->num_descs; i++, iter++)
>>> +             if (iter->class_id != _DPRINTK_CLASS_DFLT)
>>> +                     class_ct++;
>>> +
>>> +     if (class_ct && di->num_classes)
>>>                ddebug_attach_module_classes(dt, di);
>>>
>>>        mutex_lock(&ddebug_lock);
>>>        list_add_tail(&dt->link, &ddebug_tables);
>>>        mutex_unlock(&ddebug_lock);
>>>
>>> +     if (class_ct && di->num_class_users)
>>> +             ddebug_attach_user_module_classes(dt, di);
>>> +
>>>        vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
>>>        return 0;
>>>    }
>>> @@ -1337,8 +1462,10 @@ static int __init dynamic_debug_init(void)
>>>        struct _ddebug_info di = {
>>>                .descs = __start___dyndbg,
>>>                .classes = __start___dyndbg_classes,
>>> +             .class_users = __start___dyndbg_class_users,
>>>                .num_descs = __stop___dyndbg - __start___dyndbg,
>>>                .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
>>> +             .num_class_users = __stop___dyndbg_class_users - __start___dyndbg_class_users,
>>>        };
>>>
>>>    #ifdef CONFIG_MODULES
>>> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
>>> index 74d183ebf3e0..1838f62738c4 100644
>>> --- a/lib/test_dynamic_debug.c
>>> +++ b/lib/test_dynamic_debug.c
>>> @@ -6,11 +6,15 @@
>>>     *      Jim Cromie  <jim.cromie@gmail.com>
>>>     */
>>>
>>> -#define pr_fmt(fmt) "test_dd: " fmt
>>> +#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
>>> +  #define pr_fmt(fmt) "test_dd_submod: " fmt
>>> +#else
>>> +  #define pr_fmt(fmt) "test_dd: " fmt
>>> +#endif
>>>
>>>    #include <linux/module.h>
>>>
>>> -/* run tests by reading or writing sysfs node: do_prints */
>>> +/* re-gen output by reading or writing sysfs node: do_prints */
>>>
>>>    static void do_prints(void); /* device under test */
>>>    static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
>>> @@ -29,24 +33,39 @@ static const struct kernel_param_ops param_ops_do_prints = {
>>>    };
>>>    module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
>>>
>>> -/*
>>> - * Using the CLASSMAP api:
>>> - * - classmaps must have corresponding enum
>>> - * - enum symbols must match/correlate with class-name strings in the map.
>>> - * - base must equal enum's 1st value
>>> - * - multiple maps must set their base to share the 0-30 class_id space !!
>>> - *   (build-bug-on tips welcome)
>>> - * Additionally, here:
>>> - * - tie together sysname, mapname, bitsname, flagsname
>>> - */
>>> -#define DD_SYS_WRAP(_model, _flags)                                  \
>>> -     static unsigned long bits_##_model;                             \
>>> -     static struct ddebug_class_param _flags##_model = {             \
>>> +#define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
>>> +
>>> +/* sysfs param wrapper, proto-API */
>>> +#define DYNDBG_CLASSMAP_PARAM_(_model, _flags, _init)                        \
>>> +     static unsigned long bits_##_model = _init;                     \
>>> +     static struct ddebug_class_param _flags##_##_model = {          \
>>>                .bits = &bits_##_model,                                 \
>>>                .flags = #_flags,                                       \
>>>                .map = &map_##_model,                                   \
>>>        };                                                              \
>>> -     module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
>>> +     module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,   \
>>> +                     &_flags##_##_model, 0600)
>>> +#ifdef DEBUG
>>> +#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, ~0)
>>> +#else
>>> +#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, 0)
>>> +#endif
>>> +
>>> +/*
>>> + * Demonstrate/test all 4 class-typed classmaps with a sys-param.
>>> + *
>>> + * Each is 3 part: client-enum decl, _DEFINE, _PARAM.
>>> + * Declare them in blocks to show patterns of use (repetitions and
>>> + * changes) within each.
>>> + *
>>> + * 1st, dyndbg expects a client-provided enum-type as source of
>>> + * category/classid truth.  DRM has DRM_UT_<CORE,DRIVER,KMS,etc>.
>>> + *
>>> + * Modules with multiple CLASSMAPS must have enums with distinct
>>> + * value-ranges, arranged below with explicit enum_sym = X inits.
>>> + *
>>> + * Declare all 4 enums now, for different types
>>> + */
>>>
>>>    /* numeric input, independent bits */
>>>    enum cat_disjoint_bits {
>>> @@ -60,26 +79,51 @@ enum cat_disjoint_bits {
>>>        D2_LEASE,
>>>        D2_DP,
>>>        D2_DRMRES };
>>> -DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
>>> -                     "D2_CORE",
>>> -                     "D2_DRIVER",
>>> -                     "D2_KMS",
>>> -                     "D2_PRIME",
>>> -                     "D2_ATOMIC",
>>> -                     "D2_VBL",
>>> -                     "D2_STATE",
>>> -                     "D2_LEASE",
>>> -                     "D2_DP",
>>> -                     "D2_DRMRES");
>>> -DD_SYS_WRAP(disjoint_bits, p);
>>> -DD_SYS_WRAP(disjoint_bits, T);
>>>
>>>    /* numeric verbosity, V2 > V1 related */
>>>    enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
>>> -DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
>>> -                    "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
>>> -DD_SYS_WRAP(level_num, p);
>>> -DD_SYS_WRAP(level_num, T);
>>> +
>>> +/* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
>>> +#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
>>
>> It was not clear at first read that the test_dynamic_debug.c code is
>> used twice.
>>
> 
> Yes, that was a miss.  Now in big comment block at the top of both,
> right before the pr-fmt  mod-name shortening for the logs.
> 
> 
>> What do you think about creating a third file "common" with
>> do_prints/do_levels/... implementations and avoid this #if !defined?
>>
> 
> I'd rather not.  I think the multi-module usage is sufficiently interconnected
> (common enum, parent side, clone side) that all-in-one presentation
> helps to communicate this "linkage".
> 
> I hope the new comments clearly elucidate this.  PLMK if not.
> 
>>> +/*
>>> + * In single user, or parent / coordinator (drm.ko) modules, define
>>> + * classmaps on the client enums above, and then declares the PARAMS
>>> + * ref'g the classmaps.  Each is exported.
>>> + */
>>> +DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
>>
>> map_disjoint_bits is defined in both test_dynamic_debug.c and
>> test_dynamic_debug_submodule.c, is it normal/required?
> 
> Its the enum : cat_disjoint_bits, that is defined for both.
> 
> the _DEFINE itself is right after the ifdef TEST_MOD_SUBMOD.
> 
> do you think it needs a better MOD_SUBMOD name ?
> or an ifndef ?
> 
>>
>>> +                    D2_CORE,
>>> +                    "D2_CORE",
>>> +                    "D2_DRIVER",
>>> +                    "D2_KMS",
>>> +                    "D2_PRIME",
>>> +                    "D2_ATOMIC",
>>> +                    "D2_VBL",
>>> +                    "D2_STATE",
>>> +                    "D2_LEASE",
>>> +                    "D2_DP",
>>> +                    "D2_DRMRES");
>>> +
>>> +DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
>>> +                    V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
>>> +
>>> +/*
>>> + * now add the sysfs-params
>>> + */
>>> +
>>> +DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
>>> +DYNDBG_CLASSMAP_PARAM(level_num, p);
>>> +
>>> +#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
>>> +
>>> +/*
>>> + * in submod/drm-drivers, use the classmaps defined in top/parent
>>> + * module above.
>>> + */
>>> +
>>> +DYNDBG_CLASSMAP_USE(map_disjoint_bits);
>>> +DYNDBG_CLASSMAP_USE(map_level_num);
>>> +
>>> +#endif
>>>
>>>    /* stand-in for all pr_debug etc */
>>>    #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
>>> @@ -115,6 +159,7 @@ static void do_levels(void)
>>>
>>>    static void do_prints(void)
>>>    {
>>> +     pr_debug("do_prints:\n");
>>>        do_cats();
>>>        do_levels();
>>
>> I just observed it, is the ordering of logs garanteed in
>> /proc/dynamic_debug/control?
>>
> 
> Yes. the fully ordered table/__section is pretty important.
> If its not true for descriptors, its probably not true for class-maps
> or users either
> and the list-iter --> vector-block conversion a few commits ago isnt
> solid either.
> 
> its also an explicit assumption under these commits
> 
> 773beabbb8e8 dyndbg: reverse module.callsite walk in cat control
> 2ad556f70043 dyndbg: reverse module walk in cat control
> 
> All in all, I think something would have broken by now.
> 
> 
>> When I run this test, I have this order:
>>
>> do_cats =_ "doing categories\n"
>> [...]
>> do_levels =_ "doing levels\n"
>> [...]
>> do_prints =_ "do_prints:\n"
>> test_dynamic_debug_init =_ "init start\n"
>> test_dynamic_debug_init =_ "init done\n"
>> test_dynamic_debug_exit =_ "exited\n"
>>
>> Which is clearly not the code execution order.
> 
> Youre correct.
> the control file reflects compile link order.
> 
> Im pretty sure the appearance of init 1st in control derives from init/builtin.a
> being built 1st and/or linked 1st.
> 
>>
>>>    }
>>> diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
>>> new file mode 100644
>>> index 000000000000..9a893402ce1a
>>> --- /dev/null
>>> +++ b/lib/test_dynamic_debug_submod.c
>>> @@ -0,0 +1,10 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Kernel module for testing dynamic_debug
>>> + *
>>> + * Authors:
>>> + *      Jim Cromie   <jim.cromie@gmail.com>
>>> + */
>>> +
>>> +#define TEST_DYNAMIC_DEBUG_SUBMOD
>>> +#include "test_dynamic_debug.c"
>>
>> --
>> Louis Chauvet, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
> 
> thanks again Lous,
> Jim

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


