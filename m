Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81717AAD241
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6A510E728;
	Wed,  7 May 2025 00:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="oVFXbNiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A7A10E722;
 Wed,  7 May 2025 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=ZOe7yRBHh062ZypLLoU8+MZY4/JHvFw722+CD1Smm0w=; b=oVFXbNiBMV81lw9Q
 /YpMdpnZ7ML5jXaQh8DardEFZ9GLJQxwRo99iyKhWSQ96fEuQ32VxSzmPnwOPJbt41xud/0rnDPpO
 BqmHnLBjpYBLaK5g17pM5UZKrAfOhZr2PZb/Kgw3yaiYDwbRvY8BhHukj6slpkM1TFxylW+qo58Pt
 FUP06nPiAHFChWBs2VWaI6el/1We8lG1vgt+MfJ3jeRAnMVlTlwadC6fnHeRk5boG9JXzFDcFi2Rk
 0mpxDeUAuBERq/aBNyr7UYjrnJSFHfGh7ny0Wigq4gGRTxkqgbWIUT/Z33ICm5Z+q98L/T36dJkd9
 o7mxtp2jQ3kGs8vv8Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uCSaH-0021Kc-2D;
 Wed, 07 May 2025 00:24:25 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] AMD gpu deadcoding (S)
Date: Wed,  7 May 2025 01:24:22 +0100
Message-ID: <20250507002425.93421-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
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
  A bunch more deadcode around the AMD GPUs.
(I've not done smu_v14 which all looks rather new
to me, so perhaps you're still intending to use
some of the unused functions).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm/amd/pm/smu7: Remove unused smu7_copy_bytes_from_smc
  drm/amd/pm/smu11: Remove unused smu_v11_0_get_dpm_level_range
  drm/amd/pm/smu13: Remove unused smu_v3 functions

 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c |  36 -------
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.h |   2 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h  |   5 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  12 ---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  39 -------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 101 ------------------
 6 files changed, 195 deletions(-)

-- 
2.49.0

