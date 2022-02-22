Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419934BEE7A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 02:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C8210E5C7;
	Tue, 22 Feb 2022 01:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584A510E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 01:13:27 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso12458853ooc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XfeCjdcJPAtnNUvXhiltq65+AwkhstxhF0wEcY8+gvE=;
 b=AJfesGR64GVz0lIjHf88aoIelor8x40fNyZ5JE2NGml3WnXrrMWse3G9nIq9o8D+tO
 7TBXdGAI+VUmZsUU9M+jzNPwNc1rCiPU8F4SV707SQ4Hgq0G24Pe1JpNgCl+9C7xlCtl
 BZCzTdKORmqHlvl8W5aprSw0y4OxJuEgM7K6+PQ0jCNNTQaaDo6N3TNQJNZe8jxjzj1Y
 PymTn5+++6J5saum8l0N+YBaS2F0Vw4TA+4ZHJccAz3VTmfdP9JBUm4cSyCBqoN37Jld
 qrmQX7j1KDDitDAe6qhSkcNb1epPg3b+MCqQAGVuP2TROkKrNzdZVTOmYN4RaEzpFkrA
 Q96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XfeCjdcJPAtnNUvXhiltq65+AwkhstxhF0wEcY8+gvE=;
 b=ndJy5vuRBJRXsCem/IeX1j0I3b1O25VSL+1I1Vap/Agzayj1LR7BWkiCsAKemXKcR3
 9zzjlOF+LZiLaP2g0qA1eFByFySWzVR7ntdQkEGWVECoS8XRQYkj7pwjAraIKAtxGG2M
 gF4z9EG4rJ+Zmed6s2fM2rn4601qVKOVQILjHbZmIDFdAxl3vJ50H/6NhZ13ggFPpK9Z
 vmzTM+guHzpE16T0ztQlPUETaDScFUTtglJQ6dtUGOw6QZ9mgmpyT3qUicED3znAAFTp
 m8ZzwyFGkTQeg9groKHFn+H0yQu23OTVHYKSfcmY2F7kdtnTmNnarlRciYcQs00lqwcM
 2FHw==
X-Gm-Message-State: AOAM533KUvdqcNRsUmgvB96cykR0HO+AfN3rbhNf8gwU6Zs194v8wfwg
 Dv+oTuYGVMo9N6SKZLlnY4w=
X-Google-Smtp-Source: ABdhPJxfEOfzPwl+CgaVd1Sh+9zORZ1S2JpHiJ+98hc3PkCI4PSWt0QQJIt9ZJ1J4fPx6V9O//xAvA==
X-Received: by 2002:a05:6870:790f:b0:cc:85e2:1227 with SMTP id
 hg15-20020a056870790f00b000cc85e21227mr641159oab.329.1645492406451; 
 Mon, 21 Feb 2022 17:13:26 -0800 (PST)
Received: from ?IPV6:2804:431:c7f5:17ae:9c11:82cd:a0dd:f564?
 ([2804:431:c7f5:17ae:9c11:82cd:a0dd:f564])
 by smtp.gmail.com with ESMTPSA id o14sm14982230oaq.37.2022.02.21.17.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 17:13:26 -0800 (PST)
Message-ID: <f622224f-767e-c85a-3129-8c3b1e4313bc@gmail.com>
Date: Mon, 21 Feb 2022 22:13:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept
 new formats
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
 <20220208104018.cxnxgzgjn3ecf53l@mail.igalia.com>
 <b40b3f1b-1b0d-0b81-a5cf-1496fb479920@gmail.com>
 <20220209214535.wqoe3otgelry2kef@mail.igalia.com>
 <1b26f760-2213-b711-53fb-847560daf963@gmail.com>
 <20220221111823.044ca6ca@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220221111823.044ca6ca@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 tzimmermann@suse.de, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 2/21/22 06:18, Pekka Paalanen wrote:
> On Sun, 20 Feb 2022 22:02:12 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> Hi Melissa,
>>
>> On 2/9/22 18:45, Melissa Wen wrote:
>>> On 02/08, Igor Torrente wrote:
>>>> Hi Melissa,
>>>>
>>>> On 2/8/22 07:40, Melissa Wen wrote:
>>>>> On 01/21, Igor Torrente wrote:
>>>>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
>>>>>> as a color input.
>>>>>>
>>>>>> This patch refactors all the functions related to the plane composition
>>>>>> to overcome this limitation.
>>>>>>
>>>>>> A new internal format(`struct pixel`) is introduced to deal with all
>>>>>> possible inputs. It consists of 16 bits fields that represent each of
>>>>>> the channels.
>>>>>>
>>>>>> The pixels blend is done using this internal format. And new handlers
>>>>>> are being added to convert a specific format to/from this internal format.
>>>>>>
>>>>>> So the blend operation depends on these handlers to convert to this common
>>>>>> format. The blended result, if necessary, is converted to the writeback
>>>>>> buffer format.
>>>>>>
>>>>>> This patch introduces three major differences to the blend function.
>>>>>> 1 - All the planes are blended at once.
>>>>>> 2 - The blend calculus is done as per line instead of per pixel.
>>>>>> 3 - It is responsible to calculates the CRC and writing the writeback
>>>>>>        buffer(if necessary).
>>>>>>
>>>>>> These changes allow us to allocate way less memory in the intermediate
>>>>>> buffer to compute these operations. Because now we don't need to
>>>>>> have the entire intermediate image lines at once, just one line is
>>>>>> enough.
>>>>>>
>>>>>> | Memory consumption (output dimensions) |
>>>>>> |:--------------------------------------:|
>>>>>> |       Current      |     This patch    |
>>>>>> |:------------------:|:-----------------:|
>>>>>> |   Width * Heigth   |     2 * Width     |
>>>>>>
>>>>>> Beyond memory, we also have a minor performance benefit from all
>>>>>> these changes. Results running the IGT tests `*kms_cursor_crc*`:
>>>>>>   
>>>>> First, thanks for this improvement.
>>>>>
>>>>> Some recent changes in kms_cursor_crc caused VKMS to fail in most test
>>>>> cases (iirc, only size-change and alpha-opaque are passing currently).
>>>>
>>>> I updated my igt and kernel(from drm_misc/drm-misc-next) to the latest
>>>> commit[1][2] and I'm getting mixed results. Sometimes most of the test
>>>> passes, sometimes almost nothing passes.
>>> hmm.. is it happening when running kms_cursor_crc? Is the results
>>> variation random or is it possible to follow a set of steps to reproduce
>>> it? When failing, what is the reason displayed by the log?
>>
>> I investigated it a little bit and discovered that the KMS
>> cursor(".*kms_cursor_crc*" ) are failing after the execution of
>> writeback tests(".*kms_writeback.*").
>>
>> I don't know what is causing it, but they are failing while trying to
>> commit the KMS changes.
>>
>> out.txt:
>> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 5.17.0-rc2 x86_64)
>> Stack trace:
>>     #0 ../lib/igt_core.c:1754 __igt_fail_assert()
>>     #1 ../lib/igt_kms.c:3795 do_display_commit()
>>     #2 ../lib/igt_kms.c:3901 igt_display_commit2()
>>     #3 ../tests/kms_cursor_crc.c:820 __igt_unique____real_main814()
>>     #4 ../tests/kms_cursor_crc.c:814 main()
>>     #5 ../csu/libc-start.c:308 __libc_start_main()
>>     #6 [_start+0x2a]
>> Subtest pipe-A-cursor-size-change: FAIL
>>
>> err.txt:
>> (kms_cursor_crc:1936) igt_kms-CRITICAL: Test assertion failure function
>> do_display_commit, file ../lib/igt_kms.c:3795:
>> (kms_cursor_crc:1936) igt_kms-CRITICAL: Failed assertion: ret == 0
>> (kms_cursor_crc:1936) igt_kms-CRITICAL: Last errno: 22, Invalid argument
>> (kms_cursor_crc:1936) igt_kms-CRITICAL: error: -22 != 0
>>
>>>
>>>   From my side, only the first two subtest of kms_cursor_crc is passing
>>> before this patch. And after your changes here, all subtests are
>>> successful again, except those related to 32x10 cursor size (that needs
>>> futher investigation). I didn't check how the recent changes in
>>> kms_cursor_crc affect VKMS performance on it, but I bet that clearing
>>> the alpha channel is the reason to have the performance back.
>>
>> Yeah, I also don't understand why the 32x10 cursor tests are failing.
>>
> 
> Hi,
> 
> are the tests putting the cursor partially outside of the CRTC area?
> Or partially outside of primary plane area (which IIRC you used when you
> should have used the CRTC area?)?
> 
> Does the writeback test forget to unlink the writeback connector? Or
> does VKMS not handle unlinking the writeback connector?

I don't know the answer to all these questions.

I did try to find the commit that introduces this issue, and I found
that it's happening since the writeback was introduced in Aug
2020(dbd9d80c).

And the failure related to the 32x10 cursor was happening before my
changes.

> 
> If both are a problem, the latter would be just an unrelated bug that
> exposes the first bug in VKMS, because whether writeback is used or not
> probably should not affect where the cursor plane is allowed to be.

Yeah, I don't think those a related.

Best Regards.
---
Igor Torrente

> 
> 
> Thanks,
> pq
