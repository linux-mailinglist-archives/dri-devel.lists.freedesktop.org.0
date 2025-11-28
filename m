Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7AC91833
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411FC10E880;
	Fri, 28 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCO1Il0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3F510E04A;
 Fri, 28 Nov 2025 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764323341; x=1795859341;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ipY2BYyjF/FdjUJ0sYnsOtnwuR3Nds/Rs9/C2QJdddc=;
 b=aCO1Il0JQWeuPuQPL74ORdKb+91jWqvIb2SPKSLr7kh32QH2mBiNg43B
 5N9NbI+Wz5LtdhWO5+VN4NzpaGSZMZeghSrDITQ3BZY46879i+XkT4huL
 RSgbZ9+X+Lwx02dfCipolEsADNe1bIIL0cP1VjkG87QA6Ue/9Id6cCoTJ
 k8o4RzspH+dHk6cm22IAHf1hnhbUGn4JKvrsEExoMt/ULRjkPt7VY986v
 rGbNeJi4iAXeFzq5hhcqaVUHuFYNLgeB6ftX0YQZFCdhiQbll+Av3oQXs
 5ZUsnCx1wX9apuWLy7FXNMPK3QwY4SY+nykY8LsvMr57vtYxrITecXLy0 g==;
X-CSE-ConnectionGUID: Fq44WTX6TWuPKH0SKrwUkQ==
X-CSE-MsgGUID: u8UzAZUMSlmow1T69mlJQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70220802"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="70220802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 01:49:01 -0800
X-CSE-ConnectionGUID: NjqTxRXjTTGNLWt/0QNhhw==
X-CSE-MsgGUID: 3R2N7D0wQ4G7l80m/MnrSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193643642"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.83])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 01:48:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, airlied@gmail.com, simona.vetter@ffwll.ch
Cc: Alex Deucher <alexander.deucher@amd.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: Re: [pull] amdgpu drm-fixes-6.18
In-Reply-To: <20251126204925.3316684-1-alexander.deucher@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126204925.3316684-1-alexander.deucher@amd.com>
Date: Fri, 28 Nov 2025 11:48:55 +0200
Message-ID: <5f6bfc9e529566dc408a95a8aa748ff703254879@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 26 Nov 2025, Alex Deucher <alexander.deucher@amd.com> wrote:
> Hi Dave, Simona,
>
> Fixes for 6.18.
>
> The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb15=
0d:
>
>   Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-=
2025-11-26
>
> for you to fetch changes up to 7fa666ab07ba9e08f52f357cb8e1aad753e83ac6:
>
>   drm/amdgpu: fix cyan_skillfish2 gpu info fw handling (2025-11-26 12:34:=
16 -0500)
>
> ----------------------------------------------------------------
> amd-drm-fixes-6.18-2025-11-26:
>
> amdgpu:
> - Unified MES fix
> - HDMI fix
> - Cursor fix
> - Bightness fix
> - EDID reading improvement
> - UserQ fix
> - Cyan Skillfish IP discovery fix
>
> ----------------------------------------------------------------
> Alex Deucher (2):
>       Revert "drm/amd/display: Move setup_stream_attribute"
>       drm/amdgpu: fix cyan_skillfish2 gpu info fw handling

This broke the drm-tip build:

../drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: In function =E2=80=98amdgpu_=
device_parse_gpu_info_fw=E2=80=99:
../drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:2668:31: error: =E2=80=98stru=
ct amdgpu_mman=E2=80=99 has no member named =E2=80=98discovery_bin=E2=80=99
 2668 |                 if (adev->mman.discovery_bin)
      |                               ^

and it's going to need a fixup.

BR,
Jani.

>
> Alex Hung (1):
>       drm/amd/display: Check NULL before accessing
>
> Mario Limonciello (AMD) (2):
>       drm/amd/display: Don't change brightness for disabled connectors
>       drm/amd/display: Increase EDID read retries
>
> Michael Chen (1):
>       drm/amd/amdgpu: reserve vm invalidation engine for uni_mes
>
> Prike Liang (1):
>       drm/amdgpu: attach tlb fence to the PTs update
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c                |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c                   |  3 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                    |  2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 15 +++++++++=
++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  8 ++++----
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c           | 11 ++++++++-=
--
>  drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c |  1 -
>  drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  2 --
>  drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  2 --
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c           |  3 +++
>  .../drm/amd/display/dc/virtual/virtual_stream_encoder.c   |  7 -------
>  11 files changed, 36 insertions(+), 20 deletions(-)

--=20
Jani Nikula, Intel
