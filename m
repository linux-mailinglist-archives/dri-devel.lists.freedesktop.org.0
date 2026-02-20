Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKAVGu8bmGn8/wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:31:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4F165ADC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA83510E79B;
	Fri, 20 Feb 2026 08:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRTzkVfe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB510E209;
 Fri, 20 Feb 2026 08:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771576299; x=1803112299;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=CLd+jDq+JY8wl40+mKzVQ42ndGvdMUR60X6IjH9vRNc=;
 b=TRTzkVfe2rb5saTbdDlwgkIGeRFohcXE1NRtxLv96lBXE/Cc7wi34iFs
 xoDtlfpTY+/oe48hz+NvCPK8CLDceSK+/+l01nppGvY28rm/LPooumYWt
 AcI85L/92ddG+eMv7sLBgPJ9anRvwfueq7Q2mu6xoyVTKg9EGw+ktGW1N
 RacWeq53Ythrrn+p93WhmDGbJ6M+d8CcngcdSe7FLJuw1hPsEzgZvR54i
 nFWFJqeHPo79elfcKDfgAJ6m0CTIQxG10Q9kV7lMXJSv/e+M5cnzT0N/i
 axEqUSDw4T2Xy2ZhLOw7eSLRSuni8uU+jbHO1ORXfuhsZKQl1UkhpON84 Q==;
X-CSE-ConnectionGUID: ROvk64FETxKwzadxx+5dxQ==
X-CSE-MsgGUID: JIZhhX00TeyroPC+o3kG/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71693391"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="71693391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 00:31:38 -0800
X-CSE-ConnectionGUID: dLsxdRtyRmSbRxyT7HJe/w==
X-CSE-MsgGUID: ov8T7BZNSAC7UU586oczYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="219342577"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.24])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 00:31:34 -0800
Date: Fri, 20 Feb 2026 10:31:31 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next-fixes
Message-ID: <aZgb43cDcTPBYssk@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joonas.lahtinen@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,intel.com:dkim]
X-Rspamd-Queue-Id: E0D4F165ADC
X-Rspamd-Action: no action

Hi Dave & Sima,

Here's drm-intel-next-fixes PR towards 7.0-rc1.

Just one display fix to DP mode validation.

Regards, Joonas

***

drm-intel-next-fixes-2026-02-20:

- Add missing slice count check during DP mode validation

The following changes since commit 57b85fd53fccfdf14ce7b36d919c31aa752255f8:

  drm/i915/acpi: free _DSM package when no connectors (2026-02-12 08:03:11 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-02-20

for you to fetch changes up to 777a02812f739af9e349cd0f695400a1d84053f4:

  drm/i915/dp: Add missing slice count check during mode validation (2026-02-17 18:31:16 +0200)

----------------------------------------------------------------
- Add missing slice count check during DP mode validation

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/dp: Add missing slice count check during mode validation

 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)
