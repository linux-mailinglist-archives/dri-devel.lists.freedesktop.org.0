Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD18DA27014
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 12:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AD210E31F;
	Tue,  4 Feb 2025 11:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TqTC07zT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B192110E31F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 11:17:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso33449025e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 03:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738667865; x=1739272665; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//Htk02SnQSST0sgWrnR1e9ytu0nhcLewwoj92Nb0ko=;
 b=TqTC07zTr0qqMqymwMO678lyyaFc3jRUVF5On0o1DhBPHyTr2FUHoNPw4Cqr/VhU0Z
 pHyEb9p5j2LNl0AoZWbcAXB88fbxTwiiW6tOcED+aOG85ZDLK3i+hd7X/3z5wYBGe2sf
 IJgKFnHY5V+0z03j20alwRlu+DUlDiISF04v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738667865; x=1739272665;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//Htk02SnQSST0sgWrnR1e9ytu0nhcLewwoj92Nb0ko=;
 b=RT5LRoFOMI6cKfFytnPFpUFua8wDaXDTO2OtQgI8Yy0OBwUXle2UWqg1lB/BNR+9d/
 CCvUhZMLuZWK87toQCBizfMQHWDduDznJKYdBJtoSmMsEb91zBg1QdGSA7khLTgajfPc
 rpsCkvUuIATAmTwlTQPeLkUMGpB58+FanTylHg+p2y8eQwvtyAws0OabhMQ0/sxU/tiX
 +wzCUL4f25TjaZ1B4t9tiWQ1MsxmOzn81R1CFpW2RvuenF1kd590K6AYeO7mHMasOZtm
 4pAhqNc4cBKmr7uDyQh0ZktvNkEO3n2NjlVJRXGXEbDc4PDPtn8LuoRUmKQjRDjKy4Yn
 8GIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxu6LgftU2tF+gKxN2jSgjTjnXMNZrP+l/B2BbiaBylVA+Du2x9bKQhhinaYhl8AWQ+B5x/GqlWcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyPTUV1avTQcmzvokwx4Pv35vcpxlTEfmkQopyMZLf6zvq3YTx
 YHWOJbNpyemhIaqiQRf3QsPrRiIRsDFgktBuZ3Caf1nHNIPvZscq8Ci+JvUmmx4=
X-Gm-Gg: ASbGnctoccFL55LSEV+IgTSufdLBGVYJTnk7cA0M568JY0/WsZnx15umHvzpahlERm0
 uYkMYB0Ln2iaLhxwmwPNmVOhhY6PYpoWE8QMEVPkL3hn9HWDepvbv466lNW816e/K4/fbJ86x29
 6ML8iOBDDU0UOeKXwRGpIBMhlZbTD36GfM3yLN0a4aJ7BYbN0O3bvK/FRoyCfpi9p9cWwzEn4x1
 iF0/Hp6r4Oq6Ut+9jPt5etkJvVu/M0ToOm6fcT/wG2sydVzrA1nng9C1vuU94iKBtS4Gyx4bbDk
 UWCetf3U/VkqOedYBeF5O2HPOTM=
X-Google-Smtp-Source: AGHT+IEWZ4GlFzKg2S8HMxS/drBNBOT7cVaWhl0e7SHsBvXNUeMpCGxdyfdxPeErUZInS29O4g+AbQ==
X-Received: by 2002:a05:600c:3505:b0:434:92f8:54a8 with SMTP id
 5b1f17b1804b1-43905f29411mr19756025e9.0.1738667864984; 
 Tue, 04 Feb 2025 03:17:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de016sm190037695e9.9.2025.02.04.03.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 03:17:44 -0800 (PST)
Date: Tue, 4 Feb 2025 12:17:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/tests: hdmi: Fix recursive locking
Message-ID: <Z6H3Vv872R9PARK6@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
 <20250129-test-kunit-v2-4-fe59c43805d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-4-fe59c43805d5@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Jan 29, 2025 at 03:21:56PM +0100, Maxime Ripard wrote:
> The find_preferred_mode() functions takes the mode_config mutex, but due
> to the order most tests have, is called with the crtc_ww_class_mutex
> taken. This raises a warning for a circular dependency when running the
> tests with lockdep.
> 
> Reorder the tests to call find_preferred_mode before the acquire context
> has been created to avoid the issue.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

On the last two patches: Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 114 ++++++++++-----------
>  1 file changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c265d28631603f266ba606564e77b8f965b7f83b..037c19875daf8b9b13e7702c8640dde1547f817c 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -291,16 +291,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_changed(struct kunit *test)
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -355,16 +355,16 @@ static void drm_test_check_broadcast_rgb_crtc_mode_not_changed(struct kunit *tes
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -420,17 +420,17 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode(struct kunit *test)
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -531,17 +531,17 @@ static void drm_test_check_broadcast_rgb_full_cea_mode(struct kunit *test)
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -646,17 +646,17 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode(struct kunit *test)
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_NE(test, drm_match_cea_mode(preferred), 1);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -766,16 +766,16 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -840,16 +840,16 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> @@ -914,16 +914,16 @@ static void drm_test_check_output_bpc_dvi(struct kunit *test)
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_FALSE(test, info->is_hdmi);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -958,17 +958,17 @@ static void drm_test_check_tmds_char_rate_rgb_8bpc(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_max_200mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1005,17 +1005,17 @@ static void drm_test_check_tmds_char_rate_rgb_10bpc(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1052,17 +1052,17 @@ static void drm_test_check_tmds_char_rate_rgb_12bpc(struct kunit *test)
>  	ret = set_connector_edid(test, conn,
>  				 test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz,
>  				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz));
>  	KUNIT_ASSERT_GT(test, ret, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1099,16 +1099,16 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
>  
>  	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	conn = &priv->connector;
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	/* You shouldn't be doing that at home. */
>  	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
> @@ -1164,23 +1164,23 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1233,13 +1233,10 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
> @@ -1249,10 +1246,13 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1295,13 +1295,10 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
>  	/*
>  	 * NOTE: We can't use drm_hdmi_compute_mode_clock()
> @@ -1311,10 +1308,13 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
>  	 * Thus, we have to calculate the rate by hand.
>  	 */
>  	rate = mode->clock * 1500;
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
> @@ -1356,13 +1356,10 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that YUV422 would be the preferred option
> @@ -1377,10 +1374,13 @@ static void drm_test_check_output_bpc_format_driver_rgb_only(struct kunit *test)
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1423,13 +1423,10 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that YUV422 would be the preferred option
> @@ -1444,10 +1441,13 @@ static void drm_test_check_output_bpc_format_display_rgb_only(struct kunit *test
>  	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>  
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1489,23 +1489,23 @@ static void drm_test_check_output_bpc_format_driver_8bpc_only(struct kunit *test
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that we have headroom on the TMDS character
>  	 * clock to actually use 12bpc.
>  	 */
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> @@ -1549,23 +1549,23 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
>  
>  	info = &conn->display_info;
>  	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>  	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>  
> -	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> -
>  	preferred = find_preferred_mode(conn);
>  	KUNIT_ASSERT_NOT_NULL(test, preferred);
>  
>  	/*
>  	 * We're making sure that we have headroom on the TMDS character
>  	 * clock to actually use 12bpc.
>  	 */
>  	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_RGB);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
>  	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
>  	KUNIT_ASSERT_NOT_NULL(test, conn_state);
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
