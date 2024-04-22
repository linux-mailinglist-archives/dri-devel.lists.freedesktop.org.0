Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB68AD981
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA276112E69;
	Mon, 22 Apr 2024 23:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qLi+Gp7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5687112E68;
 Mon, 22 Apr 2024 23:55:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3FBECE0A54;
 Mon, 22 Apr 2024 23:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BA8C32782;
 Mon, 22 Apr 2024 23:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830104;
 bh=SCqaqHScQMAM4fAgeyxAFEvwYQwaAdVCBYbZCjn+uas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qLi+Gp7oT1k8yUeZM6CeASG+pS3kDKRikzHuSU5W4uOwXiIpboZthsp7cTNkC3LQo
 EwsyLNhcnzp/wP/dlaABjjD1ydLVSao4tonKhVgP/WV5mHURBdMGLsayteTJn5v3DZ
 eiUfN6k/ww3mMJ9eBlmX4np/Xt2881FclD2VM8gXJKuGlgSQgq9HEfR5PlnE3wMSnA
 w9eB4SoU9bmHRdh0E3qlYASnX1qkq0V3y9g2j5NjqH8D4b27bL5Ehav8lg9lypsFJy
 XTSzKXI9n+oIShZY+kfpCkU1AuIQ2jDls/p3FbRamAnwyvs/fcK426Fo2zbWvc61PE
 uVj3Lrykj/7RA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yifan Zhang <yifan1.zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, lijo.lazar@amd.com, le.ma@amd.com,
 Prike.Liang@amd.com, Lang.Yu@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 28/43] drm/amdgpu: add smu 14.0.1 discovery support
Date: Mon, 22 Apr 2024 19:14:14 -0400
Message-ID: <20240422231521.1592991-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231521.1592991-1-sashal@kernel.org>
References: <20240422231521.1592991-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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

From: Yifan Zhang <yifan1.zhang@amd.com>

[ Upstream commit 533eefb9be76c3b23d220ee18edfda8eb56cefff ]

This patch to add smu 14.0.1 support

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 4f9900779ef9e..ff28265838ec0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1867,6 +1867,7 @@ static int amdgpu_discovery_set_smu_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &smu_v13_0_ip_block);
 		break;
 	case IP_VERSION(14, 0, 0):
+	case IP_VERSION(14, 0, 1):
 		amdgpu_device_ip_block_add(adev, &smu_v14_0_ip_block);
 		break;
 	default:
-- 
2.43.0

