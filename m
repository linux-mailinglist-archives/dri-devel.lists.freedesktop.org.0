Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41F4B3F2E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 03:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C451C10E119;
	Mon, 14 Feb 2022 02:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE42410E119
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:05:03 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 71so13293510qkf.4
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 18:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aH45NlfdWRTfweoUutUuJvBXViZnbk5RQ/1+2Xcuqxg=;
 b=PeEKjS6mLh0yV+FjsVcrUmmAf98M9Ce7Z+8NDNQ+UmEtnI7mHx3A7T/CULb0a5uxGi
 od82XtsfRt28HryZe67RGewDJr6AtVJ1VxxlzFHm+bAc4A+HL0GcARixvYPdtG7wKBME
 xRb09UXgR0ylwGumT7cMc1SWuN1YfFAdofEWFnEiqLcEkthQGImMD0QO02dkhfUba6In
 O1Uwll6ee1Q2kZiStzg3K/Uee7yncwPyeGNMP9oF7GuXcP4Dinrde5WV5gBhgapzkrO5
 FFAwEf2fk3SlcLDCG3u/ZCZe90Tx/ZwX9o8unwfWL7020xu5hqXPA2QBtOyL/pRsKlVO
 eYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aH45NlfdWRTfweoUutUuJvBXViZnbk5RQ/1+2Xcuqxg=;
 b=iy5gT5YP5gINodSBXABsJWcoTxPCjD/vg3YUBt1kQs8siFMGqV6dcZDI5wGUhKO94o
 56RpU/cXC7wnXzbJvqZ1uAX/Td/MyhQpD6iHhgn1dOkWlvunv5tphXnOEKaXljVXIJln
 FpS54ACfp3q3Q+RuL3idFwEcWSE6/h3fC0j8a3JtT2wMKbbhHa4Qswt0plVETsPAlCim
 PGoA+zr9i1R0Bda24JUlQLovbubyB0v2SAb5tM+mngbquC4yVJD/TkPoab04lmn3i06P
 03LTqp+zQNgfWuezgVy9GX0ChmVbktdey5alEXHYOweXaOmjTuurSRbpuZiHsj73cQ9e
 L0kg==
X-Gm-Message-State: AOAM531RdrLDmy/WdaZ0q6LEtraCjYXTxmqdaiNkipEyE/t/aXan6ybE
 0RWj6BJE/jpctD6WO98knI8=
X-Google-Smtp-Source: ABdhPJwnbbKlb6/+9IP4/B70ReOp8eVtnIAo8INn36B5rGjuPolaQSEqwMy798c1jC/joZUZwXPeyg==
X-Received: by 2002:ae9:e642:: with SMTP id x2mr3160677qkl.29.1644804302805;
 Sun, 13 Feb 2022 18:05:02 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id j19sm12424487qkp.120.2022.02.13.18.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 18:05:02 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: joel@jms.id.au
Subject: [PATCH] drm/aspeed: Use of_device_get_match_data()
Date: Mon, 14 Feb 2022 02:04:54 +0000
Message-Id: <20220214020454.1714560-1-chi.minghao@zte.com.cn>
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
Cc: linux-aspeed@lists.ozlabs.org, airlied@linux.ie,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andrew@aj.id.au,
 "Minghao Chi \(CGEL ZTE\)" <chi.minghao@zte.com.cn>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 65f172807a0d..9fe1983bd9c3 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -132,7 +132,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct device_node *np = pdev->dev.of_node;
 	const struct aspeed_gfx_config *config;
-	const struct of_device_id *match;
 	struct resource *res;
 	int ret;
 
@@ -141,10 +140,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	match = of_match_device(aspeed_gfx_match, &pdev->dev);
-	if (!match)
-		return -EINVAL;
-	config = match->data;
+	config = of_device_get_match_data(&pdev->dev);
 
 	priv->dac_reg = config->dac_reg;
 	priv->vga_scratch_reg = config->vga_scratch_reg;
-- 
2.25.1

