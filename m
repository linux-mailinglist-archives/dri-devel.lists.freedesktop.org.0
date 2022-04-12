Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC54FC9FE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1684F10FAE4;
	Tue, 12 Apr 2022 00:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FEE10FAE6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:48:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 87FBFCE19A3;
 Tue, 12 Apr 2022 00:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78573C385A4;
 Tue, 12 Apr 2022 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724514;
 bh=resUGCgfDFyLK6Iu5p0IhwFZLP0ZHosQKFmc2IXJMqk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HPSv8lF/BP0kkzSe7gfRvpJVxVjXiVPqabxnxZOBcUtkHF2w1DzDRSmnVTwJ4yGVX
 rgb/g5fnrGJRCr3J6s48h+XlXjjwzsIWbxT2mRTUzfpsk5U7uYcHwd09WJuzsg8S5B
 gStx66XhctTylwvDpe+0eK4DYKsRs6eXsKP8IONzCTna7GGAQvKP1SOOUxjz7CoikU
 JzfXhIqPt3sdx2RvK2qMRNAgmizbx5yVk+DJBOQtqleSJajrI3vA0THQA+9+k8M53B
 ukcg1zq2xlWUtJgZHJTXS2ck49J4tG9TJCfae+BtvYGkwq/pHps059pH97+ndIkVoh
 Hbtbs3hkuXgKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 30/41] drm/amd/display: Revert FEC check in
 validation
Date: Mon, 11 Apr 2022 20:46:42 -0400
Message-Id: <20220412004656.350101-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004656.350101-1-sashal@kernel.org>
References: <20220412004656.350101-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: airlied@linux.ie, wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 meenakshikumar.somasundaram@amd.com, lee.jones@linaro.org,
 Jimmy.Kizito@amd.com, Sasha Levin <sashal@kernel.org>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 michael.strauss@amd.com, George Shen <George.Shen@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Martin Leung <Martin.Leung@amd.com>, Eric.Yang2@amd.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, roy.chan@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Leung <Martin.Leung@amd.com>

[ Upstream commit b2075fce104b88b789c15ef1ed2b91dc94198e26 ]

why and how:
causes failure on install on certain machines

Reviewed-by: George Shen <George.Shen@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Martin Leung <Martin.Leung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 35a27fe48f66..b37c4d2e7a1e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1377,10 +1377,6 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
 	if (!link->link_enc->funcs->is_dig_enabled(link->link_enc))
 		return false;
 
-	/* Check for FEC status*/
-	if (link->link_enc->funcs->fec_is_active(link->link_enc))
-		return false;
-
 	enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
 
 	if (enc_inst == ENGINE_ID_UNKNOWN)
-- 
2.35.1

