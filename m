Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED282C3ED
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274CC10E0C3;
	Fri, 12 Jan 2024 16:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7629610E0C3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078207; x=1736614207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jevinYW7WYaMa2/j3ZUtTsjV36G7nniIO05m0REe59k=;
 b=iXo/SBJh/bW4kPjLlyjQcFx8DUT+LDnuDBoQkYFXg/oyeK95y+bHvf/+
 oTum8lLyxB7wDNPOXd4LVg6YiYrLJpYJ1FKTejCA1sEgoA/O/pHcBPCOb
 Epy2xWoHxLzw+TwWiI9KX+qbc1u/KrrIGS6W1iMJXdTMrwoBCWUUT2Yke
 Qd1cst7pknIAa11DLxkKovXXZWZIecRWa23PwCb2c/PMpJXQpKR8uG9yY
 WEQd3n9ny8L60OxHvGMGr4RLd3lBsWsgjpk+QsHRMo3jispqClnTzj/VJ
 FvYYRu/YxLmSVBPrk5MVBbviOgie6Qn0ruJHruIeMVHY+wNPohb9ZUZ6y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6578745"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6578745"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="24764156"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: stop using edid_blob_ptr in drivers
Date: Fri, 12 Jan 2024 18:49:52 +0200
Message-Id: <cover.1705078136.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


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

