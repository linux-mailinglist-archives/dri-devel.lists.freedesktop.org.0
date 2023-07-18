Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A426675763E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD90010E2E8;
	Tue, 18 Jul 2023 08:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824510E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:11:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so8857623e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689667878; x=1692259878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HpSa3JuGu2F5rDkHmeBs8MJOc0K66x3Zvji8Ik/U/dU=;
 b=luKqgmR6miKDMTlzg9Q2mfg05kLQVXqLLBIjOFAOZiqm/QFsGNS7EihK1lq6wdpGWK
 rN8dc7CyYvzwroWLp6nOzy68lFyoRSWA+IALFI/K0LTISsud6I4u5w4O4l6rPiIMxX4g
 ytol2K7xSb2FpFwt0fiariP4YYLdGarplXSD4pYyoirOO8FpxNzn6WfHJm9iTdQvHZXC
 ri0Qbm4chtUws3WnZzaacn0akPcMS6RW8JHvzq8ccsntzStBwGiH4/bsgvPhxiPQAc3f
 GJh4ipwqlcsVErqM1phGfJd1o7dOQdQJOz+iSYmmfCh6VYaUPZcOEF95E8+h/OMlU369
 wCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689667878; x=1692259878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpSa3JuGu2F5rDkHmeBs8MJOc0K66x3Zvji8Ik/U/dU=;
 b=fwmT2BxnE3VmTWBEk8zAKrgtdBfpHVIhqq9O1CJOAkBDx6MEV3/TLHRkHRzKcHI2b/
 BXySe0RDpULWDREQYM0VjqG2B/zInqWvv2viSpoeMV+l2bReGmcmjD5ChEG/i5RTgumS
 s3+rd3AXqO6cqgeirYStHk9qCInfyXNKowZuRTpVhb7WYHfrDh2RJXxq2Ccq2Afy6K7i
 ErFEtrIxsnzsiWFc9hwQeQ3kXGW2U++5n70Yxm5bcsEcPfRHJ9bpq/oFsqInFhzmVRh+
 u6LMrWEo9QvXxMzxZjBlCqWIrqnBiXkfjOZACvxAtv0L3yjHpOsDVHYnn7bdtuzorQgB
 x6ug==
X-Gm-Message-State: ABy/qLb/7foU5rYI975T0BIvbPSVopvXjq3odaMSEhyzQTkWFrIOZPgI
 hmBKJw9cVTKB7blq9WxUzqk=
X-Google-Smtp-Source: APBJJlHwD5T0hI02QFCRKs9CDtc0FTWE17lYnAwkmOzKvsDjYMJ9puMNcByCKr+Z7+Gf22wp4xWuzA==
X-Received: by 2002:a05:6512:3694:b0:4fb:8dcc:59e5 with SMTP id
 d20-20020a056512369400b004fb8dcc59e5mr1001179lfs.39.1689667877381; 
 Tue, 18 Jul 2023 01:11:17 -0700 (PDT)
Received: from localhost ([37.174.75.194]) by smtp.gmail.com with ESMTPSA id
 g15-20020adff40f000000b00316f9abf073sm1627560wro.82.2023.07.18.01.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 01:11:17 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Date: Tue, 18 Jul 2023 10:14:18 +0200
Message-ID: <20230718081418.28225-1-rgallaispou@gmail.com>
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

