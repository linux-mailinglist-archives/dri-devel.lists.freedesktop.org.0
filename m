Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8ACB217A5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0903910E09C;
	Mon, 11 Aug 2025 21:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JUfYJedu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B27D10E09C;
 Mon, 11 Aug 2025 21:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxobq+JqXbXBe2Hzo2LNC32kz8JvK2swM4KfVisjjb0=; b=JUfYJedusir7qIqZbWs2Dh/Cg8
 59SlTendiSqgn3CeIjQTBwL/7Cw6cflFM5v7yqpzA5gqMqaarA/1jGla8jjtD9tba0r9jZ1kmaREO
 04+2unF9zw13siVrTpznFJ0rYyG2ACcZHmSJeQtNKPFy32XTplN9nD9p3i+FdzSUV9eikx+7b0Bp/
 MM4VBEzN89aNBe2G4coKZFrnuBD7zX4Yia9gk/GZJ+/sLLEydhpamchrLxOfewFF9MOKMk1PKeANW
 zEG/weXD9Yt2yBHI14QYSFP0fxfmh1UPgOoTpOgEQDu0BsDAsR6mMEGzYuD6tKoO/8/tG+FSe/V2H
 LgZwtIbg==;
Received: from [189.6.13.79] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ulaN9-00CyNd-Kx; Mon, 11 Aug 2025 23:48:03 +0200
Message-ID: <36632017-d74f-40f9-bd78-c72e2ab2c65d@igalia.com>
Date: Mon, 11 Aug 2025 18:47:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
To: Harry Wentland <harry.wentland@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
References: <20250726003816.435227-1-mwen@igalia.com>
 <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
 <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
 <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
 <4e94993a-92b3-4584-bfed-468d7606830d@amd.com>
 <c399cdf9-ec3b-4162-8175-05b34d9e5042@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <c399cdf9-ec3b-4162-8175-05b34d9e5042@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/08/2025 18:26, Harry Wentland wrote:
>
> On 2025-08-11 17:09, Limonciello, Mario wrote:
>> On 8/11/25 4:08 PM, Hung, Alex wrote:
>>> Melissa,
>>>
>>> The patchset passed promotion and CI.
>>>
>>> However, since our DC code is shared with the other OS, calling drm_*
>>> functions in DC won't work for us. For example, calling
>>> dc_edid_copy_edid_to_sink from dc/link/link_detection.c in patch 14.
>>>
>>> I don't have a good way to handle it. Does it make sense not to touch DC
>>> code for now?
>> What about if we have a set of compatibility macros in DC code?
>>
>> Something like this:
>>
>> #ifndef drm_dbg
>> #define drm_dbg ....
>> #endif
> DC should stay OS-agnostic. No DRM concepts in DC please.

Yes, and that is exactly the reason for "[PATCH v6 10/14] 
drm/amd/display: add a mid-layer file to handle EDID in DC" 
(https://lore.kernel.org/amd-gfx/20250726003816.435227-11-mwen@igalia.com/).

DC code still handles raw EDID data and drivers handling raw EDID is 
exactly what we are trying to remove from DRM. But with the current 
implementation of the AMD driver, we cannot remove it without touching 
DC code. The thing is, if we stop handle raw EDID in the DM layer, we 
cannot pass this data to DC and vice-versa.
So the proposal with patch 10 (and follow-up patches) is creating 
different dc_edid files, one for linux and another for different platforms.
>
> Why the need to change dc_edid_is_same_edid?

The linux file is done in this series by reimplementing the DC functions 
that handles raw EDID, like dc_edid_is_same_edid, with drm_edid helpers. 
The file for other platforms can be the original functions without these 
changes.
In fact, there is a step that should be done by AMD people because we 
don't handle other platforms. It should be somewhat similar to the DC 
FPU isolation code.

If it's not possible for any reasons, could you share with us some 
suggestions on how to address this issue?

Thanks in advance,

Melissa

>
> I'll comment directly on the patch.
>
> Harry
>
>>> On 8/11/25 13:40, Melissa Wen wrote:
>>>>
>>>> On 28/07/2025 20:29, Alex Hung wrote:
>>>>> Thanks. I will send v6 to promotion test.
>>>> Hi Alex,
>>>>
>>>> Any news about this round of tests?
>>>>
>>>> BR,
>>>>
>>>> Melissa
>>>>
>>>>> On 7/25/25 18:33, Melissa Wen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Siqueira and I have been working on a solution to reduce the usage of
>>>>>> drm_edid_raw in the AMD display driver, since the current guideline in
>>>>>> the DRM subsystem is to stop handling raw edid data in driver-specific
>>>>>> implementation and use opaque `drm_edid` object with common-code
>>>>>> helpers.
>>>>>>
>>>>>> To keep DC as an OS-agnostic component, we create a mid layer that
>>>>>> isolates `drm_edid` helpers called in the DC code, while allowing other
>>>>>> OSes to implement their specific implementation.
>>>>>>
>>>>>> This work is an extension of [1].
>>>>>>
>>>>>> - Patch 1 addresses a possible leak added by previous migration to
>>>>>>     drm_edid.
>>>>>> - Patch 2 allocates a temporary drm_edid from raw edid for parsing.
>>>>>> - Patches 3-7 use common-code, drm_edid helpers to parse edid
>>>>>>     capabilities instead of driver-specific solutions. For this, patch 4
>>>>>>     introduces a new helper that gets monitor name from drm_edid.
>>>>>> - Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
>>>>>>     code in the DC shared code
>>>>>> - Patch 10 creates a mid layer to make DC embraces different ways of
>>>>>>     handling EDID by platforms.
>>>>>> - Patch 11 move open-coded management of raw EDID data to the mid
>>>>>>     layer created before.
>>>>>> - Patch 12 introduces a helper that compares EDIDs from two drm_edids.
>>>>>> - Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
>>>>>>     free `drm_edid`.
>>>>>> - Patch 14 switch dc_edid to drm_edid across the driver in a way that
>>>>>>     the DC shared code is little affected by Linux specific stuff.
>>>>>>
>>>>>> [v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1-
>>>>>> mwen@igalia.com/
>>>>>> Changes:
>>>>>> - fix broken approach to get monitor name from eld (Jani)
>>>>>>     - I introduced a new helper that gets monitor name from drm_edid
>>>>>> - rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
>>>>>> - add NULL edid checks (Jani)
>>>>>> - fix mishandling of product_id.manufacturer_name (Michel)
>>>>>>     - I directly set it to manufacturer_id since sparse didn't complain.
>>>>>> - add Mario's r-b in the first fix patch and fix commit msg typo.
>>>>>>
>>>>>> [v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1-
>>>>>> mwen@igalia.com/
>>>>>> Changes:
>>>>>> - kernel-doc and commit msg fixes (Jani)
>>>>>> - use drm_edid_legacy_init instead of open coded (Jani)
>>>>>> - place drm_edid new func into the right section (Jani)
>>>>>> - paramenter names fix (Jani)
>>>>>> - add Jani's r-b to the patch 12
>>>>>> - remove unnecessary include (Jani)
>>>>>> - call dc_edid_sink_edid_free in link_detection, instead of
>>>>>> drm_edid_free
>>>>>> - rebase on top of asdn
>>>>>>
>>>>>> [v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1-
>>>>>> mwen@igalia.com/
>>>>>> Changes:
>>>>>> - rebase to asdn
>>>>>> - some kernel-doc fixes
>>>>>> - move some changes to the right commit
>>>>>>
>>>>>> [v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1-
>>>>>> mwen@igalia.com/
>>>>>> Changes:
>>>>>> - fix comments and commit messages (Mario)
>>>>>> - remove unnecessary drm_edid dup and fix mem leak (Mario)
>>>>>> - add Mario's rb to patches 5-7
>>>>>>
>>>>>> [v5] https://lore.kernel.org/amd-gfx/20250618152216.948406-1-
>>>>>> mwen@igalia.com/
>>>>>> Changes:
>>>>>> - fix NULL pointer dereference (Alex H.) with the same approach
>>>>>> proposed
>>>>>>     by 7c3be3ce3dfae
>>>>>>
>>>>>> --->
>>>>>> There are three specific points where we still use drm_edid_raw() in
>>>>>> the
>>>>>> driver:
>>>>>> 1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
>>>>>>      drm_dp_dpcd_write(), that AFAIK there is no common code solution
>>>>>> yet;
>>>>>> 2. open-coded connectivity log for dc link detection, that maybe can be
>>>>>>      moved to drm (?);
>>>>>> 3. open-coded parser that I suspect is a lot of duplicated code, but
>>>>>>      needs careful examining.
>>>>>>
>>>>>> I suggest to address those points in a next phase for regression
>>>>>> control.
>>>>>>
>>>>>> [1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1-
>>>>>> mwen@igalia.com/
>>>>>>
>>>>>> Let me know yours thoughts!
>>>>>>
>>>>>> Melissa
>>>>>>
>>>>>> Melissa Wen (12):
>>>>>>     drm/amd/display: make sure drm_edid stored in aconnector doesn't
>>>>>> leak
>>>>>>     drm/amd/display: start using drm_edid helpers to parse EDID caps
>>>>>>     drm/amd/display: use drm_edid_product_id for parsing EDID product
>>>>>> info
>>>>>>     drm/edid: introduce a helper that gets monitor name from drm_edid
>>>>>>     drm/amd/display: get panel id with drm_edid helper
>>>>>>     drm/amd/display: get SAD from drm_eld when parsing EDID caps
>>>>>>     drm/amd/display: get SADB from drm_eld when parsing EDID caps
>>>>>>     drm/amd/display: simplify dm_helpers_parse_edid_caps signature
>>>>>>     drm/amd/display: change DC functions to accept private types for
>>>>>> edid
>>>>>>     drm/edid: introduce a helper that compares edid data from two
>>>>>> drm_edid
>>>>>>     drm/amd/display: add drm_edid to dc_sink
>>>>>>     drm/amd/display: move dc_sink from dc_edid to drm_edid
>>>>>>
>>>>>> Rodrigo Siqueira (2):
>>>>>>     drm/amd/display: add a mid-layer file to handle EDID in DC
>>>>>>     drm/amd/display: create a function to fill dc_sink with edid data
>>>>>>
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
>>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 109 ++++++
>>>>>> +-----------
>>>>>>    .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  39 +++++++
>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
>>>>>>    .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
>>>>>>    drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
>>>>>>    drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
>>>>>>    drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
>>>>>>    drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
>>>>>>    .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
>>>>>>    .../drm/amd/display/dc/link/link_detection.h  |   9 +-
>>>>>>    drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
>>>>>>    drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>>>>>>    drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
>>>>>>    include/drm/drm_edid.h                        |  10 +-
>>>>>>    17 files changed, 199 insertions(+), 164 deletions(-)
>>>>>>    create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>>>>>    create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>>>>>

