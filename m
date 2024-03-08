Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAAC8763C2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 12:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE79113883;
	Fri,  8 Mar 2024 11:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fang5CYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B213D11388F;
 Fri,  8 Mar 2024 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898998; x=1741434998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZ4QfHTH+CICXYP+1epY9WX7JiwgAqcPDAtQdheafXI=;
 b=fang5CYSw+7XncL294xjztfFai3AL2FFofIoiouUNwJjQ3fXI5uB+LIa
 UVCAMghsdbzzWm9HMlNJgvRSfq63dfi/ezf/xbAQbal+2o1xEO+h6W+XU
 sDCD2nwQ5d588brALHSqkZyMoLbRkZfnKcbuOi8ME3I3WEbQd1BvaJ2WW
 3Mk6Nnl5L4fSnGKxW+Avow/YxErT6hg90b+hTo8ZL79T6BuiEDqE5ezFt
 yoU1Pg6mRCgmCnXTlEGqAktbrK3zgva6jFuhqaykkwbaJxRTvpjp2Jv4U
 QTR9rrC6JPCuK2bNQKiEfXgL//ZWC+j4v2Kem1BjCiV2JDe9vND5h34IJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15262300"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15262300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10892643"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:56:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Masahiro Yamada <masahiroy@kernel.org>, lucas.demarchi@intel.com
Subject: [PATCH v2 04/16] drm/i2c: silence ch7006.h and sil164.h kernel-doc
 warnings
Date: Fri,  8 Mar 2024 13:55:42 +0200
Message-Id: <ffc58be256d71e6a98eb9f13337add64458d3476.1709898638.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
References: <cover.1709898638.git.jani.nikula@intel.com>
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

