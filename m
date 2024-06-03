Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EE8FA3B5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 23:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A40910E3EA;
	Mon,  3 Jun 2024 21:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XKjPCjSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FA610E3EA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 21:47:06 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso3674361fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 14:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717451225; x=1718056025; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FoNDEjuOcgHDOVnZsyqRle0CnqIa5i20V/byDmBZIYI=;
 b=XKjPCjSr68bgrfGImyCO4qmfRpiFHhzrm4GsxDZE/iR3QujS7pvO3egY/hzUt4CqmM
 krVj7sCOyP2bvMiQlcy0ThB4oGG6xzwAjbopub27c8ha18cYLp7rs/wDyRMI+g1rVAwp
 zs3d0jDsVLas9va1wWqEtY8oIBw8hVlk/sgQTe/oXpHtW0WzKRWIZnLQrCHYveDTnxDf
 UeHWiGMNls2gMKb5IMP5Y6m3fAhx5Lqu91oYCdLku2KgpccY3G0S6yhN0amSM5wz4FHn
 YQ08R/WtcmNziN7al5pflx/bjlgKaoWlHBPTgvo5wdlIFosRod4oDfuRr5f5FtQR55+K
 srcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717451225; x=1718056025;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FoNDEjuOcgHDOVnZsyqRle0CnqIa5i20V/byDmBZIYI=;
 b=EZvIv00HuzZG+Zv2bXt2PH0eYTqBoSSNKsvBmT1iBPvzGHfllZctQgSeq7aGAFmdHf
 kERGweO/GhFYOiR2dzf05lcu2pMMlGgQ85BoeopWoN1IQOfCf2E+ScadgVDl9/loahzg
 op3eU1neDuhKknT430rw9frQ8IHkSx63XcAhR10UVKFeEdj6ArMcNNlQQ1eK+Q0ucc8S
 PT/Z40+PYXDDcZdq/btO/UNetEro8CLWrGLtlUTJKGZfubhW3/cUVL+AySXHNyz1/2uP
 w+ag3HLUEcxP9SN6wrW1yeeP1s8JhbzaEhkcCzGQIbU5HQXLRyP8sRv1hczIlNMRyxJf
 ZIxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcq/7D0Nl8Id+9GbSVcG3VztnEL//qH+Fic+VAyHpFKq0aqhZ2R6FpFhwUuXsp0uM3t6d0RdHxd+M1y+/Z0YlWUJd6R2A+VxsuYRK7e0yb
X-Gm-Message-State: AOJu0YzGZ1/kuS4VbnS1kJtZdwi9Q0ugYgIkB4QzXG5aVbOTEyD39tSo
 5KVLVpiGd9wsWmc0XtsKCaU8fI29AmUUewc7iuN1SptsfsDwd2ErpQ5imJnWapQ=
X-Google-Smtp-Source: AGHT+IEj4vQ1nY8StZT7F/AmAO9Jl6Uf5hey1JkSdjWJ4OoehBOPXVZJP+dMJdd2kMJUgH8mBkF+vg==
X-Received: by 2002:a2e:b8c7:0:b0:2d6:f69d:c74c with SMTP id
 38308e7fff4ca-2ea951e0961mr72022941fa.38.1717451224716; 
 Mon, 03 Jun 2024 14:47:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91bb4aedsm13686521fa.33.2024.06.03.14.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 14:47:04 -0700 (PDT)
Date: Tue, 4 Jun 2024 00:47:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: noralf@tronnes.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v3 4/5] drm/mipi-dbi: Add support for DRM_FORMAT_RGB888
Message-ID: <qij3fk3psujfazigjt56hrpj2celdeyvsz3uzioo5aorbzzwql@kbglyrbkd6g6>
References: <20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org>
 <20240603-panel-mipi-dbi-rgb666-v3-4-59ed53ca73da@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240603-panel-mipi-dbi-rgb666-v3-4-59ed53ca73da@tronnes.org>
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

On Mon, Jun 03, 2024 at 01:21:35PM +0200, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> DRM_FORMAT_RGB888 is 24 bits per pixel and it would be natural to send it
> on the SPI bus using a 24 bits per word transfer. The problem with this
> is that not all SPI controllers support 24 bpw.
> 
> Since DRM_FORMAT_RGB888 is stored in memory as little endian and the SPI
> bus is big endian we use 8 bpw to always get the same pixel format on the
> bus: b8g8r8.
> 
> The MIPI DCS specification lists the standard commands that can be sent
> over the MIPI DBI interface. The set_address_mode (36h) command has one
> bit in the parameter that controls RGB/BGR order. This means that the
> controller can be configured to receive the pixel as BGR.
> 
> RGB888 is rarely supported on these controllers but RGB666 is very common.
> All datasheets I have seen do at least support the pixel format option
> where each color is sent as one byte and the 6 MSB's are used.
> 
> All this put together means that we can send each pixel as b8g8r8 and an
> RGB666 capable controller sees this as b6x2g6x2r6x2.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 29 +++++++++++++++++++++++++----
>  include/drm/drm_mipi_dbi.h     |  5 +++++
>  2 files changed, 30 insertions(+), 4 deletions(-)

The patch generally LGTM. The only nit is the name of
'emulation_format'. My first impression was that it is a format that the
driver is emulating to userspace, however it looks like this is
over-the-wire format (with the RGB666 vs RGB888 note kept in mind).

If my understanding is correct, I'd suggest renaming emulation_format
to something like 'raw_format' or 'panel_format'.

> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 77f8a828d6e0..eb330676857c 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -206,6 +206,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
>  		      struct drm_rect *clip, bool swap,
>  		      struct drm_format_conv_state *fmtcnv_state)
>  {
> +	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
>  	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
>  	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
>  	int ret;
> @@ -222,8 +223,18 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
>  		else
>  			drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
>  		break;
> +	case DRM_FORMAT_RGB888:
> +		drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
> +		break;
>  	case DRM_FORMAT_XRGB8888:
> -		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, fmtcnv_state, swap);
> +		switch (dbidev->emulation_format) {
> +		case DRM_FORMAT_RGB565:
> +			drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, fmtcnv_state, swap);
> +			break;
> +		case DRM_FORMAT_RGB888:
> +			drm_fb_xrgb8888_to_rgb888(&dst_map, NULL, src, fb, clip, fmtcnv_state);
> +			break;
> +		}
>  		break;
>  	default:
>  		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",

[skipped]

> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index b36596efdcc3..85bf19b98cee 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -101,6 +101,11 @@ struct mipi_dbi_dev {
>  	 */
>  	struct drm_display_mode mode;
>  
> +	/**
> +	 * @emulation_format: Pixel format to use when emulating XRGB8888
> +	 */
> +	u32 emulation_format;
> +
>  	/**
>  	 * @tx_buf: Buffer used for transfer (copy clip rect area)
>  	 */
> 
> -- 
> 2.45.1
> 
> 

-- 
With best wishes
Dmitry
