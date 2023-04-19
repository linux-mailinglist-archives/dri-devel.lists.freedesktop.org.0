Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3066E7057
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553ED10E7FD;
	Wed, 19 Apr 2023 00:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D806B10E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtqCxoOhdcwU74rYSARCDRRowSo1VscfmTdzHAucP9Q=; b=OopsWu8/6iCBYKzEPeWcUQwO9W
 Vnyb7qjEW3hMw38VMWCQSq+/+CaQwXUgzmgYD7FhSCzqEAij9u+PJAEqRwKE4gVAGs8g5Qq/Nm8Yo
 uY/UrAnDrDeSeSe8Q69FFLaIIspenMlMR3l2xtHqpODllFygTLft8tu1bCGJlnA8SQII7DrxodTs3
 L0IHWXT0PeY41B/LHc9oEgX5DVOCH/w1P2sM9DeZvhSylDYLELYkwDj+wQIL1ceZ52qnAPNuDmnD1
 gwuOACz1leQDAEFg8K299JKdrugYpnF0a8PO4OrE/nO32Zjon2PKJ8jz8aYv2j9dZdw88xBwxPIZC
 ZwYvzszQ==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1povRI-004UYA-5v; Wed, 19 Apr 2023 02:12:48 +0200
Message-ID: <a95cd74b-ce50-03c5-5f69-d8b78e1414c4@igalia.com>
Date: Tue, 18 Apr 2023 21:12:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 3/5] drm/tests: Add test cases for
 drm_rect_calc_vscale()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230418230146.461129-1-arthurgrillo@riseup.net>
 <20230418230146.461129-4-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230418230146.461129-4-arthurgrillo@riseup.net>
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
> Insert parameterized test for the drm_rect_calc_vscale() to ensure
> correctness and prevent future regressions. Besides the test for the
> usual case, tests the exceptions.
> 
> It uses the same struct from drm_rect_calc_hscale().
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Thanks for the quick fix!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index aae682ad9ee1..fd89e62ad2cb 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -414,6 +414,17 @@ static void drm_test_rect_calc_hscale(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
>   }
>   
> +static void drm_test_rect_calc_vscale(struct kunit *test)
> +{
> +	const struct drm_rect_scale_case *params = test->param_value;
> +	int scaling_factor;
> +
> +	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
> +					      params->min_range, params->max_range);
> +
> +	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
> @@ -421,6 +432,7 @@ static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
>   	KUNIT_CASE_PARAM(drm_test_rect_intersect, drm_rect_intersect_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_scale_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_scale_gen_params),
>   	{ }
>   };
>   
