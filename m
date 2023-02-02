Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36814687BBA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BF010E4EB;
	Thu,  2 Feb 2023 11:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2635310E4EB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 11:10:27 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4P6x0L52hFz9tDh;
 Thu,  2 Feb 2023 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1675336226; bh=XcyKsSgqvTp1LZDfTfFIGXhODFhWmi3YnRDQCIghveQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GJXe+r3DiR4GXu05FYOn6/l73vihK7GmvYysJYGTWbDggwCkOyxuXt1dCfQbZsPc5
 irhpaMG8EerIDyXNqEeUdBl/oIdXCz6Fc5o7jDCxYoHGOfbvU4jOwqEDUxiXMmvuyd
 bRr32fqTtVI6O0tyCNKKPipi8uuwRkNRUl00PTOM=
X-Riseup-User-ID: 7A8A779B12416E418D3FD5367A83EF8D4473AB75831723F00305746725B800F5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4P6x0J1kVmz5vY4;
 Thu,  2 Feb 2023 11:10:23 +0000 (UTC)
Message-ID: <087be51f-1811-f990-a177-acf3c0322728@riseup.net>
Date: Thu, 2 Feb 2023 08:10:20 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/format-helper: Use KUNIT_EXPECT_MEMEQ macro
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, David Gow <davidgow@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230130125554.363481-1-mairacanal@riseup.net>
 <cb9ab0de-ce2c-e062-ebac-196103fd2f1b@suse.de>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <cb9ab0de-ce2c-e062-ebac-196103fd2f1b@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/23 04:10, Thomas Zimmermann wrote:
> 
> 
> Am 30.01.23 um 13:55 schrieb Maíra Canal:
>> Commit b8a926bea8b1 ("kunit: Introduce KUNIT_EXPECT_MEMEQ and
>> KUNIT_EXPECT_MEMNEQ macros") introduced a new macro to compare blocks of
>> memory and, if the test fails, print the result in a human-friendly
>> format. Therefore, use KUNIT_EXPECT_MEMEQ to compare memory blocks in
>> replacement of the KUNIT_EXPECT_EQ macro.
>>
>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied to drm-misc-next!

Best Regards,
- Maíra Canal

> 
>> ---
>>   drivers/gpu/drm/tests/drm_format_helper_test.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> index 34e80eb6d96e..9536829c6e3a 100644
>> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> @@ -597,7 +597,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
>>       drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>>       buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>> -    KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>> +    KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>   }
>>   static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>> @@ -628,7 +628,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
>>       drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>>       buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>> -    KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>> +    KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>   }
>>   static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>> @@ -659,7 +659,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
>>       drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>>       buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
>> -    KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>> +    KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>   }
>>   static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>> @@ -724,7 +724,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>>       drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>>       buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>> -    KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>> +    KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>   }
>>   static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>> @@ -786,7 +786,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>>       drm_fb_xrgb8888_to_argb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>>       buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>> -    KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>> +    KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>   }
>>   static struct kunit_case drm_format_helper_test_cases[] = {
> 
