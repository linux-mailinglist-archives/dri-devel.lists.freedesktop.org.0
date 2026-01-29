Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPmEEDu/e2mnIAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 21:12:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16743B42A7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 21:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A844910E254;
	Thu, 29 Jan 2026 20:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5pBh11F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B94510E07A;
 Thu, 29 Jan 2026 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769717558; x=1801253558;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=e/oecSBPN8hSYzWv9o9QG/NxTb7taZBzlNv8EH28SAc=;
 b=H5pBh11FfZIwf7rrq2dwHBb47pmjWxnsZq8aPUphYmI9RIV7COkaO0Qy
 kUF3q408v1vcVse7Ias56Iea1RlQGDhkI/AZc115HkYwCmUbhk5rUkkCL
 fI7Y/mcUGBKdPGxGlMbfmouqyWJZiAIlgOt6nY1f+ipyLYgHt79uWXL/9
 juOGqc8dmEF+rP6HqXy40wv3raLLKw/sc4mQZxW8wzZHpr8gf+k/KdL0X
 9KH6UQD+z2SjtbnljwpJOwCzCABcr75dKJblh1fRVpXPt6hhsk8In1+Rp
 cOKfDrpnKkCDNu3i3zSfxUqh7iZgf+6VWuLJ/i3+QN3biDAhBiidLteoC g==;
X-CSE-ConnectionGUID: uoTNo5dxSICJTiLno0Mi6g==
X-CSE-MsgGUID: +22j11+ZRi2qULQatX4DJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71006837"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="71006837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:12:37 -0800
X-CSE-ConnectionGUID: Hr5d/A6pSDal1vLcJwSlcA==
X-CSE-MsgGUID: ifDXzIbGRS2t6S7OkTQLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213198695"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:12:34 -0800
Date: Thu, 29 Jan 2026 21:12:23 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
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
Subject: [PULL] drm-xe-fixes
Message-ID: <aXu_JzBFb9YVFYW1@fedora>
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
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 16743B42A7
X-Rspamd-Action: no action

Hi, Dave, Simona

Here are the drm-xe-fixes for -rc8.

Thanks,
Thomas


drm-xe-fixes-2026-01-29:
Driver Changes:
- Skip address copy for sync-only execs (Lin)
- Fix a WA (Tvrtko)
- Derive mem_copy cap from graphics version (Nitin)
- Fix is_bound() pci_dev lifetime (Lin)
- xe nvm cleanup fixes (Lin)
The following changes since commit e27ada4f19e7ffda4c05ce8633daf6daed667eea:

  drm/xe: Select CONFIG_DEVICE_PRIVATE when DRM_XE_GPUSVM is selected (2026-01-22 11:27:25 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2026-01-29

for you to fetch changes up to 8a44241b0b83a6047c5448da1fff03fcc29496b5:

  drm/xe/nvm: Fix double-free on aux add failure (2026-01-29 20:31:53 +0100)

----------------------------------------------------------------
Driver Changes:
- Skip address copy for sync-only execs (Lin)
- Fix a WA (Tvrtko)
- Derive mem_copy cap from graphics version (Nitin)
- Fix is_bound() pci_dev lifetime (Lin)
- xe nvm cleanup fixes (Lin)

----------------------------------------------------------------
Nitin Gote (1):
      drm/xe: derive mem copy capability from graphics version

Shuicheng Lin (4):
      drm/xe: Skip address copy for sync-only execs
      drm/xe/configfs: Fix is_bound() pci_dev lifetime
      drm/xe/nvm: Manage nvm aux cleanup with devres
      drm/xe/nvm: Fix double-free on aux add failure

Tvrtko Ursulin (1):
      drm/xe/xelp: Fix Wa_18022495364

 drivers/gpu/drm/xe/xe_configfs.c  |  3 +--
 drivers/gpu/drm/xe/xe_device.c    |  2 --
 drivers/gpu/drm/xe/xe_exec.c      |  6 ++---
 drivers/gpu/drm/xe/xe_lrc.c       |  2 +-
 drivers/gpu/drm/xe/xe_nvm.c       | 55 +++++++++++++++++++--------------------
 drivers/gpu/drm/xe/xe_nvm.h       |  2 --
 drivers/gpu/drm/xe/xe_pci.c       |  6 +----
 drivers/gpu/drm/xe/xe_pci_types.h |  1 -
 8 files changed, 33 insertions(+), 44 deletions(-)
