Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4BB9505F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC8210E59B;
	Tue, 23 Sep 2025 08:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="I/7/8MJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860710E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:37:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWCyb2B6lz9ssD;
 Tue, 23 Sep 2025 10:37:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758616631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDUJwINIpUo2Pw7vNCyDhN8XunXiGBGufnT8n0Am3lA=;
 b=I/7/8MJm5Xg7yv5pGKkLaNYN+CBjL0bEk/IknHrLp9ptos3OyC4Df8RiB/RcG6+AS9qH+V
 voxMQGybEvUngWb9rdtvRwMXYA9l4gCKZqIAl5zzFBuZFRGWo4WWAsXcPv7hvHlOACryo9
 jvMhTuE2hJDFU//gDMM5kGJnP5PMiyJeWrejbefkCCiep0i9Rn0n5CYHxoS5Vu+c2jpTBw
 ZdFxVfhFi/675ofxIBgZH5pTL13wjkC1w3dgF9Da6pyRWRtfGYBsFEJZ36vNo1N7ueNA1r
 k+x1pMN5bou6O3oQceuRdc6pwl7//IufreYXdvSvp7KeYxoHf+eK4GRJZIexcA==
Message-ID: <c3474514-7f2a-4443-a152-e035af7e0379@mailbox.org>
Date: Tue, 23 Sep 2025 10:37:08 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Leo Li <sunpeng.li@amd.com>, "Tseng, Chuan Yu (Max)"
 <ChuanYu.Tseng@amd.com>, Derek Foreman <derek.foreman@collabora.com>,
 Xaver Hugl <xaver.hugl@gmail.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "seanpaul@google.com" <seanpaul@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
 <CAFZQkGzWUK5BP_f=zyOM8_pzvv6xYOaVdqN4RAULArvEmD4wUg@mail.gmail.com>
 <01020199583bf42e-4a08777d-554c-42b7-a42c-5162f4459a72-000000@eu-west-1.amazonses.com>
 <CY1PR12MB9583E829ED2AF17A77A3EE7DE516A@CY1PR12MB9583.namprd12.prod.outlook.com>
 <508d9810-1e42-4439-b1f5-e213892975c0@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <508d9810-1e42-4439-b1f5-e213892975c0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: m9rgdcqysjdk56t7w6qm8tstz9c9wtwh
X-MBO-RS-ID: 639731ac1ec05544afa
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

On 22.09.25 21:06, Leo Li wrote:
> On 2025-09-18 04:33, Tseng, Chuan Yu (Max) wrote:
>> On 9/16/25 4:56 PM, Xaver Hugl wrote:
>>> Am Mo., 15. Sept. 2025 um 17:49 Uhr schrieb Michel Dänzer
>>> <michel.daenzer@mailbox.org>:
>>>> On 15.09.25 17:37, Derek Foreman wrote:
>>>>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>>>>>> On 12.09.25 15:45, Derek Foreman wrote:
>>>>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>>>>> Introduce a DRM interface for DRM clients to further restrict the
>>>>>>>> VRR Range within the panel supported VRR range on a per-commit
>>>>>>>> basis.
>>>>>>>>
>>>>>>>> The goal is to give DRM client the ability to do frame-doubling/
>>>>>>>> ramping themselves, or to set lower static refresh rates for
>>>>>>>> power savings.
>>>>>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>>>>>>
>>>>>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>>>>>>
>>>>>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
>>>>>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
>>>>> Surprisingly, this would also not be precise enough for exact media playback, as the exact intended framerate might not result in an integer number of scan lines. When that happens a QMS/CinemaVRR capable HDMI source is expected to periodically post a frame with a single extra scan line to minimize the error.
>>>> Interesting, maybe your suggestion of numerator / denominator properties is better then.
>>> API wise, I'd much prefer just using nanoseconds instead of two
>>> properties that compositors will in practice just use the same way.
>>
>>> Yeah, I hear you. Period is generally much nicer than frequency, and every other time I'd unconditionally agree, but QMS is awkward in this regard.
>>>
>>> The media file I start with will have a fraction specified in integers for the rate, eg: something like 24000/1001 fps. That will map to an index in an array of QMS blessed target framerates (24000/1001, 24, 25, 48/1001, 48...) and the index ends up in a bitfield in the HDMI QMS infoframe. That infoframe also has a bit to indicate that the framerate is currently constant, with constant defined as "constant number of scanlines but may be exactly 1 scanline longer occasionally".
>>>
>>> In the constant state we'd need to maintain that fixed rate within that constraint, and the integer math to do that needs to start from 24000/1001.
>>>
>>> So if we used a nanosecond period for the interface, we'd need to take the media file's values and convert them to nanoseconds, then in the kernel convert back to something like milliframes per second (so we could get something near 23976), then look that up in the QMS accepted rates array, have some manner of epsilon to decide if we're close enough to one of them to use it, and then use the integer representation (back to 24000/1001) to setup the scanline temporal dithering algorithm to do the +1 extra line every few frames to hit the exact rate.
>>>
>>> In effect we'd throw away the precise values we started with and try to reconstruct them later.
>>>
>>> QMS also has the added strange feature of being able to set a fixed rate below the display's normal VRR minimum, so I'm undecided as to whether this range control interface is an ideal match for setting up QMS anyway, or whether I should propose a separate fixed rate property later. I just don't want to ignore this discussion and show up proposing another non-orthogonal property later.
> 
> Static video/desktop frame rates was indeed one of the motivations for proposing this API, so it is worth discussing.
> 
> For amdgpu (and I think most HW are like this), hardware VRR granularity is at # of total vertical scanlines (vtotal). So if that isn't precise enough, then the driver will have to do record-keeping to alternate between some vtotal and vtotal+1 to avoid drift.
> 
> It's not impossible to do, though I'm not sure at what point the driver is considered to be doing "unexpected adjustments of refresh rate", which was something we were also trying to address with this new API. Today, drivers are free to do unexpected things with the vtotal, such as frame-doubling to handle rates below the supported vrr min, and frame-ramping to prevent panel flicker. We discussed at the display hackfest that this was not something compositors liked, and that compositors would like to handle that themselves.
> 
> Now, memory fails me, and I don't remember the exact motivation for why compositors want transparent vrr control. Was it because of unexpected driver-reported vblank timestamps messing with compositor internal record keeping? Or something else entirely?

AFAIR it's mostly about the compositor being able to control the refresh rate in general (e.g. keeping it low to save power) and allowing it to handle LFC & ramping without interference by the kernel's corresponding handling.


> Another way of putting it: Would the compositor rather:
> 
> 1. Specify a min_vtotal + 1 == max_vtotal so driver doesn't do any unexpected adjustments out of the specified range, or
> 2. Specify a min_frame_ns == max_frame_ns (or some other highly-precise unit), and have driver correct for drift by alternating between two vtotals, and hence adjust refresh rate beyond the specified range?

FWIW, I'd be fine with option 2.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
