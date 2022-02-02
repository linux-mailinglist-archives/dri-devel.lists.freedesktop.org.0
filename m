Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC34A748B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602DA899AB;
	Wed,  2 Feb 2022 15:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319208977A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:24:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5E46615A7;
 Wed,  2 Feb 2022 15:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60832C340EF;
 Wed,  2 Feb 2022 15:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815468;
 bh=u9PwIkdMzz7u4ODiAsVA899tyWIJLHEtwCmzwaoeHrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LarZb2bbeoVdNlQs7JiS+VqVb9YezpCAKi8JdJYK86DuiAksYmX8zXxYuzFEZQdHx
 IGQC3E2Ye3sfz/l5Lg07FVmbjBVBOIaPmY7Cul9xDs9T3+f50zhJC+sF+sKZqc3R2G
 BgeClFjRjqiM3iAJOZeuTZmzHfY7UnnOela0XNZpGj7zZ8Xgid/MHYuNx8P2GmZKu8
 VMhKycmFuafokszHWavze4hqPbLQD1WwzPanF7m0p14fd61FBSRz2S/4s9hx2nu7rb
 d/YUoFH7k4fx4QrrPK4ryhY9vQT1g54lDtFgXPhovI4GasH4cuJWoASQxxAAljnTBb
 GxqJDmBR1m78w==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/3] drm/panel-ilitek-il9322: Add SPI ID table
Date: Wed,  2 Feb 2022 15:23:50 +0000
Message-Id: <20220202152352.20342-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202152352.20342-1-broonie@kernel.org>
References: <20220202152352.20342-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523; h=from:subject;
 bh=u9PwIkdMzz7u4ODiAsVA899tyWIJLHEtwCmzwaoeHrw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qIFGm8i91C/xNUR97KM47CHSbHQrf9yG918d2Op
 j4Kxn3+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqiBQAKCRAk1otyXVSH0NZFB/
 4vsXtKgUUiFbGLqEM+CyvpYv3Q9LRGOoJJEsC/ViuOMhEpqw2qH+YwVYYDg1kIgNjQ2nO9A1/uOiQO
 R7Aqe4E8f9/I8zxOrDeNYnKQ0hqc1c4ERhOuNPDLsvfKB8DnNPRgWsA3NDt44AnMHbm7SgJqRBkZpj
 KiLa2GRoEYY8EADcSt5fE+xGYBKUjXWpzM5TjXZ01hnRq9OFkLIxGzB/KUnHKv9849ycf/62lM9hm+
 Ygr43DA097y6Deh224qKXUPgKx4Kgg7k9dK77iIke1SNJzgbtfpX7fb41GqLM2NP6Prg+xFobCFKVO
 oEAzxdjPhMdiJtGUHrPbezrXgrBaEU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding an id_table listing the
SPI IDs for everything.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
index 8e84df9a0033..c7a980fd6406 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
@@ -935,6 +935,19 @@ static const struct of_device_id ili9322_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ili9322_of_match);
 
+static const struct spi_device_id ili9322_spi_ids[] = {
+	{
+		.name = "dir-685-panel",
+		.driver_data = (kernel_ulong_t)&ili9322_dir_685,
+	},
+	{
+		.name = "ili9322",
+		.driver_data = 0,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, ili9322_spi_ids);
+
 static struct spi_driver ili9322_driver = {
 	.probe = ili9322_probe,
 	.remove = ili9322_remove,
@@ -942,6 +955,7 @@ static struct spi_driver ili9322_driver = {
 		.name = "panel-ilitek-ili9322",
 		.of_match_table = ili9322_of_match,
 	},
+	.id_table = ili9322_spi_ids,
 };
 module_spi_driver(ili9322_driver);
 
-- 
2.30.2

