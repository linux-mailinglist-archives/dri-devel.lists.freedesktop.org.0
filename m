Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67EF4E4DD0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 09:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC75910E637;
	Wed, 23 Mar 2022 08:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FBF10E633;
 Wed, 23 Mar 2022 08:10:07 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5ae903.dynamic.kabel-deutschland.de
 [95.90.233.3])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1DD7661E6478B;
 Wed, 23 Mar 2022 09:10:06 +0100 (CET)
Message-ID: <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
Date: Wed, 23 Mar 2022 09:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy support
 to amdgpu)
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
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
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Christian,


Am 23.03.22 um 08:42 schrieb Christian König:

> Am 23.03.22 um 07:42 schrieb Paul Menzel:

>> Am 23.03.22 um 07:25 schrieb Arunpravin Paneer Selvam:
>>> - Remove drm_mm references and replace with drm buddy functionalities
>>
>> The commit message summary to me suggested, you can somehow use both 
>> allocators now. Two suggestions below:
>>
>> 1.  Switch to drm buddy allocator
>> 2.  Use drm buddy alllocator
>>
>>> - Add res cursor support for drm buddy
>>
>> As an allocator switch sounds invasive, could you please extend the 
>> commit message, briefly describing the current situation, saying what 
>> the downsides are, and why the buddy allocator is “better”.
> 
> Well, Paul please stop bothering developers with those requests.
> 
> It's my job as maintainer to supervise the commit messages and it is 
> certainly NOT require to explain all the details of the current 
> situation in a commit message. That is just overkill.

I did not request all the details, and I think my requests are totally 
reasonable. But let’s change the perspective. If there were not any AMD 
graphics drivers bug, I would have never needed to look at the code and 
deal with it. Unfortunately the AMD graphics driver situation – which 
improved a lot in recent years – with no public documentation, 
proprietary firmware and complex devices is still not optimal, and a lot 
of bugs get reported, and I am also hit by bugs, taking time to deal 
with them, and maybe reporting and helping to analyze them. So to keep 
your wording, if you would stop bothering users with bugs and requesting 
their help in fixing them – asking the user to bisect the issue is often 
the first thing. Actually it should not be unreasonable for customers 
buying an AMD device to expect get bug free drivers. It’s strange and a 
sad fact, that the software industry succeeded to sway that valid 
expectation and customers now except they need to regularly install 
software updates, and do not get, for example, a price reduction when 
there are bugs.

Also, as stated everywhere, reviewer time is scarce, so commit authors 
should make it easy to attract new folks.

> A simple note that we are switching from the drm_mm backend to the buddy 
> backend is sufficient, and that is exactly what the commit message is 
> saying here.

Sorry, I disagree. The motivation needs to be part of the commit 
message. For example see recent discussion on the LWN article 
*Donenfeld: Random number generator enhancements for Linux 5.17 and 
5.18* [1].

How much the commit message should be extended, I do not know, but the 
current state is insufficient (too terse).


Kind regards,

Paul


[1]: https://lwn.net/Articles/888413/
      "Donenfeld: Random number generator enhancements for Linux 5.17 
and 5.18"
