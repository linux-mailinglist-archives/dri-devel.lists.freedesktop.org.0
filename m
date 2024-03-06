Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED35873F39
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7046113438;
	Wed,  6 Mar 2024 18:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCorpvOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39DB113432;
 Wed,  6 Mar 2024 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749939; x=1741285939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xq9/p/3XxdYm4p2rYJtNEydQpVZ0FF6DFo0mUZC9v6o=;
 b=DCorpvOnGaRLTLnBQdcCePREib5GOrQaUdg7k3MX34iALJfKsvKCCV9v
 4zUBbtPMxy8L1agwJtKn6jdJoQj2/nE7YIvOpYoS8kgbnVGfuOHHyE1cb
 p9bATSw1L5fPFBRtcv47wk4LJHzH0P9T9deGkhYFXSjUVcN5lW6txSHR1
 Ix0DuqZFC4Mlog4SGl7+F3W/c/3BJQrybDUpFdTUvO1J6MhubHpUNPncx
 4PA2kBXk49hQTNPgQ1/ZOaybuJ0CxlpZtwaFsdmf65UqorPDymthfaHKo
 XJ98KJnx6qUNmVC+e/0idZLcTbFlfLWX58lPIDWK1hcnCBY3hmMsI4t7b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15102685"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15102685"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14415778"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 09/22] drm: fix drm_format_helper.h kernel-doc warnings
Date: Wed,  6 Mar 2024 20:31:14 +0200
Message-Id: <6dc5b1df34abc10d416c2db5b390440cf56e21ce.1709749576.git.jani.nikula@intel.com>
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

As the documentation says, all the fields are considered private. Mark
them private also for kernel-doc to silence warnings.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_format_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index f13b34e0b752..428d81afe215 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -25,6 +25,7 @@ struct iosys_map;
  * All fields are considered private.
  */
 struct drm_format_conv_state {
+	/* private: */
 	struct {
 		void *mem;
 		size_t size;
-- 
2.39.2

