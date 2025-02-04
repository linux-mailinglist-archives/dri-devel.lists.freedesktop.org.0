Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC74A26FBD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 12:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1873510E5EB;
	Tue,  4 Feb 2025 11:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TL9I8/Pn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EAA10E5EB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 11:01:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so63060135e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 03:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738666909; x=1739271709; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RRHdA8PEvlS1K4N8G9kevaoe1zJxa3+4zL3bWQzDDc=;
 b=TL9I8/Pn9W+WP2QUU19bj3vQQLxx0UWgiooALQfc9us9ariC3GMJTJEFwd2acOJI/x
 8/KMZ23llRlZ1HRmQLXZSCO+LxZE5ru2hByp/K25KZTGS6ss/wqEeBx2m5f1jIEr6k5s
 v7WPzEsnRCESGATxhrKepp8Sl+/ikmljPtDZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738666909; x=1739271709;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4RRHdA8PEvlS1K4N8G9kevaoe1zJxa3+4zL3bWQzDDc=;
 b=eJNk5wB0nqYS/s/pSIW9qxR8BXyfoKtxpO04dV9OnA5LKAqR3ie+q7hHRv9+Ncutnu
 nIMIJbFUfnj69OVEbzn4D5y6dtr0xYP20jN20w//1peDjbx6aGJaoTHtg8E3FYHslU5j
 o242ky39CVQciG11VRTouwVdcMJVGvGuL42Nf/t6sCXu46UnmeC9VqgQslwH/Avk6A07
 u2y7A8NwHW6gEpSfdKSrP/+DP2g//ChTU9oaoksCWDrSBORd3C3etth8PtY7n+GRDfsA
 AqLsMr6meS2zetHhhJ3kxpxBq4K7xgg07PBsp6Q4XgRFwiZPr8py+1WlMlEVJTWDlz08
 yTuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL6vtw5/BYqgsF6fE7F7iIVIjsaQfMKr7o8bMap7XtzeEuu4eFQ2uFC1TX4u9Mx1IHzMQAq+Nnp7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysYPHL6OJq23X8Lbe2+OcBqORa8AiVIdAZ7t1daW9cVUdpGH04
 LdGMur13wTkgm7QHr0ECdVzrPUzjIGbTwi2E/s8CcWBzz3sO0x+dJbExJv8TgNCi/ybJ4WqE5Lp
 j
X-Gm-Gg: ASbGncsCxZVOSCy3koyJnCCsNrAlQm61Lhr8Yst7Yoi7dj4HDX5gYEZofc2ILY0dLig
 kLoN+HOT2gsJ2S3knv6vLMX/1yjnw5HVHsYJsWs6FuGlG905DGv1pz3pXHOqjpOSJNYTJSeikHe
 3BXKxttbBGqKFoynNgB/aeJrfnVH6jJcTSe6iHjZrlc/S/tp5C6Xco6FSr4/jI39Kd2Zm+hvKXa
 brnceWmmXlO6xKXSs27K/G2EzsdjzuUFE6ObEw2+g9Qzx1/cXzhpz1K2InMAaL5na2Z/E39+g3j
 k5PMjd9YcNnFKRYNljj3ixMTAa8=
X-Google-Smtp-Source: AGHT+IE4tbTEBtOtOWfRx+wMuOIFvnqto2qUCCNbXg7ebOju1AxB69qu9Dm54X12CZTRq0bm1g4AuQ==
X-Received: by 2002:a05:600c:4594:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-438dc435389mr221006195e9.31.1738666909046; 
 Tue, 04 Feb 2025 03:01:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de35csm185128975e9.10.2025.02.04.03.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 03:01:48 -0800 (PST)
Date: Tue, 4 Feb 2025 12:01:46 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
Message-ID: <Z6HzmlUR1gdXJqXZ@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
 <20250129-test-kunit-v2-1-fe59c43805d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-1-fe59c43805d5@kernel.org>
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

On Wed, Jan 29, 2025 at 03:21:53PM +0100, Maxime Ripard wrote:
> The light_up_connector helper function in the HDMI infrastructure unit
> tests uses drm_atomic_set_crtc_for_connector(), but fails when it
> returns an error.
> 
> This function can return EDEADLK though if the sequence needs to be
> restarted, and WW_MUTEX_SLOWPATH is meant to test that we handle it
> properly.
> 
> Let's handle EDEADLK and restart the sequence in our tests as well.
> 
> Fixes: eb66d34d793e ("drm/tests: Add output bpc tests")
> Reported-by: Dave Airlie <airlied@gmail.com>
> Closes: https://lore.kernel.org/r/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
> Link: https://lore.kernel.org/r/20241031091558.2435850-1-mripard@kernel.org
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c3b693bb966f1f8b04066d19f520bfa4bf11c23d..e814b538c46c4d342604436beca64ac0bdb31526 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -68,14 +68,21 @@ static int light_up_connector(struct kunit *test,
>  	int ret;
>  
>  	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>  
> +retry:
>  	conn_state = drm_atomic_get_connector_state(state, connector);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
>  
>  	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(ctx);
> +		if (!ret)
> +			goto retry;
> +	}

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
>  	crtc_state = drm_atomic_get_crtc_state(state, crtc);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
>  
> 
> -- 
> 2.47.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
