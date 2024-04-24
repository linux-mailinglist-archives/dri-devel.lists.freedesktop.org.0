Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C253A8B087A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE62113A8C;
	Wed, 24 Apr 2024 11:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7eAt8ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17530113A8B;
 Wed, 24 Apr 2024 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713958929; x=1745494929;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MjNSo6byudOvIh5r7lIWbPvCjdhgXbJD25RwwXl6T1I=;
 b=L7eAt8ku5jxctXEbsJpPJF7mxpkGMuF6SNcZwxDtg2uxWqlvPIp9r84U
 HLv63ygkLkKiPq4jf6hRdhzO2PPf7lumTORMfqZPT7AtapEYSo4BIrJc1
 u3F2WU7GOYqK/p3c8fqRRh8IzL2ZfU9z7eFpw5mlenIvby9hYNHq62iJh
 ARASPeaT+mEZzzeti13cITc+Fg/E/Tveg4UISE14QP0EKOK5k/yk02cu9
 8qdaT59Ow2PP4n+UiCazmm+cD6czHKC+HJI8oPkGIbMD11HomG7PyVPi7
 0QfkOl51BU2I5WfawqB87NpJFm9zjlyxV5zlwsq76bXVt4Wjt8a7BprQN A==;
X-CSE-ConnectionGUID: 0by3XgtYSjuWkV0Y8fCp1w==
X-CSE-MsgGUID: c6hwhyAvTdCUzFPz3ujqAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27098667"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="27098667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:42:08 -0700
X-CSE-ConnectionGUID: F3xs/mRbRUis9xdddTQm7Q==
X-CSE-MsgGUID: CgRv3EzcQeOFUyhliS5t9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="25135731"
Received: from unknown (HELO rknop-desk.ger.corp.intel.com) ([10.217.160.54])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 04:42:08 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Move the drm-intel repo location to fd.o GitLab
Date: Wed, 24 Apr 2024 13:41:59 +0200
Message-ID: <20240424114159.38719-1-ryszard.knop@intel.com>
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

The drm-intel repo is moving from the classic fd.o git host to GitLab.
Update its location with a URL matching other fd.o GitLab kernel trees.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6327dc12cb1..fbf7371a0bb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10854,7 +10854,7 @@ W:	https://drm.pages.freedesktop.org/intel-docs/
 Q:	http://patchwork.freedesktop.org/project/intel-gfx/
 B:	https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
 C:	irc://irc.oftc.net/intel-gfx
-T:	git git://anongit.freedesktop.org/drm-intel
+T:	git https://gitlab.freedesktop.org/drm/i915/kernel.git
 F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
 F:	drivers/gpu/drm/ci/xfails/i915*
-- 
2.44.0

