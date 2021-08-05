Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A4A3E149C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 14:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CEA6E9FB;
	Thu,  5 Aug 2021 12:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2576E9FB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 12:20:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id x11so9213873ejj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZeJCXwTnFHOSY2G3ubNi9r0ZWMJswnaE0cbLWzD87ao=;
 b=JvKFmuZo3WU/NrSx4z/EbHDGpww1QMR2Txbpkq9ECmZc/Y/sbLhdS0dk0j16hxxX1j
 iSoWsfr7w8g5VHskOl0SsdhuVcYHJ2attjlHSZ+zTY6UlfwjYB6zQJ8XBc47REw4YDOn
 VFoQS+yUzNo2n+c56SIR5Jx3iyFB8nPyd0nzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZeJCXwTnFHOSY2G3ubNi9r0ZWMJswnaE0cbLWzD87ao=;
 b=sLZiN2sWO2wKqCKVa5jVbPueywwOANBw1k551Q54czFb0XGWg0VZJyiNdzJW+2orzW
 w1Xnrm+TIrZ5wes60Cc7GaLx0bdrsMDeb6RO+90S+0I0f9tUY5NtcrspQF8h3DZN72cM
 jme8oEySG/ytpvjswaTELNOubTz3bjGrWRJlI0PSEMhL8UQTtnD+jpRigJ3ZI3m3eL06
 Eni+wQk+Qfrscr+YDYDMzJnzfA/DOImSzqXTDsDi9KrsPVOrxCFRi7sxzrt0PoeMetWe
 FmcIrSEurj0N04ckLw7sX202DFPNnqZ+HW+/xBolbuBRJjpSoBizCfgu9VmbnJeuc8e1
 qvig==
X-Gm-Message-State: AOAM530se3LHLyCiEGFufvb83zEASn2r9sj6mhsd7R8rolc/LyQkuyQB
 AlBRsYLZn2ZpMYCRSJa3PCvpcg==
X-Google-Smtp-Source: ABdhPJyHDblGy28m5LazfJidsF2qp2j2N9vascilPmI9JIOXQz4U3XPKQbKMQbkBAn9N64cO3/B3JQ==
X-Received: by 2002:a17:907:2595:: with SMTP id
 ad21mr4470681ejc.430.1628166056505; 
 Thu, 05 Aug 2021 05:20:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d26sm1679117ejy.101.2021.08.05.05.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:20:56 -0700 (PDT)
Date: Thu, 5 Aug 2021 14:20:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>
Subject: Re: [PATCH] drm/omap: Depend on CONFIG_OF
Message-ID: <YQvXpptbamRTjuC6@phenom.ffwll.local>
References: <20210805105254.11834-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805105254.11834-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 05, 2021 at 01:52:54PM +0300, Laurent Pinchart wrote:
> The driver accesses the drm_bridge.of_node field, which is present only
> if CONFIG_OF is enabled. As all platforms using omapdrm are OF-based, we
> can simply depend on CONFIG_OF.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

And thanks for not going down the "let's add dummy functions and inflict
lots of error case handling onto a driver that will never be used" route
instead.
-Daniel

> ---
>  drivers/gpu/drm/omapdrm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
> index e7281da5bc6a..999f1ca42849 100644
> --- a/drivers/gpu/drm/omapdrm/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_OMAP
>  	tristate "OMAP DRM"
> -	depends on DRM
> +	depends on DRM && OF
>  	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
>  	select OMAP2_DSS
>  	select DRM_KMS_HELPER
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
