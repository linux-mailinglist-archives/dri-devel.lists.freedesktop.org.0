Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B0A6DE30
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9310E45D;
	Mon, 24 Mar 2025 15:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Bt3alWHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B64210E45D;
 Mon, 24 Mar 2025 15:19:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A27433D6;
 Mon, 24 Mar 2025 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742829570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NIOYBuXA29JWaJv/xjWrr9a955L2cegWId9tye+HKUc=;
 b=Bt3alWHnJF9JgRhmjJTHyjz2KArUxAf94WHg2BjKNHY2yp6DPb48y3l6SbM1fGy9b0cbxw
 Ey4x03tIdRJgJZWB0DT+n0I/LlHiLxBvLaNErxjtZzlUQkp8C5c1pooxs+DPGmaCvrWlmN
 6XDZRINI+Boq7jUpdkUxo5S2BRZOTGPV0WaphS2xI2r9dFKh/RypaAwIErqZR3jPL0m/HF
 aDTOUUahstN7fA76err7a5EptZ7HN5z8hn4Qx7RjCYXl4OJnrAkZ/GR3/w9ZbEFsROuGA7
 XC59vZWMj6gBkOAUs8hoQtTST1tBXWQzL0ku9EFqVNXwkAeKC5FDuKVaWq8kLg==
Message-ID: <1765e57c-ddaa-4e5b-a017-63bed2b0c9cf@bootlin.com>
Date: Mon, 24 Mar 2025 16:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 23/59] dyndbg: move .mod_name from/to structs
 ddebug_table/_ddebug_info
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-24-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250320185238.447458-24-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsr
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



Le 20/03/2025 à 19:52, Jim Cromie a écrit :
> struct _ddebug_info already has almost all dyndbg's info for a module,
> so finish the encapsulation.  This puts the datum closer to where its
> needed, improving the chance that we can obsolete the _ddebug.modame
> field with a desc_modname(dp) accessor fn.
> 
> In static ddebug_add_module(&_ddebug_info_cursor..), force the
> cursor-model by dropping the modname arg, and setting it explicitly
> into the cursor before the 3 calls to it.
> 
> struct ddebug_table only uses .mod_name when applying >control
> changes, and it has a _ddebug_info member anyway, so it keeps access
> to the field, just with a different offset.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   include/linux/dynamic_debug.h |  1 +
>   lib/dynamic_debug.c           | 41 ++++++++++++++++++-----------------
>   2 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index 03a83a83b621..8043966a0fd6 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -198,6 +198,7 @@ struct _ddebug_class_users {
>   } __packed;
>   
>   struct _ddebug_info {
> +	const char *mod_name;
>   	struct _ddebug_descs descs;
>   	struct _ddebug_class_maps maps;
>   	struct _ddebug_class_users users;
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 3c9fb8324ad6..cd3eec5bb81c 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -49,7 +49,6 @@ extern struct _ddebug_class_user __stop___dyndbg_class_users[];
>   
>   struct ddebug_table {
>   	struct list_head link;
> -	const char *mod_name;
>   	struct _ddebug_info info;
>   };
>   
> @@ -166,7 +165,7 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   #define vpr_dt_info(dt_p, msg_p, ...) ({				\
>   	struct ddebug_table const *_dt = dt_p;				\
>   	v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
> -		  _dt->mod_name, _dt->info.descs.len, _dt->info.maps.len, \
> +		  _dt->info.mod_name, _dt->info.descs.len, _dt->info.maps.len, \
>   		  _dt->info.users.len);					\
>   	})
>   
> @@ -215,7 +214,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
>   
>   		/* match against the module name */
>   		if (query->module &&
> -		    !match_wildcard(query->module, dt->mod_name))
> +		    !match_wildcard(query->module, dt->info.mod_name))
>   			continue;
>   
>   		if (query->class_string) {
> @@ -283,7 +282,7 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
>   #endif
>   			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
>   				  trim_prefix(dp->filename), dp->lineno,
> -				  dt->mod_name, dp->function,
> +				  dt->info.mod_name, dp->function,
>   				  ddebug_describe_flags(dp->flags, &fbuf),
>   				  ddebug_describe_flags(newflags, &nbuf));
>   			dp->flags = newflags;
> @@ -1123,7 +1122,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>   
>   	seq_printf(m, "%s:%u [%s]%s =%s \"",
>   		   trim_prefix(dp->filename), dp->lineno,
> -		   iter->table->mod_name, dp->function,
> +		   iter->table->info.mod_name, dp->function,
>   		   ddebug_describe_flags(dp->flags, &flags));
>   	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
>   	seq_putc(m, '"');
> @@ -1283,7 +1282,7 @@ static void ddebug_apply_class_users(const struct ddebug_table *dt)
>   #define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({	\
>   	int nc = 0;							\
>   	for_subvec(_i, _sp, _box, _vec) {				\
> -		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
> +		if (!strcmp((_sp)->mod_name, (_dst)->info.mod_name)) {	\
>   			if (!nc++)					\
>   				(_dst)->info._vec.start = (_sp);	\
>   		} else {						\
> @@ -1314,7 +1313,7 @@ ddebug_class_range_overlap(struct _ddebug_class_map *cm,
>    * Allocate a new ddebug_table for the given module
>    * and add it to the global list.
>    */
> -static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
> +static int ddebug_add_module(struct _ddebug_info *di)
>   {
>   	struct ddebug_table *dt;
>   	struct _ddebug_class_map *cm;
> @@ -1325,20 +1324,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	if (!di->descs.len)
>   		return 0;
>   
> -	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
> +	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
>   
>   	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
>   	if (dt == NULL) {
> -		pr_err("error adding module: %s\n", modname);
> +		pr_err("error adding module: %s\n", di->mod_name);
>   		return -ENOMEM;
>   	}
>   	/*
> -	 * For built-in modules, name lives in .rodata and is
> -	 * immortal. For loaded modules, name points at the name[]
> -	 * member of struct module, which lives at least as long as
> -	 * this struct ddebug_table.
> +	 * For built-in modules, name (as supplied in di by its
> +	 * callers) lives in .rodata and is immortal. For loaded
> +	 * modules, name points at the name[] member of struct module,
> +	 * which lives at least as long as this struct ddebug_table.
>   	 */
> -	dt->mod_name = modname;
>   	dt->info = *di;
>   
>   	INIT_LIST_HEAD(&dt->link);
> @@ -1368,10 +1366,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	if (dt->info.users.len)
>   		ddebug_apply_class_users(dt);
>   
> -	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
> +	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
>   	return 0;
>   cleanup:
> -	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", modname);
> +	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
>   	kfree(dt);
>   	return -EINVAL;
>   
> @@ -1436,7 +1434,7 @@ static int ddebug_remove_module(const char *mod_name)
>   
>   	mutex_lock(&ddebug_lock);
>   	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
> -		if (dt->mod_name == mod_name) {
> +		if (dt->info.mod_name == mod_name) {
>   			ddebug_table_free(dt);
>   			ret = 0;
>   			break;
> @@ -1456,7 +1454,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
>   
>   	switch (val) {
>   	case MODULE_STATE_COMING:
> -		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
> +		mod->dyndbg_info.mod_name = mod->name;
> +		ret = ddebug_add_module(&mod->dyndbg_info);
>   		if (ret)
>   			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
>   		break;
> @@ -1556,7 +1555,8 @@ static int __init dynamic_debug_init(void)
>   			mod_ct++;
>   			di.descs.len = mod_sites;
>   			di.descs.start = iter_mod_start;
> -			ret = ddebug_add_module(&di, modname);
> +			di.mod_name = modname;
> +			ret = ddebug_add_module(&di);
>   			if (ret)
>   				goto out_err;
>   
> @@ -1567,7 +1567,8 @@ static int __init dynamic_debug_init(void)
>   	}
>   	di.descs.len = mod_sites;
>   	di.descs.start = iter_mod_start;
> -	ret = ddebug_add_module(&di, modname);
> +	di.mod_name = modname;
> +	ret = ddebug_add_module(&di);
>   	if (ret)
>   		goto out_err;
>   

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


