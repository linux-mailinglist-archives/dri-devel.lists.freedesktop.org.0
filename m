Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F249B410
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 13:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DA10EF0D;
	Tue, 25 Jan 2022 12:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2558710EF0B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 12:37:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 968681FB;
 Tue, 25 Jan 2022 04:37:39 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7719C3F7D8;
 Tue, 25 Jan 2022 04:37:39 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 3856D684477; Tue, 25 Jan 2022 12:37:38 +0000 (GMT)
Date: Tue, 25 Jan 2022 12:37:38 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: carsten.haitzler@foss.arm.com
Subject: Re: [PATCH] drm/arm: arm hdlcd select DRM_GEM_CMA_HELPER
Message-ID: <Ye/vEilz6j8gX3wu@e110455-lin.cambridge.arm.com>
References: <20220124162437.2470344-1-carsten.haitzler@foss.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124162437.2470344-1-carsten.haitzler@foss.arm.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 04:24:37PM +0000, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> Without DRM_GEM_CMA_HELPER HDLCD won't build. This needs to be there too.
> 
> Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

I will add Steven's reviewed-by as well when pushing it.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index 58a242871b28..6e3f1d600541 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -6,6 +6,7 @@ config DRM_HDLCD
>  	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
>  	depends on COMMON_CLK
>  	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
>  	help
>  	  Choose this option if you have an ARM High Definition Colour LCD
>  	  controller.
> -- 
> 2.30.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
