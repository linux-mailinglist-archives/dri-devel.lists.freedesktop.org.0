Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E77F708F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0A210E7CC;
	Fri, 24 Nov 2023 09:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0617010E7CB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 09:52:27 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-544455a4b56so2312116a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700819546; x=1701424346;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lPiBn2j7nRC2ohY93oZwJpQOBSGsTTZbyG2+TlPFQiA=;
 b=BT/MFflcyNCSN/Dp9lDy0EazX/TpALTxikUjJgmwyMXmjavXoTNY0rNvwkDThJVFqf
 meWpGgcEWeBXzwvZW8p6A8xhKkNzp7FixwCEFlUFRId7rnj8l/B4qGZfQoi8t1UIfbqS
 aQ/HAnn2TKubycVqcKkbbpYO1tSf+RBrY2LE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700819546; x=1701424346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lPiBn2j7nRC2ohY93oZwJpQOBSGsTTZbyG2+TlPFQiA=;
 b=sajlt1u4jL98OP/4jtihqTEDWzIl1g8MY8QYHzeJ7Vp1gPDClQFZvUV7lkkZTfknuo
 5hPqHtm8WCsPR9cmdcY1w9nFkkLpYRWeJDrBerU24aPHg+mMI4xbpEIr7mjLT/7jyL/a
 NKw6ZqFerGZ/IqM/ZPrG+wodVwa3BcxYBxrjIAe7L+G4HR2Dm9R1Eq2/wrt5ybUsU+Lp
 eCA7H7auJd1iczFqHSOWPwaeVt6rdsILufjFqwaX8AQRy34V7ZI2Zsmfss+oQTrUaxtu
 XzbG9XoOEttpt/otSqcXtxaTVcoyraOGQf+ZhOvJ+1N8ekyxTNB46x7IAeEdXDFdARgj
 4Uqg==
X-Gm-Message-State: AOJu0Yx0Jn0ErEO1f3S3kjEGTvWBgmRzKCSIFgCE6tpsvQtfy2aomUv1
 mVCVTiqlvxe3wpSSCiZFGH9odw==
X-Google-Smtp-Source: AGHT+IEBfhEmsD5EKPJl+/lEhxi4nG9SttIahQn1yPMeWAXJB+1krEHdfcyXCHFNF8KJVIk8quJgcQ==
X-Received: by 2002:a50:d745:0:b0:543:5741:c9cd with SMTP id
 i5-20020a50d745000000b005435741c9cdmr1359620edj.34.1700819546366; 
 Fri, 24 Nov 2023 01:52:26 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:7c18:b9c9:f303:f6bb])
 by smtp.gmail.com with ESMTPSA id
 i7-20020aa7c9c7000000b0054855988fedsm1588384edt.37.2023.11.24.01.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 01:52:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: mmp: Fix typo in code comment
Date: Fri, 24 Nov 2023 10:52:11 +0100
Message-ID: <20231124095221.659445-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Zhou Zhu <zzhu3@marvell.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/singals/signals/

Fixes: 641b4b1b6a7c ("video: mmpdisp: add spi port in display controller")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/mmp/hw/mmp_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_spi.c b/drivers/video/fbdev/mmp/hw/mmp_spi.c
index 16401eb95c6c..64e34b7e739e 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_spi.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_spi.c
@@ -91,7 +91,7 @@ static int lcd_spi_setup(struct spi_device *spi)
 	writel(tmp, reg_base + LCD_SPU_SPI_CTRL);
 
 	/*
-	 * After set mode it need a time to pull up the spi singals,
+	 * After set mode it need a time to pull up the spi signals,
 	 * or it would cause the wrong waveform when send spi command,
 	 * especially on pxa910h
 	 */
-- 
2.42.0

