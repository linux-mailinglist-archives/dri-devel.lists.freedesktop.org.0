Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7202948AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE446E978;
	Wed, 21 Oct 2020 07:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FDC6F44C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n15so3237402wrq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUKyzhSGhUR/Bwwd5x38HZWQ53tYZ5QssSwc3z6VJCg=;
 b=WnvZJskixl0tYxIjUvfdGfd3sQFS/qQ7mBwPCXEslhPAIP8Mf53G5brThLZkuzn0PQ
 +N5GMsL02ari+rbsuqrlf032XTeg8kuwW3GwGPH1d4tNoXxfMqJ2Zez9pn/tIx2U1z/9
 jaenEiZWJsAmrEMpVm6IxMNe0N3rFNPM0qxiMdEG+GuZHrKd03khMy+vPcRYWJL3gsE2
 Ltm4+juqIRNNziZDNWoMPqgkpInngwFBFbdB+u6m3CDOXjQr9UWQciRtoA844ZGOAemA
 TswLIGcpSC7erqVAnCrGGIjwmnkplMMEYZOCkGEhCFQ2ukKKR72z5EmSwl4aLfH1dsS0
 /I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUKyzhSGhUR/Bwwd5x38HZWQ53tYZ5QssSwc3z6VJCg=;
 b=SPht3EypwhynNLfzGmrnHI+CbjIh27pf2sxVh76JGBwj/LBjJYwLS6c6lpkl/m6W+X
 dbfC3G18jS7ShgCfN2vJ6AA66laGGH55JweGh5rtSndoEEBhdt1BnlPYxQdfjQpLxpTG
 51HqU92bPdUtg1TRR9+xdqKf9pSPghiocVOdl9ht0IvyNTXT5GX8fR/gF6ABY+FcZKXs
 cZurX/b6P8XUgI+1fq5CiqN5GU5WJPvZ44/+gsoYwIyCfB2adXPRbiRogC7VnzpKlvAh
 LMBc3VWblYuX8QjyYFkFnuo5nG+xlSiFvg0cFBxz06PvHcZgV1TGei0CspspTrK8tOp0
 e5vA==
X-Gm-Message-State: AOAM530dYm6hb46b8AzcyUz/JrdAYykvF8O3l26OmGXe78i6li+BG8sB
 TjR5QDnXRqB2/VvUwmfpaZ4CRg==
X-Google-Smtp-Source: ABdhPJylIT9S52zEh0LE5r5mbFdXBQ69vOLAAksKF1Kpq3OlZP0kKeEVshgGZzd/uO0H63x7NnFyfg==
X-Received: by 2002:a5d:5604:: with SMTP id l4mr4614953wrv.140.1603215787049; 
 Tue, 20 Oct 2020 10:43:07 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:06 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/mediatek: dsi: add support for MT8167 SoC
Date: Tue, 20 Oct 2020 19:42:51 +0200
Message-Id: <20201020174253.3757771-7-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add platform data to support the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 08786734df8e..d90dd0f83292 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1182,6 +1182,11 @@ static int mtk_dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_dsi_driver_data mt8167_dsi_driver_data = {
+	.reg_cmdq_off = 0x180,
+	.use_hs_on_power_on = true,
+};
+
 static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
 	.reg_cmdq_off = 0x200,
 };
@@ -1199,6 +1204,8 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi",
+	  .data = &mt8167_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi",
 	  .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi",
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
