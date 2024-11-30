Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8B9DEFA5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 10:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A551C10E398;
	Sat, 30 Nov 2024 09:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hsaOwrPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834CB10E397
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 09:43:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53df1e063d8so3272201e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732959799; x=1733564599; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CTGBtqe5NJuPcDpf6dQX3m2vAT1n9KYqpgUQSwBGip8=;
 b=hsaOwrPO2QYnU3VwkfOjKiO+K9OrsbJc4CbFutO87xFOwngpBOZov4sRtd2U7HQgzU
 1BXgYpu10dHr+tJYFzjkNhVW+ZKWJWry2n6yhG/a/wP0BDCLKKA7c9faia5BAw8ml6ko
 giEMYnYc15l50RQ4nJLI/gG+Jszh3kHSo44O122eRJAAoa541AIfWtdkEZmqCryapqSn
 lSBTlO1FmBypfxcqOHNl37Zv1H+UUu2mC9j5hBHuVMAs8Wl/VSCVbV7tdu7e/bSE+pm6
 9EfJ+4hnIGxNEbKHBz4FphYw93m1hwnP5M6LogTZ9UWr6ajAKFB5tfz65RAlZdXV1qh8
 6ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732959799; x=1733564599;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTGBtqe5NJuPcDpf6dQX3m2vAT1n9KYqpgUQSwBGip8=;
 b=Xt2r6B9dcIztY9oYDGXsjQa3ap36e0tXaDE9AxK6a6I/qGzx6UOQ+ru0iEVvAF06ub
 jfZDGso/bZHDIUYsZsVn/zZXGiJnpnBMhJt2r6Ak94TVP19G4z4CJdl4TrvFNZWMFqeK
 E/9GCVC8IJlABXHpHWrkwgphTIICBYAG91CJtDSc00/wLzrh+Isyzykw8AQpRNqLYQHR
 lYM5qE3EQwOlPgJGMyX8gL2U34SVo8izrHDBBnJweuR+XHhTr0o/YHg10l1D6ezEB8Ku
 ZU5oL24aiyoYJ5P6yfeKrbt7G1PtM6aA6MLl+w0FAS3Az1mEz8PP+gtbKc64HHSxDI6p
 T3fQ==
X-Gm-Message-State: AOJu0Ywff3TQ7n2prXfUKBdAEl968yAXoXry6VV9Fzz8/tJ39GdskEMp
 7LilUiBtZ2AGOn2oztUv5WWpbDgkHPHmforFxP6LbSFvEcKo84Aj+ZOt2E22Drk=
X-Gm-Gg: ASbGnctw1XVshdQ8q11APKCFfVUHrCgpgAR+DwUPdGvYZpWYLV6RcMtEEJRpKnN65ya
 JSVW51lKIwcDNA6lPJqGz+UjrrK13Hgx67d//A6xrU/pe+8ToU5c2SwDC/5PWb1bSI7+KgwXb6F
 8cnoAMtQqduibZXggYR6mDxekwOVnoBNvxS/AKtrRboT+T7bXpU2Q5m9eVZydpeFWxKEYxd25q5
 v2hnH+w2+DKva9YRKfAzEXqDEc3Eg13sK5snTq/KLvvK9QwpPSHskAYVPEKUoE6HA48bhbis6Vd
 VsOBd0rOknQGrp7NUu262xOj5Egztg==
X-Google-Smtp-Source: AGHT+IFuDWo+AA1UbdMQRc9r+KwOao8NefSFqqyTX0pSLZcVq04GBJO7eJY6YG6HIoN0U/cABkUg0A==
X-Received: by 2002:a05:6512:291:b0:53d:f09e:99b0 with SMTP id
 2adb3069b0e04-53df09e99f6mr6738623e87.0.1732959798660; 
 Sat, 30 Nov 2024 01:43:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64a0742sm725518e87.261.2024.11.30.01.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:43:17 -0800 (PST)
Date: Sat, 30 Nov 2024 11:43:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Uma Shankar <uma.shankar@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 harry.wentland@amd.com, 
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com
Subject: Re: [v2 05/25] drm: Add Color ops capability property
Message-ID: <5jv337lffqqkebsy4ttn62peqnb5a7d4igqe5fvgrzi2kkzjfk@vub74vxn2nqk>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-6-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126132730.1192571-6-uma.shankar@intel.com>
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

On Tue, Nov 26, 2024 at 06:57:10PM +0530, Uma Shankar wrote:
> Add capability property which a colorop can expose it's
> hardware's abilities. It's a blob property that can be
> filled with respective data structures depending on the
> colorop. The user space is expected to read this property
> and program the colorop accordingly.

If it's a blob, where is its contents documented? Also please point out
the non-IGT userspace implementation that uses the property.

> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  include/drm/drm_colorop.h         | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ba68358c0ffe..46cc7b0df6e8 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -780,6 +780,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>  		*val = state->size;
>  	} else if (property == colorop->data_property) {
>  		*val = (state->data) ? state->data->base.id : 0;
> +	} else if (property == colorop->hw_caps_property) {
> +		*val = state->hw_caps ?
> +			state->hw_caps->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 56b51fafebdf..58e5b87c6d56 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -146,6 +146,11 @@ struct drm_colorop_state {
>  	 * Number of entries of the custom LUT. This should be read-only.
>  	 */
>  	uint32_t size;
> +	/**
> +	 * @hw_caps:
> +	 *
> +	 */
> +	struct drm_property_blob *hw_caps;
>  
>  	/**
>  	 * @lut_3d_modes:
> @@ -297,6 +302,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *curve_1d_type_property;
>  
> +	/**
> +	 * @hwlut_caps_property:
> +	 *
> +	 * Property to expose hardware lut capbilities.
> +	 */
> +	struct drm_property *hw_caps_property;
> +
>  	/**
>  	 * @multiplier_property:
>  	 *
> -- 
> 2.42.0
> 

-- 
With best wishes
Dmitry
