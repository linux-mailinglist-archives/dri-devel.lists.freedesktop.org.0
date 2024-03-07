Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF63B8744F0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 01:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115D210E480;
	Thu,  7 Mar 2024 00:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="peexX0AA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E072B10E480
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 00:03:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C5B360003;
 Thu,  7 Mar 2024 00:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709769816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YV8E64LTaxsAW1jsNczlEzcxi3GT245AiC4UGrhHsUI=;
 b=peexX0AANXlwYG/zkq1lh5bvcDkR4fuWupWrXew1xWKDoA2nh9qH4Oa8i4lRKxqiApBJsB
 N3L+NL3g3WU49hDCburHjmTJnN99968AyIp/opJG2aopR1DGib1K2JEFYTHjHdj/6OmM7L
 +86zvJAbY7zYguuiwtGJZiiK8y1Mt0eLmDprVmAknuDLYyc73Iv5vTtpFTBEVvLVlmrF7c
 Mr1MRJEyK1zNiZp8IWnSdpXumwcVAyB6EmMfPQTYDCX0HsvUhAd9KiOlpXh8b/s9rK75Q9
 UYlS25AYWQQZY9RmCRizn6/bLLsOmMZHOIXL8d31GOOWbbCriyTU3/tsRKO6mg==
Date: Thu, 7 Mar 2024 01:03:33 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH 4/7] drm/vkms: Fix compilation issues
Message-ID: <ZekEVT_HNmZbFWNG@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-4-5bfe7d129fdd@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-louis-vkms-conv-v1-4-5bfe7d129fdd@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 06/03/24 - 17:03, Arthur Grillo a écrit :
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> index 4636b013602f..3522ecee960f 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -113,7 +113,7 @@ static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
>  	for (size_t i = 0; i < param->n_colors; i++) {
>  		const struct format_pair *color = &param->colors[i];
>  
> -		const struct conversion_matrix *matrix = get_conversion_matrix_to_argb_u16
> +		struct conversion_matrix *matrix = get_conversion_matrix_to_argb_u16
>  			(DRM_FORMAT_NV12, param->encoding, param->range);
>  
>  		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, matrix);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 393b76e7c694..3d62578499ab 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -47,6 +47,10 @@ struct pixel_argb_u16 {
>  	u16 a, r, g, b;
>  };
>  
> +struct pixel_yuv_u8 {
> +	u8 y, u, v;
> +};

Can I move this structure in the test itself? As discussed with Pekka, I 
think it's not a good idea to have such specific `pixel_{fmt}_{size}` for 
each variant. Leaving it in vkms_drv.h give the idea of "for each new kind 
of format we have to create a new structure".

> +
>  struct line_buffer {
>  	size_t n_pixels;
>  	struct pixel_argb_u16 *pixels;
> 
> -- 
> 2.43.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
