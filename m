Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA408A6DE62
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7E110E472;
	Mon, 24 Mar 2025 15:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nha9iTbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7762510E486;
 Mon, 24 Mar 2025 15:23:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3036420577;
 Mon, 24 Mar 2025 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742829802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JwuW83OwbehfUQ0b6+agTugM6hRqyHyoBrJtyNV0PR8=;
 b=nha9iTbPOTGXk7vnAYcvtxfeysInYpzSHd4B2KH1ACm6z9TOgwI+3rBp6CvrNjyJYgNrsq
 aJXVrzyol+B9LcvkXL++meTsgHNSZf3X1mrzEC0HF4ut36datmQ4bDs0KtgKv9hzIFx98A
 gHVVgsq9XpvJNI5QDIwcmoERRLUQdoQ2qzeTT1/jrDvQa35yCczV8FGj1V8NYak8WtQUMD
 T/kJvGU3jqSjPP2ijXaBUCjqqUOv3A0AxY9rZMLLxX54WCZJGOC/1L98qO/yYYxzs0FClQ
 9wU/FS1je6gjVon727tjoY9VZy6lO5tUs8z9WVBT0uSFtDo5TamKY74dTS6Cyg==
Message-ID: <2dffcb05-1c31-4704-9081-91107b3ce165@bootlin.com>
Date: Mon, 24 Mar 2025 16:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 33/59] docs/dyndbg: add classmap info to howto (TBD)
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 linux-doc@vger.kernel.org
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-34-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250320185238.447458-34-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedtuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsr
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
> Describe the 3 API macros providing dynamic_debug's classmaps
> 
> DYNDBG_CLASSMAP_DEFINE - create & export a classmap
> DYNDBG_CLASSMAP_USE    - refer to exported map
> DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
> DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug
> 
> TBD: some of this might be over-specification, or just over-talked.
> 
> NB: The _DEFINE & _USE model makes the user dependent on the definer,
> just like EXPORT_SYMBOL(__drm_debug) already does.
> 
> cc: linux-doc@vger.kernel.org
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v5 adjustments per Randy Dunlap
> v7 checkpatch fixes
> v8 more
> v9 rewords
> ---
>   .../admin-guide/dynamic-debug-howto.rst       | 80 ++++++++++++++++++-
>   1 file changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index d2928884c92b..9422dc4917d0 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -243,7 +243,6 @@ the ``p`` flag has meaning, other flags are ignored.
>   Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
>   To clear all flags at once, use ``=_`` or ``-fslmpt``.
>   
> -
>   Debug messages during Boot Process
>   ==================================
>   
> @@ -393,3 +392,82 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>   For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
>   its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>   in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug classmaps
> +=======================
> +
> +The "class" keyword selects prdbgs based on author supplied,
> +domain-oriented names.  This complements the nested-scope keywords:
> +module, file, function, line.
> +
> +The main difference from the others: class'd prdbgs must be named to
> +be changed.  This protects them from generic overwrite:
> +
> +  # IOW this cannot undo any DRM.debug settings
> +  :#> ddcmd -p

Patch 30/59 just dropped this behavior no?

> +So each class must be enabled individually (no wildcards):
> +
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +Or the legacy/normal (more convenient) way:
> +
> +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> +
> +Dynamic Debug Classmap API
> +==========================
> +
> +DRM.debug is built upon:
> +  ~23 macros, all passing a DRM_UT_* constant as arg-1.
> +  ~5000 calls to them, across drivers/gpu/drm/*
> +  bits in /sys/module/drm/parameters/debug control all DRM_UT_* together
> +
> +The const short ints are good for optimizing compilers; a classmaps
> +design goal was to keep that.  So basically .classid === category.
> +
> +And since prdbgs are cataloged with just a DRM_UT_* to identify them,
> +the "class" keyword maps known classnames to those reserved IDs, and
> +by explicitly requiring "class FOO" in queries, we protect FOO class'd
> +debugs from overwrite by generic queries.
> +
> +Its expected that other classmap users will also provide debug-macros
> +using an enum-defined categorization scheme like DRM's, and dyndbg can
> +be adapted under them similarly.
> +
> +DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
> +classnames onto class-ids consecutively, starting at _base, it also
> +maps the names onto CLASSMAP_PARAM bits 0..N.
> +
> +DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
> +var _DEFINEd elsewhere (and exported).
> +
> +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> +dyndbg to update those classes.  "class FOO" queries are validated
> +against the classes, this finds the classid to alter; classes are not
> +directly selectable by their classid.
> +
> +There are 2 types of classmaps:
> +
> + DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
> + DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
> +
> +DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
> +refers to a DEFINEd classmap, and associates it to the param's
> +data-store.  This state is then applied to DEFINEr and USEr modules
> +when they're modprobed.
> +
> +The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
> +amongst the contained classnames; all classes are independent in the
> +control parser itself; there is no implied meaning in names like "V4".
> +
> +Modules or module-groups (drm & drivers) can define multiple
> +classmaps, as long as they share the limited 0..62 per-module-group
> +_class_id range, without overlap.

Maybe clarify that a driver using _USE macro should take care that he 
only use distinct non-overlaping classmaps?

> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones.  This won't be reflected in the PARAM readback value,
> +but the class'd pr_debug callsites can be forced off by toggling the
> +classmap-kparam all-on then all-off.

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


