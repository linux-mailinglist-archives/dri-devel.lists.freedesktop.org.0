Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B188D362299
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07B66EC0F;
	Fri, 16 Apr 2021 14:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF636EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:13 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id d21so12454016edv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/J6GwXeDyu6BFCOqdnjyM+gc8J2+w9Z9RwZ5xPgtm+s=;
 b=Q3vDrMvdLvGZIwxQufcM4ObRDx1q/WwhSRnb8Nni/u1IMyeQoijNkIN4BYPVyYvvT6
 /d2kp/zGgNL4i6WogCZhbQAsxU65ZQf0NFwbktiqhs4jT5qsfNLrV1K2UPY+cYk5/V3M
 XVrZeEroUAorEs8+4tHS6ZR/z+7PEBUSIi98XEgp2F8Yyp7XZbEn0ZZRCffdMSZcmORh
 hRXm2eliqwK2RzS7LJBm7RRY3JSpby9cx17daB9HzLiMMQyrTt1SInsWK3wraCZJ4tC4
 dIFEHd8x7WDxe5ft26oGQAsVj4rST6nYZeFhajLg5Y1yOHHwGva8v98HGJHotVerp8mB
 2mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/J6GwXeDyu6BFCOqdnjyM+gc8J2+w9Z9RwZ5xPgtm+s=;
 b=XKz0VOKR9KUtkResU483g9nIuHfQPvE3tJwf1nInZhtXgv8MYbBeye9qOj6oB9Z/79
 mujF/PstChkw0vqC46usAtmfcF+Lh6slPMk9dOSqR+8g83i8SnS+QOJUFELrEAmKAQ3J
 l7pSmqr9xI62MfXL6c+Wzxjqq5ETZBGmHhq9cvKR6Xhbn42mje1DzLJIjD44s5cAQBKv
 EE1UQRslqriCXjBB1zWMz0Bj8uTAgAFNgb4UmNnB+IaCU/41dNfnxO/3YYkIZ6jNcNyi
 ZmvBQ0Wxxh+58FYqItGtVrXVLZAzYBWWuP9IPPIycVL07v59KGzqMD3xcj/9yPIrQLDD
 IXoA==
X-Gm-Message-State: AOAM531KWhJOrfQQzxBHVgebSdCOC6Bidh78Yy3tONyZxDUZSb1TkKnc
 ASoLlx6Hj+3931z8JRPJiAarwg==
X-Google-Smtp-Source: ABdhPJwD6mZ3l1v7npdR3R06Fu1vIMDRzVQSJrKew9+6JJdz0z3JBBQ7KHxq+ICMPQfnZUPlojP/Ag==
X-Received: by 2002:a50:9b12:: with SMTP id o18mr10609284edi.376.1618583892423; 
 Fri, 16 Apr 2021 07:38:12 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/mediatek/mtk_disp_ccorr: Demote less than
 half-populated struct header
Date: Fri, 16 Apr 2021 15:37:25 +0100
Message-Id: <20210416143725.2769053-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'clk' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'regs' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'data' not described in 'mtk_disp_ccorr'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 141cb36b9c07b..5276909a775fc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -33,7 +33,7 @@ struct mtk_disp_ccorr_data {
 	u32 matrix_bits;
 };
 
-/**
+/*
  * struct mtk_disp_ccorr - DISP_CCORR driver structure
  * @ddp_comp - structure containing type enum and hardware resources
  * @crtc - associated crtc to report irq events to
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
