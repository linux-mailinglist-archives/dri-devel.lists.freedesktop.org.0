Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D10A32F2D6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793576EC17;
	Fri,  5 Mar 2021 18:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7EC6EC12
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p8so5365174ejb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cnQkxEWf1/jtkQDwhzC/RNRYSHdN3zniN7xfiNIEH/g=;
 b=LMLFVrOEGn51sRs8V4YMad2+cDt8RA5s41ALA7xZSTNor06qKOThJTA6rFiLoRwATp
 XWD7BJajOkvb4kY5oOTptSr7TaVnRX+PAlwFdEHD5g61idaFed63kHbZvQg+SQDhoV1p
 C/Oo3OBDLNvRunWjxGXCcht8xhEEgEnqa2M1825Jy8MKmXr16MB2UMp+huaFlyJ2SLS2
 YdLgXfCFnvkdeslqO3IpOK5LxddG9BLMWmeJpiOhLn/K/gTUp35x1ov3LaBeapdjATe+
 TK3HzPDRHGDT7tdW6er0Y2+U5n66XXhteyyhZR9B68tcak74v3SvC6Npoj5oGzzyXYx0
 XF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cnQkxEWf1/jtkQDwhzC/RNRYSHdN3zniN7xfiNIEH/g=;
 b=LRJI2E+38OdUBAeRx0mPod2vtBsDifuFmSX1mxyLgcv3lSnHyIH+GseRpT5GL5Gx6z
 aULmp4HqSPA3vDdzrpQbQpw2o17vLTy4ZFKi7upS3l5uE/C1IKu5peJX6HjhTqIAEAMA
 KqZTkeSey77KeNFw7fjIohHd10mfjQ08tKU8UTRVtMYrEJOhqmyaNBcgQSN6hQWUM7Mp
 W80AqeCfIV4chuYZOUhUhFvxwrA2vWjXHJR/rny5RJgfQi655TdxXGwpDSBIi9kfnH8B
 wj3/2XipAxDzdTSmv1ldT3CJvrbdzL5zKtBG2Ue4ZT8gI6xXDPJKvLnncM0kEOhi0Kfx
 KJ1A==
X-Gm-Message-State: AOAM532JJVlLYmK7FuytWlKRRDgjQMqjYe3j1zSomZLkdRTLAl8vQtWr
 KVZNTTyPWz40OQGdU4qpn31mfBl1LrQMgw==
X-Google-Smtp-Source: ABdhPJzBaLPRZpXtKABYaswg2O212z146iHBthxlDQutr5KFQDi3h3XyDO9t51biut3VAu6DCsFcig==
X-Received: by 2002:a17:907:9e6:: with SMTP id
 ce6mr3468949ejc.207.1614969580342; 
 Fri, 05 Mar 2021 10:39:40 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:39 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] media: hantro: imx: remove unused include
Date: Fri,  5 Mar 2021 18:39:21 +0000
Message-Id: <20210305183924.1754026-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

The current imx8 code does not use the jpeg encoder. Remove the
unnecessary include.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index cb1ac02c03d2..f36c1bd681ba 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 
 #include "hantro.h"
-#include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
