Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6108CD4DB
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F31B10E593;
	Thu, 23 May 2024 13:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEEHZqTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6F710E335;
 Thu, 23 May 2024 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716471440; x=1748007440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nwUlt7tgledmNyzRkC58TMJbyUeme2oy4ipdEbM0yC8=;
 b=WEEHZqTMv6kG+BYv1e0AL559AHHEwM/v6RKDatgKgOE6VIrA4fhoo1oB
 2by7NJuLH7Y75fgPhi6HiBqRuUCIBKPZxPBJue8L01vOxMmQZbBsx/6h/
 2bLeX4WZXnNO1Ab2B2HXRGNygSKqIHPmq/Zpx7E+OsX37LaXBBM1/NJow
 FNuCJJli+dHb9mvHUTUdEdQraJzd1hgDl1xT47IsAgeyDZFEoCkU/kbPV
 MluvseKTJ2tyGno5ozGan0Ev3RNXzy3oOu5VjG1827Kt+AuPapLvYnrTA
 BLgGgexgRsiItQCO8YMEi7msU+1D+Giy7HIx6tcBG3gWC6/m4vZYKvKMV A==;
X-CSE-ConnectionGUID: By1YHvEgTFueeWJHSdS5jg==
X-CSE-MsgGUID: ofZw2Q67TUyU/zAgywgQrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12971689"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12971689"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:18 -0700
X-CSE-ConnectionGUID: BuJdhoPQROOrhR+HAGlkUA==
X-CSE-MsgGUID: cYAiUGr7Q7W+B8MsXVN91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34141543"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 06:37:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, jani.nikula@intel.com
Subject: [PATCH 0/3] amd, i915,
 xe: drop redundant warnings from driver makefiles
Date: Thu, 23 May 2024 16:37:04 +0300
Message-Id: <cover.1716471145.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm sending these together, as they're related, and almost identical,
but I expect them to be merged individually to each driver.

BR,
Jani.

Jani Nikula (3):
  drm/i915: drop redundant W=1 warnings from Makefile
  drm/xe: drop redundant W=1 warnings from Makefile
  drm/amdgpu: drop redundant W=1 warnings from Makefile

 drivers/gpu/drm/amd/amdgpu/Makefile | 18 +-----------------
 drivers/gpu/drm/i915/Makefile       | 25 +------------------------
 drivers/gpu/drm/xe/Makefile         | 25 +------------------------
 3 files changed, 3 insertions(+), 65 deletions(-)

-- 
2.39.2

