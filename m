Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0E791BCF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE5D10E3AD;
	Mon,  4 Sep 2023 16:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB36510E3AD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CCFD94136E;
 Mon,  4 Sep 2023 18:58:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBg7Zq6v5-25; Mon,  4 Sep 2023 18:58:28 +0200 (CEST)
Message-ID: <3a1a7cf0-a6b5-a49c-d2d5-70b98dac2090@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1693846707; bh=vbtkHS3GXMgdekiPy8pAFuNomWg0qZQXZz2m9oUw9m8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QJPidFv4nMus8WKcfStCn+VkjlUo9zCP7x93XBrCy2mXOR+/I178aKYZ9zGnOVTk7
 HFCjH6mOvN5FZ6yi1wcNCOBHcyDDbAGsladqQhzk4JWdgKfMtT7/7Y/FFjvIzH+nP/
 +yl1SUwTcmTz3ROFlaQ5eESuyRqYg2vkwtbKMBjai7HLgAyrmoRGtmRAGvk7/+Nlyr
 G2wBANvWegBmZ9sLwvAXIOVZdvm4ZL9BycKWWfFZtCi4nEYdTH6sOfdexYvR1yins2
 JErkSMCfZ1Qoh2Au3+2nJ0AcsZfm9KctseSkU1tr9HtOByHZllqjXPr6ETjvBmUgNi
 tyc/Vt40krjyw==
Date: Mon, 4 Sep 2023 13:57:43 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 03/10] drm/tests: Add test case for
 drm_internal_framebuffer_create()
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-4-gcarlos@disroot.org>
 <59f0c24e-6483-3242-2af8-a2fac5697425@riseup.net>
Content-Language: pt-BR, en-US
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <59f0c24e-6483-3242-2af8-a2fac5697425@riseup.net>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maíra,

On 8/26/23 10:58, Maíra Canal wrote:
> Hi Carlos,
>
> On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
>> Introduce a test to cover the creation of framebuffer with
>> modifier on a device that doesn't support it.
>>
>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>> ---
>>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c 
>> b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> index aeaf2331f9cc..b20871e88995 100644
>> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> @@ -396,7 +396,35 @@ static void drm_framebuffer_test_to_desc(const 
>> struct drm_framebuffer_test *t, c
>>   KUNIT_ARRAY_PARAM(drm_framebuffer_create, 
>> drm_framebuffer_create_cases,
>>             drm_framebuffer_test_to_desc);
>>   +/*
>> + * This test is very similar to drm_test_framebuffer_create, except 
>> that it
>> + * set mock->mode_config.fb_modifiers_not_supported member to 1, 
>> covering
>> + * the case of trying to create a framebuffer with modifiers without 
>> the
>> + * device really supporting it.
>> + */
>> +static void drm_test_framebuffer_modifiers_not_supported(struct 
>> kunit *test)
>> +{
>> +    struct drm_mock *mock = test->priv;
>> +    struct drm_device *dev = &mock->dev;
>> +    int buffer_created = 0;
>> +
>> +    /* A valid cmd with modifier */
>> +    struct drm_mode_fb_cmd2 cmd = {
>> +        .width = MAX_WIDTH, .height = MAX_HEIGHT,
>> +        .pixel_format = DRM_FORMAT_ABGR8888, .handles = { 1, 0, 0 },
>> +        .offsets = { UINT_MAX / 2, 0, 0 }, .pitches = { 4 * 
>> MAX_WIDTH, 0, 0 },
>> +        .flags = DRM_MODE_FB_MODIFIERS,
>> +    };
>> +
>> +    mock->private = &buffer_created;
>> +    dev->mode_config.fb_modifiers_not_supported = 1;
>> +
>> +    drm_internal_framebuffer_create(dev, &cmd, NULL);
>> +    KUNIT_EXPECT_EQ(test, 0, buffer_created);
>> +}
>> +
>>   static struct kunit_case drm_framebuffer_tests[] = {
>> +    KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>
> Could we preserve alphabetical order?
>
I've see a lot of other tests files with this ordered by every KUNIT_CASE()
coming before KUNIT_CASE_PARAM(), with each set ordered among themselves.
Did younoticed that or are you suggesting ordering it even so? Or maybe
you're referring about another unordered thing that I didn't noticed?

Thanks,
Carlos

> Best Regards,
> - Maíra
>
>> KUNIT_CASE_PARAM(drm_test_framebuffer_create, 
>> drm_framebuffer_create_gen_params),
>>       { }
>>   };
