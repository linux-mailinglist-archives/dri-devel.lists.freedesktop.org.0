Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A525F749868
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512A310E4B2;
	Thu,  6 Jul 2023 09:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857F510E4B2;
 Thu,  6 Jul 2023 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688635753; x=1720171753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iz4AtfRlqgop4iqQoWwYyE7QqcJsjxp9NK4nXTlMKZM=;
 b=cqDu+eJWpMfJw3lUziP4SWgoVH3E8slIfzb+eM+wQKTT/QIE2D3dk2WF
 Zo7gcMVUYzfnYukOjMRcvly8DDkhWnTGX+lmwbNgxUaSiInZEW1aeR7J+
 P2IBRAyU71vuLL2K6qfkJ0hLn3PaJ4NgvGMz1XWYlhGZWq2OhinVtzlq1
 pBrA2OUDha4w410jPmjKslL1tIzVmoct67gsqEbiswCL3ln+cbdw1po5m
 bBZ5ZNUOn6aNkgZTn40QpDbP99xq7umv7RJtRr6DMo2DFozPPx9Jq+/Mm
 q8aRUzVDHDnLPbZ+AsuzjDrfMowmH6BfjtfVcBTG9Fvj8XOaSjauWERkK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427234466"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="427234466"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 02:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="784866861"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="784866861"
Received: from jmvuilla-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.105])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 02:29:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dim-tools@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [drm-rerere] nightly.conf: drop sound tree from drm-tip altogether
Date: Thu,  6 Jul 2023 12:28:50 +0300
Message-Id: <20230706092850.3417782-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We used to have the sound branches be part of drm-tip to help
development of DP and HDMI audio. However, we always used to run into
problems with the sound branches merging Linus' master at non-tagged
random commits, wreaking havoc especially during the merge windows. We
only ever want to have tagged stuff merged back from Linus' tree to
drm-tip.

We introduced a mechanism in dim to hold back branches at certain
commits, just to hold back sound branches when problems arise. We moved
it along, but in the end nobody has updated this in literally years, and
sound branches have been held back at v5.13.

The merge window is currently open, and AFAICT the sound/for-linus
branch again contains commits from the merge window.

Let's just forget about the sound tree, as nobody has really missed it
since v5.13, and focus on the drm branches.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 nightly.conf | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/nightly.conf b/nightly.conf
index 73aec820e98f..c1e22800e276 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -46,11 +46,6 @@ git://anongit.freedesktop.org/drm/drm
 https://anongit.freedesktop.org/git/drm/drm
 https://anongit.freedesktop.org/git/drm/drm.git
 "
-drm_tip_repos[sound-upstream]="
-git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
-https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
-https://kernel.googlesource.com/pub/scm/linux/kernel/git/tiwai/sound.git
-"
 drm_tip_repos[linux-upstream]="
 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
@@ -79,8 +74,6 @@ drm_tip_config=(
 	"drm-intel		drm-intel-next"
 	"drm-intel		drm-intel-gt-next"
 
-	"sound-upstream		for-linus	v5.13"
-	"sound-upstream		for-next	v5.13"
 	"drm-intel		topic/core-for-CI"
 	"drm-misc		topic/i915-ttm"
 	"drm		topic/nouveau-misc"
-- 
2.39.2

