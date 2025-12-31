Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE2CEC6C6
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 18:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487D510E335;
	Wed, 31 Dec 2025 17:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l853oLqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68E210E030;
 Wed, 31 Dec 2025 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767203515; x=1798739515;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=IIcs8lX24Td3b3E5y25iXivkIU1FYlzK1UcpBVdjKHM=;
 b=l853oLqYZ2YzBsEMjmmVYh1DGyMoQY0D9cjJoU/yKkUbkMXzA8DwO1NV
 86oNfnWvdTVyCcY7aaMiK0sCHL8VKHXG5yfgzdVvNOz+M26KIpnXRLtEI
 Yq/zUtqdKi9VgEJIbnPfx9+RnOZ9tFzqSvv7tZLueC/6WHDV1La/g3hF8
 qPB8sCIqlfqHjShfQoseeqLBWVERj6E+zcVwqa6R4XTAeHvaIfw5n622q
 EQsxvb9WbxO8E2fWhSvBU9PcjN81L929OQm5AMbjrgl73w50IjKVUu6Yp
 H9DvqvS/zq72DM4nGHGEyZ2a02RedCtoRZSgLiIZ5/HA1fsMPvOy+UphE g==;
X-CSE-ConnectionGUID: N6/rzknqRqKWq9iIg8u/yg==
X-CSE-MsgGUID: 3Bx9F3DDR/uecFIuHbhdtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="86349384"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="86349384"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:51:55 -0800
X-CSE-ConnectionGUID: GaA48XehRoeNbq8J0r6SXw==
X-CSE-MsgGUID: ld+o6+wiR1ePkfLATtiUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="205962545"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:51:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Date: Wed, 31 Dec 2025 19:51:47 +0200
Message-ID: <4e79f041395bb8bcc9b2a76bb98b5e3df1c1c3eb@intel.com>
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

Still pretty quiet in the i915 land, just one fix for -rc4.

Happy New Year!


BR,
Jani.


The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-12-31

for you to fetch changes up to 4fe2bd195435e71c117983d87f278112c5ab364c:

  drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer (2025-12-31 11:19:47 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.19-rc4:
- Fix eb_lookup_vmas() failure path

----------------------------------------------------------------
Krzysztof Niemiec (1):
      drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 37 ++++++++++++--------------
 1 file changed, 17 insertions(+), 20 deletions(-)

-- 
Jani Nikula, Intel
