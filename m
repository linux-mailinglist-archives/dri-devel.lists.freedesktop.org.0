Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C23F03D8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E46E591;
	Wed, 18 Aug 2021 12:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754AA6E591
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:41:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so4314399wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKHb4NbS7zSt/cAMTh5zeYF+NOqO7vbF0bCJdamG5w8=;
 b=ja/16Vr9ki6o1rA6ri6QHlVCzMftWzn+OYFQapVIpbv257k3j7V/fjkHafTOT0nGvf
 i6LABOswPGff+2sGLiMXYL+ApmjSBkeyENpajzTX60EcQBA+92QWzWvYnt8rwSuZLWmy
 qCZTc2tlCyn8x9qxTf9znRysZ0LpPAHS/wzxql08x5bEGnbAfvBq6lnIkD8LcmpQntez
 nlzC2m9JvqCuRiVd4RB3t689UDLbFPGMEZfwOJ4Q8sTmducPGwC8J2yE2c9zUT6YFxc1
 xyzoEacrxeRt2pKRV+58wzHQKK0wJkivPxWsrpGWZ7AH0CGbvpavv6t2LADyXhHzX9WQ
 8UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKHb4NbS7zSt/cAMTh5zeYF+NOqO7vbF0bCJdamG5w8=;
 b=MgEM2kCS1uPiPU2dtH1n/7sFbtQHPIpm2n9Q7GMpu2nrhw/mcWm0dGBs6F9P7nZO9A
 qYpMsjDhWockP7FhA4W5GyjT4CltMCa5Qkm0PhF+TGScm4QcpbXH1v/w2S3mwHL3sOnw
 pCEYdXwN09wtLVUBpBLYW0mMm3UXKoo4ae9Q6IsBL1kvtEmewwsOnoowushuG6tI6g1d
 3A/dSrFdayxo/Km5v9BIW7G2H2f1zgvBmty8YnLnSgfc0fNf09t/qFDum2IkXg8SQSVl
 9us/Kv164VwxLejFKqc/dZxbmdoluedh6lstJ9US7S3F9juDftsLy/BR2ZjJE3ThrKri
 oaeA==
X-Gm-Message-State: AOAM532w0jMB+Z97tR2IzjVlgcqvnODuv53FwgHYXghlRuiecw7ys3OT
 K2sn8GY/zMJs9/UkwYvakWc=
X-Google-Smtp-Source: ABdhPJw7gq+uZcEL/myC5985B59dRsdZKI1OrUOlw2agxfZ4Cwb3rYGc90xQ/81U/eABQrJtLqfQFg==
X-Received: by 2002:a1c:440a:: with SMTP id r10mr8334657wma.8.1629290478949;
 Wed, 18 Aug 2021 05:41:18 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id a11sm5720454wrq.6.2021.08.18.05.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:41:18 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 1/5] drm: rockchip: remove reference to non-existing config
 DRM_RGB
Date: Wed, 18 Aug 2021 14:41:10 +0200
Message-Id: <20210818124114.28545-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
References: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
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

commit 1f0f01515172 ("drm/rockchip: Add support for Rockchip Soc RGB
output interface") accidently adds to select the non-existing config
DRM_RGB in ./drivers/gpu/drm/rockchip/Kconfig.

Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:

DRM_RGB
Referencing files: drivers/gpu/drm/rockchip/Kconfig

So, remove the reference to the non-existing config DRM_RGB.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 558f1b58bd69..9f1ecefc3933 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -9,7 +9,6 @@ config DRM_ROCKCHIP
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
-	select DRM_RGB if ROCKCHIP_RGB
 	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
 	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
 	select SND_SOC_HDMI_CODEC if ROCKCHIP_CDN_DP && SND_SOC
-- 
2.26.2

