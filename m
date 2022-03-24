Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B54E63F7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 14:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DE410E8FA;
	Thu, 24 Mar 2022 13:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7FC10E8EE;
 Thu, 24 Mar 2022 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648127902; x=1679663902;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=/Ge5qoAYL0DMnInyAQpE16P3Fi3SRbqklwnBLGm8RtY=;
 b=nxzGHNBgr18PUkRCFtU7YzHjzLaYO4WceESpWAJpQaAA7Rq5UYeQDFHq
 2cDDABzIgYilSS9s9phHJBLC71lT8s2NO1zY7h3PBHLEnioBlyDPjlRzL
 HKHYPNMYr1b1KZbyXxOsuR0P54aWpf/jzYDchcwXr1MoSSvIbTG4E++6/
 VT0lD5ZEE2IeRci1ZG3aL9hRA7ly+3Aau8DYPn0Q+vezLbD8GKZXDbBc5
 cFBAtQFY2YD0lmjcXCGLj0MOjboIS+wVZKOnpFKDFWoPS0oj0gau+qGqX
 bWyf94DSkvdafnc14Y68m5WOPvNHQ5SSwdC3ksruWvCupTl6aXmu6wVU7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="321572487"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="321572487"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 06:18:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="544641253"
Received: from agalan1-mobl1.ger.corp.intel.com (HELO [10.252.61.111])
 ([10.252.61.111])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 06:18:14 -0700
Message-ID: <fafe7517-fb98-4992-e059-88429ac488bc@linux.intel.com>
Date: Thu, 24 Mar 2022 14:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous pull request tag was botched due to my key expiring, updated!

drm-misc-next-fixes-2022-03-24-1:
drm-misc-next-fixes for v5.18-rc1:
- Make audio and color plane support checking only happen
  when a CEA extension block is found.
- Fix a small regression from ttm_resource_fini()
- Small selftest fix.
The following changes since commit f6d790e5a7fe42706756c7fa1686d08d230610fc:

  Merge tag 'drm-intel-next-fixes-2022-03-10' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-03-11 13:27:00 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-03-24-1

for you to fetch changes up to 7344bad7fb6daa4877a1c064b52c7d5f9182c41b:

  drm/edid: fix CEA extension byte #3 parsing (2022-03-24 11:41:14 +0200)

----------------------------------------------------------------
drm-misc-next-fixes for v5.18-rc1:
- Make audio and color plane support checking only happen
  when a CEA extension block is found.
- Fix a small regression from ttm_resource_fini()
- Small selftest fix.

----------------------------------------------------------------
Cooper Chiou (1):
      drm/edid: check basic audio support on CEA extension block

Jani Nikula (1):
      drm/edid: fix CEA extension byte #3 parsing

Nathan Chancellor (1):
      drm/selftest: plane_helper: Put test structures in static storage

Zack Rusin (1):
      drm/ttm: Fix a kernel oops due to an invalid read

 drivers/gpu/drm/drm_edid.c                        | 15 ++++++++++-----
 drivers/gpu/drm/selftests/test-drm_plane_helper.c |  8 ++++----
 drivers/gpu/drm/ttm/ttm_range_manager.c           |  2 +-
 3 files changed, 15 insertions(+), 10 deletions(-)
