Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986CA2700C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 12:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3769A10E09A;
	Tue,  4 Feb 2025 11:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="klytgAJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983B110E09A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 11:15:46 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4361c705434so40200795e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 03:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738667745; x=1739272545; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2SfD4Gn61MFQawkBcj2q/218D2jiOKMHITzYwMlqEs=;
 b=klytgAJ+IglJKS7DH9Ljj+8lykjyoASBfcwFG2dnkIRAlIeSLKwnDg+ORIT2KDtcaM
 hFygDStOEEzDc84YbGn4cLxae7kdpQx/w3myziVUTmx+c/T3HbPHFopK9VaCxGmvuxtl
 R09/iuYe+BPpISiMol5gp9HkhLnsopOhd16GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738667745; x=1739272545;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s2SfD4Gn61MFQawkBcj2q/218D2jiOKMHITzYwMlqEs=;
 b=bHm9zYTV8NYF4I6JxQZIIyY4usp9IKcx3v3MB/KgbUD+7o+toIP1SyJdOKTUI47wSW
 3jP9U6Ju1AKRSOCl2VglZhP1ioOqk8Y7/qx7zZVIGe4nx38A2sd5Afaer1TCwnLTrTdx
 yGM1tV3MO/cUODZPWxePgph3ChllUj+UZPxLHwwn0m7IJ4suA/8mEzgVykP/xUkNKMu1
 +USTOEFvUGbGn6uF4B+XZDAIrwD17E2Jgv0r/iHZYv23QbnFC/68TM5o4eaLMaznU4Bv
 AlUY5xWq7i1gFSUgalMPpdutvGDGfygc/VmYKlygl59Jg+SXEfiZfG5nL+/VaedRINwY
 CjHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFI/Lap1GxjZT6sDBl7NqemlZLs77ZamhusU0dvXoH8kmJm+JRx9oPuHbh1Ta/M3gRAaOMPvSAjgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI0foQxs6syG2t8okaOsSiyKVPTHRq0p82aXueLLT+gEXCOs6c
 qMN38d/sseli5dMPXI0vDEJThLWayX10TZv8Dn7bn4pBBize616XCXjkl4LGYf8=
X-Gm-Gg: ASbGnctcjz5s68CGNQ9ICakxQ1aSJKd0xW/aLGkiJNDOYZtxSBFeAcJc1TFxWa37aNF
 zmTMKLBlUt77zsmYEqeQtEjQjGnp2vG1mJLmD+1w8KNVwhvUzd2u8v6ApZimOwLaSFbN+BFkRzq
 FuusRCPFN6ito+mjdhUJ6x8n2OBGJRknF+jGGBdEtzYacqUjXZBkUulnxljr5zOt/f5mzFaiObx
 0btkdySFFjgUNkcfuxfK1ZhrB8iQj43iL6lMdJbbElIna5PLHxWYw0opFWS3F3d5jw0iVLIiGYV
 h+hgGKjHGrKAcT4cfU7E7vzolWI=
X-Google-Smtp-Source: AGHT+IEhi3bvOg4+34PKysGfB6hzTPcUQgampsEPyThrWoRpNZx+SHoGK/R2iUfFL+AtOAeSuipPlA==
X-Received: by 2002:a5d:5f82:0:b0:385:f060:b7fc with SMTP id
 ffacd0b85a97d-38c51960052mr23268766f8f.25.1738667744860; 
 Tue, 04 Feb 2025 03:15:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm183097995e9.33.2025.02.04.03.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 03:15:44 -0800 (PST)
Date: Tue, 4 Feb 2025 12:15:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/tests: hdmi: Remove redundant assignments
Message-ID: <Z6H23pkOfcQb8-PP@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
 <20250129-test-kunit-v2-2-fe59c43805d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-2-fe59c43805d5@kernel.org>
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

On Wed, Jan 29, 2025 at 03:21:54PM +0100, Maxime Ripard wrote:
> Some tests have the drm pointer assigned multiple times to the same
> value. Drop the redundant assignments.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index e814b538c46c4d342604436beca64ac0bdb31526..32e0477deb45c1481a7d23bb6e6a74de52845d1c 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -479,11 +479,10 @@ static void drm_test_check_broadcast_rgb_auto_cea_mode_vic_1(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> @@ -593,11 +592,10 @@ static void drm_test_check_broadcast_rgb_full_cea_mode_vic_1(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> @@ -709,11 +707,10 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>  
>  	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 1);
>  	KUNIT_ASSERT_NOT_NULL(test, mode);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> @@ -1311,11 +1308,10 @@ static void drm_test_check_output_bpc_format_vic_1(struct kunit *test)
>  	 * Thus, we have to calculate the rate by hand.
>  	 */
>  	rate = mode->clock * 1500;
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>  
> -	drm = &priv->drm;
>  	crtc = priv->crtc;
>  	ret = light_up_connector(test, drm, crtc, conn, mode, ctx);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	conn_state = conn->state;
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
