Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4638AD65
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC60896A5;
	Thu, 20 May 2021 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE3F6F40C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:02:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4930865wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=yVNkE6LMgKRrm9L0PXzODtlbyrkJccI6tBlQKP5YfbFApvsFNWrsZlQrQUFfUwvQcH
 O89HKrq3dcoAIZ3K/9+IBkK5k8wTEwbsLnZbG4BGSXV8MjBRV36AU5mBa6tXbSB4TsOX
 Sink0gYtfRxJ5amdGUYoTJTqpdBFZ1A1RaJBuErq62rN+wWD6KPiOkK9SSTiBM3T6+yb
 pPUn+fvRnwU/0QN4Bg6/AcKQMBGBh797AmO2z6uXHyghSAG3BEA19YG1XX3sgCUH9rrV
 /lNhbYEunHaq4jQtRtzIwjb3olvNWsqGcTSWxf59i6Ef+ZnlVM1y73ZPKeWdGeMABZPV
 fTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71fOhHlO0apSNak4OgEIaxdLa+/aWkYj9kGsKGdRvTY=;
 b=gZM1VonPy+s/8x5LlgBVx0pxdf22eh8/RBZjFbbtEFQZ6tpNk1A+vjC791GZCiVk/n
 WOUnrFxG3zlgVcmkQ7zCYKKc4xYZVmQtxXyNCHin/I10LzMChLJD0nGSeOLlNBViIjlz
 NrGUfkoLWX/pXe+ccUm7WQtARHpiUbqVW5vARNrT7Lp9bRiN2Z2iGtx1B1MBIy08mvTj
 KCz4aI/fFfGGXSd8rIPgJBzL4JaqVEySN1zJijOoRyMIg3gect0Gpo2YaxYPWKX/cFjI
 dgQlO9qiWCUz1G3UjRf97CNIBbbwtpbyzOhu6dZO7+bNp9ujcw0ge3K8DuvWEAzLdGxd
 IkOw==
X-Gm-Message-State: AOAM5304aae7olIkH2WcZuX+1A5tl/H/DUfy1J2pLYtQ0dqnXNBQlO/P
 NUl2O5LECDU2jwrEmuu45NdBuQ==
X-Google-Smtp-Source: ABdhPJzL+TBqXQbBCqdO0J1TpltSMujA87+5MzgL9bvbaSIHTDzj0jzbKDSNOe+5REQBbMAiOcQ72w==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr3760475wmc.168.1621512177173; 
 Thu, 20 May 2021 05:02:57 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/38] drm/mediatek/mtk_disp_rdma: Strip and demote
 non-conformant kernel-doc header
Date: Thu, 20 May 2021 13:02:15 +0100
Message-Id: <20210520120248.3464013-6-lee.jones@linaro.org>
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

