Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83400C865D7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 18:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C24610E410;
	Tue, 25 Nov 2025 17:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ4sNjhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825E010E0B7;
 Tue, 25 Nov 2025 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764093539; x=1795629539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J+bS7cAJoPdpC8o/JwOPJ6T6TiOxi8MblxcqN4RcSZo=;
 b=dQ4sNjhKSsvJmz6apDYLUmD+X88fn7JX3RQYkWr7spzbfMD+S3oFsEMY
 b3NkJEiFXaUvcvwzwCux9YrFU1bwLZRqXRf5Nx1tu4dn8mdGwrUs61rbw
 8+iE1RTCYd8g/FwjbtEzwYARQGbYAc1rSkHAF8C4RbXP9LZhnoO+2u0Lx
 3uWDnTaRLcKR9Jnx5Ue0sUEMkeKmwowxnoavpdfmTNDSaEawWB8+Krxo6
 WM7Q/2t2obBMUi/E8WqRK0HEwKWR6LEJchrEn7EUsaOr0JqpQL3RrmAxT
 jPiiOOibHIz330wbTDOCEIpzwte5InOLXHhWLk/WjtZTdT601LkkZfwYL w==;
X-CSE-ConnectionGUID: cmHtmg29Rj+zBbZQAO79FA==
X-CSE-MsgGUID: mUTKqFB/SbudBkdwNXHmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68710218"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208,217";a="68710218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:58:59 -0800
X-CSE-ConnectionGUID: 7U20b8KrSkeu+DAmHIwbog==
X-CSE-MsgGUID: w9SuSdoOTDahcrjfi9IN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
 d="scan'208,217";a="191849198"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.217])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 09:58:57 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: stable@vger.kernel.org, =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Date: Tue, 25 Nov 2025 18:58:53 +0100
Message-ID: <2207016.vrqWZg68TM@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart36003808.ATrlOLLGV9"
Content-Transfer-Encoding: 7Bit
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

--nextPart36003808.ATrlOLLGV9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Krzysztof,

On Tuesday, 25 November 2025 14:33:38 CET Krzysztof Niemiec wrote:
> Initialize eb->vma[].vma pointers to NULL when the eb structure is first
> set up.
> 
> During the execution of eb_lookup_vmas(), the eb->vma array is
> successively filled up with struct eb_vma objects. This process includes
> calling eb_add_vma(), which might fail; however, even in the event of
> failure, eb->vma[i].vma is set for the currently processed buffer.
> 
> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> prompts a call to eb_release_vmas() to clean up the mess. Since
> eb_lookup_vmas() might fail during processing any (possibly not first)
> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> at what point did the lookup function fail.
> 
> In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
> function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
> set to NULL in case i915_gem_object_userptr_submit_init() fails; the
> current one needs to be cleaned up by eb_release_vmas() at this point,
> so the next one is set. If eb_add_vma() fails, neither the current nor
> the next vma is nullified, which is a source of a NULL deref bug
> described in [1].
> 
> When entering eb_lookup_vmas(), the vma pointers are set to the slab
> poison value, instead of NULL. 

Your commit description still doesn't answer my question why the whole memory 
area allocated to the table of VMAs is not initialized to 0 on allocation, 
only left populated with poison values.

Thanks,
Janusz


> This doesn't matter for the actual
> lookup, since it gets overwritten anyway, however the eb_release_vmas()
> function only recognizes NULL as the stopping value, hence the pointers
> are being nullified as they go in case of intermediate failure. This
> patch changes the approach to filling them all with NULL at the start
> instead, rather than handling that manually during failure.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Reported-by: Gangmin Kim <km.kim1503@gmail.com>
> Cc: <stable@vger.kernel.org> # 5.16.x
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 27 ++++++-------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/
gem/i915_gem_execbuffer.c
> index b057c2fa03a4..02120203af55 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -951,13 +951,13 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  		vma = eb_lookup_vma(eb, eb->exec[i].handle);
>  		if (IS_ERR(vma)) {
>  			err = PTR_ERR(vma);
> -			goto err;
> +			return err;
>  		}
>  
>  		err = eb_validate_vma(eb, &eb->exec[i], vma);
>  		if (unlikely(err)) {
>  			i915_vma_put(vma);
> -			goto err;
> +			return err;
>  		}
>  
>  		err = eb_add_vma(eb, &current_batch, i, vma);
> @@ -966,19 +966,8 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  
>  		if (i915_gem_object_is_userptr(vma->obj)) {
>  			err = i915_gem_object_userptr_submit_init(vma-
>obj);
> -			if (err) {
> -				if (i + 1 < eb->buffer_count) {
> -					/*
> -					 * Execbuffer code 
expects last vma entry to be NULL,
> -					 * since we already 
initialized this entry,
> -					 * set the next value to 
NULL or we mess up
> -					 * cleanup handling.
> -					 */
> -					eb->vma[i + 1].vma = 
NULL;
> -				}
> -
> +			if (err)
>  				return err;
> -			}
>  
>  			eb->vma[i].flags |= __EXEC_OBJECT_USERPTR_INIT;
>  			eb->args->flags |= __EXEC_USERPTR_USED;
> @@ -986,10 +975,6 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  	}
>  
>  	return 0;
> -
> -err:
> -	eb->vma[i].vma = NULL;
> -	return err;
>  }
>  
>  static int eb_lock_vmas(struct i915_execbuffer *eb)
> @@ -3362,6 +3347,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	struct sync_file *out_fence = NULL;
--nextPart36003808.ATrlOLLGV9
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="utf-8"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Hi Krzysztof,</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">On Tuesday, 25 November 2025 14:33:38 CET Krzysztof Niemiec wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Initialize eb-&gt;vma[].vma pointers to NULL when the eb structure is first</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; set up.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; During the execution of eb_lookup_vmas(), the eb-&gt;vma array is</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; successively filled up with struct eb_vma objects. This process includes</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; calling eb_add_vma(), which might fail; however, even in the event of</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; failure, eb-&gt;vma[i].vma is set for the currently processed buffer.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; prompts a call to eb_release_vmas() to clean up the mess. Since</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; eb_lookup_vmas() might fail during processing any (possibly not first)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; at what point did the lookup function fail.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; In eb_lookup_vmas(), eb-&gt;vma[i].vma is set to NULL if either the helper</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; function eb_lookup_vma() or eb_validate_vma() fails. eb-&gt;vma[i+1].vma is</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; set to NULL in case i915_gem_object_userptr_submit_init() fails; the</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; current one needs to be cleaned up by eb_release_vmas() at this point,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; so the next one is set. If eb_add_vma() fails, neither the current nor</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; the next vma is nullified, which is a source of a NULL deref bug</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; described in [1].</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; When entering eb_lookup_vmas(), the vma pointers are set to the slab</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; poison value, instead of NULL. </p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Your commit description still doesn't answer my question why the whole memory </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">area allocated to the table of VMAs is not initialized to 0 on allocation, </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">only left populated with poison values.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thanks,<br />Janusz</p>
<br /><br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; This doesn't matter for the actual</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; lookup, since it gets overwritten anyway, however the eb_release_vmas()</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; function only recognizes NULL as the stopping value, hence the pointers</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; are being nullified as they go in case of intermediate failure. This</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; patch changes the approach to filling them all with NULL at the start</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; instead, rather than handling that manually during failure.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Fixes: 544460c33821 (&quot;drm/i915: Multi-BB execbuf&quot;)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Reported-by: Gangmin Kim &lt;km.kim1503@gmail.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Cc: &lt;stable@vger.kernel.org&gt; # 5.16.x</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Signed-off-by: Krzysztof Niemiec &lt;krzysztof.niemiec@intel.com&gt;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; ---</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; .../gpu/drm/i915/gem/i915_gem_execbuffer.c&nbsp;&nbsp;&nbsp; | 27 ++++++-------------</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; 1 file changed, 8 insertions(+), 19 deletions(-)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; index b057c2fa03a4..02120203af55 100644</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -951,13 +951,13 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; vma = eb_lookup_vma(eb, eb-&gt;exec[i].handle);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (IS_ERR(vma)) {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; err = PTR_ERR(vma);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; goto err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; err = eb_validate_vma(eb, &amp;eb-&gt;exec[i], vma);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (unlikely(err)) {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; i915_vma_put(vma);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; goto err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; err = eb_add_vma(eb, &amp;current_batch, i, vma);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -966,19 +966,8 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (i915_gem_object_is_userptr(vma-&gt;obj)) {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; err = i915_gem_object_userptr_submit_init(vma-&gt;obj);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (err) {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (i + 1 &lt; eb-&gt;buffer_count) {</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; /*</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  * Execbuffer code expects last vma entry to be NULL,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  * since we already initialized this entry,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  * set the next value to NULL or we mess up</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  * cleanup handling.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  */</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; eb-&gt;vma[i + 1].vma = NULL;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if (err)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; eb-&gt;vma[i].flags |= __EXEC_OBJECT_USERPTR_INIT;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; eb-&gt;args-&gt;flags |= __EXEC_USERPTR_USED;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -986,10 +975,6 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; return 0;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -err:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; eb-&gt;vma[i].vma = NULL;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; return err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; }</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; static int eb_lock_vmas(struct i915_execbuffer *eb)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -3362,6 +3347,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; struct sync_file *out_fence = NULL;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; int out_fence_fd = -1;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; int err;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; int i;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; BUILD_BUG_ON(__EXEC_INTERNAL_FLAGS &amp; ~__I915_EXEC_ILLEGAL_FLAGS);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; BUILD_BUG_ON(__EXEC_OBJECT_INTERNAL_FLAGS &amp;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; @@ -3375,7 +3361,10 @@ i915_gem_do_execbuffer(struct drm_device *dev,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; eb.exec = exec;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; eb.vma = (struct eb_vma *)(exec + args-&gt;buffer_count + 1);</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; -&nbsp;&nbsp;&nbsp; eb.vma[0].vma = NULL;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; args-&gt;buffer_count; i++)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; eb.vma[i].vma = NULL;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; +</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; eb.batch_pool = NULL;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt;&nbsp; &nbsp;&nbsp;&nbsp; eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<br /><br /></body>
</html>
--nextPart36003808.ATrlOLLGV9--



