Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B27E9937
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ACA10E324;
	Mon, 13 Nov 2023 09:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599410E321;
 Mon, 13 Nov 2023 09:41:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4STPZR44dDz9smv;
 Mon, 13 Nov 2023 10:41:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1699868479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYXhDMcF3MrS0pAW4PnkAp2GNeGRqdljI6C43cXCOO8=;
 b=geDLWzUs9mlNg5whJr7WrXXoObB+4try8Bs7MlSUc0ZzU4IuSY2RXSnSFFDTSlzLo9xmOf
 /mQmadFakztKEMKjvrPrzNOR2jyz6fo9WQaGpe0gigwBJsksnFV/fa9XCTqdwH47eDnI5G
 DsYL9CBDIFGF8EzJJiirze3e4cD/aoZ8B4LHJOr7ZjXIaNwcvWImW1ZjTsE3fDGcOWOObP
 2WEOcMFLkVDvr3t/FfpBc7eu+LQhj58Aa/S/OMAYXmeQy2Xn7PETkY4Af6dlCq8lVj8NF/
 5pbchrUj033umpx4lFpdthOeVa4hhLW+xJ6gqRHMkTnRK33uzKVkbXRkl3lKww==
Message-ID: <438f2960-c49e-6485-5916-20d6e69ef7d4@mailbox.org>
Date: Mon, 13 Nov 2023 10:41:15 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v6 6/6] drm/doc: Define KMS atomic state set
Content-Language: de-CH-frami, en-CA
To: Simon Ser <contact@emersion.fr>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230815185710.159779-1-andrealmeid@igalia.com>
 <b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com>
 <20231016151856.74af9305@eldfell>
 <aa424bf8-5652-4a44-9b93-bdc0a31d835a@igalia.com>
 <20231016175222.7a89e6ab@eldfell> <ZS1ST6XAUHilBg3d@intel.com>
 <8NqDNz1Y8H5I_WhNhOj0ERarBH7nJhGQAsDHbmSnwzoOFtXPBPILwxLlF8-vDPKR06Uknp1BDSt7-6gTmHls62k79ETajXDfPRsmIP-cZN0=@emersion.fr>
 <ZS55mXTSxpXKYbsd@intel.com>
 <mawSNnD1hQ6vCVrNVMAvuQESnTToKPXrtiHIXXdqC-mq_LkxWOizPCcXx_KiEASVX-Mbm0LgjfTYkMNOjSAKCldpkXHAd9MmRzbC8ECPsTs=@emersion.fr>
 <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <5_NYn1PEc-XUYiRf5fC9oQqTaJxoAuvHVvw1PVTume5m8_cbOyku2Q2XKdCm66g0WcMq_RL8oSp52AowBzX9WAEiVBgdmYtPeXI9SWnD6Ts=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7c3c5aa1a8db02fdd65
X-MBO-RS-META: kg37gowaq3a6rqdmom3kkd9oowrdqz4m
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, xaver.hugl@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 wayland-devel@lists.freedesktop.org, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/13/23 10:18, Simon Ser wrote:
> On Monday, October 23rd, 2023 at 10:25, Simon Ser <contact@emersion.fr> wrote:
> 
>>>>>>>>>>> +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
>>>>>>>>>>> +effectively change only the FB_ID property on any planes. No-operation changes
>>>>>>>>>>> +are ignored as always. [...]
>>>>>>>>>>> During the hackfest in Brno, it was mentioned that a commit which re-sets the same FB_ID could actually have an effect with VRR: It could trigger scanout of the next frame before vertical blank has reached its maximum duration. Some kind of mechanism is required for this in order to allow user space to perform low frame rate compensation.
>>>>>>>>>
>>>>>>>>> Xaver tested this hypothesis in a flipping the same fb in a VRR monitor
>>>>>>>>> and it worked as expected, so this shouldn't be a concern.
>>>>>>>>> Right, so it must have some effect. It cannot be simply ignored like in
>>>>>>>>> the proposed doc wording. Do we special-case re-setting the same FB_ID
>>>>>>>>> as "not a no-op" or "not ignored" or some other way?
>>>>>>>>> There's an effect in the refresh rate, the image won't change but it
>>>>>>>>> will report that a flip had happened asynchronously so the reported
>>>>>>>>> framerate will be increased. Maybe an additional wording could be like:
>>>>>>>
>>>>>>> Flipping to the same FB_ID will result in a immediate flip as if it was
>>>>>>> changing to a different one, with no effect on the image but effecting
>>>>>>> the reported frame rate.
>>>>>>
>>>>>> Re-setting FB_ID to its current value is a special case regardless of
>>>>>> PAGE_FLIP_ASYNC, is it not?
>>>>>
>>>>> No. The rule has so far been that all side effects are observed
>>>>> even if you flip to the same fb. And that is one of my annoyances
>>>>> with this proposal. The rules will now be different for async flips
>>>>> vs. everything else.
>>>>
>>>> Well with the patches the async page-flip case is exactly the same as
>>>> the non-async page-flip case. In both cases, if a FB_ID is included in
>>>> an atomic commit then the side effects are triggered even if the property
>>>> value didn't change. The rules are the same for everything.
>>>
>>> I see it only checking if FB_ID changes or not. If it doesn't
>>> change then the implication is that the side effects will in
>>> fact be skipped as not all planes may even support async flips.
>>
>> Hm right. So the problem is that setting any prop = same value as
>> previous one will result in a new page-flip for asynchronous page-flips,
>> but will not result in any side-effect for asynchronous page-flips.
>>
>> Does it actually matter though? For async page-flips, I don't think this
>> would result in any actual difference in behavior?
> 
> To sum this up, here is a matrix of behavior as seen by user-space:
> 
> - Sync atomic page-flip
>   - Set FB_ID to different value: programs hw for page-flip, sends uevent
>   - Set FB_ID to same value: same (important for VRR)
>   - Set another plane prop to same value: same

A page flip is programmed even if FB_ID isn't touched?


>   - Set another plane prop to different value: maybe rejected if modeset required
> - Async atomic page-flip
>   - Set FB_ID to different value: updates hw with new FB address, sends
>     immediate uevent
>   - Set FB_ID to same value: same (no-op for the hw)

No-op implies it doesn't trigger scanning out a frame with VRR, if scanout is currently in vertical blank. Is that the case? If so, async flips can't reliably trigger scanning out a frame with VRR.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

