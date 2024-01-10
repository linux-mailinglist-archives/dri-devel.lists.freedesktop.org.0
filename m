Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919F829F55
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D8D10E620;
	Wed, 10 Jan 2024 17:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E5F10E613;
 Wed, 10 Jan 2024 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908361; x=1736444361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0fbUq2+fi5m6xU5bU2ash2TByVlWdMOaHQnT3FV0Bec=;
 b=HUVEltAw8ZsvQJp8BOwOyucRPKyyhc+XnvC3IagPHAJroezQIjKbBtuC
 E1PjQuNaoDdvtmfCkGOBbpb9OhlHQOUU0p2D/CpKKhAmeW/uFPxgTpOFM
 Cg1cqm8aldJMEQWgvB4AiC+n+HUTEKmVUQOQtaKhmMQnA3zwZAT7DbHb4
 jn+LMR73fdpr+HNzt+J7KlzD/+jAHscca5yzBGBN4dNA0eiAnv3QwZ9NB
 GgT5B3eLOUkgraiD+fY4ngnlxqBvULTu3AQOe46+lnAfh/XcR5cwPeTd0
 1AmB0CkNy/EgrJptBDGS9E17g2UJW8KVUynqmK0gncqlf0HvFY841vTqt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="462878521"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="462878521"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1029221779"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1029221779"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: enable W=1 warnings by default across the subsystem
Date: Wed, 10 Jan 2024 19:39:10 +0200
Message-Id: <cover.1704908087.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v2 of [1] to enable most W=1 warnings across the drm
subsystem. Some fixes first, and a CONFIG_DRM_WERROR on top.

I build tested this for x86 (both gcc and clang), arm and arm64.

BR,
Jani.


[1] https://lore.kernel.org/r/20231129181219.1237887-1-jani.nikula@intel.com




Jani Nikula (6):
  drm/nouveau/acr/ga102: remove unused but set variable
  drm/nouveau/svm: remove unused but set variables
  drm/amdgpu: prefer snprintf over sprintf
  drm/imx: prefer snprintf over sprintf
  drm: enable (most) W=1 warnings by default across the subsystem
  drm: Add CONFIG_DRM_WERROR

 drivers/gpu/drm/Kconfig                       | 18 +++++++++++
 drivers/gpu/drm/Makefile                      | 30 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  3 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 10 ++-----
 .../gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c    |  3 +-
 6 files changed, 55 insertions(+), 11 deletions(-)

-- 
2.39.2

