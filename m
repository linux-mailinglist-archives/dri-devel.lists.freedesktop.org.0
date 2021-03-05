Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC932F2D5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECC46EC12;
	Fri,  5 Mar 2021 18:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35B56EC12
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id w1so5372363ejf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ay/VePmX2E/QdxtPcN6EVcrY1//aOiSoLhu5+Byfit4=;
 b=a6a3cisX0udcGADfxE4OE2hEwPSsWnQDpdAmXJJc+Vy1RKa3JKLMgmD/eKbNdVfA4A
 StQZOtXuo3QZh1t/6ubhyM3b2+NpyGJ3lhuLQXKGQ8yEKNp51WNB/Q1YUUn28F7LxAZR
 wL7GM/MAGl+djORupYY6CXx/DcB4t6yUj5K6wSnP67wVDe5epFqhSh5Rcn0gLufmrOlT
 NY9Bvw9rZ/oGTblMv60mnLyDaoI9/xks0ECCKT6Xguqzd3cXmirXnFnJ4Lok7+k4G1o/
 dyHvOFKQ/O34Kpj9USKsyRxf7VOIB7+r2cAq5uAKsI7SQI/NDnVFokFQJ2UbVxrrweCl
 PqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ay/VePmX2E/QdxtPcN6EVcrY1//aOiSoLhu5+Byfit4=;
 b=fvBWPKDTmbnBcNCSOaQF8BXBkqKVIRTl0RmDZjG0FFZGhh/hEvq8JK4fL7VF+pPdEK
 gNJZEuAkJeOFBqgcQXit4U1GDqHdy+ggvoY/1yCcTEdsGe2fB+22VG+OHtOS2XKaU2FX
 YKA4nTkZfGdBAHN/ydhbM70Sa+mW9wAAOdv7BZ2xD1huINObWimaCCrHBRUztrnw8cQt
 piXh0kLidEZf1xGn+uMS7gHSaFXdt04OXzmuPr8HZmfn0wVqCu/36x5r2rBk/CHcRObS
 oCwvTZea5rMP99nEZb5P3cWvnJoiALUNKxFbALT7MmecoBWW+Vhw1SsXPuW8sXoYi/FP
 5PgA==
X-Gm-Message-State: AOAM533hmkKecKcyNlijkaSCJ3BF+n7Tm0ioWQTJgIlLGy5wqIplUxKL
 vBI1o7K2JYyW7gCjfrXymZigusAQZvr0Pw==
X-Google-Smtp-Source: ABdhPJwEwactJjc4D3Bx7DICv+mc4VyjqP52lF84bycTxInNNIhN5/8ERDGvF9ftNFCzrlU/cOdTVg==
X-Received: by 2002:a17:906:9243:: with SMTP id
 c3mr3279149ejx.388.1614969579120; 
 Fri, 05 Mar 2021 10:39:39 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:38 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] media: hantro: imx: remove duplicate dec_base init
Date: Fri,  5 Mar 2021 18:39:20 +0000
Message-Id: <20210305183924.1754026-4-emil.l.velikov@gmail.com>
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

The vpu->dec_base is already set by the hantro driver itself.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 1f48c1956cd2..cb1ac02c03d2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -150,7 +150,6 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
-	vpu->dec_base = vpu->reg_bases[0];
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
 
 	return 0;
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
