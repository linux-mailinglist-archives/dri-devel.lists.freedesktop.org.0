Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0A879CC2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 21:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953DD10EC57;
	Tue, 12 Mar 2024 20:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BuGcgAz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B29010EC56
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7p1Aoph4ZgLWzYWso2TK9JVclNCOZfe1dQUQ/eub1jw=; b=BuGcgAz/hqiodR7GSUqeqGuuK0
 NHMB8BbzeuUKXgv3Efkq3GI2TZQX7L9CsThfPBkKfIvUxkIt2EbacI+5IBk3X1KvhR4pBX8rDIDn3
 lOG0N2FmWeIFnPuYu5TaWq3xA2bn0QAQJT/kRRuyfSRHPqa7TTaXgJWCA+/A9LLjTzClSRHl3BPqc
 QIX5m4JDPBfytGxQN3LynE6Z0666IYuzrahkuYpfJ2wNrv24YDDI0rLbX1IkBUO58+qRusiu79sgn
 L1NejqussGoy0u6jaWtFm4Ibg6QpWmmnXjLeKVRNIhbTr64KgLaCrZQgQoXJfHYjtMPPsOSp4rjQ6
 2ZMdcdOA==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rk8bw-009VmP-OA; Tue, 12 Mar 2024 21:20:33 +0100
Date: Tue, 12 Mar 2024 17:20:20 -0300
From: Melissa Wen <mwen@igalia.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH 2/7] drm/vkms: Add comments
Message-ID: <m67sdxj6emgtfupt3q3amjatjbscgboamzqxawwoki4j2pdofn@hwq6dijquv6q>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
 <20240306-louis-vkms-conv-v1-2-5bfe7d129fdd@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306-louis-vkms-conv-v1-2-5bfe7d129fdd@riseup.net>
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

On 03/06, Arthur Grillo wrote:
Hi,

can you describe better the scope of your changes? Limiting the scope
in the commit message and also describing in the body a summary of what
you are documenting and reasons.

Thanks,

Melissa

> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 47 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 44d9b9b3bdc3..55ed3f598bd7 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -577,6 +577,18 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 0,
>  	};
> +
> +	/*
> +	 * Those matrixies were generated using the colour python framework
> +	 *
> +	 * Below are the function calls used to generate eac matrix, go to
> +	 * https://colour.readthedocs.io/en/develop/generated/colour.matrix_YCbCr.html
> +	 * for more info:
> +	 *
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
>  	static struct conversion_matrix yuv_bt601_full = {
>  		.matrix = {
>  			{ 4294967296, 0,           6021544149 },
> @@ -585,6 +597,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 0,
>  	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                                  is_legal = True,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
>  	static struct conversion_matrix yuv_bt601_limited = {
>  		.matrix = {
>  			{ 5020601039, 0,           6881764740 },
> @@ -593,6 +611,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 16,
>  	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
>  	static struct conversion_matrix yuv_bt709_full = {
>  		.matrix = {
>  			{ 4294967296, 0,          6763714498 },
> @@ -601,6 +625,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 0,
>  	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                                  is_legal = True,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
>  	static struct conversion_matrix yuv_bt709_limited = {
>  		.matrix = {
>  			{ 5020601039, 0,          7729959424 },
> @@ -609,6 +639,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 16,
>  	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                                  is_legal = False,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
>  	static struct conversion_matrix yuv_bt2020_full = {
>  		.matrix = {
>  			{ 4294967296, 0,          6333358775 },
> @@ -617,6 +653,12 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 0,
>  	};
> +
> +	/*
> +	 * numpy.around(colour.matrix_YCbCr(K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                                  is_legal = True,
> +	 *                                  bits = 8) * 2**32).astype(int)
> +	 */
>  	static struct conversion_matrix yuv_bt2020_limited = {
>  		.matrix = {
>  			{ 5020601039, 0,          7238124312 },
> @@ -625,6 +667,11 @@ get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>  		},
>  		.y_offset = 16,
>  	};
> +
> +	/*
> +	 * The next matrices are just the previous ones, but with the first and
> +	 * second columns swapped
> +	 */
>  	static struct conversion_matrix yvu_bt601_full = {
>  		.matrix = {
>  			{ 4294967296, 6021544149,  0 },
> 
> -- 
> 2.43.0
> 
