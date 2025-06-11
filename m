Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B32AD5F92
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A876B10E743;
	Wed, 11 Jun 2025 19:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D7A71Bjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FAE10E743
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 19:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OwBx4LQLrUpRGjyqmky6VGtQ1FUpgs981MRRO546hPE=; b=D7A71BjykR/O4nQWgiqf6omVLq
 NlOj3RWT5Aw6L3B7iNIybKuwhquuQRWQ2LAuOBqwXne6OMGZve0a1U1HjrWyb2zygGMHihXGwQXL6
 a/z9/OsAZtJJdyURGxNerZpB3y+nxsNalVTbuLHNso9T6j0tlBKYr6LgE1mhRSMgYF0+b4qwzsKfk
 VGikWvw9fr9nd6dlIYRM8N04cfHH4WgXs5zuXBsw2onTW1Yl4EKYxEUdHHfY1OtGR6wv3wTIW7rJ9
 OOu+A6yos7PXGvmWR4Cc8rkwWh7CtOm2hfz21f1fFZjfZ++C51aKhx3LOYhR7JDGLBRpYx/SswxKz
 1Nb22v5A==;
Received: from [187.36.208.198] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPRZM-002Lal-KA; Wed, 11 Jun 2025 21:57:08 +0200
Message-ID: <e7b4738a-6d7f-40ac-84bd-e88dd0432cdc@igalia.com>
Date: Wed, 11 Jun 2025 16:57:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/vkms: Add support for ARGB16161616 formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com>
 <20250530-b4-new-color-formats-v4-3-ef5f9f48376c@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20250530-b4-new-color-formats-v4-3-ef5f9f48376c@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/30/25 11:05, Louis Chauvet wrote:
> The formats XRGB16161616 and ARGB16161616 were already supported.
> Add the support for:
> - ABGR16161616
> - XBGR16161616
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 6 ++++++
>   drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index f5c52c3d10a3..95771bff5202 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -442,7 +442,9 @@ READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
>   READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
>   
>   READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
> +READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
>   READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
> +READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
>   
>   READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
>   
> @@ -665,8 +667,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   		return &BGRX8888_read_line;
>   	case DRM_FORMAT_ARGB16161616:
>   		return &ARGB16161616_read_line;
> +	case DRM_FORMAT_ABGR16161616:
> +		return &ABGR16161616_read_line;
>   	case DRM_FORMAT_XRGB16161616:
>   		return &XRGB16161616_read_line;
> +	case DRM_FORMAT_XBGR16161616:
> +		return &XBGR16161616_read_line;
>   	case DRM_FORMAT_RGB565:
>   		return &RGB565_read_line;
>   	case DRM_FORMAT_NV12:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index b7f498944c50..505847ec8508 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -22,7 +22,9 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_RGBX8888,
>   	DRM_FORMAT_BGRX8888,
>   	DRM_FORMAT_XRGB16161616,
> +	DRM_FORMAT_XBGR16161616,
>   	DRM_FORMAT_ARGB16161616,
> +	DRM_FORMAT_ABGR16161616,
>   	DRM_FORMAT_RGB565,
>   	DRM_FORMAT_NV12,
>   	DRM_FORMAT_NV16,
> 

