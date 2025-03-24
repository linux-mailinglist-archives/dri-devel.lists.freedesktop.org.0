Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0024A6DDCC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6110E423;
	Mon, 24 Mar 2025 15:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BgW/Llt4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F3310E423;
 Mon, 24 Mar 2025 15:08:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F1A84425B;
 Mon, 24 Mar 2025 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742828899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=B8WCvbcBG/swgTDjytmb4iTiToSMWuDyajHh9/+5uRA=;
 b=BgW/Llt4dzW79LVS2TbrGvbmEp76JjglpnGYmzXu0z9lS0b/E/Pq8X8g6k8v3BYtnOO4R0
 prmr+XRgMaL9fu8Ev5QR9NmGk/9s0sAHY5yCCziAGD7nq8K9frYeA0JWMwyeWZEWXRUwXr
 k1y3erl8PZNK53nsFIEagvQVK2lnMRhASprcyfAIyXt/SwtWE+yJYdsvn8dHuZsLJAuaBT
 CbWv0cUXszGqboeDfGWNAoU47aSzfRvgLv9gPaLATY9vf8D8wePDL32cjuXc+WbPS8IxVb
 vm/9VBFsohnAGaDNzbfyqNn0ePTXqUOTh173nnPnva8CZyLLuz/feuWRMLx+GQ==
Message-ID: <b1615fb9-4689-4121-a7d1-7e9c5d10282b@bootlin.com>
Date: Mon, 24 Mar 2025 16:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 10/59] dyndbg: replace classmap list with a vector
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-11-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250320185238.447458-11-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedttdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsr
 dhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhvthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhfgidqthhrhigsohhtsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomh
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



Le 20/03/2025 à 19:51, Jim Cromie a écrit :
> Classmaps are stored in an elf section/array, but currently are
> individually list-linked onto dyndbg's per-module ddebug_table for
> operation. This is unnecessary.
> 
> Just like dyndbg's descriptors, classes are packed in compile order;
> so even with many builtin modules employing multiple classmaps, each
> modules' maps are packed contiguously, and can be treated as a
> array-start-address & array-length.
> 
> So this drops the whole list building operation done in
> ddebug_attach_module_classes(), and removes the list-head members.
> The "select-by-modname" condition is reused to find the start,end of
> the subrange.
> 
> NOTE: This "filter-by-modname" on classmaps should really be done in
> ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
> which already splits up pr-debug descriptors into subranges by
> modname, then calls (1) on each.  (2) knows nothing of classmaps
> currently, and doesn't need to.  For now, just add comment.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>   include/linux/dynamic_debug.h |  1 -
>   lib/dynamic_debug.c           | 61 ++++++++++++++++++-----------------
>   2 files changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index ac199293d203..e458d4b838ac 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -83,7 +83,6 @@ enum class_map_type {
>   };
>   
>   struct ddebug_class_map {
> -	struct list_head link;
>   	struct module *mod;
>   	const char *mod_name;	/* needed for builtins */
>   	const char **class_names;
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index dd7320b9616d..d5572712ce55 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
>   extern struct ddebug_class_map __stop___dyndbg_classes[];
>   
>   struct ddebug_table {
> -	struct list_head link, maps;
> +	struct list_head link;
>   	const char *mod_name;
> -	unsigned int num_ddebugs;
>   	struct _ddebug *ddebugs;
> +	struct ddebug_class_map *classes;
> +	unsigned int num_ddebugs, num_classes;
>   };
>   
>   struct ddebug_query {
> @@ -147,13 +148,15 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   		  query->first_lineno, query->last_lineno, query->class_string);
>   }
>   
> +#define __outvar /* filled by callee */
>   static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
> -							  const char *class_string, int *class_id)
> +							const char *class_string,
> +							__outvar int *class_id)

Thanks for your explanation of __outvar! It makes sense. I never seen 
this pattern anywhere in the kernel, maybe a simple doc comment is 
enough to carry the information:

	/**
	 * ddebug_find_valid_class - Find a valid class for a
	 * given string
	 * @dt: debug table to inspect
	 * @class_string: string to match on
	 * @class_id: output pointer for the class_id value
	 *
	 * Returns: Pointer to the ddebug_class_map instance, if found.
	 * @class_id will be set to the id of this class. If no class
	 * matching @class_string is found, returns NULL and class_id is
	 * set to -ENOENT.
	 */

Or at maybe change the documentation of __outvar to be a bit more 
explicit about how it works (I had difficulties to understand because a 
lot of "magic macro" exist in the kernel and sometimes carry information 
to the compiler, but this one is always empty):

	/**
	 * __outvar - Denotes that an argument is used as an output
	 * value
	 * This macro does nothing apart clarify  for the reader that
	 * the parameter will be filled by the callee
	 */

With any of the modifications (feel free to reword them as you want):

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

>   {
>   	struct ddebug_class_map *map;
> -	int idx;
> +	int i, idx;
>   
> -	list_for_each_entry(map, &dt->maps, link) {
> +	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
>   		idx = match_string(map->class_names, map->length, class_string);
>   		if (idx >= 0) {
>   			*class_id = idx + map->base;
> @@ -164,7 +167,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
>   	return NULL;
>   }
>   
> -#define __outvar /* filled by callee */
>   /*
>    * Search the tables for _ddebug's which match the given `query' and
>    * apply the `flags' and `mask' to them.  Returns number of matching
> @@ -1122,9 +1124,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>   
>   static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
>   {
> -	struct ddebug_class_map *map;
> +	struct ddebug_class_map *map = iter->table->classes;
> +	int i, nc = iter->table->num_classes;
>   
> -	list_for_each_entry(map, &iter->table->maps, link)
> +	for (i = 0; i < nc; i++, map++)
>   		if (class_in_range(dp->class_id, map))
>   			return map->class_names[dp->class_id - map->base];
>   
> @@ -1208,30 +1211,31 @@ static const struct proc_ops proc_fops = {
>   	.proc_write = ddebug_proc_write
>   };
>   
> -static void ddebug_attach_module_classes(struct ddebug_table *dt,
> -					 struct ddebug_class_map *classes,
> -					 int num_classes)
> +static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
>   {
>   	struct ddebug_class_map *cm;
> -	int i, j, ct = 0;
> +	int i, nc = 0;
>   
> -	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
> +	/*
> +	 * Find this module's classmaps in a subrange/wholerange of
> +	 * the builtin/modular classmap vector/section.  Save the start
> +	 * and length of the subrange at its edges.
> +	 */
> +	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
>   
>   		if (!strcmp(cm->mod_name, dt->mod_name)) {
> -
> -			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
> -				  cm->mod_name, cm->base, cm->length, cm->map_type);
> -
> -			for (j = 0; j < cm->length; j++)
> -				v3pr_info(" %d: %d %s\n", j + cm->base, j,
> -					  cm->class_names[j]);
> -
> -			list_add(&cm->link, &dt->maps);
> -			ct++;
> +			if (!nc) {
> +				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
> +					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
> +				dt->classes = cm;
> +			}
> +			nc++;
>   		}
>   	}
> -	if (ct)
> -		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
> +	if (nc) {
> +		dt->num_classes = nc;
> +		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> +	}
>   }
>   
>   /*
> @@ -1263,10 +1267,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	dt->num_ddebugs = di->num_descs;
>   
>   	INIT_LIST_HEAD(&dt->link);
> -	INIT_LIST_HEAD(&dt->maps);
>   
>   	if (di->classes && di->num_classes)
> -		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
> +		ddebug_attach_module_classes(dt, di);
>   
>   	mutex_lock(&ddebug_lock);
>   	list_add_tail(&dt->link, &ddebug_tables);
> @@ -1379,8 +1382,8 @@ static void ddebug_remove_all_tables(void)
>   	mutex_lock(&ddebug_lock);
>   	while (!list_empty(&ddebug_tables)) {
>   		struct ddebug_table *dt = list_entry(ddebug_tables.next,
> -						      struct ddebug_table,
> -						      link);
> +						     struct ddebug_table,
> +						     link);
>   		ddebug_table_free(dt);
>   	}
>   	mutex_unlock(&ddebug_lock);

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


