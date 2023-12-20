Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCC819EB7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 13:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6E710E580;
	Wed, 20 Dec 2023 12:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A322C10E580
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703074330;
 bh=qpXtJHOu5jSPOW1f5fkCH+JXOiMtY3P5YzcKQ2FIVkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ywssx7ScKZjCM2E1EcQbkx1F9qHokqUu/A/4/4eRBCWi1Rg05UrivLLMwmzgqCTnW
 ubFieah8nosM+C42rFcVICmu+qAKFt5b+ZRZVWk/SumefaiWsd+MCIyj3XUdIsERQz
 YrZPFZdeqHwAqzR7hY1/pRjaYIZNWWD0Ho4ydN+3OdxQv0c7WohDWlJwWjgzSvXdoR
 aEYd6UsuoHtnv50peP1+gZi81jNZ/x89IeEFrm0HuHkATG8t9m+LT2CQIZ1vQ/kOFO
 hnV66AB+zBycKo+mCjIQ11LdQ7mOEnfJxsusMGDk0lDcyOx1fBr7AXXvHh9Eb6pEZM
 KfRsK3ziOhXAg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 682393781FEF;
 Wed, 20 Dec 2023 12:12:05 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 daniels@collabora.com
Subject: [PATCH v1 7/8] drm/ci: Rename xfails file
Date: Wed, 20 Dec 2023 17:41:09 +0530
Message-Id: <20231220121110.1441160-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-rockchip@lists.infradead.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david.heidelberg@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the names of xfail files for Mediatek (mt8173 and mt8183),
Rockchip (rk3288 and rk3399), and Meson (g12b) to include
information about the tested driver and whether it is related
to display or GPU testing.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 ...ediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} | 0
 .../xfails/{meson-g12b-fails.txt => panfrost-g12b-gpu-fails.txt}  | 0
 .../{mediatek-mt8183-fails.txt => panfrost-mt8183-gpu-fails.txt}  | 0
 .../{rockchip-rk3288-fails.txt => panfrost-rk3288-gpu-fails.txt}  | 0
 .../{rockchip-rk3288-skips.txt => panfrost-rk3288-gpu-skips.txt}  | 0
 .../{rockchip-rk3399-fails.txt => panfrost-rk3399-gpu-fails.txt}  | 0
 ...{rockchip-rk3399-flakes.txt => panfrost-rk3399-gpu-flakes.txt} | 0
 .../{rockchip-rk3399-skips.txt => panfrost-rk3399-gpu-skips.txt}  | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => panfrost-g12b-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8183-fails.txt => panfrost-mt8183-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3288-fails.txt => panfrost-rk3288-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3288-skips.txt => panfrost-rk3288-gpu-skips.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-fails.txt => panfrost-rk3399-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-flakes.txt => panfrost-rk3399-gpu-flakes.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-skips.txt => panfrost-rk3399-gpu-skips.txt} (100%)

diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
rename to drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-mt8183-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt
-- 
2.40.1

