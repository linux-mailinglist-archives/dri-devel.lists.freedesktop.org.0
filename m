Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314E218040
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1E76E866;
	Wed,  8 Jul 2020 07:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8250F6E037
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:29:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o13so17278223pgf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cLpFT30Q2wrhHA54qttjA8gJomi+1hYn+159UrQoFZg=;
 b=DEpuudm/4MZv5D+pBETCrXPAcc5pEq0Tn39PHv9h9s9yiek57l85H6pNwvnRrWvFIo
 9ETSoqtWaU/K2OdoBf/cI0ocSqzRNPjdM02muLHprNvlvZnEwsCfzkM5X73rdsGBUO7M
 cM8cM/FYdZRpKjdEZ29mQv+2wRZ9z5V0wjUt4dLbU4+CGeyem9Ywjp41F8pJSLxhpAdi
 foh8zI+7+6gJOjtVf5PUOIzDQDynN6GX5wgUzIwu2qFpLQIqGPrIoLZuKBZts1XorBx5
 gIF/1D5di/wOJTKghjE4Ftdf1HVm7rxJV5zuvOKEA1uF1kP5HyxtGzKV1QF8FD/nC+xt
 d2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cLpFT30Q2wrhHA54qttjA8gJomi+1hYn+159UrQoFZg=;
 b=Razdfhh/s9NIdv6GNZkycF00GokMmPXlnoU84RCiro4ZuryrXNPyJSA/Lw9oQOmBm2
 v25/PDgdutUWYUOkOYdzTWjYy9jhVblFDIb7aSKI1fF3BdepJHOq8MGoMzRSjyKr/J0W
 3rjuMxPH+gO2JaUEtdcVv6HGotT2T6GyIC8AzmzXCtPee/Sj1XI+5HYQ30oWO1phJcgY
 gJwcck038jJyRKVEGb8kU47lxM//wVvoYjXA5bHg5cTvgUiWVm+AZ9ycSwbU2qkWrNzw
 nWPREV7QHpsb+MCnmH4hQS7UBSEjLj/5hHtCQcutLM2RLoS7S4KJQS9xvt+cvMVON7Il
 AG/g==
X-Gm-Message-State: AOAM533JugD+hRKrn7FcLrnYJP8ntMQuCr5yGih+S0s2xrNux95W5EhH
 ZtZ0WX5Na/A2nmXhto2Wi1JnqpgynZE=
X-Google-Smtp-Source: ABdhPJx3mJownrF7Uccn5h8F/aE8m3prj8aLp/p7HCftX8fEe/IpDWUoMZCFHCqPz8CQluKsVZQRDA==
X-Received: by 2002:a63:ea02:: with SMTP id c2mr45591701pgi.66.1594139341076; 
 Tue, 07 Jul 2020 09:29:01 -0700 (PDT)
Received: from blackclown ([103.88.82.137])
 by smtp.gmail.com with ESMTPSA id q7sm23610785pfn.23.2020.07.07.09.28.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 09:29:00 -0700 (PDT)
Date: Tue, 7 Jul 2020 21:58:48 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: srrj.967@gmail.com
Subject: [PATCH 1/4] drm: mipi-dsi: Convert logging to drm_* functions.
Message-ID: <feeec2816debcf4105ac22af1661fd2d491d02b9.1594136880.git.usuraj35@gmail.com>
References: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1594136880.git.usuraj35@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert logging errors from dev_err() to drm_err().

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 07102d8da58f..5dd475e82995 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_dsc.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 /**
@@ -155,19 +156,18 @@ static int mipi_dsi_device_add(struct mipi_dsi_device *dsi)
 static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 {
-	struct device *dev = host->dev;
 	struct mipi_dsi_device_info info = { };
 	int ret;
 	u32 reg;
 
 	if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
-		dev_err(dev, "modalias failure on %pOF\n", node);
+		drm_err(host, "modalias failure on %pOF\n", node);
 		return ERR_PTR(-EINVAL);
 	}
 
 	ret = of_property_read_u32(node, "reg", &reg);
 	if (ret) {
-		dev_err(dev, "device node %pOF has no valid reg property: %d\n",
+		drm_err(host, "device node %pOF has no valid reg property: %d\n",
 			node, ret);
 		return ERR_PTR(-EINVAL);
 	}
@@ -202,22 +202,21 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 			      const struct mipi_dsi_device_info *info)
 {
 	struct mipi_dsi_device *dsi;
-	struct device *dev = host->dev;
 	int ret;
 
 	if (!info) {
-		dev_err(dev, "invalid mipi_dsi_device_info pointer\n");
+		drm_err(host, "invalid mipi_dsi_device_info pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	if (info->channel > 3) {
-		dev_err(dev, "invalid virtual channel: %u\n", info->channel);
+		drm_err(host, "invalid virtual channel: %u\n", info->channel);
 		return ERR_PTR(-EINVAL);
 	}
 
 	dsi = mipi_dsi_device_alloc(host);
 	if (IS_ERR(dsi)) {
-		dev_err(dev, "failed to allocate DSI device %ld\n",
+		drm_err(host, "failed to allocate DSI device %ld\n",
 			PTR_ERR(dsi));
 		return dsi;
 	}
@@ -228,7 +227,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 
 	ret = mipi_dsi_device_add(dsi);
 	if (ret) {
-		dev_err(dev, "failed to add DSI device %d\n", ret);
+		drm_err(host, "failed to add DSI device %d\n", ret);
 		kfree(dsi);
 		return ERR_PTR(ret);
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
