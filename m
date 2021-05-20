Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E4238AD52
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141276F40C;
	Thu, 20 May 2021 12:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6BC6F405
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:02:54 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p7so13652214wru.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=DXAd2Cbmarjx32hRY0bCPUAuvAnlgW3AWRT/xVZNr8kCPXSByJXcsb+WRz3G5GS+pQ
 thEIPZ5g5m6vLshkZQvxmcGaXjvcI4oZhUtocbfMXaVxxNNNPOZLvWzliVMnTrLFje5y
 G5dTLLV2xex/mlTG+UDIVIUV97SCmZ4aTLqOKkYlrDpPyTTtdtmjdUOF3D45cdnog6rR
 Hr2z+K1bhuRkuFpXBZNOKXPUGzEF1Met2wSoYe0w0r5nfkK2GWYjVBM/Xks/ynTXf8/m
 y4eBvtnrSb0ioUWBKUvEYWqIzeaB6yLlLI55MpZUZp31h8lYD0AD8x3UTdQZ8NsXdOdI
 F4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=Vs44x+zLjdVJPKjsaCqfYH60o+0E6VvzRqguXLoEJhRDXrXzy6oDRXCDc/YqgZXBR6
 eW5XyfgqHEBLVpiC1gQ5sqtKHPBEsy/+nouLuK5KZAT8wpabu3wH4//l1HqOtCfyuLeq
 TJFkB6uUXpCG1XJh3X+qSUbVSQLlK0CXEYHVOuVp2vGFydyZzneoUeC4glKcmMOtVIxb
 7XPeRukMpLiSkUjyFOLOAFHai64jShHrPQb3oIS7kpz50uXeol730vU1ySkM15OvHzUt
 VXg5QNAB2XkfJpXpwknhpAKtpbs8QtmwPxPvgZ+1b+/T4K+1+W0Tm9zMI6WYa297PW8b
 vg4w==
X-Gm-Message-State: AOAM530dvjMaCs/AtrgEwWCs19k2nL8x9vK3ces/JkSpc3H8aHYeiGau
 rGFt3ETsTtD2yjMGfAAapmeGKQ==
X-Google-Smtp-Source: ABdhPJzh4BHbXGyx8cGFDsWQ6g9jPqTsOOVJGdjgVjcIBXa/i0FJFZTo8q2m6mCyS360dD9BWrucRA==
X-Received: by 2002:a5d:5382:: with SMTP id d2mr3785609wrv.367.1621512173034; 
 Thu, 20 May 2021 05:02:53 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 01/38] drm/mediatek/mtk_disp_color: Strip incorrect doc and
 demote header
Date: Thu, 20 May 2021 13:02:11 +0100
Message-Id: <20210520120248.3464013-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'clk' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'regs' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_color'

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
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 63f411ab393b7..6f4c80bbc0eb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -30,9 +30,8 @@ struct mtk_disp_color_data {
 	unsigned int color_offset;
 };
 
-/**
+/*
  * struct mtk_disp_color - DISP_COLOR driver structure
- * @ddp_comp: structure containing type enum and hardware resources
  * @crtc: associated crtc to report irq events to
  * @data: platform colour driver data
  */
-- 
2.31.1

