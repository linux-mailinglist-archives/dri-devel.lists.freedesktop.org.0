Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105FC38C333
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DF66F606;
	Fri, 21 May 2021 09:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B831892DE;
 Fri, 21 May 2021 09:33:16 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmhDc07LvzmXQq;
 Fri, 21 May 2021 17:30:56 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:33:13 +0800
Received: from [127.0.0.1] (10.40.188.144) by dggeme759-chm.china.huawei.com
 (10.3.19.105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 17:33:13 +0800
Subject: Re: [PATCH 08/11] drm/vram-helpers: Create
 DRM_GEM_VRAM_PLANE_HELPER_FUNCS
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-8-daniel.vetter@ffwll.ch>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <5898097e-021f-0850-92ca-3c42cc28d525@huawei.com>
Date: Fri, 21 May 2021 17:33:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-8-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "tiantao \(H\)" <tiantao6@hisilicon.com>, Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Daniel
 Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


ÔÚ 2021/5/21 17:09, Daniel Vetter Ð´µÀ:
> Like we have for the shadow helpers too, and roll it out to drivers.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/ast/ast_mode.c                 |  3 +--
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c |  3 +--
>   drivers/gpu/drm/vboxvideo/vbox_mode.c          |  3 +--
>   include/drm/drm_gem_vram_helper.h              | 12 ++++++++++++
>   4 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 36d9575aa27b..20557d2c2fae 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -612,8 +612,7 @@ ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
>   }
>   
>   static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
> -	.prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
> +	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
>   	.atomic_check = ast_primary_plane_helper_atomic_check,
>   	.atomic_update = ast_primary_plane_helper_atomic_update,
>   	.atomic_disable = ast_primary_plane_helper_atomic_disable,
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index 29b8332b2bca..ccf80e369b4b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -158,8 +158,7 @@ static const struct drm_plane_funcs hibmc_plane_funcs = {
>   };
>   
>   static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
> -	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
> +	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
>   	.atomic_check = hibmc_plane_atomic_check,
>   	.atomic_update = hibmc_plane_atomic_update,
>   };
Reviewed-by: Tian Tao <tiantao6@hisilicon.com>
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 964381d55fc1..972c83b720aa 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -488,8 +488,7 @@ static const struct drm_plane_helper_funcs vbox_primary_helper_funcs = {
>   	.atomic_check = vbox_primary_atomic_check,
>   	.atomic_update = vbox_primary_atomic_update,
>   	.atomic_disable = vbox_primary_atomic_disable,
> -	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
> +	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
>   };
>   
>   static const struct drm_plane_funcs vbox_primary_plane_funcs = {
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 27ed7e9243b9..f48d181c824b 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -124,6 +124,18 @@ void
>   drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
>   				     struct drm_plane_state *old_state);
>   
> +/**
> + * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
> + *	Initializes struct drm_plane_helper_funcs for VRAM handling
> + *
> + * Drivers may use GEM BOs as VRAM helpers for the framebuffer memory. This
> + * macro initializes struct drm_plane_helper_funcs to use the respective helper
> + * functions.
> + */
> +#define DRM_GEM_VRAM_PLANE_HELPER_FUNCS \
> +	.prepare_fb = drm_gem_vram_plane_helper_prepare_fb, \
> +	.cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb
> +
>   /*
>    * Helpers for struct drm_simple_display_pipe_funcs
>    */

