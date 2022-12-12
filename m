Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F9649A21
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 09:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6109A10E168;
	Mon, 12 Dec 2022 08:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E68D10E15B;
 Mon, 12 Dec 2022 06:14:07 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so14538820pje.5; 
 Sun, 11 Dec 2022 22:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=luc8GZ9v/WzkcjEwI6cWOML4BU0hV8T6C9UT/F80Z4g=;
 b=DHwy13TkPFdGQkYGf29ouxdfwgNIf1tPjx9PHIOeK+Kzk5wrxlmKkscoX21jG39Klf
 WCpNLsdepU4U/udL6LRmMjwPve6/cLncL9UPPhmUVx4tkZq7aULyd3Ju5KkEbQe76lW2
 BvyzWj4/d+oa0MFe55XUZUfeKVdCeAN7A9onM2roVnkJkU9AwbQ5vCyUMvp9cYSTNOsP
 lUVvFAPK+uvEBphDIe470XVSbKx/BPROvFVB1fxrpW57hWW54JZTlezr+/LJTYBDnQ3j
 SEi3U9LEM0SXRerh80dlHiuARjQldD2HXUVbjrYQOfdX5dQ8HabWUEN6uPtvqrWJ12an
 skig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=luc8GZ9v/WzkcjEwI6cWOML4BU0hV8T6C9UT/F80Z4g=;
 b=11zDT71pDnGESZApAcD2ZVnVrLcy+vUleXsICQg6iLo5KUkCXw+DlTsV/GNCUHJLMY
 Wv2CwROd2IjbbGslU2K/MGzq8rjMh04/dKL/YhvFPz8rVpB1S2kZETrG8PRmovC9KNU8
 VgU4oJ84fh/I3faO8wHsn4V3EtpRd/lh9t/Sbg+UtBVfw41s+us3HR3rg4VvnoFqfZiT
 l0CLci5I2rJHqIF65DD5Ug+q4tiTitmPoF6l99uHmr0GpmUn+6RAGi0HmGAxr+UfH9ds
 ug6mmgNu4NfveEn8EF2TkgtCxlJS0YJ+CXMHVSTnmziKVOD+GRcJhtvDpzaqUOasTFd1
 oKdw==
X-Gm-Message-State: ANoB5pnU4ndtJCGDzb9OYPXQ/3rPMau1mMBW2KQ5BiLUevlj58MbbLUZ
 HzYhhHtJj7qpV3in2eu/kLA=
X-Google-Smtp-Source: AA0mqf63lEL0DF67ZC9IfMRBUla30P+fk+wyDNGBsuLtTuC1/KsheeSvqTX3/ikhmZP1kmfj40Uvpg==
X-Received: by 2002:a17:902:8ec1:b0:189:2276:30c5 with SMTP id
 x1-20020a1709028ec100b00189227630c5mr13872426plo.0.1670825646973; 
 Sun, 11 Dec 2022 22:14:06 -0800 (PST)
Received: from localhost.localdomain ([14.5.161.132])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b00189a7fbff33sm5360774plh.170.2022.12.11.22.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 22:14:06 -0800 (PST)
From: Kang Minchul <tegongkang@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/etnaviv: Remove redundant dev_err()
Date: Mon, 12 Dec 2022 15:14:01 +0900
Message-Id: <20221212061401.766122-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Dec 2022 08:36:13 +0000
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
Cc: Kang Minchul <tegongkang@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function dev_err() is redundant because platform_get_irq()
already prints an error.

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
Changes in v2:
  - Removed unnecessary braces.

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b297..6dbe0c45b695 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1770,10 +1770,8 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 	/* Get Interrupt: */
 	gpu->irq = platform_get_irq(pdev, 0);
-	if (gpu->irq < 0) {
-		dev_err(dev, "failed to get irq: %d\n", gpu->irq);
+	if (gpu->irq < 0)
 		return gpu->irq;
-	}
 
 	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
 			       dev_name(gpu->dev), gpu);
-- 
2.34.1

