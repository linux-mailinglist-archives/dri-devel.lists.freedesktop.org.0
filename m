Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B25CA58A1
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13E010E9DB;
	Thu,  4 Dec 2025 21:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mhhw3g+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D8E10E9CB;
 Thu,  4 Dec 2025 21:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764884739; x=1796420739;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=7DDkp43ou2W2SBXe6C4JiqeLnw+Bsv42pqaSA+XcS+4=;
 b=Mhhw3g+lm+wkFw4r13wjuyBK7U4vJHP9xDJWElAteyeyWsvIDpQPlUBb
 CRN7CtF1/OHwGfGLSpjLk/5+8k4/JLQY7aWAn1uJ+S4Mmt+8pYLpkwpD7
 UhkDve5uGOf/0CwMm3m6RA0jVHocEztXmgUfZnHXhlb8hfbtzioPS6b4F
 0ZuAgblF8Cwm5A0KXP6UWzL/zB0b6/cvnF1/PGdAvHVS58N5IJiMjm7GP
 oImern7Ls6XEC7thVpst2XCmz14dfGcCg4XadaJN9Ds8C7zzxEC5cEG1y
 Hzmy9tC/Xm/WKpCD89UXRiQHabxMGfWI0bE6/r5wpLN0VqslIbNIvbvdY A==;
X-CSE-ConnectionGUID: pWxd8C4JRty4KLfRHARAQg==
X-CSE-MsgGUID: 0KEKJrmFSbaTf0NADA9e8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84323219"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="84323219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:45:39 -0800
X-CSE-ConnectionGUID: /5YRqVOLRiqqeuTYlxa5gg==
X-CSE-MsgGUID: hagfpa4zSd6OjSENtEfNrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195520529"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.245.167])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:45:34 -0800
Date: Thu, 4 Dec 2025 22:45:26 +0100
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
Subject: [PULL] topic/xe-vfio for 6.19
Message-ID: <aTIA9in2Bo_fA9TN@fedora>
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

Please consider pulling this fix and (as a prereq) the original pull-request
https://lore.kernel.org/dri-devel/aS1bNpqeem6PIHrA@fedora/
for 6.19 as discussed on IRC.
 
topic/xe-vfio-2025-12-04:
Driver Changes:
- fix VFIO link error for built-in xe module (Arnd Bergmann)

The following changes since commit 1f5556ec8b9efbb784aeb3536e147182dee73d0f:

  vfio/xe: Add device specific vfio_pci driver variant for Intel graphics (2025-12-01 09:45:48 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/topic/xe-vfio-2025-12-04

for you to fetch changes up to e45b5df47b07e6ce1138b0a4e70ad0b0c4d72881:

  drm/xe/pf: fix VFIO link error (2025-12-04 16:34:00 +0100)

----------------------------------------------------------------
Driver Changes:
- fix VFIO link error for built-in xe module (Arnd Bergmann)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/xe/pf: fix VFIO link error

 drivers/gpu/drm/xe/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
