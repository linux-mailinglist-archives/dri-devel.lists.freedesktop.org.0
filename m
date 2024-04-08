Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9A589C01A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E87112578;
	Mon,  8 Apr 2024 13:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmujNfC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F389112572;
 Mon,  8 Apr 2024 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712581551; x=1744117551;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jcH8PxdJ+FhLTBb/pshulx0e7m17Lo5fwhH2oLv/ggk=;
 b=QmujNfC1xPsRU5Dz2mVyBqeyXFJ6/ImhPJxE2OMP5+zaMpJuoY0yTEWa
 YUpbytNgYvB0+DJf/3/vv26rPfOQqQXkROsgLDGv9RrUjqNtCYiOMOE10
 hh9+L2sZpRY7Atl7DpDlDupUbT3RIgT3ZWspNbBWFbhzHrcqt4DnKZr6P
 HmuvAO1K15n7qX6EJQT9o3ol3hnc2hNvCfcCeZRcmAWIuIIsIgO0ZngL2
 fvnf380+hH6hChFBl4x1DF5+4Yvp8XcWesAnoEJ4h4o/QRhALKUnoGNEZ
 7neQBI/OqhGb9skOZcZs9vOTeKlthb/PYRbLk3e5Jx7SLtuuyrNoNNxZ1 Q==;
X-CSE-ConnectionGUID: ytQE3jBwRw2Ns2LKpWO6Iw==
X-CSE-MsgGUID: FM1CNWG1Qy+ffqtv2B9jWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11688599"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="11688599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 06:05:51 -0700
X-CSE-ConnectionGUID: PX5zCeXlT2KxkkZ97cMdqg==
X-CSE-MsgGUID: vHoVsYMJRq+Sfi4Zoy0tRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19834272"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 06:05:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Ville
 Syrjala <ville.syrjala@linux.intel.com>, Harry Wentland
 <harry.wentland@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH 0/4] drm/edid & drm/i915: vendor and product id logging
 improvements
In-Reply-To: <2qptajfrvnotxjyymphzrqyjxcrof46rlnjto62j6wtkanzk5g@e6oek426opcj>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1711015462.git.jani.nikula@intel.com>
 <87zfucdu9v.fsf@intel.com>
 <2qptajfrvnotxjyymphzrqyjxcrof46rlnjto62j6wtkanzk5g@e6oek426opcj>
Date: Mon, 08 Apr 2024 16:05:45 +0300
Message-ID: <87o7ak9f86.fsf@intel.com>
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

On Mon, 08 Apr 2024, Melissa Wen <mwen@igalia.com> wrote:
> On 04/02, Jani Nikula wrote:
>> On Thu, 21 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Jani Nikula (4):
>> >   drm/edid: add drm_edid_get_product_id()
>> >   drm/edid: add drm_edid_print_product_id()
>> >   drm/i915/bios: switch to struct drm_edid and struct
>> >     drm_edid_product_id
>> >   drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()
>> 
>> Ping for reviews please? This should be helpful in eradicating one class
>> of drm_edid_raw() uses.
>
> Hi Jani,
>
> I took a look at the series. AFAIU your solution with
> `drm_edid_product_id` mostly fits AMD display driver needs, except that
> it needs the `product_code` split into two parts (like manufacturer
> name) because the driver handles prod_code parts to configure a register
> for audio, as in the path below:
>
> 1. https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c#L113
> 2. https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/drivers/gpu/drm/amd/display/dc/core/dc_stream.c#L90
> 3. https://gitlab.freedesktop.org/drm/kernel/-/blob/drm-next/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c#L873
>
> What do you think on keeping `prod_code` split into two part in
> `drm_edid_product_id`?

I think having it as "__le16 product_code" is better and
self-documenting. This is what the spec says it is, so why split it to
two parts where you always need to wonder about the byte order?

This is how you'd use it:

	edid_caps->product_id = le16_to_cpu(id->product_code);

BR,
Jani.

>
> (cc'ing some AMD devs that might have a better understanding of this use case)
>
> Thanks a lot for addressing this pending issue!
>
> Melissa
>
>> 
>> BR,
>> Jani.
>> 
>> 
>> >
>> >  drivers/gpu/drm/drm_edid.c                | 50 +++++++++++++++++++++++
>> >  drivers/gpu/drm/i915/display/intel_bios.c | 49 ++++++++++------------
>> >  include/drm/drm_edid.h                    | 28 ++++++++++---
>> >  3 files changed, 94 insertions(+), 33 deletions(-)
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
