Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BFDAD9033
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D0A10E2C0;
	Fri, 13 Jun 2025 14:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cBBVupOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D12110E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:53:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so14658865e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749826438; x=1750431238; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=plY/+qapwAqRl/1JgqgUsVgwoqDa3137D1CQ4UF0lMI=;
 b=cBBVupOI3L21THGk1/xcPyNL/Ko1kA0d1G4mUA/jwRzDgkfUdeoCWV5mXgbrGENAGL
 bQdQm/IyN6AaqrRcXncBKQVNcqGKMFUaMEKGSQkaKRzqRKXLh9niit3FSHOrNTIwe35L
 HLDVwpHrjpYdYH8IGtevg91l+saUxAK3Q7oAManKrqwjG5T5fJajyw3npZGfr5ECzDmB
 KTYX810Fbfc2ZZdcGYcIhK/WQtvmm6J86Qbd5KXsQRpl4hlUYO89WRdMYc8pOPV4ybhZ
 eJ1Q1hNde2D20vPmmh1u7D6Xk/VwCoz0U5lZhI59hQR9gCBDx8tpEUU+1oPFUpr7HFfB
 oO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749826438; x=1750431238;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=plY/+qapwAqRl/1JgqgUsVgwoqDa3137D1CQ4UF0lMI=;
 b=o/eCSyf31YZNiElI0lH1wEChbiqhUinerb56hCZc2e71O+NGCGzpVJn6JXPofiuXQg
 FWBr+FoFE4JXPrFJP4fWEokQ5vVyYuWsmMM4ouZ4PqAlyluNdMTBTTEmKRT4uVLPcS2z
 USj4IW/w3H7XqYdASqj8bOpuigQS4SCV3UpUshBeY2geuYEFv1m0Fm4psK1I/uscG4c1
 wTWUadhsWjHCdoyCQ5nCvvWAy/lN0Lg6AnlijtoCt+lC1gvIYOHtCFpJJ25dXVajQM6P
 /v8dznIc+Zmt1JFfwN052RTNaHYHgvOOB4nSogvj3LHy4G62H2JJPX8qhXRdzM5Mdhdi
 lFIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfmuB4J8VSO14+evLzGnDu1LO86ZXwjgzWxJPk5I/cLQwCya2Itzz9wbeL7Kiabb67H2matgzpn3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK3N1jKdUxMFIgcFaa5o1rJaFjcvxxLnceASsW/1zQAqIbv0OV
 CMrfXuwDM446Xp6JxJXvPc+3aLP42iBj0qbH0s40vbxiBHrII89AAzrx
X-Gm-Gg: ASbGnctr2Vvxar0Sf2FXucU4O/OzukIkmblV6ch7IimbtntQ9/VwWDNVlHvQQP0+7jc
 VzBjyhdqaYrXIUesiYglSWHITifk4C/wEhcg16TIKG3NpTX/QdNEX6ct6LKFUEYOFesLlI2hfg1
 /MFxZp9Q3BkBKfUmUKwcq7ZIspa3yUBH1iuDlA1Bh77eikaqAzeEqIMNSNB5faMUfsvL+7KdM1C
 7AO/9qYjgri9oXlhzAD3Hpu37wmcHJUx2+m+MTXgtTITVwDn/thF7tdPR7TgT8Q1F3b2ZJPh7Hc
 tzwPx5GZZJEeb5xpDjy0v8YqXps7omdnnaAvI+nnmuXbE/lElevAXSHyqBE=
X-Google-Smtp-Source: AGHT+IEix0OQ0Dhb4mfls6Ro3ieZKseD+2zznNNAuUhh89/aZzf/9XOw9/ssc7KyYWR1u20AN0sNxQ==
X-Received: by 2002:a05:600c:5025:b0:453:c39:d0c2 with SMTP id
 5b1f17b1804b1-45334b7205bmr32263375e9.24.1749826437477; 
 Fri, 13 Jun 2025 07:53:57 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a547d2sm2652003f8f.19.2025.06.13.07.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:53:57 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:53:55 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arthurgrillo@riseup.net, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/3] drm/format-helper: Move
 drm_fb_build_fourcc_list() to sysfb helpers
Message-ID: <aEw7g-u0R_azuex9@fedora>
References: <20250612135658.232535-1-tzimmermann@suse.de>
 <20250612135658.232535-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612135658.232535-4-tzimmermann@suse.de>
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

On Thu, Jun 12, 2025 at 03:52:24PM +0200, Thomas Zimmermann wrote:
> Only sysfb drivers use drm_fb_build_fourcc_list(). Move the function
> to sysfb helpers and rename it accordingly. Update drivers and tests.
> 
> v2:
> - select DRM_SYSFB_HELPER (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com

>
> ---
>  drivers/gpu/drm/Kconfig.debug                 |   1 +
>  drivers/gpu/drm/drm_format_helper.c           | 138 ------------------
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   4 +
>  drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     | 138 ++++++++++++++++++
>  drivers/gpu/drm/sysfb/efidrm.c                |   4 +-
>  drivers/gpu/drm/sysfb/ofdrm.c                 |   5 +-
>  drivers/gpu/drm/sysfb/simpledrm.c             |   5 +-
>  drivers/gpu/drm/sysfb/vesadrm.c               |   4 +-
>  .../gpu/drm/tests/drm_sysfb_modeset_test.c    |   9 +-
>  include/drm/drm_format_helper.h               |   4 -
>  10 files changed, 156 insertions(+), 156 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
> index fa6ee76f4d3c..05dc43c0b8c5 100644
> --- a/drivers/gpu/drm/Kconfig.debug
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -70,6 +70,7 @@ config DRM_KUNIT_TEST
>  	select DRM_GEM_SHMEM_HELPER
>  	select DRM_KUNIT_TEST_HELPERS
>  	select DRM_LIB_RANDOM
> +	select DRM_SYSFB_HELPER
>  	select PRIME_NUMBERS
>  	default KUNIT_ALL_TESTS
>  	help
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 73b5a80771cc..da79100895ff 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -1338,141 +1338,3 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>  	}
>  }
>  EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
> -
> -static uint32_t drm_fb_nonalpha_fourcc(uint32_t fourcc)
> -{
> -	/* only handle formats with depth != 0 and alpha channel */
> -	switch (fourcc) {
> -	case DRM_FORMAT_ARGB1555:
> -		return DRM_FORMAT_XRGB1555;
> -	case DRM_FORMAT_ABGR1555:
> -		return DRM_FORMAT_XBGR1555;
> -	case DRM_FORMAT_RGBA5551:
> -		return DRM_FORMAT_RGBX5551;
> -	case DRM_FORMAT_BGRA5551:
> -		return DRM_FORMAT_BGRX5551;
> -	case DRM_FORMAT_ARGB8888:
> -		return DRM_FORMAT_XRGB8888;
> -	case DRM_FORMAT_ABGR8888:
> -		return DRM_FORMAT_XBGR8888;
> -	case DRM_FORMAT_RGBA8888:
> -		return DRM_FORMAT_RGBX8888;
> -	case DRM_FORMAT_BGRA8888:
> -		return DRM_FORMAT_BGRX8888;
> -	case DRM_FORMAT_ARGB2101010:
> -		return DRM_FORMAT_XRGB2101010;
> -	case DRM_FORMAT_ABGR2101010:
> -		return DRM_FORMAT_XBGR2101010;
> -	case DRM_FORMAT_RGBA1010102:
> -		return DRM_FORMAT_RGBX1010102;
> -	case DRM_FORMAT_BGRA1010102:
> -		return DRM_FORMAT_BGRX1010102;
> -	}
> -
> -	return fourcc;
> -}
> -
> -static bool is_listed_fourcc(const uint32_t *fourccs, size_t nfourccs, uint32_t fourcc)
> -{
> -	const uint32_t *fourccs_end = fourccs + nfourccs;
> -
> -	while (fourccs < fourccs_end) {
> -		if (*fourccs == fourcc)
> -			return true;
> -		++fourccs;
> -	}
> -	return false;
> -}
> -
> -/**
> - * drm_fb_build_fourcc_list - Filters a list of supported color formats against
> - *                            the device's native formats
> - * @dev: DRM device
> - * @native_fourccs: 4CC codes of natively supported color formats
> - * @native_nfourccs: The number of entries in @native_fourccs
> - * @fourccs_out: Returns 4CC codes of supported color formats
> - * @nfourccs_out: The number of available entries in @fourccs_out
> - *
> - * This function create a list of supported color format from natively
> - * supported formats and additional emulated formats.
> - * At a minimum, most userspace programs expect at least support for
> - * XRGB8888 on the primary plane. Devices that have to emulate the
> - * format, and possibly others, can use drm_fb_build_fourcc_list() to
> - * create a list of supported color formats. The returned list can
> - * be handed over to drm_universal_plane_init() et al. Native formats
> - * will go before emulated formats. Native formats with alpha channel
> - * will be replaced by such without, as primary planes usually don't
> - * support alpha. Other heuristics might be applied
> - * to optimize the order. Formats near the beginning of the list are
> - * usually preferred over formats near the end of the list.
> - *
> - * Returns:
> - * The number of color-formats 4CC codes returned in @fourccs_out.
> - */
> -size_t drm_fb_build_fourcc_list(struct drm_device *dev,
> -				const u32 *native_fourccs, size_t native_nfourccs,
> -				u32 *fourccs_out, size_t nfourccs_out)
> -{
> -	/*
> -	 * XRGB8888 is the default fallback format for most of userspace
> -	 * and it's currently the only format that should be emulated for
> -	 * the primary plane. Only if there's ever another default fallback,
> -	 * it should be added here.
> -	 */
> -	static const uint32_t extra_fourccs[] = {
> -		DRM_FORMAT_XRGB8888,
> -	};
> -	static const size_t extra_nfourccs = ARRAY_SIZE(extra_fourccs);
> -
> -	u32 *fourccs = fourccs_out;
> -	const u32 *fourccs_end = fourccs_out + nfourccs_out;
> -	size_t i;
> -
> -	/*
> -	 * The device's native formats go first.
> -	 */
> -
> -	for (i = 0; i < native_nfourccs; ++i) {
> -		/*
> -		 * Several DTs, boot loaders and firmware report native
> -		 * alpha formats that are non-alpha formats instead. So
> -		 * replace alpha formats by non-alpha formats.
> -		 */
> -		u32 fourcc = drm_fb_nonalpha_fourcc(native_fourccs[i]);
> -
> -		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
> -			continue; /* skip duplicate entries */
> -		} else if (fourccs == fourccs_end) {
> -			drm_warn(dev, "Ignoring native format %p4cc\n", &fourcc);
> -			continue; /* end of available output buffer */
> -		}
> -
> -		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
> -
> -		*fourccs = fourcc;
> -		++fourccs;
> -	}
> -
> -	/*
> -	 * The extra formats, emulated by the driver, go second.
> -	 */
> -
> -	for (i = 0; (i < extra_nfourccs) && (fourccs < fourccs_end); ++i) {
> -		u32 fourcc = extra_fourccs[i];
> -
> -		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
> -			continue; /* skip duplicate and native entries */
> -		} else if (fourccs == fourccs_end) {
> -			drm_warn(dev, "Ignoring emulated format %p4cc\n", &fourcc);
> -			continue; /* end of available output buffer */
> -		}
> -
> -		drm_dbg_kms(dev, "adding emulated format %p4cc\n", &fourcc);
> -
> -		*fourccs = fourcc;
> -		++fourccs;
> -	}
> -
> -	return fourccs - fourccs_out;
> -}
> -EXPORT_SYMBOL(drm_fb_build_fourcc_list);
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
> index cb08a88242cc..1424b63dde99 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
> @@ -93,6 +93,10 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
>   * Plane
>   */
>  
> +size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
> +				   const u32 *native_fourccs, size_t native_nfourccs,
> +				   u32 *fourccs_out, size_t nfourccs_out);
> +
>  int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
>  					struct drm_atomic_state *new_state);
>  void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> index ffaa2522ab96..1bcdb5ee8f09 100644
> --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
> @@ -47,6 +47,144 @@ EXPORT_SYMBOL(drm_sysfb_mode);
>   * Plane
>   */
>  
> +static u32 to_nonalpha_fourcc(u32 fourcc)
> +{
> +	/* only handle formats with depth != 0 and alpha channel */
> +	switch (fourcc) {
> +	case DRM_FORMAT_ARGB1555:
> +		return DRM_FORMAT_XRGB1555;
> +	case DRM_FORMAT_ABGR1555:
> +		return DRM_FORMAT_XBGR1555;
> +	case DRM_FORMAT_RGBA5551:
> +		return DRM_FORMAT_RGBX5551;
> +	case DRM_FORMAT_BGRA5551:
> +		return DRM_FORMAT_BGRX5551;
> +	case DRM_FORMAT_ARGB8888:
> +		return DRM_FORMAT_XRGB8888;
> +	case DRM_FORMAT_ABGR8888:
> +		return DRM_FORMAT_XBGR8888;
> +	case DRM_FORMAT_RGBA8888:
> +		return DRM_FORMAT_RGBX8888;
> +	case DRM_FORMAT_BGRA8888:
> +		return DRM_FORMAT_BGRX8888;
> +	case DRM_FORMAT_ARGB2101010:
> +		return DRM_FORMAT_XRGB2101010;
> +	case DRM_FORMAT_ABGR2101010:
> +		return DRM_FORMAT_XBGR2101010;
> +	case DRM_FORMAT_RGBA1010102:
> +		return DRM_FORMAT_RGBX1010102;
> +	case DRM_FORMAT_BGRA1010102:
> +		return DRM_FORMAT_BGRX1010102;
> +	}
> +
> +	return fourcc;
> +}
> +
> +static bool is_listed_fourcc(const u32 *fourccs, size_t nfourccs, u32 fourcc)
> +{
> +	const u32 *fourccs_end = fourccs + nfourccs;
> +
> +	while (fourccs < fourccs_end) {
> +		if (*fourccs == fourcc)
> +			return true;
> +		++fourccs;
> +	}
> +	return false;
> +}
> +
> +/**
> + * drm_sysfb_build_fourcc_list - Filters a list of supported color formats against
> + *                               the device's native formats
> + * @dev: DRM device
> + * @native_fourccs: 4CC codes of natively supported color formats
> + * @native_nfourccs: The number of entries in @native_fourccs
> + * @fourccs_out: Returns 4CC codes of supported color formats
> + * @nfourccs_out: The number of available entries in @fourccs_out
> + *
> + * This function create a list of supported color format from natively
> + * supported formats and additional emulated formats.
> + * At a minimum, most userspace programs expect at least support for
> + * XRGB8888 on the primary plane. Sysfb devices that have to emulate
> + * the format should use drm_sysfb_build_fourcc_list() to create a list
> + * of supported color formats. The returned list can be handed over to
> + * drm_universal_plane_init() et al. Native formats will go before
> + * emulated formats. Native formats with alpha channel will be replaced
> + * by equal formats without alpha channel, as primary planes usually
> + * don't support alpha. Other heuristics might be applied to optimize
> + * the sorting order. Formats near the beginning of the list are usually
> + * preferred over formats near the end of the list.
> + *
> + * Returns:
> + * The number of color-formats 4CC codes returned in @fourccs_out.
> + */
> +size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
> +				   const u32 *native_fourccs, size_t native_nfourccs,
> +				   u32 *fourccs_out, size_t nfourccs_out)
> +{
> +	/*
> +	 * XRGB8888 is the default fallback format for most of userspace
> +	 * and it's currently the only format that should be emulated for
> +	 * the primary plane. Only if there's ever another default fallback,
> +	 * it should be added here.
> +	 */
> +	static const u32 extra_fourccs[] = {
> +		DRM_FORMAT_XRGB8888,
> +	};
> +	static const size_t extra_nfourccs = ARRAY_SIZE(extra_fourccs);
> +
> +	u32 *fourccs = fourccs_out;
> +	const u32 *fourccs_end = fourccs_out + nfourccs_out;
> +	size_t i;
> +
> +	/*
> +	 * The device's native formats go first.
> +	 */
> +
> +	for (i = 0; i < native_nfourccs; ++i) {
> +		/*
> +		 * Several DTs, boot loaders and firmware report native
> +		 * alpha formats that are non-alpha formats instead. So
> +		 * replace alpha formats by non-alpha formats.
> +		 */
> +		u32 fourcc = to_nonalpha_fourcc(native_fourccs[i]);
> +
> +		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
> +			continue; /* skip duplicate entries */
> +		} else if (fourccs == fourccs_end) {
> +			drm_warn(dev, "Ignoring native format %p4cc\n", &fourcc);
> +			continue; /* end of available output buffer */
> +		}
> +
> +		drm_dbg_kms(dev, "adding native format %p4cc\n", &fourcc);
> +
> +		*fourccs = fourcc;
> +		++fourccs;
> +	}
> +
> +	/*
> +	 * The extra formats, emulated by the driver, go second.
> +	 */
> +
> +	for (i = 0; (i < extra_nfourccs) && (fourccs < fourccs_end); ++i) {
> +		u32 fourcc = extra_fourccs[i];
> +
> +		if (is_listed_fourcc(fourccs_out, fourccs - fourccs_out, fourcc)) {
> +			continue; /* skip duplicate and native entries */
> +		} else if (fourccs == fourccs_end) {
> +			drm_warn(dev, "Ignoring emulated format %p4cc\n", &fourcc);
> +			continue; /* end of available output buffer */
> +		}
> +
> +		drm_dbg_kms(dev, "adding emulated format %p4cc\n", &fourcc);
> +
> +		*fourccs = fourcc;
> +		++fourccs;
> +	}
> +
> +	return fourccs - fourccs_out;
> +}
> +EXPORT_SYMBOL(drm_sysfb_build_fourcc_list);
> +
>  int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
>  					struct drm_atomic_state *new_state)
>  {
> diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
> index 46912924636a..9562f9dc7835 100644
> --- a/drivers/gpu/drm/sysfb/efidrm.c
> +++ b/drivers/gpu/drm/sysfb/efidrm.c
> @@ -271,8 +271,8 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>  
>  	/* Primary plane */
>  
> -	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> -					    efi->formats, ARRAY_SIZE(efi->formats));
> +	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
> +					       efi->formats, ARRAY_SIZE(efi->formats));
>  
>  	primary_plane = &efi->primary_plane;
>  	ret = drm_universal_plane_init(dev, primary_plane, 0, &efidrm_primary_plane_funcs,
> diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
> index c9415f0cb3ed..8d8ab39c5f36 100644
> --- a/drivers/gpu/drm/sysfb/ofdrm.c
> +++ b/drivers/gpu/drm/sysfb/ofdrm.c
> @@ -15,7 +15,6 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fbdev_shmem.h>
> -#include <drm/drm_format_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -1015,8 +1014,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  
>  	/* Primary plane */
>  
> -	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> -					    odev->formats, ARRAY_SIZE(odev->formats));
> +	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
> +					       odev->formats, ARRAY_SIZE(odev->formats));
>  
>  	primary_plane = &odev->primary_plane;
>  	ret = drm_universal_plane_init(dev, primary_plane, 0, &ofdrm_primary_plane_funcs,
> diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
> index a1c3119330de..8530a3ef8a7a 100644
> --- a/drivers/gpu/drm/sysfb/simpledrm.c
> +++ b/drivers/gpu/drm/sysfb/simpledrm.c
> @@ -18,7 +18,6 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_shmem.h>
> -#include <drm/drm_format_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -765,8 +764,8 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>  
>  	/* Primary plane */
>  
> -	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> -					    sdev->formats, ARRAY_SIZE(sdev->formats));
> +	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
> +					       sdev->formats, ARRAY_SIZE(sdev->formats));
>  
>  	primary_plane = &sdev->primary_plane;
>  	ret = drm_universal_plane_init(dev, primary_plane, 0, &simpledrm_primary_plane_funcs,
> diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
> index 7945544ba73e..86e0b88dd51b 100644
> --- a/drivers/gpu/drm/sysfb/vesadrm.c
> +++ b/drivers/gpu/drm/sysfb/vesadrm.c
> @@ -402,8 +402,8 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
>  
>  	/* Primary plane */
>  
> -	nformats = drm_fb_build_fourcc_list(dev, &format->format, 1,
> -					    vesa->formats, ARRAY_SIZE(vesa->formats));
> +	nformats = drm_sysfb_build_fourcc_list(dev, &format->format, 1,
> +					       vesa->formats, ARRAY_SIZE(vesa->formats));
>  
>  	primary_plane = &vesa->primary_plane;
>  	ret = drm_universal_plane_init(dev, primary_plane, 0, &vesadrm_primary_plane_funcs,
> diff --git a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
> index 88a4bf28c745..33acd3f02dc6 100644
> --- a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
> @@ -2,10 +2,11 @@
>  
>  #include <kunit/test.h>
>  
> -#include <drm/drm_format_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_kunit_helpers.h>
>  
> +#include "../sysfb/drm_sysfb_helper.h"
> +
>  #define TEST_BUF_SIZE 50
>  
>  struct fb_build_fourcc_list_case {
> @@ -141,9 +142,9 @@ static void drm_test_fb_build_fourcc_list(struct kunit *test)
>  	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
>  
> -	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
> -						params->native_fourccs_size,
> -						fourccs_out, TEST_BUF_SIZE);
> +	nfourccs_out = drm_sysfb_build_fourcc_list(drm, params->native_fourccs,
> +						   params->native_fourccs_size,
> +						   fourccs_out, TEST_BUF_SIZE);
>  
>  	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
>  	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 49a2e09155d1..0d3ee2a1313f 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -134,8 +134,4 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
>  			     const struct iosys_map *src, const struct drm_framebuffer *fb,
>  			     const struct drm_rect *clip, struct drm_format_conv_state *state);
>  
> -size_t drm_fb_build_fourcc_list(struct drm_device *dev,
> -				const u32 *native_fourccs, size_t native_nfourccs,
> -				u32 *fourccs_out, size_t nfourccs_out);
> -
>  #endif /* __LINUX_DRM_FORMAT_HELPER_H */
> -- 
> 2.49.0
> 
