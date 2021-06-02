Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F338E398CD2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644286ECB2;
	Wed,  2 Jun 2021 14:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515C46ECB1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 t16-20020a05600c1990b02901a0d45ff03aso372305wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=rgK5J1pf61mbr4gAJvzrqYg1NFOZAHw11rg/bnOxAWpDOqPQgssVwLXQOHcmWyRWNq
 KUrzFMA+dglu4oU0dzeEzXy07ZCvW94AfH5X5/e9RKxRR1XAH6GP/3krthyYA/J4mmjf
 vHwHDK4gm+XhyqE8mqH4kPw0vuKDs+PsjtWIw3NKpdyomU0wemzWKm7AXlvyA7BuZ4QF
 JYUaq1szJCA4P1XOElhAbD7Xu7IqatvY9Avryr1PqsXDceTGwFE8m+gmpithlNs9iipG
 BuB9solh30GDVOgKfnIPgf3WXRbuzKxO8x9+3kpN7RlC4ipOSTIKGgJe6gEcD6ex0af2
 DN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=Brk0aFFaOV/rerVnAmYUWvvSZSsfcU++PRgktRmrxI16Olb9mp0z7R0CMgI2I0Et94
 Z9XaRKvQCRLR5cGfRhc9kALgw+QH6KpWRu8yHOKHubhALoOtHQNnfwHhejyrRU6g56ef
 dGGyGHRvbQCB8bXYTtQTZcuiKaFPKFAyIxzxUAdn1+xkaCorBbon+jPyoowDL2Xo5sbz
 5V+WdQK8bhsZ9bsW6SZ5btu7brYi93QB1u6VhmUOBLUwZ5kY0mXscf/EhtdLts69gZGX
 JDJsg38PesoP9j4KGOKCUOO+a2Iql1hU3farLeXfU75Oz6gLLB1CTH+5KymsqQhPrqLH
 dd/Q==
X-Gm-Message-State: AOAM530rdohfaIwAmKDyip9UEm3ai9amZJy2OoNZ6VTvC6WvjdycS3+S
 G+I3OoVrx6MqnDFzRsd3iTrCjw==
X-Google-Smtp-Source: ABdhPJxTfX71DJ4tXTep1p96l5vvEGkQLsO5X8QuRsRF+axwSkdMuH163P9OGjrkgu1nDwfjXeuCjg==
X-Received: by 2002:a1c:acc5:: with SMTP id v188mr31827293wme.60.1622644391022; 
 Wed, 02 Jun 2021 07:33:11 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 01/26] drm/mediatek/mtk_disp_color: Strip incorrect doc and
 demote header
Date: Wed,  2 Jun 2021 15:32:35 +0100
Message-Id: <20210602143300.2330146-2-lee.jones@linaro.org>
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

