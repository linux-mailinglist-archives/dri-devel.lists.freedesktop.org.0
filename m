Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CB0AEB8C2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293E10EA24;
	Fri, 27 Jun 2025 13:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="O+jaEjBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF5B10EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=clRUvEmfDCpimGjB5HPnLClDltVWqhqAeoUTHo5ox1M=; b=O+jaEjBnY+VLhhLEfhfeTEdtBm
 YguFsmTLGFDWw4ZDUYH/EVrgOJzBo/upNcVwXRBB1Ypw8XzZ0UkbrG4xEJ5peKyr1ZKwYMf8gAXxX
 tOBuJwwAL94WezNAJ5K2TQSZAs0Z2KaCq5/R4qbIVTyh8Tja9/humZH9Cssyf3jYqMAfEm4VvEji7
 3+hu999RYtzDyUQg2LnDSIYoG8doa5+2Tc2mf11HrQS0e9X4y/ktBICHkmjcwxfuonRw/KnRWi5Ry
 5LEvdYlgaAnPOWvuncEzfFnOlHrB1Y0HaR3pLjY/hswe4hiiT30pNcbKjPJA3JOeTzyVqgGqpXJn3
 Hs57L5fg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uV91q-009PZk-HD; Fri, 27 Jun 2025 15:22:06 +0200
Message-ID: <761441fd-3659-4c72-bf03-f0634be41724@igalia.com>
Date: Fri, 27 Jun 2025 10:21:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/vkms: Add P01* formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
 <20250627-b4-new-color-formats-v5-8-94452f119c72@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-8-94452f119c72@bootlin.com>
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

On 27/06/25 06:12, Louis Chauvet wrote:
> The formats NV 12/16/24/21/61/42 were already supported.
> Add support for:
> - P010
> - P012
> - P016
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
>   drivers/gpu/drm/vkms/vkms_plane.c   | 3 +++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index b18d67436e1d..e540218fdcad 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -522,7 +522,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
>   
>   READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
>   			 y[0] * 257, uv[0] * 257, uv[1] * 257)
> -
> +READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
> +			 y[0], uv[0], uv[1])
>   /*
>    * This callback can be used for YUV format where each color component is
>    * stored in a different plane (often called planar formats). It will
> @@ -719,6 +720,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   	case DRM_FORMAT_NV61:
>   	case DRM_FORMAT_NV42:
>   		return &YUV888_semiplanar_read_line;
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		return &YUV161616_semiplanar_read_line;
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
>   	case DRM_FORMAT_YUV444:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 9f34f3a18d8c..e592e47a5736 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -39,6 +39,9 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_YVU420,
>   	DRM_FORMAT_YVU422,
>   	DRM_FORMAT_YVU444,
> +	DRM_FORMAT_P010,
> +	DRM_FORMAT_P012,
> +	DRM_FORMAT_P016,
>   	DRM_FORMAT_R1,
>   	DRM_FORMAT_R2,
>   	DRM_FORMAT_R4,
> 

