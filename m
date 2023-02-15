Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5526985EF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 21:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA5410EBEF;
	Wed, 15 Feb 2023 20:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414C210E154;
 Wed, 15 Feb 2023 20:46:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C110DB823BD;
 Wed, 15 Feb 2023 20:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC43DC433EF;
 Wed, 15 Feb 2023 20:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676493994;
 bh=/dHB7S/tKDWgQrM6FbPgvEFxvU3XqnY7GE0MJ4coEJA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rOkzV6OJMp/MCffkAIr2cDNivoZsKhgyAkd+UCmV2Am9WV5pgskQdR5if5Az3QUxj
 mcD0JaUrpau3t280ZS1OgEngRF0QFUVDAujstaao16wsupCiui3vUmvZ8gVg4BoRcP
 ExDIkMPiJLKeWvYCjlenMsJfdr7LPxJGuZTTNVyVm6usEmaFZt1o/MLjg4v8oV/ljX
 C43yBwoYRRj5cvKONhqw+1JVSHplX/b++A2sTWAR2XI8PRdFOmOk7kjFgKzsUQJvVr
 BX54vsBkjGXyjAGEPn7g0cs33RfzEE3wuyrjzIpPuEw4AjF6cNG9S9yT1syTgpy+5i
 PK/GtRD7ghbow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 24/24] drm/amd/display: disable S/G display on DCN
 3.1.2/3
Date: Wed, 15 Feb 2023 15:45:47 -0500
Message-Id: <20230215204547.2760761-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230215204547.2760761-1-sashal@kernel.org>
References: <20230215204547.2760761-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, yifan1.zhang@amd.com, stylon.wang@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 077e9659581acab70f2dcc04b5bc799aca3a056b ]

Causes flickering or white screens in some configurations.
Disable it for now until we can fix the issue.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2352
Cc: roman.li@amd.com
Cc: yifan1.zhang@amd.com
Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 988b1c947aefc..c026ba532b733 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1524,8 +1524,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 			break;
 		case IP_VERSION(2, 1, 0):
 		case IP_VERSION(3, 0, 1):
-		case IP_VERSION(3, 1, 2):
-		case IP_VERSION(3, 1, 3):
 		case IP_VERSION(3, 1, 6):
 			init_data.flags.gpu_vm_support = true;
 			break;
-- 
2.39.0

