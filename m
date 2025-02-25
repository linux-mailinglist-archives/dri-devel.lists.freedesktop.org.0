Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C71A44264
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EC410E6D8;
	Tue, 25 Feb 2025 14:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZkpO8h4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D89989823;
 Tue, 25 Feb 2025 14:19:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5519944284;
 Tue, 25 Feb 2025 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740493183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDkkqmZ4caBeAmp+5yCWsPyGqZBN2ya4J9NVnxHeg7I=;
 b=ZkpO8h4nKh+tceth9zmiAW5x76eNswrkbbuKc7F8/2dmEZ0xVyboPP28NKxrbnCxCOjUnU
 BJhv2PmNypYOlGiVlMOxybFuAyMrGbsS7zdZGVXKyHlpNwhDQptQbpMmFvdvDpQABoQk6B
 DLPdHjO5JVM/OIqWTVPZWY/1Aue1455/OFRqQYOnTwx1GvqWS56rniSK7K68v2uRkHnrWz
 o0d+IODGe3OGPyTreCXk7c3Yw8UbfaLHTv7j6stRdpIcvUaBJw7xIft/UlkB33x54oGhtv
 DXA5eQIJXEMSCD0XQLFhS4CTf+0DmKPm+v8zmnNxujBTohhj87SKlObW/P0pUQ==
Date: Tue, 25 Feb 2025 15:19:41 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 19/63] dyndbg: make proper substructs in _ddebug_info
Message-ID: <74f6ee77-523c-4943-9b3f-a9bcab78faa7@bootlin.com>
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
 <20250125064619.8305-20-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-20-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
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
> struct _ddebug_info's jobs is to enapsulate the __sections of dyndbg
> data from the linker.  The data started as a single pair of fields:
> descs - ref'g an array of descriptors & num_descs - counting the
> "pertinent" descriptors.  Then classes & num_classes were added, and
> _ddebug_info was invented to contain the 4 fields.
> 
> When class_users & num_class_users were added (earlier in this
> series), the easy path was to replicate functions and adapt them to
> work on ddebug_class_users, instead of class_maps.  This worked, but
> made repetitive boilerplate code, leading to (other commits with)
> macros walking num_##{classes,class_users} to capture the repetition.
> 
> To fix it better, create structs to contain start,len for vectors of
> all 3 objects: classmaps, class_users, and pr_debug descriptors, and
> adjust field-refs accordingly.
> 
> Also recompose struct ddebug_table to contain a _ddebug_info (rather
> than repeat the contents, as before), and adjust all array-walks to
> use the newly contained info.
> 
> This allows ridding the class* macros of the num##<T> paste-up, and
> should enable further cleanups.
> 
> NB: The __packed attribute on _ddebug_info and the 3 contained structs
> closes the holes otherwise created by the structification (which was
> the excuse for not doing it originally).
> 
> TBD: see if this can precede other patches, to reduce churn

Hi Jim,

This could be amazing if possible!

> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   include/linux/dynamic_debug.h | 29 ++++++++---
>   kernel/module/main.c          | 18 +++----
>   lib/dynamic_debug.c           | 93 +++++++++++++++++------------------
>   3 files changed, 74 insertions(+), 66 deletions(-)
> 
> diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
> index 2b0c943af330..48d76a273f68 100644
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -173,15 +173,28 @@ struct ddebug_class_user {
>   		.map = &(_var),						\
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
> +struct dd_class_maps {
> +	struct ddebug_class_map *start;
> +	int len;
> +} __packed;
> +struct dd_class_users {
> +	struct ddebug_class_user *start;
> +	int len;
> +} __packed;
>   struct _ddebug_info {
> -	struct _ddebug *descs;
> -	struct ddebug_class_map *classes;
> -	struct ddebug_class_user *class_users;
> -	unsigned int num_descs;
> -	unsigned int num_classes;
> -	unsigned int num_class_users;
> -};
> +	struct _ddebug_descs descs;
> +	struct dd_class_maps maps;
> +	struct dd_class_users users;
> +} __packed;
>   
>   struct ddebug_class_param {
>   	union {
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index c394a0c6e8c6..858882a1eacd 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2540,15 +2540,15 @@ static int find_module_sections(struct module *mod, struct load_info *info)
>   		pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
>   
>   #ifdef CONFIG_DYNAMIC_DEBUG_CORE
> -	mod->dyndbg_info.descs = section_objs(info, "__dyndbg",
> -					      sizeof(*mod->dyndbg_info.descs),
> -					      &mod->dyndbg_info.num_descs);
> -	mod->dyndbg_info.classes = section_objs(info, "__dyndbg_classes",
> -						sizeof(*mod->dyndbg_info.classes),
> -						&mod->dyndbg_info.num_classes);
> -	mod->dyndbg_info.class_users = section_objs(info, "__dyndbg_class_users",
> -						    sizeof(*mod->dyndbg_info.class_users),
> -						   &mod->dyndbg_info.num_class_users);
> +	mod->dyndbg_info.descs.start = section_objs(info, "__dyndbg",
> +						    sizeof(*mod->dyndbg_info.descs.start),
> +						    &mod->dyndbg_info.descs.len);
> +	mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_classes",
> +						   sizeof(*mod->dyndbg_info.maps.start),
> +						   &mod->dyndbg_info.maps.len);
> +	mod->dyndbg_info.users.start = section_objs(info, "__dyndbg_class_users",
> +						    sizeof(*mod->dyndbg_info.users.start),
> +						    &mod->dyndbg_info.users.len);
>   #endif
>   
>   	return 0;
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 08b6e4e7489f..067db504dd1d 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -49,10 +49,7 @@ extern struct ddebug_class_user __stop___dyndbg_class_users[];
>   struct ddebug_table {
>   	struct list_head link;
>   	const char *mod_name;
> -	struct _ddebug *ddebugs;
> -	struct ddebug_class_map *classes;
> -	struct ddebug_class_user *class_users;
> -	unsigned int num_ddebugs, num_classes, num_class_users;
> +	struct _ddebug_info info;
>   };
>   
>   struct ddebug_query {
> @@ -154,8 +151,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>   #define vpr_dt_info(dt_p, msg_p, ...) ({				\
>   	struct ddebug_table const *_dt = dt_p;				\
>   	v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
> -		  _dt->mod_name, _dt->num_ddebugs, _dt->num_classes,	\
> -		  _dt->num_class_users);				\
> +		  _dt->mod_name, _dt->info.descs.len, _dt->info.maps.len, \
> +		  _dt->info.users.len);					\
>   	})
>   
>   /*
> @@ -168,8 +165,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>    * @_vec: name of a sub-struct member in _box, with array-ref and length
>    */
>   #define for_subvec(_i, _sp, _box, _vec)				       \
> -	for ((_i) = 0, (_sp) = (_box)->_vec;			       \
> -	     (_i) < (_box)->num_##_vec;				       \
> +	for ((_i) = 0, (_sp) = (_box)->_vec.start;		       \
> +	     (_i) < (_box)->_vec.len;				       \
>   	     (_i)++, (_sp)++)
>   
>   static int ddebug_find_valid_class(struct ddebug_table const *dt, const char *class_string)
> @@ -178,14 +175,14 @@ static int ddebug_find_valid_class(struct ddebug_table const *dt, const char *cl
>   	struct ddebug_class_user *cli;
>   	int i, idx;
>   
> -	for_subvec(i, map, dt, classes) {
> +	for_subvec(i, map, &dt->info, maps) {
>   		idx = match_string(map->class_names, map->length, class_string);
>   		if (idx >= 0) {
>   			vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
>   			return idx + map->base;
>   		}
>   	}
> -	for_subvec(i, cli, dt, class_users) {
> +	for_subvec(i, cli, &dt->info, users) {
>   		idx = match_string(cli->map->class_names, cli->map->length, class_string);
>   		if (idx >= 0) {
>   			vpr_dt_info(dt, "class-ref: %s -> %s.%s ",
> @@ -229,8 +226,8 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
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
> @@ -990,8 +987,8 @@ static struct _ddebug *ddebug_iter_first(struct ddebug_iter *iter)
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
> @@ -1012,10 +1009,10 @@ static struct _ddebug *ddebug_iter_next(struct ddebug_iter *iter)
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
> @@ -1064,15 +1061,15 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>   
>   static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
>   {
> -	struct ddebug_class_map *map = dt->classes;
> -	struct ddebug_class_user *cli = dt->class_users;
> +	struct ddebug_class_map *map;
> +	struct ddebug_class_user *cli;
>   	int i;
>   
> -	for (i = 0; i < dt->num_classes; i++, map++)
> +	for_subvec(i, map, &dt->info, maps)
>   		if (class_in_range(dp->class_id, map))
>   			return map->class_names[dp->class_id - map->base];
>   
> -	for (i = 0; i < dt->num_class_users; i++, cli++)
> +	for_subvec(i, cli, &dt->info, users)
>   		if (class_in_range(dp->class_id, cli->map))
>   			return cli->map->class_names[dp->class_id - cli->map->base];
>   
> @@ -1203,8 +1200,7 @@ static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *m
>   
>   	if (cm->mod) {
>   		vpr_cm_info(cm, "loaded classmap: %s", modnm);
> -		/* ifdef protects the cm->mod->kp deref */
> -		for_subvec(i, kp, cm->mod, kp)
> +		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
>   			ddebug_match_apply_kparam(kp, cm, modnm);
>   	}
>   #endif
> @@ -1226,20 +1222,20 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt,
>   	struct ddebug_class_map *cm;
>   	int i, nc = 0;
>   
> -	for_subvec(i, cm, di, classes) {
> +	for_subvec(i, cm, di, maps) {
>   		if (!strcmp(cm->mod_name, dt->mod_name)) {
>   			vpr_cm_info(cm, "classes[%d]:", i);
>   			if (!nc++)
> -				dt->classes = cm;
> +				dt->info.maps.start = cm;
>   		}
>   	}
>   	if (!nc)
>   		return;
>   
>   	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
> -	dt->num_classes = nc;
> +	dt->info.maps.len = nc;
>   
> -	for_subvec(i, cm, dt, classes)
> +	for_subvec(i, cm, &dt->info, maps)
>   		ddebug_apply_params(cm, cm->mod_name);
>   }
>   
> @@ -1259,23 +1255,23 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
>   	 * module's refs, save to dt.  For loadables, this is the
>   	 * whole array.
>   	 */
> -	for_subvec(i, cli, di, class_users) {
> +	for_subvec(i, cli, di, users) {
>   		if (WARN_ON_ONCE(!cli || !cli->map || !cli->mod_name))
>   			continue;
>   		if (!strcmp(cli->mod_name, dt->mod_name)) {
>   			vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i,
>   				    cli->mod_name, cli->map->mod_name);
>   			if (!nc++)
> -				dt->class_users = cli;
> +				dt->info.users.start = cli;
>   		}
>   	}
>   	if (!nc)
>   		return;
>   
> -	dt->num_class_users = nc;
> +	dt->info.users.len = nc;
>   
>   	/* now iterate dt */
> -	for_subvec(i, cli, di, class_users)
> +	for_subvec(i, cli, di, users)
>   		ddebug_apply_params(cli->map, cli->mod_name);
>   
>   	vpr_dt_info(dt, "attach-client-module: ");
> @@ -1291,10 +1287,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	struct _ddebug *iter;
>   	int i, class_ct = 0;
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
> @@ -1308,8 +1304,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   	 * this struct ddebug_table.
>   	 */
>   	dt->mod_name = modname;
> -	dt->ddebugs = di->descs;
> -	dt->num_ddebugs = di->num_descs;
> +	dt->info.descs = di->descs;
>   
>   	INIT_LIST_HEAD(&dt->link);
>   
> @@ -1317,17 +1312,17 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
>   		if (iter->class_id != _DPRINTK_CLASS_DFLT)
>   			class_ct++;
>   
> -	if (class_ct && di->num_classes)
> +	if (class_ct && di->maps.len)
>   		ddebug_attach_module_classes(dt, di);
>   
>   	mutex_lock(&ddebug_lock);
>   	list_add_tail(&dt->link, &ddebug_tables);
>   	mutex_unlock(&ddebug_lock);
>   
> -	if (class_ct && di->num_class_users)
> +	if (class_ct && di->users.len)
>   		ddebug_attach_user_module_classes(dt, di);
>   
> -	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
> +	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
>   	return 0;
>   }
>   
> @@ -1474,12 +1469,12 @@ static int __init dynamic_debug_init(void)
>   	char *cmdline;
>   
>   	struct _ddebug_info di = {
> -		.descs = __start___dyndbg,
> -		.classes = __start___dyndbg_classes,
> -		.class_users = __start___dyndbg_class_users,
> -		.num_descs = __stop___dyndbg - __start___dyndbg,
> -		.num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
> -		.num_class_users = __stop___dyndbg_class_users - __start___dyndbg_class_users,
> +		.descs.start = __start___dyndbg,
> +		.maps.start = __start___dyndbg_classes,
> +		.users.start = __start___dyndbg_class_users,
> +		.descs.len = __stop___dyndbg - __start___dyndbg,
> +		.maps.len = __stop___dyndbg_classes - __start___dyndbg_classes,
> +		.users.len = __stop___dyndbg_class_users - __start___dyndbg_class_users,
>   	};
>   
>   #ifdef CONFIG_MODULES
> @@ -1508,8 +1503,8 @@ static int __init dynamic_debug_init(void)
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
> @@ -1519,8 +1514,8 @@ static int __init dynamic_debug_init(void)
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
> @@ -1530,8 +1525,8 @@ static int __init dynamic_debug_init(void)
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

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

