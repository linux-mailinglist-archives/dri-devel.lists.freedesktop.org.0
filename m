Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44256B8088D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670B010E62F;
	Wed, 17 Sep 2025 15:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Esl8ilyM";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="T3vpjI0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 897 seconds by postgrey-1.36 at gabe;
 Wed, 17 Sep 2025 15:27:27 UTC
Received: from a7-41.smtp-out.eu-west-1.amazonses.com
 (a7-41.smtp-out.eu-west-1.amazonses.com [54.240.7.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F9C10E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1758121948;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=ul5WCVmtbsTGX05C9VN9GGGFWBTVwIj/Q2yVkJGlOpk=;
 b=Esl8ilyMO3q4MOhGb0h/TdchjE+s0ycqJYjySLAkWpb1sYQKVtWcD5Wcald1SgRr
 OcBKyj4yIH7O0h6pgKPuEic9qf8/wzUxlEdjzvclzxGeYxHBuYtkOCZZqbP4RJQaxVa
 DSVcHLDWPmB8z1Q7jmeUmJVYX/u0n41HdwtDeVD31CgAghplQp+LAfxgSsPIkBhyLvw
 j0CmEzYAK33w+OVexHHvE+QwGOCP7FUMFQcZTknf2yqVNeOlE7HXiHGC+4aVHpLOFcU
 JNGxt36BZmLYHL2CnKrn8k1Y1X3wmfVN06fzq1KHQr0Tg4RB3EwPBaCKRTyvjeSqZGD
 svcl4Me8tw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1758121948;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=ul5WCVmtbsTGX05C9VN9GGGFWBTVwIj/Q2yVkJGlOpk=;
 b=T3vpjI0pXtRCF48uiOI3PPu2JUm8hGvBIsyXbWg9Y+3Bf3oMoNPi6MuBsrkdHXVh
 8O41jbxtu7FRLuwKiybAFOUVYEsjCEDHZwjOmE78Ul7EE1K/Szr6C8KuVDHjbqerw6e
 GWDcp6HmeGwbirCU+pt3fCFdFhryxm42XjAKI2sw=
Message-ID: <01020199583bf42e-4a08777d-554c-42b7-a42c-5162f4459a72-000000@eu-west-1.amazonses.com>
Date: Wed, 17 Sep 2025 15:12:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: Xaver Hugl <xaver.hugl@gmail.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Chuanyu Tseng <Chuanyu.Tseng@amd.com>, harry.wentland@amd.com, 
 Mario.Limonciello@amd.com, victoria@system76.com, 
 seanpaul@google.com, Sunpeng.Li@amd.com, dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <d52ec8d7-cc5e-4801-bc04-096504a131b7@mailbox.org>
 <CAFZQkGzWUK5BP_f=zyOM8_pzvv6xYOaVdqN4RAULArvEmD4wUg@mail.gmail.com>
Content-Language: en-CA
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <CAFZQkGzWUK5BP_f=zyOM8_pzvv6xYOaVdqN4RAULArvEmD4wUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2025.09.17-54.240.7.41
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

On 9/16/25 4:56 PM, Xaver Hugl wrote:
> Am Mo., 15. Sept. 2025 um 17:49 Uhr schrieb Michel Dänzer
> <michel.daenzer@mailbox.org>:
>> On 15.09.25 17:37, Derek Foreman wrote:
>>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>>>> On 12.09.25 15:45, Derek Foreman wrote:
>>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>>> Introduce a DRM interface for DRM clients to further restrict the
>>>>>> VRR Range within the panel supported VRR range on a per-commit
>>>>>> basis.
>>>>>>
>>>>>> The goal is to give DRM client the ability to do frame-doubling/
>>>>>> ramping themselves, or to set lower static refresh rates for power
>>>>>> savings.
>>>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>>>>
>>>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>>>>
>>>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
>>>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
>>> Surprisingly, this would also not be precise enough for exact media playback, as the exact intended framerate might not result in an integer number of scan lines. When that happens a QMS/CinemaVRR capable HDMI source is expected to periodically post a frame with a single extra scan line to minimize the error.
>> Interesting, maybe your suggestion of numerator / denominator properties is better then.
> API wise, I'd much prefer just using nanoseconds instead of two
> properties that compositors will in practice just use the same way.

Yeah, I hear you. Period is generally much nicer than frequency, and 
every other time I'd unconditionally agree, but QMS is awkward in this 
regard.

The media file I start with will have a fraction specified in integers 
for the rate, eg: something like 24000/1001 fps. That will map to an 
index in an array of QMS blessed target framerates (24000/1001, 24, 25, 
48/1001, 48...) and the index ends up in a bitfield in the HDMI QMS 
infoframe. That infoframe also has a bit to indicate that the framerate 
is currently constant, with constant defined as "constant number of 
scanlines but may be exactly 1 scanline longer occasionally".

In the constant state we'd need to maintain that fixed rate within that 
constraint, and the integer math to do that needs to start from 24000/1001.

So if we used a nanosecond period for the interface, we'd need to take 
the media file's values and convert them to nanoseconds, then in the 
kernel convert back to something like milliframes per second (so we 
could get something near 23976), then look that up in the QMS accepted 
rates array, have some manner of epsilon to decide if we're close enough 
to one of them to use it, and then use the integer representation (back 
to 24000/1001) to setup the scanline temporal dithering algorithm to do 
the +1 extra line every few frames to hit the exact rate.

In effect we'd throw away the precise values we started with and try to 
reconstruct them later.

QMS also has the added strange feature of being able to set a fixed rate 
below the display's normal VRR minimum, so I'm undecided as to whether 
this range control interface is an ideal match for setting up QMS 
anyway, or whether I should propose a separate fixed rate property 
later. I just don't want to ignore this discussion and show up proposing 
another non-orthogonal property later.

Sorry to be speaking in hypotheticals, I do have a working QMS 
implementation to share soonish, it's just not quite ready for review yet...

