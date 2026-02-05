Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBkRENW2hGk54wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:27:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EBF498C
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C135A10E905;
	Thu,  5 Feb 2026 15:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ja4hRnVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64110E101;
 Thu,  5 Feb 2026 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770305233; x=1801841233;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9dDEho7mO9u4241BITzvScsshCE64rPQ9j5YJcgYnik=;
 b=Ja4hRnVo7RcqgMKnwnBIYKZzEyovba2Kir5/sovOHK4OueAgdexNB8W+
 Jj/YSdjolZHbHfKOChTQdD1xEnKPHJpWWiZ+O5KZEzTpzF/k5c7AVA7EL
 HnfiDJTTrOgWW4rtgM4bI748vFR7Lblc07xClHxYFu9yZpMwlDDBtoosD
 so1jfxtDhgee5UYkRLAcnJIXH6I87Aokj+M4DMTvZTEKio8K1wEJ+KuQv
 EtpgdSZpSDEr3YqE3ezdHMaK0xjbMzd5RbsmNQs9i5PW3xzyebdntUMC7
 yF2xlUJybAkWaMcqTpPIWm+8rI3wvLfZcCDj0T+MHUrwjGu0lFScEetsg g==;
X-CSE-ConnectionGUID: 6NueVkxLQ269qwdZCY1Pvw==
X-CSE-MsgGUID: HZovi+f5RIeFqgaNWeB1iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="81821262"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="81821262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 07:27:12 -0800
X-CSE-ConnectionGUID: lZQHHC1eRoWOIOG341+wRw==
X-CSE-MsgGUID: 5xVdXM3ATCqDJKBKE4uXIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="248160985"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 07:27:08 -0800
Date: Thu, 5 Feb 2026 16:26:55 +0100
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
Message-ID: <aYS2v12R8ELQoTiZ@fedora>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 058EBF498C
X-Rspamd-Action: no action

Hi Dave, Simona

This week's drm-xe-fixes PR for 6.19.

The CFI violation fix from Danile conflicts a bit with drm-next, but
as usual, the resolution is in drm-rerere.

Thanks,
Thomas

drm-xe-fixes-2026-02-05:
Driver Changes:
- Fix topology query pointer advance (Shuicheng)
- A couple of kerneldoc fixes (Shuicheng)
- Disable D3Cold for BMG only on specific platforms (Karthik)
- Fix CFI violation in debugfs access (Daniele)
The following changes since commit 8a44241b0b83a6047c5448da1fff03fcc29496b5:

  drm/xe/nvm: Fix double-free on aux add failure (2026-01-29 20:31:53 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2026-02-05

for you to fetch changes up to 4cb1b327135dddf3d0ec2544ea36ed05ba2252bc:

  drm/xe/guc: Fix CFI violation in debugfs access. (2026-02-05 09:45:22 +0100)

----------------------------------------------------------------
Driver Changes:
- Fix topology query pointer advance (Shuicheng)
- A couple of kerneldoc fixes (Shuicheng)
- Disable D3Cold for BMG only on specific platforms (Karthik)
- Fix CFI violation in debugfs access (Daniele)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/xe/guc: Fix CFI violation in debugfs access.

Karthik Poosa (1):
      drm/xe/pm: Disable D3Cold for BMG only on specific platforms

Shuicheng Lin (4):
      drm/xe/query: Fix topology query pointer advance
      drm/xe: Fix kerneldoc for xe_migrate_exec_queue
      drm/xe: Fix kerneldoc for xe_gt_tlb_inval_init_early
      drm/xe: Fix kerneldoc for xe_tlb_inval_job_alloc_dep

 drivers/gpu/drm/xe/xe_guc.c           |  6 ++++--
 drivers/gpu/drm/xe/xe_guc.h           |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       |  2 +-
 drivers/gpu/drm/xe/xe_pm.c            | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_query.c         |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c     |  2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c |  2 +-
 7 files changed, 19 insertions(+), 10 deletions(-)
