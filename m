Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A842715E04D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95506FAAB;
	Fri, 14 Feb 2020 16:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC436FA9C;
 Fri, 14 Feb 2020 16:13:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23774246A4;
 Fri, 14 Feb 2020 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696799;
 bh=i17WLKf0+TAMuLbUNBD+Z0SmwZsQZ70m0HsRh5A6mQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2Zz8hkpR+j4+ncaJO85ZcLSUfOmf1IDPzMMpFfjM+m19qWvI/FI7MsZaPUklOkypL
 ymHl0HZZpdXwHvWw6tqJBbN9ZW4zAGoKEz6B3k0g4A7mSr8UZJQILWpuwuQHR47ChP
 K42Edyivgo1VAF9dMcj4c4ms/hW/4LcNpxxqF/2o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 071/252] drm/radeon: remove set but not used
 variable 'dig_connector'
Date: Fri, 14 Feb 2020 11:08:46 -0500
Message-Id: <20200214161147.15842-71-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit 3f47f0301594c4f930a32bd7d8125cfdeb6b4b6e ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/atombios_dp.c: In function radeon_dp_get_panel_mode:
drivers/gpu/drm/radeon/atombios_dp.c:415:36: warning: variable dig_connector set but not used [-Wunused-but-set-variable]

It is not used since commit 379dfc25e257 ("drm/radeon/dp:
switch to the common i2c over aux code")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/atombios_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
index 3e798593e0425..f7b848ab26024 100644
--- a/drivers/gpu/drm/radeon/atombios_dp.c
+++ b/drivers/gpu/drm/radeon/atombios_dp.c
@@ -412,7 +412,6 @@ int radeon_dp_get_panel_mode(struct drm_encoder *encoder,
 	struct drm_device *dev = encoder->dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	struct radeon_connector_atom_dig *dig_connector;
 	int panel_mode = DP_PANEL_MODE_EXTERNAL_DP_MODE;
 	u16 dp_bridge = radeon_connector_encoder_get_dp_bridge_encoder_id(connector);
 	u8 tmp;
@@ -423,8 +422,6 @@ int radeon_dp_get_panel_mode(struct drm_encoder *encoder,
 	if (!radeon_connector->con_priv)
 		return panel_mode;
 
-	dig_connector = radeon_connector->con_priv;
-
 	if (dp_bridge != ENCODER_OBJECT_ID_NONE) {
 		/* DP bridge chips */
 		if (drm_dp_dpcd_readb(&radeon_connector->ddc_bus->aux,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
