Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4818A05F83
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C8D10EBDA;
	Wed,  8 Jan 2025 15:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md0yDckI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4487B10EBD9;
 Wed,  8 Jan 2025 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736348452; x=1767884452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0RQgGn/xHTboj1I1gML9Z7fypChFsbnDJcqgyggq0Ss=;
 b=Md0yDckIueYK3lu18IjRqRS8yund/bFhgYhSogZz8wZknRW2VfERVrov
 ve4pQpaWFz7vUK3/A1RZ9C3IMG6AV2MBTrGrY7PMVMkVib9FAaryA7PAn
 8ymV0jIr/gjg+UOsVeSDu/lmEZGGdOT66gyYhM242pc5zD73G6t8JWze/
 epaIMWbJFkRpmHXu+HS1ZxFKjLNwoYp9r393tS9yKO7U6nmqLBc2oL8S9
 99GgaMWCOagXHq4CJToANlQRWSTt8KadLVeAi587RLv2XjKk368SIhe8+
 csWKRnDswSF15jb+dOJ60WfSZVHlBTos75FekKS5+1OTow3FgzCnZmrVZ g==;
X-CSE-ConnectionGUID: l+Lt9HIOR0S/8K2fGLk3Rw==
X-CSE-MsgGUID: v4PxRB9fRJy2H6iH3frcYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35805136"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="35805136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:00:52 -0800
X-CSE-ConnectionGUID: L6NKrCrlSAa1qN5Ft/NU/Q==
X-CSE-MsgGUID: mhgzdjThSUiBo76bd4sNwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="103337182"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:00:50 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 2/2] drm/uapi: Adjust uniform spacing
Date: Wed,  8 Jan 2025 20:36:03 +0530
Message-Id: <20250108150603.2995709-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
References: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
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

Extensions in exec queue creation formatted to have uniform
spacing in defines.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 62447f5422d8..868dac05c100 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1108,9 +1108,9 @@ struct drm_xe_vm_bind {
  *
  */
 struct drm_xe_exec_queue_create {
-#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY	0
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE	1
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

