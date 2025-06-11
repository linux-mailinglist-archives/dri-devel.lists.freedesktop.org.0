Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3990AD5FA4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 22:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A47610E719;
	Wed, 11 Jun 2025 20:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MQ5pBI/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E4B10E72E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VpiOuQsBjD5zEcCNbIZvqiFzhDlVWPYNUz3QItJAJRM=; b=MQ5pBI/ALiXUp4hFyxffhJh4Bn
 YBHzVfPeckBz4pavwvnhbvt0dAYKvNwdc/7rp+YzfPZmwJMNt5Ska4iyaqypNckCam3Pnl80aeNJ3
 mfLG92oYIi5TMl+rtKQ9++zg91wOt0qgR3P+lD0BFR6+ZOm7QTBz1D6dykH1r6vIbfctEG0Uw3pOE
 zxbcQZoe593QsitGkLzeDuV9yBIeh/z+GtE7fr/30PheklnokDfdhWnTxrlNLP7hN/tWbmqYsywyz
 2ee/RqKLoKKrf7UkJHaIaVpk3pH400CBOLP3g9GXfhLRpmh8fGKONULdSQn717XqUUEMDTyUFySVq
 6hdXv3wA==;
Received: from [187.36.208.198] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPReH-002LgM-SK; Wed, 11 Jun 2025 22:02:14 +0200
Message-ID: <52a9eb56-f2b2-4bc6-9847-4fad426f0d50@igalia.com>
Date: Wed, 11 Jun 2025 17:02:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] drm/vkms: Add support for RGB565 formats
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
 <20250530-b4-new-color-formats-v4-4-ef5f9f48376c@bootlin.com>
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
In-Reply-To: <20250530-b4-new-color-formats-v4-4-ef5f9f48376c@bootlin.com>
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

On 5/30/25 11:05, Louis Chauvet wrote:
> The format RGB565 was already supported. Add the support for:
> - BGR565
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 23 +++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
>   2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 95771bff5202..2c5cc8d3a14c 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -259,6 +259,26 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
>   	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
>   }
>   
> +static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
> +{
> +	struct pixel_argb_u16 out_pixel;
> +
> +	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> +	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> +
> +	u16 rgb_565 = le16_to_cpu(*pixel);
> +	s64 fp_b = drm_int2fixp((rgb_565 >> 11) & 0x1f);
> +	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> +	s64 fp_r = drm_int2fixp(rgb_565 & 0x1f);
> +
> +	out_pixel.a = (u16)0xffff;
> +	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> +	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> +
> +	return out_pixel;
> +}

Instead of writing `argb_u16_from_BGR565()` from scratch, I wonder if
we could just call `argb_u16_from_RGB565()` and swap `out_pixel.b` with
`out_pixel.r` . For me, it looks like a cleaner approach.

Well, even without this suggestion,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> +
>   VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
>   							    const struct conversion_matrix *matrix)
>   {
> @@ -447,6 +467,7 @@ READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[
>   READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
>   
>   READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
> +READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
>   
>   READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
>   
> @@ -675,6 +696,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   		return &XBGR16161616_read_line;
>   	case DRM_FORMAT_RGB565:
>   		return &RGB565_read_line;
> +	case DRM_FORMAT_BGR565:
> +		return &BGR565_read_line;
>   	case DRM_FORMAT_NV12:
>   	case DRM_FORMAT_NV16:
>   	case DRM_FORMAT_NV24:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 505847ec8508..d3783a8f84c2 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -26,6 +26,7 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_ARGB16161616,
>   	DRM_FORMAT_ABGR16161616,
>   	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_BGR565,
>   	DRM_FORMAT_NV12,
>   	DRM_FORMAT_NV16,
>   	DRM_FORMAT_NV24,
> 

