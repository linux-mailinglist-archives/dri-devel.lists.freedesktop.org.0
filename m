Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353484E060
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 13:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF33910E62A;
	Thu,  8 Feb 2024 12:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHsDza8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97A310E5BF;
 Thu,  8 Feb 2024 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707394135; x=1738930135;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=DcGi4r62CPTubqVkAwo9c8DMMpm4a10pRPvJWS6PWDo=;
 b=WHsDza8KiwZEZBfT0KUttiNpUniyk/vHQ0vCXWYizeHkTtfE2cwOHBa3
 nSsWbAqFq8+9NDA8uHiFld0u70kb31MkNVVoYXYZkjWUIgz69wNs/M1ha
 wc7CoLJj+wP4iW4u45AVl9bq2L/J+blHvaSo8LVPMecue+v3yeNYvUB7M
 1fnQImgf310FV7YdK71bE5gZYn9xGjA1rjjpAHpuLHyqfBgCnPRzVYHaW
 78dGZSbQuvLUv8ciN5Ieqzy/gN55834Pm3YhHSUtfaw6VRFnX2bBA+zYm
 fqJMjwXQGVq0xXY30WnEZIe15vAqS19jLnJcuaL52RMZt09I4TYapB7mh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1362590"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1362590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 04:08:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1921224"
Received: from unknown (HELO localhost) ([10.245.244.11])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 04:08:49 -0800
Date: Thu, 8 Feb 2024 14:08:46 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <ZcTETgXsejwVwat6@jlahtine-mobl.ger.corp.intel.com>
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

Hi Dave & Sima,

Here goes drm-intel-fixes, which is just the gvt-fixes PR for this week.

Regards, Joonas

***

drm-intel-fixes-2024-02-08:

- Just includes gvt-fixes-2024-02-05

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2024-02-08

for you to fetch changes up to a99682e839af7be11a606bf802cba5b2bf93b8e9:

  Merge tag 'gvt-fixes-2024-02-05' of https://github.com/intel/gvt-linux into drm-intel-fixes (2024-02-05 15:56:47 +0200)

----------------------------------------------------------------
- Just includes gvt-fixes-2024-02-05

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gvt: Fix uninitialized variable in handle_mmio()

Joonas Lahtinen (1):
      Merge tag 'gvt-fixes-2024-02-05' of https://github.com/intel/gvt-linux into drm-intel-fixes

Zhenyu Wang (1):
      drm/i915: Replace dead 01.org link

Zhi Wang (1):
      MAINTAINERS: Update Zhi Wang's email address

 MAINTAINERS                         | 4 ++--
 drivers/gpu/drm/i915/Kconfig        | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 drivers/gpu/drm/i915/intel_gvt.c    | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)
