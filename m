Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A872D90AA
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 21:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FBD89C53;
	Sun, 13 Dec 2020 20:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C675C89C53
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 20:57:41 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b8so1538097plx.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 12:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+C7df/JhpDNOhvRuvCv8MZFRD0LpPBGsO24mPtK2tQI=;
 b=JAssQKBLdQSUpXX1qdsRhJs56Z8/S+6oAKAbc2F2UTnmO2I+q7uRH9uRh4kOH21iAu
 /RyV5qbTL3/JHc4nWUw6rUycYHRekYUz26ozaJTKdun9or8Jn3ihWkW4HWXRirHD/RAm
 Bbsa12k6y8jSu5N/XXdY4KEQINEtcq2Hhz6/gUW9AA0/zEtIA/9N6apB5ZLhh5oINcp6
 J0s66SmiAsEB+r3QWzQw4NCzqABm2x/uWZN0/zWdfYMK3vHC4pDYVuZX3n4W04xHqH4a
 jV3jwPifpbjlwWQrr0FHxTpwmXU1VBwzhzy21Hb9lY6JIQ6uNQ3lFXB7309yQV78olIj
 jPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+C7df/JhpDNOhvRuvCv8MZFRD0LpPBGsO24mPtK2tQI=;
 b=so8doLKf9r+kVwRs/Qa/ePRaRCzSOMpMJIBkYpdI+TIX1GjoH5n9+weZEazAXKki9q
 ygGmqwHqNYsfHJ+p/6uTSkMHsEldDZfeFRjhbuBsSXHfNb99E7qKI1oWXKuJFwLq2WRp
 9ZLVH3yN0RUROsiQNVPtiOOk5j5BXkJi6iznOjNXCkt7wiCXubwA9sq0jlzI7xa2+r+m
 HC32gpYkxsyeN1tYJvqIZXc1WVw2v8tiG1LyGhHxEGfCiKOrOAlihsm9TzKS2whniGpY
 xhXJ+TJgc0IKVBLDZz1+DrQymobscX8xU0J3Ji7k837dd+IdFAre/deVNq6Cf/7LffiX
 TDTA==
X-Gm-Message-State: AOAM531NsQlIgiBbLxcXpXASOYt0LGkluWtBKTrKaI4yA6YynUMQyBLW
 t/OGCINF8jmYS31heDYsCsw=
X-Google-Smtp-Source: ABdhPJxlNQ9tZOYsryjlZNee15dnRjN02bQG+zSlcPfd2KePaHUVhVXhFDGFhfxyCkac3knOhN+0fQ==
X-Received: by 2002:a17:90b:3698:: with SMTP id
 mj24mr21767123pjb.149.1607893061404; 
 Sun, 13 Dec 2020 12:57:41 -0800 (PST)
Received: from glados.. ([2601:647:6000:3e5b::a27])
 by smtp.gmail.com with ESMTPSA id 37sm14173930pjz.41.2020.12.13.12.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:57:40 -0800 (PST)
From: Thomas Hebb <tommyhebb@gmail.com>
To: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RESEND PATCH] drm/rockchip: dsi: remove extra component_del() call
Date: Sun, 13 Dec 2020 12:57:26 -0800
Message-Id: <149477f8d5d5a76c624766cb8cbdfdb3fa416ee8.1607893019.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Resending since I wasn't subscribed to dri-devel

 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 542dcf7eddd6..ce044db8c97e 100644
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
