Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A129873F2F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B713511342C;
	Wed,  6 Mar 2024 18:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSUS1APT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC469113425;
 Wed,  6 Mar 2024 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749930; x=1741285930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=inSQ7TSWN38kmHtWOUekiOVb/4F+FFOvBhg2a4irNmI=;
 b=dSUS1APTgFZwzRS3xSEinn5cMCc9H7ehxolP9d2oNGuCI/vxpY0JFXvk
 sbFH0TEK8bPhy/8krzI2dSPf/ukB/pBVnLA76i7Q1hBExZUWIxxcpC+Ak
 OHvmutqcWZWYvaS5OKmPlA+U5P+v17Lxyw6eyvPkD2VFZN8TKJqjGwaGM
 zynCkJfK+AIOs0cAtY3ZnX5zs9bu8UTMbVIjj/GXjqTM67veSrd8r4z3O
 6hrUmf0pDBieOTYyJqjnpUtaR+nEeyMS2dwkA2i1PuOjUd7toCSopuD/O
 3sNp+BarCiR0VTtiWjp/o2hMNYV/NlsjZE/VGZFOmnsnXb2rvw3I9M9eN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8142905"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8142905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9709850"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:32:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 06/22] drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
Date: Wed,  6 Mar 2024 20:31:11 +0200
Message-Id: <606eee280718ba372093fdebbda42c7581dbd827.1709749576.git.jani.nikula@intel.com>
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

Drop excess vcpi member documentation.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/display/drm_dp_mst_helper.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 9b19d8bd520a..3ae88a383a41 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -83,7 +83,6 @@ struct drm_dp_mst_branch;
  * @passthrough_aux: parent aux to which DSC pass-through requests should be
  * sent, only set if DSC pass-through is possible.
  * @parent: branch device parent of this port
- * @vcpi: Virtual Channel Payload info for this port.
  * @connector: DRM connector this port is connected to. Protected by
  * &drm_dp_mst_topology_mgr.base.lock.
  * @mgr: topology manager this port lives under.
-- 
2.39.2

