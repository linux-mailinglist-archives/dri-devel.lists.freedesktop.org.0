Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A684F906356
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 07:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00B310E0D1;
	Thu, 13 Jun 2024 05:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HV9UcMPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F308F10E0BA;
 Thu, 13 Jun 2024 05:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718255673; x=1749791673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mm341tiMN5I5+gsGKHoOStTTQcHsvagZvFREtL06uyg=;
 b=HV9UcMPdLuKx3PTpkVeIIcqO35m79h7VS6s4CZVHtuvbdBzkQknAdhqt
 gRJVuClONCvIVIFW8K1PKvsNSKKf1g3vsKxVKDgnX4+8++26i8CiC/3aL
 kR8VeEa/rz3MOvf+AkKzjWLaSXAyOp7UZcdYLlwuse3ym8uzqA4FtSdJd
 IyxEYZbtAgZ9KWUSJ2t6kiCjfs8XJESVmw/NG8QtI4Dc2WV6pFMvGyhpA
 w8TIqDPqI0c7B4ZBmvN4HFMOuz5O2kMUfk2aP+I+dht9uq6XJs3yBitgA
 dOOwsd0LFHCfbCBM/MGu4NObwjdQnzcrE8RXC/1I5OXLKgPZGFjYr5Eqj A==;
X-CSE-ConnectionGUID: c6WzzHRGSdq3J64/xs2JYw==
X-CSE-MsgGUID: 1z4xw2s0RbeV2oHxgyK/gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14774876"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14774876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 22:13:10 -0700
X-CSE-ConnectionGUID: M746CE4cT1GMVA5Q7A4eeA==
X-CSE-MsgGUID: uH//63J8S7K6fgwbVc5njQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40126100"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 12 Jun 2024 22:13:09 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com, sfr@canb.auug.org.au
Subject: [PATCH 1/2] drm/dp: Describe target_rr_divider in struct drm_dp_as_sdp
Date: Thu, 13 Jun 2024 10:43:16 +0530
Message-ID: <20240613051317.345753-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240613051317.345753-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240613051317.345753-1-mitulkumar.ajitkumar.golani@intel.com>
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

Describe newly added parameter target_rr_divider in struct
drm_dp_as_sdp.

Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ea03e1dd26ba..7f2567fa230d 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
  * @target_rr: Target Refresh
  * @duration_incr_ms: Successive frame duration increase
  * @duration_decr_ms: Successive frame duration decrease
+ * @target_rr_divider: Target refresh rate divider
  * @mode: Adaptive Sync Operation Mode
  */
 struct drm_dp_as_sdp {
-- 
2.45.2

