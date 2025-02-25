Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D63A442BC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AD210E6E5;
	Tue, 25 Feb 2025 14:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VzY+Hzpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6921710E6E4;
 Tue, 25 Feb 2025 14:29:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 139CA443F9;
 Tue, 25 Feb 2025 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740493765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQVZTI+J2Bxmo3+kW+7/DMCdK4aDeLF6zQe9+Aj4Ae4=;
 b=VzY+HzpxDC0A1CGsy+h8mRVnlKhu5h6SA3Yx+cgETRLhG+YOHo2Fv/HDEvF+T+6LwxpD4g
 NjJgFvCs49gdQ0i1OIAspWWD5+F1mpLjoV+I+JKzMUQ0i5tlCIOGbOKIHUE6zg6ygkIV75
 QxFP6hqS5gxWw8IjX9MMOwZRTNVswM6dB41tY7JxQjlAx3bQ3SiMrkktMlEJrH4NSpjMmZ
 3ihph4TJoUv8u3gROxMY9d2WIxS88UBHfbHnnd/77aNfUNzf6JmY6MYvcGUrW6HoENfkUb
 YBOvFvoun3qe0hdrvRmayrvxesZH+jNIiJQdUELOZIb4I3av0Nz6TN+JsDPTnA==
Date: Tue, 25 Feb 2025 15:29:22 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 28/63] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
Message-ID: <160ec360-918d-414f-aef9-606cfa1749df@bootlin.com>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-29-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-29-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
 dhorhhgpdhrtghpthhtohepuhhkrghsiigssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigqdhtrhihsghotheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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



Le 25/01/2025 à 07:45, Jim Cromie a écrit :
> move the DYNDBG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
> the header, and refine it, by distinguishing the 2 use cases:
> 
> 1.DYNDBG_CLASSMAP_PARAM_REF
>      for DRM, to pass in extern __drm_debug by name.
>      dyndbg keeps bits in it, so drm can still use it as before
> 
> 2.DYNDBG_CLASSMAP_PARAM
>      new user (test_dynamic_debug) doesn't need to share state,
>      decls a static long unsigned int to store the bitvec.
> 
> __DYNDBG_CLASSMAP_PARAM
>     bottom layer - allocate,init a ddebug-class-param, module-param-cb.
> 
> Modify ddebug_sync_classbits() argtype deref inside the fn, to give
> access to all kp members.
> 
> Also clean up and improve comments in test-code, and add
> MODULE_DESCRIPTIONs.
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> 
> -v9
>   - fixup drm-print.h  add PARAM_REF forwarding macros
>     with DYNDBG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
> ---
>   include/linux/dynamic_debug.h   | 38 +++++++++++++++++++++
>   lib/dynamic_debug.c             | 60 ++++++++++++++++++++++-----------
>   lib/test_dynamic_debug.c        | 59 +++++++++++++-------------------
>   lib/test_dynamic_debug_submod.c |  9 ++++-
>   4 files changed, 111 insertions(+), 55 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index 48d76a273f68..b47d1088b7ad 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -205,6 +205,44 @@ struct ddebug_class_param {
>   	const struct ddebug_class_map *map;
>   };
>   
> +/**
> + * DYNDBG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
> + * @_name:  sysfs node name
> + * @_var:   name of the classmap var defining the controlled classes/bits
> + * @_flags: flags to be toggled, typically just 'p'
> + *
> + * Creates a sysfs-param to control the classes defined by the
> + * exported classmap, with bits 0..N-1 mapped to the classes named.
> + * This version keeps class-state in a private long int.
> + */
> +#define DYNDBG_CLASSMAP_PARAM(_name, _var, _flags)			\
> +	static unsigned long _name##_bvec;				\
> +	__DYNDBG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
> +
> +/**
> + * DYNDBG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
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
> +#define DYNDBG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)		\
> +	__DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
> +
> +#define __DYNDBG_CLASSMAP_PARAM(_name, _bits, _var, _flags)		\
> +	static struct ddebug_class_param _name##_##_flags = {		\
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
> index 781781835094..9283f2866415 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -660,6 +660,30 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   
>   #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
>   
> +static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
> +{
> +	const struct ddebug_class_param *dcp = kp->arg;
> +	const struct ddebug_class_map *map = dcp->map;
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
>   					   const char *modnm)
> @@ -678,26 +702,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
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
>   		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
>   		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
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
> @@ -1163,15 +1176,24 @@ static const struct proc_ops proc_fops = {
>   static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
>   {
>   	const struct ddebug_class_param *dcp = kp->arg;
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
> -	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);

Hi Jim,

We lost the double call with ~0/0, is it normal?

Thanks a lot for your work,
Louis Chauvet

>   }
>   
>   static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 5cfc156ca4bb..32a9d49a7a3b 100644
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
> @@ -43,36 +44,21 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
>   
>   #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
>   
> -/* sysfs param wrapper, proto-API */
> -#define DYNDBG_CLASSMAP_PARAM_(_model, _flags, _init)			\
> -	static unsigned long bits_##_model = _init;			\
> -	static struct ddebug_class_param _flags##_##_model = {		\
> -		.bits = &bits_##_model,					\
> -		.flags = #_flags,					\
> -		.map = &map_##_model,					\
> -	};								\
> -	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
> -			&_flags##_##_model, 0600)
> -#ifdef DEBUG
> -#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, ~0)
> -#else
> -#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, 0)
> -#endif
> -
>   /*
> - * Demonstrate/test all 4 class-typed classmaps with a sys-param.
> + * Demonstrate/test both types of classmaps, each with a sys-param.
>    *
>    * Each is 3 part: client-enum decl, _DEFINE, _PARAM.
> - * Declare them in blocks to show patterns of use (repetitions and
> - * changes) within each.
> + * Pair the 6 parts by type, to show the pattern of repetition and
> + * change within each.
>    *
> - * 1st, dyndbg expects a client-provided enum-type as source of
> - * category/classid truth.  DRM has DRM_UT_<CORE,DRIVER,KMS,etc>.
> + * 1st, dyndbg classmaps follows drm.debug convention, and expects a
> + * client-provided enum-type as source of category/classid truth.  DRM
> + * gives DRM_UT_<CORE,DRIVER,KMS,etc>.
>    *
>    * Modules with multiple CLASSMAPS must have enums with distinct
>    * value-ranges, arranged below with explicit enum_sym = X inits.
>    *
> - * Declare all 4 enums now, for different types
> + * Declare the 2 enums now.
>    */
>   
>   /* numeric input, independent bits */
> @@ -91,12 +77,15 @@ enum cat_disjoint_bits {
>   /* numeric verbosity, V2 > V1 related */
>   enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
>   
> -/* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
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
>   
>   DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
> @@ -116,11 +105,12 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
>   		       V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
>   
>   /*
> - * now add the sysfs-params
> + * for use-cases that want it, provide a sysfs-param to set the
> + * classes in the classmap.  It is at this interface where the
> + * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
>    */
> -
> -DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
> -DYNDBG_CLASSMAP_PARAM(level_num, p);
> +DYNDBG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
> +DYNDBG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
>   
>   #ifdef FORCE_CLASSID_CONFLICT_MODPROBE
>   /*
> @@ -131,12 +121,10 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
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
>   DYNDBG_CLASSMAP_USE(map_disjoint_bits);
>   DYNDBG_CLASSMAP_USE(map_level_num);
>   
> @@ -211,6 +199,7 @@ static void __exit test_dynamic_debug_exit(void)
>   module_init(test_dynamic_debug_init);
>   module_exit(test_dynamic_debug_exit);
>   
> +MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
>   MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
>   MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
>   MODULE_LICENSE("GPL");
> diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
> index 9a893402ce1a..0d15f3ffe466 100644
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
> @@ -8,3 +11,7 @@
>   
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

