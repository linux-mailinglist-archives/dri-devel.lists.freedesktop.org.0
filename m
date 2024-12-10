Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C29EBB9D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 22:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A13D10E980;
	Tue, 10 Dec 2024 21:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T5yWyOSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A9310E98A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 21:10:55 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-540215984f0so2318255e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 13:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733865053; x=1734469853; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4avOkLXXt+xxKkyvs53K/A4cLhmGU1rYalWmIxSH5lY=;
 b=T5yWyOSy78g1HZW8FVsacRt/txgULfpRa2kvwG4SCP3ZieE5cqvLg3IVV5YpOimEfl
 u3FMd9tJfkcGpQGMfrT3hvzS81xJXyZXJTfco5ZGSOk4dG89uByY6ewDStFMPURAB7k/
 Xu5MztyX4EA0zNsy5jOc4Fwjbzrmb73Qgyy5SVXTnnqbXE9VPEujBF5Gz3hZqizw28QD
 hCUMd1/X/CqyfTFH1MDpTA1ITwfjuFo31lqOW93F09uqdtbcM26iGCSJAXvd1KEmx3nT
 5usIA9AQsv4hHoaPANLL9yb5B+ci13ECGqfj7A/dMzkqL6MYMUkH6VoawkhkTNN/J22A
 TZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733865053; x=1734469853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4avOkLXXt+xxKkyvs53K/A4cLhmGU1rYalWmIxSH5lY=;
 b=BwyjhmzvUSUwhZKFMbPr8woCYonP16RvzOAcYVDq/nCvug9P7JS5fkecyzNWNMd1HX
 MEe59G6c+ltODd3twdqkwbntWRDIkv/mHXpC7i2ZojxVPyvDGaKHk1vIMFaVZB/AR1gz
 NuWlucEkRENOf+q6hec9l5uFAjmumpP9vpeRBQzVtWjJWj+ta5UZxHTnJjnIpKTZqDvR
 C8fJRvUOJ7WuiI25DTsEM/P5zBpubnSQzG3PYvXIUc+lhx+K8Ww0LxFM29ld4DPTRAem
 h4c2SwObXTxw5dRogoCM8jo+M1jpgmu7J/D8XfIctaQQD9xWmXzeTn7ts3+Kj8yr7akW
 WdMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUujV5VeioFxBVDxqWOtd3RvvuzIZxfIT5SpvM5HlLOTw+yylzUxY6Zv/6HecihT7VrwT5NgjYAltY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH72eIJKsI1Jj9/N8fAE5Ef+v8cSdQu0fhsYsCiVYSRxi7vZbq
 qfagLVkKaDn9kVJ9yNdQIzAvMXORAnC0Eczc8ZBPH5+JfAF2fM0hvSEVggIDHvk=
X-Gm-Gg: ASbGncu9bMMnhpilmW0+ptpWk/EelSs1lhJm54VXM9dIKUoNP9UjGJPku8ym44nY3RK
 kcjkDPIRiB6+//hf1cMXJX4kqgAjPD6CNFpckERGq7Y1YqaODV36gGeK4YxT72hfI71OUgJzQej
 1F/RvkeF4TVH8NuSJKdnyo9rHp/4PFvqAM6FOEm7mQb/HbT6ApiQNdGxP87yF+XitxS796aSX5S
 sVDNCGJZBZeuq8wfBaoBpzjN4+fXPTHuCziXAE5w605cuF+2cjgHJhyn48gRaUA4knFHuTq6rKH
 nLF9MQoyTcRrAZwX/sCyFTS2e8UcM9Bltw==
X-Google-Smtp-Source: AGHT+IFFvq/bDvJFQWj/RJV8NnDDnUx6uh/s42rQWFV832Y0J28JnsbjtLh7Yu04SEXsTDrb8MHlXw==
X-Received: by 2002:ac2:5bc8:0:b0:540:2a6e:372b with SMTP id
 2adb3069b0e04-5402a6e37edmr56673e87.9.1733865053468; 
 Tue, 10 Dec 2024 13:10:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401c7e8333sm879893e87.40.2024.12.10.13.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 13:10:52 -0800 (PST)
Date: Tue, 10 Dec 2024 23:10:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 quic_abhinavk@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com
Subject: Re: [PATCH v2 2/2] drm/tests: Add test for
 drm_atomic_helper_commit_modeset_disables()
Message-ID: <bgtv3oql63btxeqliauvnjtow4ca2m22qana5v3qudaspvejme@ts6jwuggg63x>
References: <20241209-abhinavk-modeset-fix-v2-0-4d008f6ea8d0@quicinc.com>
 <20241209-abhinavk-modeset-fix-v2-2-4d008f6ea8d0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-abhinavk-modeset-fix-v2-2-4d008f6ea8d0@quicinc.com>
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

On Mon, Dec 09, 2024 at 05:09:25PM -0800, Jessica Zhang wrote:
> Add a subtest to check that modeset is called when the connector is
> changed
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/tests/Makefile                |   1 +
>  drivers/gpu/drm/tests/drm_atomic_state_test.c | 242 ++++++++++++++++++++++++++
>  2 files changed, 243 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index 56dab563abd7a7ee7c147bd6b4927e2436b82e1d..0109bcf7faa54993cce337f522eae78f0fa6ffcb 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
>  	drm_kunit_helpers.o
>  
>  obj-$(CONFIG_DRM_KUNIT_TEST) += \
> +	drm_atomic_state_test.o \
>  	drm_buddy_test.o \
>  	drm_cmdline_parser_test.o \
>  	drm_connector_test.o \
> diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffc1198ccc9ce103b9bc4c5ca8c83ca7f6ab19cc
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Test cases for the drm_atomic_state helpers
> + *
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define DRM_TEST_ENC_0 BIT(0)
> +#define DRM_TEST_ENC_1 BIT(1)
> +#define DRM_TEST_ENC_2 BIT(2)
> +
> +#define DRM_TEST_CONN_0 BIT(0)
> +
> +static const struct drm_display_mode drm_atomic_test_mode = {
> +	DRM_MODE("1024x768", 0, 65000, 1024, 1048,
> +		 1184, 1344, 0, 768, 771, 777, 806, 0,
> +		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
> +};
> +
> +struct drm_atomic_check_priv {
> +	struct drm_device drm;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	struct drm_encoder encoders[3];
> +	struct drm_connector connectors[2];
> +};
> +
> +static int modeset_counter;
> +
> +static void drm_test_encoder_mode_set(struct drm_encoder *encoder,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	modeset_counter++;
> +}
> +
> +static const struct drm_encoder_helper_funcs drm_test_encoder_funcs = {

Name is too generic, please use something more test-suite specific.

> +	.atomic_mode_set	= drm_test_encoder_mode_set,
> +};
> +
> +static const struct drm_connector_funcs dummy_connector_funcs = {
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.reset			= drm_atomic_helper_connector_reset,
> +};
> +
> +static int drm_atomic_test_dummy_get_modes(struct drm_connector *connector)
> +{
> +	drm_connector_helper_get_modes_fixed(connector, &drm_atomic_test_mode);
> +	return 1;

return drm_connector_helper_get_modes_fixed()

> +}
> +
> +static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
> +	.get_modes	= drm_atomic_test_dummy_get_modes,
> +};
> +
> +static struct drm_atomic_check_priv *
> +drm_test_init_drm_components(struct kunit *test, bool has_connectors)

I think this is too generic, please use a file-specific name.

> +{
> +	struct drm_atomic_check_priv *priv;
> +	struct drm_encoder *enc;
> +	struct drm_device *drm;
> +	struct device *dev;
> +	int ret;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	priv = drm_kunit_helper_alloc_drm_device(test, dev,
> +						 struct drm_atomic_check_priv,
> +						 drm,
> +						 DRIVER_MODESET | DRIVER_ATOMIC);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> +	test->priv = priv;
> +
> +	drm = &priv->drm;
> +	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
> +							    NULL,
> +							    NULL,
> +							    NULL, 0,
> +							    NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->plane);
> +
> +	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
> +						  priv->plane, NULL,
> +						  NULL,
> +						  NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->crtc);
> +
> +	for (int i = 0; i < ARRAY_SIZE(priv->encoders); i++) {
> +		enc = &priv->encoders[i];
> +
> +		ret = drmm_encoder_init(drm, enc, NULL,
> +					DRM_MODE_ENCODER_DSI, NULL);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		enc->possible_crtcs = drm_crtc_mask(priv->crtc);
> +	}
> +
> +	priv->encoders[0].possible_clones = DRM_TEST_ENC_0 | DRM_TEST_ENC_1;
> +	priv->encoders[1].possible_clones = DRM_TEST_ENC_0 | DRM_TEST_ENC_1;
> +	priv->encoders[2].possible_clones = DRM_TEST_ENC_2;
> +
> +	if (!has_connectors)
> +		goto done;
> +
> +	struct drm_connector *conn;

Please move next ot other variable definitions.

> +
> +	KUNIT_ASSERT_LE(test, ARRAY_SIZE(priv->connectors),
> +			ARRAY_SIZE(priv->encoders));

I'd say it's BUILD_BUG_ON

> +
> +
> +	for (int i = 0; i < ARRAY_SIZE(priv->connectors); i++) {
> +		conn = &priv->connectors[i];
> +
> +		ret = drmm_connector_init(drm, conn, &dummy_connector_funcs,
> +					  DRM_MODE_CONNECTOR_DSI, NULL);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		drm_connector_helper_add(conn, &dummy_connector_helper_funcs);
> +		drm_encoder_helper_add(&priv->encoders[i], &drm_test_encoder_funcs);
> +
> +		drm_connector_attach_encoder(conn, &priv->encoders[i]);
> +	}
> +
> +done:
> +	drm_mode_config_reset(drm);
> +
> +	return priv;
> +}
> +
> +static int set_up_atomic_state(struct kunit *test,
> +			       struct drm_atomic_check_priv *priv,
> +			       struct drm_connector *connector,
> +			       struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_device *drm = &priv->drm;
> +	struct drm_crtc *crtc = priv->crtc;
> +	struct drm_atomic_state *state;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	if (connector) {
> +		conn_state = drm_atomic_get_connector_state(state, connector);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> +
> +		ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
> +		KUNIT_EXPECT_EQ(test, ret, 0);
> +	}
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
> +
> +	ret = drm_atomic_set_mode_for_crtc(crtc_state, &drm_atomic_test_mode);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	crtc_state->enable = true;
> +	crtc_state->active = true;
> +
> +	if (connector) {
> +		ret = drm_atomic_commit(state);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +	} else {
> +		// dummy connector mask
> +		crtc_state->connector_mask = DRM_TEST_CONN_0;
> +	}
> +
> +	return 0;
> +}
> +

Please provide a description of what the test does and what it checks
(and why). See how other tests are described.

> +static void drm_test_modeset(struct kunit *test)
> +{
> +	struct drm_atomic_check_priv *priv;
> +	struct drm_modeset_acquire_ctx *ctx;
> +	struct drm_connector *old_conn, *new_conn;
> +	struct drm_atomic_state *state;
> +	struct drm_device *drm;
> +	struct drm_connector_state *new_conn_state, *old_conn_state;
> +	int ret, initial_modeset_count;
> +
> +	priv = drm_test_init_drm_components(test, true);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	drm = &priv->drm;
> +	old_conn = &priv->connectors[0];
> +	new_conn = &priv->connectors[1];
> +
> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +
> +	// first modeset to enable
> +	ret = set_up_atomic_state(test, priv, old_conn, ctx);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
> +
> +	new_conn_state = drm_atomic_get_connector_state(state, new_conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
> +
> +	old_conn_state = drm_atomic_get_connector_state(state, old_conn);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
> +
> +	ret = drm_atomic_set_crtc_for_connector(old_conn_state, NULL);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	ret = drm_atomic_set_crtc_for_connector(new_conn_state, priv->crtc);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +
> +	initial_modeset_count = modeset_counter;
> +
> +	// modeset_disables is called as part of the atomic commit tail
> +	ret = drm_atomic_commit(state);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_EQ(test, modeset_counter, initial_modeset_count + 1);
> +}
> +
> +static struct kunit_case drm_test_check_modeset_test[] = {
> +	KUNIT_CASE(drm_test_modeset),
> +	{}
> +};
> +
> +static struct kunit_suite drm_test_check_modeset_test_suite = {
> +	.name = "drm_validate_modeset",
> +	.test_cases = drm_test_check_modeset_test,
> +};
> +
> +kunit_test_suite(drm_test_check_modeset_test_suite);
> +
> +MODULE_AUTHOR("Jessica Zhang <quic_jesszhan@quicinc.com");
> +MODULE_DESCRIPTION("Test cases for the drm_atomic_helper functions");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
