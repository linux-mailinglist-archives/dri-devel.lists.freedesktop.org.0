Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9651A8995E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F125210E6ED;
	Tue, 15 Apr 2025 10:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hMyWARml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C996B10E6EC;
 Tue, 15 Apr 2025 10:06:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 043EB41C84;
 Tue, 15 Apr 2025 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744711580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q6ZEhQJwUP8CK3Rj8mD3wckp2L0qRcOWpr3MnaENNjY=;
 b=hMyWARml5Nd1gfxYiiqlGvDPkUsGafQKe5QOFPQctmYSw+B3RUMyc39EqPgrbjhUZtBlYP
 CNk4z9bOlMjw1E4IRCOoJm3wqW5+vaGLJfDl2K9LNTDY6eEcCckvmMnhcS2jYP9XBmL6XT
 +3Wmy/+b1gaT43mH0qiY7KOVpz8JsGlrt384A0TZaad1VxQkf6ERahy2HKLByxWouBiIYg
 z2C/3bDXz8jsTO4CQ3uzQyX14xy+v/neVwGe9upVuZyWbwBv7t/EfBZE7r827H0Lre0g9O
 vg33+xFxcuoPg/acu/Mo7O+ByHDES649U+qXZVvAJhswYBZHshQyy2j7OFoWXA==
Message-ID: <60d5b50d-817a-4c99-81dc-fafbcd63861e@bootlin.com>
Date: Tue, 15 Apr 2025 12:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 22/54] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM
 to API
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 linux-doc@vger.kernel.org
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-23-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250402174156.1246171-23-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhvthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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



Le 02/04/2025 à 19:41, Jim Cromie a écrit :
> move the DYNAMIC_DEBUG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
> the header, and refine it, by distinguishing the 2 use cases:
> 
> 1.DYNAMIC_DEBUG_CLASSMAP_PARAM_REF
>      for DRM, to pass in extern __drm_debug by name.
>      dyndbg keeps bits in it, so drm can still use it as before
> 
> 2.DYNAMIC_DEBUG_CLASSMAP_PARAM
>      new user (test_dynamic_debug) doesn't need to share state,
>      decls a static long unsigned int to store the bitvec.
> 
> __DYNAMIC_DEBUG_CLASSMAP_PARAM
>     bottom layer - allocate,init a ddebug-class-param, module-param-cb.
> 
> Modify ddebug_sync_classbits() argtype deref inside the fn, to give
> access to all kp members.
> 
> Also clean up and improve comments in test-code, and add
> MODULE_DESCRIPTIONs.
> 
> cc: linux-doc@vger.kernel.org
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> 
> -v9
>   - fixup drm-print.h  add PARAM_REF forwarding macros
>     with DYNAMIC_DEBUG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
> ---
>   include/linux/dynamic_debug.h   | 38 +++++++++++++++++++++
>   lib/dynamic_debug.c             | 60 ++++++++++++++++++++++-----------
>   lib/test_dynamic_debug.c        | 47 ++++++++++----------------
>   lib/test_dynamic_debug_submod.c |  9 ++++-
>   4 files changed, 104 insertions(+), 50 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index 4941ef2adb46..ce221a702f84 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -211,6 +211,44 @@ struct _ddebug_class_param {
>   	const struct _ddebug_class_map *map;
>   };
>   
> +/**
> + * DYNAMIC_DEBUG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
> + * @_name:  sysfs node name
> + * @_var:   name of the classmap var defining the controlled classes/bits
> + * @_flags: flags to be toggled, typically just 'p'
> + *
> + * Creates a sysfs-param to control the classes defined by the
> + * exported classmap, with bits 0..N-1 mapped to the classes named.
> + * This version keeps class-state in a private long int.
> + */
> +#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
> +	static unsigned long _name##_bvec;				\
> +	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
> +
> +/**
> + * DYNAMIC_DEBUG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
> + * @_name:  sysfs node name
> + * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_debug
> + * @_var:   name of the (exported) classmap var defining the classes/bits
> + * @_flags: flags to be toggled, typically just 'p'
> + *
> + * Creates a sysfs-param to control the classes defined by the
> + * exported clasmap, with bits 0..N-1 mapped to the classes named.
> + * This version keeps class-state in user @_bits.  This lets drm check
> + * __drm_debug elsewhere too.
> + */
> +#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
> +	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
> +
> +#define __DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)	\
> +	static struct _ddebug_class_param _name##_##_flags = {		\
> +		.bits = &(_bits),					\
> +		.flags = #_flags,					\
> +		.map = &(_var),						\
> +	};								\
> +	module_param_cb(_name, &param_ops_dyndbg_classes,		\
> +			&_name##_##_flags, 0600)
> +
>   /*
>    * pr_debug() and friends are globally enabled or modules have selectively
>    * enabled them.
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 56b503af0b31..0d603caadef8 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -666,6 +666,30 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
>   
>   #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
>   
> +static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
> +{
> +	const struct _ddebug_class_param *dcp = kp->arg;
> +	const struct _ddebug_class_map *map = dcp->map;
> +
> +	switch (map->map_type) {
> +	case DD_CLASS_TYPE_DISJOINT_BITS:
> +		/* expect bits. mask and warn if too many */
> +		if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
> +			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
> +				KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map->length));
> +			*inrep &= CLASSMAP_BITMASK(map->length);
> +		}
> +		break;
> +	case DD_CLASS_TYPE_LEVEL_NUM:
> +		/* input is bitpos, of highest verbosity to be enabled */
> +		if (*inrep > map->length) {
> +			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
> +				KP_NAME(kp), *inrep, map->length);
> +			*inrep = map->length;
> +		}
> +		break;
> +	}
> +}
>   static int param_set_dyndbg_module_classes(const char *instr,
>   					   const struct kernel_param *kp,
>   					   const char *mod_name)
> @@ -684,26 +708,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
>   		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
>   		return -EINVAL;
>   	}
> +	ddebug_class_param_clamp_input(&inrep, kp);
>   
>   	switch (map->map_type) {
>   	case DD_CLASS_TYPE_DISJOINT_BITS:
> -		/* expect bits. mask and warn if too many */
> -		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
> -			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
> -				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
> -			inrep &= CLASSMAP_BITMASK(map->length);
> -		}
>   		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
>   		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
>   		*dcp->bits = inrep;
>   		break;
>   	case DD_CLASS_TYPE_LEVEL_NUM:
> -		/* input is bitpos, of highest verbosity to be enabled */
> -		if (inrep > map->length) {
> -			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
> -				KP_NAME(kp), inrep, map->length);
> -			inrep = map->length;
> -		}
>   		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
>   		new_bits = CLASSMAP_BITMASK(inrep);
>   		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
> @@ -1171,15 +1184,24 @@ static const struct proc_ops proc_fops = {
>   static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
>   {
>   	const struct _ddebug_class_param *dcp = kp->arg;
> +	unsigned long new_bits;
>   
> -	/* clamp initial bitvec, mask off hi-bits */
> -	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
> -		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
> -		v2pr_info("preset classbits: %lx\n", *dcp->bits);
> +	ddebug_class_param_clamp_input(dcp->bits, kp);
> +
> +	switch (dcp->map->map_type) {
> +	case DD_CLASS_TYPE_DISJOINT_BITS:
> +		v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->bits);
> +		ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
> +		break;
> +	case DD_CLASS_TYPE_LEVEL_NUM:
> +		new_bits = CLASSMAP_BITMASK(*dcp->lvl);
> +		v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *dcp->lvl, new_bits);
> +		ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
> +		break;
> +	default:
> +		pr_err("bad map type %d\n", dcp->map->map_type);
> +		return;
>   	}
> -	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
> -	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);

No need to do this before applying the bitmap?

> -	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
>   }
>   
>   static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 4a3d2612ef60..78cf5420770a 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Kernel module for testing dynamic_debug
> + * Kernel module to test/demonstrate dynamic_debug features,
> + * particularly classmaps and their support for subsystems like DRM.
>    *
>    * Authors:
>    *      Jim Cromie	<jim.cromie@gmail.com>
> @@ -62,24 +63,6 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
>   
>   #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
>   
> -/* sysfs param wrapper, proto-API */
> -#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)		\
> -	static unsigned long bits_##_model = _init;			\
> -	static struct _ddebug_class_param _flags##_##_model = {		\
> -		.bits = &bits_##_model,					\
> -		.flags = #_flags,					\
> -		.map = &map_##_model,					\
> -	};								\
> -	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
> -			&_flags##_##_model, 0600)
> -#ifdef DEBUG
> -#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
> -	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
> -#else
> -#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
> -	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
> -#endif
> -
>   /*
>    * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
>    *
> @@ -110,12 +93,15 @@ enum cat_disjoint_bits {
>   /* numeric verbosity, V2 > V1 related.  V0 is > D2_DRM_RES */
>   enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
>   
> -/* recapitulate DRM's multi-classmap setup */
> +/*
> + * use/demonstrate multi-module-group classmaps, as for DRM
> + */
>   #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
>   /*
> - * In single user, or parent / coordinator (drm.ko) modules, define
> - * classmaps on the client enums above, and then declares the PARAMS
> - * ref'g the classmaps.  Each is exported.
> + * For module-groups of 1+, define classmaps with names (stringified
> + * enum-symbols) copied from above. 1-to-1 mapping is recommended.
> + * The classmap is exported, so that other modules in the group can
> + * link to it and control their prdbgs.
>    */
>   DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
>   			      D2_CORE,
> @@ -134,11 +120,13 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
>   			      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
>   
>   /*
> - * now add the sysfs-params
> + * for use-cases that want it, provide a sysfs-param to set the
> + * classes in the classmap.  It is at this interface where the
> + * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
>    */
>   
> -DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
> -DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
> +DYNAMIC_DEBUG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
> +DYNAMIC_DEBUG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
>   
>   #ifdef FORCE_CLASSID_CONFLICT
>   /*
> @@ -149,12 +137,10 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
>   #endif
>   
>   #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
> -
>   /*
> - * in submod/drm-drivers, use the classmaps defined in top/parent
> - * module above.
> + * the +1 members of a multi-module group refer to the classmap
> + * DEFINEd (and exported) above.
>    */
> -
>   DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
>   DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
>   
> @@ -229,6 +215,7 @@ static void __exit test_dynamic_debug_exit(void)
>   module_init(test_dynamic_debug_init);
>   module_exit(test_dynamic_debug_exit);
>   
> +MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
>   MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
>   MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
>   MODULE_LICENSE("GPL");
> diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
> index 672aabf40160..3adf3925fb86 100644
> --- a/lib/test_dynamic_debug_submod.c
> +++ b/lib/test_dynamic_debug_submod.c
> @@ -1,6 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Kernel module for testing dynamic_debug
> + * Kernel module to test/demonstrate dynamic_debug features,
> + * particularly classmaps and their support for subsystems, like DRM,
> + * which defines its drm_debug classmap in drm module, and uses it in
> + * helpers & drivers.
>    *
>    * Authors:
>    *      Jim Cromie	<jim.cromie@gmail.com>
> @@ -12,3 +15,7 @@
>    */
>   #define TEST_DYNAMIC_DEBUG_SUBMOD
>   #include "test_dynamic_debug.c"
> +
> +MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support");
> +MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
> +MODULE_LICENSE("GPL");

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


