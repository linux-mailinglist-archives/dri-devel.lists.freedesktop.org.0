Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B955963B27F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 20:49:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827DF10E332;
	Mon, 28 Nov 2022 19:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D331110E331
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAmDay8Qe2++NlnJo/s9zmage8EXAfl6yM10J36267M=; b=KlyRebYWJtdIAFWsb7JuDb5P47
 eGzD6qfJm+YoSe1Mind9vYfg8c0LAmobj0xdjme1b2dwc4aOVPUoR//F6U3oCLLNlgdN0gy3cCNqK
 j7DvEjZXnB78iiEHB21IKJMsSN8dbUOSjK/6p4D6N5c4hkhH8ajPdskiiHSr4wsmT+sKBBg8D0Okc
 f6+/KPwdvZNad7M0lxhyUbfVTFgrGHBR3eLBiI6PyJb2jdyK/rcpFDbom4RMC9ksCaFrfPBHZksUK
 R00qzvfLiPuSsbx/36a8/LWdceALEWrIStiv2aRmmpMVB9Qsv/Z3XI/O082SchT+1kx1l1XnimewP
 YIuUzNrQ==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ozk7a-00AbVH-Fp; Mon, 28 Nov 2022 20:48:54 +0100
Message-ID: <eb318e69-3fc5-c041-cc17-e0549d6cf128@igalia.com>
Date: Mon, 28 Nov 2022 16:48:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 05/17] drm/tests: helpers: Create the device in another
 function
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-5-efe5ed518b63@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-5-efe5ed518b63@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kselftest@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, linux-media@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 11:53, Maxime Ripard wrote:
> We'll need in some tests to control when the device needs to be added
> and removed, so let's split the device creation from the DRM device
> creation function.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Just a small nit below,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

>  
> diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> index be61a92b79d2..438b1d42b843 100644
> --- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> @@ -17,6 +17,7 @@
>  
>  struct drm_probe_helper_test_priv {
>  	struct drm_device *drm;
> +	struct device *dev;
>  	struct drm_connector connector;
>  };
>  
> @@ -39,7 +40,10 @@ static int drm_probe_helper_test_init(struct kunit *test)
>  	KUNIT_ASSERT_NOT_NULL(test, priv);
>  	test->priv = priv;
>  
> -	priv->drm = drm_kunit_helper_alloc_drm_device(test,
> +	priv->dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
> +
> +	priv->drm = drm_kunit_helper_alloc_drm_device(test, priv->dev,
>  						      DRIVER_MODESET | DRIVER_ATOMIC);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>  
> @@ -55,6 +59,13 @@ static int drm_probe_helper_test_init(struct kunit *test)
>  	return 0;
>  }
>  
> +static void drm_probe_helper_test_exit(struct kunit *test)
> +{
> +	struct drm_probe_helper_test_priv *priv = test->priv;;

There are two semicolons by the end of this statement.

Best Regards,
- Maíra Canal

> +
> +	drm_kunit_helper_free_device(test, priv->dev);
> +}
> +
>  typedef struct drm_display_mode *(*expected_mode_func_t)(struct drm_device *);
>  
>  struct drm_connector_helper_tv_get_modes_test {
> @@ -195,6 +206,7 @@ static struct kunit_case drm_test_connector_helper_tv_get_modes_tests[] = {
>  static struct kunit_suite drm_test_connector_helper_tv_get_modes_suite = {
>  	.name = "drm_connector_helper_tv_get_modes",
>  	.init = drm_probe_helper_test_init,
> +	.exit = drm_probe_helper_test_exit,
>  	.test_cases = drm_test_connector_helper_tv_get_modes_tests,
>  };
>  
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
> index 6c12b1426ba0..b4277fe92c38 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -6,8 +6,11 @@
>  struct drm_device;
>  struct kunit;
>  
> +struct device *drm_kunit_helper_alloc_device(struct kunit *test);
> +void drm_kunit_helper_free_device(struct kunit *test, struct device *dev);
> +
>  struct drm_device *
> -drm_kunit_helper_alloc_drm_device(struct kunit *test,
> +drm_kunit_helper_alloc_drm_device(struct kunit *test, struct device *dev,
>  				  u32 features);
>  
>  #endif // DRM_KUNIT_HELPERS_H_
> 
