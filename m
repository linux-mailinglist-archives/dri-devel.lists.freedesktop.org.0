Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D0C94CD40
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 11:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4D10E88F;
	Fri,  9 Aug 2024 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFlOkSck";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703410E88F;
 Fri,  9 Aug 2024 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723195369; x=1754731369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=bYGndcNnW1Vba4fNuZLi9vqUiGdG9Cad+lm8zp8Ojcs=;
 b=ZFlOkSck7xzNTACNM/1Smie+u3A5hp/+Py2bZ1uoVvZconczeemPlhM+
 QYP5pcf/9WB/tCAkf41FkQc4j3LKQg/agbl/KKKf4q130E88/1SXlBE6J
 MF/Bi29zUZ1b4uByQVhoXHc7zb878KLU978ObOcgo4yPVpOMWNxfA3vpL
 q0rfse2RqwHyN/EMHsyCYcgFp0IY3HVm0/G02bVxFYlsF9D5VnF0sTXYo
 gqEdICzeMzFwl/A5qUR6Wb1kgkZ7Xft74Bzc6F0kuBeYMqXLAJDdj9UhI
 C8PwnnR+FYmDQxa4P7Qu5s0fYcLc5FesH9HOjWPvcZXyfM4tauZ3KjmvD w==;
X-CSE-ConnectionGUID: sTJ1OIgMR6iT16Lh4uWYLQ==
X-CSE-MsgGUID: 5KIpv2/NRGy2+xjwLNy+5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21486411"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208,217";a="21486411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:22:48 -0700
X-CSE-ConnectionGUID: tbTCISUSRQSpZyPvqbWXgQ==
X-CSE-MsgGUID: +skD7IZZQK+hCRArOt9lPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208,217";a="57594547"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.117])
 ([10.245.146.117])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:22:45 -0700
Content-Type: multipart/alternative;
 boundary="------------30rVFzWDHg0gF4dmqBlse02w"
Message-ID: <58ed26e4-71bc-4182-879c-eb33d9329500@linux.intel.com>
Date: Fri, 9 Aug 2024 11:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Fix missing enable of Wa_14019159160 on ARL
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20240809000646.1747507-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240809000646.1747507-1-John.C.Harrison@Intel.com>
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
--------------30rVFzWDHg0gF4dmqBlse02w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/9/2024 2:06 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison<John.C.Harrison@Intel.com>
>
> The previous update to enable the workaround on ARL only changed two
> out of three places where the w/a needs to be enabled. That meant the
> GuC side was operational but not the KMD side. And as the KMD side is
> the trigger, it meant the w/a was not actually active. So fix that.
>
> Fixes: 104bcfae57d8 ("drm/i915/arl: Enable Wa_14019159160 for ARL")
> Cc: John Harrison<John.C.Harrison@Intel.com>
> Cc: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
> Cc: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
> Cc: Andi Shyti<andi.shyti@linux.intel.com>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Matt Roper<matthew.d.roper@intel.com>
> Cc: Jonathan Cavitt<jonathan.cavitt@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Cc: Shuicheng Lin<shuicheng.lin@intel.com>
> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9400d0eb682b2..3e1c3bc56daf2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4506,7 +4506,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   	/* Wa_16019325821 */
>   	/* Wa_14019159160 */
>   	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
> -	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
> +	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 74)))
>   		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>   
>   	/*
--------------30rVFzWDHg0gF4dmqBlse02w
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
    <div class="moz-cite-prefix">On 8/9/2024 2:06 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240809000646.1747507-1-John.C.Harrison@Intel.com">
      <pre wrap="" class="moz-quote-pre">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

The previous update to enable the workaround on ARL only changed two
out of three places where the w/a needs to be enabled. That meant the
GuC side was operational but not the KMD side. And as the KMD side is
the trigger, it meant the w/a was not actually active. So fix that.

Fixes: 104bcfae57d8 ("drm/i915/arl: Enable Wa_14019159160 for ARL")
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a>
Cc: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Cc: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Cc: Shuicheng Lin <a class="moz-txt-link-rfc2396E" href="mailto:shuicheng.lin@intel.com">&lt;shuicheng.lin@intel.com&gt;</a>
Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite"
      cite="mid:20240809000646.1747507-1-John.C.Harrison@Intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9400d0eb682b2..3e1c3bc56daf2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4506,7 +4506,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
 	if ((engine-&gt;class == COMPUTE_CLASS || engine-&gt;class == RENDER_CLASS) &amp;&amp;
-	    IS_GFX_GT_IP_RANGE(engine-&gt;gt, IP_VER(12, 70), IP_VER(12, 71)))
+	    IS_GFX_GT_IP_RANGE(engine-&gt;gt, IP_VER(12, 70), IP_VER(12, 74)))
 		engine-&gt;flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 
 	/*
</pre>
    </blockquote>
  </body>
</html>

--------------30rVFzWDHg0gF4dmqBlse02w--
