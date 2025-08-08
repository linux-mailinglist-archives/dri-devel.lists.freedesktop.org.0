Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC1B1E715
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 13:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F84810E4F5;
	Fri,  8 Aug 2025 11:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LdLoZQa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718BD10E4F5;
 Fri,  8 Aug 2025 11:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6B90EA543F4;
 Fri,  8 Aug 2025 11:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D46C4CEED;
 Fri,  8 Aug 2025 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754652206;
 bh=GpV3W47n1bkfqRHZ3LaVYGNiCSl0JY+5MwvSCjMeAY8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LdLoZQa/2802qExL1hbwzNz1rYd8wJ57VsTmbSGEUnJSCBCAFkp1CyOZrArlp1u11
 dsB5iSjvP9U+bbHStAGf0d5g0g4kb5Mgjx1NPK38426apIMF6760299XoRTZ86Mm8q
 1q7jTm4AH3UjGLIG8CetS1bZHrf7KTiUABhoW11lncNVy5aEgB6ESF+EzIgn7XLvH8
 L2ViVy0RB1fxdu0YdHDIlkggB+J6UPdqcg8MpjuIn1/ChMz2lajBJTo8jQXxXH8x6W
 41rOf7qyH2prRyK4Iu7rA+8B9WEvOmRYYZAHqMJ0PpN7JqvAO2xJZ46FTx41zgpJ8o
 k5CH4WiPtZ85w==
Message-ID: <66083d23-e60c-4fce-bad0-81dbb9dcebde@kernel.org>
Date: Fri, 8 Aug 2025 06:23:23 -0500
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
References: <69bac1ee-4fea-4225-b222-d7f274a8ea3c@amd.com>
 <EBCB1171-0CF8-4B7A-97C9-0E7816EBA6B5@xenosoft.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <EBCB1171-0CF8-4B7A-97C9-0E7816EBA6B5@xenosoft.de>
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



On 8/8/25 2:36 AM, Christian Zigotzky wrote:
> 
> On 07 August 2025 at 04:21 pm, Limonciello, Mario <Mario.Limonciello@amd.com> wrote:
> 
> Does applying
> https://github.com/torvalds/linux/commit/907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
> help?
> 
> - - -
> 
> Hello Mario,
> 
> Thanks a lot for your patch.
> 
> I tested it today but unfortunately it doesn’t solve the issue with the Radeon framebuffer.
> 
> I have created two kernels with and without the drm-next-2025-07-30 updates [1] because of the issue with the Radeon graphics framebuffer device #15. [2]
> 
> Download and further information: https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
> 
> I have tested both kernels this week and I can definitely confirm, that the issue is somewhere in the commit drm-next-2025-07-30 updates [1].
> 
> The Radeon graphics framebuffer doesn't work with the kernel with the drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer works.
> 
> I bisected yesterday. [2]
> 
> There are some other user reports:
> 
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595
> 
> They use other Radeon graphics chips.
> 
> @All
> Please check the drm-next-2025-07-30 updates [1]
> 
> Thanks,
> Christian
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
> 
> [2] https://github.com/chzigotzky/kernels/issues/15
> 

I think there is a mistake in your bisect, which I notice from looking 
at your other user reports.

The original commit you identified in your bisect and thus CC'ed me came 
in 6.16-rc1.

❯ git describe --contains 4d4c10f763d7808fbade28d83d237411603bca05
v6.16-rc1~50^2~19^2

There absolutely was a regression for that was raised, but this was 
fixed in 6.16-rc3.

❯ git describe --contains 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0
v6.16-rc3~13^2~1

Users in your forums posts talk about 6.16 final working fine.  So I 
think that when you bisected you ran into multiple confounding issues 
and replicated in a similar fashion.  You should check every single 
bisect step to see if 4d4c10f763d7808fbade28d83d237411603bca05 is 
applied.  If it's applied but 907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0 
is not applied in that step you should apply 
907a7a2e5bf40c6a359b2f6cc53d6fdca04009e0.

Hopefully that will get you down to the real cause.
