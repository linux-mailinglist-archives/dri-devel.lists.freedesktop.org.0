Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E97565F8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B1610E260;
	Mon, 17 Jul 2023 14:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1791A10E260;
 Mon, 17 Jul 2023 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689603180; x=1721139180;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=nIH7TP/6GpxY5/i6QotmcWHkrE1acoCnIAiOb8nnQnM=;
 b=MFDADXk0gTPP5dRPQ5tAhfDImUN4vwJbmy2VSzmi17NwmOJaCMZh7O4v
 mw61BsTE/9M2gVoVIvgxYK6sCvjg2l2BKJsXta9b+FjihcDXbkOobDjIP
 nLpnjNtwAX4KaySgt8jpzi9RzF3grkUfxYwf8B4S7fpKagZLbWW9P8gQK
 0q4XMA4JUfOCk7eCZP4AImP0g6+2xRhyU20UpfNPrjH8IefGMLL7TsHxj
 7RhL1I/QUMV9dZXmVCmaryAPQP8bMr7BW+3rAVsOI6sohNkHJuajWXoHQ
 +5RNoDn+6FQqD8XRkmOEgGFO8NlLe2dRq2BqzqZMZ+9D1gCeJffxQ/3qh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355876895"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
 d="scan'208,217";a="355876895"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673548334"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
 d="scan'208,217";a="673548334"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.36.7])
 ([10.249.36.7])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:12:57 -0700
Content-Type: multipart/alternative;
 boundary="------------tB0gficugwiJT7m03dn2hHNh"
Message-ID: <dbf36662-bb53-9f76-45cc-e1843cee3392@linux.intel.com>
Date: Mon, 17 Jul 2023 16:12:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/5] drm/i915/gt: Ensure memory quiesced before
 invalidation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717125134.399115-1-andi.shyti@linux.intel.com>
 <20230717125134.399115-3-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230717125134.399115-3-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------tB0gficugwiJT7m03dn2hHNh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/17/2023 2:51 PM, Andi Shyti wrote:
> From: Jonathan Cavitt<jonathan.cavitt@intel.com>
>
> All memory traffic must be quiesced before requesting
> an aux invalidation on platforms that use Aux CCS.
>
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Jonathan Cavitt<jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti<andi.shyti@linux.intel.com>
> Cc:<stable@vger.kernel.org>  # v5.8+

|Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>|

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..bee3b7dc595cf 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   {
>   	struct intel_engine_cs *engine = rq->engine;
>   
> +	/*
> +	 * Aux invalidations on Aux CCS platforms require
> +	 * memory traffic is quiesced prior.
> +	 */
> +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> +		mode |= EMIT_FLUSH;
> +
>   	if (mode & EMIT_FLUSH) {
>   		u32 flags = 0;
>   		int err;
--------------tB0gficugwiJT7m03dn2hHNh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/17/2023 2:51 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230717125134.399115-3-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">From: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>

All memory traffic must be quiesced before requesting
an aux invalidation on platforms that use Aux CCS.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Signed-off-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v5.8+</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></code></pre>
    <blockquote type="cite"
      cite="mid:20230717125134.399115-3-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 563efee055602..bee3b7dc595cf 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq-&gt;engine;
 
+	/*
+	 * Aux invalidations on Aux CCS platforms require
+	 * memory traffic is quiesced prior.
+	 */
+	if ((mode &amp; EMIT_INVALIDATE) &amp;&amp; !HAS_FLAT_CCS(engine-&gt;i915))
+		mode |= EMIT_FLUSH;
+
 	if (mode &amp; EMIT_FLUSH) {
 		u32 flags = 0;
 		int err;
</pre>
    </blockquote>
  </body>
</html>

--------------tB0gficugwiJT7m03dn2hHNh--
