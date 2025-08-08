Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145CB1E7E1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 14:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6166210E913;
	Fri,  8 Aug 2025 12:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H0kWHa28";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1910E913;
 Fri,  8 Aug 2025 12:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FAAB440FF;
 Fri,  8 Aug 2025 12:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7316AC4CEED;
 Fri,  8 Aug 2025 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754654597;
 bh=VyLVjvFvcueI6+wKwx97PRnYKMkUL7Nt3qh+EPNEz6Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H0kWHa28Srgbxe0k8U7Fqj8yGciW9s0dkbgVcYfh4SCREaV1qcUnnKAd4fML7bjl1
 WQCg4M9XU5Gk15B1kpHd7ntWG2OAHfk//VTI/TS/uygJZo1rUYxv+9tvV6nG00WdqR
 lOFv0Ej4+SU7l+GowjAEKJbyQB/84P/UTiAdMDFgNrhqCcVtZzgG/jyATTX06tMrL1
 9BgWlmuUNz9Ep+VbSCwaNc/XXSYUVXalm0iKKwXVBjHjtFKqX2ngCL8ZNF96Q4Qtsi
 1rbSxwbUwBNVgeNhd66PnLQWRtyjO5F8GnNCgM3OWlDKxFEyFCNVT1YvwLN7DaXUuj
 b5jf6mXJJOjwg==
Message-ID: <069d1243-5d4e-4594-89a3-63278d63681d@kernel.org>
Date: Fri, 8 Aug 2025 07:03:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: mad skateman <madskateman@gmail.com>, Alex Deucher
 <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alexander Deucher
 <Alexander.Deucher@amd.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 bhelgaas@google.com, benato.denis96@gmail.com, Yijun_Shen@dell.com,
 David Perry <David.Perry@amd.com>, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
References: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
 <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <0B029DD9-085A-4AD2-B3A0-4C427A1540EA@xenosoft.de>
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



On 8/8/25 6:47 AM, Christian Zigotzky wrote:
> 
> 
>> On 08 August 2025 um 01:23 pm, Mario Limonciello <superm1@kernel.org> wrote:
>>
>> ﻿
>>
>>> On 8/8/25 2:36 AM, Christian Zigotzky wrote:
>>> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@amd.com> wrote:
>>> Does applying
>>> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
>>> help?
>>> - - -
>>> Hello Mario,
>>> Thanks a lot for your patch.
>>> I tested it today but unfortunately it doesn’t solve the issue with the Radeon framebuffer.
>>> I have created two kernels with and without the drm-next-2025-07-30 updates [1] because of the issue with the Radeon graphics framebuffer device #15. [2]
>>> Download and further information: https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
>>> I have tested both kernels this week and I can definitely confirm, that the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
>>> The Radeon graphics framebuffer doesn't work with the kernel with the drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer works.
>>> I bisected yesterday. [2]
>>> There are some other user reports:
>>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
>>> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595
>>> They use other Radeon graphics chips.
>>> @All
>>> Please check the drm-next-2025-07-30 updates [1]
>>> Thanks,
>>> Christian
>>> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>>> [2] https://github.com/chzigotzky/kernels/issues/15
>>
>> I think there is a mistake in your bisect, which I notice from looking at your other user reports.
>>
>> The original commit you identified in your bisect and thus CC'ed me came in 6.16-rc1.
>>
>> ❯ git describe --contains 4d4c10f763d7808fbade28d83d237411603bca05
>> v6.16-rc1~50^2~19^2
>>
>> There absolutely was a regression for that was raised, but this was fixed in 6.16-rc3.
>>
>> ❯ git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
>> v6.16-rc3~13^2~1
>>
>> Users in your forums posts talk about 6.16 final working fine.  So I think that when you bisected you ran into multiple confounding issues and replicated in a similar fashion.  You should check every single bisect step to see if 4d4c10f763d7808fbade28d83d237411603bca05 is applied.  If it's applied but 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 is not applied in that step you should apply 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.
>>
>> Hopefully that will get you down to the real cause.
> 
> Thanks for the hint. Unfortunately I don’t have more time for figuring out the issue.
> 
> Two facts:
> 
> - The Radeon driver can no longer be used.
> The Radeon driver is broken for us.
> 
> - The issue is somewhere in the commit drm-next-2025-07-30 updates [1].
> 
> I cannot provide any more due to time constraints.
> 
> I've already spent time that I didn't actually have.
> 
> Thanks for your help.
> 
> Christian
> 
> 

If you're sure that the issue was raised in that merge commit, I suggest 
you (or someone else affected by this issue) do the bisect using the drm 
kernel tree [1] and bisect between the problematic tag [2] and previous 
tag [3].

[1] https://gitlab.freedesktop.org/drm/kernel
[2] https://gitlab.freedesktop.org/drm/kernel/-/tags/drm-next-2025-07-30
[3] https://gitlab.freedesktop.org/drm/kernel/-/tags/drm-next-2025-06-06
