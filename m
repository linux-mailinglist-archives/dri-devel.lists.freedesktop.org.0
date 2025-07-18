Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B09B09977
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 03:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B28910E03B;
	Fri, 18 Jul 2025 01:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="O5T7wehv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Fri, 18 Jul 2025 01:58:34 UTC
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D4810E03B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 01:58:34 +0000 (UTC)
Message-ID: <8d859c5f-2551-4624-a9b8-a816f1809feb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752803474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMathvZo6qrTXT/VBQjgvzpQ8pD2bKGmUmuglMoIaY8=;
 b=O5T7wehvbDlQw7EyOdDI5zQKKKtwevmaJnSf8uzwSiBUauM0L2JYyr80RRB2f4P8KOgQVi
 h87DM2wuxcJCOW+KGujvBFn6GOEZnTgdT5CORE7yVJkmakelcLzDXPwXIXkA+oqHxUvxWe
 zO5dMWnIj7ZfWX67hVF9mriZ4/k1AHs=
Date: Thu, 17 Jul 2025 18:51:02 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
To: Melissa Wen <mwen@igalia.com>,
 Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, airlied@gmail.com,
 simona@ffwll.ch, "Hung, Alex" <Alex.Hung@amd.com>,
 "Liu, Charlene" <Charlene.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250717143738.84722-1-mwen@igalia.com>
 <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
 <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
 <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
 <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
 <67169725b87e02cc8fdc19be5fc7df59@igalia.com>
 <CAD9O9Dq=dAsMs5a3VzgSvLwfuYYhkARDFBXyWUy+yktEZv5WbQ@mail.gmail.com>
 <bdfc8786-d4b8-4391-a4d4-c5fe06020802@igalia.com>
 <CAD9O9DqxJQyAJM=po4yDbAC=hHK2pi12qTVYeb+ar_GenGpMnw@mail.gmail.com>
 <478eb8175779f03a399f7d933614e14c@igalia.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <478eb8175779f03a399f7d933614e14c@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

On 7/17/25 5:18 PM, Melissa Wen wrote:
> On 17-07-2025 19:17, Matthew Schwartz wrote:
>> On Thu, Jul 17, 2025 at 12:43 PM Melissa Wen <mwen@igalia.com> wrote:
>>>
>>>
>>>
>>> On 17/07/2025 16:28, Matthew Schwartz wrote:
>>>> On Thu, Jul 17, 2025 at 12:18 PM Melissa Wen <mwen@igalia.com> wrote:
>>>>> On 17-07-2025 17:57, Matthew Schwartz wrote:
>>>>>>> On Jul 17, 2025, at 9:58 AM, Limonciello, Mario <Mario.Limonciello@amd.com> wrote:
>>>>>>>
>>>>>>> On 7/17/25 11:55 AM, Melissa Wen wrote:
>>>>>>>> On 17-07-2025 13:39, Limonciello, Mario wrote:
>>>>>>>>> On 7/17/25 9:36 AM, Melissa Wen wrote:
>>>>>>>>>> This reverts commit e1bd5e0bb4ca0d633ad698abd3658f8265009b81.
>>>>>>>>>>
>>>>>>>>>> The commit causes a regression in Steam Deck (DCN 3.01), reintroducing a
>>>>>>>>>> functional issue reported in [1] that was fixed by calling the
>>>>>>>>>> clear_update_flags() from commit 7671f62c10f2a.
>>>>>>>>>>
>>>>>>>>>> On Steam Deck, we use multiple hw plane color caps and up to two overlay
>>>>>>>>>> planes with dynamic pipe split policy. I.e. with 1 primary + 1 overlay,
>>>>>>>>>> the driver split planes into two (with 4 pipes), but with 1 primary + 2
>>>>>>>>>> overlays, we don't have enough pipe for splitting. Glitches appear in
>>>>>>>>>> this pipe-split transition of 1-2 overlay planes, if the driver doesn't
>>>>>>>>>> clear update flags.
>>>>>>>>>>
>>>>>>>>>> Besides that, the issue the commit e1bd5e0bb4ca tries to address [2]
>>>>>>>>>> isn't functional.
>>>>>>>>>>
>>>>>>>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3441 [1]
>>>>>>>>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4129 [2]
>>>>>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>>>>> Can you please double check the use case that prompted
>>>>>>>>> e1bd5e0bb4ca0d633ad698abd3658f8265009b81 in the first place?  IE With
>>>>>>>>> this revert you proposed do you see a traceback on unplug of external
>>>>>>>>> display?
>>>>>>>> Hi Mario,
>>>>>>>>
>>>>>>>> I don't see either traceback or REG_WAIT timeout when unplugging an
>>>>>>>> external HDMI-connected display.
>>>>>>>> I tried with the Deck Dock and USB-C to HDMI adapter. Not sure if there
>>>>>>>> is a very specific scenario that triggers this that I didn't cover.
>>>>>>> No; it's quite a general problem and easy to reproduce.  This makes me
>>>>>>> wonder if there should be an exception carved out for Steam Deck instead.
>>>>>> I just tested DCN 3.1.2 (Z2 Go) and DCN 3.1.4 (Legion Go/ROG Ally) and
>>>>>> I was not able to reproduce the issue so a Steam Deck carveout might make
>>>>>> sense here.
>>>>> What issue are you trying to reproduce?
>>>>> Glitches on Hades II + MangoHud, or traceback/REG_WAIT timeout?
>>>> Sorry, should've specified! I was testing for glitches with Hades II + MangoHud.
>>>>
>>>>> And with what kernel version?
>>>> amd-staging-drm-next built from b78bd800, tested on top of SteamOS Main
>>> I suspect you don't see the issue because your kernel doesn't expose AMD
>>> driver-specific color properties (?)
>>> For this, you should compile the kernel with KCFLAGS="-DAMD_PRIVATE_COLOR"
>>
>> [missed reply-all, resending this]
>>
>> Ah right, thanks for pointing this out. I've gone back and recompiled
>> the kernel with
>> AMD_PRIVATE_COLOR enabled. However, I'm still unable to reproduce the issue on
>> those other platforms. I can see the number of overlay planes change
>> in my dtn log,
>> as well as the pipeline changes with amdgpu_dm_visual_confirm.
>>
>> In the original issue, I was unable to reproduce the Hades II and
>> MangoHud glitches
>> on my Z1E device at the time so this lack of reproduction on DCN 3.1.2
>> and DCN 3.1.4
>> might be expected.
> 
> [Oh, I realized I only sent my reply to you. Sending the same msg to
> everyone now]
> 
> Sounds good.
> 
> Do you mind to share your DTN log with and without MangoHud enabled and
> the drm_info output with MangoHud?
> I want to compare those logs with Steam Deck.

Sure, going to use my Legion Go S w/ Z2 Go for this (DCN 3.1.2). All
of these are from amd-staging-drm-next with AMD_PRIVATE_COLOR=y.

DTN log from Hades II with MangoHud enabled:
https://gist.github.com/matte-schwartz/0c290ffe99bdb4f0d7369ee8817d1145

DTN log from Hades II with MangoHud disabled:
https://gist.github.com/matte-schwartz/3e2867e192ec9742ec545d2c5dd3096a

drm_info from Hades II with MangoHud enabled:
https://gist.github.com/matte-schwartz/456684fc60f7e84173ee2f42de4b774b

drm_info from Hades II with MangoHud disabled:
https://gist.github.com/matte-schwartz/6b635fa584d033234b435667f5d2c153

> 
>>
>>>
>>> If no plane color props, you are also not seeing three planes on AMD DTN
>>> log and then no transitions in the pipe split.
>>>
>>> My main concern is that we will just hide the problem with an exception,
>>> but it can come back to bite us when the KMS plane color API is merged
>>> and gamescope updated to it.
>>
>> That makes sense. I've been meaning to circle back to the gamescope
>> implementation of that now that Simon is unable to continue since it would
>> be good to get some testing started there.
> 
> I started working on it here:
> https://github.com/melissawen/gamescope/tree/kms_color
> But not my area of expertise, so it will be slow and needs some work on
> libliftoff.
> Let me know if you want to contribute anyway, maybe you can go faster
> than me.

It's uncharted territory for but I do enjoy tinkering, I will take a look
at your branch and see if I can start poking at the missing pieces.

Matt

> 
> Melissa
> 
>>
>> Matt
>>
>>>
>>> Melissa
>>>
>>>>
>>>>> Melissa
>>>>>
>>>>>> Matt
>>>>>>
>>>>>>>> The only message on dmesg from this action is:
>>>>>>>> amdgpu 0000:04:00.0: amdgpu: pp_od_clk_voltage is not accessible if
>>>>>>>> power_dpm_force_performance_level is not in manual mode!
>>>>>>>>
>>>>>>>> Moreover, if I move to the Desktop mode (KDE), there is no message.
>>>>>>>>
>>>>>>>> Melissa
>>>>>>>>
>>>>>>>>>> ---
>>>>>>>>>>    drivers/gpu/drm/amd/display/dc/core/dc.c | 5 +++--
>>>>>>>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>>>>>>>> index c31f7f8e409f..7c48f72e5917 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
>>>>>>>>>> @@ -5443,7 +5443,8 @@ bool dc_update_planes_and_stream(struct dc *dc,
>>>>>>>>>>     else
>>>>>>>>>>     ret = update_planes_and_stream_v2(dc, srf_updates,
>>>>>>>>>>     surface_count, stream, stream_update);
>>>>>>>>>> - if (ret && dc->ctx->dce_version >= DCN_VERSION_3_2)
>>>>>>>>>> +
>>>>>>>>>> + if (ret)
>>>>>>>>>>     clear_update_flags(srf_updates, surface_count, stream);
>>>>>>>>>>
>>>>>>>>>>     return ret;
>>>>>>>>>> @@ -5474,7 +5475,7 @@ void dc_commit_updates_for_stream(struct dc *dc,
>>>>>>>>>>     ret = update_planes_and_stream_v1(dc, srf_updates, surface_count, stream,
>>>>>>>>>>     stream_update, state);
>>>>>>>>>>
>>>>>>>>>> - if (ret && dc->ctx->dce_version >= DCN_VERSION_3_2)
>>>>>>>>>> + if (ret)
>>>>>>>>>>     clear_update_flags(srf_updates, surface_count, stream);
>>>>>>>>>>    }
>>>

