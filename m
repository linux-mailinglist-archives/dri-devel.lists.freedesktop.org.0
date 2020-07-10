Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACEC21BCB4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 20:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A646ECBA;
	Fri, 10 Jul 2020 18:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4986ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 18:02:29 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AC45520037;
 Fri, 10 Jul 2020 20:02:27 +0200 (CEST)
Date: Fri, 10 Jul 2020 20:02:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH 4/4] drm: fb-helper: Convert logging to drm_* functions.
Message-ID: <20200710180226.GH17565@ravnborg.org>
References: <cover.1594136880.git.usuraj35@gmail.com>
 <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d37c7a614eb0885f0f0bed18e48a4d26b345a8e.1594136880.git.usuraj35@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=Nz12hAh02xfRVi4BVOwA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 10:07:21PM +0530, Suraj Upadhyay wrote:
> Change logging information from dev_info() to drm_info().
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>

Thanks. Applied to drm-misc-next.

Also, because there was no more logging functions that needed an update.

	Sam

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 5609e164805f..88146f7245c5 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1819,7 +1819,7 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
>  	if (ret < 0)
>  		return ret;
>  
> -	dev_info(dev->dev, "fb%d: %s frame buffer device\n",
> +	drm_info(dev, "fb%d: %s frame buffer device\n",
>  		 info->node, info->fix.id);
>  
>  	mutex_lock(&kernel_fb_helper_lock);
> -- 
> 2.17.1
> 



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
