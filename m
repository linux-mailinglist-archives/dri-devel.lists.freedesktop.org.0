Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A071536A2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0556F8EF;
	Wed,  5 Feb 2020 17:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBB16F8EF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:33:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5D84F8;
 Wed,  5 Feb 2020 18:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1580924017;
 bh=3rppcfl802crYXV1mq6To15oEXeQJ2Eo2DfgnPf0fxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAYlUf5zqywJCno3IDvWoX0GxB10MYGQQsR2ZfVibQKKSbiAu0rcwCgeDo+FvtRP5
 TpvAiz0X+S6OzwGKVwpHpD6a0RTTsFq+v567Rjlhuyem2HETsAlhIXBuS4wBvks0oY
 X+LDaZ1rkJqWGmmWgIZKAqHxT1r2aLwqTOA31hKg=
Date: Wed, 5 Feb 2020 19:33:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
Message-ID: <20200205173322.GB4722@pendragon.ideasonboard.com>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thank you for the patch.

On Wed, Feb 05, 2020 at 11:32:26AM +0200, Andy Shevchenko wrote:
> This file doesn't need everything provided by <linux/kernel.h>.
> All it needs are some types, which are provided by <linux/types.h>.
> 
> Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> not relying on implicit includes is indeed a good thing.

Do we even need linux/types.h ? Apart from struct drm_mode_modeinfo,
shmob_drm.h seems to only contain plain C without using any externally
defined types.

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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
