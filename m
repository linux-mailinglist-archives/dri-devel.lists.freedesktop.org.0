Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E441D9091
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42476E511;
	Tue, 19 May 2020 07:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E109C6E209
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 20:17:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g1so11256890ljk.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 13:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuljtQBpIL0qjGzLVg3jHlIfvzyQopbP8u18XmNvs2w=;
 b=c/68PRJxvHcj3DE/yxZ0a6MERGu0//5Ick75ODI7dCtgrU5zBHrqVRNU4HqhHXpuZv
 d2t6doF3mTYCazJIDoW5wNqAvo295xPtO6XMe5O9De+h+U2GvwsbB9oRjv5mppLTNPiG
 IXXQ3kJPrN76Emfux8S/bccsLYFUG1rGlmLzl91IA3xyDGnNPQQwaB/xDvr7HfWHV7jG
 O+JQOi7F1hmaLXSoPNAE8hpr+hRZIOYwTkoTOe3MGG1R6c+S2gGHrdKZsu01ochO6/Hx
 s8HTJm6/tPmJeNBQuT+sIVCT81imNzDF4ndGjREky+I0LgIlKoYZosdlQ118PqrjndwO
 DrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZuljtQBpIL0qjGzLVg3jHlIfvzyQopbP8u18XmNvs2w=;
 b=lpyZUGuC2FjOkcFmtuikRNKOhQzUk/o0PEzQBu03y6abTozKpZsiE5GELmuBlbMn4A
 O16FGOjxKrvVlOsIh+jkDdIcNfv3+eqqOl6bMyEj45pJcNsSl1WnpkZXlnpVo2TESBqO
 1Z8XTRFfxMTaL6cNQ8EhwX2C/Jo/DklGWfL/4fMDEs+sdTzOiCzbE8KIh1kc1WqcWpMS
 a9bnBUTBcAjPQg5TWMN5525b+q0jHnfQjv0GjHHmdK+/fFUae4/0/+SSCnwwdxmi/Pge
 13UsOfWFXqZVSYLxiU9aFIUt4R7Mi48kbzq02XmvXdT21G+veOy14vLQVaeCtC1ralvG
 FIXw==
X-Gm-Message-State: AOAM533Z/pBVqRTVdphMptGJCvGEU/q024oBolSvjfjQxkG8Cz+jerrk
 bAsNM0mP9M+GIYTEwc2ezY4=
X-Google-Smtp-Source: ABdhPJzuP8HWeS92/QB/RT+ANHc+zhMPanKEN1AyPO8zGrOkYxuf1y3OyGB+GMp7sTVVMOa9zz/V8w==
X-Received: by 2002:a2e:8ec9:: with SMTP id e9mr3069561ljl.204.1589833049193; 
 Mon, 18 May 2020 13:17:29 -0700 (PDT)
Received: from polark.local (62-243-86-95-cable.dk.customer.tdc.net.
 [62.243.86.95])
 by smtp.gmail.com with ESMTPSA id r13sm6249279ljh.66.2020.05.18.13.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 13:17:28 -0700 (PDT)
From: Daniel Gomez <dagmcr@gmail.com>
To: daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH] drm: rcar-du: Fix build error
Date: Mon, 18 May 2020 22:16:46 +0200
Message-Id: <20200518201646.48312-1-dagmcr@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 Daniel Gomez <dagmcr@gmail.com>, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Select DRM_KMS_HELPER dependency.

Build error when DRM_KMS_HELPER is not selected:

drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'

Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..f65d1489dc50 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -31,6 +31,7 @@ config DRM_RCAR_DW_HDMI
 config DRM_RCAR_LVDS
 	tristate "R-Car DU LVDS Encoder Support"
 	depends on DRM && DRM_BRIDGE && OF
+	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select OF_FLATTREE
 	select OF_OVERLAY
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
