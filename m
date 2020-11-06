Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7533B2A9930
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 17:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F76EAAB;
	Fri,  6 Nov 2020 16:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D16EAAB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:12:32 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E6BAF20068;
 Fri,  6 Nov 2020 17:12:30 +0100 (CET)
Date: Fri, 6 Nov 2020 17:12:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/gma500: Remove unused function psb_gem_get_aperture()
Message-ID: <20201106161229.GB625131@ravnborg.org>
References: <20201106124224.21201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106124224.21201-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=9ylfpXcoble3vfVJf88A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 01:42:24PM +0100, Thomas Zimmermann wrote:
> Apparently, the function was never used at all.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Indeed unused.
I expect you or Patrik to apply the patch.

	Sam


> ---
>  drivers/gpu/drm/gma500/gem.c     | 6 ------
>  drivers/gpu/drm/gma500/psb_drv.h | 2 --
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 8f07de83b6fb..db827e591403 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -32,12 +32,6 @@ static void psb_gem_free_object(struct drm_gem_object *obj)
>  	psb_gtt_free_range(obj->dev, gtt);
>  }
>  
> -int psb_gem_get_aperture(struct drm_device *dev, void *data,
> -				struct drm_file *file)
> -{
> -	return -EINVAL;
> -}
> -
>  static const struct vm_operations_struct psb_gem_vm_ops = {
>  	.fault = psb_gem_fault,
>  	.open = drm_gem_vm_open,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index c71a5a4e912c..ce6aae4b1bb2 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -735,8 +735,6 @@ extern const struct drm_connector_helper_funcs
>  extern const struct drm_connector_funcs psb_intel_lvds_connector_funcs;
>  
>  /* gem.c */
> -extern int psb_gem_get_aperture(struct drm_device *dev, void *data,
> -			struct drm_file *file);
>  extern int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			struct drm_mode_create_dumb *args);
>  
> -- 
> 2.29.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
