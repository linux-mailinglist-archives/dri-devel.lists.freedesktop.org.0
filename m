Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258CA80CC6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A18710E6AC;
	Tue,  8 Apr 2025 13:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+D52k5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00710E6AC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744120020; x=1775656020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mujH/imvggpSyItVnTYK6eJLZtSKCN0+0JUOoxCzPDQ=;
 b=P+D52k5EXCj8M0jpyk2x1ZHwDpr51otHfwVVu7l1jLQba3lkDFcuR9G2
 1E8v/efbb7X2X22fxJYPemk0mo66PSyBKhBPjRmjuWvJ3VwpcXI1c14id
 deHTPl8AtDjvN8SpsmMswTd97eFBt0pzTSb/zpic4FQ7wYnAQjZ4MoQgS
 S+y6fNJZwKI/wU9d9hMtMMCyosepHbNFCjKIspZPrhFc06ocw/Jhv7/wa
 0t6cAUkrXioj9dEWaBO3yzoa40SKylaYNgJvMGgbU4+xFZ/teUarhMeCO
 /pERLw3kRP2c0fibapUj1Eh3yMU2VO34QXv9A3k8m2QepKUJw+kJyUKqu A==;
X-CSE-ConnectionGUID: oEeyq4eYQ463PO4Xk6IxnA==
X-CSE-MsgGUID: wT1PBbD+R+qzhWz7qUkDtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45671973"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45671973"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:47:00 -0700
X-CSE-ConnectionGUID: 5K52+9UqR4m1ZnOIHuf5jg==
X-CSE-MsgGUID: tIJcjBQoTDeKafOJL/swjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="151460734"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:47:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH drm-rerere] nightly.conf: Update to ssh.gitlab.freedesktop.org
Date: Tue,  8 Apr 2025 06:46:35 -0700
Message-ID: <20250408134635.43488-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the old url to the old array, and the new one. This will prompt the
user with the following message when `dim updated-branches` is called:

	Update drm to new ssh://git@ssh.gitlab.freedesktop.org/drm/kernel.git? (y/N)

... for each repository it's changing. After that, git should be
configured with the new repositories.

Note that we are taking the opportunity to be explicit on the protocol,
adding the ssh:// and dropping the entry without it. It's clearer and
less entries to maintain.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 nightly.conf | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/nightly.conf b/nightly.conf
index 49abf3fb2a727..17961b5cb4e47 100644
--- a/nightly.conf
+++ b/nightly.conf
@@ -17,11 +17,12 @@ DIM_MIN_VERSION=1
 # dim users may freely choose the remote names and URLs from this list.
 #
 drm_tip_repos[drm-tip]="
-git@gitlab.freedesktop.org:drm/tip.git
+ssh://git@ssh.gitlab.freedesktop.org/drm/tip.git
 https://gitlab.freedesktop.org/drm/tip.git
-ssh://git@gitlab.freedesktop.org/drm/tip.git
 "
 drm_old_urls[drm-tip]="
+git@gitlab.freedesktop.org:drm/tip.git
+ssh://git@gitlab.freedesktop.org/drm/tip.git
 ssh://git.freedesktop.org/git/drm/drm-tip
 ssh://git.freedesktop.org/git/drm-tip
 git://anongit.freedesktop.org/drm/drm-tip
@@ -30,16 +31,20 @@ https://anongit.freedesktop.org/git/drm/drm-tip
 https://anongit.freedesktop.org/git/drm/drm-tip.git
 "
 drm_tip_repos[drm-xe]="
-git@gitlab.freedesktop.org:drm/xe/kernel.git
+ssh://git@ssh.gitlab.freedesktop.org/drm/xe/kernel.git
 https://gitlab.freedesktop.org/drm/xe/kernel.git
+"
+drm_old_urls[drm-xe]="
+git@gitlab.freedesktop.org:drm/xe/kernel.git
 ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
 "
 drm_tip_repos[drm-intel]="
-git@gitlab.freedesktop.org:drm/i915/kernel.git
+ssh://git@ssh.gitlab.freedesktop.org/drm/i915/kernel.git
 https://gitlab.freedesktop.org/drm/i915/kernel.git
-ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
 "
 drm_old_urls[drm-intel]="
+git@gitlab.freedesktop.org:drm/i915/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
 ssh://git.freedesktop.org/git/drm/drm-intel
 ssh://git.freedesktop.org/git/drm-intel
 git://anongit.freedesktop.org/drm/drm-intel
@@ -48,11 +53,12 @@ https://anongit.freedesktop.org/git/drm/drm-intel
 https://anongit.freedesktop.org/git/drm/drm-intel.git
 "
 drm_tip_repos[drm-misc]="
-git@gitlab.freedesktop.org:drm/misc/kernel.git
+ssh://git@ssh.gitlab.freedesktop.org/drm/misc/kernel.git
 https://gitlab.freedesktop.org/drm/misc/kernel.git
-ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git
 "
 drm_old_urls[drm-misc]="
+git@gitlab.freedesktop.org:drm/misc/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git
 ssh://git.freedesktop.org/git/drm/drm-misc
 ssh://git.freedesktop.org/git/drm-misc
 git://anongit.freedesktop.org/drm/drm-misc
@@ -61,11 +67,12 @@ https://anongit.freedesktop.org/git/drm/drm-misc
 https://anongit.freedesktop.org/git/drm/drm-misc.git
 "
 drm_tip_repos[drm]="
-git@gitlab.freedesktop.org:drm/kernel.git
+ssh://git@ssh.gitlab.freedesktop.org/drm/kernel.git
 https://gitlab.freedesktop.org/drm/kernel.git
-ssh://git@gitlab.freedesktop.org/drm/kernel.git
 "
 drm_old_urls[drm]="
+git@gitlab.freedesktop.org:drm/kernel.git
+ssh://git@gitlab.freedesktop.org/drm/kernel.git
 ssh://git.freedesktop.org/git/drm/drm
 git://anongit.freedesktop.org/drm/drm
 https://anongit.freedesktop.org/git/drm/drm
-- 
2.49.0

