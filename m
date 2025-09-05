Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53871B46555
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 23:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A16A10EC59;
	Fri,  5 Sep 2025 21:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QXK26/QP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47BF10EC56;
 Fri,  5 Sep 2025 21:16:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 894D4C6B3A0;
 Fri,  5 Sep 2025 21:16:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D6ED76060B;
 Fri,  5 Sep 2025 21:16:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B4E33102F1C32; 
 Fri,  5 Sep 2025 23:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757106976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=sjXsVs41POn3zl7mwth27KGLe7I+5IAV0bpWcFgzeL4=;
 b=QXK26/QP3qKkfw4bP0mFfzVTFiOFmWATrTck6pTLkX4Wh7cihUVKpdpIANAOZ55uY04NA9
 yuhyAzakVqT2Sf1XNc9FoTuSIMpmGd/R03MucpPf/bhYaUdWemy118zoDLFkxJO+eJMG7u
 vQ+6MX4z7MDQiBHgPVslO7g1+3QMyoAYqHht03zZmB+LufOO5HYHOovkd873HEgcY2pYjs
 B7EIA0m9ecu7EF4ZPH5neIqCrjW6rQn8+A+M/MD1R86UfU0MdtTubGhjomymjvQSDnTp1Y
 5bcytPUG6Y+cAzMlMDUPlXlfDuxe5BxgusSI0YZ0wPiAt47MdR8Lm0eCMpckkA==
Message-ID: <ae4641e1-c696-44ef-a127-4ff3f0951ce3@bootlin.com>
Date: Fri, 5 Sep 2025 23:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/58] dyndbg-API: remove
 DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, seanpaul@chromium.org,
 robdclark@gmail.com, groeck@google.com, yanivt@google.com,
 bleung@google.com, quic_saipraka@quicinc.com, will@kernel.org,
 catalin.marinas@arm.com, quic_psodagud@quicinc.com, maz@kernel.org,
 arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com
References: <20250803035816.603405-1-jim.cromie@gmail.com>
 <20250803035816.603405-17-jim.cromie@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250803035816.603405-17-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 03/08/2025 à 05:57, Jim Cromie a écrit :
> Remove the DD_CLASS_TYPE_*_NAMES classmap types and code.
> 
> These 2 classmap types accept class names at the PARAM interface, for
> example:
> 
>    echo +DRM_UT_CORE,-DRM_UT_KMS > /sys/module/drm/parameters/debug_names
> 
> The code works, but its only used by test-dynamic-debug, and wasn't
> asked for by anyone else, so reduce LOC & test-surface; simplify things.
> 
> Also rename enum class_map_type to enum ddebug_class_map_type.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   include/linux/dynamic_debug.h |  23 ++------
>   lib/dynamic_debug.c           | 102 +++-------------------------------
>   lib/test_dynamic_debug.c      |  26 ---------
>   3 files changed, 14 insertions(+), 137 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index f4d1d08cd5a7c..769f02456c8e0 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -58,27 +58,16 @@ struct _ddebug {
>   #endif
>   } __attribute__((aligned(8)));
>   
> -enum class_map_type {
> +enum ddebug_class_map_type {
>   	DD_CLASS_TYPE_DISJOINT_BITS,
>   	/**
> -	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, one per bit.
> -	 * expecting hex input. Built for drm.debug, basis for other types.
> +	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, mapped to bits[0..N].
> +	 * Expects hex input. Built for drm.debug, basis for other types.
>   	 */
>   	DD_CLASS_TYPE_LEVEL_NUM,
>   	/**
> -	 * DD_CLASS_TYPE_LEVEL_NUM: input is numeric level, 0-N.
> -	 * N turns on just bits N-1 .. 0, so N=0 turns all bits off.
> -	 */
> -	DD_CLASS_TYPE_DISJOINT_NAMES,
> -	/**
> -	 * DD_CLASS_TYPE_DISJOINT_NAMES: input is a CSV of [+-]CLASS_NAMES,
> -	 * classes are independent, like _DISJOINT_BITS.
> -	 */
> -	DD_CLASS_TYPE_LEVEL_NAMES,
> -	/**
> -	 * DD_CLASS_TYPE_LEVEL_NAMES: input is a CSV of [+-]CLASS_NAMES,
> -	 * intended for names like: INFO,DEBUG,TRACE, with a module prefix
> -	 * avoid EMERG,ALERT,CRIT,ERR,WARNING: they're not debug
> +	 * DD_CLASS_TYPE_LEVEL_NUM: input is numeric level, 0..N.
> +	 * Input N turns on bits 0..N-1
>   	 */
>   };
>   
> @@ -88,7 +77,7 @@ struct _ddebug_class_map {
>   	const char **class_names;
>   	const int length;
>   	const int base;		/* index of 1st .class_id, allows split/shared space */
> -	enum class_map_type map_type;
> +	enum ddebug_class_map_type map_type;
>   };
>   
>   /**
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 09f19155d7f02..2cd28a64578dd 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -646,76 +646,6 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
>   
>   #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
>   
> -/* accept comma-separated-list of [+-] classnames */
> -static int param_set_dyndbg_classnames(const char *instr, const struct kernel_param *kp)
> -{
> -	const struct _ddebug_class_param *dcp = kp->arg;
> -	const struct _ddebug_class_map *map = dcp->map;
> -	unsigned long curr_bits, old_bits;
> -	char *cl_str, *p, *tmp;
> -	int cls_id, totct = 0;
> -	bool wanted;
> -
> -	cl_str = tmp = kstrdup_and_replace(instr, '\n', '\0', GFP_KERNEL);
> -	if (!tmp)
> -		return -ENOMEM;
> -
> -	/* start with previously set state-bits, then modify */
> -	curr_bits = old_bits = *dcp->bits;
> -	vpr_info("\"%s\" > %s:0x%lx\n", cl_str, KP_NAME(kp), curr_bits);
> -
> -	for (; cl_str; cl_str = p) {
> -		p = strchr(cl_str, ',');
> -		if (p)
> -			*p++ = '\0';
> -
> -		if (*cl_str == '-') {
> -			wanted = false;
> -			cl_str++;
> -		} else {
> -			wanted = true;
> -			if (*cl_str == '+')
> -				cl_str++;
> -		}
> -		cls_id = match_string(map->class_names, map->length, cl_str);
> -		if (cls_id < 0) {
> -			pr_err("%s unknown to %s\n", cl_str, KP_NAME(kp));
> -			continue;
> -		}
> -
> -		/* have one or more valid class_ids of one *_NAMES type */
> -		switch (map->map_type) {
> -		case DD_CLASS_TYPE_DISJOINT_NAMES:
> -			/* the +/- pertains to a single bit */
> -			if (test_bit(cls_id, &curr_bits) == wanted) {
> -				v3pr_info("no change on %s\n", cl_str);
> -				continue;
> -			}
> -			curr_bits ^= BIT(cls_id);
> -			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
> -			*dcp->bits = curr_bits;
> -			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
> -				  map->class_names[cls_id]);
> -			break;
> -		case DD_CLASS_TYPE_LEVEL_NAMES:
> -			/* cls_id = N in 0..max. wanted +/- determines N or N-1 */
> -			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
> -			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
> -
> -			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
> -			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
> -			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
> -				  map->class_names[cls_id], old_bits, curr_bits);
> -			break;
> -		default:
> -			pr_err("illegal map-type value %d\n", map->map_type);
> -		}
> -	}
> -	kfree(tmp);
> -	vpr_info("total matches: %d\n", totct);
> -	return 0;
> -}
> -
>   static int param_set_dyndbg_module_classes(const char *instr,
>   					   const struct kernel_param *kp,
>   					   const char *mod_name)
> @@ -724,29 +654,17 @@ static int param_set_dyndbg_module_classes(const char *instr,
>   	const struct _ddebug_class_map *map = dcp->map;
>   	unsigned long inrep, new_bits, old_bits;
>   	int rc, totct = 0;
> -
> -	switch (map->map_type) {
> -
> -	case DD_CLASS_TYPE_DISJOINT_NAMES:
> -	case DD_CLASS_TYPE_LEVEL_NAMES:
> -		/* handle [+-]classnames list separately, we are done here */
> -		return param_set_dyndbg_classnames(instr, kp);
> -
> -	case DD_CLASS_TYPE_DISJOINT_BITS:
> -	case DD_CLASS_TYPE_LEVEL_NUM:
> -		/* numeric input, accept and fall-thru */
> -		rc = kstrtoul(instr, 0, &inrep);
> -		if (rc) {
> -			pr_err("expecting numeric input: %s > %s\n", instr, KP_NAME(kp));
> -			return -EINVAL;
> -		}
> -		break;
> -	default:
> -		pr_err("%s: bad map type: %d\n", KP_NAME(kp), map->map_type);
> +	char *nl;
> +
> +	rc = kstrtoul(instr, 0, &inrep);
> +	if (rc) {
> +		nl = strchr(instr, '\n');
> +		if (nl)
> +			*nl = '\0';
> +		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
>   		return -EINVAL;
>   	}
>   
> -	/* only _BITS,_NUM (numeric) map-types get here */
>   	switch (map->map_type) {
>   	case DD_CLASS_TYPE_DISJOINT_BITS:
>   		/* expect bits. mask and warn if too many */
> @@ -812,12 +730,8 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
>   	const struct _ddebug_class_map *map = dcp->map;
>   
>   	switch (map->map_type) {
> -
> -	case DD_CLASS_TYPE_DISJOINT_NAMES:
>   	case DD_CLASS_TYPE_DISJOINT_BITS:
>   		return scnprintf(buffer, PAGE_SIZE, "0x%lx\n", *dcp->bits);
> -
> -	case DD_CLASS_TYPE_LEVEL_NAMES:
>   	case DD_CLASS_TYPE_LEVEL_NUM:
>   		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
>   	default:
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 8434f70b51bb3..9c3e53cd26bd8 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -74,13 +74,6 @@ DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
>   DD_SYS_WRAP(disjoint_bits, p);
>   DD_SYS_WRAP(disjoint_bits, T);
>   
> -/* symbolic input, independent bits */
> -enum cat_disjoint_names { LOW = 10, MID, HI };
> -DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
> -			"LOW", "MID", "HI");
> -DD_SYS_WRAP(disjoint_names, p);
> -DD_SYS_WRAP(disjoint_names, T);
> -
>   /* numeric verbosity, V2 > V1 related */
>   enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
>   DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
> @@ -88,13 +81,6 @@ DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
>   DD_SYS_WRAP(level_num, p);
>   DD_SYS_WRAP(level_num, T);
>   
> -/* symbolic verbosity */
> -enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
> -DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
> -			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
> -DD_SYS_WRAP(level_names, p);
> -DD_SYS_WRAP(level_names, T);
> -
>   /* stand-in for all pr_debug etc */
>   #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
>   
> @@ -102,10 +88,6 @@ static void do_cats(void)
>   {
>   	pr_debug("doing categories\n");
>   
> -	prdbg(LOW);
> -	prdbg(MID);
> -	prdbg(HI);
> -
>   	prdbg(D2_CORE);
>   	prdbg(D2_DRIVER);
>   	prdbg(D2_KMS);
> @@ -129,14 +111,6 @@ static void do_levels(void)
>   	prdbg(V5);
>   	prdbg(V6);
>   	prdbg(V7);
> -
> -	prdbg(L1);
> -	prdbg(L2);
> -	prdbg(L3);
> -	prdbg(L4);
> -	prdbg(L5);
> -	prdbg(L6);
> -	prdbg(L7);
>   }
>   
>   static void do_prints(void)

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

