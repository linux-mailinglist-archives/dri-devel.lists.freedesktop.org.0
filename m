Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA44F3714
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C3A10E8AC;
	Tue,  5 Apr 2022 14:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DCB10E39E;
 Tue,  5 Apr 2022 14:16:22 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae8ff.dynamic.kabel-deutschland.de
 [95.90.232.255])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id E7D2461E64846;
 Tue,  5 Apr 2022 16:16:20 +0200 (CEST)
Message-ID: <e0c14cae-5f34-b040-e1de-645eed16042a@molgen.mpg.de>
Date: Tue, 5 Apr 2022 16:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Public patches but non-public development branch
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20220404214255.11902-1-Philip.Yang@amd.com>
 <7a0e9d4c-257f-287e-9caf-f4161887ba39@molgen.mpg.de>
 <530f3735-9a82-54af-c090-cc8d5b1510cc@amd.com>
 <226a1c28-2516-7af4-dc19-7236f31128e9@molgen.mpg.de>
 <CADnq5_M2nX_TAth0aQbxRWSLQVnDKMGuBBxzhvrBv6ZA5SZe1w@mail.gmail.com>
 <02ebf0ff-32e5-6be5-b166-163efd95d5ad@molgen.mpg.de>
 <CADnq5_OAByMKOGysWqt8nfO4_8DSM57D8JOMRTL9mRoJSN7tMA@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CADnq5_OAByMKOGysWqt8nfO4_8DSM57D8JOMRTL9mRoJSN7tMA@mail.gmail.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Alex,


Am 05.04.22 um 16:13 schrieb Alex Deucher:
> On Tue, Apr 5, 2022 at 10:03 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:

>> Am 05.04.22 um 15:14 schrieb Alex Deucher:
>>> On Tue, Apr 5, 2022 at 3:02 AM Paul Menzel wrote:
>>
>>>> Am 05.04.22 um 08:54 schrieb Christian König:
>>>>> Am 05.04.22 um 08:45 schrieb Paul Menzel:
>>>>
>>>>>> Am 04.04.22 um 23:42 schrieb Philip Yang:
>>>>>>> bo_adev is NULL for system memory mapping to GPU.
>>>>>>>
>>>>>>> Fixes: 05fe8eeca92 (drm/amdgpu: fix TLB flushing during eviction)
>>>>>>
>>>>>> Sorry, where can I find that commit?
>>>>>
>>>>> Well that's expected, the development branch is not public.
>>>>
>>>> Well obviously, it was unexpected for me. How should I have known? Where
>>>> is that documented? If the patches are publicly posted to the mailing
>>>> list, why is that development branch not public?
>>>>
>>>> The current situation is really frustrating for non-AMD employees. How
>>>> can the current situation be improved?
>>>
>>> Our development branch
>>> (https://gitlab.freedesktop.org/agd5f/linux/-/commits/amd-staging-drm-next)
>>> is available publicly.  There can be a day or so of lag depending on
>>> when it gets mirrored (e.g., over the weekend).
>>
>> Thank you for the clarification. As can be seen at hand, it still causes
>> confusion though.
>>
>>       commit 05fe8eeca927e29b81f3f2a799e9b9b88b0989a9
>>       Author:     Christian König <christian.koenig@amd.com>
>>       AuthorDate: Wed Mar 30 10:53:15 2022 +0200
>>       Commit:     Christian König <christian.koenig@amd.com>
>>       CommitDate: Fri Apr 1 11:05:51 2022 +0200
>>
>> Today is Tuesday, so it wasn’t mirrored yesterday, on Monday.
>>
>> To avoid this friction in the future, is there an automated way to
>> mirror the branches? git hooks should allow that to be done on every
>> push for example.
> 
> It's a bit more complicated than that since we have various CI systems
> and IT security policies involved, but we can look into it.

That’d be awesome. Thank you!


Kind regards,

Paul
