Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG7sFCJYnWk2OgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:49:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E92183439
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C037610E4D3;
	Tue, 24 Feb 2026 07:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iN37a5Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781910E1FE;
 Tue, 24 Feb 2026 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771919388; x=1803455388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=H//VFUvJXYkt57OGOyB7vvfZ27CPXVaud1KoKHUeXyc=;
 b=iN37a5SfTSkhsucFBX6wwk2m/RaRGKFUTuoq12mFYJktvIrnxYM0Euws
 rTJRUq0QOh3JJVbCCP8Xm2zAE/APfquV8ldjDYoa3rxdpqjzdlo1lD7p7
 r7d5idaOi5KAI1N+JLgfquxM997w7fBjD0fpwiPAL7gDvM0JQLWmPrkA3
 yFbXgNqi6Fr/JG1H6On0nSGL7q9wHHVDRX4it8NRJbcHhkLkmLTQnuuvi
 Xd8bCG6q5kJPhRStSkNCyEsMZZTPplCU6149l+Oxvef4nd7uat7JgYWLs
 qajCEbhehtr1ApZUnbPsPS8KhL2DEvr4VVLgE5KO2BIsU1bG4BReRXZrg A==;
X-CSE-ConnectionGUID: al3nTfY4SG2xIXvWRIT11A==
X-CSE-MsgGUID: mLuxyAviR1ut+0+pyA3SCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76757527"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76757527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:49:48 -0800
X-CSE-ConnectionGUID: v9K1rx8ATkqyEi8D9HHGXQ==
X-CSE-MsgGUID: PwYBLt45QXSLEciT15nmag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253551879"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:49:42 -0800
Date: Tue, 24 Feb 2026 09:49:39 +0200
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
Message-ID: <aZ1YE6dcEfTMwly1@intel.com>
References: <20260223203528.213275-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223203528.213275-1-mwen@igalia.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,amd.com,mailbox.org,lists.freedesktop.org,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,intel.com:mid,intel.com:dkim,intel.com:email,amd.com:email]
X-Rspamd-Queue-Id: F0E92183439
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 05:29:46PM -0300, Melissa Wen wrote:
> Display can be VRR capable even if its EDID doesn't contain the
> Continuous Frequency flag. On the other hand, continuous frequency
> support is expected for smooth VRR and ensures better compatibility with
> VRR tehcnologies. As the lack of this flag can result in unexpected
> issues like tearing, get monitor range even without the guarantee of
> continuous frequency but add a debug message for unexpected results.
> 
> CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
> CC: Jani Nikula <jani.nikula@intel.com>
> CC: Harry Wentland <harry.wentland@amd.com>
> CC: Mario Limonciello <superm1@kernel.org>
> CC: Alex Hung <alex.hung@amd.com>
> Reported-by: Ivan Sergeev <ivan8215145640@gmail.com>
> Fixes: 0159f88a ("drm/amd/display: remove redundant freesync parser for DP")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> Hello,
> 
> After replacing the AMD driver-specific parser for VRR with the drm_edid
> implementation, monitors without the continuous frequency flag in their
> EDID stopped obtaining the monitor range because the DRM common code
> considers them incompatible with VRR if they don't advertise support to
> continuous frequencies. This differs from the original driver-specific
> parser of AMD, that only checked EDID version, EDID_DETAIL_MONITOR_RANGE
> and DRM_EDID_RANGE_LIMITS_ONLY_FLAG to determine the VRR range, so
> switching to DRM common code caused a regression (reported by Ivan).
> 
> The commit ca2582c66b930 `drm/edid: Parse only the VRR range for
> continuous frequency displays` [1] introduced the Continuous Frequency
> flag condition. While it was created to avoid issues related to
> non-continuous refresh rates, it looks very restrictive to drivers that
> want to deal with VRR capable monitor even without the guarantee of
> continuous frequencies. I propose relaxing this restriction and adding a
> debug message if anyone experiences problems related to the lack of
> continuous frequency support.

AFAIK without the continuous frequency bit the monitor isn't guaranteed
to support all the refresh rates between min/max. So is this monitor
trying to tell us that you are allowed to change the vtotal dynamically
between the various explicit timings declared in the EDID but not between
any other other timings?

Or is it just a buggy EDID that needs quirking?

> 
> Maybe I'm missing something, so I would like to hear your opinions.
> 
> Obs.: In addition to the display kernel developers who have already
> worked with this code, I am sending copies to some compositor developers
> who may have an opinion on it.
> 
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ca2582c66b930
> 
> Thanks in advance,
> 
> Melissa
> 
> 
>  drivers/gpu/drm/drm_edid.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ff432ac6b569..8ebd1c17d78a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6517,7 +6517,9 @@ static void drm_get_monitor_range(struct drm_connector *connector,
>  		return;
>  
>  	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
> -		return;
> +		drm_dbg_kms(connector->dev,
> +			    "[CONNECTOR:%d:%s] Display doesn't support continuous frequencies\n",
> +			    connector->base.id, connector->name);
>  
>  	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
>  
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
