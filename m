Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6E461481
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C73C6F9A1;
	Mon, 29 Nov 2021 12:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC926F99F;
 Mon, 29 Nov 2021 12:06:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="236184025"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="236184025"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 04:06:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="511659335"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.11.182])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 04:06:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
In-Reply-To: <YaEAVV3Ka2lG/iOh@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <YaEAVV3Ka2lG/iOh@phenom.ffwll.local>
Date: Mon, 29 Nov 2021 14:06:02 +0200
Message-ID: <87k0grjhed.fsf@intel.com>
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
Cc: linux-doc@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 Michel =?utf-8?Q?D?= =?utf-8?Q?=C3=A4nzer?= <michel@daenzer.net>,
 roman.li@amd.com, amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?Q?K?= =?utf-8?Q?=C3=B6nig?= <christian.koenig@amd.com>,
 Marek =?utf-8?B?T2w=?= =?utf-8?B?xaHDoWs=?= <marek.olsak@amd.com>,
 aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <seanpaul@chromium.org>, qingqing.zhuo@amd.com,
 Roman Gilg <subdiff@gmail.com>, bhawanpreet.lakha@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
>> Display core documentation is not well organized, and it is hard to find
>> information due to the lack of sections. This commit reorganizes the
>> documentation layout, and it is preparation work for future changes.
>> 
>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> ---
>>  Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>>  .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>>  Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>>  Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>>  Documentation/gpu/drivers.rst                 |  2 +-
>>  5 files changed, 76 insertions(+), 75 deletions(-)
>>  delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>> 
>> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
>> deleted file mode 100644
>> index f7ff7e1309de..000000000000
>> --- a/Documentation/gpu/amdgpu-dc.rst
>> +++ /dev/null
>> @@ -1,74 +0,0 @@
>> -===================================
>> -drm/amd/display - Display Core (DC)
>> -===================================
>> -
>> -*placeholder - general description of supported platforms, what dc is, etc.*
>> -
>> -Because it is partially shared with other operating systems, the Display Core
>> -Driver is divided in two pieces.
>> -
>> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
>> -   hardware programming and resource management are handled here.
>> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
>> -   amdgpu base driver and DRM are implemented here.
>> -
>> -It doesn't help that the entire package is frequently referred to as DC. But
>> -with the context in mind, it should be clear.
>> -
>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
>> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
>> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
>> -
>> -To determine if DC is loaded, search dmesg for the following entry:
>> -
>> -``Display Core initialized with <version number here>``
>> -
>> -AMDgpu Display Manager
>> -======================
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: overview
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> -   :internal:
>> -
>> -Lifecycle
>> ----------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: DM Lifecycle
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :functions: dm_hw_init dm_hw_fini
>> -
>> -Interrupts
>> -----------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>> -   :doc: overview
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>> -   :internal:
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
>> -
>> -Atomic Implementation
>> ----------------------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: atomic
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>> -
>> -Display Core
>> -============
>> -
>> -**WIP**
>> -
>> -FreeSync Video
>> ---------------
>> -
>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> -   :doc: FreeSync Video
>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>> new file mode 100644
>> index 000000000000..bbb8c3fc8eee
>> --- /dev/null
>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>> @@ -0,0 +1,4 @@
>> +Display Core Debug tools
>> +========================
>> +
>> +TODO
>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>> new file mode 100644
>> index 000000000000..3685b3b1ad64
>> --- /dev/null
>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>
> While we bikeshed names, I think it'd would make sense to call this
> overview.rst or intro.rst or similar, since it's meant to contain the
> overall toctree for everything amdgpu related (maybe there will be more in
> the future).

index.rst?


-- 
Jani Nikula, Intel Open Source Graphics Center
