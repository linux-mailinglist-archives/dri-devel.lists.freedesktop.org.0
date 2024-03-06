Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D456873F46
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB22A113430;
	Wed,  6 Mar 2024 18:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akou1VCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AB611343F;
 Wed,  6 Mar 2024 18:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749960; x=1741285960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZ4QfHTH+CICXYP+1epY9WX7JiwgAqcPDAtQdheafXI=;
 b=akou1VCGhgwFJ6tILjOojDhhgbSjLpH2Lkn2KZz5VwLeyRDXMSQketbx
 2/+veZorey/OhAkXv9znK4kKIaQwS+Q6bzxUXrN5LlBxUqUWcBWJW4mbb
 NLB9pPpZVJweW21opUIJKZlBdFSgAF+Dy79BbogiR5B+6qCE3rRIUwomg
 TV7bm4ZhASNB9YBiuTjbxnUgBjFtXVALPvJFLaEKIOJ0nx3HTDrwJk2mv
 7VphL48G3GsFQfkgnX7yWaMWcWzqwS6HxEj4yc79WwwO8wg202s5Yhuxb
 rNlXTQQnxLqm+Os+P1f7avMxZSYIdRwst+1UxsDeZ02hGPQkAmKdd3yOB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8195762"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8195762"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14496641"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 13/22] drm/i2c: silence ch7006.h and sil164.h kernel-doc
 warnings
Date: Wed,  6 Mar 2024 20:31:18 +0200
Message-Id: <5af7d2472cefde12541d0a2e2a9d4ce187e044dd.1709749576.git.jani.nikula@intel.com>
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

Mark some members private to silence kernel-doc warnings, and add FIXME
comments.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/i2c/ch7006.h | 1 +
 include/drm/i2c/sil164.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/drm/i2c/ch7006.h b/include/drm/i2c/ch7006.h
index 8390b437a1f8..5305b9797f93 100644
--- a/include/drm/i2c/ch7006.h
+++ b/include/drm/i2c/ch7006.h
@@ -37,6 +37,7 @@
  * meaning.
  */
 struct ch7006_encoder_params {
+	/* private: FIXME: document the members */
 	enum {
 		CH7006_FORMAT_RGB16 = 0,
 		CH7006_FORMAT_YCrCb24m16,
diff --git a/include/drm/i2c/sil164.h b/include/drm/i2c/sil164.h
index 205e27384c83..ddf248693c8b 100644
--- a/include/drm/i2c/sil164.h
+++ b/include/drm/i2c/sil164.h
@@ -36,6 +36,7 @@
  * See "http://www.siliconimage.com/docs/SiI-DS-0021-E-164.pdf".
  */
 struct sil164_encoder_params {
+	/* private: FIXME: document the members */
 	enum {
 		SIL164_INPUT_EDGE_FALLING = 0,
 		SIL164_INPUT_EDGE_RISING
-- 
2.39.2

