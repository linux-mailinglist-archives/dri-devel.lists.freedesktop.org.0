Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570B8BD4A1
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 20:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED9510E8FF;
	Mon,  6 May 2024 18:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grtn008P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9C810E6E5;
 Mon,  6 May 2024 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715020373; x=1746556373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=UfNEzJlxxuQXaSC73ixXOKbr/O726w4p+sTiG4tcKQs=;
 b=grtn008PJX9wSkQzgCn0RQyN5wXeaPrrABcFhOvpxKbPQkDeO0LgNWpq
 jCYDltFx/pC80m9CbhQDcuJrpNAuvTO4/HrHHhWmJZqjLTcwPNAp1z2Ko
 5p2aNMp6aeL8/0wUg5MrQVIdg3cRpi7meMFs2VdqfgWGdXwu0xfU/hBqK
 tTaMe9p82dooxSsKEFq1Uk+KZ7FaosbjUOBSMFi24V5KiBTNEQabHZL5r
 iRCcrNIq34JS9STGGsQsji/Fq39spuwHvdl73mIvrmaJnhcCPXhvjTuFB
 k2QlFmZNn68FL6RMFlc4L6nmPrhG8YZ0vUJH1SV0AGqn5TfoRejmIIBML g==;
X-CSE-ConnectionGUID: ydRvGvDtQge1i8DNiHWzuw==
X-CSE-MsgGUID: 5xxGsTraTAK2i3YiFk764w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21939170"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208,217";a="21939170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:32:52 -0700
X-CSE-ConnectionGUID: sxipvEDtSS6czdRKbfvjsA==
X-CSE-MsgGUID: FWUItmR+QD6Aicgk41MbzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208,217";a="65716359"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.32.254])
 ([10.246.32.254])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:32:49 -0700
Content-Type: multipart/alternative;
 boundary="------------7gOquqJM1thNVM2OpMxlIkU6"
Message-ID: <486925a1-4e38-4dad-a333-8748d2fc354c@linux.intel.com>
Date: Mon, 6 May 2024 20:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/i915: Remove extra multi-gt pm-references"
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20240506180253.96858-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240506180253.96858-2-janusz.krzysztofik@linux.intel.com>
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
--------------7gOquqJM1thNVM2OpMxlIkU6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/6/2024 8:02 PM, Janusz Krzysztofik wrote:
> This reverts commit 1f33dc0c1189efb9ae19c6fc22b64dd3e26261fb.
>
> There was a patch supposed to fix an issue of illegal attempts to free a
> still active i915 VMA object when parking a GT believed to be idle,
> reported by CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for
> a Primary GT was acquired from i915_gem_do_execbuffer() -- see commit
> f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").
>
> However, that fix occurred insufficient -- the issue was still reported by
> CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
> potentially before completion of the request and deactivation of its
> associated VMAs.  Moreover, CI reports indicated that single-GT platforms
> also suffered sporadically from the same race.
>
> Since that issue was fixed by another commit f3c71b2ded5c ("drm/i915/vma:
> Fix UAF on destroy against retire race"), the changes introduced by that
> insufficient fix were dropped as no longer useful.  However, that series
> resulted in another VMA UAF scenario now being triggered in CI.
>
> <4> [260.290809] ------------[ cut here ]------------
> <4> [260.290988] list_del corruption. prev->next should be ffff888118c5d990, but was ffff888118c5a510. (prev=ffff888118c5a510)
> <4> [260.291004] WARNING: CPU: 2 PID: 1143 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xb7/0xe0
> ..
> <4> [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> <4> [260.291058] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> <4> [260.291060] RIP: 0010:__list_del_entry_valid_or_report+0xb7/0xe0
> ...
> <4> [260.291087] Call Trace:
> <4> [260.291089]  <TASK>
> <4> [260.291124]  i915_vma_reopen+0x43/0x80 [i915]
> <4> [260.291298]  eb_lookup_vmas+0x9cb/0xcc0 [i915]
> <4> [260.291579]  i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
> <4> [260.291883]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
> ...
> <4> [260.292301]  </TASK>
> ...
> <4> [260.292506] ---[ end trace 0000000000000000 ]---
> <4> [260.292782] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP NOPTI
> <4> [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted: G        W          6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
> <4> [260.313851] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
> <4> [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80 [i915]
> ...
> <4> [260.428756] Call Trace:
> <4> [260.431192]  <TASK>
> <4> [639.283393]  i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
> <4> [639.305245]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
> ...
> <4> [639.411134]  </TASK>
> ...
> <4> [639.449979] ---[ end trace 0000000000000000 ]---
>
> We defer actually closing, unbinding and destroying a VMA until next idle
> point, or until the object is freed in the meantime.  By postponing the
> unbind, we allow for the VMA to be reopened by the client, avoiding the
> work required to rebind the VMA.
>
> Starting from commit b0647a5e79b1 ("drm/i915: Avoid live-lock with
> i915_vma_parked()"), we assume that as long as a GT is held idle, no VMA
> would be reopened while we destroy them.  That assumption is no longer
> true in multi-GT configurations, where a VMA we reopen may be handled by a
> GT different from the one that we already keep active via its engine while
> we set up an execbuf request.
>
> Restoring the extra GT0 PM wakeref removed from i915_gem_do_execbuffer()
> processing path seems to fix this issue.
>
> Closes:https://gitlab.freedesktop.org/drm/intel/-/issues/10608
> Signed-off-by: Janusz Krzysztofik<janusz.krzysztofik@linux.intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Nirmoy Das<nirmoy.das@linux.intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 42619fc05de48..090724fa766c9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -255,6 +255,7 @@ struct i915_execbuffer {
>   	struct intel_context *context; /* logical state for the request */
>   	struct i915_gem_context *gem_context; /** caller's context */
>   	intel_wakeref_t wakeref;
> +	intel_wakeref_t wakeref_gt0;
>   
>   	/** our requests to build */
>   	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
> @@ -2685,6 +2686,7 @@ static int
>   eb_select_engine(struct i915_execbuffer *eb)
>   {
>   	struct intel_context *ce, *child;
> +	struct intel_gt *gt;
>   	unsigned int idx;
>   	int err;
>   
> @@ -2708,10 +2710,17 @@ eb_select_engine(struct i915_execbuffer *eb)
>   		}
>   	}
>   	eb->num_batches = ce->parallel.number_children + 1;
> +	gt = ce->engine->gt;
>   
>   	for_each_child(ce, child)
>   		intel_context_get(child);
>   	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
> +	/*
> +	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
> +	 * free VMAs while execbuf ioctl is validating VMAs.
> +	 */
> +	if (gt->info.id)
> +		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
>   
>   	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>   		err = intel_context_alloc_state(ce);
> @@ -2750,6 +2759,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>   	return err;
>   
>   err:
> +	if (gt->info.id)
> +		intel_gt_pm_put(to_gt(gt->i915), eb->wakeref_gt0);
> +
>   	intel_gt_pm_put(ce->engine->gt, eb->wakeref);
>   	for_each_child(ce, child)
>   		intel_context_put(child);
> @@ -2763,6 +2775,12 @@ eb_put_engine(struct i915_execbuffer *eb)
>   	struct intel_context *child;
>   
>   	i915_vm_put(eb->context->vm);
> +	/*
> +	 * This works in conjunction with eb_select_engine() to prevent
> +	 * i915_vma_parked() from interfering while execbuf validates vmas.
> +	 */
> +	if (eb->gt->info.id)
> +		intel_gt_pm_put(to_gt(eb->gt->i915), eb->wakeref_gt0);
>   	intel_gt_pm_put(eb->context->engine->gt, eb->wakeref);
>   	for_each_child(eb->context, child)
>   		intel_context_put(child);
--------------7gOquqJM1thNVM2OpMxlIkU6
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
    <div class="moz-cite-prefix">On 5/6/2024 8:02 PM, Janusz Krzysztofik
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20240506180253.96858-2-janusz.krzysztofik@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">This reverts commit 1f33dc0c1189efb9ae19c6fc22b64dd3e26261fb.

There was a patch supposed to fix an issue of illegal attempts to free a
still active i915 VMA object when parking a GT believed to be idle,
reported by CI on 2-GT Meteor Lake.  As a solution, an extra wakeref for
a Primary GT was acquired from i915_gem_do_execbuffer() -- see commit
f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").

However, that fix occurred insufficient -- the issue was still reported by
CI.  That wakeref was released on exit from i915_gem_do_execbuffer(), then
potentially before completion of the request and deactivation of its
associated VMAs.  Moreover, CI reports indicated that single-GT platforms
also suffered sporadically from the same race.

Since that issue was fixed by another commit f3c71b2ded5c ("drm/i915/vma:
Fix UAF on destroy against retire race"), the changes introduced by that
insufficient fix were dropped as no longer useful.  However, that series
resulted in another VMA UAF scenario now being triggered in CI.

&lt;4&gt; [260.290809] ------------[ cut here ]------------
&lt;4&gt; [260.290988] list_del corruption. prev-&gt;next should be ffff888118c5d990, but was ffff888118c5a510. (prev=ffff888118c5a510)
&lt;4&gt; [260.291004] WARNING: CPU: 2 PID: 1143 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xb7/0xe0
..
&lt;4&gt; [260.291055] CPU: 2 PID: 1143 Comm: kms_plane Not tainted 6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
&lt;4&gt; [260.291058] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
&lt;4&gt; [260.291060] RIP: 0010:__list_del_entry_valid_or_report+0xb7/0xe0
...
&lt;4&gt; [260.291087] Call Trace:
&lt;4&gt; [260.291089]  &lt;TASK&gt;
&lt;4&gt; [260.291124]  i915_vma_reopen+0x43/0x80 [i915]
&lt;4&gt; [260.291298]  eb_lookup_vmas+0x9cb/0xcc0 [i915]
&lt;4&gt; [260.291579]  i915_gem_do_execbuffer+0xc9a/0x26d0 [i915]
&lt;4&gt; [260.291883]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
...
&lt;4&gt; [260.292301]  &lt;/TASK&gt;
...
&lt;4&gt; [260.292506] ---[ end trace 0000000000000000 ]---
&lt;4&gt; [260.292782] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6ca3: 0000 [#1] PREEMPT SMP NOPTI
&lt;4&gt; [260.303575] CPU: 2 PID: 1143 Comm: kms_plane Tainted: G        W          6.9.0-rc2-CI_DRM_14524-ga25d180c6853+ #1
&lt;4&gt; [260.313851] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P LP5x T3 RVP, BIOS MTLPFWI1.R00.3471.D91.2401310918 01/31/2024
&lt;4&gt; [260.326359] RIP: 0010:eb_validate_vmas+0x114/0xd80 [i915]
...
&lt;4&gt; [260.428756] Call Trace:
&lt;4&gt; [260.431192]  &lt;TASK&gt;
&lt;4&gt; [639.283393]  i915_gem_do_execbuffer+0xd05/0x26d0 [i915]
&lt;4&gt; [639.305245]  i915_gem_execbuffer2_ioctl+0x123/0x2a0 [i915]
...
&lt;4&gt; [639.411134]  &lt;/TASK&gt;
...
&lt;4&gt; [639.449979] ---[ end trace 0000000000000000 ]---

We defer actually closing, unbinding and destroying a VMA until next idle
point, or until the object is freed in the meantime.  By postponing the
unbind, we allow for the VMA to be reopened by the client, avoiding the
work required to rebind the VMA.

Starting from commit b0647a5e79b1 ("drm/i915: Avoid live-lock with
i915_vma_parked()"), we assume that as long as a GT is held idle, no VMA
would be reopened while we destroy them.  That assumption is no longer
true in multi-GT configurations, where a VMA we reopen may be handled by a
GT different from the one that we already keep active via its engine while
we set up an execbuf request.

Restoring the extra GT0 PM wakeref removed from i915_gem_do_execbuffer()
processing path seems to fix this issue.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/intel/-/issues/10608">https://gitlab.freedesktop.org/drm/intel/-/issues/10608</a>
Signed-off-by: Janusz Krzysztofik <a class="moz-txt-link-rfc2396E" href="mailto:janusz.krzysztofik@linux.intel.com">&lt;janusz.krzysztofik@linux.intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@linux.intel.com">&lt;nirmoy.das@linux.intel.com&gt;</a></pre>
    </blockquote>
    <p>Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@linux.intel.com">&lt;nirmoy.das@linux.intel.com&gt;</a></span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
cite="mid:20240506180253.96858-2-janusz.krzysztofik@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 42619fc05de48..090724fa766c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -255,6 +255,7 @@ struct i915_execbuffer {
 	struct intel_context *context; /* logical state for the request */
 	struct i915_gem_context *gem_context; /** caller's context */
 	intel_wakeref_t wakeref;
+	intel_wakeref_t wakeref_gt0;
 
 	/** our requests to build */
 	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
@@ -2685,6 +2686,7 @@ static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
 	struct intel_context *ce, *child;
+	struct intel_gt *gt;
 	unsigned int idx;
 	int err;
 
@@ -2708,10 +2710,17 @@ eb_select_engine(struct i915_execbuffer *eb)
 		}
 	}
 	eb-&gt;num_batches = ce-&gt;parallel.number_children + 1;
+	gt = ce-&gt;engine-&gt;gt;
 
 	for_each_child(ce, child)
 		intel_context_get(child);
 	eb-&gt;wakeref = intel_gt_pm_get(ce-&gt;engine-&gt;gt);
+	/*
+	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
+	 * free VMAs while execbuf ioctl is validating VMAs.
+	 */
+	if (gt-&gt;info.id)
+		eb-&gt;wakeref_gt0 = intel_gt_pm_get(to_gt(gt-&gt;i915));
 
 	if (!test_bit(CONTEXT_ALLOC_BIT, &amp;ce-&gt;flags)) {
 		err = intel_context_alloc_state(ce);
@@ -2750,6 +2759,9 @@ eb_select_engine(struct i915_execbuffer *eb)
 	return err;
 
 err:
+	if (gt-&gt;info.id)
+		intel_gt_pm_put(to_gt(gt-&gt;i915), eb-&gt;wakeref_gt0);
+
 	intel_gt_pm_put(ce-&gt;engine-&gt;gt, eb-&gt;wakeref);
 	for_each_child(ce, child)
 		intel_context_put(child);
@@ -2763,6 +2775,12 @@ eb_put_engine(struct i915_execbuffer *eb)
 	struct intel_context *child;
 
 	i915_vm_put(eb-&gt;context-&gt;vm);
+	/*
+	 * This works in conjunction with eb_select_engine() to prevent
+	 * i915_vma_parked() from interfering while execbuf validates vmas.
+	 */
+	if (eb-&gt;gt-&gt;info.id)
+		intel_gt_pm_put(to_gt(eb-&gt;gt-&gt;i915), eb-&gt;wakeref_gt0);
 	intel_gt_pm_put(eb-&gt;context-&gt;engine-&gt;gt, eb-&gt;wakeref);
 	for_each_child(eb-&gt;context, child)
 		intel_context_put(child);
</pre>
    </blockquote>
  </body>
</html>

--------------7gOquqJM1thNVM2OpMxlIkU6--
