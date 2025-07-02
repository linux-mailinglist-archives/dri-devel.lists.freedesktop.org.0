Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4362AF6631
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 01:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8C10E0D0;
	Wed,  2 Jul 2025 23:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlgsLY8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD83210E0D0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751498813; x=1783034813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B1u88xiH7FIo1pO+Sl6RAJTSCqxWrediWQGtW98tHzg=;
 b=XlgsLY8Kh2Hf/uLk7lc44YP+O1wB+coIZ7/YIh2NO/jWwumVS0ZXTOso
 HF5m2oTOs7Y8qIR5+xwmJu6+7LyXHpWAVcpIjFIG7qWt6DqUXK7bZkGAu
 u+ZdWFPXP++xOYvKvoyyBFSZjfofLVPkoitD33WAhkCw8QgCkOhJ1t6UI
 y1+Sk078CIjyxnIxYLe88BH/ghIJU2EOVXAkTGOhPaRBx7AB0k6nPS4DW
 wcJYnKi0/vUxZILcEQPJS73bB7bD0fpY5F5WTwxTIXDmXsMVji71VLy1B
 gqKAzSywEL9ppLi68slb/74oicZ/x4R9dxqYv2cY0yT+lrAeCtGa8xqYQ Q==;
X-CSE-ConnectionGUID: E7MVqylzT26s0RWZYOgr4Q==
X-CSE-MsgGUID: bedb3GlbSGa4QhWPOCwrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52929105"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="52929105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:26:52 -0700
X-CSE-ConnectionGUID: F64ULdYESle522lup9f8Ng==
X-CSE-MsgGUID: 9Ou0fNXyTfeRvINAOTUXjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154350824"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:26:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com
Subject: [PATCH 0/1] Simplify drmm_alloc_ordered_workqueue return
Date: Wed,  2 Jul 2025 16:28:30 -0700
Message-Id: <20250702232831.3271328-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

We want to use drmm_alloc_ordered_workqueue in Xe, let's make this work
a little better.

Matthew Brost (1):
  drm: Simplify drmm_alloc_ordered_workqueue return

 drivers/gpu/drm/vkms/vkms_crtc.c |  2 --
 include/drm/drm_managed.h        | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.34.1

