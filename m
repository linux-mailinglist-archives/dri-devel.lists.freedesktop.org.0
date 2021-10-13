Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE8242B12F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 02:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17826E865;
	Wed, 13 Oct 2021 00:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34AF6E859;
 Wed, 13 Oct 2021 00:55:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 881E660EBB;
 Wed, 13 Oct 2021 00:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634086501;
 bh=dilo0xnTgQMspiRmJhCZhv2NP+IgRvNKPOZfOjw0JUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bpvIjIxqjui9sDZNNbVfvVKkJft12uv0WeVWDizVgYm+DRw3IxFKfWT3DJ5Q20glm
 CZnboqrR7fUOAzzjhMi256AvC5Qf28X5M5QI9cqfaONrmgTsr6sELer+1p/tSWZeHI
 8KwzPMF43K9bIH4Betq7prZlb+TzDRmtRdYBrnOLp4euCGLT/yapCBq2y6CLGLQIwH
 //gR+8EcWlkW0+OONd39XcLQE6mjDVlFmaO6cPDqgvBoFRQGnHblK3jaGeXenVo69p
 DcAwUc3S6kHzusRfYinYgEVTaihM9t4p9pSkOoHV/AMQFZ8/6zBugprAFqY6NG+qDZ
 lO2YWnjZWnaYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 08/17] drm/amdgpu/display: fix dependencies for
 DRM_AMD_DC_SI
Date: Tue, 12 Oct 2021 20:54:32 -0400
Message-Id: <20211013005441.699846-8-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013005441.699846-1-sashal@kernel.org>
References: <20211013005441.699846-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 4702b34d1de9582df9dfa0e583ea28fff7de29df ]

Depends on DRM_AMDGPU_SI and DRM_AMD_DC

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 7dffc04a557e..127667e549c1 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -25,6 +25,8 @@ config DRM_AMD_DC_HDCP
 
 config DRM_AMD_DC_SI
 	bool "AMD DC support for Southern Islands ASICs"
+	depends on DRM_AMDGPU_SI
+	depends on DRM_AMD_DC
 	default n
 	help
 	  Choose this option to enable new AMD DC support for SI asics
-- 
2.33.0

