Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE522C6BF6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9676F38C;
	Fri, 27 Nov 2020 19:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DC86F38C;
 Fri, 27 Nov 2020 19:27:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23138523-1500050 for multiple; Fri, 27 Nov 2020 19:27:01 +0000
MIME-Version: 1.0
In-Reply-To: <20201127162828.2660230-1-trix@redhat.com>
References: <20201127162828.2660230-1-trix@redhat.com>
Subject: Re: [PATCH] drm/i915: remove trailing semicolon in macro definition
From: Chris Wilson <chris@chris-wilson.co.uk>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, trix@redhat.com
Date: Fri, 27 Nov 2020 19:26:59 +0000
Message-ID: <160650521947.2925.9215342814329752171@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting trix@redhat.com (2020-11-27 16:28:28)
> From: Tom Rix <trix@redhat.com>
> 
> The macro use will already have a semicolon.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/i915/intel_device_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index e67cec8fa2aa..ef767f04c37c 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -104,7 +104,7 @@ void intel_device_info_print_static(const struct intel_device_info *info,
>         drm_printf(p, "ppgtt-type: %d\n", info->ppgtt_type);
>         drm_printf(p, "dma_mask_size: %u\n", info->dma_mask_size);
>  
> -#define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, yesno(info->name));
> +#define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, yesno(info->name))
>         DEV_INFO_FOR_EACH_FLAG(PRINT_FLAG);

I thought that this was a macro that avoided adding the ';' to each
invocation. Perhaps another time.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
