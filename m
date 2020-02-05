Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD5A15297B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 11:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329F56F540;
	Wed,  5 Feb 2020 10:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 380 seconds by postgrey-1.36 at gabe;
 Wed, 05 Feb 2020 10:56:30 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31826F540
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 10:56:30 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83BB94F8;
 Wed,  5 Feb 2020 11:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1580899808;
 bh=UTifZTLLpMTI0RjXCoRHBDNEtdBVGY9d8q0FCMF/KEs=;
 h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
 b=jT6hyvWp23fjd1eR/G8A7L1pVRL+vHHp2MvwCrirctmTwaH9/cPyXoxTU6hwMcph0
 qTPTQb56E2qi4i6EEVyCyDYUOegdFJURmZRgHZjxe9ze+1KKnLpaxPwU3XGwt93Vgm
 1RYeL3HPFlWT1vCqon3XlkJFeWU2mFFb7yjmHDAo=
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cd432385-7470-80c7-31e1-164851c23e7b@ideasonboard.com>
Date: Wed, 5 Feb 2020 10:50:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 05/02/2020 09:32, Andy Shevchenko wrote:
> This file doesn't need everything provided by <linux/kernel.h>.
> All it needs are some types, which are provided by <linux/types.h>.
> 
> Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> not relying on implicit includes is indeed a good thing.

This explains things a bit better :-)

I'm sure the others will follow too, but here's my:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Update commit message (Geert, Laurent)
>  include/linux/platform_data/shmob_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> index fe815d7d9f58..08605fdb2226 100644
> --- a/include/linux/platform_data/shmob_drm.h
> +++ b/include/linux/platform_data/shmob_drm.h
> @@ -10,7 +10,7 @@
>  #ifndef __SHMOB_DRM_H__
>  #define __SHMOB_DRM_H__
>  
> -#include <linux/kernel.h>
> +#include <linux/types.h>
>  
>  #include <drm/drm_mode.h>
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
