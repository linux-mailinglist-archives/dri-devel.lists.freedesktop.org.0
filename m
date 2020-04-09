Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DEC1A2CFA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 02:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF796EB1A;
	Thu,  9 Apr 2020 00:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7366EB1A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 00:43:11 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay1so3210548plb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 17:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=VJUF1SB/P+2GwzxWVksYTgRtuu1H7WnENANWehljizI=;
 b=Kc/5ZrJZnJkC11ySxO/gJzQyEAk6OPdFPfkF5ZgjaSuNGTjG7wB+ioLu7Qvf6mKKzO
 5tdTKmtw/7Z/YzkiO+vW2qRM442A9cvZP4QroD8pq5Ur8UHI0Pm57r/UYuDzAx+Xn+0P
 lSim0dvF+QHWkMATuiS52pgYsBOsZDI8da5GR0Kn7cRz3H4mr9eKl0DHGv8QFoYAnUPM
 +zgPbYzkniSuhrpKQrTfUFofwxNjO9gYoKm3QVHF+FpHuIXqlsCIMXEoSc80arSr2+ue
 EnBiJOJxrnjQbiXgrTm4Br9TUD9/BLP39NAq3LL2oXb7rZJc/6hLFoD2d7flTL/LnRE0
 dmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VJUF1SB/P+2GwzxWVksYTgRtuu1H7WnENANWehljizI=;
 b=BOP4Sg3yxaDTZqMx4xtr+/9pZKgBUhn5cgxg6jYaVh6m6nF4JT9SZmLtknykSm7LoB
 7ae8l1kVRelDDRXOfnp3nhjPIZcw09A7a4M4rjHBv32ewn4qELoIwI9JR9rMJ+GmtL+k
 esVVsIWUxnirppPSyeO9ABRB6FmUWOrj7P/VeZoKGyIjFwP6ZYd0qC3Ud1/6VAFBOag1
 pg3DpYqjObVx+V16qN9m8QYL3IqfKBnWQ6grD4mBPmqsDtc0x0zSf5rN/PLr5BuX0Az0
 TXElvphlkEIFEcmqH1bteuBFmCm3rk+Cepu2EfgPb49e8JHkyhw6eD0p2oNRVkYgo8Xo
 GP6Q==
X-Gm-Message-State: AGi0PuYCZDg5Ml5v9LXdQ2klv18xgod0odF4Tq6VKL2Mxy2t+/9TE24j
 eGMGRRAk13vcJ6u3xCyaztph9g==
X-Google-Smtp-Source: APiQypIFE2K88ws272Mk4HBlN//iOn6YSF2U0g12SuRati06xtmisiTS9XLJL76/Ccgl2aIj49TSJw==
X-Received: by 2002:a17:90a:2e15:: with SMTP id
 q21mr8390108pjd.166.1586392991078; 
 Wed, 08 Apr 2020 17:43:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 d21sm17705783pfo.49.2020.04.08.17.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 17:43:10 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: kirin: Revert change to add register connect helper
 functions
Date: Thu,  9 Apr 2020 00:43:06 +0000
Message-Id: <20200409004306.18541-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel noted[1] that commit d606dc9a6323 ("drm: kirin: Add
register connect helper functions in drm init") was unnecessary
and incorrect, as drm_dev_register does register connectors for
us.

Thus, this patch reverts the change as suggested by Daniel.

[1]: https://lore.kernel.org/lkml/CAKMK7uHr5U-pPsxdQ4MpfK5v8iLjphDFug_3VTiUAf06nhS=yQ@mail.gmail.com/

Cc: Xu YiPing <xuyiping@hisilicon.com>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  1 -
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   | 43 -------------------
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.h   |  1 -
 3 files changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 86000127d4ee..c339e632522a 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -940,7 +940,6 @@ static struct drm_driver ade_driver = {
 };
 
 struct kirin_drm_data ade_driver_data = {
-	.register_connects = false,
 	.num_planes = ADE_CH_NUM,
 	.prim_plane = ADE_CH1,
 	.channel_formats = channel_formats,
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index d3145ae877d7..4349da3e2379 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -219,40 +219,6 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
 	return 0;
 }
 
-static int kirin_drm_connectors_register(struct drm_device *dev)
-{
-	struct drm_connector *connector;
-	struct drm_connector *failed_connector;
-	struct drm_connector_list_iter conn_iter;
-	int ret;
-
-	mutex_lock(&dev->mode_config.mutex);
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		ret = drm_connector_register(connector);
-		if (ret) {
-			failed_connector = connector;
-			goto err;
-		}
-	}
-	drm_connector_list_iter_end(&conn_iter);
-	mutex_unlock(&dev->mode_config.mutex);
-
-	return 0;
-
-err:
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		if (failed_connector == connector)
-			break;
-		drm_connector_unregister(connector);
-	}
-	drm_connector_list_iter_end(&conn_iter);
-	mutex_unlock(&dev->mode_config.mutex);
-
-	return ret;
-}
-
 static int kirin_drm_bind(struct device *dev)
 {
 	struct kirin_drm_data *driver_data;
@@ -279,17 +245,8 @@ static int kirin_drm_bind(struct device *dev)
 
 	drm_fbdev_generic_setup(drm_dev, 32);
 
-	/* connectors should be registered after drm device register */
-	if (driver_data->register_connects) {
-		ret = kirin_drm_connectors_register(drm_dev);
-		if (ret)
-			goto err_drm_dev_unregister;
-	}
-
 	return 0;
 
-err_drm_dev_unregister:
-	drm_dev_unregister(drm_dev);
 err_kms_cleanup:
 	kirin_drm_kms_cleanup(drm_dev);
 err_drm_dev_put:
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
index 4d5c05a24065..dee8ec2f7f2e 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
@@ -37,7 +37,6 @@ struct kirin_drm_data {
 	u32 channel_formats_cnt;
 	int config_max_width;
 	int config_max_height;
-	bool register_connects;
 	u32 num_planes;
 	u32 prim_plane;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
