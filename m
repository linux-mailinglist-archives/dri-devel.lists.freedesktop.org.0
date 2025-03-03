Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE8A4BA94
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE03410E395;
	Mon,  3 Mar 2025 09:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EULqofrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493A210E39D;
 Mon,  3 Mar 2025 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740993390; x=1772529390;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4+042+rhGa2yuktUdtBEndagBcYyRXpGqaeo1npgMX8=;
 b=EULqofrrwc4NDYeIe/shoPX60SMeDZbN5DXR1OenDTwdMMb2lzEOvxEG
 01gSwCBdR/cK90lRVsRpT23tVTolwNr5lt/LqkUQ+Ons1pjPbyLY9N0Kk
 sjJsmUlXqR4k9sluph8oDYI/V5mWSYRh9l06Q1b30o3/Gbi0D0yDVnUxY
 vB9ijnuhjV2hk+Xg4ufykcLP2k9+Q3VcDmd/+rb5IICCpAWMnnhiAvSsv
 5T4USJYgeX1Hr9VFjazaSq4CKPdZ3Kw8y9Vf7udaGmVli5lcauCptNlyq
 VxDdFGaiRWAWR2ljargKqIXybInG9WW4OUAQD3Se6wm9ZjWjR2ovXETXK A==;
X-CSE-ConnectionGUID: 36n9pu3mSRqMYEPYM3vlKg==
X-CSE-MsgGUID: L5/DVLAeQ8qL/c7ccvFFkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59403763"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="59403763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:16:29 -0800
X-CSE-ConnectionGUID: DwO7eutyRfaszL0jdiRr+Q==
X-CSE-MsgGUID: XEqqdLrUT9ikakQVb6Yfuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="122903177"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.122])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:16:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v10 2/9] drm/damage-helper: add const qualifier in
 drm_atomic_helper_damage_merged()
In-Reply-To: <06cd451eaf2c8a2d3567d272b3ca75228ccc9988.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
 <20250228093802.27091-3-vinod.govindapillai@intel.com>
 <06cd451eaf2c8a2d3567d272b3ca75228ccc9988.camel@intel.com>
Date: Mon, 03 Mar 2025 11:16:23 +0200
Message-ID: <87tt8a1nko.fsf@intel.com>
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

On Sun, 02 Mar 2025, "Govindapillai, Vinod" <vinod.govindapillai@intel.com>=
 wrote:
> Hello drm maintainers,
>
> Could you please Ack this patch to get this merged through drm-intel-next=
..

From IRC last week,

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>


>
> Thanks
> Vinod
>
> On Fri, 2025-02-28 at 11:37 +0200, Vinod Govindapillai wrote:
>> Add a const qualifier for the "state" parameter as well as we could
>> use this helper to get the combined damage in cases of const
>> drm_plane_state as well. Needed mainly for xe driver big joiner cases
>> where we need to track the damage from immutable plane state.
>>
>> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> ---
>>  drivers/gpu/drm/drm_damage_helper.c | 2 +-
>>  include/drm/drm_damage_helper.h     | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_d=
amage_helper.c
>> index afb02aae707b..44a5a36806e3 100644
>> --- a/drivers/gpu/drm/drm_damage_helper.c
>> +++ b/drivers/gpu/drm/drm_damage_helper.c
>> @@ -308,7 +308,7 @@ EXPORT_SYMBOL(drm_atomic_helper_damage_iter_next);
>>   * True if there is valid plane damage otherwise false.
>>   */
>>  bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_=
state,
>> -      struct drm_plane_state *state,
>> +      const struct drm_plane_state *state,
>>        struct drm_rect *rect)
>>  {
>>   struct drm_atomic_helper_damage_iter iter;
>> diff --git a/include/drm/drm_damage_helper.h b/include/drm/drm_damage_he=
lper.h
>> index effda42cce31..a58cbcd11276 100644
>> --- a/include/drm/drm_damage_helper.h
>> +++ b/include/drm/drm_damage_helper.h
>> @@ -78,7 +78,7 @@ bool
>>  drm_atomic_helper_damage_iter_next(struct drm_atomic_helper_damage_iter=
 *iter,
>>      struct drm_rect *rect);
>>  bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_=
state,
>> -      struct drm_plane_state *state,
>> +      const struct drm_plane_state *state,
>>        struct drm_rect *rect);
>>
>>  #endif
>

--=20
Jani Nikula, Intel
