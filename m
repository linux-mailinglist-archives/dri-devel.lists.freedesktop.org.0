Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13B799134
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E7110E956;
	Fri,  8 Sep 2023 20:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3210E956
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:46:35 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Rj7SV5xTdz9t74;
 Fri,  8 Sep 2023 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1694205995; bh=LaM22m0U2Eli/oio4qvrPVmj6h2e0nMGwJA77B3gzPU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eSKfobZ/tZWb9L3jCg4GjsegW9phlvbiBSt4xpAMUd+0EMjugSXEVfXP0EV4OgC/X
 Inv/yLgeBPE2sTnAqfm8A4vnot9EBczqh4L/1tGVeclYm9hX4dk/ipIbrBoKrdznmi
 Cvo6Bf2FiJP83v5cxHL7fvOeYejvYzxop9g12ZQg=
X-Riseup-User-ID: E871C66ABABA5ABE84F71918891449B234914FF184A983EF8CBFEED1CDAF0756
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rj7SR67ZGzJnsw;
 Fri,  8 Sep 2023 20:46:31 +0000 (UTC)
Message-ID: <b705023e-2943-1288-3ac7-b5737bbbea5b@riseup.net>
Date: Fri, 8 Sep 2023 17:46:33 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tests: Zero initialize fourccs_out
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
References: <20230901-zero-init-fourcc-list-test-v1-1-68bc4cc738c8@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230901-zero-init-fourcc-list-test-v1-1-68bc4cc738c8@riseup.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 9/1/23 15:52, Arthur Grillo wrote:
> fourccs_out array is not initialized. As the
> drm_fb_build_fourcc_list() doesn't necessarily change all the array,
> and the test compares all of it, the comparison could fail if the
> array is not initialized. Zero initialize the array to fix this.
> 
> Fixes: 371e0b186a13 ("drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()")
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Applied to drm-misc/drm-misc-next!

Thanks!
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 79bc9d4bbd71..1a6bd291345d 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -1165,7 +1165,7 @@ KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fou
>   static void drm_test_fb_build_fourcc_list(struct kunit *test)
>   {
>   	const struct fb_build_fourcc_list_case *params = test->param_value;
> -	u32 fourccs_out[TEST_BUF_SIZE];
> +	u32 fourccs_out[TEST_BUF_SIZE] = {0};
>   	size_t nfourccs_out;
>   	struct drm_device *drm;
>   	struct device *dev;
> 
> ---
> base-commit: 8e455145d8f163aefa6b9cc29478e0a9f82276e6
> change-id: 20230901-zero-init-fourcc-list-test-2c934b6b7eb8
> 
> Best regards,
