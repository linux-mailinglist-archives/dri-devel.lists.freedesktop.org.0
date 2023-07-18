Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8932757658
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154210E2EC;
	Tue, 18 Jul 2023 08:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D504010E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:14:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso33816365e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689668062; x=1692260062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/eySJfQ7/Gc/AEP/cNfIUTGk9yVoHTH7Q2UCStgdmPk=;
 b=XzGeZP2wfi7lajh/fHbLEBJLGoAEiqq93llvJZk83NQLWkpkhmJAPN4y6D1tu3zrxn
 RFIt3dvm5FsiQrDmGigRFSxtj/klhPmQ86sy5b/xMdTu5m66zEilWY9Hjajhx+6OkUPY
 iqX2cNwwDpxwU/8UNAHY4k4e/nCqWiQ//ioPJ8/0tLJkljRyQXzDVpx2og+MBslxVCk5
 siOxXQU1aBTN3mWlYuQVKiamtHU829DnwSBRpsp7B6oFee9zU2kQbuwoPaLNEir5oKOJ
 0VCPx9V1Bd8q3ZJ8+oVMKF1zmAzJ55XtzP1Br+PzvxynBNdBcv1YWWnONYKkFtTWrlCn
 dCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689668062; x=1692260062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/eySJfQ7/Gc/AEP/cNfIUTGk9yVoHTH7Q2UCStgdmPk=;
 b=FOlqUI+Cf9vZSzUDDBTFzndPLTIF82e9sZgrszgXcPtm7DO+HJtst1h2gGaeGuYZWg
 OnKAaEmh1rMPYwTptNGtyjyeHa/ZM8DCBHJvAWemMQOnWrC9PygVaeY3RLTvLojy6Vf4
 8egC9pMX0wx0RUYwfGGpGN9PdJccj+4tJEGNYf9ReHSIqjOz9CmiwqhuVkIisyyG+ULv
 i3TEvdYmHX/WVT0Dv2KdJz/VxZCCPraWbqEkrKwVlr8PUXvqEuc6D4F/lXmo0iOvW4VB
 vIU9ECtaWo5B7fSfCW0IYRJ9zBsEa7iRbaelihOk6217l7qH1UB2VP8BNIxp312Wkh06
 31Ng==
X-Gm-Message-State: ABy/qLYeUwyF/SXtebWGot/B4C4LJFg3+J/MMYyy1wN6f5DMLx73IJqy
 o0yqnTSF0wdfQZ6si4O8ig0=
X-Google-Smtp-Source: APBJJlFUcyYNxBMp/Ez4i7yBxOUkaSiUF+hhVo3KRjjCatmyU6lTEJosDE+EkEfmsxzp8bFfdalcVg==
X-Received: by 2002:a05:600c:2046:b0:3fa:8422:158d with SMTP id
 p6-20020a05600c204600b003fa8422158dmr1225340wmg.18.1689668061660; 
 Tue, 18 Jul 2023 01:14:21 -0700 (PDT)
Received: from localhost ([37.174.75.194]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffc50000000b0031432c2fb95sm1626137wrs.88.2023.07.18.01.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 01:14:21 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v2] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Date: Tue, 18 Jul 2023 10:17:59 +0200
Message-ID: <20230718081759.28902-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes a warning when the module probes. Fixes it.

Changes in v2:
	- dropped MODULE_ALIAS changes
	- changed commit log for more accurate description

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/staging/fbtft/fb_ili9341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab..47e72b87d76d 100644
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
2.41.0

