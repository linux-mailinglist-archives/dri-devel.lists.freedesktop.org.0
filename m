Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2AD638BE0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 15:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA410E7C7;
	Fri, 25 Nov 2022 14:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA75D10E7C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 14:10:12 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4NJcFb5ZXkzDrVl;
 Fri, 25 Nov 2022 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1669385412; bh=URYH0IzqLdcTRk2nEZuYkw52NB+0goWIxpVAqrktmWk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hmhdwpA3y7+ljO6AAmdV08S1hROra14B1YqTtMA/+M0I4UE38BCbPQogQs+32v9j6
 rM4cxEOLFa0LYx0se2bUnQzMWeAdvXBYr3aeYVBYDFwmFmKpgNKG3CzzEEmrC0q9bf
 Ylr1XPmwiZX1oFMkGAN6UKii9hQ/lIvgcelTj00o=
X-Riseup-User-ID: 71B09A1F920CD941466DEE4BA3A0B31413D3BD54FB7AA6B05413A8EB5A9CC69A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4NJcFV4BCfz5vbk;
 Fri, 25 Nov 2022 14:10:06 +0000 (UTC)
Message-ID: <6a817cad-df46-42ac-3c14-dbdce681cde6@riseup.net>
Date: Fri, 25 Nov 2022 11:10:02 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 01/24] drm/tests: helpers: Rename the device init helper
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 linux-media@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 12:25, Maxime Ripard wrote:
> The name doesn't really fit the conventions for the other helpers in
> DRM/KMS, so let's rename it to make it obvious that we allocate a new
> DRM device.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Although I believe using "drm_device" on the function name is a bit 
redundant (maybe drm_kunit_helper_alloc_dev or 
drm_kunit_helper_alloc_device would be cleaner),

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 +-
>   drivers/gpu/drm/tests/drm_kunit_helpers.c       | 4 +++-
>   drivers/gpu/drm/tests/drm_kunit_helpers.h       | 5 ++++-
>   3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index 362a5fbd82f5..e469d1634e2d 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -41,7 +41,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
>   
>   	test->priv = priv;
>   
> -	priv->drm = drm_kunit_device_init(test, DRIVER_MODESET, "drm-client-modeset-test");
> +	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET, "drm-client-modeset-test");
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>   
>   	ret = drmm_connector_init(priv->drm, &priv->connector,
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index f1662091f250..a4ad030ed101 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -36,7 +36,9 @@ static void dev_free(struct kunit_resource *res)
>   	root_device_unregister(dev);
>   }
>   
> -struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name)
> +struct drm_device *
> +drm_kunit_helper_alloc_drm_device(struct kunit *test,
> +				  u32 features, char *name)
>   {
>   	struct kunit_dev *kdev;
>   	struct drm_device *drm;
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
> index 20ab6eec4c89..e9870c7911fe 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.h
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
> @@ -6,6 +6,9 @@
>   struct drm_device;
>   struct kunit;
>   
> -struct drm_device *drm_kunit_device_init(struct kunit *test, u32 features, char *name);
> +struct drm_device *
> +drm_kunit_helper_alloc_drm_device(struct kunit *test,
> +				  u32 features,
> +				  char *name);
>   
>   #endif // DRM_KUNIT_HELPERS_H_
> 
