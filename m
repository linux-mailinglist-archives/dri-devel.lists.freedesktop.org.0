Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA776791D6D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 20:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6541E10E3D8;
	Mon,  4 Sep 2023 18:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9A910E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 18:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 64D5541161;
 Mon,  4 Sep 2023 20:52:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYq71GA_W0lr; Mon,  4 Sep 2023 20:52:45 +0200 (CEST)
Message-ID: <8e52dc5e-bc5a-6be7-44d8-da4f2eb3219d@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1693853565; bh=axV+1WlS1QgI12QnumUOXxcJw1ADKQpC8KIOA6d6lbM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LMVBvBeQ8UEHTZMY59l8y1XyYy3tgX9lCvnZRnd34rmknckxn4RpcjGwsqP3ihbwY
 8n2e+y+L8b24u/6U91mJVQtgxOLYV6kv3FJ3qjw4v/EVuvUaMeu1C49UTlANMUG2C6
 2rbaFMv6fo5qcVXginJZ6OPQRXvfMiO8dyQAnD/a6oi2M8YcsBks24XaL3sS4JpIrb
 cBawfJZceHjoNZ6VYm1NoTl+TqnB2B68Oyq7abRs9pniaSFPd4tfpSeR290MuLIIAY
 60+f0IaxrmQEBZMLSiEicAp3L3uNiuWLu9DtJd1nxmnUWTO1urse+ELHFidw3QDlEa
 OVeGeiP56hoXQ==
Date: Mon, 4 Sep 2023 15:52:00 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 06/10] drm/tests: Add test for drm_framebuffer_lookup()
Content-Language: pt-BR, en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org
References: <20230825160725.12861-1-gcarlos@disroot.org>
 <20230825160725.12861-7-gcarlos@disroot.org>
 <4501ea3a-071a-47ee-5887-8e1e78e84282@riseup.net>
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <4501ea3a-071a-47ee-5887-8e1e78e84282@riseup.net>
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

On 8/26/23 11:13, Maíra Canal wrote:
> Hi Carlos,
>
> On 8/25/23 13:07, Carlos Eduardo Gallo Filho wrote:
>> Add a single KUnit test case for the drm_framebuffer_lookup function.
>>
>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>> ---
>>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 28 ++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c 
>> b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> index 16d9cf4bed88..3d14d35b4c4d 100644
>> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> @@ -8,6 +8,7 @@
>>   #include <kunit/test.h>
>>     #include <drm/drm_device.h>
>> +#include <drm/drm_drv.h>
>>   #include <drm/drm_mode.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -370,6 +371,10 @@ static int drm_framebuffer_test_init(struct 
>> kunit *test)
>>       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mock);
>>       dev = &mock->dev;
>>   +    dev->driver = kunit_kzalloc(test, sizeof(*dev->driver), 
>> GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev->driver);
>> +
>> +    idr_init_base(&dev->mode_config.object_idr, 1);
>
> Shouldn't we start to use drm_framebuffer_init()?
Do you mean about replace drm_mode_object_add() to drm_framebuffer_init()?
If so, what could be the advantages of using it? It seems to just do the
same of drm_mode_object_add() (by actually calling it) but doing some more
things which is not really needed by this test (like adding fb to device
fb_list and etc). Am I missing something important?

Thanks,
Carlos

> Best Regards,
> - Maíra
>
>> mutex_init(&dev->mode_config.fb_lock);
>>       INIT_LIST_HEAD(&dev->mode_config.fb_list);
>>       dev->mode_config.num_fb = 0;
>> @@ -530,8 +535,31 @@ static void drm_test_framebuffer_cleanup(struct 
>> kunit *test)
>>       KUNIT_ASSERT_EQ(test, dev->mode_config.num_fb, 0);
>>   }
>>   +static void drm_test_framebuffer_lookup(struct kunit *test)
>> +{
>> +    struct drm_mock *mock = test->priv;
>> +    struct drm_device *dev = &mock->dev;
>> +    struct drm_framebuffer fb1 = { };
>> +    struct drm_framebuffer *fb2;
>> +    uint32_t id = 0;
>> +    int ret;
>> +
>> +    ret = drm_mode_object_add(dev, &fb1.base, DRM_MODE_OBJECT_FB);
>> +    KUNIT_ASSERT_EQ(test, ret, 0);
>> +    id = fb1.base.id;
>> +
>> +    /* Looking for fb1 */
>> +    fb2 = drm_framebuffer_lookup(dev, NULL, id);
>> +    KUNIT_EXPECT_PTR_EQ(test, fb2, &fb1);
>> +
>> +    /* Looking for an inexistent framebuffer */
>> +    fb2 = drm_framebuffer_lookup(dev, NULL, id + 1);
>> +    KUNIT_EXPECT_NULL(test, fb2);
>> +}
>> +
>>   static struct kunit_case drm_framebuffer_tests[] = {
>>       KUNIT_CASE(drm_test_framebuffer_cleanup),
>> +    KUNIT_CASE(drm_test_framebuffer_lookup),
>> KUNIT_CASE(drm_test_framebuffer_modifiers_not_supported),
>>       KUNIT_CASE_PARAM(drm_test_framebuffer_check_src_coords, 
>> check_src_coords_gen_params),
>>       KUNIT_CASE_PARAM(drm_test_framebuffer_create, 
>> drm_framebuffer_create_gen_params),
