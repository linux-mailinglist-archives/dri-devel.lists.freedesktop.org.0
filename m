Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED675EDD5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C284D10E283;
	Mon, 24 Jul 2023 08:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503A710E283;
 Mon, 24 Jul 2023 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690187908; x=1721723908;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=r3DsYCItZr9dOUWVeoZviHNZIHxyJFBYtsMfC4iDvqU=;
 b=H4yM9mlfsyqm0Dky+b4yopyytwEJ/Q17EWRQU2h0dNLx4W/NyW/c0l8U
 yY8TcnwtjHksV8q61Il99XAKyQEe0T2HBsX0FvI/2afmYmf6rQ1Fl7/6/
 zf2vTC2omUdAmW/DzXlf9N8Ck4oZQVLmJ3cqKtsnBMB6R6p52A+ksiSEU
 BQIdvfU090FPpbtjYqaX9lbTbgPHoJOIBRjUA+KPReRUGEw58j5R/recX
 uS7nOSfC+Kv/6xa8fd/GZQTBhk5pG6dFpV62l3oDc14dWKDbqVsfgg2ZW
 jXoaR+OjrZyVmyhRoSOHygROsfNCGytiXhJYx5HrRLlV4rSwF3OLl/z5k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370985189"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
 d="scan'208,217";a="370985189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790886766"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
 d="scan'208,217";a="790886766"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.58.138])
 ([10.252.58.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:38:24 -0700
Content-Type: multipart/alternative;
 boundary="------------Bx0kO8zl2zG0y267RUhKYFod"
Message-ID: <b5d076ca-decf-16c8-2b57-97aa0dba2547@linux.intel.com>
Date: Mon, 24 Jul 2023 10:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v8 2/9] drm/i915: Add the
 gen12_needs_ccs_aux_inv helper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-3-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230721161514.818895-3-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Bx0kO8zl2zG0y267RUhKYFod
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/21/2023 6:15 PM, Andi Shyti wrote:
> We always assumed that a device might either have AUX or FLAT
> CCS, but this is an approximation that is not always true, e.g.
> PVC represents an exception.
>
> Set the basis for future finer selection by implementing a
> boolean gen12_needs_ccs_aux_inv() function that tells whether aux
> invalidation is needed or not.
>
> Currently PVC is the only exception to the above mentioned rule.
>
> Signed-off-by: Andi Shyti<andi.shyti@linux.intel.com>
> Cc: Matt Roper<matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt<jonathan.cavitt@intel.com>
> Cc:<stable@vger.kernel.org>  # v5.8+

|Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>|

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..460c9225a50fc 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,6 +165,18 @@ static u32 preparser_disable(bool state)
>   	return MI_ARB_CHECK | 1 << 8 | state;
>   }
>   
> +static bool gen12_needs_ccs_aux_inv(struct intel_engine_cs *engine)
> +{
> +	if (IS_PONTEVECCHIO(engine->i915))
> +		return false;
> +
> +	/*
> +	 * so far platforms supported by i915 having
> +	 * flat ccs do not require AUX invalidation
> +	 */
> +	return !HAS_FLAT_CCS(engine->i915);
> +}
> +
>   u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
>   {
>   	u32 gsi_offset = gt->uncore->gsi_offset;
> @@ -267,7 +279,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		else if (engine->class == COMPUTE_CLASS)
>   			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915))
> +		if (gen12_needs_ccs_aux_inv(rq->engine))
>   			count = 8 + 4;
>   		else
>   			count = 8;
> @@ -285,7 +297,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915)) {
> +		if (gen12_needs_ccs_aux_inv(rq->engine)) {
>   			/* hsdes: 1809175790 */
>   			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
>   						      GEN12_CCS_AUX_INV);
> @@ -307,7 +319,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	if (mode & EMIT_INVALIDATE) {
>   		cmd += 2;
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> +		if (gen12_needs_ccs_aux_inv(rq->engine) &&
>   		    (rq->engine->class == VIDEO_DECODE_CLASS ||
>   		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>   			aux_inv = rq->engine->mask &
--------------Bx0kO8zl2zG0y267RUhKYFod
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/21/2023 6:15 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230721161514.818895-3-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">We always assumed that a device might either have AUX or FLAT
CCS, but this is an approximation that is not always true, e.g.
PVC represents an exception.

Set the basis for future finer selection by implementing a
boolean gen12_needs_ccs_aux_inv() function that tells whether aux
invalidation is needed or not.

Currently PVC is the only exception to the above mentioned rule.

Signed-off-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v5.8+</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff">Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></code></pre>
    <blockquote type="cite"
      cite="mid:20230721161514.818895-3-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 563efee055602..460c9225a50fc 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -165,6 +165,18 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | 1 &lt;&lt; 8 | state;
 }
 
+static bool gen12_needs_ccs_aux_inv(struct intel_engine_cs *engine)
+{
+	if (IS_PONTEVECCHIO(engine-&gt;i915))
+		return false;
+
+	/*
+	 * so far platforms supported by i915 having
+	 * flat ccs do not require AUX invalidation
+	 */
+	return !HAS_FLAT_CCS(engine-&gt;i915);
+}
+
 u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
 {
 	u32 gsi_offset = gt-&gt;uncore-&gt;gsi_offset;
@@ -267,7 +279,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine-&gt;class == COMPUTE_CLASS)
 			flags &amp;= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-		if (!HAS_FLAT_CCS(rq-&gt;engine-&gt;i915))
+		if (gen12_needs_ccs_aux_inv(rq-&gt;engine))
 			count = 8 + 4;
 		else
 			count = 8;
@@ -285,7 +297,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
 
-		if (!HAS_FLAT_CCS(rq-&gt;engine-&gt;i915)) {
+		if (gen12_needs_ccs_aux_inv(rq-&gt;engine)) {
 			/* hsdes: 1809175790 */
 			cs = gen12_emit_aux_table_inv(rq-&gt;engine-&gt;gt, cs,
 						      GEN12_CCS_AUX_INV);
@@ -307,7 +319,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	if (mode &amp; EMIT_INVALIDATE) {
 		cmd += 2;
 
-		if (!HAS_FLAT_CCS(rq-&gt;engine-&gt;i915) &amp;&amp;
+		if (gen12_needs_ccs_aux_inv(rq-&gt;engine) &amp;&amp;
 		    (rq-&gt;engine-&gt;class == VIDEO_DECODE_CLASS ||
 		     rq-&gt;engine-&gt;class == VIDEO_ENHANCEMENT_CLASS)) {
 			aux_inv = rq-&gt;engine-&gt;mask &amp;
</pre>
    </blockquote>
  </body>
</html>

--------------Bx0kO8zl2zG0y267RUhKYFod--
