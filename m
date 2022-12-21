Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC165370A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129B310E487;
	Wed, 21 Dec 2022 19:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC7410E487
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gP4neeR+eGVx4MJgy6AREA0ivbGU/yLyLXgRRiCyIE8=; b=kRF7lFbRBphwcKMa73a9bdhsqA
 OjnNctF35iUIfNb/MzvrSBw0PlseObzDnMFFE+mPRXk2eJThuTBHoXTJPTSMaGwYTPczdFuAWzzIw
 XeNGCSsGe9UmUSHCWub4D572WQ+fX+DsOseq6q2xutcIHgd6wNkuylpoCzfTvIoA/C+7ndiF3vyrE
 1leB/cpYu5rqn9cAuS+ZWssmLY7DBpb9JaZ1ipE8rWQynyEdYuViJC2d+0+f/E3ZuWlTPmGeMpOOy
 cAeopiVqnSbOUBX6gHtP8fLD3xuft5iT7VnXYW6chf7glrJMd3kfTsBC2yYHOFYeNWHUDffXJY7T0
 4MogPtSg==;
Received: from [168.205.245.125] (helo=[10.5.56.124])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p84o4-007eys-DE; Wed, 21 Dec 2022 20:31:12 +0100
Message-ID: <731f53ce-333e-02fc-e69f-747d9ca09459@igalia.com>
Date: Wed, 21 Dec 2022 16:30:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/13] drm/format-helper: Comment on RGB888 byte order
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-3-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221220161145.27568-3-tzimmermann@suse.de>
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
> RGB888 is different than the other formats as most of its pixels are
> unaligned and therefore helper functions do not use endianness conversion
> helpers. Comment on this in the source code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>  drivers/gpu/drm/drm_format_helper.c            | 1 +
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 74ff33c2ddaa..b98bd7c5caee 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -404,6 +404,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
>  
>  	for (x = 0; x < pixels; x++) {
>  		pix = le32_to_cpu(sbuf32[x]);
> +		/* write blue-green-red to output in little endianness */
>  		*dbuf8++ = (pix & 0x000000FF) >>  0;
>  		*dbuf8++ = (pix & 0x0000FF00) >>  8;
>  		*dbuf8++ = (pix & 0x00FF0000) >> 16;
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 2191e57f2297..cd1d7da3483c 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -407,6 +407,10 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>  	iosys_map_set_vaddr(&src, xrgb8888);
>  
> +	/*
> +	 * RGB888 expected results are already in little-endian
> +	 * order, so there's no need to convert the test output.
> +	 */
>  	drm_fb_xrgb8888_to_rgb888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>  }
