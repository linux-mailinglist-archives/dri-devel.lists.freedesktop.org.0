Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F80CB292B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 10:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554B10E6BB;
	Wed, 10 Dec 2025 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLdR+ipE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C1810E6B6;
 Wed, 10 Dec 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765359329; x=1796895329;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zOZQlT4rxvyk0d1ao+ABfEzCrvi59RKp74O1nGwZt6Y=;
 b=cLdR+ipEN6lkmo6NH3VTCG9E5LcwzgIelFDliQgj7lKwEMwkPr+ZSh+c
 sWThPLUP+EOLY6spUvpKllKhNRNFZSfYOaaPn26zjoodPHZ9EQv2vOyNA
 CEvpfQFnr66mpULVtSMQHzyOEopxFL3OhViomQxk6gPIAX6husj7VUKpT
 lsQ47TMWrv4RxC1RgtgYlH8k9KeimpNoflybJP7ml2uPdCAbUQCxQJ2O5
 J1uk6aIvYxOrZS7NUn21LeFvmWh8GZ5UmNCRDEU1lTntI4SiERRq+HgPw
 uhFWmDRS7a41XbFMmrBpNa0GecXoEmkYzu7NGkB4WX193NTa7i6NMOysJ Q==;
X-CSE-ConnectionGUID: squckPtIREWsCs/gdiMb7A==
X-CSE-MsgGUID: r4St4wL6QvmEHa8EfpL0sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78439380"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78439380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:35:28 -0800
X-CSE-ConnectionGUID: wVS3WJZTQ/yQIOM+h4fZMA==
X-CSE-MsgGUID: 1qjda8zcTSW+nocuSeN1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200964287"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:35:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Arun R
 Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH [RESEND] v9 02/20] drm: Define histogram structures
 exposed to user
In-Reply-To: <20251202-dpst-v9-2-f2abb2ca2465@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
 <20251202-dpst-v9-2-f2abb2ca2465@intel.com>
Date: Wed, 10 Dec 2025 11:35:17 +0200
Message-ID: <cd27649875c6df08a1e1ff880a5343613d5bd96d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 02 Dec 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Display Histogram is an array of bins and can be generated in many ways
> referred to as modes.
> Ex: HSV max(RGB), Wighted RGB etc.
>
> Understanding the histogram data format(Ex: HSV max(RGB))
> Histogram is just the pixel count.
> For a maximum resolution of 10k (10240 x 4320 = 44236800)
> 25 bits should be sufficient to represent this along with a buffer of 7
> bits(future use) u32 is being considered.
> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
> bits, hence 32 bins.
> Below mentioned algorithm illustrates the histogram generation in
> hardware.
>
> hist[32] = {0};
> for (i = 0; i < resolution; i++) {
> 	bin = max(RGB[i]);
> 	bin = bin >> 3;	/* consider the most significant bits */
> 	hist[bin]++;
> }
> If the entire image is Red color then max(255,0,0) is 255 so the pixel
> count of each pixels will be placed in the last bin. Hence except
> hist[31] all other bins will have a value zero.
> Generated histogram in this case would be hist[32] = {0,0,....44236800}
>
> Description of the structures, properties defined are documented in the
> header file include/uapi/drm/drm_mode.h
>
> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index cbbbfc1dfe2b806c641c720b0215e825e350bd03..aa24fef15da708f3e6804d07ffae5b0312dfdce0 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1545,6 +1545,71 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>  
> +/**
> + * enum drm_mode_histogram
> + *
> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
> + * Maximum resolution at present 10k, 10240x4320 = 44236800
> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
> + * can be a u32 value.
> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
> + * If the most significant 5 bits are considered, then bins = 2^5
> + * will be 32 bins.
> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
> + * For illustration consider a full RED image of 10k resolution considering all
> + * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
> + * plane similarly with HDR the same would look like hist[65535] =
> + * {0,0,0,....44236800}
> + */
> +enum drm_mode_histogram {
> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
> +};
> +
> +/**
> + * struct drm_histogram_caps
> + *
> + * @histogram_mode: histogram generation modes, defined in the
> + *		    enum drm_mode_histogram
> + * @bins_count: number of bins for a chosen histogram mode. For illustration
> + *		refer the above defined histogram mode.
> + */
> +struct drm_histogram_caps {
> +	__u32 histogram_mode;
> +	__u32 bins_count;
> +};
> +
> +/**
> + * struct drm_histogram_config
> + *
> + * @hist_mode_data: address to the histogram mode specific data if any
> + * @nr_hist_mode_data: number of elements pointed by the address in
> + *		       hist_mode_data
> + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
> + * @enable: flag to enable/disable histogram
> + */
> +struct drm_histogram_config {
> +	__u64 hist_mode_data;
> +	__u32 nr_hist_mode_data;
> +	enum drm_mode_histogram hist_mode;
> +	bool enable;

enums for sure can't be used in UABI structs, and I don't think bools
either.

> +};
> +
> +/**
> + * struct drm_histogram
> + *
> + * @config: histogram configuration data pointed by struct drm_histogram_config
> + * @data_ptr: pointer to the array of histogram.
> + *	      Histogram is an array of bins. Data format for each bin depends
> + *	      on the histogram mode. Refer to the above histogram modes for
> + *	      more information.
> + * @nr_elements: number of bins in the histogram.
> + */
> +struct drm_histogram {
> +	struct drm_histogram_config config;
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

-- 
Jani Nikula, Intel
