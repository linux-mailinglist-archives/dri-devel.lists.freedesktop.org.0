Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D948D4A0060
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C8B10E61F;
	Fri, 28 Jan 2022 18:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B511710E5CB;
 Fri, 28 Jan 2022 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643395931; x=1674931931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C4/ovlN5bCorr8fYPVEkw6UalBNI4aCe1cMZU6+ijdU=;
 b=IcoC/oLyUZTCrVUZOhq9wiWCiKI2tXmegu4p8n/1IlzYS6QbdblmJunV
 /DHRt6g8A+QvbqIFeyVcvZZPruTJcr1Zoh26fPuaxb0pPjiTqrG96Rzfq
 qppm/+w0v1H639kEZrIMhD3wVAYo8BuYy2leaK8Q12yzJUO0hg4Edv3U5
 GrdikYl3MeBWQ+j+Iwu2YJRfO9dQFaHDHD1y8IcCaggm/in9T4M2KMoRe
 bF5mAaDv/JFnA9Oz5uNXWn8i1gMb/EpAkn9J5AIWRAXLtj68xBa18qgUn
 rzwtGtfjl0Fs+vYvt7oYXz6RjfGxePk9BpmZBkQYALcWbHNJyJYuB2lSm A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310490178"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="310490178"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="625718006"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:52:06 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/5] Misc DG2 enabling patches
Date: Sat, 29 Jan 2022 00:22:04 +0530
Message-Id: <20220128185209.18077-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assorted DG2 enabling patches.

Bruce Chang (1):
  drm/i915/dg2: Add Wa_22011100796

Ramalingam C (3):
  drm/i915/dg2: Add Wa_22011450934
  drm/i915: align the plane_vma to min_page_size of stolen mem
  drm/i915: More gt idling time with guc submission

Stuart Summers (1):
  drm/i915/guc: Allow user to override driver load failure without GuC

 .../drm/i915/display/intel_plane_initial.c    |  5 ++--
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c         |  9 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 17 +++++++++--
 drivers/gpu/drm/i915/i915_params.h            |  1 +
 drivers/gpu/drm/i915/i915_reg.h               |  4 +++
 .../gpu/drm/i915/selftests/igt_flush_test.c   |  2 +-
 7 files changed, 61 insertions(+), 5 deletions(-)

-- 
2.20.1

