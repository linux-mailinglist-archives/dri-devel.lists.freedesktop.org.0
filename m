Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNVOGrAjg2nWhwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:47:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5996E4BB2
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E7B10E066;
	Wed,  4 Feb 2026 10:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCV7qkOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAA610E066;
 Wed,  4 Feb 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202026; x=1801738026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7m3lL/Su6HWD8RUaWgftAo9PDPnTw4uPSEQc4VBhyl4=;
 b=RCV7qkOUUh088RRbWBNZLfmt5hlGZQ3JWEbUs7SEWPCfPRazzN8fBTEY
 oAp1C0geGpRuTr/pmNNeHiS7BRpciF5yRKYOod3iO69Vy3l3t8Qx6BR1+
 K7YsEo16OxY+TVSSQ02a6DbQ6FBsnbA8NeL8EV/XJaQFLv337vXYKQDvQ
 XwpyaOhTg1V1IvQd6Op3YMSf8OlNPsPTp9o64e4Cy8zacLhkP310AYLJQ
 Vwi/GmCX8n0mf4MONM9dShCVKDO/8IULHYDpiRX7YjK1TibfCjW1tARqU
 sD3inHuLTyxE1Dq5S957pEULsYGLDQIATtjjjw+hD8puCAHMwsI1SeCUr w==;
X-CSE-ConnectionGUID: 7BWPNsrFS2+NToamL6RtzQ==
X-CSE-MsgGUID: rIfoombbTWirYkUDbCDAnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="94039255"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="94039255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:06 -0800
X-CSE-ConnectionGUID: c2TuS9iqSQ66vBjEBsC3hA==
X-CSE-MsgGUID: MSXPW6GdRO6mqhketIzuPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209926621"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:47:04 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/2] drm/buddy: Documentation and internal helper cleanup
Date: Wed,  4 Feb 2026 16:13:44 +0530
Message-ID: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: D5996E4BB2
X-Rspamd-Action: no action

This series improves the DRM buddy allocator by adding missing
documentation and cleaning up internal helpers.

It adds kernel-doc for the allocator structures and flags, covering
drm_buddy, drm_buddy_block, and the allocation flags (RANGE, TOPDOWN,
CONTIGUOUS, CLEAR, TRIM_DISABLE) to make the allocator’s design and usage
clearer for readers and contributors.

It also reduces the header surface by moving internal helpers from
drm_buddy.h into drm_buddy.c as static functions, since they have no
external users, and removes drm_get_buddy(), an unused exported wrapper
around the internal __get_buddy() helper. This clarifies the intended API
and avoids exporting unused symbols.

No functional changes.

Cc: Christian König <christian.koenig@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>

Sanjay Yadav (2):
  drm/buddy: Move internal helpers to drm_buddy.c
  drm/buddy: Add kernel-doc for allocator structures and flags

 drivers/gpu/drm/drm_buddy.c |  41 ++++++----
 include/drm/drm_buddy.h     | 149 ++++++++++++++++++++++++------------
 2 files changed, 126 insertions(+), 64 deletions(-)

-- 
2.52.0

