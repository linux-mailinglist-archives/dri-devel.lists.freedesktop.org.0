Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDRQNlSinmlPWgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:18:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C4193309
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B8510E6BD;
	Wed, 25 Feb 2026 07:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7AiMrLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348C210E6BD;
 Wed, 25 Feb 2026 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772003922; x=1803539922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=arrqZCYvlgIP/D4B7meKcZNVxVO+BnZ5mpUTi+D9W5M=;
 b=h7AiMrLgDKYmWBtb7RYgcjW79QXV/Iwi0+hg8dGTB9CvB/92OTPEEwtH
 ltgQf0w6+Grz7+DVRfYLV2U45Inqp0u5vi8Ow7CN+hHER2hI5IuBcv5jQ
 o6szs/yFo3cxcXkrInIdvg0MtuRQNxnNXcj9iJXbsfbxzoCbhBVcIQpYQ
 xpFGs6QAPGOH1LGr4qgcjvVtPDhb2OJ5UwBvmA9nIbztbFxZqVsg6mG2z
 JTBFmhj+bpAAaE/+fuQ3r+YqX5xP+PZOKzeCGDaLL50V9YY2LwxRNmBXw
 Di1E0BZ83QdzMAhhTmthtxDPuIQ8GV5UVeVo+07gke6UnysoM/dwNLPRL Q==;
X-CSE-ConnectionGUID: J2Y/TuWrTM6QmkDjAJdmrw==
X-CSE-MsgGUID: GrbOZgFiQC6cy6rjzfKTYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72938196"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72938196"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:18:41 -0800
X-CSE-ConnectionGUID: NPQLPfJKTCOYVSj8UTlJFg==
X-CSE-MsgGUID: swaiZ223QNSNRJwYEvljsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220745726"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:18:36 -0800
Date: Wed, 25 Feb 2026 09:18:33 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, mario.limonciello@amd.com,
 alexander.deucher@amd.com, alex.hung@amd.com,
 Ivan Sergeev <ivan8215145640@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Jani Nikula <jani.nikula@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <superm1@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] drm/drm_edid: ignore continuous frequency support
 for VRR
Message-ID: <aZ6iSdsTfzQX4_op@intel.com>
References: <20260223203528.213275-1-mwen@igalia.com>
 <aZ1YE6dcEfTMwly1@intel.com>
 <b6f267f4-812f-441b-939d-1ff24fd3406e@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6f267f4-812f-441b-939d-1ff24fd3406e@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.90 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,cgit.freedesktop.org:server fail,amd.com:server fail,igalia.com:server fail,intel.com:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,amd.com,mailbox.org,lists.freedesktop.org,intel.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,igalia.com:email,amd.com:email,cgit.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2C6C4193309
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:49:17AM -0300, Melissa Wen wrote:
> 
> 
> On 24/02/2026 04:49, Ville Syrjälä wrote:
> > On Mon, Feb 23, 2026 at 05:29:46PM -0300, Melissa Wen wrote:
> >> Display can be VRR capable even if its EDID doesn't contain the
> >> Continuous Frequency flag. On the other hand, continuous frequency
> >> support is expected for smooth VRR and ensures better compatibility with
> >> VRR tehcnologies. As the lack of this flag can result in unexpected
> >> issues like tearing, get monitor range even without the guarantee of
> >> continuous frequency but add a debug message for unexpected results.
> >>
> >> CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> CC: Jani Nikula <jani.nikula@intel.com>
> >> CC: Harry Wentland <harry.wentland@amd.com>
> >> CC: Mario Limonciello <superm1@kernel.org>
> >> CC: Alex Hung <alex.hung@amd.com>
> >> Reported-by: Ivan Sergeev <ivan8215145640@gmail.com>
> >> Fixes: 0159f88a ("drm/amd/display: remove redundant freesync parser for DP")
> >> Signed-off-by: Melissa Wen <mwen@igalia.com>
> >> ---
> >>
> >> Hello,
> >>
> >> After replacing the AMD driver-specific parser for VRR with the drm_edid
> >> implementation, monitors without the continuous frequency flag in their
> >> EDID stopped obtaining the monitor range because the DRM common code
> >> considers them incompatible with VRR if they don't advertise support to
> >> continuous frequencies. This differs from the original driver-specific
> >> parser of AMD, that only checked EDID version, EDID_DETAIL_MONITOR_RANGE
> >> and DRM_EDID_RANGE_LIMITS_ONLY_FLAG to determine the VRR range, so
> >> switching to DRM common code caused a regression (reported by Ivan).
> >>
> >> The commit ca2582c66b930 `drm/edid: Parse only the VRR range for
> >> continuous frequency displays` [1] introduced the Continuous Frequency
> >> flag condition. While it was created to avoid issues related to
> >> non-continuous refresh rates, it looks very restrictive to drivers that
> >> want to deal with VRR capable monitor even without the guarantee of
> >> continuous frequencies. I propose relaxing this restriction and adding a
> >> debug message if anyone experiences problems related to the lack of
> >> continuous frequency support.
> > AFAIK without the continuous frequency bit the monitor isn't guaranteed
> > to support all the refresh rates between min/max. So is this monitor
> > trying to tell us that you are allowed to change the vtotal dynamically
> > between the various explicit timings declared in the EDID but not between
> > any other other timings?
> >
> > Or is it just a buggy EDID that needs quirking?
> 
> Looks like a buggy EDID. From decoded EDID I understand it supports all
> refresh rates between 48Hz/75Hz (very small range anyway), without the
> continuous freq flag in Features:
> 
> ```
>    EDID Structure Version & Revision: 1.4
>    Vendor & Product Identification:
>      Manufacturer: SKG
>      Model: 10003
>      Made in: week 25 of 2023
>    Basic Display Parameters & Features:
>      Digital display
>      Bits per primary color channel: 10
>      DisplayPort interface
>      Maximum image size: 60 cm x 33 cm
>      Gamma: 2.20
>      DPMS levels: Off
>      Supported color formats: RGB 4:4:4, YCrCb 4:4:4, YCrCb 4:2:2
>      First detailed timing includes the native pixel format and 
> preferred refresh rate
>    Color Characteristics:
> 
> [...]
> 
> Detailed Timing Descriptors:
> [...]
>     Display Range Limits: Monitor ranges (Bare Limits): 48-75 Hz V, 
> 223-223 kHz H, max dotclock 400 MHz
> [...]
> 
> Vendor-Specific Data Block (AMD), OUI 00-00-1A:
> Version: 2.1
> Minimum Refresh Rate: 48 Hz
> Maximum Refresh Rate: 75 Hz
> [...]
> ```
> 
> The reporter shared the EDID here:
> - 
> https://lore.kernel.org/amd-gfx/CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com/

I see no mention of the model of the display. What is it, and is it
really supposed to support VRR?

> 
> Melissa
> 
> >
> >> Maybe I'm missing something, so I would like to hear your opinions.
> >>
> >> Obs.: In addition to the display kernel developers who have already
> >> worked with this code, I am sending copies to some compositor developers
> >> who may have an opinion on it.
> >>
> >> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca2582c66b930
> >>
> >> Thanks in advance,
> >>
> >> Melissa
> >>
> >>
> >>   drivers/gpu/drm/drm_edid.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >> index ff432ac6b569..8ebd1c17d78a 100644
> >> --- a/drivers/gpu/drm/drm_edid.c
> >> +++ b/drivers/gpu/drm/drm_edid.c
> >> @@ -6517,7 +6517,9 @@ static void drm_get_monitor_range(struct drm_connector *connector,
> >>   		return;
> >>   
> >>   	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
> >> -		return;
> >> +		drm_dbg_kms(connector->dev,
> >> +			    "[CONNECTOR:%d:%s] Display doesn't support continuous frequencies\n",
> >> +			    connector->base.id, connector->name);
> >>   
> >>   	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
> >>   
> >> -- 
> >> 2.51.0

-- 
Ville Syrjälä
Intel
