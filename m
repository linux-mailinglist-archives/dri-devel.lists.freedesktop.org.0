Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA790E894
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 12:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E9010EC29;
	Wed, 19 Jun 2024 10:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/Icuo7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67D10EC28;
 Wed, 19 Jun 2024 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718793911; x=1750329911;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=WLeiM6qHlpurU5X27OGr3viblzq6YUdCzfxFeOjS52I=;
 b=F/Icuo7zTax4fJBFATjOXGmVSoZ5UlNMebKiOk5uleDVnuIfHbF6fLKj
 +xEKJ4nYxvMSx8wuFTDPsVW4q58hcle8HC1QkkGluf1fnXggsdNrLvxBP
 IU6+xdjvtY8FaadILCDsQsdgT8QPUkBNiGVnXH0qvCTO661ohZxwqKNmU
 70n4I82WUPGn94Mx00kfOAiVwNTr9KUSC3VNSm0aW+LwWf3XUWfUig3gc
 ILE94XRqrj2t8C5MGH/kOGV/sU38C/TPo8tu5P7V+T/ahf6MHiQtGmraj
 jtc6tFb15kg3vW08GG0cTteuyxEC4TCGSg9r8Db6DETKNhrJE1cE2NdxH A==;
X-CSE-ConnectionGUID: FBlI9PerTv2dMAuxBH0L3g==
X-CSE-MsgGUID: 78yqxG/sRJS2lLlWp3uX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="41128918"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="41128918"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:45:09 -0700
X-CSE-ConnectionGUID: 4gS+EuuXTpmkUKJs+eIPQg==
X-CSE-MsgGUID: /eEbU0clQO+R1Jhki7I1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="41969562"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:45:03 -0700
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
Date: Wed, 19 Jun 2024 13:45:00 +0300
Message-ID: <875xu5fbyr.fsf@intel.com>
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

Surprisingly few fixes lately, here's one for joiner+MSO.

drm-intel-fixes-2024-06-19:
drm/i915 fixes for v6.10-rc5:
- Fix conditions for joiner usage, it's not possible with eDP MSO

BR,
Jani.

The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:

  Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-06-19

for you to fetch changes up to 49cc17967be95d64606d5684416ee51eec35e84a:

  drm/i915/mso: using joiner is not possible with eDP MSO (2024-06-17 12:01:01 +0300)

----------------------------------------------------------------
drm/i915 fixes for v6.10-rc5:
- Fix conditions for joiner usage, it's not possible with eDP MSO

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/mso: using joiner is not possible with eDP MSO

 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
Jani Nikula, Intel
