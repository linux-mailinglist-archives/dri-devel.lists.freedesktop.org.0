Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21042215CE5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 19:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869706E1B3;
	Mon,  6 Jul 2020 17:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE836E1B3;
 Mon,  6 Jul 2020 17:20:21 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21731955-1500050 for multiple; Mon, 06 Jul 2020 18:19:51 +0100
MIME-Version: 1.0
In-Reply-To: <20200703125046.8395-1-f.suligoi@asem.it>
References: <20200703125046.8395-1-f.suligoi@asem.it>
Subject: Re: [PATCH] drm/i915: Fix spelling mistake in i915_reg.h
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Flavio Suligoi <f.suligoi@asem.it>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 06 Jul 2020 18:19:49 +0100
Message-ID: <159405598951.24180.13345481240552002697@build.alporthouse.com>
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
Cc: intel-gfx@lists.freedesktop.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Flavio Suligoi (2020-07-03 13:50:46)
> Fix typo: "TRIGER" --> "TRIGGER"
> 
> The two misplelled macros:
> 
> 1) OAREPORTTRIG1_EDGE_LEVEL_TRIGER_SELECT_MASK
> 2) OAREPORTTRIG5_EDGE_LEVEL_TRIGER_SELECT_MASK
> 
> are not used in any other sources of the kernel,
> so this change can be consider only a local change
> for the i915_reg.h file.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 9d6536afc94b..c2153364724a 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -868,7 +868,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  
>  #define OAREPORTTRIG1 _MMIO(0x2740)
>  #define OAREPORTTRIG1_THRESHOLD_MASK 0xffff
> -#define OAREPORTTRIG1_EDGE_LEVEL_TRIGER_SELECT_MASK 0xffff0000 /* 0=level */
> +#define OAREPORTTRIG1_EDGE_LEVEL_TRIGGER_SELECT_MASK 0xffff0000 /* 0=level */
>  
>  #define OAREPORTTRIG2 _MMIO(0x2744)
>  #define OAREPORTTRIG2_INVERT_A_0  (1 << 0)
> @@ -921,7 +921,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  
>  #define OAREPORTTRIG5 _MMIO(0x2750)
>  #define OAREPORTTRIG5_THRESHOLD_MASK 0xffff
> -#define OAREPORTTRIG5_EDGE_LEVEL_TRIGER_SELECT_MASK 0xffff0000 /* 0=level */
> +#define OAREPORTTRIG5_EDGE_LEVEL_TRIGGER_SELECT_MASK 0xffff0000 /* 0=level */

Ok, these names are not copied straight from the docs, so renaming them
will not hinder us when finding the relevant fields.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
