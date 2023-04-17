Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBD6E4E1B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6470B10E09D;
	Mon, 17 Apr 2023 16:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFBF10E09D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7EzVXpnQ5bcMSNOTH3QR42KSiszjLQkraxZ7Rt4lpU0=; b=oGVga7LF6mA3MKpbcgiI0hZIbh
 sUND25gZnbgKZIKEL39hKWCnmKkznfuGNxsD0aEdtjeyE8lEcx9z722J5QwdlLJAUrM6GSqne99CS
 tTwkAnfWnJsSDDUJgIxRodJfTLgKdlBfbdRi1wStbbsB65fnP0foSQIcZj48EXfw7Y+wZ9rRInm02
 hH8UE+dHQAWe9z62Hn+UCBsnq9IZXgNUgMUdgXQ5vHhwT4+WkP3ia6DS+T6Dm55zUS0HbAQoAyyRO
 8ljicm1tfB3QDMWEucE6ImWRxQNKqxvgct8vV7u/cwJOZPomifq3q0mQBcx4R95UkfudQejMtdYSh
 lt8Rb9zQ==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1poRYa-003VF3-9A; Mon, 17 Apr 2023 18:18:20 +0200
Message-ID: <948ebb90-427e-a838-be19-5dc3f570251a@igalia.com>
Date: Mon, 17 Apr 2023 13:18:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/5] drm/tests: Add test cases for drm_rect_intersect()
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230406115338.36228-1-arthurgrillo@riseup.net>
 <20230406115338.36228-2-arthurgrillo@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230406115338.36228-2-arthurgrillo@riseup.net>
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
> Insert parameterized tests for the drm_rect_intersect() to ensure
> correctness and prevent future regressions.
> 
> Also, create a helper for testing if two drm_rects are equal.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Thanks for the patch!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 148 ++++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index e9809ea32696..33584f63be37 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -9,6 +9,17 @@
>   
>   #include <drm/drm_rect.h>
>   
> +#include <linux/string_helpers.h>
> +
> +static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
> +			     const struct drm_rect *expected)
> +{
> +	KUNIT_EXPECT_EQ(test, r->x1, expected->x1);
> +	KUNIT_EXPECT_EQ(test, r->y1, expected->y1);
> +	KUNIT_EXPECT_EQ(test, drm_rect_width(r), drm_rect_width(expected));
> +	KUNIT_EXPECT_EQ(test, drm_rect_height(r), drm_rect_height(expected));
> +}
> +
>   static void drm_test_rect_clip_scaled_div_by_zero(struct kunit *test)
>   {
>   	struct drm_rect src, dst, clip;
> @@ -196,11 +207,148 @@ static void drm_test_rect_clip_scaled_signed_vs_unsigned(struct kunit *test)
>   	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
>   }
>   
> +struct drm_rect_intersect_case {
> +	const char *description;
> +	struct drm_rect r1, r2;
> +	bool should_be_visible;
> +	struct drm_rect expected_intersection;
> +};
> +
> +static const struct drm_rect_intersect_case drm_rect_intersect_cases[] = {
> +	{
> +		.description = "top-left x bottom-right",
> +		.r1 = DRM_RECT_INIT(1, 1, 2, 2),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
> +	},
> +	{
> +		.description = "top-right x bottom-left",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(1, -1, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "bottom-left x top-right",
> +		.r1 = DRM_RECT_INIT(1, -1, 2, 2),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "bottom-right x top-left",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(1, 1, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
> +	},
> +	{
> +		.description = "right x left",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 1),
> +		.r2 = DRM_RECT_INIT(1, 0, 3, 1),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "left x right",
> +		.r1 = DRM_RECT_INIT(1, 0, 3, 1),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 1),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 1, 1),
> +	},
> +	{
> +		.description = "up x bottom",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 2),
> +		.r2 = DRM_RECT_INIT(0, -1, 1, 3),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(0, 0, 1, 2),
> +	},
> +	{
> +		.description = "bottom x up",
> +		.r1 = DRM_RECT_INIT(0, -1, 1, 3),
> +		.r2 = DRM_RECT_INIT(0, 0, 1, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(0, 0, 1, 2),
> +	},
> +	{
> +		.description = "touching corner",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
> +		.r2 = DRM_RECT_INIT(1, 1, 2, 2),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 0, 0),
> +	},
> +	{
> +		.description = "touching side",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
> +		.r2 = DRM_RECT_INIT(1, 0, 1, 1),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(1, 0, 0, 1),
> +	},
> +	{
> +		.description = "equal rects",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(0, 0, 2, 2),
> +	},
> +	{
> +		.description = "inside another",
> +		.r1 = DRM_RECT_INIT(0, 0, 2, 2),
> +		.r2 = DRM_RECT_INIT(1, 1, 1, 1),
> +		.should_be_visible = true,
> +		.expected_intersection = DRM_RECT_INIT(1, 1, 1, 1),
> +	},
> +	{
> +		.description = "far away",
> +		.r1 = DRM_RECT_INIT(0, 0, 1, 1),
> +		.r2 = DRM_RECT_INIT(3, 6, 1, 1),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(3, 6, -2, -5),
> +	},
> +	{
> +		.description = "points intersecting",
> +		.r1 = DRM_RECT_INIT(5, 10, 0, 0),
> +		.r2 = DRM_RECT_INIT(5, 10, 0, 0),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(5, 10, 0, 0),
> +	},
> +	{
> +		.description = "points not intersecting",
> +		.r1 = DRM_RECT_INIT(0, 0, 0, 0),
> +		.r2 = DRM_RECT_INIT(5, 10, 0, 0),
> +		.should_be_visible = false,
> +		.expected_intersection = DRM_RECT_INIT(5, 10, -5, -10),
> +	},
> +};
> +
> +static void drm_rect_intersect_case_desc(const struct drm_rect_intersect_case *t, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> +		 "%s: " DRM_RECT_FMT " x " DRM_RECT_FMT,
> +		 t->description, DRM_RECT_ARG(&t->r1), DRM_RECT_ARG(&t->r2));
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_rect_intersect, drm_rect_intersect_cases, drm_rect_intersect_case_desc);
> +
> +static void drm_test_rect_intersect(struct kunit *test)
> +{
> +	const struct drm_rect_intersect_case *params = test->param_value;
> +	struct drm_rect r1_aux = params->r1;
> +	bool visible;
> +
> +	visible = drm_rect_intersect(&r1_aux, &params->r2);
> +
> +	KUNIT_EXPECT_EQ(test, visible, params->should_be_visible);
> +	drm_rect_compare(test, &r1_aux, &params->expected_intersection);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
> +	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
>   	{ }
>   };
>   
