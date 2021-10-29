Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698E43FAAF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 12:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97D46EA4F;
	Fri, 29 Oct 2021 10:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29526EA48;
 Fri, 29 Oct 2021 10:23:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217551210"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="217551210"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 03:23:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="498856616"
Received: from kostasp-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.46])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 03:23:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] topic/amdgpu-dp2.0-mst
In-Reply-To: <bf8e724cc0c8803d58a8d730fd6883c991376a76.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <bf8e724cc0c8803d58a8d730fd6883c991376a76.camel@redhat.com>
Date: Fri, 29 Oct 2021 13:23:43 +0300
Message-ID: <87sfwkdt8w.fsf@intel.com>
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

On Wed, 27 Oct 2021, Lyude Paul <lyude@redhat.com> wrote:
> topic/amdgpu-dp2.0-mst-2021-10-27:
> UAPI Changes:
> Nope!
>
> Cross-subsystem Changes:
> drm_dp_update_payload_part1() takes a new argument for specifying what the
> VCPI slot start is
>
> Core Changes:
> Make the DP MST helpers aware of the current starting VCPI slot/VCPI total
> slot count...
>
> Driver Changes:
> ...and then add support for taking advantage of this for 128b/132b links =
on DP
> 2.0 for amdgpu
> The following changes since commit 6f2f7c83303d2227f47551423e507d77d9ea01=
c7:
>
> =C2=A0 Merge tag 'drm-intel-gt-next-2021-10-21' of
> git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-10-22 06:=
30:34
> +1000)
>
> are available in the Git repository at:
>
> =C2=A0 git://anongit.freedesktop.org/drm/drm-misc tags/topic/amdgpu-dp2.0=
-mst-2021-
> 10-27

I'm curious, how did you generate and send this pull request? The lines
are wrapped with newlines, and you have non-breaking spaces instead of
regular spaces there.

So for me this fails with:

Pulling =C2=A0 git://anongit.freedesktop.org/drm/drm-misc tags/topic/amdgpu=
-dp2.0-mst-2021- 10-27 ...
fatal: invalid refspec 'git://anongit.freedesktop.org/drm/drm-misc'

BR,
Jani.


>
> for you to fetch changes up to 00f965e700ef5aa2d889e7e65c7458531d2a4bcf:
>
> =C2=A0 drm/amdgpu/display: fix build when CONFIG_DRM_AMD_DC_DCN is not se=
t (2021-
> 10-27 19:50:26 -0400)
>
> ----------------------------------------------------------------
> UAPI Changes:
> Nope!
>
> Cross-subsystem Changes:
> drm_dp_update_payload_part1() takes a new argument for specifying what the
> VCPI slot start is
>
> Core Changes:
> Make the DP MST helpers aware of the current starting VCPI slot/VCPI total
> slot count...
>
> Driver Changes:
> ...and then add support for taking advantage of this for 128b/132b links =
on DP
> 2.0 for amdgpu
>
> ----------------------------------------------------------------
> Alex Deucher (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/amdgpu/display: fix build when CONFIG_=
DRM_AMD_DC_DCN is not set
>
> Bhawanpreet Lakha (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: Remove slot checks in dp mst topology=
 during commit
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm: Update MST First Link Slot Informatio=
n Based on Encoding Format
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/amd/display: Add DP 2.0 MST DM Support
>
> Fangzhi Zuo (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/amd/display: Add DP 2.0 MST DC Support
>
> =C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=C2=A0 |=C2=A0 29 =
++
> =C2=A0.../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0.../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c=C2=A0 |=C2=A0=C2=
=A0 7 +-
> =C2=A0drivers/gpu/drm/amd/display/dc/core/dc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +
> =C2=A0drivers/gpu/drm/amd/display/dc/core/dc_link.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 292
> +++++++++++++++++++++
> =C2=A0drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c=C2=A0=C2=A0 |=C2=
=A0 19 ++
> =C2=A0drivers/gpu/drm/amd/display/dc/dc_link.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
> =C2=A0drivers/gpu/drm/amd/display/dc/dc_stream.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 +
> =C2=A0drivers/gpu/drm/drm_dp_mst_topology.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 42 ++-
> =C2=A0drivers/gpu/drm/i915/display/intel_dp_mst.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/radeon/radeon_dp_mst.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0include/drm/drm_dp_mst_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 5 +-
> =C2=A013 files changed, 425 insertions(+), 16 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
