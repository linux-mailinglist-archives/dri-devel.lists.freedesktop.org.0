Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAD9E3C33
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1267C10ED42;
	Wed,  4 Dec 2024 14:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pn4CHbI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D340710ED40;
 Wed,  4 Dec 2024 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733321348; x=1764857348;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=TCBvtmRf6DnMY/kyoik46wtEycNe6/8fbGRpIcOBLWM=;
 b=Pn4CHbI3bLlDi1MKyEBVJzTFRQaWa78rM0vZUOiUBVS6Oa2hX5o/14Sa
 g97j1pyXHLhYIIgEIqNKv48Ltmc5LjiUlMzYeDW9LuETDWFFkMmJOMYXX
 DAj4rQ+HkmdlegAu7XQWuhImXLdgi3532zjaCGFJpWghqnhM/wXnZUPCo
 BqQdBks9CjZ6Fi1ZtQWHMllCLxV5DidHUlZeADPIrPFwEi5cSUhJfZaa4
 JVx59X5JRLxWGIWrHbEf/VaerHvx2sPFD3PA77ufjIN13WEsOSmMW32S2
 x5v/GLhVw308aRzyaaMMrz+S4iTFFrWLiQkuTgDH4IXqmawRCOWVe2J4B A==;
X-CSE-ConnectionGUID: L/pntxtSTZ6CJbKLj4cePg==
X-CSE-MsgGUID: JT8zAC/LSuKAzQDo9EVFkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56071479"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="56071479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:09:08 -0800
X-CSE-ConnectionGUID: cQ5m6uxMQlSU0JJ6THUmqw==
X-CSE-MsgGUID: 4lf1GMbdQsG2cM0saye1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93957492"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.246.221])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:09:03 -0800
Date: Wed, 4 Dec 2024 15:08:53 +0100
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
Message-ID: <Z1BidZBFQOLjz__J@fedora>
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

Hi Dave, Simona

Two xe fixes for -rc2

Thanks,
Thomas

drm-xe-fixes-2024-12-04:
Driver Changes:
- Missing init value and 64-bit write-order check (Zhanjung)
- Fix a memory allocation issue causing lockdep violation (John)
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-12-04

for you to fetch changes up to 5dce85fecb87751ec94526e1ac516dd7871e2e0c:

  drm/xe: Move the coredump registration to the worker thread (2024-12-03 10:33:13 +0100)

----------------------------------------------------------------
Driver Changes:
- Missing init value and 64-bit write-order check (Zhanjung)
- Fix a memory allocation issue causing lockdep violation (John)

----------------------------------------------------------------
John Harrison (1):
      drm/xe: Move the coredump registration to the worker thread

Zhanjun Dong (1):
      drm/xe/guc: Fix missing init value and add register order check

 drivers/gpu/drm/xe/xe_devcoredump.c | 73 +++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_capture.c | 77 +++++++++++++++++++++++++++++--------
 2 files changed, 101 insertions(+), 49 deletions(-)
