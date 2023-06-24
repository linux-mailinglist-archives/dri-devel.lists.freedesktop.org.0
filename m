Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E773CCA4
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 22:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29A110E04D;
	Sat, 24 Jun 2023 20:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C450A10E04D
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 20:08:07 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QpQCC11NHzDrFl;
 Sat, 24 Jun 2023 20:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687637287; bh=gkoa1dTfLnxgBCzG4sulny+7mPsoyGOgOz+l8PWrqsM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sYvHA4dAJ5fYfFVSl/JXCbu1hdq5miYMHOQm9eBxMslt07hZsFms/kxAVXmhjRuOd
 ZYJSZQJCLfbTX8wwjQ+iJqIgI6On4xdmm5Pb7fZv/pVESBVAuHTka9G8/GpTIwMJ/g
 CIrhyN9kygFAvgeTIYJqe4gwI7BR+PRrMKoZXjeE=
X-Riseup-User-ID: 86DEDA8FB1D62B7502D64115DAB14EB42DB23597FF397F64381F885CCAB3E282
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QpQC91LMHzFq4c;
 Sat, 24 Jun 2023 20:08:04 +0000 (UTC)
Message-ID: <cb230d14-0d68-7c34-1d53-b206899d33e1@riseup.net>
Date: Sat, 24 Jun 2023 17:08:02 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] Tercera entrega completa
Content-Language: en-US
To: edagarmarjara <edgarmarjara@gmail.com>, linux-kernel@vger.kernel.org
References: <20230619232249.16319-1-edgarmarjara@gmail.com>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230619232249.16319-1-edgarmarjara@gmail.com>
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi edagarmarjara,

First, you need to include a commit message to the patch. Check [1] to 
see a basic guide to submit patches.

On 6/19/23 20:22, edagarmarjara wrote:
> ---
>   drivers/gpu/drm/tests/drm_rect_test.c | 30 +++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
> index e9809ea32696..d03e1d9b208d 100644
> --- a/drivers/gpu/drm/tests/drm_rect_test.c
> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> @@ -35,6 +35,7 @@ static void drm_test_rect_clip_scaled_div_by_zero(struct kunit *test)
>   	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
>   }
>   
> +

This line is not needed. You can run checkpatch.sh to catch common style 
mistakes.

>   static void drm_test_rect_clip_scaled_not_clipped(struct kunit *test)
>   {
>   	struct drm_rect src, dst, clip;
> @@ -196,11 +197,40 @@ static void drm_test_rect_clip_scaled_signed_vs_unsigned(struct kunit *test)
>   	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
>   }
>   
> +static void drm_test_rect_clip_over_scaled_signed_vs_unsigned(struct kunit *test)
> +{
> +	
> +	const void* gem_params(const void *prev, char *desc);

Hum... I guess you don't need this function signature here.

> +	struct drm_rect src, dst, clip;
> +	bool visible;
> +
> +	/*
> +	 * 'clip.x2 - dst.x1 >= dst width' could result a negative
> +	 * src rectangle width which is no longer expected by the
> +	 * code as it's using unsigned types. This could lead to
> +	 * the clipped source rectangle appering visible when it
> +	 * should have been fully clipped. Make sure both rectangles
> +	 * end up invisible.
> +	 * en esta parte cambio los valores y hago por aun mas afuera para el clip scaled
> +	 * para poder saber si al exagerar mas aun la escala sigue funcionando

I believe you can try to explain the test in smaller comments. Sometimes 
the tests explain by itself. Also, avoid to use Spanish in comments.

> +	 */
> +	drm_rect_init(&src, 2, 2, INT_MAX, INT_MAX);
> +	drm_rect_init(&dst, 2, 2, 4, 4);
> +	drm_rect_init(&clip, 6, 6, 3, 3);
> +
> +	visible = drm_rect_clip_scaled(&src, &dst, &clip);
> +	
> +	KUNIT_EXPECT_FALSE_MSG(test, visible, "Destination should not be visible\n");
> +	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");

I believe you could introduce more test cases for this test instead of 
only one.

> +}
> +
> +
>   static struct kunit_case drm_rect_tests[] = {
>   	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
>   	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
> +	KUNIT_CASE(drm_test_rect_clip_over_scaled_signed_vs_unsigned), //Test entrega 2

I believe you could remove the comment here.

[1] https://docs.kernel.org/process/submitting-patches.html

Best Regards,
- Maíra

>   	{ }
>   };
>   
