Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA9B3240C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD7210EBC4;
	Fri, 22 Aug 2025 21:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="arYkT+sL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B94E10EBC0;
 Fri, 22 Aug 2025 21:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9uZLhzPEmMwp8D7S73NTMgQyO+O6LpYFyWrFqzJc7vM=; b=arYkT+sLUfSekCdSUtkDWfZFab
 /M5zuPdpjW/R27iXLK8WNRIWl1Ma6ocvoAs55hPqAi8Q8XUU051sgda0oFwjEWS1mCv3tQNCd28XS
 VTyiOUyneFP84wycyt9kGYGh75Q71oKNffNiTBXFZ6VbhisqKq0HXRNxpdT2UklJYUHcK2PUuHcC6
 n+bXpbb0yfgS8mL6w7xPzlotyQQNQmAIygHo5FTErKtzY3y/U8MuAWxgm0hjmHbcvuZaVqvsZdWBv
 wqPsrbWcJJk7hNGabw+/kpTBcD7Xnc1/Pdbfl3zz+6wGZLTm/KTXmfTI+i/4F3xrWf+4JiQo5l3Pm
 H1+E86Cg==;
Received: from [189.6.13.79] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1upZB5-000I7b-Rv; Fri, 22 Aug 2025 23:20:04 +0200
Message-ID: <9c544984-7b73-46df-a63a-fc8820d2ccba@igalia.com>
Date: Fri, 22 Aug 2025 18:19:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fix kernel-doc comments for some LUT
 properties
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250823-amdgpu-fix-kdoc-lut-v1-1-306bcad41267@collabora.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250823-amdgpu-fix-kdoc-lut-v1-1-306bcad41267@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 22/08/2025 18:11, Cristian Ciocaltea wrote:
> The following members of struct amdgpu_mode_info do not have valid
> references in the related kernel-doc sections:
>
>   - plane_shaper_lut_property
>   - plane_shaper_lut_size_property,
>   - plane_lut3d_size_property
>
> Correct all affected comment blocks.
>
> Fixes: f545d82479b4 ("drm/amd/display: add plane shaper LUT and TF driver-specific properties")
> Fixes: 671994e3bf33 ("drm/amd/display: add plane 3D LUT driver-specific properties")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Nice catch. Thanks for reviewing docs and fixing them.

Reviewed-by: Melissa Wen <mwen@igalia.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 6da4f946cac008ac865cd6d8a06fb0bd84d646d5..c3ad371658065388c10b7cfc45377b0465bd24ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -366,15 +366,15 @@ struct amdgpu_mode_info {
>   
>   	struct drm_property *plane_ctm_property;
>   	/**
> -	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
> -	 * that converts color content before 3D LUT. If
> -	 * plane_shaper_tf_property != Identity TF, AMD color module will
> +	 * @plane_shaper_lut_property: Plane property to set pre-blending
> +	 * shaper LUT that converts color content before 3D LUT.
> +	 * If plane_shaper_tf_property != Identity TF, AMD color module will
>   	 * combine the user LUT values with pre-defined TF into the LUT
>   	 * parameters to be programmed.
>   	 */
>   	struct drm_property *plane_shaper_lut_property;
>   	/**
> -	 * @shaper_lut_size_property: Plane property for the size of
> +	 * @plane_shaper_lut_size_property: Plane property for the size of
>   	 * pre-blending shaper LUT as supported by the driver (read-only).
>   	 */
>   	struct drm_property *plane_shaper_lut_size_property;
> @@ -398,10 +398,10 @@ struct amdgpu_mode_info {
>   	 */
>   	struct drm_property *plane_lut3d_property;
>   	/**
> -	 * @plane_degamma_lut_size_property: Plane property to define the max
> -	 * size of 3D LUT as supported by the driver (read-only). The max size
> -	 * is the max size of one dimension and, therefore, the max number of
> -	 * entries for 3D LUT array is the 3D LUT size cubed;
> +	 * @plane_lut3d_size_property: Plane property to define the max size
> +	 * of 3D LUT as supported by the driver (read-only). The max size is
> +	 * the max size of one dimension and, therefore, the max number of
> +	 * entries for 3D LUT array is the 3D LUT size cubed.
>   	 */
>   	struct drm_property *plane_lut3d_size_property;
>   	/**
>
> ---
> base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> change-id: 20250823-amdgpu-fix-kdoc-lut-357db8b57fee
>

