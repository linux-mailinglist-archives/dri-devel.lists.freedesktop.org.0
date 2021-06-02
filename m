Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B7F398CD5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97A86ECB7;
	Wed,  2 Jun 2021 14:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1706ECB5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r13so1454871wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=xUhef00MAVJBy+PY/e3mmGBGxXvIB8iTo9q2dRXzdTl6KgRNOFx3Yh5yZm5G5EDaa4
 MqdznlwSY7+USlsU8c+sFceCBC4jbvyxI1T0bdvESoujA+UP7urnlvjIJSKSVIG9CZpp
 3y1jKPC6xkQRU3IbTX6PaBsEUEQoVuT5KWblMlVi/2luDXltDZnS8VexfxbJrdoQ5jvr
 MXkykFkPCdRogUZ1amrbUundmf8LFslbw3D9ChQKatF0ihn61jSwGhg0tiwejOxV3UCG
 OshO5G93Twyyo8dVe3UVrzg9/ZziR1X4PrgmJqOYNb61iGuhDts2f6VYWZjl2Oh8g5kM
 dFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=Qj6lYPMcno76n6c/U3lgch2nbyWTDNpxj4NuJ2fp80x/327y7KysnMm84qf4dpWRi9
 Bf+1PbhlA5rO1VliXG4ITE1DuzvYTLZNKpQ0LxBCIrhKfAUxuOEIGyZ+GUqaKsw3SaK2
 L5gPFXLJIGIYMjBfIGQEqhS8HCkXfFFW8mbmocY3F5LiopdFuwJ2DpV/be8wv/VZYio6
 LrAzJPNqlwL+69gQ2NeeTofU3nultbZepEk5evxTsbqon+NktarSHWFJs3qZmbbFClzB
 auZOLk/7lMH79YvVQMYwIe9DS6cV4F6oLjllfVhc+Klqvrzq3jzNPngtp7a0z0UwLk0C
 1nzg==
X-Gm-Message-State: AOAM531N/WP4tFGuGqpMrms+7UNMoTl8at/5ny1vz23zz8Q6IhqH0Cfu
 jq/o+ApORvdWNVpdOKx4kKIMcQ==
X-Google-Smtp-Source: ABdhPJzulksV7rbktUjzhrFg74d46BeymCpz5NyUxNhoO0P/xDn9e9UnTwrPNud6bo/oRxePX9B7aA==
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr15311724wmf.143.1622644393843; 
 Wed, 02 Jun 2021 07:33:13 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 04/26] drm/mediatek/mtk_disp_rdma: Strip and demote
 non-conformant kernel-doc header
Date: Wed,  2 Jun 2021 15:32:38 +0100
Message-Id: <20210602143300.2330146-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'clk' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'regs' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'vblank_cb' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'vblank_cb_data' not described in 'mtk_disp_rdma'
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c:72: warning: Function parameter or member 'fifo_size' not described in 'mtk_disp_rdma'

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
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 728aaadfea8cf..705f28ceb4ddd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -55,10 +55,8 @@ struct mtk_disp_rdma_data {
 	unsigned int fifo_size;
 };
 
-/**
+/*
  * struct mtk_disp_rdma - DISP_RDMA driver structure
- * @ddp_comp: structure containing type enum and hardware resources
- * @crtc: associated crtc to report irq events to
  * @data: local driver data
  */
 struct mtk_disp_rdma {
-- 
2.31.1

