Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554C46EFB0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CB610ECAF;
	Thu,  9 Dec 2021 16:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0A5891DD;
 Thu,  9 Dec 2021 15:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064818; x=1670600818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L2Hbm0AXNsu1t3eNcZY304Dflr8gpsGAkaCW3gW7Nec=;
 b=hjkhN77JbzHVRv8r99ifHlyJAxcW9SyBp5AVQif5fy9OUmVDKKqf+ZLW
 dT3OqnX9diUqH3ftZ/5AwsQ68BTZgIzxgJsRGeG+OkdT+RUpFXMqLUgOu
 iVYnGr0RSI8G0fFHg+kVAoPRIib5VQTrvtXpHDROBRl7kmAeCVcN2jQXP
 y6D07oiowg8/TMJ6RGTFvdPbaRHkh1UWT+auZyReSyncYNYcUc1C2H1bc
 tSmFiECgvnNHIOES6bE6Zj0zDq7HlfpqK9nNZCBMB1Mhd4pBCzifVcZ3P
 U61wEPcSJDt2QqvPjIwqwzJOl9oSRYYROqHVOvcJUX40W9rcQS+7XxW1j g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298917239"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298917239"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535285"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:35 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 16/16] Doc/gpu/rfc/i915: i915 DG2 uAPI
Date: Thu,  9 Dec 2021 21:15:33 +0530
Message-Id: <20211209154533.4084-17-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
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
 Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Details of the new features getting added as part of DG2 enabling and their
implicit impact on the uAPI.

v2: improvised the Flat-CCS documentation [Danvet & CQ]

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
 Documentation/gpu/rfc/i915_dg2.rst | 32 ++++++++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst    |  3 +++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_dg2.rst

diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
new file mode 100644
index 000000000000..9d28b1812bc7
--- /dev/null
+++ b/Documentation/gpu/rfc/i915_dg2.rst
@@ -0,0 +1,32 @@
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
+
+
+Flat CCS support for lmem
+=========================
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
+        :doc: Flat-CCS - Memory compression for Local memory
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

