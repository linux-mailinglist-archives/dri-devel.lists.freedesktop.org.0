Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2084087F9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 11:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022E76E152;
	Mon, 13 Sep 2021 09:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ADA6E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 09:15:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 1a1d845e-1473-11ec-a02a-0050568c148b;
 Mon, 13 Sep 2021 09:15:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id F29C7194CB2;
 Mon, 13 Sep 2021 11:15:14 +0200 (CEST)
Date: Mon, 13 Sep 2021 11:15:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/fb-helper: disallow if DRM=y and FB=m
Message-ID: <YT8WqU/PkONjgN4t@ravnborg.org>
References: <20210912210054.10939-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912210054.10939-1-kilobyte@angband.pl>
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

Hi Adam,

On Sun, Sep 12, 2021 at 11:00:54PM +0200, Adam Borowski wrote:
> A subfeature of a built-in can't depend on a module.

Maybe I am a bit dense this morning, but I do not really see what error
this fixes. Can you elaborate a bit what situations are fixed by this
patch.

Thanks in advance,

	Sam

> 
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index cea777ae7fb9..75a5a9359d4b 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -103,7 +103,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
>  	depends on DRM
> -	depends on FB
> +	depends on FB >= DRM
>  	select DRM_KMS_HELPER
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
> -- 
> 2.33.0
