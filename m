Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJgGEapOhGkE2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:02:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F8BEFAFD
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B35710E7ED;
	Thu,  5 Feb 2026 08:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8al/kwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A4C10E7EC;
 Thu,  5 Feb 2026 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770278564; x=1801814564;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=W3HCSwVO02Jf4aCwQWQtsGXNqivdwb5pfp+JVt5AeHo=;
 b=E8al/kwRzg4W/v1pbHh9ZF4u0NDVor58BHgZBzlmU8pQ0pbOWN+HxMws
 qpHe45RMxPMdzy5uldLpTSgw9r9ot9MB4we6TsnTSJYvUMwWR+8cAdSdQ
 vgIvM2Vwu52irvXO/z5Ydfrtl2HE5SN8FQZlhp2RlD/TZGrEYcpw0w4CE
 +Yb4Xh4HSvZJj6UwPMHtzDjUEaWp/f/lD/gz0oRqH09IT4bUhsakRVS4Z
 HHZ922SBTmfiGZI383dvVFcGZp0r2OkgcZ0pyHX9AQWEJrpAOGxXTtkyT
 D/hwdjjg/AlO+RUEe/gHHLH8ZcyIqAlroAs0GTceMkFkjsd9yc2P3SQiC w==;
X-CSE-ConnectionGUID: Htrb7/vcQjmRD5wKy04CUg==
X-CSE-MsgGUID: +BIGO34lRLG7oDc1N08z7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74073705"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="74073705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:02:44 -0800
X-CSE-ConnectionGUID: +0aAbd+fTbiwJg7ZpRqrYw==
X-CSE-MsgGUID: ySThqqn4QOeriYv192hp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="233363971"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:02:40 -0800
Date: Thu, 5 Feb 2026 10:02:38 +0200
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
Message-ID: <aYROngKfyUIyoQW0@jlahtine-mobl>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 19F8BEFAFD
X-Rspamd-Action: no action

Hi Dave & Sima,

Here goes this weeks drm-intel-next-fixes PR towards 6.20/7.0-rc1.

Just one display fix for Xe3p_LPD pixel normalization.

Regards, Joonas

***

drm-intel-next-fixes-2026-02-05:

- Fix the pixel normalization handling for xe3p_lpd display

The following changes since commit ad3ebcc2d06875738cd463fb5424cda70cd94a34:

  drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end (2026-01-26 11:39:57 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-02-05

for you to fetch changes up to 3e28a67a85f9b569066f6dfcddadb39294c0c9d4:

  drm/i915/display: fix the pixel normalization handling for xe3p_lpd (2026-02-02 13:41:03 +0200)

----------------------------------------------------------------
- Fix the pixel normalization handling for xe3p_lpd display

----------------------------------------------------------------
Vinod Govindapillai (1):
      drm/i915/display: fix the pixel normalization handling for xe3p_lpd

 .../gpu/drm/i915/display/intel_display_device.h    |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           | 10 +++---
 drivers/gpu/drm/i915/display/intel_fbc.h           |  3 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 36 +++++++++++-----------
 4 files changed, 26 insertions(+), 24 deletions(-)
