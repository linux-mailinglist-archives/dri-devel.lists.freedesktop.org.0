Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 746636044A9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 14:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9628610F20B;
	Wed, 19 Oct 2022 12:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6CE10E084;
 Wed, 19 Oct 2022 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666181464; x=1697717464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CMOGwZfV7yEA5V1w+FNEKUn6td5/3pSil/0W3zfVFww=;
 b=cnjIfmTaos0Tl6nrWTidiX94fIxF6ELvcTVcD2r1xnn0i5VMFRNYgcXn
 RnMynIzRBhCg5Nh0N67pa8bleZE9qOVaR0opaXUcAye8ZfiW3MLooKwsC
 DDQUpajeh1EATqkHEXjZFBjjyj9DWnebPsTB0h6NWUJ1ljOi1y+h07+dg
 3YWRJAjuKW/kvsJ2ejuBxWe11YEqJ2u3HlumPr9p9lGiI5s4D8dbFgAiN
 S4lYO/PGPfrizl8toZa5fzPk9Mrpt94YB5vwQYxq7+b9QOjN9UsIO6TNd
 k3YYZ22fmv2Zt6+ztvZf8p4qPBODKiHrR1/HyL2ac/g60KO5clxd2BEzR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392692140"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="392692140"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:10:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874405204"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="874405204"
Received: from mjmcener-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.213.233.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 05:10:13 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Selftest fixes for 6.1
Date: Wed, 19 Oct 2022 13:10:05 +0100
Message-Id: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Warning - not much tested, mainly bypassing trybot for quick turnaround.

Tvrtko Ursulin (2):
  drm/i915/selftests: Fix waiting for threads to start
  drm/i915/selftests: Fix selftests for 6.1 kthread_stop semantics

 .../drm/i915/gem/selftests/i915_gem_context.c |   9 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  13 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   5 +-
 drivers/gpu/drm/i915/i915_selftest.h          |  14 ++
 drivers/gpu/drm/i915/selftests/i915_request.c | 136 ++++++++++++------
 .../gpu/drm/i915/selftests/i915_selftest.c    |  18 +++
 6 files changed, 140 insertions(+), 55 deletions(-)

-- 
2.34.1

