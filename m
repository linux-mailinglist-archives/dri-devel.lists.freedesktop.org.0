Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA952E475
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 07:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06FC11B257;
	Fri, 20 May 2022 05:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E8811B257;
 Fri, 20 May 2022 05:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653025457; x=1684561457;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=AeJ3MjFKN/wjXXZTYpdl90oq2PK3OEXdCdRO2O/w3rE=;
 b=Roz7joE9tPzxinb/5f3MUNYGTdoebjbvXHTqn5krUvRmsY6psEqcR5sE
 eHaJMZyotYgURD8wierRNhwCT0nQkx0/eVlQ/k1f9Hhv5t4VigPd/OH5n
 VTo1jfdeWSCt2Gbcm/QvPc/4cwdqEZWiIULXlSyv29eBVhbdmjI/IBy//
 z4CcGRYkqxDZ6OZ7pz4sWPOS9igEJ6NzwXlZzFonTVaPi5MDog9IDTQBI
 yeYbeItiDCOXuK0xRn6HFwKo5KPHbuZBsJUIEO/Xe/C9pZBR+a2kIsWzX
 cY26vG75sfEQowyN04ywxstDPRb0Mi733grPS939o6/f5fjXklecleOr0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297807626"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="297807626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 22:44:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="599025483"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.49])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 22:44:12 -0700
Date: Fri, 20 May 2022 08:44:10 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YocqqvG6PbYx3QgJ@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave & Daniel,

Here's the previous PR + additional fix for regression #5806: GPU hangs
and display artifacts on 5.18-rc3 on Intel GM45.

Was also discussed here:

https://lore.kernel.org/all/CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com/

Regards, Joonas

***

drm-intel-fixes-2022-05-20:

- Previous PR + fix for #5806: GPU hangs and display artifacts on 5.18-rc3 on Intel GM45

The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-05-20

for you to fetch changes up to 7b1d6924f27ba24b9e47abb9bd53d0bbc430a835:

  drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap (2022-05-19 12:49:49 +0300)

----------------------------------------------------------------
- Previous PR + fix for #5806: GPU hangs and display artifacts on 5.18-rc3 on Intel GM45

----------------------------------------------------------------
Anusha Srivatsa (1):
      drm/i915/dmc: Add MMIO range restrictions

Maarten Lankhorst (1):
      drm/i915: Use i915_gem_object_ggtt_pin_ww for reloc_iomap

Umesh Nerlige Ramappa (1):
      i915/guc/reset: Make __guc_reset_context aware of guilty engines

 drivers/gpu/drm/i915/display/intel_dmc.c          | 44 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++--
 drivers/gpu/drm/i915/gt/intel_reset.c             |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 16 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h             |  2 +-
 drivers/gpu/drm/i915/i915_reg.h                   | 16 +++++++++
 8 files changed, 74 insertions(+), 16 deletions(-)
