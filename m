Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59D611BDD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 22:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989F210E1F0;
	Fri, 28 Oct 2022 20:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A83410E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 20:54:50 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MzZYP5kP1z9sNV;
 Fri, 28 Oct 2022 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1666990490; bh=qu4T1UVN0jQRdhupG16JY63wa4HUyVvIw/bgINVvosA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gP4d/zoqAwFgE+RynjkJpRPfN4H7styT86iBirjV5uMhTiAy+cZYWwBsMAMffgLP9
 4MdM6mjTb64ULA2cZ3CWMdlWEX56IZgMOHIilNqNsPwNoxkc2xaGG+Tsfa2322y+Ru
 SSmV60r9FkxvqWUDwBvi3LcknMVfsEIKhlbHOBkA=
X-Riseup-User-ID: 8C4B558F0986691C6DEDEED7AB1412EB7E7987B9881D003CD3E43A7845713F73
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MzZYK1lqYz5vTk;
 Fri, 28 Oct 2022 20:54:45 +0000 (UTC)
Message-ID: <97fb8a27-e547-5bbb-f148-5d3d7630749f@riseup.net>
Date: Fri, 28 Oct 2022 17:54:42 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v4] drm/tests: Add back seed value information
To: Arthur Grillo <arthurgrillo@riseup.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20221028141715.290903-1-arthurgrillo@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20221028141715.290903-1-arthurgrillo@riseup.net>
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

Just a small nit below, but besides that:

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

On 10/28/22 11:17, Arthur Grillo wrote:
> As reported by Michał the drm_mm and drm_buddy unit tests lost the
> printk with seed value after they were refactored into KUnit.
> 
> Add kunit_info with seed value information to assure reproducibility.
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
> v2->v3: https://lore.kernel.org/all/20221027142903.200169-1-arthurgrillo@riseup.net/
> - Change .init to .suite_init
> - Correct some grammars nits
> 
> v3->v4:
> - Correct compilation issues
> 
> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 6 ++++--
>  drivers/gpu/drm/tests/drm_mm_test.c    | 8 ++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 62f69589a72d..90ec5e8a485b 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -726,11 +726,13 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>  	drm_buddy_fini(&mm);
>  }
>  
> -static int drm_buddy_init_test(struct kunit *test)
> +static int drm_buddy_init_suite(struct kunit_suite *suite)

Just to keep complaint to the rest of the KUnit tests (such as kcsan,
kfence, kmsan), could you change "init_suite" to "suite_init"? Same
thing for the drm_mm test.

Thanks for the quick respin of the patch!

Best Regards,
- Maíra Canal

>  {
>  	while (!random_seed)
>  		random_seed = get_random_u32();
>  
> +	kunit_info(suite, "Testing DRM buddy manager, with random_seed=0x%x\n", random_seed);
> +
>  	return 0;
>  }
>  
> @@ -746,7 +748,7 @@ static struct kunit_case drm_buddy_tests[] = {
>  
>  static struct kunit_suite drm_buddy_test_suite = {
>  	.name = "drm_buddy",
> -	.init = drm_buddy_init_test,
> +	.suite_init = drm_buddy_init_suite,
>  	.test_cases = drm_buddy_tests,
>  };
>  
