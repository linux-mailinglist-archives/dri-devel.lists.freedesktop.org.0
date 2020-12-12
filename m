Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39DC2D9408
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736B36E0E1;
	Mon, 14 Dec 2020 08:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA83897B4
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 22:24:05 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s21so9501155pfu.13
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 14:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QtJXBVt7gHI21bYFoZ1JoDV4VjhjgVIaaJDaUSnjM6k=;
 b=pY6anJiq1VYF1jMzjF+dcOuysiwgKQDBjxl4pI8MvZXad/L5wQeiVvdBaxzIBH4eXF
 I0u0mlSOK6Q1WgcgHP4nVk4j5+r9Fe7OHS/lRK5OMbfKq3aPDYcmkDpA2KR5OrRrdHJ5
 kOMhOOGcT5JwrjmDUIutKsPkSxPFJdqC6jG22WHBKp34KLojdw+IeJ9eI2bOfk/NOenP
 ckFJQvY6Nx+gkkerIPwjQn7qOmkWBz2Xpncl37I+ibqgkLWqhTTuA4Xznaikb0/Vs821
 W+sq6zDvupwDluvrcNkKqZ8zrN6TrTapk3X6/IYF27VPMZaUCDKbH2C5j5WRaihImvDq
 fLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QtJXBVt7gHI21bYFoZ1JoDV4VjhjgVIaaJDaUSnjM6k=;
 b=dtZXwYqFeqoW/+h34xUYrOFyN5TwmNNIhIS/jiXC6lW3IoYmByt8xy5U/aYFFipt6D
 fZmUF/zQomjYTE0aBn7o5HCq7pGblUnp+uZBqn3UQCtwV3X+3Hmv91IH1uiP2nKUI65e
 jwxm45PzpnjESoYLM0wqqh1qX3mhrLyTnn0sP5NYiIyR7+oZuoWnVKvzeQCZsTWG1lEU
 a8JoKce/b04lNgbn7ThtoCOQdodp2jSxm81dZZm3jwuRJqiK9guCY3L5YJYrjbiwaKuE
 ppKu4Z+DWbG/xYfFFKJ4GXyuqXKOkjOCB3+C5kgaUpEuHrTUxP2AYfsZHie+HosniASl
 nvQA==
X-Gm-Message-State: AOAM530tyy2sE5qjS4sG5xXO56mM0VR7onoQxARYvrBcRojxQIFwWskb
 n+5AFpjKMe4VTVXeJt17Zjg=
X-Google-Smtp-Source: ABdhPJzLYLeOuMQKOWMGgFp4pj8D4j+yoysIS0L8UZ95aYc/Z8WmvA33yxJuB5XMv5grTtczBMPB2A==
X-Received: by 2002:aa7:9738:0:b029:19d:dce0:d8e7 with SMTP id
 k24-20020aa797380000b029019ddce0d8e7mr17276456pfg.14.1607811845359; 
 Sat, 12 Dec 2020 14:24:05 -0800 (PST)
Received: from glados.. ([2601:647:6000:3e5b::a27])
 by smtp.gmail.com with ESMTPSA id na6sm13244256pjb.12.2020.12.12.14.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Dec 2020 14:24:04 -0800 (PST)
From: Thomas Hebb <tommyhebb@gmail.com>
To: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] drm/rockchip: dsi: remove extra component_del() call
Date: Sat, 12 Dec 2020 14:23:55 -0800
Message-Id: <b6fef187969c45c3153d90bfd1cba684b764a225.1607811826.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
