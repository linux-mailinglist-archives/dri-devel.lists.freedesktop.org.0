Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D522A3EC88
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 07:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A784110E0E8;
	Fri, 21 Feb 2025 06:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IIJlhoui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD99010E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 06:06:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5C165C5BA0;
 Fri, 21 Feb 2025 06:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEE0C4CEE2;
 Fri, 21 Feb 2025 06:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740117979;
 bh=I/sDH4Il9gjLysSBuWK3+rNtjzTAmWWvwJtGzXyvw94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IIJlhouibrLgu4lt+5/pJHggDP+e58ons6ZzIM1V9mX2tWUr+lDPK2tof2/QQ8jxU
 6+2e3ktAVOjGr6mhUc/dA1UE+BNql5w4lN8q5QJGS990UVhUCb98AoMi4Vgoh4hyuw
 4KMTdE/mPcNYo1O7FeLboW/IAWYDDP9eHnYBciK4=
Date: Fri, 21 Feb 2025 07:05:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: arnd@arndb.de, andriy.shevchenko@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/draw: include bug.h
Message-ID: <2025022135-aviation-evident-2518@gregkh>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
 <20250221050804.2764553-3-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221050804.2764553-3-raag.jadav@intel.com>
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

On Fri, Feb 21, 2025 at 10:38:04AM +0530, Raag Jadav wrote:
> Directly include bug.h for WARN() helpers instead of relying on
> intermediate headers.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_draw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> index cb2ad12bce57..0a0e1eebf481 100644
> --- a/drivers/gpu/drm/drm_draw.c
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/bug.h>
>  #include <linux/iosys-map.h>
>  #include <linux/types.h>
>  
> -- 
> 2.34.1
> 

Does patch 1 break this file without this patch so this series is not in
order?

I'll be glad to take patch 1 in my tree, but I don't want to break
anything else.

thanks,

greg k-h
