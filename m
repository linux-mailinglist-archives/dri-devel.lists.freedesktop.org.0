Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE635A89914
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D97610E6C4;
	Tue, 15 Apr 2025 10:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MzT1fowm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6585C10E6C8;
 Tue, 15 Apr 2025 10:00:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2360E4329A;
 Tue, 15 Apr 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744711203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vUYVZuaTBxQqDuIauu9Q/hU2uH0us6wpvuaUlcEEg0M=;
 b=MzT1fowmAGeUqtN5XEO4a7RfySXT6SwO33lE24CpcAxC0iAPlVq6TibCVQ5PySBvBkSaP0
 c7AA9HBjYg+0CnuT563LHq+pAe0kxl3L7xTgWPMVNBv2k0XbcOkhcxRwj8b+GWtC918d6b
 qk9t8mReSABoVRdegteRUM/tIls28cqmyxQy/k0Zty76bU25UeJNyzMS343NhPQEOWhu9X
 Zqh1MjMtkcpyIsR4i6LQilP6+9oOKW2D7OK0t3LKdMXR8USeodTIA9qjsl6rZmA1UGtii3
 rRxxK2AxPSoc2On5QJhTcv/zIsx+At64ARToK9xvO+s6u16YYTkF1OZYLqTeIA==
Message-ID: <6894e9ce-9252-4275-aae7-6230c57498b1@bootlin.com>
Date: Tue, 15 Apr 2025 11:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v3 13/54] dyndbg, module: make proper substructs in
 _ddebug_info
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-14-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250402174156.1246171-14-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehukhgrshiisgestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheplhhin
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
> recompose struct _ddebug_info, inserting proper sub-structs.
> 
> The struct currently has 2 pairs of fields: descs, num_descs and
> classes, num_classes.  Several for-loops operate on these field pairs,
> soon many more will be added.
> 
> Looping over these blocks by respective field-pairs is repetitive and
> fiddly, differing only by the field-names.  Before adding a 3rd
> section and compounding the fiddly details problem, make proper
> substructs of each section, with the same named fields.
> 
> So this patch does:
> 
> Adds 3 "vector<T>" structs, each with { <T> *start, int len; }
> components, for _ddebug_descriptors, _ddebug_class_maps, and
> _ddebug_class_users respectively.
> 
> Invariant: These vectors ref a contiguous subrange of __section memory
> in builtin/DATA or in loadable modules via mod->dyndbg_info; with
> guaranteed life-time for us.
> 
> Bundles these 3 vectors (subrange-refs) struct (reformed) _ddebug_info,
> where they're __packed to close the paholes introduced otherwise.
> 
> The common fields allow improving the for_subvec() macro by dropping
> the ugly num_##<T> paste-up.
> 
> Also recompose struct ddebug_table to contain a _ddebug_info.  This
> reinforces its use as a cursor into relevant data for a builtin
> module, and access to the full _ddebug state for modules.
> 
> NOTES:
> 
> Fixup names: section names improved, struct names normalized to
> _ddebug_*
> 
> struct module contains a _ddebug_info field and module/main.c sets it
> up, so that gets adjusted.
> 
> The __packed attribute on _ddebug_info and the 3 contained structs
> closes the holes otherwise created by the structification (which was
> my excuse for not doing it originally).
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> -v2 rework towards front of series
> ---
>   include/asm-generic/vmlinux.lds.h |   4 +-
>   include/linux/dynamic_debug.h     |  42 +++++++-----
>   kernel/module/main.c              |  12 ++--
>   lib/dynamic_debug.c               | 108 ++++++++++++++----------------
>   lib/test_dynamic_debug.c          |   2 +-
>   5 files changed, 88 insertions(+), 80 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index c9c66089ea2f..f834ad1fb8c4 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -366,8 +366,8 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>   	*(__tracepoints)						\
>   	/* implement dynamic printk debug */				\
>   	. = ALIGN(8);							\
> -	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
> -	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
> +	BOUNDED_SECTION_BY(__dyndbg_class_maps, ___dyndbg_class_maps)	\
> +	BOUNDED_SECTION_BY(__dyndbg_descriptors, ___dyndbg_descs)	\
>   	CODETAG_SECTIONS()						\
>   	LIKELY_PROFILE()		       				\
>   	BRANCH_PROFILE()						\
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index e458d4b838ac..9d282e2444e1 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -82,7 +82,7 @@ enum class_map_type {
>   	 */
>   };
>   
> -struct ddebug_class_map {
> +struct _ddebug_class_map {
>   	struct module *mod;
>   	const char *mod_name;	/* needed for builtins */
>   	const char **class_names;
> @@ -93,15 +93,15 @@ struct ddebug_class_map {
>   
>   /**
>    * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
> - * @_var:   a struct ddebug_class_map, passed to module_param_cb
> + * @_var:   a struct _ddebug_class_map, passed to module_param_cb
>    * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
>    * @_base:  offset of 1st class-name. splits .class_id space
>    * @classes: class-names used to control class'd prdbgs
>    */
>   #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
>   	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
> -	static struct ddebug_class_map __aligned(8) __used		\
> -		__section("__dyndbg_classes") _var = {			\
> +	static struct _ddebug_class_map __aligned(8) __used		\
> +		__section("__dyndbg_class_maps") _var = {		\
>   		.mod = THIS_MODULE,					\
>   		.mod_name = KBUILD_MODNAME,				\
>   		.base = _base,						\
> @@ -110,21 +110,33 @@ struct ddebug_class_map {
>   		.class_names = _var##_classnames,			\
>   	}
>   
> -/* encapsulate linker provided built-in (or module) dyndbg data */
> +/*
> + * @_ddebug_info: gathers module/builtin dyndbg_* __sections together.
> + * For builtins, it is used as a cursor, with the inner structs
> + * marking sub-vectors of the builtin __sections in DATA.
> + */
> +struct _ddebug_descs {
> +	struct _ddebug *start;
> +	int len;
> +} __packed;
> +
> +struct _ddebug_class_maps {
> +	struct _ddebug_class_map *start;
> +	int len;
> +} __packed;
> +
>   struct _ddebug_info {
> -	struct _ddebug *descs;
> -	struct ddebug_class_map *classes;
> -	unsigned int num_descs;
> -	unsigned int num_classes;
> -};
> +	struct _ddebug_descs descs;
> +	struct _ddebug_class_maps maps;
> +} __packed;
>   
> -struct ddebug_class_param {
> +struct _ddebug_class_param {
>   	union {
>   		unsigned long *bits;
>   		unsigned long *lvl;
>   	};
>   	char flags[8];
> -	const struct ddebug_class_map *map;
> +	const struct _ddebug_class_map *map;
>   };
>   
>   /*
> @@ -159,7 +171,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>   
>   #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
>   	static struct _ddebug  __aligned(8)			\
> -	__section("__dyndbg") name = {				\
> +	__section("__dyndbg_descriptors") name = {		\
>   		.modname = KBUILD_MODNAME,			\
>   		.function = __func__,				\
>   		.filename = __FILE__,				\
> @@ -242,7 +254,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>    * macro.
>    */
>   #define _dynamic_func_call_cls(cls, fmt, func, ...)			\
> -	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
> +	__dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
>   #define _dynamic_func_call(fmt, func, ...)				\
>   	_dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
>   
> @@ -252,7 +264,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>    * with precisely the macro's varargs.
>    */
>   #define _dynamic_func_call_cls_no_desc(cls, fmt, func, ...)		\
> -	__dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,	\
> +	__dynamic_func_call_cls_no_desc(__UNIQUE_ID(_ddebug), cls, fmt,	\
>   					func, ##__VA_ARGS__)
>   #define _dynamic_func_call_no_desc(fmt, func, ...)			\
>   	_dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,	\
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 1fb9ad289a6f..b60f728e36ac 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2621,12 +2621,12 @@ static int find_module_sections(struct module *mod, struct load_info *info)
>   		pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
>   
>   #ifdef CONFIG_DYNAMIC_DEBUG_CORE
> -	mod->dyndbg_info.descs = section_objs(info, "__dyndbg",
> -					      sizeof(*mod->dyndbg_info.descs),
> -					      &mod->dyndbg_info.num_descs);
> -	mod->dyndbg_info.classes = section_objs(info, "__dyndbg_classes",
> -						sizeof(*mod->dyndbg_info.classes),
> -						&mod->dyndbg_info.num_classes);
> +	mod->dyndbg_info.descs.start = section_objs(info, "__dyndbg_descriptors",
> +						    sizeof(*mod->dyndbg_info.descs.start),
> +						    &mod->dyndbg_info.descs.len);
> +	mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_class_maps",
> +						   sizeof(*mod->dyndbg_info.maps.start),
> +						   &mod->dyndbg_info.maps.len);
>   #endif
>   
>   	return 0;
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 253eaf0a9bd6..104cf8abdf33 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -39,17 +39,15 @@
>   
>   #include <rdma/ib_verbs.h>
>   
> -extern struct _ddebug __start___dyndbg[];
> -extern struct _ddebug __stop___dyndbg[];
> -extern struct ddebug_class_map __start___dyndbg_classes[];
> -extern struct ddebug_class_map __stop___dyndbg_classes[];
> +extern struct _ddebug __start___dyndbg_descs[];
> +extern struct _ddebug __stop___dyndbg_descs[];
> +extern struct _ddebug_class_map __start___dyndbg_class_maps[];
> +extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
>   
>   struct ddebug_table {
>   	struct list_head link;
>   	const char *mod_name;
> -	struct _ddebug *ddebugs;
> -	struct ddebug_class_map *classes;
> -	unsigned int num_ddebugs, num_classes;
> +	struct _ddebug_info info;
>   };
>   
>   struct ddebug_query {
> @@ -128,7 +126,6 @@ do {								\
>   #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
>   #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
>   
> -
>   /*
>    * simplify a repeated for-loop pattern walking N steps in a T _vec
>    * member inside a struct _box.  It expects int i and T *_sp to be
> @@ -139,8 +136,8 @@ do {								\
>    * @_vec: name of a sub-struct member in _box, with array-ref and length
>    */
>   #define for_subvec(_i, _sp, _box, _vec)				       \
> -	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
> -	     (_i) < (_box)->num_##_vec;				       \
> +	for ((_i) = 0, (_sp) = (_box)->_vec.start;		       \
> +	     (_i) < (_box)->_vec.len;				       \
>   	     (_i)++, (_sp)++)
>   
>   static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
> @@ -163,14 +160,14 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   		  query->first_lineno, query->last_lineno, query->class_string);
>   }
>   
> -static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> +static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
>   							const char *class_string,
>   							int *class_id)
>   {
> -	struct ddebug_class_map *map;
> +	struct _ddebug_class_map *map;
>   	int i, idx;
>   
> -	for_subvec(i, map, dt, classes) {
> +	for_subvec(i, map, &dt->info, maps) {
>   		idx = match_string(map->class_names, map->length, class_string);
>   		if (idx >= 0) {
>   			*class_id = idx + map->base;
> @@ -195,7 +192,7 @@ static int ddebug_change(const struct ddebug_query *query,
>   	unsigned int newflags;
>   	unsigned int nfound = 0;
>   	struct flagsbuf fbuf, nbuf;
> -	struct ddebug_class_map *map = NULL;
> +	struct _ddebug_class_map *map = NULL;
>   	int valid_class;
>   
>   	/* search for matching ddebugs */
> @@ -216,8 +213,8 @@ static int ddebug_change(const struct ddebug_query *query,
>   			valid_class = _DPRINTK_CLASS_DFLT;
>   		}
>   
> -		for (i = 0; i < dt->num_ddebugs; i++) {
> -			struct _ddebug *dp = &dt->ddebugs[i];
> +		for (i = 0; i < dt->info.descs.len; i++) {
> +			struct _ddebug *dp = &dt->info.descs.start[i];
>   
>   			/* match site against query-class */
>   			if (dp->class_id != valid_class)
> @@ -610,14 +607,14 @@ static int ddebug_exec_queries(char *query, const char *modname)
>   }
>   
>   /* apply a new class-param setting */
> -static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
> +static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
>   				     const unsigned long *new_bits,
>   				     const unsigned long old_bits,
>   				     const char *query_modname)
>   {
>   #define QUERY_SIZE 128
>   	char query[QUERY_SIZE];
> -	const struct ddebug_class_map *map = dcp->map;
> +	const struct _ddebug_class_map *map = dcp->map;
>   	int matches = 0;
>   	int bi, ct;
>   
> @@ -653,8 +650,8 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   /* accept comma-separated-list of [+-] classnames */
>   static int param_set_dyndbg_classnames(const char *instr, const struct kernel_param *kp)
>   {
> -	const struct ddebug_class_param *dcp = kp->arg;
> -	const struct ddebug_class_map *map = dcp->map;
> +	const struct _ddebug_class_param *dcp = kp->arg;
> +	const struct _ddebug_class_map *map = dcp->map;
>   	unsigned long curr_bits, old_bits;
>   	char *cl_str, *p, *tmp;
>   	int cls_id, totct = 0;
> @@ -724,8 +721,8 @@ static int param_set_dyndbg_module_classes(const char *instr,
>   					   const struct kernel_param *kp,
>   					   const char *mod_name)
>   {
> -	const struct ddebug_class_param *dcp = kp->arg;
> -	const struct ddebug_class_map *map = dcp->map;
> +	const struct _ddebug_class_param *dcp = kp->arg;
> +	const struct _ddebug_class_map *map = dcp->map;
>   	unsigned long inrep, new_bits, old_bits;
>   	int rc, totct = 0;
>   
> @@ -812,8 +809,8 @@ EXPORT_SYMBOL(param_set_dyndbg_classes);
>    */
>   int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
>   {
> -	const struct ddebug_class_param *dcp = kp->arg;
> -	const struct ddebug_class_map *map = dcp->map;
> +	const struct _ddebug_class_param *dcp = kp->arg;
> +	const struct _ddebug_class_map *map = dcp->map;
>   
>   	switch (map->map_type) {
>   
> @@ -1064,8 +1061,8 @@ static struct _ddebug *ddebug_iter_first(struct ddebug_iter *iter)
>   	}
>   	iter->table = list_entry(ddebug_tables.next,
>   				 struct ddebug_table, link);
> -	iter->idx = iter->table->num_ddebugs;
> -	return &iter->table->ddebugs[--iter->idx];
> +	iter->idx = iter->table->info.descs.len;
> +	return &iter->table->info.descs.start[--iter->idx];
>   }
>   
>   /*
> @@ -1086,10 +1083,10 @@ static struct _ddebug *ddebug_iter_next(struct ddebug_iter *iter)
>   		}
>   		iter->table = list_entry(iter->table->link.next,
>   					 struct ddebug_table, link);
> -		iter->idx = iter->table->num_ddebugs;
> +		iter->idx = iter->table->info.descs.len;
>   		--iter->idx;
>   	}
> -	return &iter->table->ddebugs[iter->idx];
> +	return &iter->table->info.descs.start[iter->idx];
>   }
>   
>   /*
> @@ -1136,12 +1133,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>   #define class_in_range(class_id, map)					\
>   	(class_id >= map->base && class_id < map->base + map->length)
>   
> -static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
> +static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
>   {
> -	struct ddebug_class_map *map = iter->table->classes;
> -	int i, nc = iter->table->num_classes;
> +	struct _ddebug_class_map *map;
> +	int i;
>   
> -	for (i = 0; i < nc; i++, map++)
> +	for_subvec(i, map, &dt->info, maps)
>   		if (class_in_range(dp->class_id, map))
>   			return map->class_names[dp->class_id - map->base];
>   
> @@ -1175,7 +1172,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>   	seq_putc(m, '"');
>   
>   	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
> -		class = ddebug_class_name(iter, dp);
> +		class = ddebug_class_name(iter->table, dp);
>   		if (class)
>   			seq_printf(m, " class:%s", class);
>   		else
> @@ -1227,7 +1224,7 @@ static const struct proc_ops proc_fops = {
>   
>   static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
>   {
> -	struct ddebug_class_map *cm;
> +	struct _ddebug_class_map *cm;
>   	int i, nc = 0;
>   
>   	/*
> @@ -1235,18 +1232,18 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
>   	 * the builtin/modular classmap vector/section.  Save the start
>   	 * and length of the subrange at its edges.
>   	 */
> -	for_subvec(i, cm, di, classes) {
> +	for_subvec(i, cm, di, maps) {
>   		if (!strcmp(cm->mod_name, dt->mod_name)) {
>   			if (!nc) {
>   				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
>   					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
> -				dt->classes = cm;
> +				dt->info.maps.start = cm;
>   			}
>   			nc++;
>   		}
>   	}
>   	if (nc) {
> -		dt->num_classes = nc;
> +		dt->info.maps.len = nc;
>   		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
>   	}
>   }
> @@ -1259,10 +1256,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   {
>   	struct ddebug_table *dt;
>   
> -	if (!di->num_descs)
> +	if (!di->descs.len)
>   		return 0;
>   
> -	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
> +	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
>   
>   	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
>   	if (dt == NULL) {
> @@ -1276,19 +1273,18 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	 * this struct ddebug_table.
>   	 */
>   	dt->mod_name = modname;
> -	dt->ddebugs = di->descs;
> -	dt->num_ddebugs = di->num_descs;
> +	dt->info = *di;
>   
>   	INIT_LIST_HEAD(&dt->link);
>   
> -	if (di->classes && di->num_classes)
> +	if (di->maps.len)
>   		ddebug_attach_module_classes(dt, di);
>   
>   	mutex_lock(&ddebug_lock);
>   	list_add_tail(&dt->link, &ddebug_tables);
>   	mutex_unlock(&ddebug_lock);
>   
> -	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
> +	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
>   	return 0;
>   }
>   
> @@ -1435,10 +1431,10 @@ static int __init dynamic_debug_init(void)
>   	char *cmdline;
>   
>   	struct _ddebug_info di = {
> -		.descs = __start___dyndbg,
> -		.classes = __start___dyndbg_classes,
> -		.num_descs = __stop___dyndbg - __start___dyndbg,
> -		.num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
> +		.descs.start = __start___dyndbg_descs,
> +		.maps.start  = __start___dyndbg_class_maps,
> +		.descs.len = __stop___dyndbg_descs - __start___dyndbg_descs,
> +		.maps.len  = __stop___dyndbg_class_maps - __start___dyndbg_class_maps,
>   	};
>   
>   #ifdef CONFIG_MODULES
> @@ -1449,7 +1445,7 @@ static int __init dynamic_debug_init(void)
>   	}
>   #endif /* CONFIG_MODULES */
>   
> -	if (&__start___dyndbg == &__stop___dyndbg) {
> +	if (&__start___dyndbg_descs == &__stop___dyndbg_descs) {
>   		if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
>   			pr_warn("_ddebug table is empty in a CONFIG_DYNAMIC_DEBUG build\n");
>   			return 1;
> @@ -1459,16 +1455,16 @@ static int __init dynamic_debug_init(void)
>   		return 0;
>   	}
>   
> -	iter = iter_mod_start = __start___dyndbg;
> +	iter = iter_mod_start = __start___dyndbg_descs;
>   	modname = iter->modname;
>   	i = mod_sites = mod_ct = 0;
>   
> -	for (; iter < __stop___dyndbg; iter++, i++, mod_sites++) {
> +	for (; iter < __stop___dyndbg_descs; iter++, i++, mod_sites++) {
>   
>   		if (strcmp(modname, iter->modname)) {
>   			mod_ct++;
> -			di.num_descs = mod_sites;
> -			di.descs = iter_mod_start;
> +			di.descs.len = mod_sites;
> +			di.descs.start = iter_mod_start;
>   			ret = ddebug_add_module(&di, modname);
>   			if (ret)
>   				goto out_err;
> @@ -1478,8 +1474,8 @@ static int __init dynamic_debug_init(void)
>   			iter_mod_start = iter;
>   		}
>   	}
> -	di.num_descs = mod_sites;
> -	di.descs = iter_mod_start;
> +	di.descs.len = mod_sites;
> +	di.descs.start = iter_mod_start;
>   	ret = ddebug_add_module(&di, modname);
>   	if (ret)
>   		goto out_err;
> @@ -1489,8 +1485,8 @@ static int __init dynamic_debug_init(void)
>   		 i, mod_ct, (int)((mod_ct * sizeof(struct ddebug_table)) >> 10),
>   		 (int)((i * sizeof(struct _ddebug)) >> 10));
>   
> -	if (di.num_classes)
> -		v2pr_info("  %d builtin ddebug class-maps\n", di.num_classes);
> +	if (di.maps.len)
> +		v2pr_info("  %d builtin ddebug class-maps\n", di.maps.len);
>   
>   	/* now that ddebug tables are loaded, process all boot args
>   	 * again to find and activate queries given in dyndbg params.
> diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> index 396144cf351b..8434f70b51bb 100644
> --- a/lib/test_dynamic_debug.c
> +++ b/lib/test_dynamic_debug.c
> @@ -41,7 +41,7 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
>    */
>   #define DD_SYS_WRAP(_model, _flags)					\
>   	static unsigned long bits_##_model;				\
> -	static struct ddebug_class_param _flags##_model = {		\
> +	static struct _ddebug_class_param _flags##_model = {		\
>   		.bits = &bits_##_model,					\
>   		.flags = #_flags,					\
>   		.map = &map_##_model,					\

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


