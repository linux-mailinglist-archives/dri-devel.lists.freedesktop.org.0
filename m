Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C255BCBA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4222410E6C1;
	Tue, 28 Jun 2022 00:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2F810E6C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:34:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ABC2C83EC5;
 Tue, 28 Jun 2022 02:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656376457;
 bh=i0jI2xE7K3D5587EnFb/coGHTojqxLKJKfH1kaMUng0=;
 h=From:To:Cc:Subject:Date:From;
 b=zfgBvgHXb33w95ZkDG1SHmE/zdN1eF2nzkUcchxBBKAEG+YFACM+r51nvqaVHCxLj
 k7/uQcz1j72X8qe/jbafEOTu3qJmbVOfbu9omjiFm1sGtCZOBnjDL7PNpidIQ1sNa2
 7HfdWG2/NR4dyhRSDpSYT55IPjrS7GguH9cs0jHeFxkJ4esDIRP962ufQFWM/Ke/+k
 1Hauyby1hEZLmRh0eyGi3kxzNGCUUFPYITImPKgg9DFKWS4VPXWTw2sw2einqQM1/E
 9ldcLwPJR/NQ7BNvTKr3rT36bmvNxfT6AaoU+tDEvdYBr75VeIW9ly9V87p+1ESvNY
 IVL4Pn7U1P2Cg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/doc: Fix comment typo
Date: Tue, 28 Jun 2022 02:34:07 +0200
Message-Id: <20220628003407.77765-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace apprpriately with appropriately.

Fixes: 1e4d84c6589e9 ("drm/doc: Polish plane composition property docs")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_blend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 46ee5d5df6b40..b4c8cab7158c2 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -80,7 +80,7 @@
  *
  * Note that the source rectangle must fully lie within the bounds of the
  * &drm_framebuffer. The destination rectangle can lie outside of the visible
- * area of the current mode of the CRTC. It must be apprpriately clipped by the
+ * area of the current mode of the CRTC. It must be appropriately clipped by the
  * driver, which can be done by calling drm_plane_helper_check_update(). Drivers
  * are also allowed to round the subpixel sampling positions appropriately, but
  * only to the next full pixel. No pixel outside of the source rectangle may
-- 
2.35.1

