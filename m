Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09A4FCA3A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5482210FB03;
	Tue, 12 Apr 2022 00:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6110FB03;
 Tue, 12 Apr 2022 00:50:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AA4C60A77;
 Tue, 12 Apr 2022 00:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7442DC385A3;
 Tue, 12 Apr 2022 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724613;
 bh=Qn6auaIHQqy9g4NZVcZdSXXlNdVGB9qoFuf8cv48lK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CiCADGgbavGQURvITbCmCem9qv+viII+PO6/zFb1FapEFdQRny8swqhYRfgCIBYKK
 cVm0IkxI9qOtskL8vzEbcCtcGAIG81RpE/fegt5uFS+scKhN5zNlhnrd0ePO/i5YQB
 ghn5TI/NFDwdbAskCtKjr6tzqtefDvE8nNQEXqa+feNpSpDT+f70cZcK23gFea1MHV
 bj0KRdKxv3mKvwkY6s/qFp10DUfPel29+4KMU/WGvRJrWqP5NG0ls0XDDIfVpGEHTM
 ERjJFvQkabMxi9T8HOmYDBo04axMgj0KipGRpv2G+TvpKmsyoMZTgRG+Wd9E6Ksm+h
 eOtB7DiFatGYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 23/30] drm/amd/display: Revert FEC check in
 validation
Date: Mon, 11 Apr 2022 20:48:57 -0400
Message-Id: <20220412004906.350678-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004906.350678-1-sashal@kernel.org>
References: <20220412004906.350678-1-sashal@kernel.org>
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
 meenakshikumar.somasundaram@amd.com, Jun.Lei@amd.com, lee.jones@linaro.org,
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
index ac5323596c65..93f5229c303e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1173,10 +1173,6 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
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

