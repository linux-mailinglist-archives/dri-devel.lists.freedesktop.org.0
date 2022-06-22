Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881275545DF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1719911297A;
	Wed, 22 Jun 2022 11:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CFA112970;
 Wed, 22 Jun 2022 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655898622; x=1687434622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7DCJZo179ZL8Q7T4eOOlLWWxLxY1K5Hitxze+FvLZhA=;
 b=VYCb+21W4QzZoiFR1btfoCFvScWbVl7i/3vx9hyzZcoCRmd7yQyjbiy6
 BN9MbsZXg0qdBRQDKdI+1fKMH22pPvaEYz9stQk/NZ5EFd+f5DmGa4B58
 LgSAYhl0LJIlLnlqqt9reUFNn3janspnRZGtwX157lcwtQ5GqHNEXI36h
 A92GRrA1G9tgR4P2olKs0QUfsyg9q5KdU6QwdhUb90kb2YgmWa8+tRufQ
 NrzAajUybauG45mAYM33NPwaEcuheUcbOiSJU+0AV437R5bTUdBlaPdZh
 iiZKQZd10+0Yk9FtTGBAiN4mpBbByfR5NefN2mEOmdsP7PvgBtvTB8f85 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="344385528"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="344385528"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:50:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="914640176"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:50:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 22 Jun 2022 14:50:16 +0300
Message-ID: <87a6a4syrr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

drm-intel-fixes-2022-06-22:
drm/i915 fixes for v5.19-rc4:
- Revert low voltage SKU check removal to fix display issues
- Apply PLL DCO fraction workaround for ADL-S
- Don't show engine classes not present in client fdinfo

BR,
Jani.

The following changes since commit a111daf0c53ae91e71fd2bfe7497862d14132e3e:

  Linux 5.19-rc3 (2022-06-19 15:06:47 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-06-=
22

for you to fetch changes up to c7b28f52f406bc89d15ca0ccbc47994f979f2fcd:

  drm/i915/display: Re-add check for low voltage sku for max dp source rate=
 (2022-06-20 19:39:00 +0300)

----------------------------------------------------------------
drm/i915 fixes for v5.19-rc4:
- Revert low voltage SKU check removal to fix display issues
- Apply PLL DCO fraction workaround for ADL-S
- Don't show engine classes not present in client fdinfo

----------------------------------------------------------------
Jason A. Donenfeld (1):
      drm/i915/display: Re-add check for low voltage sku for max dp source =
rate

Tvrtko Ursulin (1):
      drm/i915/fdinfo: Don't show engine classes not present

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Implement w/a 22010492432 for adl-s

 drivers/gpu/drm/i915/display/intel_dp.c       | 32 +++++++++++++++++++++++=
+---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  4 ++--
 drivers/gpu/drm/i915/i915_drm_client.c        |  5 +++--
 3 files changed, 34 insertions(+), 7 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
