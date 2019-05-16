Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADA208F9
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62562895D7;
	Thu, 16 May 2019 14:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486ED895D7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:03:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so3532150wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 07:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=dWxnYxXzseJZ+7zTbv+LaMWGAD7kvJ0WjqCNBwsS5g0=;
 b=VZKdKevZfWI/7dVBSIQyKOlAQQhywuhUVPqs7rsUA7PxTEZtzmvvr9mjx6wuuYQV0V
 xXNSljTsTWiMD+oqgeiRYyy+KZ5Na9I55+CkJDRv3QKogDhKmi/wODIaSrBX6yTtZTpZ
 Q+YzllIMuMSBIkU8XLOcrOkeNp1BvPYtyK1sfJjfPcnmXUeKHiQ+03r4G/Le/lokj49V
 Z5zozV3tBot/w5r/1ZqlaFZ/3YxJZFJYxDJcaqDMVS3YtXuyrIi/3EAWbJ+KbgpIk9Ga
 xmSywSSkJWQJw7fmNNYRiR/hDPf/bk8ikhfZDbzKpOclz2euXI7FobrFmeN19iz7bSJT
 0ikQ==
X-Gm-Message-State: APjAAAVlM1MPh9tGcL6KexlztxToZzzFtba8PYKEr0nw+XSurgf3SP5z
 qGmXM6qZnpNNt7x/51/XAKY7x5Kd
X-Google-Smtp-Source: APXvYqw88pisgI3w011nHcSjzloTKOfvwB8f+vVLjEWHq6Gzam3cP8r4Vr8k5SNTbCvh1YsI+I8zhA==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr7376713wrm.147.1558015400616; 
 Thu, 16 May 2019 07:03:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k17sm4450371wrm.73.2019.05.16.07.03.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 07:03:19 -0700 (PDT)
Subject: Re: [PATCH libdrm 7/7] add syncobj timeline tests v3
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190516080714.14980-1-david1.zhou@amd.com>
 <20190516080714.14980-7-david1.zhou@amd.com>
 <e9b4e467-775f-e3e0-b842-07e4d12cf093@amd.com>
 <212b7506-58cc-fd48-a0cf-4e6098d0d4b1@gmail.com>
 <786dd8b0-0943-8275-39fc-d88ae9685ad7@amd.com>
 <7f032aed-a83e-6ac7-25fc-0098ceffc7ab@gmail.com>
 <-hr0cw7wplji6kur9szo2dka8ja1pou-3nnay4-uxxtwr-otnhsl1qetv0o1gtgu-lfnxxj8heoqc6a8l96-nzvfofweuygaoki3ql-641t1t-lccynh6ltsf-lty877-volmoddqo3n1-k65ryocb6ryt.1558004857725@email.android.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c8c6dfe1-c8a4-8cdd-1cd4-23facd4e002d@gmail.com>
Date: Thu, 16 May 2019 16:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <-hr0cw7wplji6kur9szo2dka8ja1pou-3nnay4-uxxtwr-otnhsl1qetv0o1gtgu-lfnxxj8heoqc6a8l96-nzvfofweuygaoki3ql-641t1t-lccynh6ltsf-lty877-volmoddqo3n1-k65ryocb6ryt.1558004857725@email.android.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=dWxnYxXzseJZ+7zTbv+LaMWGAD7kvJ0WjqCNBwsS5g0=;
 b=Jyw85Qs3kfJvjamqwtu2zCl1m3VYGfWpQze/+WnpQh0BbAfsAGAPX3txpJYFarnqV8
 EXkLDVw9rVxJPL6C0zBvd4RT5AdqBcEyNz5abteQbElCu+oFsvtE8cRohyJU26MjKs0J
 J+xDvGRSutCJ3FvflFoUcJpIpUCBSbk4FfsViwgvaPfG1XBucRVbJlxbN21VfVce0sQx
 3e+diT8m3rnIqhqZQweZSeIRrkfNc4FfE9fe+SQiDBI7znTmd4FPriN0o0eFoM0toelL
 f9j56mvg7i3arjrEBJWlgRo2Ba829AcL0U+rgD+lyBrH5CUlyC7CuPVIcerfU5xVAZd/
 Fttw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1923871812=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1923871812==
Content-Type: multipart/alternative;
 boundary="------------80B558730A7AEDDDC24C6B2B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------80B558730A7AEDDDC24C6B2B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Oh, please not that problem again :(

Please just try "ssh gitlab.freedesktop.org" if that also times out like 
this you need to contact AMD network IT and ask why ssh once more 
doesn't work.

Christian.

Am 16.05.19 um 13:43 schrieb Zhou, David(ChunMing):
> It mentioned me I cannot push to gitlab directly. After that, I added 
> my ssh pub to gitlab web, and also added gitlab url to git remote.
> then push again, it mentions "connection timeout".
>
> -David
>
> -------- Original Message --------
> Subject: Re: [PATCH libdrm 7/7] add syncobj timeline tests v3
> From: Christian König
> To: "Zhou, David(ChunMing)" ,"Koenig, Christian" ,"Zhou, 
> David(ChunMing)" ,dri-devel@lists.freedesktop.org
> CC:
>
> [CAUTION: External Email]
>
> Am 16.05.19 um 12:19 schrieb zhoucm1:
> >
> >
> > On 2019年05月16日 18:09, Christian König wrote:
> >> [CAUTION: External Email]
> >>
> >> Am 16.05.19 um 10:16 schrieb zhoucm1:
> >>> I was able to push changes to libdrm, but now seems after libdrm is
> >>> migrated to gitlab, I cannot yet. What step do I need to get back my
> >>> permission? I already can login into gitlab with old freedesktop
> >>> account.
> >>>
> >>> @Christian, Can you help submit this patch set to libdrm first?
> >>
> >> Done. And I think you can now request write permission to a repository
> >> through the web-interface and all the "owners" of the project can grant
> >> that to you.
> > Any guide for that? I failed to find where to request permission.
>
> Not of hand. What does the system say when you try to push?
>
> Christian.
>
> >
> > -David
> >>
> >> Christian.
> >>
> >>>
> >>>
> >>> Thanks,
> >>>
> >>> -David
> >>>
> >>>
> >>> On 2019年05月16日 16:07, Chunming Zhou wrote:
> >>>> v2: drop DRM_SYNCOBJ_CREATE_TYPE_TIMELINE, fix timeout calculation,
> >>>>      fix some warnings
> >>>> v3: add export/import and cpu signal testing cases
> >>>>
> >>>> Signed-off-by: Chunming Zhou <david1.zhou@amd.com>
> >>>> Acked-by: Christian König <christian.koenig@amd.com>
> >>>> Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> >>>> ---
> >>>>   tests/amdgpu/Makefile.am     |   3 +-
> >>>>   tests/amdgpu/amdgpu_test.c   |  11 ++
> >>>>   tests/amdgpu/amdgpu_test.h   |  21 +++
> >>>>   tests/amdgpu/meson.build     |   2 +-
> >>>>   tests/amdgpu/syncobj_tests.c | 290
> >>>> +++++++++++++++++++++++++++++++++++
> >>>>   5 files changed, 325 insertions(+), 2 deletions(-)
> >>>>   create mode 100644 tests/amdgpu/syncobj_tests.c
> >>>>
> >>>> diff --git a/tests/amdgpu/Makefile.am b/tests/amdgpu/Makefile.am
> >>>> index 48278848..920882d0 100644
> >>>> --- a/tests/amdgpu/Makefile.am
> >>>> +++ b/tests/amdgpu/Makefile.am
> >>>> @@ -34,4 +34,5 @@ amdgpu_test_SOURCES = \
> >>>>       uve_ib.h \
> >>>>       deadlock_tests.c \
> >>>>       vm_tests.c    \
> >>>> -    ras_tests.c
> >>>> +    ras_tests.c \
> >>>> +    syncobj_tests.c
> >>>> diff --git a/tests/amdgpu/amdgpu_test.c b/tests/amdgpu/amdgpu_test.c
> >>>> index 35c8bf6c..73403fb4 100644
> >>>> --- a/tests/amdgpu/amdgpu_test.c
> >>>> +++ b/tests/amdgpu/amdgpu_test.c
> >>>> @@ -57,6 +57,7 @@
> >>>>   #define DEADLOCK_TESTS_STR "Deadlock Tests"
> >>>>   #define VM_TESTS_STR "VM Tests"
> >>>>   #define RAS_TESTS_STR "RAS Tests"
> >>>> +#define SYNCOBJ_TIMELINE_TESTS_STR "SYNCOBJ TIMELINE Tests"
> >>>>     /**
> >>>>    *  Open handles for amdgpu devices
> >>>> @@ -123,6 +124,12 @@ static CU_SuiteInfo suites[] = {
> >>>>           .pCleanupFunc = suite_ras_tests_clean,
> >>>>           .pTests = ras_tests,
> >>>>       },
> >>>> +    {
> >>>> +        .pName = SYNCOBJ_TIMELINE_TESTS_STR,
> >>>> +        .pInitFunc = suite_syncobj_timeline_tests_init,
> >>>> +        .pCleanupFunc = suite_syncobj_timeline_tests_clean,
> >>>> +        .pTests = syncobj_timeline_tests,
> >>>> +    },
> >>>>         CU_SUITE_INFO_NULL,
> >>>>   };
> >>>> @@ -176,6 +183,10 @@ static Suites_Active_Status suites_active_stat[]
> >>>> = {
> >>>>               .pName = RAS_TESTS_STR,
> >>>>               .pActive = suite_ras_tests_enable,
> >>>>           },
> >>>> +        {
> >>>> +            .pName = SYNCOBJ_TIMELINE_TESTS_STR,
> >>>> +            .pActive = suite_syncobj_timeline_tests_enable,
> >>>> +        },
> >>>>   };
> >>>>     diff --git a/tests/amdgpu/amdgpu_test.h
> >>>> b/tests/amdgpu/amdgpu_test.h
> >>>> index bcd0bc7e..36675ea3 100644
> >>>> --- a/tests/amdgpu/amdgpu_test.h
> >>>> +++ b/tests/amdgpu/amdgpu_test.h
> >>>> @@ -216,6 +216,27 @@ CU_BOOL suite_ras_tests_enable(void);
> >>>>   extern CU_TestInfo ras_tests[];
> >>>>     +/**
> >>>> + * Initialize syncobj timeline test suite
> >>>> + */
> >>>> +int suite_syncobj_timeline_tests_init();
> >>>> +
> >>>> +/**
> >>>> + * Deinitialize syncobj timeline test suite
> >>>> + */
> >>>> +int suite_syncobj_timeline_tests_clean();
> >>>> +
> >>>> +/**
> >>>> + * Decide if the suite is enabled by default or not.
> >>>> + */
> >>>> +CU_BOOL suite_syncobj_timeline_tests_enable(void);
> >>>> +
> >>>> +/**
> >>>> + * Tests in syncobj timeline test suite
> >>>> + */
> >>>> +extern CU_TestInfo syncobj_timeline_tests[];
> >>>> +
> >>>> +
> >>>>   /**
> >>>>    * Helper functions
> >>>>    */
> >>>> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> >>>> index 95ed9305..1726cb43 100644
> >>>> --- a/tests/amdgpu/meson.build
> >>>> +++ b/tests/amdgpu/meson.build
> >>>> @@ -24,7 +24,7 @@ if dep_cunit.found()
> >>>>       files(
> >>>>         'amdgpu_test.c', 'basic_tests.c', 'bo_tests.c', 'cs_tests.c',
> >>>>         'vce_tests.c', 'uvd_enc_tests.c', 'vcn_tests.c',
> >>>> 'deadlock_tests.c',
> >>>> -      'vm_tests.c', 'ras_tests.c',
> >>>> +      'vm_tests.c', 'ras_tests.c', 'syncobj_tests.c',
> >>>>       ),
> >>>>       dependencies : [dep_cunit, dep_threads],
> >>>>       include_directories : [inc_root, inc_drm,
> >>>> include_directories('../../amdgpu')],
> >>>> diff --git a/tests/amdgpu/syncobj_tests.c
> >>>> b/tests/amdgpu/syncobj_tests.c
> >>>> new file mode 100644
> >>>> index 00000000..a0c627d7
> >>>> --- /dev/null
> >>>> +++ b/tests/amdgpu/syncobj_tests.c
> >>>> @@ -0,0 +1,290 @@
> >>>> +/*
> >>>> + * Copyright 2017 Advanced Micro Devices, Inc.
> >>>> + *
> >>>> + * Permission is hereby granted, free of charge, to any person
> >>>> obtaining a
> >>>> + * copy of this software and associated documentation files (the
> >>>> "Software"),
> >>>> + * to deal in the Software without restriction, including without
> >>>> limitation
> >>>> + * the rights to use, copy, modify, merge, publish, distribute,
> >>>> sublicense,
> >>>> + * and/or sell copies of the Software, and to permit persons to whom
> >>>> the
> >>>> + * Software is furnished to do so, subject to the following
> >>>> conditions:
> >>>> + *
> >>>> + * The above copyright notice and this permission notice shall be
> >>>> included in
> >>>> + * all copies or substantial portions of the Software.
> >>>> + *
> >>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >>>> EXPRESS OR
> >>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> >>>> MERCHANTABILITY,
> >>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> >>>> EVENT SHALL
> >>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
> >>>> DAMAGES OR
> >>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> >>>> OTHERWISE,
> >>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> >>>> USE OR
> >>>> + * OTHER DEALINGS IN THE SOFTWARE.
> >>>> + *
> >>>> +*/
> >>>> +
> >>>> +#include "CUnit/Basic.h"
> >>>> +
> >>>> +#include "amdgpu_test.h"
> >>>> +#include "amdgpu_drm.h"
> >>>> +#include "amdgpu_internal.h"
> >>>> +#include <pthread.h>
> >>>> +
> >>>> +static  amdgpu_device_handle device_handle;
> >>>> +static  uint32_t  major_version;
> >>>> +static  uint32_t  minor_version;
> >>>> +
> >>>> +static void amdgpu_syncobj_timeline_test(void);
> >>>> +
> >>>> +CU_BOOL suite_syncobj_timeline_tests_enable(void)
> >>>> +{
> >>>> +    return CU_TRUE;
> >>>> +}
> >>>> +
> >>>> +int suite_syncobj_timeline_tests_init(void)
> >>>> +{
> >>>> +    int r;
> >>>> +
> >>>> +    r = amdgpu_device_initialize(drm_amdgpu[0], &major_version,
> >>>> +                   &minor_version, &device_handle);
> >>>> +
> >>>> +    if (r) {
> >>>> +        if ((r == -EACCES) && (errno == EACCES))
> >>>> +            printf("\n\nError:%s. "
> >>>> +                "Hint:Try to run this test program as root.",
> >>>> +                strerror(errno));
> >>>> +        return CUE_SINIT_FAILED;
> >>>> +    }
> >>>> +
> >>>> +    return CUE_SUCCESS;
> >>>> +}
> >>>> +
> >>>> +int suite_syncobj_timeline_tests_clean(void)
> >>>> +{
> >>>> +    int r = amdgpu_device_deinitialize(device_handle);
> >>>> +
> >>>> +    if (r == 0)
> >>>> +        return CUE_SUCCESS;
> >>>> +    else
> >>>> +        return CUE_SCLEAN_FAILED;
> >>>> +}
> >>>> +
> >>>> +
> >>>> +CU_TestInfo syncobj_timeline_tests[] = {
> >>>> +    { "syncobj timeline test", amdgpu_syncobj_timeline_test },
> >>>> +    CU_TEST_INFO_NULL,
> >>>> +};
> >>>> +
> >>>> +#define GFX_COMPUTE_NOP  0xffff1000
> >>>> +#define SDMA_NOP  0x0
> >>>> +static int syncobj_command_submission_helper(uint32_t
> >>>> syncobj_handle, bool
> >>>> +                         wait_or_signal, uint64_t point)
> >>>> +{
> >>>> +    amdgpu_context_handle context_handle;
> >>>> +    amdgpu_bo_handle ib_result_handle;
> >>>> +    void *ib_result_cpu;
> >>>> +    uint64_t ib_result_mc_address;
> >>>> +    struct drm_amdgpu_cs_chunk chunks[2];
> >>>> +    struct drm_amdgpu_cs_chunk_data chunk_data;
> >>>> +    struct drm_amdgpu_cs_chunk_syncobj syncobj_data;
> >>>> +    struct amdgpu_cs_fence fence_status;
> >>>> +    amdgpu_bo_list_handle bo_list;
> >>>> +    amdgpu_va_handle va_handle;
> >>>> +    uint32_t expired, flags;
> >>>> +    int i, r;
> >>>> +    uint64_t seq_no;
> >>>> +    static uint32_t *ptr;
> >>>> +
> >>>> +    r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    r = amdgpu_bo_alloc_and_map(device_handle, 4096, 4096,
> >>>> +                    AMDGPU_GEM_DOMAIN_GTT, 0,
> >>>> +                    &ib_result_handle, &ib_result_cpu,
> >>>> + &ib_result_mc_address, &va_handle);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL,
> >>>> +                   &bo_list);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    ptr = ib_result_cpu;
> >>>> +
> >>>> +    for (i = 0; i < 16; ++i)
> >>>> +        ptr[i] = wait_or_signal ? GFX_COMPUTE_NOP: SDMA_NOP;
> >>>> +
> >>>> +    chunks[0].chunk_id = AMDGPU_CHUNK_ID_IB;
> >>>> +    chunks[0].length_dw = sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
> >>>> +    chunks[0].chunk_data = (uint64_t)(uintptr_t)&chunk_data;
> >>>> +    chunk_data.ib_data._pad = 0;
> >>>> +    chunk_data.ib_data.va_start = ib_result_mc_address;
> >>>> +    chunk_data.ib_data.ib_bytes = 16 * 4;
> >>>> +    chunk_data.ib_data.ip_type = wait_or_signal ? AMDGPU_HW_IP_GFX :
> >>>> +        AMDGPU_HW_IP_DMA;
> >>>> +    chunk_data.ib_data.ip_instance = 0;
> >>>> +    chunk_data.ib_data.ring = 0;
> >>>> +    chunk_data.ib_data.flags = 0;
> >>>> +
> >>>> +    chunks[1].chunk_id = wait_or_signal ?
> >>>> + AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT :
> >>>> + AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL;
> >>>> +    chunks[1].length_dw = sizeof(struct drm_amdgpu_cs_chunk_syncobj)
> >>>> / 4;
> >>>> +    chunks[1].chunk_data = (uint64_t)(uintptr_t)&syncobj_data;
> >>>> +    syncobj_data.handle = syncobj_handle;
> >>>> +    syncobj_data.point = point;
> >>>> +    syncobj_data.flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;
> >>>> +
> >>>> +    r = amdgpu_cs_submit_raw(device_handle,
> >>>> +                 context_handle,
> >>>> +                 bo_list,
> >>>> +                 2,
> >>>> +                 chunks,
> >>>> +                 &seq_no);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +
> >>>> +    memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
> >>>> +    fence_status.context = context_handle;
> >>>> +    fence_status.ip_type = wait_or_signal ? AMDGPU_HW_IP_GFX:
> >>>> +        AMDGPU_HW_IP_DMA;
> >>>> +    fence_status.ip_instance = 0;
> >>>> +    fence_status.ring = 0;
> >>>> +    fence_status.fence = seq_no;
> >>>> +
> >>>> +    r = amdgpu_cs_query_fence_status(&fence_status,
> >>>> +            AMDGPU_TIMEOUT_INFINITE,0, &expired);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    r = amdgpu_bo_list_destroy(bo_list);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    r = amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
> >>>> +                     ib_result_mc_address, 4096);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    r = amdgpu_cs_ctx_free(context_handle);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    return r;
> >>>> +}
> >>>> +
> >>>> +struct syncobj_point {
> >>>> +    uint32_t syncobj_handle;
> >>>> +    uint64_t point;
> >>>> +};
> >>>> +
> >>>> +static void *syncobj_wait(void *data)
> >>>> +{
> >>>> +    struct syncobj_point *sp = (struct syncobj_point *)data;
> >>>> +    int r;
> >>>> +
> >>>> +    r = syncobj_command_submission_helper(sp->syncobj_handle, true,
> >>>> +                          sp->point);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    return (void *)(long)r;
> >>>> +}
> >>>> +
> >>>> +static void *syncobj_signal(void *data)
> >>>> +{
> >>>> +    struct syncobj_point *sp = (struct syncobj_point *)data;
> >>>> +    int r;
> >>>> +
> >>>> +    r = syncobj_command_submission_helper(sp->syncobj_handle, false,
> >>>> +                          sp->point);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    return (void *)(long)r;
> >>>> +}
> >>>> +
> >>>> +static void amdgpu_syncobj_timeline_test(void)
> >>>> +{
> >>>> +    static pthread_t wait_thread;
> >>>> +    static pthread_t signal_thread;
> >>>> +    static pthread_t c_thread;
> >>>> +    struct syncobj_point sp1, sp2, sp3;
> >>>> +    uint32_t syncobj_handle;
> >>>> +    uint64_t payload;
> >>>> +    uint64_t wait_point, signal_point;
> >>>> +    uint64_t timeout;
> >>>> +    struct timespec tp;
> >>>> +    int r, sync_fd;
> >>>> +    void *tmp;
> >>>> +
> >>>> +    r = amdgpu_cs_create_syncobj2(device_handle, 0,
> >>>> &syncobj_handle);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    // wait on point 5
> >>>> +    sp1.syncobj_handle = syncobj_handle;
> >>>> +    sp1.point = 5;
> >>>> +    r = pthread_create(&wait_thread, NULL, syncobj_wait, &sp1);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    // signal on point 10
> >>>> +    sp2.syncobj_handle = syncobj_handle;
> >>>> +    sp2.point = 10;
> >>>> +    r = pthread_create(&signal_thread, NULL, syncobj_signal, &sp2);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +    r = pthread_join(wait_thread, &tmp);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    CU_ASSERT_EQUAL(tmp, 0);
> >>>> +
> >>>> +    r = pthread_join(signal_thread, &tmp);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    CU_ASSERT_EQUAL(tmp, 0);
> >>>> +
> >>>> +    //query timeline payload
> >>>> +    r = amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> >>>> +                    &payload, 1);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    CU_ASSERT_EQUAL(payload, 10);
> >>>> +
> >>>> +    //signal on point 16
> >>>> +    sp3.syncobj_handle = syncobj_handle;
> >>>> +    sp3.point = 16;
> >>>> +    r = pthread_create(&c_thread, NULL, syncobj_signal, &sp3);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    //CPU wait on point 16
> >>>> +    wait_point = 16;
> >>>> +    timeout = 0;
> >>>> +    clock_gettime(CLOCK_MONOTONIC, &tp);
> >>>> +    timeout = tp.tv_sec * 1000000000ULL + tp.tv_nsec;
> >>>> +    timeout += 0x10000000000; //10s
> >>>> +    r = amdgpu_cs_syncobj_timeline_wait(device_handle,
> >>>> &syncobj_handle,
> >>>> +                        &wait_point, 1, timeout,
> >>>> + DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> >>>> + DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> >>>> +                        NULL);
> >>>> +
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    r = pthread_join(c_thread, &tmp);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    CU_ASSERT_EQUAL(tmp, 0);
> >>>> +
> >>>> +    // export point 16 and import to point 18
> >>>> +    r = amdgpu_cs_syncobj_export_sync_file2(device_handle,
> >>>> syncobj_handle,
> >>>> +                        16,
> >>>> + DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> >>>> +                        &sync_fd);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    r = amdgpu_cs_syncobj_import_sync_file2(device_handle,
> >>>> syncobj_handle,
> >>>> +                        18, sync_fd);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    r = amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> >>>> +                    &payload, 1);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    CU_ASSERT_EQUAL(payload, 18);
> >>>> +
> >>>> +    // CPU signal on point 20
> >>>> +    signal_point = 20;
> >>>> +    r = amdgpu_cs_syncobj_timeline_signal(device_handle,
> >>>> &syncobj_handle,
> >>>> + &signal_point, 1);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    r = amdgpu_cs_syncobj_query(device_handle, &syncobj_handle,
> >>>> +                    &payload, 1);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +    CU_ASSERT_EQUAL(payload, 20);
> >>>> +
> >>>> +    r = amdgpu_cs_destroy_syncobj(device_handle, syncobj_handle);
> >>>> +    CU_ASSERT_EQUAL(r, 0);
> >>>> +
> >>>> +}
> >>>
> >>> _______________________________________________
> >>> dri-devel mailing list
> >>> dri-devel@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >>
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--------------80B558730A7AEDDDC24C6B2B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Oh, please not that problem again :(<br>
      <br>
      Please just try "ssh gitlab.freedesktop.org" if that also times
      out like this you need to contact AMD network IT and ask why ssh
      once more doesn't work.<br>
      <br>
      Christian.<br>
      <br>
      Am 16.05.19 um 13:43 schrieb Zhou, David(ChunMing):<br>
    </div>
    <blockquote type="cite"
cite="mid:-hr0cw7wplji6kur9szo2dka8ja1pou-3nnay4-uxxtwr-otnhsl1qetv0o1gtgu-lfnxxj8heoqc6a8l96-nzvfofweuygaoki3ql-641t1t-lccynh6ltsf-lty877-volmoddqo3n1-k65ryocb6ryt.1558004857725@email.android.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <div>It mentioned me I cannot push to gitlab directly. After that,
        I added my ssh pub to gitlab web, and also added gitlab url to
        git remote.<br>
        then push again, it mentions "connection timeout".<br>
        <br>
        -David<br>
        <br>
        -------- Original Message --------<br>
        Subject: Re: [PATCH libdrm 7/7] add syncobj timeline tests v3<br>
        From: Christian König <br>
        To: "Zhou, David(ChunMing)" ,"Koenig, Christian" ,"Zhou,
        David(ChunMing)" ,<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>
        CC: <br>
        <br>
      </div>
      <font size="2"><span style="font-size:11pt;">
          <div class="PlainText">[CAUTION: External Email]<br>
            <br>
            Am 16.05.19 um 12:19 schrieb zhoucm1:<br>
            &gt;<br>
            &gt;<br>
            &gt; On 2019年05月16日 18:09, Christian König wrote:<br>
            &gt;&gt; [CAUTION: External Email]<br>
            &gt;&gt;<br>
            &gt;&gt; Am 16.05.19 um 10:16 schrieb zhoucm1:<br>
            &gt;&gt;&gt; I was able to push changes to libdrm, but now
            seems after libdrm is<br>
            &gt;&gt;&gt; migrated to gitlab, I cannot yet. What step do
            I need to get back my<br>
            &gt;&gt;&gt; permission? I already can login into gitlab
            with old freedesktop<br>
            &gt;&gt;&gt; account.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; @Christian, Can you help submit this patch set
            to libdrm first?<br>
            &gt;&gt;<br>
            &gt;&gt; Done. And I think you can now request write
            permission to a repository<br>
            &gt;&gt; through the web-interface and all the "owners" of
            the project can grant<br>
            &gt;&gt; that to you.<br>
            &gt; Any guide for that? I failed to find where to request
            permission.<br>
            <br>
            Not of hand. What does the system say when you try to push?<br>
            <br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt; -David<br>
            &gt;&gt;<br>
            &gt;&gt; Christian.<br>
            &gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Thanks,<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; -David<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; On 2019年05月16日 16:07, Chunming Zhou wrote:<br>
            &gt;&gt;&gt;&gt; v2: drop DRM_SYNCOBJ_CREATE_TYPE_TIMELINE,
            fix timeout calculation,<br>
            &gt;&gt;&gt;&gt;      fix some warnings<br>
            &gt;&gt;&gt;&gt; v3: add export/import and cpu signal
            testing cases<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; Signed-off-by: Chunming Zhou
            <a class="moz-txt-link-rfc2396E" href="mailto:david1.zhou@amd.com">&lt;david1.zhou@amd.com&gt;</a><br>
            &gt;&gt;&gt;&gt; Acked-by: Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
            &gt;&gt;&gt;&gt; Acked-by: Lionel Landwerlin
            <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
            &gt;&gt;&gt;&gt; ---<br>
            &gt;&gt;&gt;&gt;   tests/amdgpu/Makefile.am     |   3 +-<br>
            &gt;&gt;&gt;&gt;   tests/amdgpu/amdgpu_test.c   |  11 ++<br>
            &gt;&gt;&gt;&gt;   tests/amdgpu/amdgpu_test.h   |  21 +++<br>
            &gt;&gt;&gt;&gt;   tests/amdgpu/meson.build     |   2 +-<br>
            &gt;&gt;&gt;&gt;   tests/amdgpu/syncobj_tests.c | 290<br>
            &gt;&gt;&gt;&gt; +++++++++++++++++++++++++++++++++++<br>
            &gt;&gt;&gt;&gt;   5 files changed, 325 insertions(+), 2
            deletions(-)<br>
            &gt;&gt;&gt;&gt;   create mode 100644
            tests/amdgpu/syncobj_tests.c<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; diff --git a/tests/amdgpu/Makefile.am
            b/tests/amdgpu/Makefile.am<br>
            &gt;&gt;&gt;&gt; index 48278848..920882d0 100644<br>
            &gt;&gt;&gt;&gt; --- a/tests/amdgpu/Makefile.am<br>
            &gt;&gt;&gt;&gt; +++ b/tests/amdgpu/Makefile.am<br>
            &gt;&gt;&gt;&gt; @@ -34,4 +34,5 @@ amdgpu_test_SOURCES = \<br>
            &gt;&gt;&gt;&gt;       uve_ib.h \<br>
            &gt;&gt;&gt;&gt;       deadlock_tests.c \<br>
            &gt;&gt;&gt;&gt;       vm_tests.c    \<br>
            &gt;&gt;&gt;&gt; -    ras_tests.c<br>
            &gt;&gt;&gt;&gt; +    ras_tests.c \<br>
            &gt;&gt;&gt;&gt; +    syncobj_tests.c<br>
            &gt;&gt;&gt;&gt; diff --git a/tests/amdgpu/amdgpu_test.c
            b/tests/amdgpu/amdgpu_test.c<br>
            &gt;&gt;&gt;&gt; index 35c8bf6c..73403fb4 100644<br>
            &gt;&gt;&gt;&gt; --- a/tests/amdgpu/amdgpu_test.c<br>
            &gt;&gt;&gt;&gt; +++ b/tests/amdgpu/amdgpu_test.c<br>
            &gt;&gt;&gt;&gt; @@ -57,6 +57,7 @@<br>
            &gt;&gt;&gt;&gt;   #define DEADLOCK_TESTS_STR "Deadlock
            Tests"<br>
            &gt;&gt;&gt;&gt;   #define VM_TESTS_STR "VM Tests"<br>
            &gt;&gt;&gt;&gt;   #define RAS_TESTS_STR "RAS Tests"<br>
            &gt;&gt;&gt;&gt; +#define SYNCOBJ_TIMELINE_TESTS_STR
            "SYNCOBJ TIMELINE Tests"<br>
            &gt;&gt;&gt;&gt;     /**<br>
            &gt;&gt;&gt;&gt;    *  Open handles for amdgpu devices<br>
            &gt;&gt;&gt;&gt; @@ -123,6 +124,12 @@ static CU_SuiteInfo
            suites[] = {<br>
            &gt;&gt;&gt;&gt;           .pCleanupFunc =
            suite_ras_tests_clean,<br>
            &gt;&gt;&gt;&gt;           .pTests = ras_tests,<br>
            &gt;&gt;&gt;&gt;       },<br>
            &gt;&gt;&gt;&gt; +    {<br>
            &gt;&gt;&gt;&gt; +        .pName =
            SYNCOBJ_TIMELINE_TESTS_STR,<br>
            &gt;&gt;&gt;&gt; +        .pInitFunc =
            suite_syncobj_timeline_tests_init,<br>
            &gt;&gt;&gt;&gt; +        .pCleanupFunc =
            suite_syncobj_timeline_tests_clean,<br>
            &gt;&gt;&gt;&gt; +        .pTests = syncobj_timeline_tests,<br>
            &gt;&gt;&gt;&gt; +    },<br>
            &gt;&gt;&gt;&gt;         CU_SUITE_INFO_NULL,<br>
            &gt;&gt;&gt;&gt;   };<br>
            &gt;&gt;&gt;&gt; @@ -176,6 +183,10 @@ static
            Suites_Active_Status suites_active_stat[]<br>
            &gt;&gt;&gt;&gt; = {<br>
            &gt;&gt;&gt;&gt;               .pName = RAS_TESTS_STR,<br>
            &gt;&gt;&gt;&gt;               .pActive =
            suite_ras_tests_enable,<br>
            &gt;&gt;&gt;&gt;           },<br>
            &gt;&gt;&gt;&gt; +        {<br>
            &gt;&gt;&gt;&gt; +            .pName =
            SYNCOBJ_TIMELINE_TESTS_STR,<br>
            &gt;&gt;&gt;&gt; +            .pActive =
            suite_syncobj_timeline_tests_enable,<br>
            &gt;&gt;&gt;&gt; +        },<br>
            &gt;&gt;&gt;&gt;   };<br>
            &gt;&gt;&gt;&gt;     diff --git a/tests/amdgpu/amdgpu_test.h<br>
            &gt;&gt;&gt;&gt; b/tests/amdgpu/amdgpu_test.h<br>
            &gt;&gt;&gt;&gt; index bcd0bc7e..36675ea3 100644<br>
            &gt;&gt;&gt;&gt; --- a/tests/amdgpu/amdgpu_test.h<br>
            &gt;&gt;&gt;&gt; +++ b/tests/amdgpu/amdgpu_test.h<br>
            &gt;&gt;&gt;&gt; @@ -216,6 +216,27 @@ CU_BOOL
            suite_ras_tests_enable(void);<br>
            &gt;&gt;&gt;&gt;   extern CU_TestInfo ras_tests[];<br>
            &gt;&gt;&gt;&gt;     +/**<br>
            &gt;&gt;&gt;&gt; + * Initialize syncobj timeline test suite<br>
            &gt;&gt;&gt;&gt; + */<br>
            &gt;&gt;&gt;&gt; +int suite_syncobj_timeline_tests_init();<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +/**<br>
            &gt;&gt;&gt;&gt; + * Deinitialize syncobj timeline test
            suite<br>
            &gt;&gt;&gt;&gt; + */<br>
            &gt;&gt;&gt;&gt; +int suite_syncobj_timeline_tests_clean();<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +/**<br>
            &gt;&gt;&gt;&gt; + * Decide if the suite is enabled by
            default or not.<br>
            &gt;&gt;&gt;&gt; + */<br>
            &gt;&gt;&gt;&gt; +CU_BOOL
            suite_syncobj_timeline_tests_enable(void);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +/**<br>
            &gt;&gt;&gt;&gt; + * Tests in syncobj timeline test suite<br>
            &gt;&gt;&gt;&gt; + */<br>
            &gt;&gt;&gt;&gt; +extern CU_TestInfo
            syncobj_timeline_tests[];<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt;   /**<br>
            &gt;&gt;&gt;&gt;    * Helper functions<br>
            &gt;&gt;&gt;&gt;    */<br>
            &gt;&gt;&gt;&gt; diff --git a/tests/amdgpu/meson.build
            b/tests/amdgpu/meson.build<br>
            &gt;&gt;&gt;&gt; index 95ed9305..1726cb43 100644<br>
            &gt;&gt;&gt;&gt; --- a/tests/amdgpu/meson.build<br>
            &gt;&gt;&gt;&gt; +++ b/tests/amdgpu/meson.build<br>
            &gt;&gt;&gt;&gt; @@ -24,7 +24,7 @@ if dep_cunit.found()<br>
            &gt;&gt;&gt;&gt;       files(<br>
            &gt;&gt;&gt;&gt;         'amdgpu_test.c', 'basic_tests.c',
            'bo_tests.c', 'cs_tests.c',<br>
            &gt;&gt;&gt;&gt;         'vce_tests.c', 'uvd_enc_tests.c',
            'vcn_tests.c',<br>
            &gt;&gt;&gt;&gt; 'deadlock_tests.c',<br>
            &gt;&gt;&gt;&gt; -      'vm_tests.c', 'ras_tests.c',<br>
            &gt;&gt;&gt;&gt; +      'vm_tests.c', 'ras_tests.c',
            'syncobj_tests.c',<br>
            &gt;&gt;&gt;&gt;       ),<br>
            &gt;&gt;&gt;&gt;       dependencies : [dep_cunit,
            dep_threads],<br>
            &gt;&gt;&gt;&gt;       include_directories : [inc_root,
            inc_drm,<br>
            &gt;&gt;&gt;&gt; include_directories('../../amdgpu')],<br>
            &gt;&gt;&gt;&gt; diff --git a/tests/amdgpu/syncobj_tests.c<br>
            &gt;&gt;&gt;&gt; b/tests/amdgpu/syncobj_tests.c<br>
            &gt;&gt;&gt;&gt; new file mode 100644<br>
            &gt;&gt;&gt;&gt; index 00000000..a0c627d7<br>
            &gt;&gt;&gt;&gt; --- /dev/null<br>
            &gt;&gt;&gt;&gt; +++ b/tests/amdgpu/syncobj_tests.c<br>
            &gt;&gt;&gt;&gt; @@ -0,0 +1,290 @@<br>
            &gt;&gt;&gt;&gt; +/*<br>
            &gt;&gt;&gt;&gt; + * Copyright 2017 Advanced Micro Devices,
            Inc.<br>
            &gt;&gt;&gt;&gt; + *<br>
            &gt;&gt;&gt;&gt; + * Permission is hereby granted, free of
            charge, to any person<br>
            &gt;&gt;&gt;&gt; obtaining a<br>
            &gt;&gt;&gt;&gt; + * copy of this software and associated
            documentation files (the<br>
            &gt;&gt;&gt;&gt; "Software"),<br>
            &gt;&gt;&gt;&gt; + * to deal in the Software without
            restriction, including without<br>
            &gt;&gt;&gt;&gt; limitation<br>
            &gt;&gt;&gt;&gt; + * the rights to use, copy, modify, merge,
            publish, distribute,<br>
            &gt;&gt;&gt;&gt; sublicense,<br>
            &gt;&gt;&gt;&gt; + * and/or sell copies of the Software, and
            to permit persons to whom<br>
            &gt;&gt;&gt;&gt; the<br>
            &gt;&gt;&gt;&gt; + * Software is furnished to do so, subject
            to the following<br>
            &gt;&gt;&gt;&gt; conditions:<br>
            &gt;&gt;&gt;&gt; + *<br>
            &gt;&gt;&gt;&gt; + * The above copyright notice and this
            permission notice shall be<br>
            &gt;&gt;&gt;&gt; included in<br>
            &gt;&gt;&gt;&gt; + * all copies or substantial portions of
            the Software.<br>
            &gt;&gt;&gt;&gt; + *<br>
            &gt;&gt;&gt;&gt; + * THE SOFTWARE IS PROVIDED "AS IS",
            WITHOUT WARRANTY OF ANY KIND,<br>
            &gt;&gt;&gt;&gt; EXPRESS OR<br>
            &gt;&gt;&gt;&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO
            THE WARRANTIES OF<br>
            &gt;&gt;&gt;&gt; MERCHANTABILITY,<br>
            &gt;&gt;&gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND
            NONINFRINGEMENT. IN NO<br>
            &gt;&gt;&gt;&gt; EVENT SHALL<br>
            &gt;&gt;&gt;&gt; + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE
            LIABLE FOR ANY CLAIM,<br>
            &gt;&gt;&gt;&gt; DAMAGES OR<br>
            &gt;&gt;&gt;&gt; + * OTHER LIABILITY, WHETHER IN AN ACTION
            OF CONTRACT, TORT OR<br>
            &gt;&gt;&gt;&gt; OTHERWISE,<br>
            &gt;&gt;&gt;&gt; + * ARISING FROM, OUT OF OR IN CONNECTION
            WITH THE SOFTWARE OR THE<br>
            &gt;&gt;&gt;&gt; USE OR<br>
            &gt;&gt;&gt;&gt; + * OTHER DEALINGS IN THE SOFTWARE.<br>
            &gt;&gt;&gt;&gt; + *<br>
            &gt;&gt;&gt;&gt; +*/<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +#include "CUnit/Basic.h"<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +#include "amdgpu_test.h"<br>
            &gt;&gt;&gt;&gt; +#include "amdgpu_drm.h"<br>
            &gt;&gt;&gt;&gt; +#include "amdgpu_internal.h"<br>
            &gt;&gt;&gt;&gt; +#include &lt;pthread.h&gt;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +static  amdgpu_device_handle
            device_handle;<br>
            &gt;&gt;&gt;&gt; +static  uint32_t  major_version;<br>
            &gt;&gt;&gt;&gt; +static  uint32_t  minor_version;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +static void
            amdgpu_syncobj_timeline_test(void);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +CU_BOOL
            suite_syncobj_timeline_tests_enable(void)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    return CU_TRUE;<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +int
            suite_syncobj_timeline_tests_init(void)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    int r;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_device_initialize(drm_amdgpu[0], &amp;major_version,<br>
            &gt;&gt;&gt;&gt; +                   &amp;minor_version,
            &amp;device_handle);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    if (r) {<br>
            &gt;&gt;&gt;&gt; +        if ((r == -EACCES) &amp;&amp;
            (errno == EACCES))<br>
            &gt;&gt;&gt;&gt; +            printf("\n\nError:%s. "<br>
            &gt;&gt;&gt;&gt; +                "Hint:Try to run this test
            program as root.",<br>
            &gt;&gt;&gt;&gt; +                strerror(errno));<br>
            &gt;&gt;&gt;&gt; +        return CUE_SINIT_FAILED;<br>
            &gt;&gt;&gt;&gt; +    }<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    return CUE_SUCCESS;<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +int
            suite_syncobj_timeline_tests_clean(void)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    int r =
            amdgpu_device_deinitialize(device_handle);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    if (r == 0)<br>
            &gt;&gt;&gt;&gt; +        return CUE_SUCCESS;<br>
            &gt;&gt;&gt;&gt; +    else<br>
            &gt;&gt;&gt;&gt; +        return CUE_SCLEAN_FAILED;<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +CU_TestInfo syncobj_timeline_tests[] = {<br>
            &gt;&gt;&gt;&gt; +    { "syncobj timeline test",
            amdgpu_syncobj_timeline_test },<br>
            &gt;&gt;&gt;&gt; +    CU_TEST_INFO_NULL,<br>
            &gt;&gt;&gt;&gt; +};<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +#define GFX_COMPUTE_NOP  0xffff1000<br>
            &gt;&gt;&gt;&gt; +#define SDMA_NOP  0x0<br>
            &gt;&gt;&gt;&gt; +static int
            syncobj_command_submission_helper(uint32_t<br>
            &gt;&gt;&gt;&gt; syncobj_handle, bool<br>
            &gt;&gt;&gt;&gt; +                         wait_or_signal,
            uint64_t point)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    amdgpu_context_handle context_handle;<br>
            &gt;&gt;&gt;&gt; +    amdgpu_bo_handle ib_result_handle;<br>
            &gt;&gt;&gt;&gt; +    void *ib_result_cpu;<br>
            &gt;&gt;&gt;&gt; +    uint64_t ib_result_mc_address;<br>
            &gt;&gt;&gt;&gt; +    struct drm_amdgpu_cs_chunk chunks[2];<br>
            &gt;&gt;&gt;&gt; +    struct drm_amdgpu_cs_chunk_data
            chunk_data;<br>
            &gt;&gt;&gt;&gt; +    struct drm_amdgpu_cs_chunk_syncobj
            syncobj_data;<br>
            &gt;&gt;&gt;&gt; +    struct amdgpu_cs_fence fence_status;<br>
            &gt;&gt;&gt;&gt; +    amdgpu_bo_list_handle bo_list;<br>
            &gt;&gt;&gt;&gt; +    amdgpu_va_handle va_handle;<br>
            &gt;&gt;&gt;&gt; +    uint32_t expired, flags;<br>
            &gt;&gt;&gt;&gt; +    int i, r;<br>
            &gt;&gt;&gt;&gt; +    uint64_t seq_no;<br>
            &gt;&gt;&gt;&gt; +    static uint32_t *ptr;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_ctx_create(device_handle, &amp;context_handle);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_bo_alloc_and_map(device_handle, 4096, 4096,<br>
            &gt;&gt;&gt;&gt; +                    AMDGPU_GEM_DOMAIN_GTT,
            0,<br>
            &gt;&gt;&gt;&gt; +                    &amp;ib_result_handle,
            &amp;ib_result_cpu,<br>
            &gt;&gt;&gt;&gt; +                   
            &amp;ib_result_mc_address, &amp;va_handle);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r = amdgpu_get_bo_list(device_handle,
            ib_result_handle, NULL,<br>
            &gt;&gt;&gt;&gt; +                   &amp;bo_list);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    ptr = ib_result_cpu;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    for (i = 0; i &lt; 16; ++i)<br>
            &gt;&gt;&gt;&gt; +        ptr[i] = wait_or_signal ?
            GFX_COMPUTE_NOP: SDMA_NOP;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    chunks[0].chunk_id =
            AMDGPU_CHUNK_ID_IB;<br>
            &gt;&gt;&gt;&gt; +    chunks[0].length_dw = sizeof(struct
            drm_amdgpu_cs_chunk_ib) / 4;<br>
            &gt;&gt;&gt;&gt; +    chunks[0].chunk_data =
            (uint64_t)(uintptr_t)&amp;chunk_data;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data._pad = 0;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data.va_start =
            ib_result_mc_address;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data.ib_bytes = 16 * 4;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data.ip_type =
            wait_or_signal ? AMDGPU_HW_IP_GFX :<br>
            &gt;&gt;&gt;&gt; +        AMDGPU_HW_IP_DMA;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data.ip_instance = 0;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data.ring = 0;<br>
            &gt;&gt;&gt;&gt; +    chunk_data.ib_data.flags = 0;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    chunks[1].chunk_id = wait_or_signal ?<br>
            &gt;&gt;&gt;&gt; +       
            AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT :<br>
            &gt;&gt;&gt;&gt; +       
            AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL;<br>
            &gt;&gt;&gt;&gt; +    chunks[1].length_dw = sizeof(struct
            drm_amdgpu_cs_chunk_syncobj)<br>
            &gt;&gt;&gt;&gt; / 4;<br>
            &gt;&gt;&gt;&gt; +    chunks[1].chunk_data =
            (uint64_t)(uintptr_t)&amp;syncobj_data;<br>
            &gt;&gt;&gt;&gt; +    syncobj_data.handle = syncobj_handle;<br>
            &gt;&gt;&gt;&gt; +    syncobj_data.point = point;<br>
            &gt;&gt;&gt;&gt; +    syncobj_data.flags =
            DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_submit_raw(device_handle,<br>
            &gt;&gt;&gt;&gt; +                 context_handle,<br>
            &gt;&gt;&gt;&gt; +                 bo_list,<br>
            &gt;&gt;&gt;&gt; +                 2,<br>
            &gt;&gt;&gt;&gt; +                 chunks,<br>
            &gt;&gt;&gt;&gt; +                 &amp;seq_no);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    memset(&amp;fence_status, 0,
            sizeof(struct amdgpu_cs_fence));<br>
            &gt;&gt;&gt;&gt; +    fence_status.context = context_handle;<br>
            &gt;&gt;&gt;&gt; +    fence_status.ip_type = wait_or_signal
            ? AMDGPU_HW_IP_GFX:<br>
            &gt;&gt;&gt;&gt; +        AMDGPU_HW_IP_DMA;<br>
            &gt;&gt;&gt;&gt; +    fence_status.ip_instance = 0;<br>
            &gt;&gt;&gt;&gt; +    fence_status.ring = 0;<br>
            &gt;&gt;&gt;&gt; +    fence_status.fence = seq_no;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_query_fence_status(&amp;fence_status,<br>
            &gt;&gt;&gt;&gt; +            AMDGPU_TIMEOUT_INFINITE,0,
            &amp;expired);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r = amdgpu_bo_list_destroy(bo_list);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,<br>
            &gt;&gt;&gt;&gt; +                     ib_result_mc_address,
            4096);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_ctx_free(context_handle);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    return r;<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +struct syncobj_point {<br>
            &gt;&gt;&gt;&gt; +    uint32_t syncobj_handle;<br>
            &gt;&gt;&gt;&gt; +    uint64_t point;<br>
            &gt;&gt;&gt;&gt; +};<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +static void *syncobj_wait(void *data)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    struct syncobj_point *sp = (struct
            syncobj_point *)data;<br>
            &gt;&gt;&gt;&gt; +    int r;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            syncobj_command_submission_helper(sp-&gt;syncobj_handle,
            true,<br>
            &gt;&gt;&gt;&gt; +                          sp-&gt;point);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    return (void *)(long)r;<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +static void *syncobj_signal(void *data)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    struct syncobj_point *sp = (struct
            syncobj_point *)data;<br>
            &gt;&gt;&gt;&gt; +    int r;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            syncobj_command_submission_helper(sp-&gt;syncobj_handle,
            false,<br>
            &gt;&gt;&gt;&gt; +                          sp-&gt;point);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    return (void *)(long)r;<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +static void
            amdgpu_syncobj_timeline_test(void)<br>
            &gt;&gt;&gt;&gt; +{<br>
            &gt;&gt;&gt;&gt; +    static pthread_t wait_thread;<br>
            &gt;&gt;&gt;&gt; +    static pthread_t signal_thread;<br>
            &gt;&gt;&gt;&gt; +    static pthread_t c_thread;<br>
            &gt;&gt;&gt;&gt; +    struct syncobj_point sp1, sp2, sp3;<br>
            &gt;&gt;&gt;&gt; +    uint32_t syncobj_handle;<br>
            &gt;&gt;&gt;&gt; +    uint64_t payload;<br>
            &gt;&gt;&gt;&gt; +    uint64_t wait_point, signal_point;<br>
            &gt;&gt;&gt;&gt; +    uint64_t timeout;<br>
            &gt;&gt;&gt;&gt; +    struct timespec tp;<br>
            &gt;&gt;&gt;&gt; +    int r, sync_fd;<br>
            &gt;&gt;&gt;&gt; +    void *tmp;<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r = 
            amdgpu_cs_create_syncobj2(device_handle, 0,<br>
            &gt;&gt;&gt;&gt; &amp;syncobj_handle);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    // wait on point 5<br>
            &gt;&gt;&gt;&gt; +    sp1.syncobj_handle = syncobj_handle;<br>
            &gt;&gt;&gt;&gt; +    sp1.point = 5;<br>
            &gt;&gt;&gt;&gt; +    r = pthread_create(&amp;wait_thread,
            NULL, syncobj_wait, &amp;sp1);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    // signal on point 10<br>
            &gt;&gt;&gt;&gt; +    sp2.syncobj_handle = syncobj_handle;<br>
            &gt;&gt;&gt;&gt; +    sp2.point = 10;<br>
            &gt;&gt;&gt;&gt; +    r = pthread_create(&amp;signal_thread,
            NULL, syncobj_signal, &amp;sp2);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r = pthread_join(wait_thread,
            &amp;tmp);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(tmp, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r = pthread_join(signal_thread,
            &amp;tmp);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(tmp, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    //query timeline payload<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_query(device_handle, &amp;syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                    &amp;payload, 1);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(payload, 10);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    //signal on point 16<br>
            &gt;&gt;&gt;&gt; +    sp3.syncobj_handle = syncobj_handle;<br>
            &gt;&gt;&gt;&gt; +    sp3.point = 16;<br>
            &gt;&gt;&gt;&gt; +    r = pthread_create(&amp;c_thread,
            NULL, syncobj_signal, &amp;sp3);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    //CPU wait on point 16<br>
            &gt;&gt;&gt;&gt; +    wait_point = 16;<br>
            &gt;&gt;&gt;&gt; +    timeout = 0;<br>
            &gt;&gt;&gt;&gt; +    clock_gettime(CLOCK_MONOTONIC,
            &amp;tp);<br>
            &gt;&gt;&gt;&gt; +    timeout = tp.tv_sec * 1000000000ULL +
            tp.tv_nsec;<br>
            &gt;&gt;&gt;&gt; +    timeout += 0x10000000000; //10s<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_timeline_wait(device_handle,<br>
            &gt;&gt;&gt;&gt; &amp;syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                        &amp;wait_point,
            1, timeout,<br>
            &gt;&gt;&gt;&gt; +                       
            DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |<br>
            &gt;&gt;&gt;&gt; + DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,<br>
            &gt;&gt;&gt;&gt; +                        NULL);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    r = pthread_join(c_thread, &amp;tmp);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(tmp, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    // export point 16 and import to point
            18<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_export_sync_file2(device_handle,<br>
            &gt;&gt;&gt;&gt; syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                        16,<br>
            &gt;&gt;&gt;&gt; + DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,<br>
            &gt;&gt;&gt;&gt; +                        &amp;sync_fd);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_import_sync_file2(device_handle,<br>
            &gt;&gt;&gt;&gt; syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                        18, sync_fd);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_query(device_handle, &amp;syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                    &amp;payload, 1);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(payload, 18);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    // CPU signal on point 20<br>
            &gt;&gt;&gt;&gt; +    signal_point = 20;<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_timeline_signal(device_handle,<br>
            &gt;&gt;&gt;&gt; &amp;syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                         
            &amp;signal_point, 1);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_syncobj_query(device_handle, &amp;syncobj_handle,<br>
            &gt;&gt;&gt;&gt; +                    &amp;payload, 1);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(payload, 20);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +    r =
            amdgpu_cs_destroy_syncobj(device_handle, syncobj_handle);<br>
            &gt;&gt;&gt;&gt; +    CU_ASSERT_EQUAL(r, 0);<br>
            &gt;&gt;&gt;&gt; +<br>
            &gt;&gt;&gt;&gt; +}<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; _______________________________________________<br>
            &gt;&gt;&gt; dri-devel mailing list<br>
            &gt;&gt;&gt; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>
            &gt;&gt;&gt; <a
              href="https://lists.freedesktop.org/mailman/listinfo/dri-devel"
              moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
            &gt;&gt;<br>
            &gt;<br>
            &gt; _______________________________________________<br>
            &gt; dri-devel mailing list<br>
            &gt; <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>
            &gt; <a
              href="https://lists.freedesktop.org/mailman/listinfo/dri-devel"
              moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
            <br>
          </div>
        </span></font>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------80B558730A7AEDDDC24C6B2B--

--===============1923871812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1923871812==--
