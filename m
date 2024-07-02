Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B1F923016
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3F10E568;
	Tue,  2 Jul 2024 08:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5CAqUpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A8210E55C;
 Tue,  2 Jul 2024 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719908929; x=1751444929;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=37IXnKp5Xs7oyRLEpmsewXrNxJhpk2yC6Feu9+Gk+bk=;
 b=P5CAqUpXHP5AllRO5TjL4N64jl7K+VAePynp828Ilwx9TxZYL+Ccr/bM
 ReDddI8uDBu2NHHeQOpbCkJbJ0zLZfneUF2F5iD00L2I/B4rjF0pZgy/D
 3/Xrq+DsXZppwt7m6Mjj7axjlRj458wB5D4Ij/husLVKfUd4iKMTlbn2T
 PZ7lCVbDcZOP4URcDxC6X817JwAgPqDmW/rLDT12cmLqsnD6yxiT+4zQJ
 ozbRHlnzxi0eFnZJnwkcyV6noCqybfeYkqoESd42wMR/FQDYZeIF0ksJQ
 kKrrkeYokhz4gsnxWpt8Jld+szJ8kYxbGw5bcollks+SZPMqCPqiJaT0G w==;
X-CSE-ConnectionGUID: K8XZR+MXTJGiDig5S6xqqA==
X-CSE-MsgGUID: baOjJG2ARrudKC8UImF8Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="28463579"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="28463579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 01:28:48 -0700
X-CSE-ConnectionGUID: p0oKSVt8ReWUgTkRBavViw==
X-CSE-MsgGUID: HZwo8XzITqumLiOCWg98eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="45619504"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.179])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 01:28:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 02 Jul 2024 11:28:39 +0300
Message-ID: <87frss9ozs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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


Hi Dave & Sima -

One early fix this week.

drm-intel-fixes-2024-07-02:
drm/i915 fixes for v6.10-rc7:
- Skip unnecessary MG programming, avoiding warnings (Imre)

BR,
Jani.

The following changes since commit 22a40d14b572deb80c0648557f4bd502d7e83826:

  Linux 6.10-rc6 (2024-06-30 14:40:44 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-07-02

for you to fetch changes up to f72383371e8c5d1d108532d7e395ff2c277233e5:

  drm/i915/display: For MTL+ platforms skip mg dp programming (2024-07-01 10:36:12 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.10-rc7:
- Skip unnecessary MG programming, avoiding warnings (Imre)

----------------------------------------------------------------
Imre Deak (1):
      drm/i915/display: For MTL+ platforms skip mg dp programming

 drivers/gpu/drm/i915/display/intel_ddi.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
Jani Nikula, Intel
