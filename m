Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25E6BE348
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F4D10EE85;
	Fri, 17 Mar 2023 08:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBF410EE8C;
 Fri, 17 Mar 2023 08:23:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8900F62227;
 Fri, 17 Mar 2023 08:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8179BC4339C;
 Fri, 17 Mar 2023 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041414;
 bh=Cr4jztM/jT6uRXyXs0wSG6822LEfj7acA8by/4R7UwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E3wFIdKQuXNYprr4+dndpX6xjfjGsu5XEYhu/qtf62VERx9ECy2EOOjY4IO/iOt/Q
 skXHkVp/veAoo4q5NiLM7GZO2z6tvrC4l8R2hNEVw8ZASeHT9aX5Dly5fcQkxLCAkR
 47PZOcqAm9zN7qhd4yMqF47F6iT9sbu7F/uckwklbiENHJZk+bzZ1TkRwHSfbniZmN
 guqHNszY/2H5nz3ONUb5YPM9SbJimcIcG+p6RxpqnMR4jGiTlW0wFlIrtWmLrbAqR0
 GNpOejoJup+km/kUE8f0O11uUa274LWdc199VjKxy8leRLGecFMDF5nv36ulfjPZX2
 xl8cLf9mSoqSw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 30/37] drm/amd/display/dc/link/protocols/link_dp_training:
 Remove set but unused variable 'result'
Date: Fri, 17 Mar 2023 08:17:11 +0000
Message-Id: <20230317081718.2650744-31-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Wenjing Liu <wenjing.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c: In function ‘perform_link_training_with_retries’:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1586:38: warning: variable ‘result’ set but not used [-Wunused-but-set-variable]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 .../gpu/drm/amd/display/dc/link/protocols/link_dp_training.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index a9025671ee4a8..10261764a0cea 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -1580,8 +1580,7 @@ bool perform_link_training_with_retries(
 				 * Report and continue with eDP panel mode to
 				 * perform eDP link training with right settings
 				 */
-				bool result;
-				result = cp_psp->funcs.enable_assr(cp_psp->handle, link);
+				cp_psp->funcs.enable_assr(cp_psp->handle, link);
 			}
 		}
 
-- 
2.40.0.rc1.284.g88254d51c5-goog

