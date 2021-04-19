Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE036393B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 04:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E840589DB4;
	Mon, 19 Apr 2021 02:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79C89DBD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 02:03:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id cu16so15008024pjb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Apr 2021 19:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPSD3xSDTnWh+Nz3+j4qm9HcpmcWDhRQcIMOD/a1Rz4=;
 b=g9nR0Kbn42QWboT8F+6HxD6U3d0etIiPNbzLS/QlrD4hcH3iJ7r2KuKR8wqfYk1cYx
 gvggLBh2tmd/kffs8WPwAZImhvYs3tMOulBU217tAPhFwZDktxbLk4qL1zSSpIHJKRyI
 EWUjhp1OeyzR5NyRODiA/rXgilfjzroi9Uuo7Rcbcr7N4+neFh3WuMNt+d/lNWtLHQfi
 /UoZKxYxh/R03LJ+Wyc4ANAolRCDzKN/pCRbfSbL5asjPQlvWzPtH90EYQ6halOqKIQG
 pYYckbYvEuFrSgpGT+uw1xcI6ahBFH/2SD8OWAU06pN4xXPh8uGLhs/YlxT25ibL+2rV
 OcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPSD3xSDTnWh+Nz3+j4qm9HcpmcWDhRQcIMOD/a1Rz4=;
 b=SoSrPbhWv3bSxcCriQy2lGIfCLeFtnErQ0uqoybZ6Q3p8PRy/vLQg2N7pudyFSi6Tw
 f1WgAucDr14vX9c+kxOG+HqNeAhUfdMXocn8zoOieWns+83dw/Y2p2l3qnUvES0rxxRq
 /ZIepd5BtaMGzC/b0iMTmDWoWt2/DDtdTsldBEpjCy+QsPqasYF4Qagi5ujMuDIzfgpY
 4NEhHdKbGvphctR9szwdBaEGs36l6MGvjfKy3ChR+dBWk0wrf4HQchMkhqi+sb+7z85H
 c7KGOCkU6UqWBZItxjvCyNX1owV/Q/jbj1tvTCn9XINjLC4ccW04b/pV5ECWDZoiKfW1
 V8DQ==
X-Gm-Message-State: AOAM532L9ENumRx8xGTaho5Q+Ep1pwRJhfrd841FsemzABFcNnBIvmPp
 HuvaqTjEZmuix2+IRCo/Zng=
X-Google-Smtp-Source: ABdhPJwUK8c2110qQsGdlilhEVH6RNovspU3KzWKZqoF2+bgUFBln1/xQm3+prddHRsNE4KE+2EMDA==
X-Received: by 2002:a17:90a:ff02:: with SMTP id
 ce2mr22236666pjb.217.1618797788273; 
 Sun, 18 Apr 2021 19:03:08 -0700 (PDT)
Received: from glados.. ([2601:647:6000:3e5b::a27])
 by smtp.gmail.com with ESMTPSA id kk9sm61753pjb.23.2021.04.18.19.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 19:03:07 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RESEND PATCH] drm/rockchip: dsi: remove extra component_del() call
Date: Sun, 18 Apr 2021 19:03:04 -0700
Message-Id: <201385acb0eeb5dfb037afdc6a94bfbcdab97f99.1618797778.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thomas Hebb <tommyhebb@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit cf6d100dd238 ("drm/rockchip: dsi: add dual mipi support") added
this devcnt field and call to component_del(). However, these both
appear to be erroneous changes left over from an earlier version of the
patch. In the version merged, nothing ever modifies devcnt, meaning
component_del() runs unconditionally and in addition to the
component_del() calls in dw_mipi_dsi_rockchip_host_detach(). The second
call fails to delete anything and produces a warning in dmesg.

If we look at the previous version of the patch[1], however, we see that
it had logic to calculate devcnt and call component_add() in certain
situations. This was removed in v6, and the fact that the deletion code
was not appears to have been an oversight.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20180821140515.22246-8-heiko@sntech.de/

Fixes: cf6d100dd238 ("drm/rockchip: dsi: add dual mipi support")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 24a71091759c..8cc81d5b82f0 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -243,7 +243,6 @@ struct dw_mipi_dsi_rockchip {
 	struct dw_mipi_dsi *dmd;
 	const struct rockchip_dw_dsi_chip_data *cdata;
 	struct dw_mipi_dsi_plat_data pdata;
-	int devcnt;
 };
 
 struct dphy_pll_parameter_map {
@@ -1121,9 +1120,6 @@ static int dw_mipi_dsi_rockchip_remove(struct platform_device *pdev)
 {
 	struct dw_mipi_dsi_rockchip *dsi = platform_get_drvdata(pdev);
 
-	if (dsi->devcnt == 0)
-		component_del(dsi->dev, &dw_mipi_dsi_rockchip_ops);
-
 	dw_mipi_dsi_remove(dsi->dmd);
 
 	return 0;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
