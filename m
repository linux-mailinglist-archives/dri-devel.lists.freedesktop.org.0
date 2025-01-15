Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26113A12C09
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 20:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD1B10E101;
	Wed, 15 Jan 2025 19:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HIACCKFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A282210E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 19:55:14 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30613802a6bso1945161fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736970913; x=1737575713; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XJN5ebK7OW6iLbSLx/FF2q1Eia/Ds1oU8HSyiubQ6Ok=;
 b=HIACCKFx0/WqtoVQ2ypRp+jjJ3/ZRw8akvso2aKL1VBeeInbSeAyFqQnbAFeKV2J6/
 aGveGwnIxXWCpwLkF1Szse1kYO0BUmDbyE+Gos2W0/nPNIgcqg6Dpb+q63fjzoMZw29j
 8YlnZDMcX+1xv8gDr5dC4GfVGNhQvFqAg87rJUA06wrBy9jkJbQWVAVa9B/w8PYOGdNG
 lsfCDgHNlEMXl5BJXXtrQEKENhk85+oLj9hxShwLRJb18/1nuw6AyWonmyPBUMnRdVGT
 BtaLOHtAPqappikecYAksEZW1AY/gNTV7B8oltU0EAn2m6BhxEk0FHt+bkCq4872oTRo
 kV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736970913; x=1737575713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJN5ebK7OW6iLbSLx/FF2q1Eia/Ds1oU8HSyiubQ6Ok=;
 b=g8/9JNcwkHlDuuUgsXAlVzqySZIpMQy+E7xw+mSnLyPQ+ma/18z5FYU4Lw3a7Ol/1J
 lx/kwLxLWtoBrBRl0RmJGEH4ciUn33+MsjsiBmhbBtcQkgm3OLcsEklom+dpAERcwPDF
 Hu4bY5uQlxI3Mnc/71eNIM6ck1YhasuoFe5rZTFVUvJ9LBwBA7/fGpNU6inqcJx9JegK
 HqmT7JYV9TSYNKzJXxQEL09PKJGD1iDI7vRYjwYgl8zCApPeifgr0UNPwQ/aYKC/3jOH
 aMimmnAVGGh565vhjKFSGkkGbuOqivH/H5qW4DlcKhx3t3nEzk5xOBUuvMYp4tE0joXk
 P6QA==
X-Gm-Message-State: AOJu0YzUKisA97dpE2PabFImKUaRoaCujv4loUdQPrTWp7Pm7wDg7dtJ
 400oYLyBMUyJl84/SW4R5MWHpoot4bBrTWkQuw8PKHyJ1SsNQ3m0KYJMcbvXotw=
X-Gm-Gg: ASbGncviwS+YtILkBPjupALue0v5taO1IcD/SLIPXqHD9NMmCQrqBZYy4BgNW8hVS8L
 bL7Hx5wyxd4SGGhJCCrmF1uiErWJq3IWTPpGqPbBfWQc1/A0BGfsCxWzkqRq4wwNLzIGgor61fp
 jO8l2cuxdpc3BoS5bn5lv0rBmdl/9oitxzBsynGzwtOFLdwdJl8fHHaA1L2/LUOhDMvW5ubRvPP
 d/PRcJwzV8SzSlH6h+38bBr6qn0v8updxCKft+i5EHpkdCWF9NUSQ3fE/kJe9ZE4YtfK1WP/2Rk
 NHAtP1C52c7eWKdi7qr51jMqn142TpkcIeJy
X-Google-Smtp-Source: AGHT+IE0ugKkahzj0cfMJc+PsKKs96j5zkj6kkBcy/JRIV0NpqT2n3Lkf/N25YLPDxacK3DZ04wl7w==
X-Received: by 2002:a05:651c:2223:b0:2ff:a7c1:8c2e with SMTP id
 38308e7fff4ca-305f45f56a7mr107029291fa.28.1736970912660; 
 Wed, 15 Jan 2025 11:55:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7a9esm22963101fa.73.2025.01.15.11.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 11:55:11 -0800 (PST)
Date: Wed, 15 Jan 2025 21:55:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com, uma.shankar@intel.com,
 Importedfromf20241218-dpst-v7-0-81bfe7d08c2d@intel.com,
 20240705091333.328322-1-mohammed.thasleem@intel.com
Subject: Re: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Message-ID: <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-2-605cb0271162@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-dpst-v7-2-605cb0271162@intel.com>
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

On Fri, Jan 10, 2025 at 01:15:30AM +0530, Arun R Murthy wrote:
> ImageEnhancemenT(IET) hardware interpolates the LUT value to generate
> the enhanced output image. LUT takes an input value, outputs a new
> value based on the data within the LUT. 1D LUT can remap individual
> input values to new output values based on the LUT sample. LUT can be
> interpolated by the hardware by multiple modes Ex: Direct Lookup LUT,
> Multiplicative LUT etc
> The list of supported mode by hardware along with the format(exponent
> mantissa) is exposed to user by the iet_lut_caps property. Maximum
> format being 8.24 i.e 8 exponent and 24 mantissa.
> For illustration a hardware supporting 1.9 format denotes this as
> 0x10001FF. In order to know the exponent do a bitwise AND with
> 0xF000000. The LUT value to be provided by user would be a 10bit value
> with 1 bit integer and 9 bit fractional value.
> 
> Multiple formats can be supported, hence pointer is used over here.
> User can then provide the LUT with any one of the supported modes in
> any of the supported formats.
> The entries in the LUT can vary depending on the hardware capability
> with max being 255. This will also be exposed as iet_lut_caps so user
> can generate a LUT with the specified entries.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 50 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 7a7039381142bb5dba269bdaec42c18be34e2d05..056c2efef1589848034afc0089f1838c2547bcf8 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1367,6 +1367,17 @@ struct drm_mode_closefb {
>   */
>  #define DRM_MODE_HISTOGRAM_HSV_MAX_RGB			(1 << 0)
>  
> +/* LUT values are points on exponential graph with x axis and y-axis y=f(x) */

Huh?

> +#define DRM_MODE_IET_LOOKUP_LUT				(1 << 0)

Again, what is the reason for a shift? Can these values be OR'd?

> +/*
> + * LUT values, points on negative exponential graph with x-axis and y-axis
> + * y = y/x so upon multiplying x, y is obtained, hence multiplicative. The

Can't parse this sentence.

> + * format of LUT can at max be 8.24(8integer 24 fractional) represented by
> + * u32. Depending on the hardware capability and exponent mantissa can be
> + * chosen.

What does that mean? How is it choosen?

> + */
> +#define DRM_MODE_IET_MULTIPLICATIVE			(1 << 1)
> +
>  /**
>   * struct drm_histogram_caps
>   *
> @@ -1414,6 +1425,45 @@ struct drm_histogram {
>  	__u32 nr_elements;
>  };
>  
> +/**
> + * struct drm_iet_caps
> + *
> + * @iet_mode: pixel factor enhancement modes defined in the above macros
> + * @iet_sample_format: holds the address of an array of u32 LUT sample formats
> + *		       depending on the hardware capability. Max being 8.24
> + *		       Doing a bitwise AND will get the present sample.
> + *		       Ex: for 1 integer 9 fraction AND with 0x10001FF

?? Can hardware support 16.16? 32.0?

> + * @nr_iet_sample_formats: number of iet_sample_formsts supported by the
> + *			   hardware
> + * @nr_iet_lut_entries: number of LUT entries
> + */
> +struct drm_iet_caps {
> +	__u8 iet_mode;
> +	u64 iet_sample_format;
> +	__u32 nr_iet_sample_formats;
> +	__u32 nr_iet_lut_entries;
> +};
> +
> +/**
> + * struct drm_iet_1dlut_sample

Is it supposed to be used with DRM_MODE_IET_MULTIPLICATIVE only? Or is
it supposed to be used with DRM_MODE_IET_LOOKUP_LUT? In the latter case
what should be the iet_format value?

> + * @iet_mode: image enhancement mode, this will also convey the channel.
> + * @iet_format: LUT exponent and mantissa format, max being 8.24
> + * @data_ptr: pointer to the array of values which is of type u32.
> + *	      1 channel: 10 bit corrected value and remaining bits are reserved.
> + *	      multi channel: pointer to struct drm_color_lut
> + * @nr_elements: number of entries pointed by the data @data_ptr
> + * @reserved: reserved for future use
> + * @reserved1: reserved for future use
> + */
> +struct drm_iet_1dlut_sample {
> +	__u8 iet_mode;
> +	__u32 iet_format;
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +	__u32 reserved;
> +	__u32 reserved1;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
