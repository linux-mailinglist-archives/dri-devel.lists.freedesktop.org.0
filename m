Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFDB491C2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 16:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBF210E545;
	Mon,  8 Sep 2025 14:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rZWo/xG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E2310E53E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 14:38:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6634A4E40BFA;
 Mon,  8 Sep 2025 14:38:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 392C96061A;
 Mon,  8 Sep 2025 14:38:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5CAE5102F270F; 
 Mon,  8 Sep 2025 16:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757342314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=3+kRf5MNNIFuKMtF8DkuLBor42xHpAuXkRT1mWr6b70=;
 b=rZWo/xG7tjPxZfgwuZ77qZWGPSIzH1ri8Gu+k61WptQZAk+tGtEfw3a7Lrsp2qHX38sxgT
 k0nRLvzO87UJ3/IxKiEIzRSBpVyJlLciF74aDMTjJSzwRYWw1q3d0nsVJLuNBgv5Y9emQi
 BBB+K0uW3h+lgZsbj9WqCi0c2lgwo2FnHd3K+ymd8+S656hww87hm9IyUoTnmxACAlsxI2
 QojWGWLLHxJkY8GyOt7HBf0Y36j1x9p4iGxlzNu3rjSsv56EC3t5lj0le+59JnIVoF3F7e
 kzs3ukLc5MMsMY72T6r4LOU38HVbXURYoqWphwZn2qrvIfS73QrGXuQ5CcaX6g==
Message-ID: <ea069c8f-b724-409c-9dc6-345b3f9d6d85@bootlin.com>
Date: Mon, 8 Sep 2025 16:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/58] docs/dyndbg: add classmap info to howto
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
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, linux-doc@vger.kernel.org
References: <20250803035816.603405-1-jim.cromie@gmail.com>
 <20250803035816.603405-30-jim.cromie@gmail.com>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250803035816.603405-30-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> v3- rework protection around PARAM
> 
> v0.5 adjustments per Randy Dunlap
> v0.7 checkpatch fixes
> v0.8 more
> v0.9 rewords
> 
> fixup-howto
> ---
>   .../admin-guide/dynamic-debug-howto.rst       | 137 ++++++++++++++++--
>   1 file changed, 126 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index 1ceadf4f28f9f..556e00299ed35 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -146,7 +146,9 @@ keywords are:::
>     "1-30" is valid range but "1 - 30" is not.
>   
>   
> -The meanings of each keyword are:
> +Keywords:::
> +
> +The meanings of each keyword are::
>   
>   func
>       The given string is compared against the function name
> @@ -194,16 +196,6 @@ format
>   	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
>   	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
>   
> -class
> -    The given class_name is validated against each module, which may
> -    have declared a list of known class_names.  If the class_name is
> -    found for a module, callsite & class matching and adjustment
> -    proceeds.  Examples::
> -
> -	class DRM_UT_KMS	# a DRM.debug category
> -	class JUNK		# silent non-match
> -	// class TLD_*		# NOTICE: no wildcard in class names
> -
>   line
>       The given line number or range of line numbers is compared
>       against the line number of each ``pr_debug()`` callsite.  A single
> @@ -218,6 +210,24 @@ line
>   	line -1605          // the 1605 lines from line 1 to line 1605
>   	line 1600-          // all lines from line 1600 to the end of the file
>   
> +class
> +
> +    The given class_name is validated against each module, which may
> +    have declared a list of class_names it accepts.  If the class_name
> +    accepted by a module, callsite & class matching and adjustment
> +    proceeds.  Examples::
> +
> +	class DRM_UT_KMS	# a DRM.debug category
> +	class JUNK		# silent non-match
> +	// class TLD_*		# NOTICE: no wildcard in class names
> +
> +.. note ::
> +
> +    Unlike other keywords, classes are "name-to-change", not
> +    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
> +
> +Flags:::
> +
>   The flags specification comprises a change operation followed
>   by one or more flag characters.  The change operation is one
>   of the characters::
> @@ -394,3 +404,108 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
>   For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
>   its ``prefix_str`` argument, if it is constant string; or ``hexdump``
>   in case ``prefix_str`` is built dynamically.
> +
> +Dynamic Debug Classmaps
> +=======================
> +
> +The "class" keyword selects prdbgs based on author supplied,
> +domain-oriented names.  This complements the nested-scope keywords:
> +module, file, function, line.
> +
> +The main difference from the others: classes must be named to be
> +changed.  This protects them from generic overwrite:
> +
> +  # IOW this cannot undo any DRM.debug settings
> +  :#> ddcmd -p
> +
> +This protection is needed; /sys/module/drm/parameters/debug is ABI.
> +DRM.debug is authoritative when dyndbg is not used, dyndbg's PARAM
> +cannot undermine that guarantee just because its optional for DRM to
> +use it.
> +
> +  :#> echo 0x1ff > /sys/module/drm/parameters/debug
> +
> +So each class must be enabled individually (no wildcards):
> +
> +  :#> ddcmd class DRM_UT_CORE +p
> +  :#> ddcmd class DRM_UT_KMS +p
> +  # or more selectively
> +  :#> ddcmd class DRM_UT_CORE module drm +p
> +
> +That makes direct >control wordy and annoying, but it is a secondary
> +interface; it is not intended to replace the ABI, just slide in
> +underneath and reimplement it.
> +
> +However, since the sysfs/kparam is the ABI, if a classmap DEFINEr
> +doesn't also add a _CLASSMAP_PARAM, there is no ABI, and no protection
> +is needed.  In that case, class'd prdbgs would be enabled/disabled by
> +legacy (class-less) queries, as a convenience, and because there's no
> +need to enforce irrelevant rules.
> +
> +
> +Dynamic Debug Classmap API
> +==========================
> +
> +DRM.debug is built upon:
> +
> +- enum drm_debug_category: DRM_UT_<*> - <T> for short
> +- 23 categorized api macros: drm_dbg_<T>(), DRM_DEBUG_<T>()
> +- 5000 calls to them
> +- all calling to __pr_debug_cls(<T>, ...)
> +
> +Those compile-time const short ints are good for optimizing compilers;
> +a primary classmaps design goal was to keep that property.
> +So basically .class_id === category.
> +
> +Then we use the drm_categories DRM_UT_* enum for both the classnames
> +(stringified enum symbols) and their numeric values.
> +
> +Its expected that future users will also use categorized macros and an
> +enum-defined categorization scheme like DRM's, with dyndbg inserted in
> +similarly.
> +
> +DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
> +classnames (a list of strings) onto class-ids consecutively, starting
> +at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
> +
> +DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
> +var _DEFINEd elsewhere (and exported).
> +
> +Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
> +dyndbg to update those classes.  "class FOO" queries are validated
> +against the classes, this finds the classid to alter; classes are not
> +directly selectable by their classid.
> +
> +NB: It is an inherent API limitation that the following are possible:
> +
> +  // these would be caught in review
> +  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
> +  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
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
> +classmaps, as long as they (all the classmaps) share the limited 0..62
> +per-module-group _class_id range, without overlap.
> +
> +If a module encounters a conflict between 2 classmaps its USEing, we
> +can extend the _USE macro with an offset to allow de-conflicting the
> +respective ranges.  Or they use the DEFINErs macro-api, but with new
> +enum symbols.
> +
> +``#define DEBUG`` will enable all pr_debugs in scope, including any
> +class'd ones.  This won't be reflected in the PARAM readback value,
> +but the class'd pr_debug callsites can be forced off by toggling the
> +classmap-kparam all-on then all-off.

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

