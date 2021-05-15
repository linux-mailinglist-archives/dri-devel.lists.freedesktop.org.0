Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379A3814AF
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 02:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943496F4C3;
	Sat, 15 May 2021 00:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE866F4C3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=SOVTDUL7WD+tc02zVB1CZeM/ET896z4LkC+EZIWF4MU=; b=pKw0R8bOzaNlPiHPVAQbvTscsC
 4FSJfBeCL82xgbivxVw7bDwkVkxegsTdxQ82CxUTatdUVVpfo/MdqiJrd0SK7PyLR+PMOw7pRgPoh
 GRwvPYLUVqJxSy3BTZCiav3pgKKUQYQzh8DPXjNHaHcMz2UEeSfCD27yCNsUnClZZJ0LZTNNjoByJ
 kMZRQd/xs9Bj/Fx6Z+fi3GLnI3hSWiIUZ6WLvnVg26e7uyF81HWy8QEpUJ1C5Bezk1wf4e8ItfIuC
 uxrOom0rgLFYDXH2wc9gV2tYEFeWe4xkqppZeBqzIO+kG4NwfRMWpQZ9JqhBZdDqGTI8hwkkilD+1
 8LoWL36A==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lhiId-00CL2y-11; Sat, 15 May 2021 00:36:59 +0000
Subject: Re: [PATCH v3] drm: rcar: unbreak the R-Car menu items
To: linux-kernel@vger.kernel.org
References: <20210424034632.5531-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a961e54f-1f34-f3b5-4401-22c2d9862048@infradead.org>
Date: Fri, 14 May 2021 17:36:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210424034632.5531-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping?
thanks.

On 4/23/21 8:46 PM, Randy Dunlap wrote:
> DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
> symbols do not depend on DRM_RCAR_DU, the menu presentation is
> broken for the following R-Car Kconfig symbols.
> 
> Use an if/endif block to make all of these symbols depend on
> DRM_RCAR_DU (and remove the separate "depends on DRM_RCAR_DU").
> This makes the kconfig menu presentation much cleaner.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v2: use an if/endif block for the dependencies (thanks, Geert)
> v3: still applicable -- update/rebase
> 
> Applies after today's earlier patch to fix undefined reference
> build errors for R-Car (probably won't matter).
> 
> I did this patch one year ago and then forgot about it somehow.
> Rediscovered & updated it today.
> 
>  drivers/gpu/drm/rcar-du/Kconfig |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> --- linux-next-20210423.orig/drivers/gpu/drm/rcar-du/Kconfig
> +++ linux-next-20210423/drivers/gpu/drm/rcar-du/Kconfig
> @@ -14,10 +14,11 @@ config DRM_RCAR_DU
>  	  Choose this option if you have an R-Car chipset.
>  	  If M is selected the module will be called rcar-du-drm.
>  
> +if DRM_RCAR_DU
> +
>  config DRM_RCAR_CMM
>  	tristate "R-Car DU Color Management Module (CMM) Support"
>  	depends on DRM && OF
> -	depends on DRM_RCAR_DU
>  	help
>  	  Enable support for R-Car Color Management Module (CMM).
>  
> @@ -41,7 +42,6 @@ config DRM_RCAR_LVDS
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM
>  	default y if ARM64
> -	depends on DRM_RCAR_DU
>  	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
>  	help
>  	  Enable support to expose the R-Car VSP Compositor as KMS planes.
> @@ -49,4 +49,5 @@ config DRM_RCAR_VSP
>  config DRM_RCAR_WRITEBACK
>  	bool
>  	default y if ARM64
> -	depends on DRM_RCAR_DU
> +
> +endif # DRM_RCAR_DU
> 


-- 
~Randy

