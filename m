Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFB4A748C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A430710E276;
	Wed,  2 Feb 2022 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCA110E2BF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:24:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5166B83063;
 Wed,  2 Feb 2022 15:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA57C340ED;
 Wed,  2 Feb 2022 15:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815470;
 bh=6aO7Nzm3pbUcauRahkbsSUae/bWW9PJ7FY+7rb3jazo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NkUFZENXO2N7QMDqrzZznEKjFuQv0d1xZ+5nuhoN8EXa3JgsrhjzpM6HOqGxJFxuC
 5KvzVuhv8I0BUZHzHOW/wbOoWUZ9hUwJTODET+P9xcrJMUCpcB8v0Awdp9ewRSIM9y
 +zrZxQNfqQAbeVSXQWVPskL4wrisT2hYwMMDxS4xINnMmtV1WScMIqEs3gL8jIRK0y
 N60U1Xr2jImZzUKLfVqAgv/pHK6RifYRuYz7yGpHhGY6+laXTj81TyGu55C0fGofdN
 UCCBODSCaVjRYeHR9y+jU9EiTRV35IPdFrjkGKKeSd+EtkY5a1Aue7FM1vqlt9kXTY
 hEkeW008glRKw==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/panel-novotek-nt39016: Add SPI ID table
Date: Wed,  2 Feb 2022 15:23:51 +0000
Message-Id: <20220202152352.20342-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202152352.20342-1-broonie@kernel.org>
References: <20220202152352.20342-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; h=from:subject;
 bh=6aO7Nzm3pbUcauRahkbsSUae/bWW9PJ7FY+7rb3jazo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qIGQWpBYwp9NA4MVKuwLXj8tphWkkieHaXuQ9zU
 CnU0wfqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqiBgAKCRAk1otyXVSH0KPFB/
 0W19Db+haBpxuiNYkNhqqCjohJAZFklqLs/G1PcC7zk5QFzzlSdX1GZ9bBpzXrDBJgdCZ7KiqXBSs3
 RUMnYsBpHwN0ShDayGQXHCvrDn4U2KUGsiJ1aQd2TVypH+N2GMsHRqKRtGG1OuHj97gR0XWhOGZM5f
 L7C1RSkiNxl/sb+4PDB9M4I/5hhDHSbKYvNU+AJ5VB8Yi5ihWesQdLN/tSVYO56PeReekYg9aVmkT7
 Ve/iekCwltwSC85KXAi1XSg1iMUBMAtPC8VKFVXMkHRrpZur2UjmhR2WuUQIHF7hZmBcW3d010oaXg
 Bt7XfmqqNaPNnW4ZXlGDmoUVOzKiNu
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
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index d036853db865..fa6ffa7fd96e 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -346,6 +346,13 @@ static const struct of_device_id nt39016_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, nt39016_of_match);
 
+static const struct spi_device_id nt39016_spi_ids[] = {
+	{ .name = "kd035g6-54nt", .driver_data = (uintptr_t)&kd035g6_info },
+	{ .name = "nt39016", .driver_data = 0 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, nt39016_spi_ids);
+
 static struct spi_driver nt39016_driver = {
 	.driver = {
 		.name = "nt39016",
@@ -353,6 +360,7 @@ static struct spi_driver nt39016_driver = {
 	},
 	.probe = nt39016_probe,
 	.remove = nt39016_remove,
+	.id_table = nt39016_spi_ids,
 };
 
 module_spi_driver(nt39016_driver);
-- 
2.30.2

