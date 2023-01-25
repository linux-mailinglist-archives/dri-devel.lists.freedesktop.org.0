Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64767B41F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3065510E7D0;
	Wed, 25 Jan 2023 14:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C6510E7C0;
 Wed, 25 Jan 2023 14:20:08 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x36so21891555ede.13;
 Wed, 25 Jan 2023 06:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hTYsLn7R0wact9u3KT1KC+BAfq0Cj99bixQ1bKmgqHc=;
 b=OJqSTZbwRfKjHh1HlmT/JWyoDIHkjp4Ul6n3czBxR6G22Q6jn7d7NIKbMm1XNXdeUy
 HXBG05putkqbiH9cQUpK0xLfnJfGz0Mv47ZbvsV6rjsujj37OpEx9MPtWvddDy2CHbv7
 S93iMsiF9OceWFDXMAFTrCtD6AxzWv09r0QlzUqzyj8eLCgZtn2uedo4gzOPmw9FqmEt
 05y9YhqalGv2Zy9iM8WTYmRyBKjctQmvIVPiFMQrs4EJtQ/E1LVxvu5yAisMAlPI+dvU
 qcjmtGJ8JLyTOdCuaXz8ikargHTlXG/qDoXSbzCSHrtaDZ0nMSD+FxiXsppzTI3UBIv6
 husw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTYsLn7R0wact9u3KT1KC+BAfq0Cj99bixQ1bKmgqHc=;
 b=RaSLyIOHA1P7mq8klQi3MeF+J7ljGIqI60D7gYp+I/G4n9ub7yfFr0ZaQmAFfaKgxl
 IEMSgcGw5l1j/8ZZdZbAU7kk4eWOhnRnvw5JGBhXQlKk0MGo4YvODLiygPP+Fu0EdyTK
 2fK1t2g2SjklZm6n2D8PtlOUVf2m+MoKuon1VQy2GOfLO/Gov8SNCFCRZeAYEvFv9pCl
 paTQXFS8/gGtbtU0F/EubYdvAmYW4pbmWV9VIHxCgseMukWb4ZtwBAB6V7YU8Hj4fp6p
 +zizNkxMXsdYUxpyZGnVepxq6Desf16WuRgN4QJ6JWuo0Vq5FU+aQFHFc4jwhZQ0SgGn
 zEnQ==
X-Gm-Message-State: AFqh2kqdAoojIOkbe4CJ1SAa/wyITZ54+gCmZNXic+8QWLGzeI9sJpc8
 oZMdrL5lfCtrp8bnvN3O3eo=
X-Google-Smtp-Source: AMrXdXtCuoXEInQAa1Wq3I/ITOjlb5yjBN/XwvVC5jd1mFikgyf3okfKRWhy6q5bGy3zfx7hZmqCPA==
X-Received: by 2002:a05:6402:10ce:b0:46b:eadf:8d34 with SMTP id
 p14-20020a05640210ce00b0046beadf8d34mr30049937edu.7.1674656406419; 
 Wed, 25 Jan 2023 06:20:06 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:180c:8737:8e57:6be7?
 ([2a02:908:1256:79a0:180c:8737:8e57:6be7])
 by smtp.gmail.com with ESMTPSA id
 v16-20020aa7dbd0000000b00458b41d9460sm2387323edt.92.2023.01.25.06.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 06:20:05 -0800 (PST)
Message-ID: <2ace4ce4-ed25-8bdf-ad19-28c45f964280@gmail.com>
Date: Wed, 25 Jan 2023 15:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: audit bo->resource usage v3
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20230124125726.13323-1-christian.koenig@amd.com>
 <CAM0jSHNmv-naGqB=R8DZc-3QhTPzzo4pUU2-NxhtiEhXMcAN5A@mail.gmail.com>
 <CAM0jSHMgep0q9=C=fHw+Y8SqpNeN3Gz47u_UvwgJuGG3_0qgBQ@mail.gmail.com>
 <CAM0jSHNKkAS1+dYJdHk23+Uyoz02G1VPFLpKLxX2HqRe7L2HCA@mail.gmail.com>
 <418a6bca-7a61-86d8-7f6a-229d1e12c0fd@gmail.com>
 <CAM0jSHMrtTWPpExT-M3=qGKyFPSjN=WbsDnLZTaADneyXxOjZQ@mail.gmail.com>
 <d1da49dd-5d7e-e488-e584-6f07613dcb16@gmail.com>
 <CAM0jSHP-2D8MKZOnQfLM1+ZnMDx=231f=Mxwb0X3BJsG2vbRYA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHP-2D8MKZOnQfLM1+ZnMDx=231f=Mxwb0X3BJsG2vbRYA@mail.gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 13:53 schrieb Matthew Auld:
> On Wed, 25 Jan 2023 at 11:35, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 25.01.23 um 11:21 schrieb Matthew Auld:
>>> On Wed, 25 Jan 2023 at 10:07, Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 25.01.23 um 10:56 schrieb Matthew Auld:
>>>>> On Tue, 24 Jan 2023 at 17:15, Matthew Auld
>>>>> <matthew.william.auld@gmail.com> wrote:
>>>>>> On Tue, 24 Jan 2023 at 13:48, Matthew Auld
>>>>>> <matthew.william.auld@gmail.com> wrote:
>>>>>>> On Tue, 24 Jan 2023 at 12:57, Christian König
>>>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>>>>>>
>>>>>>>> Make sure we can at least move and alloc TT objects without backing store.
>>>>>>>>
>>>>>>>> v2: clear the tt object even when no resource is allocated.
>>>>>>>> v3: add Matthews changes for i915 as well.
>>>>>>>>
>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>>>> Ofc that assumes intel-gfx CI is now happy with the series.
>>>>> There are still some nasty failures it seems (in the extended test
>>>>> list). But it looks like the series is already merged. Can we quickly
>>>>> revert and try again?
>>>> Ah, crap. I thought everything would be fine after the CI gave it's go.
>>>>
>>>> Which patch is causing the fallout?
>>> I'm not sure. I think all of the patches kind of interact with each
>>> other, but for sure there is an issue with the first patch. There is
>>> one splat like:
>> Well I would rather like to revert as less as possible.
>>
>> Are you sure that this isn't only on some i915 specific branch with not
>> yet upstream changes?
> Yeah, that splat is taken directly from the CI results reported with
> this series. So it's just your series applied on top of drm-tip.
>
> Can you take a look at the first patch here:
> https://patchwork.freedesktop.org/series/113332/
>
> Maybe you have a better idea? For reference the IGTs that we have for
> verifying userspace object clearing are now failing, so hoping that
> fixes it. The other two patches I'm hoping will fix the splat.

The TTM change looks like a good idea to me. Feel free to add my rb to 
this one.

I can't say much about the i915 changes.

Maybe we should revert the two TTM patches to not allocate resources for 
now and fix i915 first?

Christian.

>
>> I can't even find the i915_gem_obj_copy_ttm function in drm-misc-next
>> nor drm-next.
>>
>> Regards,
>> Christian.
>>
>>> <1>[  109.735148] BUG: kernel NULL pointer dereference, address:
>>> 0000000000000010
>>> <1>[  109.735151] #PF: supervisor read access in kernel mode
>>> <1>[  109.735152] #PF: error_code(0x0000) - not-present page
>>> <6>[  109.735153] PGD 0 P4D 0
>>> <4>[  109.735155] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>> <4>[  109.735157] CPU: 1 PID: 92 Comm: kworker/u12:6 Not tainted
>>> 6.2.0-rc5-Patchwork_113269v1-gc4d436608c4e+ #1
>>> <4>[  109.735159] Hardware name: Gigabyte Technology Co., Ltd. GB-Z390
>>> Garuda/GB-Z390 Garuda-CF, BIOS IG1c 11/19/2019
>>> <4>[  109.735160] Workqueue: events_unbound async_run_entry_fn
>>> <4>[  109.735163] RIP: 0010:i915_ttm_resource_mappable+0x4/0x30 [i915]
>>> <4>[  109.735286] Code: b8 f9 ff ff ff eb c2 e8 aa 5e 52 e1 e9 4f 0f
>>> 18 00 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
>>> 66 0f 1f 00 <8b> 57 10 b8 01 00 00 00 85 d2 74 15 48 8b 47 08 48 05 ff
>>> 0f 00 00
>>> <4>[  109.735288] RSP: 0018:ffffc90000f339a8 EFLAGS: 00010246
>>> <4>[  109.735289] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
>>> ffff88810cea3a00
>>> <4>[  109.735290] RDX: 0000000000000000 RSI: ffffc90000f33af0 RDI:
>>> 0000000000000000
>>> <4>[  109.735292] RBP: ffff88811645d7c0 R08: 0000000000000000 R09:
>>> ffff888123afa940
>>> <4>[  109.735292] R10: 0000000000000001 R11: ffff888104b70040 R12:
>>> 0000000000000000
>>> <4>[  109.735293] R13: 0000000000000000 R14: ffffc90000f33b08 R15:
>>> ffffc90000f33af0
>>> <4>[  109.735294] FS:  0000000000000000(0000)
>>> GS:ffff8884ad680000(0000) knlGS:0000000000000000
>>> <4>[  109.735295] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> <4>[  109.735296] CR2: 0000000000000010 CR3: 000000011f9c6003 CR4:
>>> 00000000003706e0
>>> <4>[  109.735297] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>>> 0000000000000000
>>> <4>[  109.735298] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
>>> 0000000000000400
>>> <4>[  109.735299] Call Trace:
>>> <4>[  109.735300]  <TASK>
>>> <4>[  109.735301]  __i915_ttm_move+0x128/0x940 [i915]
>>> <4>[  109.735408]  ? dma_resv_iter_next+0x91/0xb0
>>> <4>[  109.735412]  ? dma_resv_iter_first+0x42/0xb0
>>> <4>[  109.735414]  ? i915_deps_add_resv+0x4c/0xc0 [i915]
>>> <4>[  109.735520]  i915_gem_obj_copy_ttm+0x12f/0x250 [i915]
>>> <4>[  109.735625]  i915_ttm_restore+0x167/0x250 [i915]
>>> <4>[  109.735759]  i915_gem_process_region+0x27a/0x3b0 [i915]
>>> <4>[  109.735881]  i915_ttm_restore_region+0x4b/0x70 [i915]
>>> <4>[  109.735999]  lmem_restore+0x3a/0x60 [i915]
>>> <4>[  109.736101]  i915_gem_resume+0x4c/0x100 [i915]
>>> <4>[  109.736202]  i915_drm_resume+0xc2/0x170 [i915]
>>>
>>> Plus some other less obvious issue(s) with some tests failing.
>>>
>>>> Christian.

