Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1E6BE343
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E7710EE7D;
	Fri, 17 Mar 2023 08:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D81610EE83;
 Fri, 17 Mar 2023 08:23:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C107162236;
 Fri, 17 Mar 2023 08:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C174C433D2;
 Fri, 17 Mar 2023 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041408;
 bh=ZlS/GNeGQgSgiA5XT2FCbE2X1vZ2yBY3Mq2Etnbekhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j31dTC8X0eOQrOT2QXaovP1tshj8tnd9kSzvTeHtoq0na1OSkwwyNZ4/Udtl5Lp5k
 lWG2S/2Ism3NRmBkwzWBO/RkYtcqCh3Tt+zeRDeXSpoUwqV0CX7bd5F7NB5NKMcnUw
 2taLPu1/j1rm/Mlm+KMwOAdKH/SEeD+YkFx1+u8RqwlNKMupJ2+mGMgVjL4N3yoZof
 nmfVuyYBFPSwl+KIY5k+sCHyTk3IcLI3c+eeojaVVqxt23gCgl+BIzleKEUol2hcAF
 +EZawmcWZv2z3E6Am6Ol2SOx89glt9SR4dZjUdza5ARzWdd8mB/6ZGFy2hDjy7uR1b
 ECFg6O2O/na/w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/37] drm/amd/display/dc/core/dc_stat: Convert a couple of
 doc headers to kerneldoc format
Date: Fri, 17 Mar 2023 08:17:09 +0000
Message-Id: <20230317081718.2650744-29-lee@kernel.org>
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
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mustapha Ghaddar <mghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:38: warning: Cannot understand  *****************************************************************************
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stat.c:76: warning: Cannot understand  *****************************************************************************

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mustapha Ghaddar <mghaddar@amd.com>
Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Cc: Jasdeep Dhillon <jdhillon@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c | 28 +++++++------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
index 6c06587dd88c2..5f6392ae31a66 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
@@ -35,19 +35,15 @@
  */
 
 /**
- *****************************************************************************
- *  Function: dc_stat_get_dmub_notification
+ *  dc_stat_get_dmub_notification
  *
- *  @brief
- *		Calls dmub layer to retrieve dmub notification
+ * Calls dmub layer to retrieve dmub notification
  *
- *  @param
- *		[in] dc: dc structure
- *		[in] notify: dmub notification structure
+ * @dc: dc structure
+ * @notify: dmub notification structure
  *
- *  @return
+ * Returns
  *     None
- *****************************************************************************
  */
 void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification *notify)
 {
@@ -73,19 +69,15 @@ void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification
 }
 
 /**
- *****************************************************************************
- *  Function: dc_stat_get_dmub_dataout
+ * dc_stat_get_dmub_dataout
  *
- *  @brief
- *		Calls dmub layer to retrieve dmub gpint dataout
+ * Calls dmub layer to retrieve dmub gpint dataout
  *
- *  @param
- *		[in] dc: dc structure
- *		[in] dataout: dmub gpint dataout
+ * @dc: dc structure
+ * @dataout: dmub gpint dataout
  *
- *  @return
+ * Returns
  *     None
- *****************************************************************************
  */
 void dc_stat_get_dmub_dataout(const struct dc *dc, uint32_t *dataout)
 {
-- 
2.40.0.rc1.284.g88254d51c5-goog

