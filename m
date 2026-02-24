Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Iy4OS1OnWkBOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:07:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C785182BC7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F0110E4BB;
	Tue, 24 Feb 2026 07:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNv2/TSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5295710E4B8;
 Tue, 24 Feb 2026 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771916842; x=1803452842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=s4xF9yyXqW470/XuaHbqUR/dgvL6tffR1J8xoUjR064=;
 b=HNv2/TSMx2lw2oPGdc8CIY8ThofIrSq4kbyQLArE+mNcIAGjjKcl+KCZ
 EctavHn0AYhP8JnjC94G4/VCEb7OZNR/MhuAcsbBKT5lfdVInFqoh4X1w
 sUD+2omiY/D/SyffLu1YVupCdk+zOCSIU4cLdhBS3z/XuohLyfiDvulvE
 hdywFd1t/QXqYdQCLyPUQRt62uieG+yv6INDgpkEi72oASshzaCk+ZGVo
 uSwNLr8KnZicpwz4DhdHDfXvQvJwW1ZMRcWVc73jygNAS1O3BG8crAKVF
 Nh3M1G72VdjUQm42hZOTcRDx0ca2Gagje9921TRGmMPfm61STACerUxIz w==;
X-CSE-ConnectionGUID: XJZaa7MgRzedlmH1bdO6LA==
X-CSE-MsgGUID: /74m7OxVSeG+YSl0BAlNGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60501370"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60501370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:07:21 -0800
X-CSE-ConnectionGUID: wpMuIl+bSY2wfzGsGBvOiw==
X-CSE-MsgGUID: XAYrFcfCTo+R7JVvYLvA9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253540273"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:07:15 -0800
Date: Tue, 24 Feb 2026 09:07:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org,
 harry.wentland@amd.com, uma.shankar@intel.com,
 louis.chauvet@bootlin.com, naveen1.kumar@intel.com,
 ramya.krishna.yella@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
Message-ID: <aZ1OIDsVfFvyHUK5@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
 <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com>
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
X-Spamd-Result: default: False [0.36 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9C785182BC7
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:37:39PM +0530, Murthy, Arun R wrote:
> Any other comments/feedback on this?

Having random strings as uabi seems like a bad idea.
How would you make sure those are never changed?

> 
> Thanks and Regards,
> Arun R Murthy
> -------------------
> 
> On 23-02-2026 14:45, Arun R Murthy wrote:
> > EDITME: Imported from f20260210-atomic-v9-5-525c88fd2402@intel.com
> >          Please review before sending.
> >
> > The series focuses on providing a user readable error value on a failure
> > in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
> > cases and it is difficult for the user to decode the error and get to
> > know the real cause for the error. If user gets to know the reason for
> > the error then corrective measurements can be taken up.
> >
> > User will have to check for the capability
> > DRM_CAP_ATOMIC_ERROR_REPORTING before using this feature so as to ensure
> > that the driver supports failure reporting.
> >
> > TODO: driver specific error codes are to be added and will be done in
> > the follow-up patches.
> >
> > TODO: Once the series is merged the element 'reserved' used for sending
> > the failure code in struct drm_mode_atomic is to changed to err_code.
> >
> > The IGT related changes are pushed for review @
> > https://patchwork.freedesktop.org/series/153330/
> >
> > [RFC] changes for libdrm pushed for review @
> > https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/450
> >
> >      To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >      To: suraj.kandpal@intel.com>
> >      To: Maxime Ripard <mripard@kernel.org>
> >      To: Thomas Zimmermann <tzimmermann@suse.de>
> >      To: David Airlie <airlied@gmail.com>
> >      To: Simona Vetter <simona@ffwll.ch>
> >      To: Jani Nikula <jani.nikula@linux.intel.com>
> >      To: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >      To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >      To: Tvrtko Ursulin <tursulin@ursulin.net>
> >      To: xaver.hugl@kde.org
> >      To: harry.wentland@amd.com
> >      To: uma.shankar@intel.com
> >      To: louis.chauvet@bootlin.com
> >      To: naveen1.kumar@intel.com
> >      To: ramya.krishna.yella@intel.com
> >      Cc: dri-devel@lists.freedesktop.org
> >      Cc: intel-gfx@lists.freedesktop.org
> >      Cc: intel-xe@lists.freedesktop.org
> >      Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> > Changes in v9:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v8: https://lore.kernel.org/r/20260129-atomic-v8-0-4cb7b0faa051@intel.com
> >
> > ---
> > Arun R Murthy (7):
> >        drm: Define user readable error codes for atomic ioctl
> >        drm/atomic: Add error_code element in atomic_state
> >        drm/atomic: Call complete_signaling only if prepare_signaling is done
> >        drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
> >        drm/atomic: Return user readable error in atomic_ioctl
> >        drm/i915/display: Error codes for async flip failures
> >        drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
> >
> >   drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
> >   drivers/gpu/drm/drm_atomic_uapi.c            | 89 ++++++++++++++++++++--------
> >   drivers/gpu/drm/drm_ioctl.c                  |  3 +
> >   drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
> >   include/drm/drm_atomic.h                     | 10 ++++
> >   include/uapi/drm/drm.h                       |  7 +++
> >   include/uapi/drm/drm_mode.h                  | 37 ++++++++++++
> >   7 files changed, 165 insertions(+), 37 deletions(-)
> > ---
> > base-commit: cec43d5c2696af219fc2ef71dd7e93db48c80f66
> > change-id: 20250728-atomic-c9713fd357e4
> >
> > Best regards,

-- 
Ville Syrjälä
Intel
