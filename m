Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C2C872231
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 15:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD3010E33D;
	Tue,  5 Mar 2024 14:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTNH8uUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2D10E33D;
 Tue,  5 Mar 2024 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709650748; x=1741186748;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=pjlqbtCjHMjMcVcP6w4qS7q8to3lV02COfysOeib1h0=;
 b=gTNH8uUrWFjQBZNVc83VeLdbVGvpPpowzrRG5/vXzMHcnQSxRIMogMwB
 /z4PXoDO5atN9KV3x4ACTMO2rid/IdAC/5UsNjv6MNmKvGZhigfitNI14
 P08tWVyMas3sDEEGxJUhr9n13C4JxqVMu1z5HWL170XLkCvwjhfpMls/c
 6/COIeCVJ5x1rjgdT4zP3nKqNBDtmU+M72Qyd+mFUfcsUxVZNUq3nE80n
 kghkcyEefMFxdm5VmI+RzjRZ0gpeQ+mE0wDYhodDL2OxSxlmGB4jWdUdK
 /WtUfExAprExV/HIdQDPM/kD84TWWmfrv/iwDgruBFtNx7Cbuj4GjHl2k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7149902"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208,217";a="7149902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208,217";a="9345554"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.164])
 ([10.246.48.164])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 06:59:04 -0800
Content-Type: multipart/alternative;
 boundary="------------IO0xoN6x4DGMcBml0SW8KpEu"
Message-ID: <f4e7c0f5-18c9-402e-970c-19f816ea94e8@linux.intel.com>
Date: Tue, 5 Mar 2024 15:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] Revert "drm/i915: Wait for active retire before
 i915_active_fini()"
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
 <20240305143747.335367-8-janusz.krzysztofik@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240305143747.335367-8-janusz.krzysztofik@linux.intel.com>
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
--------------IO0xoN6x4DGMcBml0SW8KpEu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/5/2024 3:35 PM, Janusz Krzysztofik wrote:
> This reverts commit 7a2280e8dcd2f1f436db9631287c0b21cf6a92b0, obsoleted
> by "drm/i915/vma: Fix UAF on destroy against retire race".
>
> Signed-off-by: Janusz Krzysztofik<janusz.krzysztofik@linux.intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/i915/i915_vma.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index b70715b1411d6..d2f064d2525cc 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1776,8 +1776,6 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
>   	if (vm_ddestroy)
>   		i915_vm_resv_put(vma->vm);
>   
> -	/* Wait for async active retire */
> -	i915_active_wait(&vma->active);
>   	i915_active_fini(&vma->active);
>   	GEM_WARN_ON(vma->resource);
>   	i915_vma_free(vma);
--------------IO0xoN6x4DGMcBml0SW8KpEu
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
cite="mid:20240305143747.335367-8-janusz.krzysztofik@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">This reverts commit 7a2280e8dcd2f1f436db9631287c0b21cf6a92b0, obsoleted
by "drm/i915/vma: Fix UAF on destroy against retire race".

Signed-off-by: Janusz Krzysztofik <a class="moz-txt-link-rfc2396E" href="mailto:janusz.krzysztofik@linux.intel.com">&lt;janusz.krzysztofik@linux.intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff">Reviewed-by: Nirmoy Das </span><a
    class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><span
    style="padding: 0px; tab-size: 8;"
    class="hljs diff colorediffs language-diff"></span></pre>
    <blockquote type="cite"
cite="mid:20240305143747.335367-8-janusz.krzysztofik@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/i915_vma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index b70715b1411d6..d2f064d2525cc 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1776,8 +1776,6 @@ static void release_references(struct i915_vma *vma, struct intel_gt *gt,
 	if (vm_ddestroy)
 		i915_vm_resv_put(vma-&gt;vm);
 
-	/* Wait for async active retire */
-	i915_active_wait(&amp;vma-&gt;active);
 	i915_active_fini(&amp;vma-&gt;active);
 	GEM_WARN_ON(vma-&gt;resource);
 	i915_vma_free(vma);
</pre>
    </blockquote>
  </body>
</html>

--------------IO0xoN6x4DGMcBml0SW8KpEu--
