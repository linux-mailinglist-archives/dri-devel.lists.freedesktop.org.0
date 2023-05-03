Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE26F5F01
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FACF891BA;
	Wed,  3 May 2023 19:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BB08916D;
 Wed,  3 May 2023 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EhdvKt6fX3eyfVjkfKTMAZRD9OI88urIeLzb1B2hSPM=; b=j0Gwons4s5FUq/78sp8LgxzVTP
 2FHF6xLZdhAxISl+mp2oHaYMQ7jwJTz3haBYn1dhDlKgsQJa0aIQO78CunvaTGc86Ki13q14YgTuU
 Q3umhiQrAVSAM+Gv1wDliK04Dm1pKTbxpPe8R9J8FCu62W2hIAWsSiRvmCgbgDdvKn2gRUJFyN3gl
 W848m7d6Km6t2WtFicatkglaPcAtZxbKRIxeqY2d2+8uMWGQWvy5ykUs/2HWe/1hqqBLsAkvTz5jX
 A/Y6isPexHsKdM+9iaicddj9Pty3El0qQNSyKPop4C5DU7153ldwlARn3VrA+6AeShivtXrnleV+G
 DsP1ZbLA==;
Received: from [179.113.250.147] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1puHwL-000eUN-2j; Wed, 03 May 2023 21:15:01 +0200
Message-ID: <59774c28-a0ef-d4f2-e920-503857bce1cf@igalia.com>
Date: Wed, 3 May 2023 16:14:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
 <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
 <967a044bc2723cc24ab914506c0164db08923c59.camel@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <967a044bc2723cc24ab914506c0164db08923c59.camel@gmail.com>
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 03/05/2023 14:43, Timur Kristóf escreveu:
> Hi Felix,
> 
> On Wed, 2023-05-03 at 11:08 -0400, Felix Kuehling wrote:
>> That's the worst-case scenario where you're debugging HW or FW
>> issues.
>> Those should be pretty rare post-bringup. But are there hangs caused
>> by
>> user mode driver or application bugs that are easier to debug and
>> probably don't even require a GPU reset?
> 
> There are many GPU hangs that gamers experience while playing. We have
> dozens of open bug reports against RADV about GPU hangs on various GPU
> generations. These usually fall into two categories:
> 
> 1. When the hang always happens at the same point in a game. These are
> painful to debug but manageable.
> 2. "Random" hangs that happen to users over the course of playing a
> game for several hours. It is absolute hell to try to even reproduce
> let alone diagnose these issues, and this is what we would like to
> improve.
> 
> For these hard-to-diagnose problems, it is already a challenge to
> determine whether the problem is the kernel (eg. setting wrong voltages
> / frequencies) or userspace (eg. missing some synchronization), can be
> even a game bug that we need to work around.
> 
>> For example most VM faults can
>> be handled without hanging the GPU. Similarly, a shader in an endless
>> loop should not require a full GPU reset.
> 
> This is actually not the case, AFAIK André's test case was an app that
> had an infinite loop in a shader.
> 

This is the test app if anyone want to try out: 
https://github.com/andrealmeid/vulkan-triangle-v1. Just compile and run.

The kernel calls amdgpu_ring_soft_recovery() when I run my example, but 
I'm not sure what a soft recovery means here and if it's a full GPU 
reset or not.

But if we can at least trust the CP registers to dump information for 
soft resets, it would be some improvement from the current state I think

>>
>> It's more complicated for graphics because of the more complex
>> pipeline
>> and the lack of CWSR. But it should still be possible to do some
>> debugging without JTAG if the problem is in SW and not HW or FW. It's
>> probably worth improving that debugability without getting hung-up on
>> the worst case.
> 
> I agree, and we welcome any constructive suggestion to improve the
> situation. It seems like our idea doesn't work if the kernel can't give
> us the information we need.
> 
> How do we move forward?
> 
> Best regards,
> Timur
> 
