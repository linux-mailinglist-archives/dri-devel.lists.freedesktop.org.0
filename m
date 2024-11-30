Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4139DEF9E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 10:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC7F10E393;
	Sat, 30 Nov 2024 09:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tA08bMJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE410E393
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 09:38:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53df19bf6a9so3148604e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732959488; x=1733564288; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rXbDCCZyHLHcmMdbmbUACkYa+PAWDK6pAgsVmGxmS7E=;
 b=tA08bMJLIcHaSOH3/BnLTry7PkgZCPtO4wTqyx4xbT995gUVHSx7IUrZSyOvsaFnir
 JezdWhk5rnijvzffjnxMTtXU5t6taapPgh7NIaOm7vyLnMnjubx227O27Jkfm0+fAf4i
 JTCa8DRz5N/R0wp7PDaJPA5yuNGfVU6Fk+UsLXkIYZuiSjD4djEBIV4P6TIkMdOguZNB
 eLHjhoN9EiXI5rKF0RYkFJZX+lJt1l8zWYIomd9l1hDQ0ScpbxQGDKakg9Rj8KvghXdo
 zmPa59FnZyzoquKvxqtjwHXr3IX1CXtcF3tLa1gc0HEs8NnDTXDMkc+wqvBQREGkH9op
 qz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732959488; x=1733564288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXbDCCZyHLHcmMdbmbUACkYa+PAWDK6pAgsVmGxmS7E=;
 b=SrAzvUrKSn2jn406emMa7UzzWcJxbGJUKC9qIra/lzRmQjsd5c0jLs1nGNRDU5yemp
 tihEZhu5FRxhVSc2KFM2IuJsMPct7A5Odw3/hXbV5a2WGeySD0yWJgYIJ5uX64114u83
 YS+UqdGADwetOwqLcIKsn0HFDL+7rqHQSynTh+D3nKuOdZGh7mluICyqr8AJqteB0SpB
 f9gu3Ddtd8o7up1q9zf1zB8RocRaFwYJ1BoAIq+VM+8LvxRfq12j8PnohZQW8Rr9Thb3
 QK/xdtU4XtzOePl8eA2HUHqzKUTX7ydfYpuiOOtMXUhWr/inA3J8E7s7FbDj+al2pYFj
 tHFg==
X-Gm-Message-State: AOJu0YylpGsKdoTMo6NW5UDh/dErcnS+1UyTE8lAeIVy8rdjB7tYH9fE
 GOBs14AHw8HLG9F47M2mHxv5sh0s6ZQOne/wKXeUloXM2AACk/j3f4baDRllMYY=
X-Gm-Gg: ASbGncspsyQW7KIvgzDABqCheKxEEwDf3jqpUn9K4Hjuhpdd7wqqgy899PyhdzJsL6A
 nesjEv6IU4riXPuLxO1T4C+ZE3yQamC48bcaQpkDYUdnXVCnad4EeaXFt6Seinekdg619e4nk8r
 +UfUKzxKtu++m3QM/wJ93d7YqqoNNZAV0urmKIlB46O5tjGO7T8lFD7TOWLwlRVBc66dP+rk4NY
 eJ4Sht0oIYO39MIcOJku50nNc7iPHDakTA7ZwYw5B6Noqq2dNU4UIQx+0+adRDsDGgRY13XOwKH
 Z3OOX7eHSW39VZb0xvqwp9VG+lvqmw==
X-Google-Smtp-Source: AGHT+IEwCyy0WLYAusUAieyWyy7Z2W/Lw9UaoxPrndoadcpQX8tCHP7mp6kBuNlB8fMn/6H2hs0LBA==
X-Received: by 2002:a05:6512:3f1f:b0:53d:d3ff:77f6 with SMTP id
 2adb3069b0e04-53df010900cmr9843422e87.46.1732959488071; 
 Sat, 30 Nov 2024 01:38:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6443199sm721008e87.98.2024.11.30.01.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:38:06 -0800 (PST)
Date: Sat, 30 Nov 2024 11:38:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Uma Shankar <uma.shankar@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 harry.wentland@amd.com, 
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [v2 02/25] drm: Add support for 3x3 CTM
Message-ID: <yalwndln5a7apkfj27txgbvwxjgfhdut27wlor6wm6pn2slx7m@jjm6rwfjbfdc>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-3-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126132730.1192571-3-uma.shankar@intel.com>
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

On Tue, Nov 26, 2024 at 06:57:07PM +0530, Uma Shankar wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Add support for 3x3 Color Transformation Matrices in Color Pipeline.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  3 +++
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  drivers/gpu/drm/drm_colorop.c     | 29 +++++++++++++++++++++++++++++
>  include/drm/drm_colorop.h         |  2 ++
>  include/uapi/drm/drm_mode.h       |  8 ++++++++
>  5 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3161e2ab4efc..8a75f4a0637a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -802,6 +802,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>  		drm_printf(p, "\tinterpolation=%s\n", drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
>  		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
>  		break;
> +	case DRM_COLOROP_CTM_3X3:
> +		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
> +		break;
>  	case DRM_COLOROP_CTM_3X4:
>  		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
>  		break;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index d6c71135f290..ba68358c0ffe 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -708,6 +708,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
>  	case DRM_COLOROP_CTM_3X4:
>  		size = sizeof(struct drm_color_ctm_3x4);
>  		break;
> +	case DRM_COLOROP_CTM_3X3:
> +		size = sizeof(struct drm_color_ctm);
> +		break;
>  	case DRM_COLOROP_3D_LUT:
>  		index = state->lut_3d_mode_index;
>  		if (index >= (state->lut_3d_modes->length / sizeof(struct drm_mode_3dlut_mode)))
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index fd1cd934df48..a427cfc5bbbc 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -315,6 +315,35 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
>  }
>  EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
>  
> +/**
> + * drm_colorop_ctm_3x3 - Initialize a DRM_COLOROP_CTM_3X3

Please build with W=1 to trigger kerneldoc warnings. Here the prototype
in the doc comment doesn't match the actual function name.

> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @allow_bypass: true if BYPASS property should be created, false if bypass of
> + *                this colorop is not possible
> + * @return zero on success, -E value on failure
> + */
> +int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			     struct drm_plane *plane, bool allow_bypass)
> +{
> +	int ret;
> +
> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X3, allow_bypass);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_ctm_3x3_init);
> +
>  /**
>   * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index bf5117f30c80..56b51fafebdf 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -377,6 +377,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
>  				  struct drm_plane *plane, uint32_t lut_size,
>  				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
>  				  bool allow_bypass);
> +int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			     struct drm_plane *plane, bool allow_bypass);
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass);
>  int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 290c2e32f692..a4a7ab689631 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -905,6 +905,14 @@ enum drm_colorop_type {
>  	 */
>  	DRM_COLOROP_CTM_3X4,
>  
> +	/**
> +	 * @DRM_COLOROP_CTM_3X3:
> +	 *
> +	 * A 3x3 matrix. Its values are specified via the
> +	 * &drm_color_ctm struct provided via the DATA property.
> +	 */
> +	DRM_COLOROP_CTM_3X3,
> +
>  	/**
>  	 * @DRM_COLOROP_MULTIPLIER:
>  	 *
> -- 
> 2.42.0
> 

-- 
With best wishes
Dmitry
