Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E758E74D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 08:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB06EC7DE;
	Wed, 10 Aug 2022 06:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889D1EC790
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 06:27:43 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id x10so13401948plb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 23:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=w3X0TNwIHEnmkrIi/61rzLTGCwsTjlgUHLRtNos7mM8=;
 b=JvNwjggQwyvVv997U6qb1hO/0r2tgSFQeYlBvH/Htc5wgc2WJ9f4ouc11x4MZt345K
 oGIvnMC96oDN1fsX2sSomyVaAjgcJcoKbg2CdGKjBhv3fZUgNe4Q8ueJnopDCeY65mXK
 OC/0cGgEeOuJXMMIElTpIDxhWLoUcYqjahBeoJRlhLslA42bV+zvvpwt+InyRSRFdqN9
 yrelFQl59I8TO5tBTzRt9mKCUKv7l3B2Z5F8aGhbhJGcksZpaAdhjINGdKrbp3KuPj8D
 HMI4wzob/88OEOyVf4PeSjWSLQj38clC0hWeuTV6YOnlewt3yjbzdpqQTR52nwn5HZj1
 yHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=w3X0TNwIHEnmkrIi/61rzLTGCwsTjlgUHLRtNos7mM8=;
 b=xIU2zRjUhIkPe3/JLrvEtmTgz57JXCoPgwXQotsExLCgzHd5cqV328zAEYDCFihLjX
 sbpJtVl9vP3RN3vFnCNw/3XRzI0nPARNtZBRwxr190SqPp6Hh8uQYf8dxFiTvhBznCi0
 cAPkRgiBW+2XnwSW3uIkI1I/rRM14xUMcxvHYvK3SC9BAXHR6mh7AybAGTqxbfmYDuxU
 UFqyWQrX/tYVRvF4hu2CCNclaYx/kddsAbA9fKe5LB+NDVCuk5sZZ4SJGjsT+0DXwa/B
 mX8GV1fMfopnlFJKCfcO/ap/D003NTr29/dybwidS/YaQ965W4iZzi534Twd+PDCQCI/
 9pTw==
X-Gm-Message-State: ACgBeo1AWdl3vR/rLH9ugsD0iplZcElUjJzd3eCP84n+3ixBA20+QcK7
 wXDbY0LY5FiD/G7MC2UMKS0=
X-Google-Smtp-Source: AA6agR41jMP4GIAOgvjLuzViRK9IpHdxIpD5wouN1Zh4QtykWUrzf/8vSLS887WzzK2C7EwvPIAMIg==
X-Received: by 2002:a17:902:ab0f:b0:16d:b340:bf8f with SMTP id
 ik15-20020a170902ab0f00b0016db340bf8fmr26567524plb.140.1660112862521; 
 Tue, 09 Aug 2022 23:27:42 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170903215200b0016c3affe60esm11832312ple.46.2022.08.09.23.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 23:27:42 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: tomba@kernel.org
Subject: [PATCH linux-next] drm/omap: dmm_tiler:Remove the print function
 dev_err()
Date: Wed, 10 Aug 2022 06:27:38 +0000
Message-Id: <20220810062738.13554-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

From the coccinelle check:

./drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
Error:line 817 is redundant because platform_get_irq() already prints an
error

So,remove the unnecessary print function dev_err()

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index ac869acf80ea..61a27dd7392e 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -813,10 +813,8 @@ static int omap_dmm_probe(struct platform_device *dev)
 	}
 
 	omap_dmm->irq = platform_get_irq(dev, 0);
-	if (omap_dmm->irq < 0) {
-		dev_err(&dev->dev, "failed to get IRQ resource\n");
+	if (omap_dmm->irq < 0)
 		goto fail;
-	}
 
 	omap_dmm->dev = &dev->dev;
 
-- 
2.25.1
