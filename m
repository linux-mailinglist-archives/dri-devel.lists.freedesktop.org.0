Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091436E7055
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD9C10E6F9;
	Wed, 19 Apr 2023 00:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B8610E6F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSYamNKN1BpKELi9ERuHe+u2PLl5tbBZ740GLgiO9ho=; b=XtARNhyoysd8S7uVwEtGcRN5lp
 qkVE513GgZhRdY8Sim3U8eEUMLzHk4DY0/8ANljaS1lxXFo5TXjC4kQNwXcNTHAckPJp6FrD83rX/
 y4Iz/Zi7vev/kntsCRGwiCoNtvjLVTPnuvAeVfMhWO/WbtI3hPdrdmhcXD+FZ+uZ7FZCeXacKqESf
 CVZSgCPHdv3NOyrMtEZS9Nrrj3E2BYDeR6NdYJJcOCgzwiydDDltBOpNXZ6XxG4myvE7iZXhnuL00
 80J6ya0bW+WQYdbrlx9W8MKZ8zr/GkN3tgH3QRN1i0xRiJIM5vEBwosmfOJ/XKvpJaKrkmQzbqY15
 tH2Yi8dw==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1povQo-004UXV-Sm; Wed, 19 Apr 2023 02:12:19 +0200
Message-ID: <60ed1b99-44b7-85cb-6b3f-71a8da7731ee@igalia.com>
Date: Tue, 18 Apr 2023 21:12:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 2/5] drm/tests: Add test cases for
 drm_rect_calc_hscale()
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230418230146.461129-1-arthurgrillo@riseup.net>
 <20230418230146.461129-3-arthurgrillo@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230418230146.461129-3-arthurgrillo@riseup.net>
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, maxime@cerno.tech, andrealmeid@riseup.net,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 20:01, Arthur Grillo wrote:
> Insert parameterized test for the drm_rect_calc_hscale() to ensure
> correctness and prevent future regressions. Besides the test for the
> usual case, tests the exceptions.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Thanks for the quick fix!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 72 +++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 33584f63be37..aae682ad9ee1 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_rect.h>
>   
>   #include <linux/string_helpers.h>
> +#include <linux/errno.h>
>   
>   static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
>   			     const struct drm_rect *expected)
> @@ -343,12 +344,83 @@ static void drm_test_rect_intersect(struct kunit *test)
>   	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
>   }
>   
> +struct drm_rect_scale_case {
> +	const char *name;
> +	struct drm_rect src, dst;
> +	int min_range, max_range;
> +	int expected_scaling_factor;
> +};
> +
> +static const struct drm_rect_scale_case drm_rect_scale_cases[] = {
> +	{
> +		.name = "normal use",
> +		.src = DRM_RECT_INIT(0, 0, 2 << 16, 2 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 1 << 16),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = 2,
> +	},
> +	{
> +		.name = "out of max range",
> +		.src = DRM_RECT_INIT(0, 0, 10 << 16, 10 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 1 << 16),
> +		.min_range = 3, .max_range = 5,
> +		.expected_scaling_factor = -ERANGE,
> +	},
> +	{
> +		.name = "out of min range",
> +		.src = DRM_RECT_INIT(0, 0, 2 << 16, 2 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 1 << 16),
> +		.min_range = 3, .max_range = 5,
> +		.expected_scaling_factor = -ERANGE,
> +	},
> +	{
> +		.name = "zero dst",
> +		.src = DRM_RECT_INIT(0, 0, 2 << 16, 2 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, 0 << 16, 0 << 16),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = 0,
> +	},
> +	{
> +		.name = "negative src",
> +		.src = DRM_RECT_INIT(0, 0, -(1 << 16), -(1 << 16)),
> +		.dst = DRM_RECT_INIT(0, 0, 1 << 16, 1 << 16),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = -EINVAL,
> +	},
> +	{
> +		.name = "negative dst",
> +		.src = DRM_RECT_INIT(0, 0, 1 << 16, 1 << 16),
> +		.dst = DRM_RECT_INIT(0, 0, -(1 << 16), -(1 << 16)),
> +		.min_range = 0, .max_range = INT_MAX,
> +		.expected_scaling_factor = -EINVAL,
> +	},
> +};
> +
> +static void drm_rect_scale_case_desc(const struct drm_rect_scale_case *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc);
> +
> +static void drm_test_rect_calc_hscale(struct kunit *test)
> +{
> +	const struct drm_rect_scale_case *params = test->param_value;
> +	int scaling_factor;
> +
> +	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
> +					      params->min_range, params->max_range);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
>   	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_scale_gen_params),
>   	{ }
>   };
>   
