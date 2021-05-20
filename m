Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A338AD51
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478E76F40F;
	Thu, 20 May 2021 12:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713666F409
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:02:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z17so17369632wrq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=QaDnKQSjqkn4QePQ0kTBrTEKLV+PNzIkhCzxkhxaW35b4yBqqXr3JAf9xItUI0vKWe
 Js3oOcCnYQiz4GqAqe9hxOEemuXQTEDmd/znBNGSK59deuLoC7nthIUoc77gmSCawcJ8
 320dOYQ0xsXbI26zQTnXM/IQwZp1H5ab4Ry+t+x7/JIFfzx3oWi1H39yjMALjl2izvFO
 4LnRKWtHelBgXlRfdi7r8PnDSlhr8TIPOav+gTWfognB4aetD9mqEwjrz3m7b2vMRXCb
 RDe+COrlBT2sTQqzbMwIo/xev3HvQp7tpU4xct1F1FwqKvRwUFm81cxoIs0rIbIlc5gD
 ZNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9bRhyWuFVpQrG3EHXZKnG7o8XLPNhfRhn1oXXk6SrQ=;
 b=W467lQuZgol+Odg8WeDfAAq9uoETjqD7tlJHKAvyzo743y4wsQMO4fU4SrqLuuCjSc
 ih61b1ZhM/4hU+2CtvljRFRBU0g42ph8AXREKo4Cs/dRXco6ULWVDrdw7b0BO1C8iw9m
 2oUNf9EPnFVEWEK7K+llgkdMPhDVDpBxqLAmvdsawuVSACrk5W0DzxR380hsKytc3dpr
 3FeS3a9miuFEznhj2TiwjXg/chzqYYFxK0/0tiAh6UKYVu5F5LhVTlL5KKfYfzAgxvnl
 LZHpPjeXCr+55ss7n3QTFKh/49srdNnw37z38/fv1WeHG/BA3xZzCVpKSHwjovoVk08A
 UKbA==
X-Gm-Message-State: AOAM5309l2Fc78EvkrePggnwM9VoSFq3M2opbGkgSI8sioOdTw3FUgj4
 mcrdc44fI4X83Kef/o3MKLtD6Q==
X-Google-Smtp-Source: ABdhPJzX6gO6eOjIxe2DAvFcz7ewe9ss6bBrbbFuU+mLxlW7zGh+iN0tC3I42VZoxeDplwiMFfSTxQ==
X-Received: by 2002:adf:9cc1:: with SMTP id h1mr3818529wre.135.1621512174148; 
 Thu, 20 May 2021 05:02:54 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/38] drm/mediatek/mtk_disp_gamma: Strip and demote
 non-conformant kernel-doc header
Date: Thu, 20 May 2021 13:02:12 +0100
Message-Id: <20210520120248.3464013-3-lee.jones@linaro.org>
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

 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'clk' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'regs' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_gamma'
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:42: warning: Function parameter or member 'data' not described in 'mtk_disp_gamma'

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
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 3ebf91e0ab412..3a5815ab40795 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -29,10 +29,8 @@ struct mtk_disp_gamma_data {
 	bool has_dither;
 };
 
-/**
+/*
  * struct mtk_disp_gamma - DISP_GAMMA driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
  */
 struct mtk_disp_gamma {
 	struct clk *clk;
-- 
2.31.1

