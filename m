Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01576735C82
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0210E22B;
	Mon, 19 Jun 2023 16:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6A10E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:55:58 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-76391e63725so119154685a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193757; x=1689785757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnZNU/I8hVx/txQg+gZcbNdILNkL1d9QJiWI/0DW9wI=;
 b=FZytthrbCYDv3RZOtaTdlEZCVgoapIc+1yj309YHwRqE+CagPIrZRG0F4niNuuyc3M
 wLe5zF+7iiwSyXRnaT6Y7CPeQqeymyE9pCTfaXwRIDGwIf5wx1u+z2L4eWJQ3cpboG1I
 Ho3OM31KAsV2ZJtI2AE5AiRcYIozPpNICyWts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193757; x=1689785757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnZNU/I8hVx/txQg+gZcbNdILNkL1d9QJiWI/0DW9wI=;
 b=RFchxHOsrtyJUVTJEguHREGBrghBe31MacjcD8nBJHpDg4y/2xKGmBy8Dh3RAeljzl
 tNR/QgAHk8tBR55/Nmy0FKzt3TXvvBURa4tYcdM0sZ4dFF+asXw9Uo+VSUOBaC5N02nJ
 cuSs6/UW1UXHoWTCI3rl6xbh9ipaEIyVy4QjrpWtC32aK3gcI1t0bCOscETUWP1PivzD
 08BYN0caF0O3RTZoSg4uh6LQHcSS88yoljmbnS+zhHfoiED0LMYpizQrNRNb+gQvY9oB
 rQ+kBbay2O3fDC2epKEalyLZBH1i+85X8BrDwwquf865+2eJU9eC0SqSGjCU1/lU+8ck
 uHow==
X-Gm-Message-State: AC+VfDxtLfgR2vi+1jttbiqXMXmfWvnuntTL0JxuNG5Sw6e9oDSav/7f
 4xkT9WaMdqiKHyC7HP2ns864Zg==
X-Google-Smtp-Source: ACHHUZ4seV5vQMD1B3+dqGuDxNBwJBs85xEpHLWIbXaIhwEvDfAjEJU/sT7OAfJwkc2qH0vO0JafgQ==
X-Received: by 2002:a05:620a:4397:b0:762:39c:7fb3 with SMTP id
 a23-20020a05620a439700b00762039c7fb3mr11634709qkp.60.1687193757326; 
 Mon, 19 Jun 2023 09:55:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] drm/stm: set framebuffer bit depth through DTS property
Date: Mon, 19 Jun 2023 18:55:25 +0200
Message-Id: <20230619165525.1035243-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@foss.st.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch, which is backwards compatible, sets the bit depth of the
framebuffer using the optional property 'st,fb-bpp' in the DTS.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Use DTS property instead of module parameter to set the framebuffer bit depth.

Changes in v3:
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

 drivers/gpu/drm/stm/drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 422220df7d8c..7a61a3c63469 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -180,7 +180,9 @@ static const struct dev_pm_ops drv_pm_ops = {
 static int stm_drm_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = pdev->dev.of_node;
 	struct drm_device *ddev;
+	u32 fb_bpp = 16;
 	int ret;
 
 	DRM_DEBUG("%s\n", __func__);
@@ -203,7 +205,9 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put;
 
-	drm_fbdev_dma_setup(ddev, 16);
+	of_property_read_u32(np, "st,fb-bpp", &fb_bpp);
+
+	drm_fbdev_dma_setup(ddev, fb_bpp);
 
 	return 0;
 
-- 
2.32.0

