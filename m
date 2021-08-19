Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B583F1819
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 13:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5556E8B0;
	Thu, 19 Aug 2021 11:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735776E826
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 11:23:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z9so8513292wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKHb4NbS7zSt/cAMTh5zeYF+NOqO7vbF0bCJdamG5w8=;
 b=KKnuQyLT6+OXQcrUZMcuh/d2Z/DDvB2NOinD/1yOhMmePARneRz5HZ7qh61IDX+Dt3
 Wux+6MqEidb4b6rKjvxxEbtUC31jY2ZsreYmn/eQIUJTj5CcsLLcqeqdl3rIs9kwg5fQ
 HRLhfMUPIr9ch3qJLKpKRNA9rc58A7sFAjGCHmk/RVwbMMMfMicxBj1dJiAqGBc7AX6T
 +5l//g4V36EtBxfD9O0g23WGfnlXDdctyCB6uZXypVyVhgc/SV7lGh/TsevHy4bTtp1x
 oQumukcCKjv5WtPSQQLdPv01dVto9EPNKHrF3tG0yS8nsl+OWhHG3dZAUN6YtmlJ5Ulx
 eITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKHb4NbS7zSt/cAMTh5zeYF+NOqO7vbF0bCJdamG5w8=;
 b=QlDZgLqSxVlW6nPwoPWzsTv63F5fDMRPEgm0VfoqyTZglAADZf+YSOdYwUmLhefh2l
 ptXbEvUcemG68NXXlSCKbsMw/6xoY0EsSwf5bcLZmQDM+g072QpnJMANvQGQyPQsPgbS
 bJh/yGXPyo27QeJbX4PWEOPFwr3qJve8LzI2HtlvS5yGm+Sm5aoQyuoyyPVL2kQgGdyM
 q5qz6MKw3MV4Mn6MoXpm3WPwowD5FWfIkgK5wyqwsY6fcB7A0fYbTJTo9eH86/GCgpNx
 9bKzclBSaC8KJkbw7SEJPkeKB9rNYfBsGvG6fU6RRcBN4C7lcoONE3auMi3ZDqoHvHGZ
 X0KQ==
X-Gm-Message-State: AOAM532GZkE/r1K8ENIDFX56M7sr17oPfCqnu+QyJ+ZSyImjMlub26PW
 CvemyNouJU12cCSDlo6/A68=
X-Google-Smtp-Source: ABdhPJzkEyt7R9ZPNwx92CRL6vBJwvvSAga6l5i/e3XkzCnbhssNxRAaHA3MPWa51vX+D8nmfiUw+A==
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr3124177wru.411.1629372182988; 
 Thu, 19 Aug 2021 04:23:02 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id r1sm2700388wrt.24.2021.08.19.04.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:23:02 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 1/5] drm: rockchip: remove reference to non-existing config
 DRM_RGB
Date: Thu, 19 Aug 2021 13:22:49 +0200
Message-Id: <20210819112253.16484-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
References: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
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

