Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5A6143AC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 04:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C76810E2BE;
	Tue,  1 Nov 2022 03:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6B410E0BE;
 Tue,  1 Nov 2022 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667273613; x=1698809613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AXc+XvOpIsum3EgY+WPAeBDegvxWPX62cIoxR6cZjpc=;
 b=dBHF3qw/+jdozLEsXif7QsWZL4CL4GB+ZgCzLY4/gf5NKBbNn456eFCB
 AA/GXGzhsCVyXlhOSgHc4lpHpHA61oTuNP/LxhA5Vlo02kV8let5pzjlt
 iyluMgTC1QNpNeHDEgwAZIx4Hb+fOLpm+KO5X6F0iuXpEM9zWcd3I4w6Z
 OKrhN/q95nE+dAf3i19+u5FGc7HiVCbttbWDeVX3nN1SpwbRNwOA3k07j
 Aiml3Zp+i9rWOSImVkcXB7KswQ+F1YVngAc1J07Am1ypS0BsWlsIeQb3G
 tR5D1azq+AIwoTVjmEpdgHAJwhBP1pvVwpnLeT3qhhbQKvpX4ZayJN3ai A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="307782714"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="307782714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 20:33:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="739193622"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="739193622"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 20:33:30 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] i915/mtl: Enable idle messaging for GSC CS
Date: Tue,  1 Nov 2022 09:06:32 +0530
Message-Id: <20221101033634.1900331-1-badal.nilawar@intel.com>
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
This series depends on: 

https://patchwork.freedesktop.org/patch/509102/

In order to compile this series included 1 patch from above series, 
authored by Daniele Ceraolo Spurio, to this series. 
Please do not review patch 1. Only patch 2 need to be reviewed.
 
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Daniele Ceraolo Spurio (1):
  drm/i915/mtl: add initial definitions for GSC CS

Vinay Belgaumkar (1):
  drm/i915/mtl: Enable Idle Messaging for GSC CS

 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  8 ++++++++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c    | 12 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c  |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  3 +++
 drivers/gpu/drm/i915/i915_reg.h              |  1 +
 6 files changed, 26 insertions(+)

-- 
2.25.1

