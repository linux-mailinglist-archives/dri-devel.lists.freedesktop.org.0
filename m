Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C991A13B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 10:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E510E044;
	Thu, 27 Jun 2024 08:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m59b1SX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6726A10E044;
 Thu, 27 Jun 2024 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719476092; x=1751012092;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=KP0PiXP0FpeancGGwcsVj3Mhu5el/I6qgwYNKt0IS3c=;
 b=m59b1SX5RJV48tw289fwL9mQR1jEDHrmbOeM1HomfPVP4yedI8vTOIC+
 mjd2qrdXPjRLu8MVkwLAxbyw8p61s3qkaMkfnMOp+ul3qksXFYGWa//EM
 xQzxiJReCq2QteJHzumBzv99y2Y35HEMCHyzsKx4Uv3A3tB2ZY53bsCAh
 jWX7A16j3a/IjCkdBOk6Vf/gOHf503G+t9qUUoCoS8IxK6CVCe9A/kDmD
 HPYSTcdNGcyAxG8LymQz6i5TspfpDgCMNV6PtTOVVJ1Ythtwrvs24uYLB
 avL//8oj0xfcIgKdmNXLy1ZhpplXUKetbJwSsc0Y7u1zjv5HMIpP1BRor Q==;
X-CSE-ConnectionGUID: TIC7IBHMTtSTJg1rS89OeQ==
X-CSE-MsgGUID: qbYTF38XRsiFJhcVTLTgOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27723839"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="27723839"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:14:47 -0700
X-CSE-ConnectionGUID: OQdGJ0TmRIO/O7rnTbGWTw==
X-CSE-MsgGUID: CUgCJCuSR4a25azkjz81Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="67509210"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 01:14:42 -0700
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
Date: Thu, 27 Jun 2024 11:14:38 +0300
Message-ID: <87ikxudcpd.fsf@intel.com>
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

drm-intel-fixes-2024-06-27:
drm/i915 fixes for v6.10-rc6:
- Fix potential UAF due to race on fence register revocation

BR,
Jani.

The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:

  Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-06-27

for you to fetch changes up to 996c3412a06578e9d779a16b9e79ace18125ab50:

  drm/i915/gt: Fix potential UAF by revoke of fence registers (2024-06-24 13:05:15 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.10-rc6:
- Fix potential UAF due to race on fence register revocation

----------------------------------------------------------------
Janusz Krzysztofik (1):
      drm/i915/gt: Fix potential UAF by revoke of fence registers

 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 1 +
 1 file changed, 1 insertion(+)

-- 
Jani Nikula, Intel
