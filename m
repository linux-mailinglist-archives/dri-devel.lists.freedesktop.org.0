Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17076BE33E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA17910EE7F;
	Fri, 17 Mar 2023 08:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E9110EE7B;
 Fri, 17 Mar 2023 08:23:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21CBF6221D;
 Fri, 17 Mar 2023 08:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C80C433A0;
 Fri, 17 Mar 2023 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041404;
 bh=2B9e7zTbjnHiArP7df0efgEJYbKhHWL2S0uHdMgrMRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g0/xYEqiyDqkdvCFf4DfuZ9NyLObfivYg5mrdn1GFM0qtvX+6tYdJ49T5xlCLak2T
 e1RLsG04ZoD1p/KszNL53jj2ZtqqJUGN1CKbZgf3UMyg2cAF1T1YPnzx3Rbf5holc0
 bBYVDNV2Qt24I2Qwq1pSvn1Eg5CGhtGytF859v+3EmVPLcERQChRV7T010F7x0L5jI
 tpFGhdfuVKmyNgDH9cLjUuW+1P7evsnnlKAIHn5u54ZQC0/JJpVwXaTwN7xTKBS/0t
 jI4bv2TZ1FXfPF+4bqyIOpfZ9EnxSZXAM3hbkfjDSOtkxJVDvCa2TdKxAgJYUb2PyS
 GlMBEsamP5Oew==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 27/37] drm/amd/display/dc/dce/dmub_psr: Demote kerneldoc abuse
Date: Fri, 17 Mar 2023 08:17:08 +0000
Message-Id: <20230317081718.2650744-28-lee@kernel.org>
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
Cc: David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:257: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Zhang <dingchen.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 27b8f3435d86f..9705d8f883825 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -253,7 +253,7 @@ static void dmub_psr_set_level(struct dmub_psr *dmub, uint16_t psr_level, uint8_
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 }
 
-/**
+/*
  * Set PSR vtotal requirement for FreeSync PSR.
  */
 static void dmub_psr_set_sink_vtotal_in_psr_active(struct dmub_psr *dmub,
-- 
2.40.0.rc1.284.g88254d51c5-goog

