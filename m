Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2127B2B0D3F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DBF6E3EE;
	Thu, 12 Nov 2020 19:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E156E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so7185598wrx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=Kn2ivuqgAsK52Jio64tgCg5gEc3heO8c9beyz/bqFQbf5NkBPLY0+mhmwCJ6UNpA3P
 J4x/Rd3GXHQO/a/7YTp80S3ElfDEZFctAwN1fZKTPz8totTDUrGBrl8p88E9wBEhi+Vj
 2zmyC3n++XMwoLh/RL82lSqhrY7fWGLb6m98Nsc77uAzHP7z86dDHPaXrtRzpLI/SHXV
 fVu3eXDW/AUtoktCjuFoknQPCENGgeS9pTL1Nr/1cP8B8IeH4pRObv232EktleSaFXGo
 GYsnK3HMSXR5k+Gcc5sO0FRKxjZa7Lc2K5sSnN+o7DNgZBGnfLxH4JM1NTZ/nwQxlHgY
 2eJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E894eMua3BcyVtBQpbTegYEGiTjlkwuli5uk69Q3IOw=;
 b=PBbt+mxN4jZSxlVyYTyzaaWqH4qgnCiFxqlB5DY/gZX1UIq6PpPJcFWY0zFq09y4Y2
 UB4id8V/bJOSeZYfmc9NtGXajNudwWk0pcm/DjTr59aJlyMU+f3oUql1JPD8fZJIqFIW
 naAKMC5FRAe5OuO175EMAud/an7rNrpQbZ28t/cNNkGiZZURId8NcrnGYhbBc1VmyzEK
 fvGud6osLBhGJjiC/a/nXwJ4ZPpB1WpcnpfjIZdwMq4xTgCnQ4UEWdPQAzl6tOWZoLrF
 +RafuSoUzeBO4kWVrw1ncCIcYu59Xm8XsZ3geOyokorni3S24tar8NVdlwWHrOrI6g6w
 3Wiw==
X-Gm-Message-State: AOAM531j1vhzyBMnsGhN9ftHtihsfxtRY/+adLxv3RP4Y0mQpVKkCwbs
 ZKJORUNNynHW0vAxLqQQqBQ2C8oYKOCxo1iX
X-Google-Smtp-Source: ABdhPJyC+zO0DY5MHCIJ0bV9ffOxtDjtwGdlvt4SiEuyNxuXTQ+znllAJ+A8SlC5c9Z7ZtrMrG8zIg==
X-Received: by 2002:a5d:6286:: with SMTP id k6mr1118692wru.216.1605207708584; 
 Thu, 12 Nov 2020 11:01:48 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/30] drm/mediatek/mtk_disp_color: Fix formatting and provide
 missing member description
Date: Thu, 12 Nov 2020 19:00:37 +0000
Message-Id: <20201112190039.2785914-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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

 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'crtc' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:40: warning: Function parameter or member 'data' not described in 'mtk_disp_color'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 3ae9c810845bb..a788ff95ed6e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -30,8 +30,9 @@ struct mtk_disp_color_data {
 
 /**
  * struct mtk_disp_color - DISP_COLOR driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report irq events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report irq events to
+ * @data: platform colour driver data
  */
 struct mtk_disp_color {
 	struct mtk_ddp_comp			ddp_comp;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
