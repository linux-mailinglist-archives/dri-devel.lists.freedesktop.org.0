Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AB4CA084
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 10:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843A910F2A3;
	Wed,  2 Mar 2022 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB1610F2A3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646212925; x=1677748925;
 h=from:to:cc:subject:date:message-id;
 bh=ndTuMPW8qSvrIdHwFEUlOrI5LO++OiX2ibllYGMaqPQ=;
 b=J/b1YWLuCs94kG74q6xtLKn6+Mt8bw76HDMKyyllUFvjFMKmhQdieVI9
 3LGulxaIZOB8ue5hjHwxzfXlHLFjcW3bLVqWIjHsVi0lHtKICyHsoRRmL
 OWxLlEW/7P6HVXICtjuGF/yJ6RQjsuLoXR4CuT4eEUkMj8W+zQI/z3PqT
 oHehYDV7Uw4ccJgdXuQKzncer8Bp+GtCbmCpZCjjggffZGHUCIRnxiDVz
 g9f4q5kTIxFeFfe1Cs0phOMTjw3LN3pQLk9C7nXEvPC6JNYs/AOzHwRcS
 +R3zNwjD7MSXfkTz0JgaKS+cD3nhvtnEy4m+4HAZa54hA9fqlxHIxqKNK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="252187699"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="252187699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 01:22:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="807011961"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2022 01:22:03 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v4 0/5] enhanced edid driver compatibility
Date: Wed,  2 Mar 2022 17:35:06 +0800
Message-Id: <20220302093511.30299-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to parse multiple CEA extension blocks and HF-EEODB to
extend drm edid driver's capability.

v4: add one more patch to support HF-SCDB

Lee Shawn C (5):
  drm/edid: seek for available CEA block from specific EDID block index
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block
  drm/edid: check for HF-SCDB block

 drivers/gpu/drm/drm_connector.c |   8 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 194 +++++++++++++++++++++++++-------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 164 insertions(+), 47 deletions(-)

-- 
2.17.1

