Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E68FF787
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 00:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F0A10EAE5;
	Thu,  6 Jun 2024 22:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4oqPQq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E43C10EADF;
 Thu,  6 Jun 2024 22:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717711786; x=1749247786;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=zP0kotE5FVo9el/DXFxkalN/XT6pkXcVELeA2h3cOcw=;
 b=f4oqPQq1YV1U+0m5O3ac7HA6fGpbVXum87RCq9vZFEx1uiESI8o8i+YX
 WNXPaLBuqn7N2rnCnyTfiL6JqYxNytFpSJI0qteTDomgo77ao99Ck1Hdh
 AcNpn5eP+ntPRxHRl1i+fXWld6B6GXRQXArJDX+MMAVZamplKLlpy8N3w
 B+dqTsZ4IXixayc6irGjsxPHhGi2BdCyjSV47p3+XFjLvm/KfA3X1pBbB
 i53UfnWBWOHvgxDBh8HjBKsnfVU7/fk8n/9VwmRlaJiXk95hjZt2jVZo4
 JNEd0xkWY1QzYPz4Hh7+5/9RLeO1AbuMUcdhz+vjf9JJQOQddl7h0+RZB g==;
X-CSE-ConnectionGUID: DImmT9y3SqWfS6K+0CC8QQ==
X-CSE-MsgGUID: O/LRuoB0RSGGwrZxddNoLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31959776"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="31959776"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:09:33 -0700
X-CSE-ConnectionGUID: IjPgGKN3Qm6kYyoLzU+wTw==
X-CSE-MsgGUID: uVgIMDG/TyCoW/5NA/2tRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38555454"
Received: from mmiotk-mobl2.ger.corp.intel.com (HELO [10.249.37.149])
 ([10.249.37.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 15:09:29 -0700
Message-ID: <d5645d00-a8cf-47d9-a2a0-4ff55842fc7d@linux.intel.com>
Date: Fri, 7 Jun 2024 00:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Dave, Sima,

Lots of fixes for vmwgfx all over the place, and one fix for sitronix panel.

Cheers,
Maarten

drm-misc-fixes-2024-06-07:
drm-misc-fixes for v6.10-rc3:
- Robustness fixes for vmwgfx.
- Error check for of_drm_get_panel_orientation failing in
   sitronix-st7789v.
The following changes since commit bb195358806847217efba98de62b7decec3b371f:

   drm/msm: remove python 3.9 dependency for compiling msm (2024-05-30 
18:49:23 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-fixes-2024-06-07

for you to fetch changes up to 5703fc058efdafcdd6b70776ee562478f0753acb:

   drm/vmwgfx: Don't memcmp equivalent pointers (2024-06-05 22:38:40 -0400)

----------------------------------------------------------------
drm-misc-fixes for v6.10-rc3:
- Robustness fixes for vmwgfx.
- Error check for of_drm_get_panel_orientation failing in
   sitronix-st7789v.

----------------------------------------------------------------
Chen Ni (1):
       drm/panel: sitronix-st7789v: Add check for 
of_drm_get_panel_orientation

Dr. David Alan Gilbert (1):
       drm/vmwgfx: remove unused struct 'vmw_stdu_dma'

Ian Forbes (6):
       drm/vmwgfx: Filter modes which exceed graphics memory
       drm/vmwgfx: 3D disabled should not effect STDU memory limits
       drm/vmwgfx: Remove STDU logic from generic mode_valid function
       drm/vmwgfx: Standardize use of kibibytes when logging
       drm/vmwgfx: Don't destroy Screen Target when CRTC is enabled but 
inactive
       drm/vmwgfx: Don't memcmp equivalent pointers

  drivers/gpu/drm/panel/panel-sitronix-st7789v.c |  4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c            | 19 +++-----
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h            |  3 --
  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c  |  4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c            | 28 +++++-------
  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c           | 60 
+++++++++++++++++++++++---
  6 files changed, 74 insertions(+), 44 deletions(-)
