Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4339750B7E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF7010E55F;
	Wed, 12 Jul 2023 14:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4574210E55F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 14:57:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so78899695e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689173824; x=1691765824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mJrp5y7emiUiskxEtT6O6KgXmyIwXxE+Vf82XYcN9+M=;
 b=JTg3PenSA7B5nNFlCA58eU1/tZgLP+HbTzZnZfzLeesLFXId098mracvvveoKZsy/6
 qnz4yYIVrns/sirnaeejvVQAHzzIKOuWJpRa4BtNBSJgab/DuqwdNubePsJLjkYN4gFn
 oAQujP9oyLm9G+KMLm0FWFulJO7gFkuIO6tif1T++UChWQvgO3IvXfgtK8yQyYHbUAqC
 /lwjlDIOzD2mZdPCRonqAeIqgy8kNgR6lPNLMyaicx7DlOb4fP3HYtP7+SWiZC1/zoIT
 efl+zNV1Elzbacv8spNoNmDmgoHWbSJKJmghh6f9eG9USLacVijw3Nx7X7P2MTYJJYCe
 z+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689173824; x=1691765824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJrp5y7emiUiskxEtT6O6KgXmyIwXxE+Vf82XYcN9+M=;
 b=jWvpRvoaBBGQtj+CTBspSyZ8mfYW/c/I8BamCDQiCp3tbzsBfbqGD1G26iEGBDDohF
 z6VWXJVbN9kZKPuUVsaRlve3yvW7QOhDpthoGGDmxUEu2IONh7WiAz69z4qQ+H9wpJum
 ZC77WNPHXKztzuNYeHWhkn/eC2LeF7C+Qiu2Fe1ieZE122ri9/si6KepE+disir0PFOA
 NSDIHTW85bIT67Ken59jf64Qib+dbkbzenOrVVOpvvPhdejrWaD92Hkm6EHTWjvC1rvF
 puiyzhoH8gFd6a9N04grLyAE2OEX9Xwa7UOHKrnwZJGfAdKoBVRfzDeAHKqOX53xqeF8
 Y64Q==
X-Gm-Message-State: ABy/qLbXMN4L6BZzQZavT0r8ta+uVwc/gz998tgOomeReOFKrpFFisxp
 LVawj5mwWZpAlWysnoBmBl8=
X-Google-Smtp-Source: APBJJlEtqBWVxQSl/4H18KOnasubDV3RZX1lpfd0V0GgtfogkuEuhDaqwDNb5GOA4PlOBrdZ84kGiQ==
X-Received: by 2002:a05:600c:220e:b0:3fb:9ea6:7a73 with SMTP id
 z14-20020a05600c220e00b003fb9ea67a73mr17101879wml.23.1689173823609; 
 Wed, 12 Jul 2023 07:57:03 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003fbe791a0e8sm5379371wmd.0.2023.07.12.07.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 07:57:02 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] video: fbdev: kyro: make some const read-only arrays
 static
Date: Wed, 12 Jul 2023 15:57:02 +0100
Message-Id: <20230712145702.460690-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the const read-only arrays on the stack but instead
make them static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/kyro/STG4000InitDevice.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/video/fbdev/kyro/STG4000InitDevice.c
index edfa0a04854d..bf1ee3addbd0 100644
--- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
@@ -83,11 +83,11 @@ volatile u32 i,count=0; \
 static u32 InitSDRAMRegisters(volatile STG4000REG __iomem *pSTGReg,
 			      u32 dwSubSysID, u32 dwRevID)
 {
-	u32 adwSDRAMArgCfg0[] = { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 };
-	u32 adwSDRAMCfg1[] = { 0x8732, 0x8732, 0xa732, 0xa732, 0x8732 };
-	u32 adwSDRAMCfg2[] = { 0x87d2, 0x87d2, 0xa7d2, 0x87d2, 0xa7d2 };
-	u32 adwSDRAMRsh[] = { 36, 39, 40 };
-	u32 adwChipSpeed[] = { 110, 120, 125 };
+	static const u32 adwSDRAMArgCfg0[] = { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 };
+	static const u32 adwSDRAMCfg1[] = { 0x8732, 0x8732, 0xa732, 0xa732, 0x8732 };
+	static const u32 adwSDRAMCfg2[] = { 0x87d2, 0x87d2, 0xa7d2, 0x87d2, 0xa7d2 };
+	static const u32 adwSDRAMRsh[] = { 36, 39, 40 };
+	static const u32 adwChipSpeed[] = { 110, 120, 125 };
 	u32 dwMemTypeIdx;
 	u32 dwChipSpeedIdx;
 
-- 
2.39.2

