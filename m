Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3D6F9B9F
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D65710E01F;
	Sun,  7 May 2023 20:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033C710E01F
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WIZ2OgkOgtc2ENBgI52DWjiIQUtFVHto70q+IwuH5WU=; b=PujXMPDg8YzE20AdbXgWxgudD/
 MDzXQ83wNTl4ZGpuFsXEHbj1JDN/TrPn6YkSmRTdV4it3iMTdneUt80EEGcqyhHKcPsYQoz53uaBn
 3oMgkC2eEEGMQR5grRykY4hQMtv/oSLsWe9u/0fWpC3HAYgdzAyZ/jD/21dYE3AEPxzxChO7bTR95
 SJcBbWaEXCMr7yIj647gzw5daGUq6c5865jSc4pZb6/8suVFkVpSzpf53FPlGfBc8d5BlHuNO5b0C
 2E70h7pgHywYWIQJ3AeCuaf8D3+g9mnDQKEBqeX5w4Scv/yOvbU4LpfRHuQjlR81OlxpS5u/Td+l/
 3FCJivNQ==;
Received: from [38.44.72.37] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pvlJ7-003NFV-T9; Sun, 07 May 2023 22:48:37 +0200
Message-ID: <2a2514a5-131e-4a61-016f-75ec684d0257@igalia.com>
Date: Sun, 7 May 2023 19:48:35 -0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v4 4/6] drm/vkms: add rotate-90 property
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
References: <20230418130525.128733-1-mcanal@igalia.com>
 <20230418130525.128733-5-mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20230418130525.128733-5-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/18, Maíra Canal wrote:
> Currently, vkms only supports the rotate-180, reflect-x and reflect-y
> properties. Therefore, improve the vkms IGT test coverage by adding the
> rotate-90 property to vkms. The rotation was implement by software: rotate
> the way the blending occurs by making the source x axis be the destination
> y axis and the source y axis be the destination x axis.
> 
> Tested with igt@kms_rotation_crc@primary-rotation-90,
> igt@kms_rotation_crc@sprite-rotation-90, and
> igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.

In the same way you did for reflect-x, could you add the link for your
IGT patchset here to avoid misunderstanding between VKMS and IGT tests
status? Double-check if it's necessary for other commits in this series.

Thanks,

Melissa

> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 21 ++++++++++++++++-----
>  drivers/gpu/drm/vkms/vkms_formats.c  |  4 ++++
>  drivers/gpu/drm/vkms/vkms_plane.c    |  2 ++
>  3 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 6c5ef11b3943..491850ffeac9 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -57,13 +57,24 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
>  {
>  	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
>  		return drm_rect_height(&frame_info->rotated) - y - 1;
> -	return y;
> +
> +	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
> +	case DRM_MODE_ROTATE_90:
> +		return frame_info->rotated.x2 - y - 1;
> +	default:
> +		return y;
> +	}
>  }
>  
> -static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
> +static bool check_limit(struct vkms_frame_info *frame_info, int pos)
>  {
> -	if (y >= frame_info->rotated.y1 && y < frame_info->rotated.y2)
> -		return true;
> +	if (frame_info->rotation & DRM_MODE_ROTATE_90) {
> +		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
> +			return true;
> +	} else {
> +		if (pos >= frame_info->rotated.y1 && pos < frame_info->rotated.y2)
> +			return true;
> +	}
>  
>  	return false;
>  }
> @@ -106,7 +117,7 @@ static void blend(struct vkms_writeback_job *wb,
>  		for (size_t i = 0; i < n_active_planes; i++) {
>  			y_pos = get_y_pos(plane[i]->frame_info, y);
>  
> -			if (!check_y_limit(plane[i]->frame_info, y_pos))
> +			if (!check_limit(plane[i]->frame_info, y_pos))
>  				continue;
>  
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index f59b1c48a563..f56f359e0d2d 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -119,6 +119,10 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
>  		int x_pos = get_x_position(frame_info, limit, x);
>  
> +		if (frame_info->rotation & DRM_MODE_ROTATE_90)
> +			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
> +				+ frame_info->cpp * y;
> +
>  		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
>  	}
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 904a278e07d7..9e451ce97099 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -123,6 +123,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>  	drm_framebuffer_get(frame_info->fb);
>  	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> +						     DRM_MODE_ROTATE_90 |
>  						     DRM_MODE_REFLECT_X |
>  						     DRM_MODE_REFLECT_Y);
>  
> @@ -240,6 +241,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  
>  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_0 |
> +					   DRM_MODE_ROTATE_90 |
>  					   DRM_MODE_ROTATE_180 |
>  					   DRM_MODE_REFLECT_X |
>  					   DRM_MODE_REFLECT_Y);
> -- 
> 2.39.2
> 
