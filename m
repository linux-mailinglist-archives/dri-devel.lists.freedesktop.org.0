Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572360EAE3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 23:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DDF10E4CA;
	Wed, 26 Oct 2022 21:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E3610E4BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 21:34:49 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MyMXT2zJSz9s87;
 Wed, 26 Oct 2022 21:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1666820089; bh=mK3QrnEPLUpU6dHFP51aqQ6A2Mwbwznsppi0dUK+dZg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZOI114NIArbQbJ0bZ7rwElb3r1YLigD342ZVithOM433yAP/6AIKoHy23erpeygV
 ilbY8AkaLnGZ7AwImfvhJiiO4hVwCx/L49PqoqPDWG78C1uvB4AsvPaqdNSsmB/DbP
 4l6LhpGkkur/kAStPKwB1o+LhK6xCXmlAgVSCzS8=
X-Riseup-User-ID: A767155213843DF22C00E5927121719B7D7796EFC684842424197403131875F9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MyMXN4lYFz5vNH;
 Wed, 26 Oct 2022 21:34:44 +0000 (UTC)
Message-ID: <6bd861cb-1eae-7f02-719b-8babfe7185dc@riseup.net>
Date: Wed, 26 Oct 2022 18:34:41 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Add back seed value information
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20221026211458.68432-1-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221026211458.68432-1-arthurgrillo@riseup.net>
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
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Daniel Latypov <dlatypov@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 David Gow <davidgow@google.com>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 10/26/22 18:14, Arthur Grillo wrote:
> As reported by Michał the drm_mm and drm_buddy unit tests lost the
> printk with seed value after they being refactored into kunit. This

Some grammar nits:
- s/being/were
- s/kunit/KUnit

> patch adds back this important information to assure reproducibility
> converting them to use the kunit api.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Reported-by: Michał Winiarski <michal.winiarski@intel.com>

I believe that Michał's should come before your tag, as the SoB chain
should reflect the real route a patch took as it was propagated to the
maintainers [1].

> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 3 +++
>  drivers/gpu/drm/tests/drm_mm_test.c    | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 62f69589a72d..83c8863bc643 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -731,6 +731,9 @@ static int drm_buddy_init_test(struct kunit *test)
>  	while (!random_seed)
>  		random_seed = get_random_u32();
>  
> +	kunit_info("Testing DRM buddy manager (struct drm_buddy), with random_seed=0x%x\n",
> +		random_seed);

I'm getting some compiling errors here:

ERROR:root:../drivers/gpu/drm/tests/drm_buddy_test.c:735:3: error:
expected ')'
                random_seed);
                ^
../drivers/gpu/drm/tests/drm_buddy_test.c:734:2: note: to match this '('
        kunit_info("Testing DRM buddy manager (struct drm_buddy), with
random_seed=0x%x\n",
        ^

You can reproduce it by running:

$ ./tools/testing/kunit/kunit.py --kunitconfig=drivers/gpu/drm/tests

Moreover, could you address the checkpatch issues? There are some
misaligned parenthesis and the line are too big.

> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index c4b66eeae203..492347069d58 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -2214,6 +2214,9 @@ static int drm_mm_init_test(struct kunit *test)
>  	while (!random_seed)
>  		random_seed = get_random_u32();
>  
> +	kunit_info("Testing DRM range manager (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
> +	random_seed, max_iterations, max_prime);
> +

Same here.

>  	return 0;
>  }
>  
> @@ -2251,6 +2254,5 @@ static struct kunit_suite drm_mm_test_suite = {
>  };
>  
>  kunit_test_suite(drm_mm_test_suite);
> -

There is no need to change this line.

Thanks for your patch!

[1]
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Best Regards,
- Maíra Canal


>  MODULE_AUTHOR("Intel Corporation");
>  MODULE_LICENSE("GPL");
