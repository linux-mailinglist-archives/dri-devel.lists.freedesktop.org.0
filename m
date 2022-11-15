Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FC629CC1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 15:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEBB10E40D;
	Tue, 15 Nov 2022 14:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB8F10E40C;
 Tue, 15 Nov 2022 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668524233; x=1700060233;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wX46BsJ9Egi6UrhAxw83h8RCoqTcYNja7dAYQ5PTw+4=;
 b=DOW7x7TGzF6GTo/rXGLKutN2SJE5MHbE3i3XHs1uEeSAjwSUao9GgaeL
 WnLrduqFrvt/DuD5XtKEUOBLW7j4R2YeSlzhhEyB6VsBRxLScABJsFVSR
 NSJh2A/jaoyKdNlhvv/7NINeGt00hmZmPEVY9oXIfA7MIHg9z3vu7RPHR
 +IyM6/BHdmCNRdthlQv6m/PCBR2BJjEIoAm9Yyu80oC1pT+cDL9d26917
 MItLa89UTc85KFqExRfU4/5pO1ttM4vJrkmpkE+zmPUs/0KJ1e2HN94mM
 UvGurrf0Jdt51VmUZEKqzQBQpsuNPHkdYWDObJggTTCTGKH2EZ2mcfznr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="376535817"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="376535817"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 06:56:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="641232365"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="641232365"
Received: from rainikit-mobl1.ger.corp.intel.com (HELO [10.213.198.207])
 ([10.213.198.207])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 06:56:54 -0800
Message-ID: <cfa1e0fb-f2c0-e2d4-3a6b-4d40d8675a7a@linux.intel.com>
Date: Tue, 15 Nov 2022 14:56:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/i915: Fix build failure with debug and extra logging
 enabled
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20221115143941.32097-1-janusz.krzysztofik@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221115143941.32097-1-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/11/2022 14:39, Janusz Krzysztofik wrote:
> A comma is missing, fix it.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 3b969d679c1e2..947fde68e5f53 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -73,7 +73,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
>   	char buf[512];
>   
>   	if (!vma->node.stack) {
> -		drm_dbg(&to_i915(vma->obj->base.dev)->drm
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
>   			"vma.node [%08llx + %08llx] %s: unknown owner\n",
>   			vma->node.start, vma->node.size, reason);
>   		return;

Yep, thanks, however already sent this morning: 
https://patchwork.freedesktop.org/series/110906/. Just waiting for CI to 
give it a green light, which is a bit pointless, nevertheless it's the 
process.

Regards,

Tvrtko
