Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045BD07BE8
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C6A10E3A7;
	Fri,  9 Jan 2026 08:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/fOYAB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192B610E3A7;
 Fri,  9 Jan 2026 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767946525; x=1799482525;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sI8nfmNJ++4f6uuAu1bGj4lDWCADl7dDVo2Lln1UNwc=;
 b=I/fOYAB/cKTEwfx4wHfYk7TJQZ2vWRUL095uFLOqZiJcClio+9OHBxWJ
 e55FcVFtfwDV5PZgrNWnXnvP9orF4EspyfXSVShRPZGU86qbFKKD3P2nq
 2ANOZOJ45/ZgVeUjL8nDySiLawTwo1kTtw+PdzPW8qYMl4dnrPR0XOHIq
 sbGkfslYW0Bl7LIflsqf8rFeLAf6a4BIi+mJbIARPjpVlFCqbrtJJZM2T
 t4U/0sRPcY4Wu/z3v9hsGoJlNyIuONjAktFdrWpFhw9BVU7DP5AsDEFHz
 4BFhGflia0Xv8x1snEjPQAle2FJi7C+g0Ffn8MFnawBiYNS+h0TF4EScL Q==;
X-CSE-ConnectionGUID: 0dbqaNM3STqC10gqe/L/XQ==
X-CSE-MsgGUID: sj067RCqRRKbaBwYH5Q+OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69311297"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69311297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:15:24 -0800
X-CSE-ConnectionGUID: P6XKnhRfR7eQlArsvfXfKA==
X-CSE-MsgGUID: uD+4G5eCSZi8NqWvC8ytvw==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:15:18 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@0la.ch>, Yaroslav Bolyukin <iam@lach.pw>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 0/7] VESA DisplayID fixed DSC BPP value support
In-Reply-To: <5d1fc27a-eea0-4995-8b8e-46006144ae7b@0la.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251202110218.9212-1-iam@lach.pw>
 <5d1fc27a-eea0-4995-8b8e-46006144ae7b@0la.ch>
Date: Fri, 09 Jan 2026 10:15:15 +0200
Message-ID: <5b7332c6bc0c7b7f9ba0d95477a5b9f438a07ff6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 08 Jan 2026, Yaroslav Bolyukin <iam@0la.ch> wrote:
> Hi,
>
> Now that every patch in this patchset has a review, any chance this can 
> be picked up for drm-misc-next?
>
> Or should it go through amd-staging-drm-next, given that the main EDID 
> change is only handled for amdgpu driver right now?

As I said in [1] I'm hoping to get Ville's approval on the approach, as
he had earlier concerns [2].

BR,
Jani.

[1] https://lore.kernel.org/r/b0b1567707c91806e3758bf0b678c2038dffb3c2@intel.com

[2] https://lore.kernel.org/r/aPF32XpVst5mPVz7@intel.com

>
> Best regards,
> Lach
>
> On 2025-12-02 12:02, Yaroslav Bolyukin wrote:
>> VESA DisplayID spec allows the device to force its DSC bits per pixel
>> value.
>> 
>> For example, the HTC Vive Pro 2 VR headset uses this value in
>> high-resolution modes (3680x1836@90-120, 4896x2448@90-120), and when the
>> kernel doesn't respect this parameter, garbage is displayed on the HMD
>> instead.
>> 
>> Me and other users have successfully tested the old (v3) version of this
>> patch (which was applying DSC BPP value unconditionally, thus incorrect:
>> https://lkml.org/lkml/2023/2/26/116) on Vive Pro 2 and
>> Bigscreen Beyond VR headsets, and have been using it daily, it is known
>> to work and doesn't seem to break anything else since 2022.
>> 
>> Previously, I didn't have enough dedication to get it merged, I hope
>> this time I will manage to get it to v6.19 :D
>> 
>> Regarding driver support - I have looked at amdgpu and Nvidia's
>> open-gpu-kernel-modules, and both seem to have some indication for this
>> value; however, in Linux, it is unused in both.
>> 
>> First patch implements parsing of DSC BPP values and display mode VII
>> timings flag which mandates that the DSC BPP value should actually be
>> used for this display mode.
>> 
>> The second patch implements handling of this value for AMDGPU driver.
>> 
>> The only thing that I don't like in the current implementation, is how
>> the value of `dsc_passthrough_timings_support` flag is propagated from
>> the connector display modes to the mode created in `DRM_IOCTL_MODE_SETCRTC`
>> handler (which is used for VR display initialization in Monado and
>> StreamVR), it feels like this flag should be initialized by the kernel
>> itself, but as far as I can see there is no correct way to do this, as
>> the timing constraints calculation belongs to the individual drivers.
>> 
>> Another problem with how this flag is set, is that there is no hard
>> connection between modes creaded in `SETCRTC` and the modes actually
>> defined by connector, so the current implementation searches for the
>> resolution and refresh rate that match exactly declared to obtain
>> this flag value. This might not be correct, as device might not support
>> the other mode at all, but the situation won't be any worse for the
>> existing devices, as the currently they don't work at all, and there
>> is no other known devices on the market to check their assumption in
>> regard to this part of specs, and the spec does not describe how that
>> should work.
>> 
>> Both of those downsides are due to the fact my understanding of DRM
>> subsystem is not that high. If another implementation would be proposed
>> by AMDGPU maintainers - I will gladly implement it here.
>> 
>> v6->v7:
>>   * Print DSC bpp value in fixed point format instead of x16
>>   * MSO should only be enabled for eDP, not the other way round.
>> v5->v6:
>>   * amdgpu: only apply dsc bpp to modes that match exactly the declared
>>     modes with this flag set.
>> v4->v5:
>>   * The patch was split into multiple
>>   * Disabled MSO parsing for eDP displays
>>   * Disabled MSO logs if not used
>>   * Minor codestyle changes: lines moved around, naming, passing of
>>     function arguments
>> v3->v4:
>>   * This patch now parses timings support flag on type VII block, instead
>>     of applying it unconditionally. Previously I didn't understand the
>>     spec properly.
>>   * Now it also is not being applied for non-supported and/or non-VII
>>     blocks in amdgpu driver.
>> 
>> Regards,
>> 
>> Lach
>> 
>> Yaroslav Bolyukin (7):
>>    drm/edid: rename VESA block parsing functions to more generic name
>>    drm/edid: prepare for VESA vendor-specific data block extension
>>    drm/edid: MSO should only be used for non-eDP displays
>>    drm/edid: parse DSC DPP passthru support flag for mode VII timings
>>    drm/edid: for consistency, use mask everywhere for block rev parsing
>>    drm/edid: parse DRM VESA dsc bpp target
>>    drm/amd: use fixed dsc bits-per-pixel from edid
>> 
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  16 +++
>>   drivers/gpu/drm/drm_displayid_internal.h      |  11 ++
>>   drivers/gpu/drm/drm_edid.c                    | 102 +++++++++++-------
>>   include/drm/drm_connector.h                   |   6 ++
>>   include/drm/drm_modes.h                       |  10 ++
>>   5 files changed, 109 insertions(+), 36 deletions(-)
>> 

-- 
Jani Nikula, Intel
