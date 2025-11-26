Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4DC8866A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 08:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E74D10E110;
	Wed, 26 Nov 2025 07:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="icbgvA5f";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="oAVQCppr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 439 seconds by postgrey-1.36 at gabe;
 Wed, 26 Nov 2025 07:21:03 UTC
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682DC10E110;
 Wed, 26 Nov 2025 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1764141195; bh=wXhsAr3ieb0W3Cah8oO1/Xj
 +ChvfB7Qelr4XyRutCGk=; b=icbgvA5f0BCAl7HzKG8Ae0wafUOR54RJj6/KwVkQT6mfx6qVUB
 aU0gjyTVG1q0VCeuzcJkp8S2oCqgvrDGeJR6uo55uTy5OEghzmCO/UfUx0JLwCW9eDR90t/CYDD
 nX7BZ5dg8tDBpDh4WzKttNhP5anl4nMqfTKoX4UWzYk+iJI0ciELPSjfJxhZm7kmptzn6LLT6/5
 O6900wuKkcE4a0oHUaSHYNSKhpzPVvGte4/sVyBCxrahwB7GfnIa5+5NIsUxCwx9p3oqwAmBmI9
 cyDkfN1iSbIA8xooqPy8g3QDxeFpUIujCGe9lF2u5V20V6BmJZvTvvpePaOs8WgRj3Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1764141195;
 bh=wXhsAr3ieb0W3Cah8oO1/Xj
 +ChvfB7Qelr4XyRutCGk=; b=oAVQCpprY+bahJ2+Atop5sdYeq7zLHzYEPTyWXIz5SnAdKs5OE
 i9/a6reRg40KwJ5IUKJTrPf4rdhN9tA/94DA==;
Message-ID: <2fe15b45-879a-4a63-a278-69b0e7faf311@0la.ch>
Date: Wed, 26 Nov 2025 08:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] VESA DisplayID spec allows the device to force its
 DSC bits per pixel value.
To: Yaroslav Bolyukin <iam@lach.pw>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251126065126.54016-1-iam@lach.pw>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <20251126065126.54016-1-iam@lach.pw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Sorry, I have updated/included the wrong cover message

On 2025-11-26 07:51, Yaroslav Bolyukin wrote:
 > For example, the HTC Vive Pro 2 VR headset uses this value in
 > high-resolution modes (3680x1836@90-120, 4896x2448@90-120), and when the
 > kernel doesn't respect this parameter, garbage is displayed on the HMD
 > instead.
 >
 > Me and other users have successfully tested the old (v3) version of this
 > patch (which was applying DSC BPP value unconditionally, thus incorrect:
 > https://lkml.org/lkml/2023/2/26/116) on Vive Pro 2 and
 > Bigscreen Beyond VR headsets, and have been using it daily, it is known
 > to work and doesn't seem to break anything else since 2022.
 >
 > Previously, I didn't have enough dedication to get it merged, I hope
 > this time I will manage to get it to v6.19 :D
 >
 > Regarding driver support - I have looked at amdgpu and Nvidia's
 > open-gpu-kernel-modules, and both seem to have some indication for this
 > value; however, in Linux, it is unused in both.
 >
 > First patch implements parsing of DSC BPP values and display mode VII
 > timings flag which mandates that the DSC BPP value should actually be
 > used for this display mode.

This patch was split into 1-6

 > The second patch implements handling of this value for AMDGPU driver.

This is the 7th patch

 > The only thing that I don't like in the current implementation, is how
 > the value of `dsc_passthrough_timings_support` flag is propagated from
 > the connector display modes to the mode created in 
`DRM_IOCTL_MODE_SETCRTC`
 > handler (which is used for VR display initialization in Monado and
 > StreamVR), it feels like this flag should be initialized by the kernel
 > itself, but as far as I can see there is no correct way to do this, as
 > the timing constraints calculation belongs to the individual drivers.

This is somewhat improved, now there is a matching for correct mode in
amdgpu driver. I don't like that individual drivers need to repeat this
logic by themselves either, but I don't see a better solution with the
given spec and given how it is implemented in devices. It works more
like a quirk, and the implementation follows. It might be improved if
the future changes in DisplayID spec declare something else DSC related
and the logic would be extended appropriately.

Still, the latest implementation should be easy and descriptive enough
to be easily implementable by the drivers, and given that this part of
spec is only used by ~3 devices on the market right now with both being
VR related, I think this is acceptable.

I have a patch somewhat ready for i915, which I decided to not include
in the current patchset, and I don't think there is more drm drivers
that need this implementation right now (Doesn't seem like anyone runs
VR on nouveau).

Since the first version of the patchset was published, nivida open
drivers have implemented this part by themselves, using their own edid
parser.

 > Another problem with how this flag is set, is that there is no hard
 > connection between modes creaded in `SETCRTC` and the modes actually
 > defined by connector, so the current implementation searches for the
 > resolution and refresh rate that match exactly declared to obtain
 > this flag value. This might not be correct, as device might not support
 > the other mode at all, but the situation won't be any worse for the
 > existing devices, as the currently they don't work at all, and there
 > is no other known devices on the market to check their assumption in
 > regard to this part of specs, and the spec does not describe how that
 > should work.
 >
 > Both of those downsides are due to the fact my understanding of DRM
 > subsystem is not that high. If another implementation would be proposed
 > by AMDGPU maintainers - I will gladly implement it here.
 >
 > v5->v6:
 >   * amdgpu: only apply dsc bpp to modes that match exactly the declared
 >     modes with this flag set.
 > v4->v5:
 >   * The patch was split into multiple
 >   * Disabled MSO parsing for eDP displays
 >   * Disabled MSO logs if not used
 >   * Minor codestyle changes: lines moved around, naming, passing of
 >     function arguments
 > v3->v4:
 >   * This patch now parses timings support flag on type VII block, instead
 >     of applying it unconditionally. Previously I didn't understand the
 >     spec properly.
 >   * Now it also is not being applied for non-supported and/or non-VII
 >     blocks in amdgpu driver.
 >
 > Regards,
 >
 > Lach
 >
 > Yaroslav Bolyukin (7):
 >    drm/edid: rename VESA block parsing functions to more generic name
 >    drm/edid: prepare for VESA vendor-specific data block extension
 >    drm/edid: MSO should only be used for non-eDP displays
 >    drm/edid: parse DSC DPP passthru support flag for mode VII timings
 >    drm/edid: for consistency, use mask everywhere for block rev parsing
 >    drm/edid: parse DRM VESA dsc bpp target
 >    drm/amd: use fixed dsc bits-per-pixel from edid
 >
 >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  16 +++
 >   drivers/gpu/drm/drm_displayid_internal.h      |  11 ++
 >   drivers/gpu/drm/drm_edid.c                    | 101 +++++++++++-------
 >   include/drm/drm_connector.h                   |   6 ++
 >   include/drm/drm_modes.h                       |  10 ++
 >   5 files changed, 107 insertions(+), 37 deletions(-)
 >
