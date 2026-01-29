Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULqxAiYWe2kZBQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:11:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0503AD432
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E11C10E808;
	Thu, 29 Jan 2026 08:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkV6ibll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115510E81A;
 Thu, 29 Jan 2026 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674273; x=1801210273;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/r7ByJy+EYnXQZNZ6uIsRji9ickMcjeejRxOnY7gB+k=;
 b=PkV6ibllplaOFXS0x9nTGxM8v9tkycLzCxUMsl+IToxmcZOyR19YDY2x
 DFH44heizZ/kpaB8JnvLU50U+odhpe+VHLIjkqpkHJSNthUqcKwBuvb2R
 E63P9JoXOovoWzF2NwogKImeL1KP1iAtSfY445oO+QcBnbLUjywV+XJ80
 6L29iyfsChRYCDz5L+WtAKskzhIdV6ll6FMCBRZXZRxhTt3dHwYzELZy7
 o2k2vdrG5H7S3S1eFfHGR4S44seKttBBXIDEyvw+Uro/HpXI1TM7xQBL4
 3Ab9xb8rh2wao5Dx4becDJ11evIt7qWx45dF2T+PJFkHU7PplgzfHpl4Z A==;
X-CSE-ConnectionGUID: eBmDpSmsSQ+FframDkz7Qw==
X-CSE-MsgGUID: YcNL0QtaTauvPstlVh9vqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74526694"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74526694"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:11:12 -0800
X-CSE-ConnectionGUID: gxlGIFvDRHW7WFaXedj1XQ==
X-CSE-MsgGUID: Gi1kRkoFRuKQxZb19Eq/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208747074"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.118])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:11:08 -0800
Date: Thu, 29 Jan 2026 10:11:05 +0200
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
Message-ID: <aXsWGWjacEJ03rTs@jlahtine-mobl>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: D0503AD432
X-Rspamd-Action: no action

Hi Dave & Sima,

Here goes this week's drm-intel-next-fixes PR.

Just one u64 underflow fix to appease the static checkers.

Regards, Joonas

***

drm-intel-next-fixes-2026-01-29:

- Prevent u64 underflow in intel_fbc_stolen_end

The following changes since commit 69f83f167463bad26104af7fbc114ce1f80366b0:

  drm/i915/psr: Don't enable Panel Replay on sink if globally disabled (2026-01-19 11:55:31 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-01-29

for you to fetch changes up to ad3ebcc2d06875738cd463fb5424cda70cd94a34:

  drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end (2026-01-26 11:39:57 +0200)

----------------------------------------------------------------
- Prevent u64 underflow in intel_fbc_stolen_end

----------------------------------------------------------------
Jonathan Cavitt (1):
      drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end

 drivers/gpu/drm/i915/display/intel_fbc.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)
