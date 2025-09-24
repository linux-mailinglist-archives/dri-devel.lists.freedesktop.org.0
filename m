Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A6B99B18
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 13:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6591910E715;
	Wed, 24 Sep 2025 11:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="fhPWw9Kt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659610E714
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 11:56:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cWwL96XNNz9tNb;
 Wed, 24 Sep 2025 13:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758714993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1EdRa3ymHJOUsZdwh/bmyxDFhAt+RoE2xmwWyKnK18=;
 b=fhPWw9KtTIXELpp925RUMsP2XKcRsqCsy9smKunL0R5XoW9G9Kdk2m/6gYmEKaABik7Z/7
 y/ZS1mqsdKus03q8ZOg4iky6/YMcGrp7c1dgYxekjB2KaezcO6TwBAXYKJCDahoHmAJSP+
 tlVagIAlpW/nJbDvU+PSxXCZRaUzK17oRonOuS3Irwdj0AcT46N1vNtkiFa9PTE+r0ngDX
 mIl0ePhRmlxXwwf7VrX9UkXZLz7gQsAzas3DEmwdhrH76xINy1Il++oI3P5FNIF7h69qQn
 1RrncpcsOTwXEzacsV4n9G4LsK5IYDR/XCNKQgGRJ18rmClDwV05E5FyVtSp/A==
Message-ID: <321dec48-eebd-42c0-8241-4fad7b9b8f2b@mailbox.org>
Date: Wed, 24 Sep 2025 13:56:30 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: "Tseng, Chuan Yu (Max)" <ChuanYu.Tseng@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Derek Foreman <derek.foreman@collabora.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "seanpaul@google.com" <seanpaul@google.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <aNOtCLd9rzKuqMSb@intel.com>
 <cdb28aea-e647-4b2a-a5e3-1ec60f05a4aa@mailbox.org>
 <aNO0Snb9m5Nsf3H6@intel.com>
 <CY1PR12MB95832CDC0C7D41D10E2A3149E51CA@CY1PR12MB9583.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CY1PR12MB95832CDC0C7D41D10E2A3149E51CA@CY1PR12MB9583.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: etetnjgt349bffizass3h9wtd94h436c
X-MBO-RS-ID: f51606b033425e11d49
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

On 24.09.25 11:32, Tseng, Chuan Yu (Max) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> n Wed, Sep 24, 2025 at 10:39:16AM +0200, Michel Dänzer wrote:
>>> On 24.09.25 10:34, Ville Syrjälä wrote:
>>>> On Mon, Sep 15, 2025 at 03:37:07PM +0000, Derek Foreman wrote:
>>>>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>>>>>> On 12.09.25 15:45, Derek Foreman wrote:
>>>>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>>>>> Introduce a DRM interface for DRM clients to further restrict
>>>>>>>> the VRR Range within the panel supported VRR range on a
>>>>>>>> per-commit basis.
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
>>>>>
>>>>> Surprisingly, this would also not be precise enough for exact media
>>>>> playback, as the exact intended framerate might not result in an
>>>>> integer number of scan lines. When that happens a QMS/CinemaVRR
>>>>> capable HDMI source is expected to periodically post a frame with a
>>>>> single extra scan line to minimize the error.
>>>>
>>>> Intel VRR hardware has a "CMRR" feature where it can automagically
>>>> tweak the vtotal between frames to maintain a non integer average.
>>>
>>> Neat.
>>>
>>>
>>>> As for knobs to limit the min/max refresh rates, technically you
>>>> wouldn't need the max knob because that is ultimately defined by the
>>>> vtotal of the supplied timings. But I guess if you have a knob to
>>>> limit the min then a max knob might be convenient as well.
>>>
>>> It allows the compositor to limit the maximum refresh rate without changing the mode (which can involve visual glitches).
> 
>> I think the driver should be able to handle the two cases in exactly the same way (assuming nothing else in the mode changes). But I'm not opposed to having a max alongside the min.

Compositors want to avoid setting the DRM_MODE_ATOMIC_ALLOW_MODESET flag under normal circumstances, because it may result in visual glitches.


>> IMO the min and max could be straight integers, if specified as vtotals (that's what the hardware takes for us at least). And for the CMRR thing we'd need another property to indicate the target refresh rate somehow.
> 
>> I suppose another option would be to have non-integer min/max, and then enable CMRR if min==max==<non-integer value>. Not sure I quite like that idea though.

Do you see any issue with proposal 2 by Leo Li, specifying the limits as the total duration of a refresh cycle in nanoseconds? If the limits don't correspond to an integer number of scanlines, the driver should alternate between the nearest integer numbers of scanlines to approximate the requested duration on average.


>> Also not sure what the rules for such properties should be.
>> Should they be allowed to be specified outside the legal range and the driver just clamps them, or should that be an error?
> 
> It's possible that compositor set the value which is not acceptable to sink vrr range.
> It would be better to clamp the false value.

One downside of implicit clamping is that the resulting effective limits may not be what the compositor expects.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
