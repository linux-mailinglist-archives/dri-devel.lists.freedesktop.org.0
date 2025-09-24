Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F33B98EEC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F1F10E6BA;
	Wed, 24 Sep 2025 08:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="O37lJDpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864B610E6B7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:39:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWqyd0c6Rz9tDB;
 Wed, 24 Sep 2025 10:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758703161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rbb2i/KbULU2TlWTwGDRT4q3LRL/rbyHE9r4dqzT/HI=;
 b=O37lJDpvcoLmkWQoqbX3Jqo8sSlqbx1Re/9Gx/nKviJ1rnjpxfSBQYYK8LNwoibx4JOkpq
 8rehpVN6TkNUf48JXcgzB6ig5I8GCuuB6hm6q0aZsgZeDoZnDI9qNREY3EakFpp5JpQz3r
 tqfCgRLdY9Al9w2/CuCtJyHbeH2zs6ifcqrjEYz5RdQEvDCHtfSg2godeMpbNzzEtfqrwT
 E1WaQkJ2KaVfBWTQEnPzjBhlHqm9kxPpcsEiZym+4L1PSNy7aD4HYuJZRpNqlX/QFiAqhV
 tATtkf8WX7yA06oajlDSeA7IJ2V4iB/H0db3ETlmlE1IunP5xWqbxy5GRb+ULw==
Message-ID: <cdb28aea-e647-4b2a-a5e3-1ec60f05a4aa@mailbox.org>
Date: Wed, 24 Sep 2025 10:39:16 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Derek Foreman <derek.foreman@collabora.com>
Cc: Chuanyu Tseng <Chuanyu.Tseng@amd.com>, harry.wentland@amd.com,
 Mario.Limonciello@amd.com, xaver.hugl@gmail.com, victoria@system76.com,
 seanpaul@google.com, Sunpeng.Li@amd.com, dri-devel@lists.freedesktop.org
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <aNOtCLd9rzKuqMSb@intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <aNOtCLd9rzKuqMSb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 797d02452962958e042
X-MBO-RS-META: 9w81ohfz3g9jmujtysag76hgme891q3n
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

On 24.09.25 10:34, Ville Syrjälä wrote:
> On Mon, Sep 15, 2025 at 03:37:07PM +0000, Derek Foreman wrote:
>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
>>> On 12.09.25 15:45, Derek Foreman wrote:
>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>>>>> Introduce a DRM interface for DRM clients to further restrict the
>>>>> VRR Range within the panel supported VRR range on a per-commit
>>>>> basis.
>>>>>
>>>>> The goal is to give DRM client the ability to do frame-doubling/
>>>>> ramping themselves, or to set lower static refresh rates for power
>>>>> savings.
>>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
>>>>
>>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
>>>>
>>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
>>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
>>
>> Surprisingly, this would also not be precise enough for exact media 
>> playback, as the exact intended framerate might not result in an integer 
>> number of scan lines. When that happens a QMS/CinemaVRR capable HDMI 
>> source is expected to periodically post a frame with a single extra scan 
>> line to minimize the error.
> 
> Intel VRR hardware has a "CMRR" feature where it can automagically
> tweak the vtotal between frames to maintain a non integer average.

Neat.


> As for knobs to limit the min/max refresh rates, technically you
> wouldn't need the max knob because that is ultimately defined by
> the vtotal of the supplied timings. But I guess if you have a
> knob to limit the min then a max knob might be convenient as well.

It allows the compositor to limit the maximum refresh rate without changing the mode (which can involve visual glitches).


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
