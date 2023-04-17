Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2496E4E2E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 18:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2410E40D;
	Mon, 17 Apr 2023 16:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B039210E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ak+a9tIeqQQS59g3P03XDBLoFS95D9519+eSQkJ9J/M=; b=QWzU0GP/PvES9wOEYZ6rFz8F9T
 yq/XLAwkCDkr48TGmDrmvMA3h4wCHEu/levg5xxqvExumHt73JU/1daZJAQ3eftPFavaGeM/COdH7
 AGhA+sE3VylPY3Mvp/UDp3BJY+p7ODIRo/7zRi1b5vhcF3wIYgVWjqhVXYozuH36yBNxVnLof7ghs
 45zkVjk2GuEewu6FGOYZqTSfB4Q4HqECHc307AualD1o/NVjD09elPTeigVS8ztkLSMvePYC9bUbS
 0pqDBChXy6OGW7Gay3+dOguYcQZnAflLksacH++UPn+OFQ2G9Msss0ygsdkVQbujJjS/zVwkTq6+J
 hM6Gqxtw==;
Received: from [177.34.168.16] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1poRcC-003VJ4-GY; Mon, 17 Apr 2023 18:22:04 +0200
Message-ID: <9dce3dc5-15d1-6f4f-943b-99b57b8b8018@igalia.com>
Date: Mon, 17 Apr 2023 13:21:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/5] drm/test: Add test cases for drm_rect_rotate_inv()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230406115338.36228-1-arthurgrillo@riseup.net>
 <20230406115338.36228-6-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230406115338.36228-6-arthurgrillo@riseup.net>
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
> Insert a parameterized test for the drm_rect_rotate_inv() to ensure its
> correctness and prevent future regressions. The test covers all rotation
> modes.
> 
> It uses the same test cases from drm_test_rect_rotate().
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Thanks for the patch!

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index 1269dfc8b756..6d85e78ba903 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -543,6 +543,16 @@ static void drm_test_rect_rotate(struct kunit *test)
>   	drm_rect_compare(test, &r, &params->expected);
>   }
>   
> +static void drm_test_rect_rotate_inv(struct kunit *test)
> +{
> +	const struct drm_rect_rotate_case *params = test->param_value;
> +	struct drm_rect r = params->expected;
> +
> +	drm_rect_rotate_inv(&r, params->width, params->height, params->rotation);
> +
> +	drm_rect_compare(test, &r, &params->rect);
> +}
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
> @@ -552,6 +562,7 @@ static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE_PARAM(drm_test_rect_calc_hscale, drm_rect_hscale_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_rect_calc_vscale, drm_rect_vscale_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_rect_rotate_inv, drm_rect_rotate_gen_params),
>   	{ }
>   };
>   
