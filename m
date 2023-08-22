Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08896784041
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BB610E32C;
	Tue, 22 Aug 2023 12:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E2F10E32C;
 Tue, 22 Aug 2023 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692705768; x=1724241768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8+cwU/WconM5vRP1J4pvZXPwxkqU0WDUGLdSnnM/Ce4=;
 b=hHERWe4z0wRgFNwhKaH7Azc3R0sOowKSHX6tT3ZAC15SY/v2GPtgzmj/
 Zj7Gcg3VvRBLX4eCtat1Hk2d/cb+XbWyNyKJ8thKkJghs6qt0KKlQfrcv
 ODe9M+Xji9RaEEhuozVp0t0eBhdWrlKM7c+3TSzf5eKiVuB+qHpizg7Rq
 DUeYpJMqPZjfDxCwrbYfhP2y8EhNlw2ds10Am1albkxP9OHZkdkCklEga
 XhBjakNACTlg477e1W7OSIgqlZHQ3J7Viyvmg8TzSSrLHVZEBPiDCyDiO
 nRJHuNMQW6q16/T6zFcojvkVnLe73RY+ch0Ym3zHO7nGIJ4v6C3w7+EiF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364022987"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="364022987"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729794702"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="729794702"
Received: from kainaats-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.230])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 05:01:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm/amd/display: stop using
 drm_edid_override_connector_update()
Date: Tue, 22 Aug 2023 15:01:36 +0300
Message-Id: <cover.1692705543.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Chao-kai Wang <Stylon.Wang@amd.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Wenchieh Chien <wenchieh.chien@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Over the past years I've been trying to unify the override and firmware
EDID handling as well as EDID property updates. It won't work if drivers
do their own random things.

BR,
Jani.


Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Chao-kai Wang <Stylon.Wang@amd.com>
Cc: Daniel Wheeler <daniel.wheeler@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Wenchieh Chien <wenchieh.chien@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

Jani Nikula (4):
  Revert "drm/amd/display: drop unused count variable in
    create_eml_sink()"
  Revert "drm/amd/display: assign edid_blob_ptr with edid from debugfs"
  Revert "drm/amd/display: mark amdgpu_dm_connector_funcs_force static"
  Revert "drm/amd/display: implement force function in
    amdgpu_dm_connector_funcs"

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++----------------
 1 file changed, 5 insertions(+), 39 deletions(-)

-- 
2.39.2

