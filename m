Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117165374C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A0F10E4A7;
	Wed, 21 Dec 2022 19:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B729110E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A389aiNC1fdY+QO/BBd3YJeRClh9LIEifIikRQgsvcc=; b=CQDJIPGY10CAsbc0h9RKoDbsuJ
 aG/ecms45clWSBoMVwyug1YIDdr0LGnHwAJiqlUlNFzcH6Q19pbJuI1Q91rGsFz2LvDmNgleYkrIC
 Gfhmn8OVpb8IUI5WU0UnsSqobZvf4PH2kK1aMcmXKWxVn5SJYo+m45FHSw21v2vyh5Q5fVXK1osJq
 9Mc8EpDPz7jTD1smvPr3/LP04Dw62mTNa4bAQauRalavORW6x4rJjM4tDs8jB/+4CtoMZkUNKOGQJ
 kS3ZPTqcgSPZsoB9Qqtz+0BVGOPF+qKjru/yVEZFkHhoJEB61zmMO0KnnS7waiDxjlXPwhqSXJyEU
 7MJ6gaFQ==;
Received: from 187-26-207-44.3g.claro.net.br ([187.26.207.44]
 helo=[192.168.65.202]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p85E9-007fZK-CN; Wed, 21 Dec 2022 20:58:09 +0100
Message-ID: <d2588c88-80bf-197b-edd8-c63c18dceb3d@igalia.com>
Date: Wed, 21 Dec 2022 16:58:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 05/13] drm/format-helper: Type fixes in format-helper
 tests
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-6-tzimmermann@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221220161145.27568-6-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/22 13:11, Thomas Zimmermann wrote:
> Change the source-buffer type of le32buf_to_cpu() to __le32* to
> reflect endianness. Result buffers are converted to local endianness,
> so instantiate them from regular u8 or u32 types.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 04fe373c9d97..c2411ec808a1 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -279,7 +279,7 @@ static u16 *le16buf_to_cpu(struct kunit *test, const __le16 *buf, size_t buf_siz
>  	return dst;
>  }
>  
> -static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
> +static u32 *le32buf_to_cpu(struct kunit *test, const __le32 *buf, size_t buf_size)
>  {
>  	u32 *dst = NULL;
>  	int n;
> @@ -323,7 +323,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_gray8_result *result = &params->gray8_result;
>  	size_t dst_size;
> -	__u8 *buf = NULL;
> +	u8 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -353,7 +353,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb332_result *result = &params->rgb332_result;
>  	size_t dst_size;
> -	__u8 *buf = NULL;
> +	u8 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -419,7 +419,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_rgb888_result *result = &params->rgb888_result;
>  	size_t dst_size;
> -	__u8 *buf = NULL;
> +	u8 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -453,7 +453,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	const struct convert_xrgb8888_case *params = test->param_value;
>  	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
>  	size_t dst_size;
> -	__u32 *buf = NULL;
> +	u32 *buf = NULL;
>  	__le32 *xrgb8888 = NULL;
>  	struct iosys_map dst, src;
>  
> @@ -475,7 +475,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
>  
