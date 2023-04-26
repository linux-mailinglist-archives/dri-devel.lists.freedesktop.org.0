Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B46EFBF3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9C10E06E;
	Wed, 26 Apr 2023 20:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA4610E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 20:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rb6wnmOAWGKOTIICMMZRRHdB48rJuccYaaxXsUKddrE=; b=oDYy0sSsZj88yDsoEglHXFg9Qn
 UHplNAZSRR+FBovN/UpNjrO92v24GDdLENa+jJ+PMgxKAS5NaV3SsnwzyNeDw8jtTMim/4FdOPrv4
 IjFnuUmVTJeYYdwgP14Dt6iY4XXIeMMG4JWS6bl1m0J/KJD2+omRWMZ++f9J23gznh9DDDGm13ln3
 +O/c+jjlb7EdN421NDkeb22f9S7Y1BZgeYYOqs+lPmZKRtrrpRqtqnqb+VUtVU6er7gPXZGvWRRAA
 HTjKicGK1wwb9VVDRCF6R+Q+y80mHRWsYn4SbbFSjT5LQVv3LWtxY4ExChBdQEPsAVbMh8i6tMk26
 KEyy57Og==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.20.33.49])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1prmAO-00CyMJ-V9; Wed, 26 Apr 2023 22:55:09 +0200
Message-ID: <c5f5ac0f-e56c-561a-41b2-4a50bac8ee20@igalia.com>
Date: Wed, 26 Apr 2023 17:55:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] drm/vkms: allow full alpha blending on all planes
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230420232228.273340-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230420232228.273340-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/23 20:22, Maíra Canal wrote:
> Before commit bc0d7fdefec6 ("drm: vkms: Supports to the case where
> primary plane doesn't match the CRTC"), the composition was executed on
> top of the primary plane. Therefore, the primary plane was not able to
> support the alpha channel. After commit bc0d7fdefec6, this is possible,
> as the composition is now executed on top of the CRTC.
> 
> So, allow all planes to support the alpha channel, making full alpha
> blending possible in vkms.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Melissa Wen <mwen@igalia.com>

Applied to drm/drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20230414190913.106633-1-mcanal@igalia.com/T/
> 
> * s/vkms_primary_helper_funcs/vkms_plane_helper_funcs (Melissa Wen)
> * Add Melissa's Reviewed-by
> 
> ---
>   drivers/gpu/drm/vkms/vkms_plane.c | 34 +++----------------------------
>   1 file changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index c41cec7dcb70..c2888e5266bc 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -12,12 +12,6 @@
>   #include "vkms_formats.h"
>   
>   static const u32 vkms_formats[] = {
> -	DRM_FORMAT_XRGB8888,
> -	DRM_FORMAT_XRGB16161616,
> -	DRM_FORMAT_RGB565
> -};
> -
> -static const u32 vkms_plane_formats[] = {
>   	DRM_FORMAT_ARGB8888,
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_XRGB16161616,
> @@ -185,7 +179,7 @@ static void vkms_cleanup_fb(struct drm_plane *plane,
>   	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
>   }
>   
> -static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
> +static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>   	.atomic_update		= vkms_plane_atomic_update,
>   	.atomic_check		= vkms_plane_atomic_check,
>   	.prepare_fb		= vkms_prepare_fb,
> @@ -196,38 +190,16 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>   				   enum drm_plane_type type, int index)
>   {
>   	struct drm_device *dev = &vkmsdev->drm;
> -	const struct drm_plane_helper_funcs *funcs;
>   	struct vkms_plane *plane;
> -	const u32 *formats;
> -	int nformats;
> -
> -	switch (type) {
> -	case DRM_PLANE_TYPE_PRIMARY:
> -		formats = vkms_formats;
> -		nformats = ARRAY_SIZE(vkms_formats);
> -		funcs = &vkms_primary_helper_funcs;
> -		break;
> -	case DRM_PLANE_TYPE_CURSOR:
> -	case DRM_PLANE_TYPE_OVERLAY:
> -		formats = vkms_plane_formats;
> -		nformats = ARRAY_SIZE(vkms_plane_formats);
> -		funcs = &vkms_primary_helper_funcs;
> -		break;
> -	default:
> -		formats = vkms_formats;
> -		nformats = ARRAY_SIZE(vkms_formats);
> -		funcs = &vkms_primary_helper_funcs;
> -		break;
> -	}
>   
>   	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
>   					   &vkms_plane_funcs,
> -					   formats, nformats,
> +					   vkms_formats, ARRAY_SIZE(vkms_formats),
>   					   NULL, type, NULL);
>   	if (IS_ERR(plane))
>   		return plane;
>   
> -	drm_plane_helper_add(&plane->base, funcs);
> +	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>   
>   	return plane;
>   }
