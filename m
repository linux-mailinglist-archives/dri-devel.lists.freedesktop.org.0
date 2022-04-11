Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492F4FBB2A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8C210E166;
	Mon, 11 Apr 2022 11:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6E910E166;
 Mon, 11 Apr 2022 11:45:40 +0000 (UTC)
Received: from [192.168.0.7] (ip5f5ae91f.dynamic.kabel-deutschland.de
 [95.90.233.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id B154861EA1923;
 Mon, 11 Apr 2022 13:45:37 +0200 (CEST)
Message-ID: <ba56a9db-b34f-b2ce-baef-f8861476b3fc@molgen.mpg.de>
Date: Mon, 11 Apr 2022 13:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: Richard Gong <richard.gong@amd.com>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <44354d78-b340-fbc4-fd6c-060d7ad3404e@molgen.mpg.de>
 <45ea5705-71d6-4008-f094-1aa902e5cc41@amd.com>
 <0d0a3f0f-f021-ccc2-a80a-f789cb53a47b@molgen.mpg.de>
 <192375d0-85ac-ced0-43d6-e5ea4e3c0fae@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <192375d0-85ac-ced0-43d6-e5ea4e3c0fae@amd.com>
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
Cc: airlied@linux.ie, xinhui.pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, Dell.Client.Kernel@dell.com,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Richard,


Am 11.04.22 um 13:38 schrieb Gong, Richard:

> On 4/11/2022 2:41 AM, Paul Menzel wrote:
>> [Cc: +<Dell.Client.Kernel@dell.com>]

>> Am 11.04.22 um 02:27 schrieb Gong, Richard:
>>
>>> On 4/8/2022 7:19 PM, Paul Menzel wrote:
>>
>>>> Am 08.04.22 um 21:05 schrieb Richard Gong:
>>>>> Active State Power Management (ASPM) feature is enabled since 
>>>>> kernel 5.14.
>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>>>>> used with Intel AlderLake based systems to enable ASPM. Using these 
>>>>> GFX
>>>>
>>>> Alder Lake
>>> will correct in the next version.
>>>>
>>>>> cards as video/display output, Intel Alder Lake based systems will hang
>>>>> during suspend/resume.
>>>>
>>>> Please reflow for 75 characters per line.
>>>>
>>>> Also please mention the exact system you had problems with (also 
>>>> firmware versions).
>>>>
>>>>>
>>>>> Add extra check to disable ASPM on Intel AlderLake based systems.
>>>>
>>>> Is that a problem with Intel Alder Lake or the Dell system? 
>>>> Shouldn’t ASPM just be disabled for the problematic cards for the 
>>>> Dell system. You write newer cards worked fine.
>>>
>>> There is a problem with Dell system (Dell Precision DT workstation), 
>>> which is based on Intel Alder Lake.
>>>
>>> ASPM works just fine on these GPU's. It's more of an issue with 
>>> whether the underlying platform supports ASPM or not.
>>
>> At least you didn’t document what the real issue is,
> 
> You can refer to bug tag from the comment messages.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885

No, the commit message should be self-contained, and reviewers and 
readers of the commit message not required to read comments of bug 
reports. Please add the necessary information to the commit message.


Kind regards,

Paul


>> that ASPM does not work. With current information (some GPU graphics 
>> card with the the Dell system and others don’t), it could be the GPU, 
>> the Dell system (firmware, …), a problem with Alder Lake SOC, or 
>> another bug. I hope you are in contact with Dell to analyze it, so 
>> ASPM can be enabled again.
>>
>> […]
>>
>>
>> Kind regards,
>>
>> Paul
