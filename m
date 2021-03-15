Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78A533B2E2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 13:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E27889E5B;
	Mon, 15 Mar 2021 12:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159B689E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:38:39 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id n24so1234120qkh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hfJ2mcnedAuoCPGnCigfDBVs2yE81H3+JZ+ikvdjKLk=;
 b=c3wb342Z6iaNxa4433DAd7xIHli/ot08J5fExvAaRNMrvdumyFTUZWHUyMH9kJ/T8L
 hqjK9LHtIsCpcJsmiRK+gKnyshVdiK+id6h7jZrGfPD5mgX/rr7iDYnb68DU6n2lbAEU
 yTnYHY5/Ld+Z7DIsT9m/LUvoarR06a6iN8rkLMtcdiaaShTThFWQdQpMkhgvfGQ6nJ6H
 P5StY5nafik2xFgIaEUXZc7vAqO3Txx8TTYDpRFn2FdtE5yL8+OgeFLo9mgwX5/nD2xT
 Wn7B1UXERYYs4RdNpVxYHYSBInN8IEWQYO068ilMbltVrPKhJWyrEpeOUu12XlDha0Gk
 Ys9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hfJ2mcnedAuoCPGnCigfDBVs2yE81H3+JZ+ikvdjKLk=;
 b=WcTH/2drkk158FEVSrMTiXA3QiWEBY/IMp76uZAurE9r92vpyMhfzZIIeC5pwvX1yC
 aO4JJtqOOqHLYl9F/pIAr2FZ7cx6sTDjnjJxB1iaC9C0elfoery8UvKD0ewnOkS5FpwJ
 lqZwanxWHVSw9JXALahwivFOB6mTkqwE85K6iFWPjmbcIbIgP63NnXgL495Zx50oLyWW
 L1leD41EUic92O7ww+5FxWx5AkG7PpQuHvf7KZ58/YW8/2QVX0hheWn/RD3n8odk3ike
 g67H3DrZxHYGnwLOb3kSGxrNWjHR8gGboORM3cMjjiwvshANfRmB4og1xfEJrToQSqmO
 PXeA==
X-Gm-Message-State: AOAM532DGUIAGOiaXGn7mStXVGm+0acUHiofCAK68+fBinMFan5DZZ1C
 khAFobzxov/quPEHxGjkzfY=
X-Google-Smtp-Source: ABdhPJz4dooEIQ85L2J2fDnPmygM1sZi/b4SkKAJZj4R95PRJCjDGvnIK0ruQzfpDhGyk6ZVucLg2A==
X-Received: by 2002:a37:6491:: with SMTP id
 y139mr24896423qkb.483.1615811918145; 
 Mon, 15 Mar 2021 05:38:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:d9cd:fba7:d537:4be3])
 by smtp.gmail.com with ESMTPSA id
 h8sm12429893qkk.116.2021.03.15.05.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 05:38:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: l.stach@pengutronix.de
Subject: [PATCH] drm/imx/dcss: Use device_get_match_data()
Date: Mon, 15 Mar 2021 09:38:11 -0300
Message-Id: <20210315123811.159205-1-festevam@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The retrieval of driver data can be a bit simplified by using
device_get_match_data(), so switch to it.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index c849533ca83e..de0f02de94c4 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -168,13 +168,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 	int ret;
 	struct resource *res;
 	struct dcss_dev *dcss;
-	const struct dcss_type_data *devtype;
-
-	devtype = of_device_get_match_data(dev);
-	if (!devtype) {
-		dev_err(dev, "no device match found\n");
-		return ERR_PTR(-ENODEV);
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -187,7 +180,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-ENOMEM);
 
 	dcss->dev = dev;
-	dcss->devtype = devtype;
+	dcss->devtype = device_get_match_data(dev);
 	dcss->hdmi_output = hdmi_output;
 
 	ret = dcss_clks_init(dcss);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
