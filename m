Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489E8AE080
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 11:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BA4113231;
	Tue, 23 Apr 2024 09:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxDMykFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FC6113235;
 Tue, 23 Apr 2024 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862931; x=1745398931;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=OQVt3hcTjTX2NgchVm2Cvs/XGEosPkQ/grRT27jU8LA=;
 b=HxDMykFYbEObQ3Tu6AtgcelZfJ6xSF3yNWxhXuRvk0wZWI/oBSFsmUZ2
 DImQkdcHErx2NiJpeerM+kOJJu+7i2yivGp7tTRfZipf0dsDjRbp/TqBU
 3fFKfkKufTfMFrw72Jv1DmIxa6mZiHXezF0EI65Oww7w6XBvHPO32cH4O
 93nv2pV3qSPkcq8E2Tu3nG3gj6hZw/7Cljo4Wi3T4FDnDhA6Td5h/vw0A
 bjd03nBeb9JsBR7dwhWYBnRt+/uGeJ2ZddkNi86BIKBrx1vIhw9QpHmBk
 ir4ngpl9BnfsGE6lk59bz0ME+7zXhgsiPvfuuHMnJXdNg6ZbImvYcK3vr g==;
X-CSE-ConnectionGUID: Y+6+tk+VQKGv4r+zFJY5Kw==
X-CSE-MsgGUID: bmHPnYivTqazUHyVOIOadQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9356613"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="9356613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:02:10 -0700
X-CSE-ConnectionGUID: HASqCCUyRxyPvoFAp2+L5w==
X-CSE-MsgGUID: ck2anQP/T9WbIne/L9ixVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208,217";a="28975246"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.3])
 ([10.94.248.3])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:02:09 -0700
Content-Type: multipart/alternative;
 boundary="------------TmCuuGM3wDDMT3GFPpiogJDz"
Message-ID: <3e69af0e-11e5-4bfc-8400-8ebbec7d34ef@linux.intel.com>
Date: Tue, 23 Apr 2024 11:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Refactor uabi engine class/instance list
 creation
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240416224953.385726-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240416224953.385726-1-andi.shyti@linux.intel.com>
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

This is a multi-part message in MIME format.
--------------TmCuuGM3wDDMT3GFPpiogJDz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andi,

On 4/17/2024 12:49 AM, Andi Shyti wrote:
> For the upcoming changes we need a cleaner way to build the list
> of uabi engines.
>
> Suggested-by: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti<andi.shyti@linux.intel.com>
> ---
> Hi,
>
> just sending this patch to unburden the coming series from this
> single patch inherited from a previously sent series.
>
> Andi
>
>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 29 ++++++++++++---------
>   1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 833987015b8b..11cc06c0c785 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -203,7 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
>   
>   void intel_engines_driver_register(struct drm_i915_private *i915)
>   {
> -	u16 name_instance, other_instance = 0;
> +	u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 2] = { };
+2 is confusing here. I think we need a better macro.
>   	struct legacy_ring ring = {};
>   	struct list_head *it, *next;
>   	struct rb_node **p, *prev;
> @@ -214,6 +214,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>   	prev = NULL;
>   	p = &i915->uabi_engines.rb_node;
>   	list_for_each_safe(it, next, &engines) {
> +		u16 uabi_class;
> +
>   		struct intel_engine_cs *engine =
>   			container_of(it, typeof(*engine), uabi_list);
>   
> @@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>   
>   		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
>   		engine->uabi_class = uabi_classes[engine->class];
> -		if (engine->uabi_class == I915_NO_UABI_CLASS) {
> -			name_instance = other_instance++;
> -		} else {
> -			GEM_BUG_ON(engine->uabi_class >=
> -				   ARRAY_SIZE(i915->engine_uabi_class_count));
> -			name_instance =
> -				i915->engine_uabi_class_count[engine->uabi_class]++;
> -		}
> -		engine->uabi_instance = name_instance;
> +
> +		if (engine->uabi_class == I915_NO_UABI_CLASS)
> +			uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
> +		else
> +			uabi_class = engine->uabi_class;
> +
> +		GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));
> +		engine->uabi_instance = class_instance[uabi_class]++;
>   
>   		/*
>   		 * Replace the internal name with the final user and log facing
> @@ -238,11 +239,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>   		 */
>   		engine_rename(engine,
>   			      intel_engine_class_repr(engine->class),
> -			      name_instance);
> +			      engine->uabi_instance);
>   
> -		if (engine->uabi_class == I915_NO_UABI_CLASS)
> +		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
>   			continue;
>   
> +		GEM_BUG_ON(uabi_class >=
> +			   ARRAY_SIZE(i915->engine_uabi_class_count));
> +		i915->engine_uabi_class_count[uabi_class]++;
Shouldn't this be  i915->engine_uabi_class_count[uabi_class] = 
class_instance[uabi_class]; ?

What I see is that this patch mainly adding this class_instance array 
and rest looks the same.
May be it make sense to add other upcoming  patches to better understand 
why we need this patch.

Regards,
Nirmoy

> +
>   		rb_link_node(&engine->uabi_node, prev, p);
>   		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
>   
--------------TmCuuGM3wDDMT3GFPpiogJDz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Andi,<br>
    </p>
    <div class="moz-cite-prefix">On 4/17/2024 12:49 AM, Andi Shyti
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240416224953.385726-1-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">For the upcoming changes we need a cleaner way to build the list
of uabi engines.

Suggested-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Signed-off-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
---
Hi,

just sending this patch to unburden the coming series from this
single patch inherited from a previously sent series.

Andi

 drivers/gpu/drm/i915/gt/intel_engine_user.c | 29 ++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..11cc06c0c785 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -203,7 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
 
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
-	u16 name_instance, other_instance = 0;
+	u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 2] = { };</pre>
    </blockquote>
    +2 is confusing here. I think we need a better macro.<br>
    <blockquote type="cite"
      cite="mid:20240416224953.385726-1-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 	struct legacy_ring ring = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
@@ -214,6 +214,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 	prev = NULL;
 	p = &amp;i915-&gt;uabi_engines.rb_node;
 	list_for_each_safe(it, next, &amp;engines) {
+		u16 uabi_class;
+
 		struct intel_engine_cs *engine =
 			container_of(it, typeof(*engine), uabi_list);
 
@@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 
 		GEM_BUG_ON(engine-&gt;class &gt;= ARRAY_SIZE(uabi_classes));
 		engine-&gt;uabi_class = uabi_classes[engine-&gt;class];
-		if (engine-&gt;uabi_class == I915_NO_UABI_CLASS) {
-			name_instance = other_instance++;
-		} else {
-			GEM_BUG_ON(engine-&gt;uabi_class &gt;=
-				   ARRAY_SIZE(i915-&gt;engine_uabi_class_count));
-			name_instance =
-				i915-&gt;engine_uabi_class_count[engine-&gt;uabi_class]++;
-		}
-		engine-&gt;uabi_instance = name_instance;
+
+		if (engine-&gt;uabi_class == I915_NO_UABI_CLASS)
+			uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
+		else
+			uabi_class = engine-&gt;uabi_class;
+
+		GEM_BUG_ON(uabi_class &gt;= ARRAY_SIZE(class_instance));
+		engine-&gt;uabi_instance = class_instance[uabi_class]++;
 
 		/*
 		 * Replace the internal name with the final user and log facing
@@ -238,11 +239,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		 */
 		engine_rename(engine,
 			      intel_engine_class_repr(engine-&gt;class),
-			      name_instance);
+			      engine-&gt;uabi_instance);
 
-		if (engine-&gt;uabi_class == I915_NO_UABI_CLASS)
+		if (uabi_class &gt; I915_LAST_UABI_ENGINE_CLASS)
 			continue;
 
+		GEM_BUG_ON(uabi_class &gt;=
+			   ARRAY_SIZE(i915-&gt;engine_uabi_class_count));
+		i915-&gt;engine_uabi_class_count[uabi_class]++;</pre>
    </blockquote>
    Shouldn't this be  i915-&gt;engine_uabi_class_count[uabi_class] = 
    class_instance[uabi_class]; ?<br>
    <br>
    What I see is that this patch mainly adding this class_instance
    array and rest looks the same.<br>
    May be it make sense to add other upcoming  patches to better
    understand why we need this patch.<br style="white-space: pre-wrap;">
    <pre class="moz-quote-pre" wrap="">
Regards,
Nirmoy 
</pre>
    <blockquote type="cite"
      cite="mid:20240416224953.385726-1-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
+
 		rb_link_node(&amp;engine-&gt;uabi_node, prev, p);
 		rb_insert_color(&amp;engine-&gt;uabi_node, &amp;i915-&gt;uabi_engines);
 
</pre>
    </blockquote>
  </body>
</html>

--------------TmCuuGM3wDDMT3GFPpiogJDz--
