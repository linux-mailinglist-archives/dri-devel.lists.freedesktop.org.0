Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29546F3B4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 20:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BB410E22F;
	Thu,  9 Dec 2021 19:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC51C10E226;
 Thu,  9 Dec 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639077217; x=1670613217;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Ow/YKksX5LK6u3qn+uHd9cd6ijwbKKwS2Wp2CKRY4wY=;
 b=FR0zFuKiDXKWix5hWQeg5eGLDNJPjwOZjjkXSXuvFlqsqIY8wDYY7lhs
 ycF17NSp7CtUf0Kz73Cr8R0LBjIWGEuuSDij+x1b2vDe7DkhdR1HAavmi
 C3IWbG+tcFJW1ORmErX2dHL/rSnuRBVhH43eQPNLm4J1zMXYErHxWjlqi
 NUi5IyAZZ8zmSXRUR9G5/y+aTjW+hxWAHW+4wLyN3U3jcQGX+n6Ga9Pqj
 tqdJifdmsRxG/f3zcrReZnHqhLIxs3zkMQbdjB4noP9vWY4xiaqhxKbhz
 bF/mZ1aDVqFd+zkcAwYZYXa54oc4eIGdlf0tfiX/gUofVriH8Rw6qDIQb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238412557"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="238412557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 11:13:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="516446288"
Received: from mmathpal-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 11:13:31 -0800
Date: Thu, 9 Dec 2021 14:13:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <YbJVWYAd/jeERCYY@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2021-12-09:

A fix to a error pointer dereference in gem_execbuffer and
a fix for GT initialization when GuC/HuC are used on ICL.

Thanks,
Rodrigo.

The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1:

  Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-12-09

for you to fetch changes up to 52255ef662a5d490678fbad64a735f88fcba564d:

  drm/i915/gen11: Moving WAs to icl_gt_workarounds_init() (2021-12-09 08:30:22 -0500)

----------------------------------------------------------------
A fix to a error pointer dereference in gem_execbuffer and
a fix for GT initialization when GuC/HuC are used on ICL.

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915: Fix error pointer dereference in i915_gem_do_execbuffer()

Raviteja Goud Talla (1):
      drm/i915/gen11: Moving WAs to icl_gt_workarounds_init()

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c    | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)
