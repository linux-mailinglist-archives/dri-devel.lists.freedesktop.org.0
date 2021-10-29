Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8B43F40F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 02:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8F16E96B;
	Fri, 29 Oct 2021 00:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C284B6E959
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 00:42:23 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id bp7so2512777qkb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 17:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wk10kPylzBJAVzPjmuOajrIPnS3gajWmticxWTOdCuY=;
 b=UbAcK1rAc/ZIqWaaPEXhVFTwgPW8BtT5uQ8dGUkH61jG8rRp5vvh4wNS5S4TYbaKTl
 M2cp+j9/QV33S23r0odikBILIduyC+WGtPUiWYgiCBq7mGbHifDzz1rZZ4uE9wDE1gnw
 q4GuSwKQ6o8lhL6CFTKh7LIqeVwAVOj/hPPC45mDJtkVEtRo7Ci7rcgtEVPaj+nu0TY+
 STgzmS9/UzOCMwr7QuN217+UUyfZKxYr0TQcRFLPNacVmrZHBEVuLDjI4cLkUUnPE8nf
 NaenDDVwI9G8L5qfwzzAnP8z/eCS2vuHm6Q5Z9012iopBJOVnb/rnaWloXy6WXgxbpSg
 8/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wk10kPylzBJAVzPjmuOajrIPnS3gajWmticxWTOdCuY=;
 b=y+7ePkdZTtMNtKvSUBCKEyQI1Op0HVptjM7SLXobmSYWZ5ZVF2KQiJ97sZHztoRZcm
 pZQgC4xBZDGEJNvbFT8Wkm1nKglYDUj2FjRAcU2JXmec9UFGIw88IbpuWNV78B6gtoQg
 NthYem1YCceK8e2Yy1NJ7FfD8VQiMp76rzCfT5vwXE6BSNCv14854vihstyTZEtvMAEJ
 PlJzSJlrJoU7viPEDHKxp5ySiEhYiqunurrepH4drP/dtZXJIi0Fv+plnU8YZyGmFBX3
 erBtWJleLrZvINyVPzW29T2uN9xIQILp4YEzQbVCIOjolEufoscV4QL7SynzbDgkcK0+
 FcKA==
X-Gm-Message-State: AOAM533Bn6VXps3M6CTlckU73H7bIKflUKfM5Oe2sDGtSBoLDSK3UWfR
 qUNF3b4aG23BT2JhVnuq/ECYwA==
X-Google-Smtp-Source: ABdhPJxV670d+nO1mBi8BXtGvwgleipuVr6xHBTlgZ0eFfTCnePRbf6oyR5UrIWB5wpz+O69dy68Vg==
X-Received: by 2002:a37:8244:: with SMTP id e65mr6246239qkd.141.1635468141844; 
 Thu, 28 Oct 2021 17:42:21 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id bs34sm3043788qkb.97.2021.10.28.17.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:42:21 -0700 (PDT)
Date: Thu, 28 Oct 2021 20:42:20 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de,
 Mark Yacoub <markyacoub@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm: Rename lut check functions to
 lut channel checks
Message-ID: <20211029004220.GA10475@art_vandelay>
References: <20211026192104.1860504-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026192104.1860504-1-markyacoub@chromium.org>
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

On Tue, Oct 26, 2021 at 03:21:00PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> This function and enum do not do generic checking on the luts but they
> test color channels in the LUTs.

I'm not sure there's anything inherently specific to channels, it seems like
one could add a new test to reflect a HW limitation and it would fit pretty well
in the lut check function. I wonder if it would be better to expose the types of
tests required by the crtc such that the atomic_check could also do the test?

Sean

> Keeping the name explicit as more generic LUT checks will follow.
> 
> Tested on Eldrid ChromeOS (TGL).
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c           | 12 ++++++------
>  drivers/gpu/drm/i915/display/intel_color.c | 10 +++++-----
>  include/drm/drm_color_mgmt.h               |  7 ++++---
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index bb14f488c8f6c..6f4e04746d90f 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -585,17 +585,17 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>  EXPORT_SYMBOL(drm_plane_create_color_properties);
>  
>  /**
> - * drm_color_lut_check - check validity of lookup table
> + * drm_color_lut_channels_check - check validity of the channels in the lookup table
>   * @lut: property blob containing LUT to check
>   * @tests: bitmask of tests to run
>   *
> - * Helper to check whether a userspace-provided lookup table is valid and
> - * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
> - * the tests in &drm_color_lut_tests should be performed.
> + * Helper to check whether each color channel of userspace-provided lookup table is valid and
> + * satisfies hardware requirements. Drivers pass a bitmask indicating which of in
> + * &drm_color_lut_channels_tests should be performed.
>   *
>   * Returns 0 on success, -EINVAL on failure.
>   */
> -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
> +int drm_color_lut_channels_check(const struct drm_property_blob *lut, u32 tests)
>  {
>  	const struct drm_color_lut *entry;
>  	int i;
> @@ -625,4 +625,4 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_color_lut_check);
> +EXPORT_SYMBOL(drm_color_lut_channels_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index dab892d2251ba..4bb1bc76c4de9 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1285,7 +1285,7 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>  	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
>  	const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
>  	int gamma_length, degamma_length;
> -	u32 gamma_tests, degamma_tests;
> +	u32 gamma_channels_tests, degamma_channels_tests;
>  
>  	/* Always allow legacy gamma LUT with no further checking. */
>  	if (crtc_state_is_legacy_gamma(crtc_state))
> @@ -1300,15 +1300,15 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>  
>  	degamma_length = INTEL_INFO(dev_priv)->color.degamma_lut_size;
>  	gamma_length = INTEL_INFO(dev_priv)->color.gamma_lut_size;
> -	degamma_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> -	gamma_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
> +	degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> +	gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>  
>  	if (check_lut_size(degamma_lut, degamma_length) ||
>  	    check_lut_size(gamma_lut, gamma_length))
>  		return -EINVAL;
>  
> -	if (drm_color_lut_check(degamma_lut, degamma_tests) ||
> -	    drm_color_lut_check(gamma_lut, gamma_tests))
> +	if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
> +	    drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
>  		return -EINVAL;
>  
>  	return 0;
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 81c298488b0c8..cb1bf361ad3e3 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -94,12 +94,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>  				      enum drm_color_range default_range);
>  
>  /**
> - * enum drm_color_lut_tests - hw-specific LUT tests to perform
> + * enum drm_color_lut_channels_tests - hw-specific LUT tests to perform
>   *
>   * The drm_color_lut_check() function takes a bitmask of the values here to
>   * determine which tests to apply to a userspace-provided LUT.
>   */
> -enum drm_color_lut_tests {
> +enum drm_color_lut_channels_tests {
>  	/**
>  	 * @DRM_COLOR_LUT_EQUAL_CHANNELS:
>  	 *
> @@ -119,5 +119,6 @@ enum drm_color_lut_tests {
>  	DRM_COLOR_LUT_NON_DECREASING = BIT(1),
>  };
>  
> -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
> +int drm_color_lut_channels_check(const struct drm_property_blob *lut,
> +				 u32 tests);
>  #endif
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
