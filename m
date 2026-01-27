Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOmJKWHSeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:57:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF496220
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39DF10E58B;
	Tue, 27 Jan 2026 14:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1ArsMBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2647510E58B;
 Tue, 27 Jan 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769525853; x=1801061853;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GF3hAJ+nQjE0sguR8uHzep8IWqz/2IX5fpA+BkSPp4w=;
 b=j1ArsMBJTGScU8+yEClg/DTFW5jHjo/Gs2sOO7SWDQCQXTqcQb/FmcuE
 4BtPygO/k5Dz6p1l4KYZg1Mh2g1vMau13t3Hb4ZZt/6r3lsVThALJhnSW
 jq1WoivChW710AnBokqBGEM0aiws2Jfe8vivIK7BeM9PdlTy6QmTM/nUH
 h9lbbEPCUB9/cI7Rz8ie3s8tzwcNsWXH27YTCYRFAMogG0mEamAs2RrVs
 M9GFy1Yr14YcuHSPO5RCI01/ceW//+BG3GKsp+vXfupXgezMMOIcyQOPq
 5vha4zUPCeYeMf0UpMAFtCuoYV3nznxfE5N5JN7wx+dHMRDHWx6EoLSCg Q==;
X-CSE-ConnectionGUID: pjb3SwiiQUS7CDhhRkNqjQ==
X-CSE-MsgGUID: EkEh9gc2Sce6P/bqJEPoHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70763159"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70763159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:57:33 -0800
X-CSE-ConnectionGUID: CWJZdYcwSGiBiYbsJazt4w==
X-CSE-MsgGUID: WHorqjZERjayIlJYB6grxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208242096"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:57:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/2] drm/i915/display: Disable display for iMac's
In-Reply-To: <20260126204915.1324-1-atharvatiwarilinuxdev@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <c3fc271e9cd1eec5ab96c70c9dc3c971d5ed73d6@intel.com>
 <20260126204915.1324-1-atharvatiwarilinuxdev@gmail.com>
Date: Tue, 27 Jan 2026 16:57:25 +0200
Message-ID: <bc778f93d4e2a18848bc93a51aed9b627bcbb2cf@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,linux.intel.com,vger.kernel.org,intel.com,ffwll.ch,ursulin.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 16CF496220
X-Rspamd-Action: no action

On Mon, 26 Jan 2026, Atharva Tiwari <atharvatiwarilinuxdev@gmail.com> wrote:
>> Rendering and display are quite separate in the hardware and in the
>> driver. Perhaps you do not mean "rendering" here? Perhaps it can be used
>> for rendering but not display?
>
> Yeah, it can be used for rendering but not display, sorry for the wording.
>
>> Okay, so perhaps there's no eDP connected. But what about the other
>> connectors on the iGPU? What about everything else in the display
>> hardware?
>
> You cant use the iGPU to drive the display on any hardware (including external displays).
>
>> If you can figure out that it's specifically link training that fails (a
>> dmesg would be useful to show this) there clearly is display hardware,
>> right?
>
> As said the iGPU cant drive the display on all monitors (even on macOS), but still heres the dmesg before this patch:
>
> [    5.095489] i915 0000:00:02.0: [drm] Found cometlake (device ID 9bc8) integrated display version 9.00 stepping N/A
> [    5.096061] i915 0000:00:02.0: [drm] VT-d active for gfx access
> [    5.096102] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> [    5.099214] i915 0000:00:02.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0xffff
> [    5.099217] i915 0000:00:02.0: [drm] Failed to find VBIOS tables (VBT)
> [    5.099324] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
> [    5.100960] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
> [    5.832214] i915 0000:00:02.0: [drm] [ENCODER:105:DDI A/PHY A] failed to retrieve link info, disabling eDP
> [    5.835756] i915 0000:00:02.0: [drm] Registered 3 planes with drm panic
> [    6.428455] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
> [    6.722404] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
>
>> There's at least three levels where this could be handled, depending on
>> details:
>> 
>> - Display probe (the patch at hand). Assumes there's no display
>>   hardware, at all. The driver doesn't touch the hardware, which
>>   continues to consume power, it's not put in low power states. Not
>>   optimal if there actually is display hardware.
>> 
>> - Display disable. See intel_display_device_enabled(). The driver takes
>>   over the hardware, puts it to sleep, but prevents all connectors from
>>   being connected.

At a glance, this seems like the appropriate level.

What if you drop patch 2 and supply i915.disable_display=1 module
parameter? Or return false from intel_display_device_enabled().


BR,
Jani.

>> 
>> - eDP disable. Add a quirk somewhere to enforce eDP is disconnected, but
>>   other connectors can be used.
>
> The main reason I sent this patch is that after i915 trys to probe the display,
> the dGPU (amdgpu) is no longer able to detect the internal display,
> resulting in a black screen.
>
>> It would be quite useful to indicate the PCI ID of the device in
>> question.
>
> 00:02.0 VGA compatible controller [0300]: Intel Corporation CometLake-S GT2 [UHD Graphics 630] [8086:9bc8] (rev 03) (prog-if 00 [VGA controller])
> 	Subsystem: Apple Inc. CometLake-S GT2 [UHD Graphics 630] [106b:ffff]

-- 
Jani Nikula, Intel
