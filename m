Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07C47D305
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 14:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2010EA3C;
	Wed, 22 Dec 2021 13:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B537F10EA3C;
 Wed, 22 Dec 2021 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640179768; x=1671715768;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=F+K0F9JKAJ6N/49z7Bherm2NsvgOcnRWUrL+xw/KfUA=;
 b=QHrS+dBX3uYr8I/7WL+HrznAaqoLnoNMV5xYO9gNqAKpYV39ail7+I3E
 60aXTqsca4tGba2P+3Ev91h2CzufrFdqSVBMP6VSB6LtjnjqC33mVof4T
 C/Hg7Wqdx4odeR8r7u3LdELJ2rqIkOeXvhXqWXCp47Bu1rKx98B26vdbv
 5RUykK2LBPt+0GHQcyhRhmjs27WNLfNgkuZXrEWB7lrs58Gvr1pB6TVyD
 MlUxFmdrBU4CrKdBxy2Cav1jVIQcRm1mGpmv9mluHHXUDLgdI+rYGkUAD
 wrQ1l7crqwD0fkLI7bJmqeDihAprSDY0i9WNrpyvfTsoJQ2Tz80dbfqOQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240421228"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="240421228"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 05:29:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="613824041"
Received: from aravind2-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.9.217])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 05:29:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 22 Dec 2021 15:29:19 +0200
Message-ID: <87wnjwydhs.fsf@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Ho ho ho!

I don't know if you've been naughty or nice when you get guc submission
locking fixes for christmas, but that's what we have here.


BR,
Jani.

The following changes since commit a7904a538933c525096ca2ccde1e60d0ee62c08e:

  Linux 5.16-rc6 (2021-12-19 14:14:33 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-12-22

for you to fetch changes up to 7807bf28fe02a76bf112916c6b9194f282f5e43c:

  drm/i915/guc: Only assign guc_id.id when stealing guc_id (2021-12-20 13:59:35 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.16-rc7:
- Fix fallout from guc submission locking rework

----------------------------------------------------------------
Matthew Brost (2):
      drm/i915/guc: Use correct context lock when callig clr_context_registered
      drm/i915/guc: Only assign guc_id.id when stealing guc_id

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
