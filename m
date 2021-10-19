Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15F4332FF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 12:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123526E14D;
	Tue, 19 Oct 2021 10:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB816E14C;
 Tue, 19 Oct 2021 10:00:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="209267753"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="209267753"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 03:00:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="494027614"
Received: from jsanz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.211.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 03:00:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] topic/drm-dp-training-delay-helpers for drm-misc-next and
 drm-intel-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 19 Oct 2021 12:59:57 +0300
Message-ID: <878ryps5b6.fsf@intel.com>
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


Hi all -

These are the drm dp helpers for figuring out link training delays, to
be pulled to both drm-misc-next and drm-intel-next.


topic/drm-dp-training-delay-helpers-2021-10-19:
Core Changes:
- drm dp helpers for figuring out link training delays

BR,
Jani.

The following changes since commit 9962601ca5719050906915c3c33a63744ac7b15c:

  drm/bridge: dw-hdmi-cec: Make use of the helper function devm_add_action_or_reset() (2021-10-06 11:21:46 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/topic/drm-dp-training-delay-helpers-2021-10-19

for you to fetch changes up to 02ed47aa6cc697fc34053c011fe72984a86273cb:

  drm/dp: reuse the 8b/10b link training delay helpers (2021-10-19 11:30:27 +0300)

----------------------------------------------------------------
Core Changes:
- drm dp helpers for figuring out link training delays

----------------------------------------------------------------
Jani Nikula (2):
      drm/dp: add helpers to read link training delays
      drm/dp: reuse the 8b/10b link training delay helpers

 drivers/gpu/drm/drm_dp_helper.c | 153 +++++++++++++++++++++++++++++++++++-----
 include/drm/drm_dp_helper.h     |  21 +++++-
 2 files changed, 154 insertions(+), 20 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
