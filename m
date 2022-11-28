Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125D63B25F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 20:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AE010E32D;
	Mon, 28 Nov 2022 19:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A026710E32D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=maVyWFE1pq/Db9obmOzHYaZBWeSNTebHNF1VOxWlEsc=; b=Z7g2j3JvNb2zdLfH5RE2BhKU5p
 HH65jHXx1lPGkDeKMHLZiffXkYIz6VDyqY1oDC/f54Vz6Dr4P18McjtqVM1VKdDwRjlYu/LJSLcN8
 oliWAcBzrd/KXj7dkovQSWMfWoTu8vSrrm8id/2iqOvHqMJNA2mXLm56Z5grBqpKPzaGB+4ns1gUg
 +ejIdvS2cpH2f3DJmDEAwDipps7FvfmHssvTLvJh48zoP9V1mNUSviDNudE4pp+mxR3aHdZ4ju4ln
 V2l1p2xO2DgXHb1dOdj//Ab7qPqa5xntdNB48ao2qpqkp1zgFMjkoDkvWQOuqni0fP9HIjjhJcD9q
 1RxLXujA==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ozjwV-00AbJz-5s; Mon, 28 Nov 2022 20:37:27 +0100
Message-ID: <2c51f4d9-330f-70a4-f428-ae7aa9d6785c@igalia.com>
Date: Mon, 28 Nov 2022 16:37:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 04/17] drm/tests: helpers: Remove the name parameter
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-4-efe5ed518b63@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-4-efe5ed518b63@cerno.tech>
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
> The device name isn't really useful, we can just define it instead of
> exposing it in the API.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 3 +--
>  drivers/gpu/drm/tests/drm_kunit_helpers.c       | 7 ++++---
>  drivers/gpu/drm/tests/drm_modes_test.c          | 3 +--
>  drivers/gpu/drm/tests/drm_probe_helper_test.c   | 3 +--
>  include/drm/drm_kunit_helpers.h                 | 3 +--
>  5 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 6cdf08f582ce..4d475ae6dbb6 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -59,8 +59,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
>  
>  	test->priv = priv;
>  
> -	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
> -						      "drm-client-modeset-test");
> +	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>  
>  	ret = drmm_connector_init(priv->drm, &priv->connector,
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index 2f67f6cf78d0..16c7926d83c2 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -8,6 +8,8 @@
>  
>  #include <linux/device.h>
>  
> +#define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
> +
>  struct kunit_dev {
>  	struct drm_device base;
>  };
> @@ -39,7 +41,6 @@ static void dev_free(struct kunit_resource *res)
>   * drm_kunit_helper_alloc_drm_device - Allocates a mock DRM device for Kunit tests
>   * @test: The test context object
>   * @features: Mocked DRM device driver features
> - * @name: Name of the struct &device to allocate
>   *
>   * This function allocates a new struct &device, creates a struct
>   * &drm_driver and will create a struct &drm_device using both.
> @@ -54,7 +55,7 @@ static void dev_free(struct kunit_resource *res)
>   */
>  struct drm_device *
>  drm_kunit_helper_alloc_drm_device(struct kunit *test,
> -				  u32 features, char *name)
> +				  u32 features)
>  {
>  	struct kunit_dev *kdev;
>  	struct drm_device *drm;
> @@ -62,7 +63,7 @@ drm_kunit_helper_alloc_drm_device(struct kunit *test,
>  	struct device *dev;
>  	int ret;
>  
> -	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, name);
> +	dev = kunit_alloc_resource(test, dev_init, dev_free, GFP_KERNEL, KUNIT_DEVICE_NAME);
>  	if (!dev)
>  		return ERR_PTR(-ENOMEM);
>  
> diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
> index 6723089dff9f..35965ad86188 100644
> --- a/drivers/gpu/drm/tests/drm_modes_test.c
> +++ b/drivers/gpu/drm/tests/drm_modes_test.c
> @@ -22,8 +22,7 @@ static int drm_test_modes_init(struct kunit *test)
>  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, priv);
>  
> -	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET,
> -						      "drm-modes-test");
> +	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>  
>  	test->priv = priv;
> diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> index 85236ff4744f..be61a92b79d2 100644
> --- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> @@ -40,8 +40,7 @@ static int drm_probe_helper_test_init(struct kunit *test)
>  	test->priv = priv;
>  
>  	priv->drm = drm_kunit_helper_alloc_drm_device(test,
> -						      DRIVER_MODESET | DRIVER_ATOMIC,
> -						      "drm-probe-helper-test");
> +						      DRIVER_MODESET | DRIVER_ATOMIC);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>  
>  	connector = &priv->connector;
> diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
> index e9870c7911fe..6c12b1426ba0 100644
> --- a/include/drm/drm_kunit_helpers.h
> +++ b/include/drm/drm_kunit_helpers.h
> @@ -8,7 +8,6 @@ struct kunit;
>  
>  struct drm_device *
>  drm_kunit_helper_alloc_drm_device(struct kunit *test,
> -				  u32 features,
> -				  char *name);
> +				  u32 features);
>  
>  #endif // DRM_KUNIT_HELPERS_H_
> 
