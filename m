Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9847EA25025
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 22:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4547E10E07F;
	Sun,  2 Feb 2025 21:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ExqYfCz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10A410E294;
 Sun,  2 Feb 2025 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=GSnzrCxUEngAgik7AYtqUtnWRLHqHq4tUTTifRQr5Ew=; b=ExqYfCz6D9cBjzz6
 wH89VMpf3twPsNEwv1T4wZ/RyLZlW/meCBCtocVt+FoR/d/wFchE8HSDiPQMbpxPT6ycOHfzWzRyo
 ntRnDPJchwWV9hHkELGXfrN8PTK2Q6diDR9H/y3+cMjZ8A2Srd+t7RgIpO4q7SOE6grWLXXT/x916
 7v+OI9uxg/K7Xx6z/2wgQ3tu6Ewy585byiOsR1qEAElWSVZUxuW3dFhkYOQXa8UBToFwTsgL0k6qM
 Wh4ZkPiCzMRK+uKiGbk2U2pp9eVHzOJknSSmDMOrAt7QVZNG9WhQDWEmEGvk4sCsIR1WZAX6Nfi1p
 fUpdJDRn0oa6/DvbBw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tehzV-00D9GV-0v;
 Sun, 02 Feb 2025 21:58:57 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/7] drm/amd/display: More deadcoding
Date: Sun,  2 Feb 2025 21:58:49 +0000
Message-ID: <20250202215856.252439-1-linux@treblig.org>
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

Another small pile of deadcode patches.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (7):
  drm/amd/display: Remove unused mpc1_is_mpcc_idle
  drm/amd/display: Remove unused freesync functions
  drm/amd/display: Remove unused dc_stream_get_crtc_position
  drm/amd/display: Remove unused get_clock_requirements_for_state
  drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
  drm/amd/display: Remove unused get_max_support_fbc_buffersize
  drm/amd/display: Remove unused
    link_enc_cfg_get_link_enc_used_by_stream

 drivers/gpu/drm/amd/display/dc/core/dc.c      |  39 -----
 .../drm/amd/display/dc/core/dc_link_enc_cfg.c |  11 --
 drivers/gpu/drm/amd/display/dc/dc.h           |   2 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  12 --
 .../amd/display/dc/dce110/dce110_compressor.c |  13 --
 .../amd/display/dc/dce110/dce110_compressor.h |   2 -
 .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  18 ---
 .../display/dc/hubbub/dcn10/dcn10_hubbub.h    |   3 -
 .../gpu/drm/amd/display/dc/inc/link_enc_cfg.h |   5 -
 .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  |  16 --
 .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h  |   4 -
 .../amd/display/modules/freesync/freesync.c   | 137 ------------------
 .../amd/display/modules/inc/mod_freesync.h    |  26 ----
 13 files changed, 288 deletions(-)

-- 
2.48.1

