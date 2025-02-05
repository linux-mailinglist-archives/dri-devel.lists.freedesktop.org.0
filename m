Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA754A28C53
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 14:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734189C29;
	Wed,  5 Feb 2025 13:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ny+bN/op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441EC89C29
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738763308;
 bh=+Fw6FinwCoS1WkNYStwmJ7zMFCgSMn0hedbU3b3hUss=;
 h=From:To:Cc:Subject:Date:From;
 b=ny+bN/opkt8izdf1zNx3PJXQ3I5fY0iDJHp8vUYhfodATUfn0t4Mh2fm2few1Y/zF
 PrT7+zRuHfmkSfrpvXyP6xkiSlYhK76fGfQ/JadvkMCm/+vUfZxlh6GcGnAhGC3JoO
 s161xetTfW2+ca8Iy+tlxy4rvT7k15Rqey2cX+1ARhSCrT2iEz/7WZt+ESkPwqW0NX
 BydBR15eEU0kzAUke42FMLPGDyF6JtZkOYojuKd/Rpr9E3PUGTpRXftmpVhQvKptgk
 Ddmopt7FVK/8BU9dDeodTJa/zzCY8aHknp2ajNY2GlDeUuX4Lo1Q4GOiOgYKFwffie
 PKDE2g5bn9eWg==
Received: from localhost.localdomain (unknown [171.76.83.215])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C6A6817E0858;
 Wed,  5 Feb 2025 14:48:25 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org,
 mripard@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
Date: Wed,  5 Feb 2025 19:17:47 +0530
Message-ID: <20250205134811.2002718-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Update drm/ci maintainer entries:

* Add myself as drm/ci maintainer.
* Update Helen's email address.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b256bb4f6d3f..2b4e08c7e119 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7940,7 +7940,8 @@ F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
 DRM AUTOMATED TESTING
-M:	Helen Koike <helen.koike@collabora.com>
+M:	Helen Koike <helen.fornazier@gmail.com>
+M:	Vignesh Raman <vignesh.raman@collabora.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.43.0

