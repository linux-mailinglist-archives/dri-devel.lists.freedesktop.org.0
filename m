Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA7F4AB255
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 22:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E7710F04E;
	Sun,  6 Feb 2022 21:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76CA10F04E
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 21:28:26 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id dc254daa-8793-11ec-ac19-0050568cd888;
 Sun, 06 Feb 2022 21:29:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 99971194B04;
 Sun,  6 Feb 2022 22:28:20 +0100 (CET)
Date: Sun, 6 Feb 2022 22:28:17 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [PATCH] drm/sprd: remove allow_fb_modifiers setting
Message-ID: <YgA9cT282QBruk2g@ravnborg.org>
References: <20220204023635.15496-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204023635.15496-1-etom@igel.co.jp>
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
Cc: kernel test robot <lkp@intel.com>, Kevin Tang <kevin3.tang@gmail.com>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang7@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomohito,

On Fri, Feb 04, 2022 at 11:36:35AM +0900, Tomohito Esaki wrote:
> Remove allow_fb_modifiers setting in this driver. The allow_fb_modifiers
> flag was removed.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> Fixes: 3d082157a242 ("drm: remove allow_fb_modifiers")
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/sprd/sprd_drm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
> index a077e2d4d721..54c851bccf5b 100644
> --- a/drivers/gpu/drm/sprd/sprd_drm.c
> +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> @@ -43,7 +43,6 @@ static void sprd_drm_mode_config_init(struct drm_device *drm)
>  	drm->mode_config.min_height = 0;
>  	drm->mode_config.max_width = 8192;
>  	drm->mode_config.max_height = 8192;
> -	drm->mode_config.allow_fb_modifiers = true;
>  
>  	drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
>  	drm->mode_config.helper_private = &sprd_drm_mode_config_helper;

Thanks, this partially fixed my arm build.
Pushed to drm-misc-next and should appear in -next within some days.

	Sam
