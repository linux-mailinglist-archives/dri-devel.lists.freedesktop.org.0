Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30D1AD7851
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 18:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88610E03B;
	Thu, 12 Jun 2025 16:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFdc2kph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CF010E033;
 Thu, 12 Jun 2025 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749746001; x=1781282001;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=knpY9TnrIN/QfoSgT+7uq4ApwvboXq1mAPt+MQMAoLQ=;
 b=EFdc2kphxbAdaELK/Cv+EbEBvsrrxXatTZdAyKvzB01/EArghxQt/85k
 uyA2szE1hqIhxLbznMBwWPA/WLfxqvqTNtcvsvH8Th8R9u+kA69sMr4IO
 ydazqXL4en8nyKPXP2K1cUlfrHgeLVPtyGaanozwHKeKwzipKpWb4eVrl
 chxqLnuluGeQYJ5H/YFoMjbdkRdEMon4eBq3UvYibzWw1XoHrUveIUqo/
 u2kIJuCmhppWUSDyO/iCWifNBId+7kqJIXUCb5WGx3ofWmL24wPZTeEFx
 89Eeyrbij8Ch1o5lslasZD4bPPsuLbVgk9KytD3tY1atd2nAdaZs2aaK4 Q==;
X-CSE-ConnectionGUID: dbdlOqtQTG+Za3CicnW/nQ==
X-CSE-MsgGUID: a0nAwWvhRq2sg+ujtXxagw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55742798"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="55742798"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 09:33:21 -0700
X-CSE-ConnectionGUID: wXq6CVcLQCWHIRErkPbKBA==
X-CSE-MsgGUID: F5oDRIxUSqaD/5gteABZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="148067853"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.109])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 09:33:17 -0700
Date: Thu, 12 Jun 2025 18:33:06 +0200
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
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <aEsBQoh5Si3ouPgE@fedora>
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

Two fixes for 6.16-rc2.

Thanks,
Thomas

drm-xe-fixes-2025-06-12:
Driver Changes:
- Fix regression disallowing 64K SVM migration (Maarten)
- Use a bounce buffer for WA BB (Lucas)

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-06-12

for you to fetch changes up to 9c7632faad434c98f1f2cc06f3647a5a5d05ddbf:

  drm/xe/lrc: Use a temporary buffer for WA BB (2025-06-12 18:09:50 +0200)

----------------------------------------------------------------
Driver Changes:
- Fix regression disallowing 64K SVM migration (Maarten)
- Use a bounce buffer for WA BB (Lucas)

----------------------------------------------------------------
Lucas De Marchi (1):
      drm/xe/lrc: Use a temporary buffer for WA BB

Maarten Lankhorst (1):
      drm/xe/svm: Fix regression disallowing 64K SVM migration

 drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.c |  2 +-
 2 files changed, 21 insertions(+), 5 deletions(-)
