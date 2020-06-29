Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382320CCFF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 09:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9349189E3B;
	Mon, 29 Jun 2020 07:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F6C89E3B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 07:39:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2F01920021;
 Mon, 29 Jun 2020 09:39:33 +0200 (CEST)
Date: Mon, 29 Jun 2020 09:39:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] drm/zte: remove unneeded semicolon
Message-ID: <20200629073931.GA227119@ravnborg.org>
References: <20200504113230.40588-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504113230.40588-1-yanaijie@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=e5mUnYsNAAAA:8
 a=08u2UhFWmFwjV6_hJKUA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, shawnguo@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 07:32:30PM +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> drivers/gpu/drm/zte/zx_vga.c:158:2-3: Unneeded semicolon
> drivers/gpu/drm/zte/zx_vga.c:171:2-3: Unneeded semicolon
> drivers/gpu/drm/zte/zx_vga.c:179:2-3: Unneeded semicolon
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/zte/zx_vga.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/zte/zx_vga.c b/drivers/gpu/drm/zte/zx_vga.c
> index a7ed7f5ca837..0f9bbb7e3b8d 100644
> --- a/drivers/gpu/drm/zte/zx_vga.c
> +++ b/drivers/gpu/drm/zte/zx_vga.c
> @@ -155,7 +155,7 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to init encoder: %d\n", ret);
>  		return ret;
> -	};
> +	}
>  
>  	drm_encoder_helper_add(encoder, &zx_vga_encoder_helper_funcs);
>  
> @@ -168,7 +168,7 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to init connector: %d\n", ret);
>  		goto clean_encoder;
> -	};
> +	}
>  
>  	drm_connector_helper_add(connector, &zx_vga_connector_helper_funcs);
>  
> @@ -176,7 +176,7 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to attach encoder: %d\n", ret);
>  		goto clean_connector;
> -	};
> +	}
>  
>  	return 0;
>  
> -- 
> 2.21.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
