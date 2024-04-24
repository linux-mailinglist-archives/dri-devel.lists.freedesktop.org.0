Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87088B085C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29C510E686;
	Wed, 24 Apr 2024 11:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fhf/egHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3D410E686;
 Wed, 24 Apr 2024 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713958360; x=1745494360;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=47sVeHBSAv/s07SCe4eUhwmnNLeZch1MfXkLsHn7rSs=;
 b=Fhf/egHjA2T7hZ4CFBW044y3w9yOQPeNawcyNxH1Wthq9hu0xvgyslj6
 qxiFKH18heLJkvvf+RdvAb0BxaRg4xtbVfGgONqrO4RTqd+C4OOV1LC7i
 g618Qrb+jip1zexYVMQpL3/ghC9rucFYaQiePXQ/CpWz/WHOAHg2Ilrsv
 B0ulpjxAE/o1JJBiPN2f4VcuTCdTKZJzVZwUCMlYAypv4BmVejIYNE4jb
 AB5X791lq83D5kreAsT/H7ZWMiDSYgvZjltwllN2JeNEpiFvJEBGJZMC2
 blyZucArhdLcTeWAeOG+D4CTgVl0Rm0fvdxD8pgfaIBOryfp6duucqhnf Q==;
X-CSE-ConnectionGUID: ghM6+0/YT7qnq0oHKHxWiQ==
X-CSE-MsgGUID: h2ezWJNbSAChvKV6AJLByA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="34985150"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="34985150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:32:38 -0700
X-CSE-ConnectionGUID: eble5yl0QxquyC/4nSazdw==
X-CSE-MsgGUID: wo1/MO8wRCK+H7QOqvv8lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="55639692"
Received: from unknown (HELO rknop-desk.ger.corp.intel.com) ([10.217.160.54])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 04:32:37 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] nightly.conf: Update drm-intel URLs,
 add missing bare ssh drm-xe URL
Date: Wed, 24 Apr 2024 13:32:19 +0200
Message-ID: <20240424113218.37162-2-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

- Switch drm-intel URLs to the new GitLab location.
- Add a short SSH link for drm-xe for completeness with other blocks.
- Add a missing tab in drm_tip_config for column alignment.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 nightly.conf | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/nightly.conf b/nightly.conf
index 7ef4249f0c67..2971277b0e25 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -30,10 +30,16 @@ https://anongit.freedesktop.org/git/drm/drm-tip
 https://anongit.freedesktop.org/git/drm/drm-tip.git
 "
 drm_tip_repos[drm-xe]="
+git@gitlab.freedesktop.org:drm/xe/kernel.git
 https://gitlab.freedesktop.org/drm/xe/kernel.git
 ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
 "
 drm_tip_repos[drm-intel]="
+git@gitlab.freedesktop.org:drm/i915/kernel.git
+https://gitlab.freedesktop.org/drm/i915/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
+"
+drm_old_urls[drm-intel]="
 ssh://git.freedesktop.org/git/drm/drm-intel
 ssh://git.freedesktop.org/git/drm-intel
 git://anongit.freedesktop.org/drm/drm-intel
@@ -97,6 +103,6 @@ drm_tip_config=(
 	"drm-xe			drm-xe-next"
 
 	"drm-intel		topic/core-for-CI"
-	"drm-xe		topic/xe-for-CI"
+	"drm-xe			topic/xe-for-CI"
 	"drm-intel		topic/thunderbolt-next"
 ) # DO NOT CHANGE THIS LINE
-- 
2.44.0

