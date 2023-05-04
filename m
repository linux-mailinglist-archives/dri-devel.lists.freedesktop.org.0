Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035466F6C67
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4010110E481;
	Thu,  4 May 2023 12:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612C710E467;
 Thu,  4 May 2023 12:52:24 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-965a68abfd4so81989266b.2; 
 Thu, 04 May 2023 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683204741; x=1685796741;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mAXCYaqKPFMhZo2q22SmgQUX+tkKIT9oL9j4vw+MQzo=;
 b=sLpAWEHqVH5fNCOCwQ87gL+jpA/JIotyIkk4C7aqLz1zeFwlrUGcLk/10ZmFB09Ztd
 NfXgZ1bL47YZgapGkxL55DLRCp/+C/ppJrigyfat2G/554+T50KHOLnksb8SBbBv7jJz
 CgdygFnojs2QksiGMkwjQ32aE3nORa1oQ9j5t64OQ8PJy65/E59ccHZD0ujx8gr30oIP
 cNKuPXyCmsnlCVyFOQ6+RoBR+FXD+oYUI3PBgK+DZxKBzoTwQ9XBmrNEr38aiJxumPtM
 bJerJEmTC3C8jC9lJkAS45D88xnnaACGSu+LS6asxnw1q6Ci2AQOAnvRR1D0E7M27Rdu
 hAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683204741; x=1685796741;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mAXCYaqKPFMhZo2q22SmgQUX+tkKIT9oL9j4vw+MQzo=;
 b=f2ECsyfEMSzmcg6S6iOQ31ukLlefP8qERkZyEfk0htR+WJbt+G6kDuuqV7vrh64eCi
 7aicTlP3jcWpuZwXrh6Lw+78aeDXadQMElDRpRYCgEGQSU2n0/H3iwY2qEzMlrpAxXau
 M18IVfTJ2ecTLSxC7X63GNuuTTjx9eMitlRcfr8m4zUWjfvkZJOs0R/nFlkP/dEyhwrM
 Sz+wASjFga6kAS5ZIqEVZ9gvr4wjHhdOR713iyWFKk4bDpBHmqkHmwlf3KBMqsIT58G7
 iHjeXpLEpHo7jpNKibDrPCYVMix0tWP+IoSiEcWOKcCwZ2dbFbT1GZb7BQ0xIhLZ0q8e
 /gBA==
X-Gm-Message-State: AC+VfDzp86IKnyGJBZPPZp8VQDokJAZpUYIsc6pbz9YRtsY2q9U0sa7l
 3A6MJfObV5eLTNq5KzwIBnA=
X-Google-Smtp-Source: ACHHUZ41EEQvT2ChbUpnFxvDKcIl4VCC12Uvr1mYQ+vwdCI9X1pN/HetH+nGyNe533ADOmA++qcfYQ==
X-Received: by 2002:a17:907:9807:b0:953:7e25:2156 with SMTP id
 ji7-20020a170907980700b009537e252156mr6295824ejc.51.1683204740663; 
 Thu, 04 May 2023 05:52:20 -0700 (PDT)
Received: from [192.168.178.21] (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 ml24-20020a170906cc1800b0094e6a9c1d24sm19079689ejb.12.2023.05.04.05.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 05:52:20 -0700 (PDT)
Message-ID: <8b45166a-2256-c0b7-78e6-57a3663fab3c@gmail.com>
Date: Thu, 4 May 2023 14:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/13] drm: add drm_exec selftests v2
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-3-christian.koenig@amd.com>
 <c5171667-75e2-7b7c-38a6-19d256445c38@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <c5171667-75e2-7b7c-38a6-19d256445c38@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maira,

Am 04.05.23 um 14:07 schrieb Maíra Canal:
> Hi Christian,
>
> It would be nice if you use the KUnit macros, instead of pr_info.

yeah this was initially written before the DRM tests moved to KUnit and 
I only quickly converted it over. Going to give this a cleanup.

Thanks,
Christian.

>
> On 5/4/23 08:51, Christian König wrote:
>> Largely just the initial skeleton.
>>
>> v2: add array test as well
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/Kconfig               |  1 +
>>   drivers/gpu/drm/tests/Makefile        |  3 +-
>>   drivers/gpu/drm/tests/drm_exec_test.c | 96 +++++++++++++++++++++++++++
>>   3 files changed, 99 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 2dc81eb062eb..068e574e234e 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -80,6 +80,7 @@ config DRM_KUNIT_TEST
>>       select DRM_BUDDY
>>       select DRM_EXPORT_FOR_TESTS if m
>>       select DRM_KUNIT_TEST_HELPERS
>> +    select DRM_EXEC
>>       default KUNIT_ALL_TESTS
>>       help
>>         This builds unit tests for DRM. This option is not useful for
>> diff --git a/drivers/gpu/drm/tests/Makefile 
>> b/drivers/gpu/drm/tests/Makefile
>> index bca726a8f483..ba7baa622675 100644
>> --- a/drivers/gpu/drm/tests/Makefile
>> +++ b/drivers/gpu/drm/tests/Makefile
>> @@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>>       drm_modes_test.o \
>>       drm_plane_helper_test.o \
>>       drm_probe_helper_test.o \
>> -    drm_rect_test.o
>> +    drm_rect_test.o    \
>> +    drm_exec_test.o
>>     CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c 
>> b/drivers/gpu/drm/tests/drm_exec_test.c
>> new file mode 100644
>> index 000000000000..26aa13e62d22
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>> @@ -0,0 +1,96 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2019 Intel Corporation
>> + */
>> +
>> +#define pr_fmt(fmt) "drm_exec: " fmt
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <linux/module.h>
>> +#include <linux/prime_numbers.h>
>> +
>> +#include <drm/drm_exec.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_gem.h>
>> +
>> +#include "../lib/drm_random.h"
>> +
>> +static struct drm_device dev;
>> +
>> +static void drm_exec_sanitycheck(struct kunit *test)
>> +{
>> +    struct drm_exec exec;
>> +
>> +    drm_exec_init(&exec, true);
>> +    drm_exec_fini(&exec);
>> +    pr_info("%s - ok!\n", __func__);
>
> Here you could use KUNIT_SUCCEED(test).
>
>> +}
>> +
>> +static void drm_exec_lock1(struct kunit *test)
>
> Is there a reason to call the function drm_exec_lock1 instead of
> just drm_exec_lock?
>
>> +{
>> +    struct drm_gem_object gobj = { };
>> +    struct drm_exec exec;
>> +    int ret;
>> +
>> +    drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
>> +
>> +    drm_exec_init(&exec, true);
>> +    drm_exec_while_not_all_locked(&exec) {
>> +        ret = drm_exec_prepare_obj(&exec, &gobj, 1);
>> +        drm_exec_continue_on_contention(&exec);
>> +        if (ret) {
>> +            drm_exec_fini(&exec);
>> +            pr_err("%s - err %d!\n", __func__, ret);
>
> Here you could use KUNIT_FAIL. Same for the other function.
>
> Actually, it would be better if you created a function `exit`
> associated with the test suite, where you would call drm_exec_fini,
> and checked the ret variable with KUNIT_EXPECT_EQ(test, ret, 0) in
> the test.
>
>> +            return;
>> +        }
>> +    }
>> +    drm_exec_fini(&exec);
>> +    pr_info("%s - ok!\n", __func__);
>> +}
>> +
>> +static void drm_exec_lock_array(struct kunit *test)
>> +{
>> +    struct drm_gem_object gobj1 = { };
>> +    struct drm_gem_object gobj2 = { };
>> +    struct drm_gem_object *array[] = { &gobj1, &gobj2 };
>> +    struct drm_exec exec;
>> +    int ret;
>> +
>> +    drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
>> +    drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
>> +
>> +    drm_exec_init(&exec, true);
>> +    ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array), 0);
>> +    if (ret) {
>> +        drm_exec_fini(&exec);
>> +        pr_err("%s - err %d!\n", __func__, ret);
>> +        return;
>> +    }
>> +    drm_exec_fini(&exec)> +    pr_info("%s - ok!\n", __func__);
>> +}
>> +
>> +static int drm_exec_suite_init(struct kunit_suite *suite)
>> +{
>> +    kunit_info(suite, "Testing DRM exec manager\n");
>
> Isn't this already clear by the name of the test?
>
> Best Regards,
> - Maíra Canal
>
>> +    return 0;
>> +}
>> +
>> +static struct kunit_case drm_exec_tests[] = {
>> +    KUNIT_CASE(drm_exec_sanitycheck),
>> +    KUNIT_CASE(drm_exec_lock1),
>> +    KUNIT_CASE(drm_exec_lock_array),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite drm_exec_test_suite = {
>> +    .name = "drm_exec",
>> +    .suite_init = drm_exec_suite_init,
>> +    .test_cases = drm_exec_tests,
>> +};
>> +
>> +kunit_test_suite(drm_exec_test_suite);
>> +
>> +MODULE_AUTHOR("AMD");
>> +MODULE_LICENSE("GPL and additional rights");

