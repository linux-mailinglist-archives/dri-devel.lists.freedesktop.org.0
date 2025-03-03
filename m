Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB272A4C395
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 15:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A663310E439;
	Mon,  3 Mar 2025 14:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="BFTjdSeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799AF10E439;
 Mon,  3 Mar 2025 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=CBFiAgytTxTQzTWMXsbcqZJFBhGc1VYrDgGawtSz/iY=; b=BFTjdSeEgK4c28ta
 CTOaJI+TwzcWTtltpn9xrH72Bb74PgKNoXDyANk3kQ28NwgUlUdl8U+spQNYy7LEClHxumLQ1LGy+
 hJnczPrRqSsU/N8MbX/zpGHrbC0aWh/ICABgmi3Uk67+lVtDk9tM0vEAlehKRn3Q+IOVwXE/zGZf7
 EN0JHzmEbd+fMX3qKDZCRor+Fgvr9Nyc8TK9iJZrWtxAZ3EBR1GAGC1Gat0AZ/FiYqGhoptKf/0wX
 ccnvURrCf3Kg2SzV/BCP8/Q1bozIYWbhjPO0NnL1lVeDERzx0rPcVRoGdS9gnKJcy7U3UU3WlmuXC
 V+qQqn+nUv9JlUQjhg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tp6x1-0028PG-0V;
 Mon, 03 Mar 2025 14:39:23 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 christian.koenig@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, austin.zheng@amd.com, jun.lei@amd.com,
 kenneth.feng@amd.com, linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/6] drm/amdgpu: Deadcode - the P's
Date: Mon,  3 Mar 2025 14:39:16 +0000
Message-ID: <20250303143922.36342-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  Here's another blob of deadcoding in the amdgpu's;
this set is all the symbols I noticed that start with 'P'.
  Most, as normal are whole function removals,
  but I also nuke the powerdown_uvd member in one patch.

Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (6):
  drm/amdgpu: Remove ppatomfwctrl deadcode
  drm/amdgpu: Remove phm_powerdown_uvd
  drm/amdgpu: Remove powerdown_uvd member
  drm/amdgpu: Remove unused pre_surface_trace
  drm/amdgpu: Remove unused print__rq_dlg_params_st
  drm/amdgpu: Remove unused pqm_get_kernel_queue

 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   2 -
 .../amd/amdkfd/kfd_process_queue_manager.c    |  13 --
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 120 ------------------
 .../display/dc/dml/display_rq_dlg_helpers.c   |  11 --
 .../display/dc/dml/display_rq_dlg_helpers.h   |   1 -
 .../amd/display/include/logger_interface.h    |   5 -
 .../amd/pm/powerplay/hwmgr/hardwaremanager.c  |  10 --
 .../drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.c |  78 ------------
 .../drm/amd/pm/powerplay/hwmgr/ppatomfwctrl.h |   3 -
 .../drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c  |   1 -
 .../powerplay/hwmgr/smu7_clockpowergating.c   |   2 +-
 .../powerplay/hwmgr/smu7_clockpowergating.h   |   1 -
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   |   1 -
 .../drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c   |   1 -
 .../amd/pm/powerplay/inc/hardwaremanager.h    |   1 -
 drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h  |   1 -
 16 files changed, 1 insertion(+), 250 deletions(-)

-- 
2.48.1

