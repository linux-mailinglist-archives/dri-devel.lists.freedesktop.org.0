Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B421879BF7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 19:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6807F10F4FB;
	Tue, 12 Mar 2024 18:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p/RxMhML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AF710F4FB;
 Tue, 12 Mar 2024 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jFsP6E3XgtlqMvrGjxkrWUesSQuEUPix9xrODGFwlNM=; b=p/RxMhMLKBve9r0W+cvFg/APv2
 jQxKmUg0qXG6eRd+NtFb9M9csb6UTvCVmanTDlsbYPB6dbw/SukDn1aZcB072cwYjQ+aEHUREVKRg
 JnhDYtFPnASnIiLs6WQka0zWnT0AZWq8/ayTBHEbSd0UAPkal1rkixu3p3piAFnhfx9PRZeZNCYOM
 vloDeU/IqGcoHB8U9YD6/djMtu7ESxtuhhQYSBhB9egG4oOH4Tv/XkjT16f08InEIWtqbqtXalcnH
 s6nd+3M8Vz5q6YXb7aRIk4kMKyr+K9E4IBbLoZpOmUt8BMLmGXAMuWewSai3ObzoWkvnovwAO+83J
 SEhu2rQQ==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rk7H0-009UBo-Bt; Tue, 12 Mar 2024 19:54:50 +0100
Date: Tue, 12 Mar 2024 15:54:42 -0300
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [RFC PATCH v4 07/42] drm/vkms: Avoid reading beyond LUT array
Message-ID: <c53bi4qunmpckxf2tsvtw4k2ft6jrasxzkgyvmliqlsgq6qonr@vqneunmwbizl>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-8-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-8-harry.wentland@amd.com>
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

On 02/26, Harry Wentland wrote:
> When the floor LUT index (drm_fixp2int(lut_index) is the last
> index of the array the ceil LUT index will point to an entry
> beyond the array. Make sure we guard against it and use the
> value of the floor LUT index.
> 
> v3:
>  - Drop bits from commit description that didn't contribute
>    anything of value
> 
> Fixes: db1f254f2cfaf ("drm/vkms: Add support to 1D gamma LUT")
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Reviewed-by: Melissa Wen <mwen@igalia.com>

Same. Already applied upstream:
https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm?id=2fee84030d12d9fddfa874e4562d71761a129277

I guess you are working on top of asdn branch and it's okay to me.
I'm just mentioning to avoid confusion.

Melissa

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index d178f2a400f6..b90e446d5954 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>  				      enum lut_channel channel)
>  {
>  	s64 lut_index = get_lut_index(lut, channel_value);
> +	u16 *floor_lut_value, *ceil_lut_value;
> +	u16 floor_channel_value, ceil_channel_value;
>  
>  	/*
>  	 * This checks if `struct drm_color_lut` has any gap added by the compiler
> @@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>  	 */
>  	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
>  
> -	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> -	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> +	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
> +		/* We're at the end of the LUT array, use same value for ceil and floor */
> +		ceil_lut_value = floor_lut_value;
> +	else
> +		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
>  
> -	u16 floor_channel_value = floor_lut_value[channel];
> -	u16 ceil_channel_value = ceil_lut_value[channel];
> +	floor_channel_value = floor_lut_value[channel];
> +	ceil_channel_value = ceil_lut_value[channel];
>  
>  	return lerp_u16(floor_channel_value, ceil_channel_value,
>  			lut_index & DRM_FIXED_DECIMAL_MASK);
> -- 
> 2.44.0
> 
