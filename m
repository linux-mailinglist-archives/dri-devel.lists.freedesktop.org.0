Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7B481208
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 12:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B489710EB48;
	Wed, 29 Dec 2021 11:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452210EB44;
 Wed, 29 Dec 2021 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640777446; x=1672313446;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=F6DlwYBDvHY8K0W5xllS09JXkAOQJH6xOR49c1RmqOY=;
 b=iK0/oLfNwfqVeV1FNvkOtrqvUqn5yEcmYXy4dQXAu8zv9Z5SsZehLicn
 U0bjNXo/ReHNPq2AHOpt4i4SbENi/mOoLvVZhvVacSo/I21lJIGfqjsXA
 RTw6mbpKNtSXuwXRL0L3YZE7RFD67jyCoQ+mP6MzZ5rOzoKpNwU+LWyHB
 LxLwthwAwqav+aMC9bkNTgF5L8RChcjqMu/Rk1EP8ilgvOTWsw/y7G57j
 BKy4xbZRoKXZfECJGcqkokp/z8uAWdPrxzgrVwv/nXmpPupw4J+MoYuvk
 x9NU4cy03GnefRtSVVCEoufzRwzSCaOyER+K8NNMFdtCxyE4BjrzrkINS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="228813047"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="228813047"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 03:30:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="523996583"
Received: from jcurran1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 03:30:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 29 Dec 2021 13:30:38 +0200
Message-ID: <87h7ark5r5.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Final i915 fixes for v5.16.

BR,
Jani.

The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:

  Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-12-29

for you to fetch changes up to d46f329a3f6048e04736e86cb13c880645048792:

  drm/i915: Increment composite fence seqno (2021-12-27 11:33:40 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.16:
- Fix possible uninitialized variable
- Fix composite fence seqno icrement on each fence creation

----------------------------------------------------------------
Matthew Brost (2):
      drm/i915: Fix possible uninitialized variable in parallel extension
      drm/i915: Increment composite fence seqno

 drivers/gpu/drm/i915/gem/i915_gem_context.c    | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
