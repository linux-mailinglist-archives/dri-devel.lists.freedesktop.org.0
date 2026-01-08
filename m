Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C85D062D4
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 21:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174ED10E20A;
	Thu,  8 Jan 2026 20:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="S1rkAN1h";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="YGGe9QVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jan 2026 20:55:51 UTC
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81D710E20A;
 Thu,  8 Jan 2026 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1767905115; bh=DcxTDrzABrV68D7SfAwFOa1
 N+1Mz3qFTuUw3abKcB/o=; b=S1rkAN1hlq+tX3yxH/Z7RWbZRe6L6DlR3hFziSnir5O2gezNlc
 vugMlqVkVoEG/V8R8dqUTXGvP/pr7/4dz8Ci4HtsXPrxw1rmFc/ZXVNxSRmwuCjQtl4/jTCd9RV
 dhQts2vCO38hLEWbmz6j8fHKwPgIeiWlZmsUIVPI9/0Fb4QpYW9wqKkxdrUj2zwGFXICpZk7sXI
 1twkJ6BGZ4BD5H+JspKyGqaD1r7k8XaLf9oDSO6998ZHCwdEX9fnK+W8mCH8aeWGFsGxl7w3QUc
 u/L6rJic7RbYnVZwkyRUCOVEgnJgDtd3FMwz1yvp48IY1wsI/0kiNLDAIxkdoNpJvzg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1767905115;
 bh=DcxTDrzABrV68D7SfAwFOa1
 N+1Mz3qFTuUw3abKcB/o=; b=YGGe9QVrMG/ZKdHEaMEYJZ9lvD6t2kRetISyVbRt8hQHw/6Gaq
 KysRC964A/ZDrjJdmSDKHTzIpT+rfVXXuUBA==;
Message-ID: <5d1fc27a-eea0-4995-8b8e-46006144ae7b@0la.ch>
Date: Thu, 8 Jan 2026 21:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] VESA DisplayID fixed DSC BPP value support
To: Yaroslav Bolyukin <iam@lach.pw>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251202110218.9212-1-iam@lach.pw>
Content-Language: en-US
From: Yaroslav Bolyukin <iam@0la.ch>
In-Reply-To: <20251202110218.9212-1-iam@lach.pw>
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

Hi,

Now that every patch in this patchset has a review, any chance this can 
be picked up for drm-misc-next?

Or should it go through amd-staging-drm-next, given that the main EDID 
change is only handled for amdgpu driver right now?

Best regards,
Lach

On 2025-12-02 12:02, Yaroslav Bolyukin wrote:
> VESA DisplayID spec allows the device to force its DSC bits per pixel
> value.
> 
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
> 
> The second patch implements handling of this value for AMDGPU driver.
> 
> The only thing that I don't like in the current implementation, is how
> the value of `dsc_passthrough_timings_support` flag is propagated from
> the connector display modes to the mode created in `DRM_IOCTL_MODE_SETCRTC`
> handler (which is used for VR display initialization in Monado and
> StreamVR), it feels like this flag should be initialized by the kernel
> itself, but as far as I can see there is no correct way to do this, as
> the timing constraints calculation belongs to the individual drivers.
> 
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
> v6->v7:
>   * Print DSC bpp value in fixed point format instead of x16
>   * MSO should only be enabled for eDP, not the other way round.
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
>   drivers/gpu/drm/drm_edid.c                    | 102 +++++++++++-------
>   include/drm/drm_connector.h                   |   6 ++
>   include/drm/drm_modes.h                       |  10 ++
>   5 files changed, 109 insertions(+), 36 deletions(-)
> 
