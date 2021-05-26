Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 571FF391757
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B0E6ECCB;
	Wed, 26 May 2021 12:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098DB6ECCB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 12:30:09 +0000 (UTC)
Received: from mail-ua1-f72.google.com ([209.85.222.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1llsfn-0007wZ-6i
 for dri-devel@lists.freedesktop.org; Wed, 26 May 2021 12:30:07 +0000
Received: by mail-ua1-f72.google.com with SMTP id
 v20-20020ab076940000b029020b0b4ada34so697968uaq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 05:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyXiD7bZ+aLeJtSpo9+C62NB/ifafXwXEggYhSU02ts=;
 b=f1Wl/Ze8DFd7ccUBwApaPyHjClR7AW+29W8Hknq93tKjXJUoTdjp9VSjI9UocMMauj
 0D1441MpX5X/rRa3Yln3SnHfXaCwRHeh68OTdcTWBQSgrAaNMSwd2Gmd3Q/jssC6qlYl
 DXYOoo+7jEUWAEQqGiZBomqmzQLZK10iAzqS9ICe7nLoS3MzWZxlkTudKgjKRbcuV+QP
 7X8a0gQiNn92uGMUGumQvFh9FDiDZ4nNFsq49Fvx9wdG7fyxCylSt2Ln4rZtgyWfLhcW
 wk+wapQwk1qOKTnXOxGLgmuqPVpLRTzXHxTftrVGx7mYYNST++TULpLDvKT9PA5T5BDg
 yhog==
X-Gm-Message-State: AOAM531oAbxuwjkF08gsw1ubKAu4ES2v9PqinkjTtxen1gAz2jfPqPrz
 XOHWEvzrKgqYM8Ed106+M/6c8UWxcDITUt0Ni8T01lXCKKVwf8XxiILEeA3rvY5R10yfzPkzOD4
 6cfdUCoUwT+yLcu0gNwIyfd5WOlEAC6Z8znJ/8DrIlbOatg==
X-Received: by 2002:a05:6102:dc9:: with SMTP id
 e9mr27735417vst.23.1622032206388; 
 Wed, 26 May 2021 05:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5a0h3XvrPTErg+z7PTz43kO0UM0jYM8LbfZF8Q6vQxRY1N4vWH2M2NXdkOSWaVH00NMgMlA==
X-Received: by 2002:a05:6102:dc9:: with SMTP id
 e9mr27735393vst.23.1622032206152; 
 Wed, 26 May 2021 05:30:06 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
 by smtp.gmail.com with ESMTPSA id z8sm435074ual.1.2021.05.26.05.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:30:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/panel: ld9040: reference spi_device_id table
Date: Wed, 26 May 2021 08:30:02 -0400
Message-Id: <20210526123002.12913-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reference the spi_device_id table to silence W=1 warning:

  drivers/gpu/drm/panel/panel-samsung-ld9040.c:377:35:
    warning: ‘ld9040_ids’ defined but not used [-Wunused-const-variable=]

This also would be needed for matching the driver if booted without
CONFIG_OF (although it's not necessarily real case).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index f484147fc3a6..c4b388850a13 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -383,6 +383,7 @@ MODULE_DEVICE_TABLE(spi, ld9040_ids);
 static struct spi_driver ld9040_driver = {
 	.probe = ld9040_probe,
 	.remove = ld9040_remove,
+	.id_table = ld9040_ids,
 	.driver = {
 		.name = "panel-samsung-ld9040",
 		.of_match_table = ld9040_of_match,
-- 
2.27.0

