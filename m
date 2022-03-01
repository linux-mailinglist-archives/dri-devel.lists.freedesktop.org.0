Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6BF4C85B7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90B10E3DE;
	Tue,  1 Mar 2022 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380610E1A5
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646121567; x=1677657567;
 h=from:to:cc:subject:date:message-id;
 bh=/UQKlVECfwYVCbvCg8JbACLHpY/d3fgMwgeRtTWM/O8=;
 b=IUE0keUNJgPPUL8l1jDuBLH8GYMqBhIOspwCiqCDSkev2qT2Ocl1IiIQ
 sjIELKG1maqXQl2VVkzIa/QuSv0pXifY0+IaX3o9b+wCqUu5bSWXsQUzJ
 b/ZQIp6bdW8hjPortWf/aYHhUcD9hSARtMt6zJOCBOYe+nZkfpAXXWzD6
 JaaQaoo2OOeeeLFPcMpaMG8cFX53d4wkLzvN5jxi6/DH7vltCNkq2Tlep
 vefO21dg6aQ0JT4g+irxwq+AFn8Wb5AfLbUj5tj4YLVjLIqKXf349zgv0
 2a8lJq6h70nvpILSMQifece7Hu4CsbxKNMrJkPv5ujGk1RmB7DRGRZ1HW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316295286"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="316295286"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="593512475"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 23:59:24 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v2 0/4] enhanced edid driver compatibility
Date: Tue,  1 Mar 2022 16:12:12 +0800
Message-Id: <20220301081216.20368-1-shawn.c.lee@intel.com>
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

Lee Shawn C (4):
  drm/edid: seek for available CEA block from specific EDID block index
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block

 drivers/gpu/drm/drm_connector.c |   8 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 200 ++++++++++++++++++++++----------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 152 insertions(+), 65 deletions(-)

-- 
2.31.1

