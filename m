Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BE633D5F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 14:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A3B10E127;
	Tue, 22 Nov 2022 13:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0A010E127;
 Tue, 22 Nov 2022 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669123043; x=1700659043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xVjCq6D6Fp1SmzLuvEUhutyehepg8yiG9aEJq7JYLLA=;
 b=bbqscu49TzE85KnjfjF1lDV8UwiJ4JmTYImb1DiQSXCPp2rrNddGpazF
 5/Ju8VGIS4hRz5twDsArP03naAd8U35v+xO0DTyXbNoR1v7HK/KthNzzU
 JWmEC+5iZpdx33QBG56VSbCmG0iTeeD0J4Df9bH8hBogXgbzNWGnQSXXu
 CAGv4U0nnTQ+HWY4C2NRO02E7R24ZB5f/mXA9HGc24ajatCOuNso/HLkh
 tn3bnMXVgx5dZ1O2qKswc1gD4GAKnyx2Q3GkbbslgpAoNX0E6cbEzo2Wb
 HMq/eaSChceV9Xgt+Wv2Dy/S3nudRWGRJ0D0Jj4SmMlMgEDwzCiuS5C0u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="312512698"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="312512698"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 05:17:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="766333945"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="766333945"
Received: from sfflynn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.18.151])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 05:17:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dim-tools@lists.freedesktop.org
Subject: [MAINTAINER TOOLS] docs: updated rules for topic/core-for-CI commit
 management
Date: Tue, 22 Nov 2022 15:17:14 +0200
Message-Id: <20221122131714.3443238-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce stricter rules for topic/core-for-CI management. Way too many
commits have been added over the years, with insufficient rationale
recorded in the commit message, and insufficient follow-up with removing
the commits from the topic branch.

New rules:

1. Require maintainer ack for rebase. Have better gating on when rebases
   happen and on which baselines.

2. Require maintainer/committer ack for adding/removing commits. No
   single individual should decide.

3. Require gitlab issues for new commits added. Improve tracking for
   removing the commits.

Also use the stronger "must" for commit message requiring the
justification for the commit being in topic/core-for-CI.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: dim-tools@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drm-tip.rst | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drm-tip.rst b/drm-tip.rst
index deae95cdd2fe..24036e2ef576 100644
--- a/drm-tip.rst
+++ b/drm-tip.rst
@@ -203,11 +203,13 @@ justified exception. The primary goal is to fix issues originating from Linus'
 tree. Issues that would need drm-next or other DRM subsystem tree as baseline
 should be fixed in the offending DRM subsystem tree.
 
-Only rebase the branch if you really know what you're doing. When in doubt, ask
-the maintainers. You'll need to be able to handle any conflicts in non-drm code
-while rebasing.
+Only rebase the branch if you really know what you're doing. You'll need to be
+able to handle any conflicts in non-drm code while rebasing.
 
-Simply drop fixes that are already available in the new baseline.
+Always ask for maintainer ack before rebasing. IRC ack is sufficient.
+
+Simply drop fixes that are already available in the new baseline. Close the
+associated gitlab issue when removing commits.
 
 Force pushing a rebased topic/core-for-CI requires passing the ``--force``
 parameter to git::
@@ -225,11 +227,22 @@ judgement call.
 Only add or remove commits if you really know what you're doing. When in doubt,
 ask the maintainers.
 
-Apply new commits on top with regular push. The commit message needs to explain
-why the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
+Always ask for maintainer/committer ack before adding/removing commits. IRC ack
+is sufficient. Record the ``Acked-by:`` in commits being added.
+
+Apply new commits on top with regular push. The commit message must explain why
+the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
 another subsystem, please reference the commit with ``git cherry-pick -x``
 option. If it's a patch from another subsystem, please reference the patch on
 the mailing list with ``Link:`` tag.
 
+New commits always need an associated gitlab issue for tracking purposes. The
+goal is to have as few commits in topic/core-for-CI as possible, and we need to
+be able to track the progress in making that happen. Reference the issue with
+``References:`` tag. Add the ``core-for-CI`` label to the issue. (Note: Do not
+use ``Closes:`` because the logic here is backwards; the issue is having the
+commit in the branch in the first place.)
+
 Instead of applying reverts, just remove the commit. This implies ``git rebase
--i`` on the current baseline; see directions above.
+-i`` on the current baseline; see directions above. Close the associated gitlab
+issue when removing commits.
-- 
2.34.1

