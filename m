Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D796060FD2B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 18:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFBD10E698;
	Thu, 27 Oct 2022 16:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD23010E698
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 16:34:14 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Myrq96lsqz9s5L;
 Thu, 27 Oct 2022 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1666888454; bh=J4ygBh+OjH6+zJ/f+L7SeeBqOZrbDAyt8ylFmhMmOOY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=leiegaE9hfuVzp5jGxKhU4c3CAg1pDKytZOTEbPJxL/DIDyyiP4ChLyz1cWPPu133
 cbieNYwag+EJPDkfGPorPzn/IiTVWQ8WbLkWhsuEW46Fz3pSEKlPOukgKwN/siHvjk
 WJBdvMfaz9hgFwd92Td7uWfb//avP+y/tDRVV6mo=
X-Riseup-User-ID: D12952F7A1A4DD109A7FA0664F46003D5026606957E13428C9749E5F7A86364B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Myrq54Ntfz5vSS;
 Thu, 27 Oct 2022 16:34:09 +0000 (UTC)
Message-ID: <2692de92-90e4-4a17-6609-da1bdfa5c850@riseup.net>
Date: Thu, 27 Oct 2022 13:34:04 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/tests: Add back seed value information
To: Arthur Grillo <arthurgrillo@riseup.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20221027142903.200169-1-arthurgrillo@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221027142903.200169-1-arthurgrillo@riseup.net>
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
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Daniel Latypov <dlatypov@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 David Gow <davidgow@google.com>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 10/27/22 11:29, Arthur Grillo wrote:
> As reported by Michał the drm_mm and drm_buddy unit tests lost the
> printk with seed value after they where refactored into KUnit. This
> patch add back this important information to assure reproducibility and
> convert them to the KUnit API.

Some grammar nits:
- s/where/were
- s/add/adds

Moreover, you could write the commit message as André indicated, that 
is: in imperative form.

> 
> Reported-by: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> v1->v2: https://lore.kernel.org/all/20221026211458.68432-1-arthurgrillo@riseup.net/
> - Correct compilation issues
> - Change tags order
> - Remove useless line change
> - Write commit message in imperative form
> - Remove redundant message part
> - Correct some grammars nits
> - Correct checkpatch issues
> 
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 4 ++++
>   drivers/gpu/drm/tests/drm_mm_test.c    | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 62f69589a72d..258137e9c047 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -731,6 +731,10 @@ static int drm_buddy_init_test(struct kunit *test)
>   	while (!random_seed)
>   		random_seed = get_random_u32();
>   
> +	kunit_info(test,
> +		   "Testing DRM buddy manager, with random_seed=0x%x\n",
> +		   random_seed);
> +
>   	return 0;
>   }
>   

As I was checking the log, I realized that the random_seed only needs to 
be generated by the start of the test suite, so this drm_buddy_init_test 
could be a suite_init function, instead of an init function. This way 
the random_seed will be generated by the start of the suite and the log 
will be printed just once.

> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index c4b66eeae203..bec006e044a4 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -2214,6 +2214,10 @@ static int drm_mm_init_test(struct kunit *test)
>   	while (!random_seed)
>   		random_seed = get_random_u32();
>   
> +	kunit_info(test,
> +		   "Testing DRM range manager, with random_seed=0x%x max_iterations=%u max_prime=%u\n",
> +		   random_seed, max_iterations, max_prime);
> +

Same here.

Best Regards,
- Maíra Canal

>   	return 0;
>   }
>   
