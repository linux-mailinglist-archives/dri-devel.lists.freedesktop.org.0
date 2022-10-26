Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1060EAE6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 23:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62E610E4CE;
	Wed, 26 Oct 2022 21:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DE110E4CE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 21:38:54 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MyMdB4TGPzDqsd
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 21:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1666820334; bh=DR9ZuA2jI503i7m2Ln1EFsfaplZ1ceRDedCOBNN4phs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MxbHLGiv2FQgmwsrh7iDbVhTIcjrTRNAelkclx1UrFkpbhXagFJOL7LQGYrFcbOa0
 FrwBc6Zdh+0iEjgliNLPKdpHgxj3ZPRDtDKkMLWgL/nUrzzgK40kVvzFhinIJHyuMO
 r6Xu9C/h+Esbtmt5vNl9D9C0AIqwIC1qCmmJF9GI=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MyMd94dPbz9t1g;
 Wed, 26 Oct 2022 21:38:53 +0000 (UTC)
X-Riseup-User-ID: 1BFB477598C653AF8E841CA8C8FF5E3C505961834BD473209E07EF89D7C9BD7B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MyMd610VJz5vVd;
 Wed, 26 Oct 2022 21:38:49 +0000 (UTC)
Message-ID: <c542030e-feed-2e3f-1bcc-65b04fc1c210@riseup.net>
Date: Wed, 26 Oct 2022 18:38:38 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Add back seed value information
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>
References: <20221026211458.68432-1-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <20221026211458.68432-1-arthurgrillo@riseup.net>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Grillo :)

On 10/26/22 18:14, Arthur Grillo wrote:
> As reported by Michał the drm_mm and drm_buddy unit tests lost the
> printk with seed value after they being refactored into kunit. This
> patch adds back this important information to assure reproducibility
> converting them to use the kunit api.
> 

You should write you commit message in imperative form, like "Add back 
this important [...]"

> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Reported-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 3 +++
>   drivers/gpu/drm/tests/drm_mm_test.c    | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 62f69589a72d..83c8863bc643 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -731,6 +731,9 @@ static int drm_buddy_init_test(struct kunit *test)
>   	while (!random_seed)
>   		random_seed = get_random_u32();
>   
> +	kunit_info("Testing DRM buddy manager (struct drm_buddy), with random_seed=0x%x\n",

DRM buddy manager (struct drm_buddy)

seems a bit redundant to me.

> +		random_seed);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index c4b66eeae203..492347069d58 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -2214,6 +2214,9 @@ static int drm_mm_init_test(struct kunit *test)
>   	while (!random_seed)
>   		random_seed = get_random_u32();
>   
> +	kunit_info("Testing DRM range manager (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
> +	random_seed, max_iterations, max_prime);
> +
>   	return 0;
>   }
>   
> @@ -2251,6 +2254,5 @@ static struct kunit_suite drm_mm_test_suite = {
>   };
>   
>   kunit_test_suite(drm_mm_test_suite);
> -
>   MODULE_AUTHOR("Intel Corporation");
>   MODULE_LICENSE("GPL");
