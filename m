Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CB55ECF0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 20:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C700111B4B7;
	Tue, 28 Jun 2022 18:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91E211B4B7;
 Tue, 28 Jun 2022 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656442048; x=1687978048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GXC8PS9KFq4Tp92Y8v9WqQXSNLZ3bTC0LdtCxzSVQU=;
 b=er8pXB9LTEdVKU3ij4jH5mEXodKUKUyIJQjkeXbp/L61Y839oLjp3kJB
 ZSl1pE600zkrNqDZlBqX5oVPFxX2tZwF0xMEfHCDCZNc41ohpe7iM/QQN
 nvtnHRKPTjLIoVKdIzP/CntIKAk0+ZcQa4r7xuj281QQ6/IqQQ0Dphwop
 lLkDP/TBwAQcITsQp/+rsxnCtGse2TkjGMciO+FX+c+iij9vAkw8hNsSg
 uTkgKrhjkTCAiKS864QTDypLZDwNnmhBU7sM+V4ndq/yLOvjLHn2KCD8c
 RzqiabBdtQe1YikSV2k9K0TCB7j32f/9ijttR7X14ZFq7ubJ+Wh1eFz3+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="282915814"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="282915814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 11:47:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="594908727"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 11:47:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 1/3] drm-tip: 2022y-06m-27d-16h-18m-47s UTC integration manifest
Date: Tue, 28 Jun 2022 11:47:45 -0700
Message-Id: <20220628184747.3844242-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, christian.koenig@amd.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

---
 integration-manifest | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 integration-manifest

diff --git a/integration-manifest b/integration-manifest
new file mode 100644
index 000000000000..baffa2a57cd4
--- /dev/null
+++ b/integration-manifest
@@ -0,0 +1,26 @@
+drm drm-fixes 03c765b0e3b4cb5063276b086c76f7a612856a9a
+	Linux 5.19-rc4
+drm-misc drm-misc-fixes 5f701324c0fb6f9f5aaac3f8d1575321375f6d8f
+	drm/vc4: perfmon: Fix variable dereferenced before check
+drm-intel drm-intel-fixes 79538490fd7ade244dba400923e792519a2bdfea
+	drm/i915: tweak the ordering in cpu_write_needs_clflush
+drm drm-next 805ada63ba0567b15d10d40419bcc5e6f0b461e6
+	Merge tag 'drm-intel-next-2022-06-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
+drm-misc drm-misc-next-fixes 5ee8c8f930ba7d20717c4fc2d9f1ce0e757d1155
+	drm/rockchip: Change register space names in vop2
+drm-intel drm-intel-next-fixes f2906aa863381afb0015a9eb7fefad885d4e5a56
+	Linux 5.19-rc1
+drm-misc drm-misc-next 7d008eecb0cfc2b1a1a742d6faa0a02f339535c2
+	drm/stm: ltdc: update hardware error management
+drm-intel drm-intel-next f7fb92cd2e39357f14846d69ae0e1d8692371f82
+	drm/i915: Move the color stuff under INTEL_INFO->display
+drm-intel drm-intel-gt-next 7d8097073caa334ed6187a964645335324231e01
+	drm/i915: Prefer "XEHP_" prefix for registers
+sound-upstream for-linus 7cf3dead1ad70c72edb03e2d98e1f3dcd332cdb2
+	Linux 5.13
+sound-upstream for-next 7cf3dead1ad70c72edb03e2d98e1f3dcd332cdb2
+	Linux 5.13
+drm-intel topic/core-for-CI f7d7dddaab81eeae4508197b5f38f0b974d97b8c
+	topic/core-for-CI: Add remaining DG2 and ATS-M device IDs
+drm-misc topic/i915-ttm 1e3944578b749449bd7fa6bf0bae4c3d3f5f1733
+	Merge tag 'amd-drm-next-5.16-2021-09-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
-- 
2.36.1

