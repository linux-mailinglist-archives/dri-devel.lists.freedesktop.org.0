Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285304A5A5C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F6410EDC2;
	Tue,  1 Feb 2022 10:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C2F10EDB1;
 Tue,  1 Feb 2022 10:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712151; x=1675248151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4o4AkhShDoypOdFHA9D/PFRHnCxTUR734uCtbyBxi7g=;
 b=kxrPfM4TgqhvuBVG10JPDY8xMGbgJ4xu78HXQD2TwjgtTzNb8QzU4xUT
 6pIAejXO5OUhMiNeMw6aqO8xP7Uz02aGPkGKukweZ4zyJHN60/RwlBWB0
 YISQ3EKOreovD0l87JlaVtsV2tpxQ/u6mgMJ5gkbAzVrQvva3/jSAHJwR
 aEFWt36ZCkfFANfuwTD3vuObJfEFaexs2UUiHtGZQF/5HgNtWQuMZK47c
 p7SnZYMsAlYzlUdQifpbsUzFSaK7zxM03XZTVvEbaQXTV1bvuJzswFH5K
 0ksR++jtW/KcFIVVRIkTDtTh1bt7RZGj5fEKtdHfAmBzcn6snKMtous0C A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020719"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020719"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011421"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:26 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 19/19] Doc/gpu/rfc/i915: i915 DG2 flat-CCS uAPI
Date: Tue,  1 Feb 2022 16:11:32 +0530
Message-Id: <20220201104132.3050-20-ramalingam.c@intel.com>
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

Details of the Flat-CCS getting added as part of DG2 enabling and its
implicit impact on the uAPI.

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
 Documentation/gpu/rfc/i915_dg2.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/rfc/i915_dg2.rst b/Documentation/gpu/rfc/i915_dg2.rst
index f4eb5a219897..9d28b1812bc7 100644
--- a/Documentation/gpu/rfc/i915_dg2.rst
+++ b/Documentation/gpu/rfc/i915_dg2.rst
@@ -23,3 +23,10 @@ handling the 64k page size.
 
 .. kernel-doc:: include/uapi/drm/i915_drm.h
         :functions: drm_i915_gem_create_ext
+
+
+Flat CCS support for lmem
+=========================
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
+        :doc: Flat-CCS - Memory compression for Local memory
-- 
2.20.1

