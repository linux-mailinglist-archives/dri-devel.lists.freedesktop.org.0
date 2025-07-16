Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B57B06F3D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEF210E6C9;
	Wed, 16 Jul 2025 07:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dghhNHX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159610E6C4;
 Wed, 16 Jul 2025 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752651744; x=1784187744;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=7G9uOyZ3juMdF5Us7PxsVozhy5f19mL67f2MlcNn8wM=;
 b=dghhNHX99vNDfE4AcWSD6SUuti/B2SHKwZD+Mu/ITUedTNJd2nSZLMLQ
 6hc8SMruGTFSZZeQQuco0msidaKdxk/LTBq0vFnhvkeTO9uKUk7JwG60S
 Rtfq8zJI9r3M97yr1s6VcFED1Bc2o1vvF+YwEiQPg78ZBLz7cAzlhRJ2s
 x93MVhocCtZdOj36zBxnHs9U8RPFyIuxGg97DKtC1PnV0qR2c4Bt3PZXf
 OE7UZfoSoNsmXYRVMvfWK+jwXKaO5/gRhICxpqiNcbL5Z0eqd3ym/XTJw
 v0sr/454Uaxv1mdho+SvpGST3RIfMxWEaN1T3C4Bmrhvg+O7NsjO0zUt7 A==;
X-CSE-ConnectionGUID: aL7tAhtHTZ6VhSclzaXAuA==
X-CSE-MsgGUID: gfSePt/OT3WHpXoqxL47rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54761009"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54761009"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 00:42:24 -0700
X-CSE-ConnectionGUID: ZmZTSw6BRfGGQ5iW+8iiaA==
X-CSE-MsgGUID: 0sM1Al9pTZq/8C7/5VDaQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="156832703"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.143])
 ([10.245.245.143])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 00:42:20 -0700
Message-ID: <ee784a3a-30b4-489a-8503-b1be3b09268c@linux.intel.com>
Date: Wed, 16 Jul 2025 09:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Dave, Simona,

Another pull request.

Best regards,
~Maarten

drm-misc-fixes-2025-07-16:
drm-misc-fixes for v6.16 final?:
- nouveau ioctl validation fix.
- panfrost scheduler bug.
The following changes since commit bd46cece51a36ef088f22ef0416ac13b0a46d5b0:

  drm/gem: Fix race in drm_gem_handle_create_tail() (2025-07-09 15:53:34 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-07-16

for you to fetch changes up to cb345f954eacd162601e7d07ca2f0f0a17b54ee3:

  drm/panfrost: Fix scheduler workqueue bug (2025-07-14 16:49:10 +0100)

----------------------------------------------------------------
drm-misc-fixes for v6.16 final?:
- nouveau ioctl validation fix.
- panfrost scheduler bug.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/nouveau: check ioctl command codes better

Philipp Stanner (1):
      drm/panfrost: Fix scheduler workqueue bug

 drivers/gpu/drm/nouveau/nouveau_drm.c   | 11 +++++------
 drivers/gpu/drm/panfrost/panfrost_job.c |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)
