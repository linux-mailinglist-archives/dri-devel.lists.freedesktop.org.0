Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A3873F30
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BB0113425;
	Wed,  6 Mar 2024 18:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcdAMlO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F038B113425;
 Wed,  6 Mar 2024 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749929; x=1741285929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k3Tupu6lrF/gGFgg9IJOS4aoBr/jDpfSrhkmXgyUvZI=;
 b=OcdAMlO61GlZv3N1Rh98u6QoSf8A9DQhrSI8uOTST1V+wYFa7/b6C2q9
 NEqwxi0KYA9ogHz3VtYs/XsAxBY8alOUdUgPaPz0GnU2ixWRAUTI0vo/b
 MkxQpmQxv18iqYnMNeTOLSL2+1fEvMVUmaN7Yo+8jGrwA1btIqjYNscor
 tzTMpFU8rZemjTFOe9M68WMeWTe0lDxl/L1IePgOkfVwJ4m8wMXqVYBQu
 dJsi4P8aGsGAeelvghCnE9JyEEY6PNbeNYaBReTWSKuEu312sfEz+pyok
 xLYCZK5iYNPANqXOZ9xJxgj8P/4VxuAmJf1gAzgaZySpZVQ75tHkBEeTK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8142893"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8142893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9709821"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 04/22] drm/amdgpu: make amd_asic_type.h self-contained
Date: Wed,  6 Mar 2024 20:31:09 +0200
Message-Id: <115327b880b69b1c8ad157e5ff7f6b419868fab0.1709749576.git.jani.nikula@intel.com>
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

Include <linux/types.h> for u8.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/amd_asic_type.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/amd_asic_type.h b/include/drm/amd_asic_type.h
index 724c45e3e9a7..9be85b821aa6 100644
--- a/include/drm/amd_asic_type.h
+++ b/include/drm/amd_asic_type.h
@@ -22,6 +22,9 @@
 
 #ifndef __AMD_ASIC_TYPE_H__
 #define __AMD_ASIC_TYPE_H__
+
+#include <linux/types.h>
+
 /*
  * Supported ASIC types
  */
-- 
2.39.2

