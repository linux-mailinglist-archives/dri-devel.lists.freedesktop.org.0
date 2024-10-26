Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F49B1888
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 16:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0010E079;
	Sat, 26 Oct 2024 14:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Ff6f8gEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7BF10E065
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 14:16:07 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4XbMBt4TJMzDqM4;
 Sat, 26 Oct 2024 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729952167; bh=qxjCUJOGkx8Evi9O0GExRhBE/TFlXmW+JRZ6nMHNcHg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ff6f8gEessX6mrWtzzeemeq2AeYg5LPyypKA13PKlJkU4Hp8Ri2YSH/zaH871D9qO
 BO8OaV1CpsqLxNcfCmr7Kz1lF9aP+fUWAr8cFgPTDYcPpIUoCRUyHzLXzwc6m/3QH+
 fY2GiqAukyCYReJnRjFt00367pNF9oU/9CwCmhoM=
X-Riseup-User-ID: 522590480C46D9F432118A3B2F290606DB488F91202FF2C3C33FD0BC993DFD61
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4XbMBm1jcPzJsFN;
 Sat, 26 Oct 2024 14:15:59 +0000 (UTC)
Message-ID: <d61fc345-df97-498b-ab2a-49541d88354a@riseup.net>
Date: Sat, 26 Oct 2024 11:15:58 -0300
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v2 3/8] drm/vkms: Add support for ARGB16161616
 formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
References: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
 <20241007-b4-new-color-formats-v2-3-d47da50d4674@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241007-b4-new-color-formats-v2-3-d47da50d4674@bootlin.com>
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

Hi Louis,

On 07/10/24 13:46, Louis Chauvet wrote:
> The formats XRGB16161616 and ARGB16161616 were already supported.
> Add the support for:
> - ABGR16161616
> - XBGR16161616
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 11 ++++++++---
>   drivers/gpu/drm/vkms/vkms_plane.c   |  2 ++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index b5a38f70c62b..c03a481f5005 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -441,9 +441,10 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
>   READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
>   READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
>   
> -
> -READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0]);
> -READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0]);

Please, correct the error in the patch that introduced. Don't fix it in
an unrelated patch.

> +READ_LINE_16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
> +READ_LINE_16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
> +READ_LINE_16161616(XRGB16161616_read_line, px, 0xFFFF, px[2], px[1], px[0])

Please, be consistent in the use of decimal numbers and hexadecimal
number. If you prefer to use hexadecimal, don't use 255, use 0xFF.

> +READ_LINE_16161616(XBGR16161616_read_line, px, 0xFFFF, px[0], px[1], px[2])

Are you using tests to check the new formats?

Best Regards,
- Maíra

>   
>   READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
>   
> @@ -659,8 +660,12 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
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
> index 941a6e92a040..1e971c7760d9 100644
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
