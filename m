Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41C43B227
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 14:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACBE89BBE;
	Tue, 26 Oct 2021 12:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C15689B49;
 Tue, 26 Oct 2021 12:18:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="290724767"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="290724767"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 05:18:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="497311502"
Received: from kyarovyx-mobl.ger.corp.intel.com (HELO [10.252.50.18])
 ([10.252.50.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 05:18:00 -0700
Message-ID: <4a133970-ff4b-aa62-d346-b269b1b9236e@linux.intel.com>
Date: Tue, 26 Oct 2021 14:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Dave and Dan,

Last pull request for me for v5.15 I hope.
Out for vacation until the third week of november,
Maxime offered to do the remainder of v5.15.

~Maarten

drm-misc-fixes-2021-10-26:
drm-misc-fixes for v5.15-rc8:
- Fix fence leak in ttm_transfered_destroy.
- Add quirk for Aya Neo 2021
- Reset property count for each drm damage selftest so full run will work correctly.
The following changes since commit 74056092ff415e7e20ce2544689b32ee811c4f0b:

  drm/kmb: Enable ADV bridge after modeset (2021-10-21 11:08:09 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-10-26

for you to fetch changes up to ee71fb6c4d99c51f2d82a32c503c872b7e40e7f7:

  drm/i915/selftests: Properly reset mock object propers for each test (2021-10-22 11:09:45 +0200)

----------------------------------------------------------------
drm-misc-fixes for v5.15-rc8:
- Fix fence leak in ttm_transfered_destroy.
- Add quirk for Aya Neo 2021
- Reset property count for each drm damage selftest so full run will work correctly.

----------------------------------------------------------------
Bryant Mairs (1):
      drm: panel-orientation-quirks: Add quirk for Aya Neo 2021

Christian König (1):
      drm/ttm: fix memleak in ttm_transfered_destroy

Daniel Vetter (1):
      drm/i915/selftests: Properly reset mock object propers for each test

 drivers/gpu/drm/drm_panel_orientation_quirks.c     | 6 ++++++
 drivers/gpu/drm/selftests/test-drm_damage_helper.c | 1 +
 drivers/gpu/drm/ttm/ttm_bo_util.c                  | 1 +
 3 files changed, 8 insertions(+)
