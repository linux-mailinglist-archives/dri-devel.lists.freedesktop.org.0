Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6F873F33
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE90113431;
	Wed,  6 Mar 2024 18:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxLH1Cn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A930113425;
 Wed,  6 Mar 2024 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749930; x=1741285930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zIg4GVdUuYUfyl+sUeMI8sE6rIfLshsrEAeTPIft9xY=;
 b=YxLH1Cn24SaAS7fgvtuKbtFYx3BhDsutHTd0m4IuLMxZG/nsFFgghfDQ
 +Za4yUd1b9ltp4hZ/tqtLRr3Mgdh1NbMgt11OSfii/bv8Mx/xkTNZ5pTF
 TiCjL+Yu0s/PN5bKxEpSVD60Vnb54bOG9/3CPATfy/cUVS/CRd720iioe
 6h+GivwTEsIiE0YKImZVMiscBpSAw/XkI9CCHQQ3JO/8gX/yu5DYfPxZz
 mDgqPhXnUEu3f38eKS4/G403rrrgcfUHR5kdSzrxdNYloHp2fCPu14Hnn
 fEFEa+5t89hqWcaJlQES3gW3HVnNpcE3lctDgNkrAFS/Xb2ObrC4xvi8U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8142913"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8142913"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9709862"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 07/22] drm/crc: make drm_debugfs_crc.h self-contained and fix
 kernel-doc
Date: Wed,  6 Mar 2024 20:31:12 +0200
Message-Id: <290b006bb348a03bd7c4c062d337df21fdaced53.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a number of require includes and forward declare struct
drm_crtc. s/crc/crcs/ kernel-doc to match code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_debugfs_crc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_debugfs_crc.h b/include/drm/drm_debugfs_crc.h
index b225eeb30d05..1b4c98c2f838 100644
--- a/include/drm/drm_debugfs_crc.h
+++ b/include/drm/drm_debugfs_crc.h
@@ -22,13 +22,19 @@
 #ifndef __DRM_DEBUGFS_CRC_H__
 #define __DRM_DEBUGFS_CRC_H__
 
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+struct drm_crtc;
+
 #define DRM_MAX_CRC_NR		10
 
 /**
  * struct drm_crtc_crc_entry - entry describing a frame's content
  * @has_frame_counter: whether the source was able to provide a frame number
  * @frame: number of the frame this CRC is about, if @has_frame_counter is true
- * @crc: array of values that characterize the frame
+ * @crcs: array of values that characterize the frame
  */
 struct drm_crtc_crc_entry {
 	bool has_frame_counter;
-- 
2.39.2

