Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B1F872248
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 16:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABEA112B91;
	Tue,  5 Mar 2024 15:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ujx/xdTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935F112B90;
 Tue,  5 Mar 2024 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709650878; x=1741186878;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=zp5pI/4sT5I2oWe6o00iUFVM5Rr8GICuq0e5j3CYf6w=;
 b=Ujx/xdTMTCtrYnqxOJlqTcG8ymZcNsEcpd3gqM4sy14puJS2g6x+n8yx
 II0XzgaXTI40+9gA3v1gjBNcrjqJTs6/jrzVaAV2VU5/QD+n0+iltmd3H
 G89pD9fq+DMFhlD1kwsnRlkyXlAZgsLhS7zZTEmrLUD4LcxOKGECHwpsU
 FmIGvSyZcLpZdN7Aej3cUncvZ+1p2debqi5b3J5PLoxOtF4ltIVvnhTZd
 lF0FlRmGowED1K1PktP0j4+dpj66wJqfGtsyedXx2fpmRu0suOsz9S9Vf
 F+R6I0kP3/b4JPJRJWfIktToqU5/IoakW2AOv5D1u6eLF4C9fTCoTCJyq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7150304"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208,217";a="7150304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 07:01:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208,217";a="9346260"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.164])
 ([10.246.48.164])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 07:00:56 -0800
Content-Type: multipart/alternative;
 boundary="------------6ZkDMTWfhcdp00GyvkrheolQ"
Message-ID: <2674295e-ebc2-4f6a-9311-4c2db351473d@linux.intel.com>
Date: Tue, 5 Mar 2024 16:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/i915: Remove extra multi-gt pm-references
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20240305143747.335367-5-janusz.krzysztofik@linux.intel.com>
 <20240305143747.335367-7-janusz.krzysztofik@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240305143747.335367-7-janusz.krzysztofik@linux.intel.com>
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
--------------6ZkDMTWfhcdp00GyvkrheolQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/5/2024 3:35 PM, Janusz Krzysztofik wrote:
> There was an attempt to fix an issue of illegal attempts to free a still
> active i915 VMA object when parking a GT believed to be idle, reported by
> CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for a Primary GT
> was acquired from i915_gem_do_execbuffer() -- see commit f56fe3e91787
> ("drm/i915: Fix a VMA UAF for multi-gt platform").
>
> However, that fix occurred insufficient -- the issue was still reported by
> CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
> potentially before completion of the request and deactivation of its
> associated VMAs.  Moreover, CI reports indicated that single-GT platforms
> also suffered sporadically from the same race.
>
> Since the issue has now been fixed by a preceding patch "drm/i915/vma: Fix
> UAF on destroy against retire race", drop the no longer useful changes
> introduced by that insufficient fix.
>
> v3: Also drop the no longer used .wakeref_gt0 field from struct
>      i915_execbuffer.
> v2: Avoid the word "revert" in commit message (Rodrigo),
>    - update commit description reusing relevant chunks dropped from the
>      description of the proper fix (Rodrigo).
>
> Signed-off-by: Janusz Krzysztofik<janusz.krzysztofik@linux.intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ------------------
>   1 file changed, 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index d3a771afb083e..3f20fe3811999 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -255,7 +255,6 @@ struct i915_execbuffer {
>   	struct intel_context *context; /* logical state for the request */
>   	struct i915_gem_context *gem_context; /** caller's context */
>   	intel_wakeref_t wakeref;
> -	intel_wakeref_t wakeref_gt0;
>   
>   	/** our requests to build */
>   	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
> @@ -2686,7 +2685,6 @@ static int
>   eb_select_engine(struct i915_execbuffer *eb)
>   {
>   	struct intel_context *ce, *child;
> -	struct intel_gt *gt;
>   	unsigned int idx;
>   	int err;
>   
> @@ -2710,17 +2708,10 @@ eb_select_engine(struct i915_execbuffer *eb)
>   		}
>   	}
>   	eb->num_batches = ce->parallel.number_children + 1;
> -	gt = ce->engine->gt;
>   
>   	for_each_child(ce, child)
>   		intel_context_get(child);
>   	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
> -	/*
> -	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
> -	 * free VMAs while execbuf ioctl is validating VMAs.
> -	 */
> -	if (gt->info.id)
> -		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
>   
>   	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>   		err = intel_context_alloc_state(ce);
> @@ -2759,9 +2750,6 @@ eb_select_engine(struct i915_execbuffer *eb)
>   	return err;
>   
>   err:
> -	if (gt->info.id)
> -		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
> -
>   	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
>   	for_each_child(ce, child)
>   		intel_context_put(child);
> @@ -2775,12 +2763,6 @@ eb_put_engine(struct i915_execbuffer *eb)
>   	struct intel_context *child;
>   
>   	i915_vm_put(eb->context->vm);
> -	/*
> -	 * This works in conjunction with eb_select_engine() to prevent
> -	 * i915_vma_parked() from interfering while execbuf validates vmas.
> -	 */
> -	if (eb->gt->info.id)
> -		intel_gt_pm_put(to_gt(eb->gt->i915), eb->wakeref_gt0);
>   	intel_gt_pm_put(eb->context->engine->gt, eb->wakeref);
>   	for_each_child(eb->context, child)
>   		intel_context_put(child);
--------------6ZkDMTWfhcdp00GyvkrheolQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/5/2024 3:35 PM, Janusz Krzysztofik
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20240305143747.335367-7-janusz.krzysztofik@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">There was an attempt to fix an issue of illegal attempts to free a still
active i915 VMA object when parking a GT believed to be idle, reported by
CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for a Primary GT
was acquired from i915_gem_do_execbuffer() -- see commit f56fe3e91787
("drm/i915: Fix a VMA UAF for multi-gt platform").

However, that fix occurred insufficient -- the issue was still reported by
CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
potentially before completion of the request and deactivation of its
associated VMAs.  Moreover, CI reports indicated that single-GT platforms
also suffered sporadically from the same race.

Since the issue has now been fixed by a preceding patch "drm/i915/vma: Fix
UAF on destroy against retire race", drop the no longer useful changes
introduced by that insufficient fix.

v3: Also drop the no longer used .wakeref_gt0 field from struct
    i915_execbuffer.
v2: Avoid the word "revert" in commit message (Rodrigo),
  - update commit description reusing relevant chunks dropped from the
    description of the proper fix (Rodrigo).

Signed-off-by: Janusz Krzysztofik <a class="moz-txt-link-rfc2396E" href="mailto:janusz.krzysztofik@linux.intel.com">&lt;janusz.krzysztofik@linux.intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">Reviewed-by: Nirmoy Das </span><a
    class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"></span></pre>
    <blockquote type="cite"
cite="mid:20240305143747.335367-7-janusz.krzysztofik@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index d3a771afb083e..3f20fe3811999 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -255,7 +255,6 @@ struct i915_execbuffer {
 	struct intel_context *context; /* logical state for the request */
 	struct i915_gem_context *gem_context; /** caller's context */
 	intel_wakeref_t wakeref;
-	intel_wakeref_t wakeref_gt0;
 
 	/** our requests to build */
 	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
@@ -2686,7 +2685,6 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
-	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2710,17 +2708,10 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb-&gt;num_batches = ce-&gt;parallel.number_children + 1;
-	gt = ce-&gt;engine-&gt;gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
 	eb-&gt;wakeref = intel_gt_pm_get(ce-&gt;engine-&gt;gt);
-	/*
-	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
-	 * free VMAs while execbuf ioctl is validating VMAs.
-	 */
-	if (gt-&gt;info.id)
-		eb-&gt;wakeref_gt0 = intel_gt_pm_get(to_gt(gt-&gt;i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &amp;ce-&gt;flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2759,9 +2750,6 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
-	if (gt-&gt;info.id)
-		intel_gt_pm_put(to_gt(gt-&gt;i915), eb-&gt;wakeref_gt0);
-
 	intel_gt_pm_put(ce-&gt;engine-&gt;gt, eb-&gt;wakeref);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2775,12 +2763,6 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb-&gt;context-&gt;vm);
-	/*
-	 * This works in conjunction with eb_select_engine() to prevent
-	 * i915_vma_parked() from interfering while execbuf validates vmas.
-	 */
-	if (eb-&gt;gt-&gt;info.id)
-		intel_gt_pm_put(to_gt(eb-&gt;gt-&gt;i915), eb-&gt;wakeref_gt0);
 	intel_gt_pm_put(eb-&gt;context-&gt;engine-&gt;gt, eb-&gt;wakeref);
 	for_each_child(eb-&gt;context, child)
 		intel_context_put(child);
</pre>
    </blockquote>
  </body>
</html>

--------------6ZkDMTWfhcdp00GyvkrheolQ--
