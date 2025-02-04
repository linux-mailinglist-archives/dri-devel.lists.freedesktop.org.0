Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42608A27226
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80F10E624;
	Tue,  4 Feb 2025 12:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mb6jk1uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E9210E61D;
 Tue,  4 Feb 2025 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738673429; x=1770209429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dw3H+PCjTstMENJ+I15n94rf80OW9E0XER+3C1hFJek=;
 b=Mb6jk1uUUUUWnwqHUs+2cAVpCFDTQnVpI6s0tcXAIEClYEOKZI0v2SZf
 EDvqOYK6ibl4ne8F/MLCi/krRnxbqzXmRzEjj07sWBLrsxh5uuhtVGFa0
 ErKHWc7N1wjxhePBSl9z/891yh47hzMYtcb3kRjq5/9aSpWHbIpOI8JrZ
 VDgBdycgZvRgpNtyV3qJ9T2aIsWl8KA8Sa9ABy+TTCrL+dRJ9Brwv0oqB
 0eqRHoD2fqQM6m4eRtIrG0RGXXRCDIMRE8a/UmaTs3ep8wMJC9PNX/idF
 5A+ArxuLAjwcAzcz3MzBlEl9MD4UcDucLa68Lo9C6n2rQ5AhlvM+QuQCq A==;
X-CSE-ConnectionGUID: L4IfOPWjQK6v5vMEvG8fJQ==
X-CSE-MsgGUID: 1NP+L8DmQ0mO1ehDgE9HAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42853162"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42853162"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:50:28 -0800
X-CSE-ConnectionGUID: /rDw7HBbSzK7gwCZNkD5XQ==
X-CSE-MsgGUID: eoSkYDxTQ4+EhEvLiRkxlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111441947"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 04:50:25 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, arun.r.murthy@intel.com,
 ben.kao@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/7] drm/dp: Add eDP 1.5 bit definition
Date: Tue,  4 Feb 2025 18:20:03 +0530
Message-Id: <20250204125009.2609726-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2609726-1-suraj.kandpal@intel.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
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

Add the eDP revision bit value for 1.5.

Spec: eDPv1.5 Table 16-5
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Ben Kao <ben.kao@intel.com>
---
 include/drm/display/drm_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index a6f8b098c56f..76162ad3b152 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -996,6 +996,7 @@
 # define DP_EDP_14			    0x03
 # define DP_EDP_14a                         0x04    /* eDP 1.4a */
 # define DP_EDP_14b                         0x05    /* eDP 1.4b */
+# define DP_EDP_15			    0x06    /* eDP 1.5 */
 
 #define DP_EDP_GENERAL_CAP_1		    0x701
 # define DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP		(1 << 0)
-- 
2.34.1

