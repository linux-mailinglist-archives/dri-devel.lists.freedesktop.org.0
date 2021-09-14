Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23940B097
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 16:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51C16E4AB;
	Tue, 14 Sep 2021 14:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32A06E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:27:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso1964793wmd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bfv9mrhoCCh8u0D+lkls3XOLkYlFZSKbSMNA1jMqkE4=;
 b=P0ezE9qhfQ7YFuhO5o2QECi/f/dbGOGBXB+TO/T0hYa1m+Ql/DlKarEYdW/5O3TOTH
 cW54RAgvnTvUqFw67C78onjTPCu1bhmEPLrp5zufgaEkbjSBiSn7bc87IaxENdMiIz+3
 Yzg9YIUIv0Yr/MEvhpR30B1yG4bwzj7WBzKkRU3FCDl2CABwwgB2xL0iuVblIeorM0/i
 0UWWW3QYVAFNrknaal43z8LCumbNcimR/pCBL1HHkQRBkAlhCmyV4r0daxNFNB3cR5k3
 vUVNiQKODDkdy2c3fItBF68vVG0jVvuv9nKkS+l3WSKwoSYl2B7teU1fNbZmmQSX8YgW
 QedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bfv9mrhoCCh8u0D+lkls3XOLkYlFZSKbSMNA1jMqkE4=;
 b=VBYNn3Lo+8srSqm9LtoHiatYB3dp3Asv+wgedBz4kSKiqqwBlSpSKwNH7zNeDOkZ0x
 K71vTD4rCIcoqmdGnvO3I9allDbcERWWtxjK+JT6TsZA82qXpXy7qe0FV0ngOBZLhrNa
 nLFzdLazUfLT/aXIjDbkG0q0OWrrHP45rgZAzWXCFSb8V5Qz1oQ+GBfacBIo7eFmwTjm
 sz/cbuCzhcFplMxCq5wYFB4d/2RIUjP1TqSaJpqALxBhVVcJIe0rYZLdILl7J7B0XceY
 b3MTJlkpnRP0RnP1B7qzVQGqkvSq8D4z1uBnBB4dwDGg4SsF4ZaZ08FureYmMeVmZUEP
 ejUw==
X-Gm-Message-State: AOAM531a2Eg+PI7rP3K0JxvmcxYFU+OtU25FSmqfOBmayRqngvrxpUvY
 44Lr0HHqgz8aaTXg2HoecoQ=
X-Google-Smtp-Source: ABdhPJy3weP4Jyqn57+GuhwJkx7GYziPCndmJZ3YD2KZvj7dUExJNkmb/COoWp+4u1vnPjgGwJyH3g==
X-Received: by 2002:a1c:20cf:: with SMTP id g198mr1014787wmg.143.1631611643356; 
 Tue, 14 Sep 2021 02:27:23 -0700 (PDT)
Received: from monk.home (astrasbourg-652-1-178-243.w90-40.abo.wanadoo.fr.
 [90.40.105.243])
 by smtp.gmail.com with ESMTPSA id a3sm9734085wrt.28.2021.09.14.02.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 02:27:22 -0700 (PDT)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: 
Cc: paul@crapouillou.net, Christophe Branchereau <cbranchereau@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] DRM/Panel : abt-y030xx067a yellow tint fix
Date: Tue, 14 Sep 2021 11:27:16 +0200
Message-Id: <20210914092716.2370039-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Sep 2021 14:25:17 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous parameters caused an unbalanced yellow tint.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index 2d8794d495d0..3d8a9ab47cae 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -146,8 +146,8 @@ static const struct reg_sequence y030xx067a_init_sequence[] = {
 	{ 0x09, REG09_SUB_BRIGHT_R(0x20) },
 	{ 0x0a, REG0A_SUB_BRIGHT_B(0x20) },
 	{ 0x0b, REG0B_HD_FREERUN | REG0B_VD_FREERUN },
-	{ 0x0c, REG0C_CONTRAST_R(0x10) },
-	{ 0x0d, REG0D_CONTRAST_G(0x10) },
+	{ 0x0c, REG0C_CONTRAST_R(0x00) },
+	{ 0x0d, REG0D_CONTRAST_G(0x00) },
 	{ 0x0e, REG0E_CONTRAST_B(0x10) },
 	{ 0x0f, 0 },
 	{ 0x10, REG10_BRIGHT(0x7f) },
-- 
2.33.0

