Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B06E4E2C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AF010E32C;
	Mon, 17 Apr 2023 16:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BA210E32C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0bwVR5LY7Ko2cjNoGHFeSQuL1nPA+SvGcqmtbF8HEPI=; b=sz9UPk9SWs7R4l3PbJDag9ZS9B
 hpWFXSxNpvQFre6N3qogZvxFzuNxtBFExZ3cun+EbaCNS/7jO1AXEKgrb0baM33dzd96hL62NIlpc
 VJE9rLmB2+nkhb3oi/jfNdu5G4cRWE0yzxFhT/4jCyk82bnl8GxGFhMupxlDvE7I2F+eEjBIEVuc5
 gkN4LerSSePF/+kvXwkBq+eoWECuNdiZ9/5h+U5gQvS2anq99JGnk2luIL2qxulnjWcNf4QYpneBE
 GB/jS502iIZjIWSGrKJHXGJIv0PS0uoB34oSZLqYQuQ2FkEKOhXnM6hFj8BjjBUPzm3HDorhl4ivy
 F9A+Nguw==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1poRbM-003VHx-AD; Mon, 17 Apr 2023 18:21:12 +0200
Message-ID: <41c41162-65c9-fa97-fe68-11bff03e4904@igalia.com>
Date: Mon, 17 Apr 2023 13:21:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 4/5] drm/tests: Add test cases for drm_rect_rotate()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230406115338.36228-1-arthurgrillo@riseup.net>
 <20230406115338.36228-5-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230406115338.36228-5-arthurgrillo@riseup.net>
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

On 4/6/23 08:53, Arthur Grillo wrote:
> Insert a parameterized test for the drm_rect_rotate() to ensure
> correctness and prevent future regressions.
> 
> All possible rotation modes are covered by the test.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Thanks for the patch!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 72 +++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index a1fd9b2c5128..1269dfc8b756 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -8,6 +8,7 @@
>   #include <kunit/test.h>
>   
>   #include <drm/drm_rect.h>
> +#include <drm/drm_mode.h>
>   
>   #include <linux/string_helpers.h>
>   #include <linux/errno.h>
> @@ -472,6 +473,76 @@ static void drm_test_rect_calc_vscale(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>   }
>   
> +struct drm_rect_rotate_case {
> +	const char *name;
> +	unsigned int rotation;
> +	struct drm_rect rect;
> +	int width, height;
> +	struct drm_rect expected;
> +};
> +
> +static const struct drm_rect_rotate_case drm_rect_rotate_cases[] = {
> +	{
> +		.name = "reflect-x",
> +		.rotation = DRM_MODE_REFLECT_X,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 5),
> +		.width = 5, .height = 10,
> +		.expected = DRM_RECT_INIT(0, 0, 5, 5),
> +	},
> +	{
> +		.name = "reflect-y",
> +		.rotation = DRM_MODE_REFLECT_Y,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 5),
> +		.width = 5, .height = 10,
> +		.expected = DRM_RECT_INIT(0, 5, 5, 5),
> +	},
> +	{
> +		.name = "rotate-0",
> +		.rotation = DRM_MODE_ROTATE_0,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 5),
> +		.width = 5, .height = 10,
> +		.expected = DRM_RECT_INIT(0, 0, 5, 5),
> +	},
> +	{
> +		.name = "rotate-90",
> +		.rotation = DRM_MODE_ROTATE_90,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 10),
> +		.width = 5, .height = 10,
> +		.expected = DRM_RECT_INIT(0, 0, 10, 5),
> +	},
> +	{
> +		.name = "rotate-180",
> +		.rotation = DRM_MODE_ROTATE_180,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 10),
> +		.width = 5, .height = 10,
> +		.expected = DRM_RECT_INIT(0, 0, 5, 10),
> +	},
> +	{
> +		.name = "rotate-270",
> +		.rotation = DRM_MODE_ROTATE_270,
> +		.rect = DRM_RECT_INIT(0, 0, 5, 10),
> +		.width = 5, .height = 10,
> +		.expected = DRM_RECT_INIT(0, 0, 10, 5),
> +	},
> +};
> +
> +static void drm_rect_rotate_case_desc(const struct drm_rect_rotate_case *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_rect_rotate, drm_rect_rotate_cases, drm_rect_rotate_case_desc);
> +
> +static void drm_test_rect_rotate(struct kunit *test)
> +{
> +	const struct drm_rect_rotate_case *params = test->param_value;
> +	struct drm_rect r = params->rect;
> +
> +	drm_rect_rotate(&r, params->width, params->height, params->rotation);
> +
> +	drm_rect_compare(test, &r, &params->expected);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
> @@ -480,6 +551,7 @@ static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_vscale_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
>   	{ }
>   };
>   
