Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D5CFE902
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0990410E61D;
	Wed,  7 Jan 2026 15:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g7Yq0isi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346F10E61D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767799631; x=1799335631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vg0/pBsT57sSy4lg74tRrQdS7siKmCwyfAx78i39u3Y=;
 b=g7Yq0isipD6u8xYu81F83vISCE2kVAa3nsgB931+Tun0HvJx0o6Fb+ju
 iS/md9nLg2evIE+TgR7Mu30sQ2wfrhca3VLSq1mFZXUPi58YX4amKdsZy
 ZdzadwcZrtnzSg/AyNSEi22IcDZEtQNJAuEo4cVe8qufZ/b2khcBSSG+z
 LmvxdCSnud77u52FjMOQgg+l3yZfquqr9VUvqLqpPKG2XQLW9b1cBb4Nm
 WIIB97L5a3nmPbsGwgwjwq1+pEVN7FJ+33rI+JwJfJ146xmcnZjuytRg1
 b6LGJ3WMJCRSplF4y+CoQU1apu3UuonnGX9lTpVjP7H5HpmndrtuKMRsl w==;
X-CSE-ConnectionGUID: tkoeocXIQ9yLn6ULn8BtGA==
X-CSE-MsgGUID: NkBFTNxfSDq8O3FekQzQIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69220551"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69220551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:27:11 -0800
X-CSE-ConnectionGUID: +3Ws+UAwRQCdvqqCuPxH6w==
X-CSE-MsgGUID: 17qe8lPaRgu30VHIGsSicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207480504"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:27:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/rockchip: inno-hdmi: make inno_hdmi.h header
 self-contained
Date: Wed,  7 Jan 2026 17:27:04 +0200
Message-ID: <20260107152704.2290146-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Include linux/types.h for u8.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/bridge/inno_hdmi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 8b39655212e2..5bbcaeea94e2 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -6,6 +6,8 @@
 #ifndef __INNO_HDMI__
 #define __INNO_HDMI__
 
+#include <linux/types.h>
+
 struct device;
 struct drm_encoder;
 struct drm_display_mode;
-- 
2.47.3

