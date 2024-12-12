Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774109EFC7D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 20:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E66910EE84;
	Thu, 12 Dec 2024 19:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbuQB9/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603010EE84;
 Thu, 12 Dec 2024 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734031754; x=1765567754;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2fkuHIblgfbuJQjrGaRp+8p80poZxRgaJo9SOWuhcVk=;
 b=RbuQB9/2Y0ghUQLyH4MSZKWNsOn1buvN3071KZHG+46InRTlDMJNi3YO
 dDPQDtzRlghj210+B4WMGskYm6f6bfY9DSPa7JySLJFD8HyRF7UKJXQ5N
 YFGug7T8Py8994KAsG8jntuHrHZqLLjeLDz6HE19baMj9UWeIAX3jxHJm
 Kokp4RBCvnjsjZWTvpRWoCwJuW8WXB/l9uKlSkDN5OL44slNYb55dzaCh
 ditxZVt+CfklRUsNli+7V9FgmvnBO5A3yhrXm/dx2Nlxw+x3VrWWJBNQB
 W4tGKQi5OChpY2aNmetAQ5CIqlBAIl/9LeentBexMuchl0ffkCvwKJvKN A==;
X-CSE-ConnectionGUID: K7O9+T/fQkyDbyi3rLWHKQ==
X-CSE-MsgGUID: ROdaj2tNS+6+eS13RsHCOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34376030"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34376030"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:29:14 -0800
X-CSE-ConnectionGUID: FNSwtnUdR1q+Dhu1HXo7iA==
X-CSE-MsgGUID: 2r3WOBcBSuOT+pASeUfK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96167143"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.120])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:29:10 -0800
Date: Thu, 12 Dec 2024 20:28:58 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <Z1s5elHXOyeIHnE0@fedora>
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

Dave, Simona

This week'd drm-xe-fixes PR.

Thanks,
Thomas

drm-xe-fixes-2024-12-12:
- Fix a KUNIT test error message (Mirsad Todorovac)
- Fix an invalidation fence PM ref leak (Daniele)
- Fix a register pool UAF (Lucas)
The following changes since commit 5dce85fecb87751ec94526e1ac516dd7871e2e0c:

  drm/xe: Move the coredump registration to the worker thread (2024-12-03 10:33:13 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-12-12

for you to fetch changes up to d7b028656c29b22fcde1c6ee1df5b28fbba987b5:

  drm/xe/reg_sr: Remove register pool (2024-12-12 16:57:28 +0100)

----------------------------------------------------------------
- Fix a KUNIT test error message (Mirsad Todorovac)
- Fix an invalidation fence PM ref leak (Daniele)
- Fix a register pool UAF (Lucas)

----------------------------------------------------------------
Daniele Ceraolo Spurio (1):
      drm/xe: Call invalidation_fence_fini for PT inval fences in error state

Lucas De Marchi (1):
      drm/xe/reg_sr: Remove register pool

Mirsad Todorovac (1):
      drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt

 drivers/gpu/drm/xe/tests/xe_migrate.c       |  4 ++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  8 ++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c                  |  3 +--
 drivers/gpu/drm/xe/xe_reg_sr.c              | 31 ++++++-----------------------
 drivers/gpu/drm/xe/xe_reg_sr_types.h        |  6 ------
 6 files changed, 18 insertions(+), 35 deletions(-)
