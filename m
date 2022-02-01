Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CB4A5A45
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B866B10E8FB;
	Tue,  1 Feb 2022 10:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B910E8FB;
 Tue,  1 Feb 2022 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712119; x=1675248119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mDruTrmIzqrQfMmaFrIpn+cDbkb7x3Xf0FqTm9LNJnU=;
 b=WZviQmKht90nFIPrmKs2CzARxUGOnL+wu7/VyREDBLUOF+dVbHGdszq8
 rfbOKVg3ieCYr8yWgURSNX6F3UgbR7ZlvKdcF80OczN2fxN2NRa3YAwkO
 p+1fuStFXli8FXFhXMhSw1GAooyVfzcISyDQZNA0D0kRAXVyZpa4RvwHl
 CrSwTO6pCanEkNyQ9+ZLX4fBnmcr7RFodoPbZ3epQ5fD0P8T4LE0UG+YV
 YGpzXBHzhdgMeoa9+bRqw/HktjmAlE5/HglX4VUc2BDJXjWHghI2EEY2p
 SpwXz9MoqA+QYo2bEZ/kDWr89N5XgfJ9xGyV69bryaISQILYYpEmOSyRv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020608"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011217"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:54 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 09/19] Doc/gpu/rfc/i915: i915 DG2 64k pagesize uAPI
Date: Tue,  1 Feb 2022 16:11:22 +0530
Message-Id: <20220201104132.3050-10-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Details of the 64k pagesize support added as part of DG2 enabling and its
implicit impact on the uAPI.

v2: improvised the Flat-CCS documentation [Danvet & CQ]
v3: made only for 64k pagesize support

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Daniel Vetter <daniel.vetter@ffwll.ch>
cc: Matthew Auld <matthew.auld@intel.com>
cc: Simon Ser <contact@emersion.fr>
cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: mesa-dev@lists.freedesktop.org
Cc: Tony Ye <tony.ye@intel.com>
Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
---
 Documentation/gpu/rfc/i915_dg2.rst | 25 +++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst    |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
new file mode 100644
index 000000000000..f4eb5a219897
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_dg2.rst
@@ -0,0 +1,25 @@
+====================
+I915 DG2 RFC Section
+====================
+
+Upstream plan
+=============
+Plan to upstream the DG2 enabling is:
+
+* Merge basic HW enabling for DG2 (Still without pciid)
+* Merge the 64k support for lmem
+* Merge the flat CCS enabling patches
+* Add the pciid for DG2 and enable the DG2 in CI
+
+
+64K page support for lmem
+=========================
+On DG2 hw, local-memory supports minimum GTT page size of 64k only. 4k is not
+supported anymore.
+
+DG2 hw doesn't support the 64k (lmem) and 4k (smem) pages in the same ppgtt
+Page table. Refer the struct drm_i915_gem_create_ext for the implication of
+handling the 64k page size.
+
+.. kernel-doc:: include/uapi/drm/i915_drm.h
+        :functions: drm_i915_gem_create_ext
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 91e93a705230..afb320ed4028 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -20,6 +20,9 @@ host such documentation:
 
     i915_gem_lmem.rst
 
+.. toctree::
+    i915_dg2.rst
+
 .. toctree::
 
     i915_scheduler.rst
-- 
2.20.1

