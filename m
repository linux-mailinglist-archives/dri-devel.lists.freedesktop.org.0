Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6188C2754
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A149F10E2C6;
	Fri, 10 May 2024 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eymKtFXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A8410E056;
 Fri, 10 May 2024 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353700; x=1746889700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FKhPcO9l3KyUktfNaUk9yHDhUM0ozVpqmgz3Ue6lRwA=;
 b=eymKtFXA1nfPK1Al+fG/zz297iGKnPX3Zn83+9/hR5sh58FnsiKgCMjt
 LrAhvW+4ewm2h+rAMIEG8iUZWclZC1Q9Cvr1LiAIv2V8eMQ/WwTTXQjbs
 KPzyiK2lcgGiha2McrB9SqerDgh1S4qcMpHYvySYPUsc+XMcnamSBZQOz
 Lj+w71p2abCRuzgPvOncl4OVNIjyG+KQY6DyPLHoEsfnFBUGpEs/FtoqG
 bdxZsI5507i9p4Sdew5zgXiu5+h7sc4zds8zC8CAJ7Pd98jOC2Nkf/C9u
 xm8/PKayOJkGCB4Y090DR99KLYHdH5QAhITE208PiPqhjJ9s6pPxQKmCx g==;
X-CSE-ConnectionGUID: bvd9aZj+QzGNffkRFLKemA==
X-CSE-MsgGUID: B1wYHQSzRVy3RNrNyQrXCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22009771"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="22009771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:19 -0700
X-CSE-ConnectionGUID: Imbt5EvDSsC45bUeRHW/RA==
X-CSE-MsgGUID: gyD4QCM7RReTOdI1nniHeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30204287"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [RESEND 0/6] drm, nouveau/radeon/amdpgu: edid_blob_ptr cleanups
Date: Fri, 10 May 2024 18:08:07 +0300
Message-Id: <cover.1715353572.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I've sent this some moths ago, let's try again...

BR,
Jani.

Jani Nikula (6):
  drm/nouveau: convert to using is_hdmi and has_audio from display info
  drm/radeon: convert to using is_hdmi and has_audio from display info
  drm/radeon: remove radeon_connector_edid() and stop using
    edid_blob_ptr
  drm/amdgpu: remove amdgpu_connector_edid() and stop using
    edid_blob_ptr
  drm/edid: add a helper for EDID sysfs property show
  drm/connector: update edid_blob_ptr documentation

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 16 ---------
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
 drivers/gpu/drm/drm_crtc_internal.h           |  2 ++
 drivers/gpu/drm/drm_edid.c                    | 33 +++++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c                   | 24 ++------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  8 ++---
 drivers/gpu/drm/nouveau/dispnv50/head.c       |  8 +----
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    | 10 +++---
 drivers/gpu/drm/radeon/evergreen_hdmi.c       |  5 ++-
 drivers/gpu/drm/radeon/radeon_audio.c         | 13 ++++----
 drivers/gpu/drm/radeon/radeon_connectors.c    | 27 ++++-----------
 drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
 drivers/gpu/drm/radeon/radeon_mode.h          |  2 --
 include/drm/drm_connector.h                   |  6 +++-
 20 files changed, 79 insertions(+), 100 deletions(-)

-- 
2.39.2

