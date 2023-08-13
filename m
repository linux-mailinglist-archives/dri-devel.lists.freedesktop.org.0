Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F48D77A937
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 18:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3502910E0E1;
	Sun, 13 Aug 2023 16:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9304410E0E1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 16:11:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B27663584;
 Sun, 13 Aug 2023 16:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD26EC433C9;
 Sun, 13 Aug 2023 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691943082;
 bh=Xl+zWuxlzf8UrZZuScqSJCZOz7bnr8WH0zt1Hh4Qr00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bv7KSdTJ0lA805HeMN/fnjuNl4yEWbGFW694vEMhu0z+Xj4InDf6saXe7+TjhJ1Zq
 Qr+loXLrYVoAEk/wteyOmVrUbKMVrmc5ZiWYW5s9aqwFSTKNXBg+q788b6p64hqvfl
 mhgKO3ky1WAGCAKbbLFSvd0ZcIplhXdV6mrJNYEcdxgGPvYv/tLzxMwpMuOaI7fyQf
 Os0zwWTjpNf1RS0KNTHC8PiqK7zsStCGDDSUZerwC0fDhTyI/DEKpVtOfcqAY+XAge
 lelD9PPftsVIqppMqFiPq7wYrqOxM6uLh126n/vj6rUiEWbAmicViNCzif9sDf7rBe
 1MY3fKbx8qw3g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 23/25] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Date: Sun, 13 Aug 2023 12:09:34 -0400
Message-Id: <20230813160936.1082758-23-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160936.1082758-1-sashal@kernel.org>
References: <20230813160936.1082758-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.190
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Raphael Gallais-Pou <rgallaispou@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Raphael Gallais-Pou <rgallaispou@gmail.com>

[ Upstream commit 4912649e1cf0317bf563f91655e04a303cacaf8d ]

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes a warning when the module probes. Fixes it.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Link: https://lore.kernel.org/r/20230718172024.67488-1-rgallaispou@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/fbtft/fb_ili9341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab3..47e72b87d76d9 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -145,7 +145,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
 
 MODULE_ALIAS("spi:" DRVNAME);
 MODULE_ALIAS("platform:" DRVNAME);
-- 
2.40.1

