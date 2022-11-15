Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C9629AD0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF0510E3F5;
	Tue, 15 Nov 2022 13:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640DC10E066;
 Tue, 15 Nov 2022 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668519658; x=1700055658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yd3D4SscJPI1LXUfhgoCCZjskbGJq0CbXZXT2tgTDrs=;
 b=ALXtdvlAjjOJ/xhaj8EdakhS0gzKGNrvO7vYGBHt2tOH0Suus2OoOp5V
 QxZunY+IPSoKnogSxYa/zT/Zd/TyJ7X2sRWz66Nz7Q8/C1WAc9qPffZRo
 5I+2AHcjQ5otXBfAB66CxeaVas7Jrzr5pjpiUYoychFfmfwIDpJczne+U
 S49cqA7tTND1wrRkEsEuUrAaEZRRTsYDR/qPIlFUvsOxSsLCG/Ba4I5Dz
 aHBMEWi+ozlbsd7dBLd0jNQOfGpnFdn3YatqqCe/jHVDrD/zfdX4KQIBr
 l9Ld87KiNUPSMHOh6wa2VGLOgGVFcMsU3i3kOsu/X/9Kfd946PQtia2/V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="314062523"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="314062523"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 05:40:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="744595369"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="744595369"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 05:40:54 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] i915/mtl: Enable idle messaging for GSC CS
Date: Tue, 15 Nov 2022 19:14:39 +0530
Message-Id: <20221115134440.3669021-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: radhakrishna.sripada@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes code change to enable idle messaging for GSC CS.

v2:
 - Dropped dependency patch and rebased
 - Fixed review comments

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (1):
  drm/i915/mtl: Enable Idle Messaging for GSC CS

 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
 2 files changed, 22 insertions(+)

-- 
2.25.1

