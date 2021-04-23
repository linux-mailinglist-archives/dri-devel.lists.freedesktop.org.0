Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0D368BAE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 05:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8454D6EB36;
	Fri, 23 Apr 2021 03:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2246D6EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 03:42:57 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso524096pjs.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 20:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgzCopNHGoCj4O3S/7aTjWQg4EKw2Q7WuBQ98y/Dhzk=;
 b=asqmV/Ie4/YiUXsaMIXBsglbP+sd3m1BS0J6xISjim/mzxmroOGKGBIiFrzLiaC0/v
 RqPvY7oKTSwi1MD9lhkv9FDqHtbtXEV3iMonv315h8XBNuMau+FS9U0VPQiHmUkMUxWO
 6Y6sy8hFErBKzTR8auoIXJLbreupjKKHJcEKFMmzTCQcNKsozvXTAkZ2xELgoqNUkIX/
 DW4hBZ22PFqDzAk0Riu78fcotBOtZ0oH2HcpknhDaK4AJhyjEKeFI4XZ2WdUOAO9IPCv
 nwJXXmyl+ZhN76+Wya4WT7KroUuL6xu2YeIBliTsXLhRoMHl25j8TlQrJucrI2GkMgYA
 UG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgzCopNHGoCj4O3S/7aTjWQg4EKw2Q7WuBQ98y/Dhzk=;
 b=ZSI+YuG0dPsbKaCk64dcKFsHv/M5BZODoHyM1+mq67mm+TGGH3LsOKHbvdcHZ+xJke
 e7ZVDp4rXuDQ7n9LbgEo70r3wsyl0YY/GzI4hDWfRbaLvN0qKWn18k+kDzI8ZIO3nqAB
 fhP/XvaNS+FG32CODtRO13bykkZdQffHiSCD+yonhoWWLRj7aBvE9lqDSb2M9a5ZCBnX
 upjq4M6KuexfIGcNosqUexECjBfWrsKuoraMrSTL29kAyoBm/V3NnVGRLnagyCTWp4/j
 46qdgXiVbAdqyQLMZjoRNDAKCKH5d8uUpfUIJnCZ2Ii2yL59iGOY6C20aEPo+2UiFZ9y
 OBEA==
X-Gm-Message-State: AOAM531uvkhZaMc/09ZWiuzx7v6DGT6vpMV2XHKzrOU9oa+pQVxAkIvL
 FuTiECK73thrlNhdH3+1Jlk=
X-Google-Smtp-Source: ABdhPJwV3UCwfUsdE+Vjwv61FcGaA++89VvrXwdYocb2uJ71/siMK3uFbgucYqiVGf/PRk6pC1NIZQ==
X-Received: by 2002:a17:90a:150e:: with SMTP id
 l14mr3516106pja.208.1619149376869; 
 Thu, 22 Apr 2021 20:42:56 -0700 (PDT)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id l22sm6002505pjc.13.2021.04.22.20.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:42:56 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH] SPI: meson-spifc add missed calls to remove function
Date: Fri, 23 Apr 2021 11:42:47 +0800
Message-Id: <20210423034247.992052-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, broonie@kernel.org,
 nick@khadas.com, linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
and we can get stuck when try unload this module

rmmod meson_gx_mmc
...
[  421.108614] Deleting MTD partitions on "spi0.0":
[  424.219862] spi_master spi0: Failed to power device: -13
...
lsmod | grep spi
spi_meson_spifc        16384 -1

Solution: just add spi_master_suspend(master) call

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/spi/spi-meson-spifc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 8eca6f24c..8a97a6dbf 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device *pdev)
 	struct spi_master *master = platform_get_drvdata(pdev);
 	struct meson_spifc *spifc = spi_master_get_devdata(master);
 
+	spi_master_suspend(master);
 	pm_runtime_get_sync(&pdev->dev);
 	clk_disable_unprepare(spifc->clk);
 	pm_runtime_disable(&pdev->dev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
