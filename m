Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90743E3CF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 16:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A136E97A;
	Thu, 28 Oct 2021 14:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5B06E0DB;
 Thu, 28 Oct 2021 14:33:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="291255540"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="291255540"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 07:33:38 -0700
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; d="scan'208";a="487156570"
Received: from ralfseng-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.156])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 07:33:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PULL] drm-intel-fixes
In-Reply-To: <YXqjnyedcljkaZE/@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <8735olh27y.fsf@intel.com> <YXqjnyedcljkaZE/@intel.com>
Date: Thu, 28 Oct 2021 17:33:30 +0300
Message-ID: <87pmrpfccl.fsf@intel.com>
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

On Thu, 28 Oct 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Oct 28, 2021 at 01:29:21PM +0300, Jani Nikula wrote:
>>=20
>> Hi Dave & Daniel -
>>=20
>> Certainly more than I'd like at this stage, but it's mostly Cc: stable
>> material, and the tracepoint change is a last minute revert to dodge a
>> potential "tracepoints are uabi" bullet before it hits the final
>> release.
>>=20
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> drm-intel-fixes-2021-10-28:
>> drm/i915 fixes for v5.15 final:
>> - Remove unconditional clflushes
>> - Fix oops on boot due to sync state on disabled DP encoders
>> - Revert backend specific data added to tracepoints
>> - Remove useless and incorrect memory frequence calculation
>>=20
>> BR,
>> Jani.
>>=20
>> The following changes since commit 519d81956ee277b4419c723adfb154603c256=
5ba:
>>=20
>>   Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)
>>=20
>> are available in the Git repository at:
>>=20
>>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-=
10-28
>>=20
>> for you to fetch changes up to 9a4aa3a2f1606a03c220b21049baa4a2b6169626:
>>=20
>>   drm/i915: Revert 'guc_id' from i915_request tracepoint (2021-10-28 11:=
45:11 +0300)
>>=20
>> ----------------------------------------------------------------
>> drm/i915 fixes for v5.15 final:
>> - Remove unconditional clflushes
>> - Fix oops on boot due to sync state on disabled DP encoders
>> - Revert backend specific data added to tracepoints
>> - Remove useless and incorrect memory frequence calculation
>>=20
>> ----------------------------------------------------------------
>> Imre Deak (1):
>>       drm/i915/dp: Skip the HW readout of DPCD on disabled encoders
>>=20
>> Joonas Lahtinen (1):
>>       drm/i915: Revert 'guc_id' from i915_request tracepoint
>>=20
>> Jos=C3=A9 Roberto de Souza (1):
>>       drm/i915: Remove memory frequency calculation
>>=20
>> Ville Syrj=C3=A4l=C3=A4 (2):
>>       drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
>>       drm/i915: Catch yet another unconditioal clflush
>
> Where did the third one go?
> commit ef7ec41f17cb ("drm/i915: Replace the unconditional clflush with dr=
m_clflush_virt_range()")

It failed to cherry-pick cleanly, and I failed to ask for a
backport. Too late now, will need to go via -next-fixes or v5.16-rc1 and
backports to stable.

BR,
Jani.


>
>>=20
>>  drivers/gpu/drm/i915/display/intel_dp.c  |  3 +++
>>  drivers/gpu/drm/i915/gt/intel_timeline.c |  4 ++--
>>  drivers/gpu/drm/i915/i915_reg.h          |  8 --------
>>  drivers/gpu/drm/i915/i915_trace.h        |  7 ++-----
>>  drivers/gpu/drm/i915/intel_dram.c        | 30 ++-----------------------=
-----
>>  5 files changed, 9 insertions(+), 43 deletions(-)
>>=20
>> --=20
>> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
