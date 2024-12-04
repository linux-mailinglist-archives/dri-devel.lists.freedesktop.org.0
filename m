Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A39E392D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5B10E34D;
	Wed,  4 Dec 2024 11:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gzbsbRSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AF010E1ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 11:47:15 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53de84e4005so7788310e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 03:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733312834; x=1733917634; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EefnXY6QamhbW1Cqp0ryQNZbJS/xfyCanrgB5ex+q3A=;
 b=gzbsbRSHL50AFpOzqdKmkAd2OORQ/KJ2wXrR+b3eXjjs0HwuXOt+dX/2L9SBNHmvhM
 oeSMSVkcxP3iJNIZwj1aBP7yryKKkpTpIqAB2EQk49/EvN3pKBn1cGnXtXUuLZ6/MJfw
 XhFJnTQHXwUM1KQrRTcMqFngqUp3Phy/CHN4UkOSC1imZXuoCtE2Hw5AzRG7lAF/h1Ur
 aXHf3pTUkOQeLI5p0c86IX2x9gjZyz2/+YglU9+8Fala55QRFSz2KQfG43W7VM0ODwtV
 f+bAxjWQY45lzR0EjEq6lr7pJsWhm0kDju3rfAbIkzylmDizsOTwUUQKm+C/AG27oAa5
 2J8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733312834; x=1733917634;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EefnXY6QamhbW1Cqp0ryQNZbJS/xfyCanrgB5ex+q3A=;
 b=tZHvO13sOehJo1W8VR3vsrpAU5gpYwJZROBT5Zu8CQZU5ANpoj2NMHKK54HWLrRdPy
 FKH8UzFasHumXYhntQMRGBM3QTUivpuTUcG3Ni27+oehGJI7Ng3hmXCLarfEH9YmTx1+
 Iik7hpibpJZcmphDQo+pnwFuUc4/3hPmFAhh1ei5YxKR4cEsB5Ff03/oA7gb+Sr4QLk4
 /JO5gDa6wJLL1MbKUyU/XFEDkNtHr//bUQv6ZNrXzKUMFCEepjS2TBf855GruiQlWSWI
 mvaWlPsKR5T90LoOdh3h68HemHuyJfuz3dRR+gCLePJSp53V3IzcZF421SXMlSerAIif
 09CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC8KPwMr9Dzq6vksGNCYEKJ8QoUCfLYEV+dkEYVhrPmAaWiP6mt1JCFNg62eAdG0jpP8S/KYD0bnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg/yYCznVwcDJgFS9KjgN/OmsAy1GOsmZoigkIh5MYiCi12pjc
 jARoYVNhqJg29PC1E3Q2nzJwBI4ZZxGDf4bTfVfymddz0YpzZbLyriMhJL45OkM=
X-Gm-Gg: ASbGncsi8BE4Ax9uCT/fbWcEJVzCv93zjFEkGOn9ufLsXeImFvroeSRUZFXaZCT7eWg
 YRkZS9ybEquGX2i9Mofq7wVlgmj/UCSgNDpaRWV25zaF+jA4E70opRkozcb2So/AL9E3/fL657R
 D33IatgBcPlo82RZkbxjmVsHsbLntsMJYFbJnF3201Bh0Nw3mhUAU08adtUu3gEZZYOMgEH4Mrg
 rVaQmoN/OEyU3+wCAo7TECdVYj/awMPUkwh7JFeAVKvqjPAAslobva1mTq3ymvBVb99VFPX/TsE
 0aw56DehkDTgN1RdOeSGrokXcTtL/w==
X-Google-Smtp-Source: AGHT+IFdkOcGVwBPkxqcYfmhUEnS9dg2Mn9Y4BHewEf2II6V2aoyM6PU56AKc71W0jwu7483SSlO+Q==
X-Received: by 2002:a05:6512:3082:b0:53d:e8ed:2172 with SMTP id
 2adb3069b0e04-53e129f4d0cmr3503792e87.14.1733312833860; 
 Wed, 04 Dec 2024 03:47:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496a10sm2144272e87.203.2024.12.04.03.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 03:47:12 -0800 (PST)
Date: Wed, 4 Dec 2024 13:47:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv2 01/10] drm/crtc: Add histogram properties
Message-ID: <s3gkb36ga2pxmxocrhcjp5pcgbewx4x3joiyrpld3th4r4fvyi@rkpgbu4ekst3>
References: <20241204091456.1785858-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204091456.1785858-1-arun.r.murthy@intel.com>
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

On Wed, Dec 04, 2024 at 02:44:56PM +0530, Arun R Murthy wrote:
> Add variables for histogram drm_property, its corrsponding crtc_state
> variables and define the structure pointed by the blob property.
> struct drm_histogram defined in include/uapi/drm/drm_mode.h
> The blob data pointer will be the address of the struct drm_histogram.
> The struct drm_histogram will be used for both reading the histogram and
> writing the image enhanced data.
> struct drm_histogram {
> 	u64 data_ptr;
> 	u32 nr_elements;
> }
> The element data_ptr holds the address of the histogram statistics data
> and 'nr_elements' represents the number of elements pointed by the
> pointer held in data_ptr.
> The same element data_ptr in teh struct drm_histogram when writing the
> image enahnced data from user to KMD holds the address to pixel factor.
> 
> v2: Added blob description in commit message (Dmitry)

No, it is not a proper description. What is the actual data format
inside the blob? If I were to implement drm_histogram support for e.g.
VKMS, what kind of data should the driver generate? What is the format
of the response data from the userspace app? The ABI description should
allow an independent but completely compatible implementation to be
written from scratch.

BTW: something is really wrong with the way you are sending the
patchset. For this iteration I see only two patches with no threading.
Please stop playing with individual versions of the patches, generate
and send the patchset via a single invocation of git send-email (or git
format-patches / git send-email). The version is a version of the
patchset, not some other number. You can use the b4 tool which can
handle everything for you.

> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/drm/drm_crtc.h      | 48 +++++++++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h | 11 +++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..3984cfa00cbf 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,38 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *gamma_lut;
>  
> +	/**
> +	 * @histogram_enable:
> +	 *
> +	 * This will be set if histogram is enabled for the CRTC.
> +	 */
> +	bool histogram_enable;
> +
> +	/**
> +	 * @histogram_data:
> +	 *
> +	 * This will hold the pointer to the struct drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram data generated by the hardware.
> +	 */
> +	struct drm_property_blob *histogram_data;
> +
> +	/**
> +	 * @histogram_-iet:
> +	 *
> +	 * This will hold the pointer to the struct drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram image enhancement generated by the algorithm that is to
> +	 * be fed back to the hardware.
> +	 */
> +	struct drm_property_blob *histogram_iet;
> +	/**
> +	 * @histogram_iet_updates:
> +	 *
> +	 * Convey that the image enhanced data has been updated by the user
> +	 */
> +	bool histogram_iet_updated;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> @@ -1088,6 +1120,22 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
>  
> +	/**
> +	 * @histogram_enable_property: Optional CRTC property for enabling or
> +	 * disabling global histogram.
> +	 */
> +	struct drm_property *histogram_enable_property;
> +	/**
> +	 * @histogram_data_proeprty: Optional CRTC property for getting the
> +	 * histogram blob data.
> +	 */
> +	struct drm_property *histogram_data_property;
> +	/**
> +	 * @histogram_iet_proeprty: Optional CRTC property for writing the
> +	 * image enhanced blob data
> +	 */
> +	struct drm_property *histogram_iet_property;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..da4396f57ed1 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1355,6 +1355,17 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_histogram
> + * data_ptr: pointer to the array fo u32 data. This data can be histogram
> + * raw data or image enhanced data
> + * nr_elements: number of elements pointed by the data @data_ptr
> + */
> +struct drm_histogram {
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
