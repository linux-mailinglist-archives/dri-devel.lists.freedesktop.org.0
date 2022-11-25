Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83026385B1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 09:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06F510E081;
	Fri, 25 Nov 2022 08:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D828A10E081
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 08:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669366647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Zasw8bTF5Rv7J9KCKu2Jsu6Fuo3MdgsNAsJkLxlZjY=;
 b=LPpNh+n1prqno3RBgrlj6Pspx4skPv2W8uE/ENxgV9NDKxqp0LCphbMuyZm2WsMJcpEa5Z
 +rFStnX51h4NiTwx/vtxESKP4Pn3gu5evdHtcwCEzESiz9nQt4wQ1GU2D1nrsXmnsfMO6Q
 L6GV1+jCHcU2Uk/mtKUc0RwRkRmbQ0A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-TcT4VdPyMkCEAig5y0vhhA-1; Fri, 25 Nov 2022 03:57:26 -0500
X-MC-Unique: TcT4VdPyMkCEAig5y0vhhA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso3891936wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 00:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Zasw8bTF5Rv7J9KCKu2Jsu6Fuo3MdgsNAsJkLxlZjY=;
 b=XniNdSASp0Y6ze1QU9JFAcc1tFd0jsna88IrmerxWwg91X8OEr7oU56XR7m5h1nUcc
 r7JPs5mzD3JnlJTrS1qKaN3QboM2kUSh+BgUSY4JElYZo5EDI2zTvFhu/U1i09W/TG+Z
 q1DPtC+/pGDR4Z1GfjEtusl/kupS1B2iG4K8vpgVBKlHa2GA/RiiXyACNzrEdYzyOObt
 tzjCnjdpEGQ9Es2Ny1j+IIaFqmGL41qOPKsMge9tByn5YpsmWnWluiE/ZHgZIHwlLAsg
 msU0oBW5iD3bgJZaV/Y2/V8YiC7G3K1A3j/HVE7o1LLI2R6HRz1/TAiOXdSblullURiu
 W18Q==
X-Gm-Message-State: ANoB5pnQMRzvZI+HK3PKuqXukPxfjATFT5c5s/mJgQOIQbYSm3IlNqOV
 kIn5GV3qjKhlrZp9lMj2Iy1+0dF4nFtTcF/A06xvVp5u4fwm8zWjtdU9Nvs9uA/AHhH/V1qmXOK
 He2bVYlcnmX6iG5eA+8r7wBtYr9+9
X-Received: by 2002:adf:de8f:0:b0:241:df57:80a7 with SMTP id
 w15-20020adfde8f000000b00241df5780a7mr11242996wrl.191.1669366645224; 
 Fri, 25 Nov 2022 00:57:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6I9dIfw7rl+C6lpH9D4FzplrH7lHVT+4+0sx5/OzVH2zqrsMW/YbaUpZl0bbTphLuFhCwwqA==
X-Received: by 2002:adf:de8f:0:b0:241:df57:80a7 with SMTP id
 w15-20020adfde8f000000b00241df5780a7mr11242992wrl.191.1669366645018; 
 Fri, 25 Nov 2022 00:57:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i19-20020a1c5413000000b003cfc02ab8basm8929498wmb.33.2022.11.25.00.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 00:57:24 -0800 (PST)
Message-ID: <cb95b9c7-a975-1990-caed-a7ce80860809@redhat.com>
Date: Fri, 25 Nov 2022 09:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 02/24] drm/tests: helpers: Remove the name parameter
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-2-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-2-051a0bb60a16@cerno.tech>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:25, Maxime Ripard wrote:
> The device name isn't really useful, we can just define it instead of
> exposing it in the API.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_client_modeset_test.c | 2 +-
>  drivers/gpu/drm/tests/drm_kunit_helpers.c       | 6 ++++--
>  drivers/gpu/drm/tests/drm_kunit_helpers.h       | 3 +--
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> index e469d1634e2d..6920c3ffdfdf 100644
> --- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
> +++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
> @@ -41,7 +41,7 @@ static int drm_client_modeset_test_init(struct kunit *test)
>  
>  	test->priv = priv;
>  
> -	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET, "drm-client-modeset-test");
> +	priv->drm = drm_kunit_helper_alloc_drm_device(test, DRIVER_MODESET);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>  
>  	ret = drmm_connector_init(priv->drm, &priv->connector,
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> index a4ad030ed101..7f69f56f5892 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -9,6 +9,8 @@
>  
>  #include "drm_kunit_helpers.h"
>  
> +#define FAKE_DEVICE_NAME	"drm-kunit-fake-device"
> +

I think that KUNIT_DEVICE_NAME and "drm-kunit-mock-device" are more descriptive
names here. But I'm also OK with the patch as is.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

