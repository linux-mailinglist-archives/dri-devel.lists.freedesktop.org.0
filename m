Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A07645B8C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 14:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF6410E3B0;
	Wed,  7 Dec 2022 13:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85610E3B0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fyA1KqlBkiD4PRKJwfoxMJSb8dR56u0Byrgz69IGCDM=; b=Ah2r+Q8uT2cKvHeYBiKlpjgsLs
 0B/7BzJgCtAnx/1S/Bl3NjOgzMvCF4pB7RnsaHHNMTaFAKobs19+W3xdVtIK+4KJGQlQJp+9p5+CV
 ZJt6wuL4V7D/H/Q9oEw0nq8JV9uxe6OtR981NZ2hiTetd1Dk1Ga1rVecQ/gbphFWbOvm6iggz+EKE
 2AZGszBmFHBzdsK3vh2pl32DMcZlvM2oHb+m8pON91EXhJvicePApSSMDbLEFITWrNZ7er6CrYpv8
 /4Q2li7STgNWKK2VAAq4Q8OM6XMiy3i0CJjveKUpQAu1MomMzSxV7hsDi8OdCbKUR0NYBBDARwap5
 eEOjAjLg==;
Received: from [143.107.182.242] (helo=[10.41.75.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p2uu1-00GbW6-UQ; Wed, 07 Dec 2022 14:56:02 +0100
Message-ID: <57f2302f-0e36-7665-37b0-a81a4be8cb7b@igalia.com>
Date: Wed, 7 Dec 2022 10:55:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 20/20] Documentation: gpu: vc4: Add KUnit Tests Section
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
 <20221123-rpi-kunit-tests-v3-20-4615a663a84a@cerno.tech>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v3-20-4615a663a84a@cerno.tech>
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
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 linux-media@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 12:11, Maxime Ripard wrote:
> Now that we have VC4-specific tests in place, let's document them
> properly.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Just a small nit below.

> ---
>   Documentation/gpu/vc4.rst | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/gpu/vc4.rst b/Documentation/gpu/vc4.rst
> index 5df1d98b9544..a2375f1584e6 100644
> --- a/Documentation/gpu/vc4.rst
> +++ b/Documentation/gpu/vc4.rst
> @@ -54,6 +54,22 @@ VEC (Composite TV out) encoder
>   .. kernel-doc:: drivers/gpu/drm/vc4/vc4_vec.c
>      :doc: VC4 SDTV module
>   
> +KUnit Tests
> +===========
> +
> +The VC4 Driver uses KUnit to perform driver-specific unit and
> +integration tests.
> +
> +These tests are using a mock driver and can be ran using the
> +command::
> +	./tools/testing/kunit/kunit.py run \
> +		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
> +		--cross_compile aarch64-linux-gnu- --arch arm64

I believe you could use a code block here, like:

.. code-block:: bash
	
	$ ./tools/testing/kunit/kunit.py run \
		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
		--cross_compile aarch64-linux-gnu- --arch arm64

You could also mention that you can run the tests with --arch arm.

Best Regards,
- Maíra Canal

> +
> +Parts of the driver that are currently covered by tests are:
> + * The HVS to PixelValve dynamic FIFO assignment, for the BCM2835-7
> +   and BCM2711.
> +
>   Memory Management and 3D Command Submission
>   ===========================================
>   
> 
